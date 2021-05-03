<?php

namespace App\Command;

use App\Notification\CommentReviewNotification;
use App\Repository\CommentRepository;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\Notifier\NotifierInterface;

class CommentCleanupCommand extends Command
{
    private CommentRepository $commentRepository;

    protected static $defaultName = 'app:comment:cleanup';
    private NotifierInterface $notifier;

    public function __construct(CommentRepository $commentRepository, NotifierInterface $notifier)
    {
        $this->commentRepository = $commentRepository;

        parent::__construct();
        $this->notifier = $notifier;
    }

    protected function configure(): void
    {
        $this
            ->setDescription('Deletes rejected and spam comments from the database')
            ->addOption('dry-run', null, InputOption::VALUE_NONE, 'Dry run')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $comment = $this->commentRepository->find(3);
        $this->notifier->send(new CommentReviewNotification($comment), ...$this->notifier->getAdminRecipients());
//        $io = new SymfonyStyle($input, $output);
//
//        if ($input->getOption('dry-run')) {
//            $io->note('Dry mode enabled');
//
//            $count = $this->commentRepository->countOldRejected();
//        } else {
//            $count = $this->commentRepository->deleteOldRejected();
//        }
//
//        $io->success(sprintf('Deleted "%d" old rejected/spam comments.', $count));
//
        return 0;
    }
}
