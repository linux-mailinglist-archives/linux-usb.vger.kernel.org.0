Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C292AAAA2
	for <lists+linux-usb@lfdr.de>; Sun,  8 Nov 2020 12:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgKHLEM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Nov 2020 06:04:12 -0500
Received: from avasout06.plus.net ([212.159.14.18]:42636 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbgKHLEK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Nov 2020 06:04:10 -0500
X-Greylist: delayed 451 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Nov 2020 06:04:10 EST
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id biNAk5opOhO4HbiNBkjhQ2; Sun, 08 Nov 2020 10:56:38 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=SPPZqNnH c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=kj9zAlcOel0A:10 a=SbXeIS652ipZBpwof8QA:9 a=CjuIK1q_8ugA:10
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     <linux-usb@vger.kernel.org>
Subject: Issues with LaCie USB3 drive and UAS
Date:   Sun, 8 Nov 2020 10:56:36 -0000
Message-ID: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ada1vb+VkVz6p9XNThaW1KK4PG7Pqw==
Content-Language: en-gb
X-CMAE-Envelope: MS4wfJzeUkCiksrmOHArl4/vqJ+jH7bhJ2xr+I5kKgzBLJ18kPb38CplwFKw7RmwZwcLgDZDWx1bgkj53RTAkUUm5LzFZOEAEATkRWzZVaLQ0qpJifVfg0vs
 evpy7voetEUkqrRgh1aZgZtQwIvYWSpRWr44sBUii05Kw42cMlbFpSM4vLE1Vogby44XdWlY0ahbqQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

LUbuntu 20.04.1

root@charon:/home/amonra# lsusb
Bus 002 Device 006: ID 059f:105f LaCie, Ltd 2Big Quadra USB3

Trying to format the above drive using mkfs.ext4 /dev/sdc2

Initially got a 120s Kernel timeout which I resolved by setting the timeout
to 0

However I got LOTS of message groups in the system log looking like this:

Nov 04 06:18:51 charon kernel: scsi host5: uas_eh_device_reset_handler start
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 uas_zap_pending 0
uas-tag 1 inflight: 
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 CDB: Write Same(10)
41 00 e8 ea 47 fc 00 00 04 00
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#1 uas_zap_pending 0
uas-tag 2 inflight: 
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#1 CDB: Write Same(10)
41 00 e8 e6 48 00 00 ff ff 00
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#2 uas_zap_pending 0
uas-tag 3 inflight: 
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#2 CDB: Write Same(10)
41 00 e8 e9 47 fd 00 ff ff 00
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#3 uas_zap_pending 0
uas-tag 4 inflight: 
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#3 CDB: Write Same(10)
41 00 e8 e8 47 fe 00 ff ff 00
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#4 uas_zap_pending 0
uas-tag 5 inflight: 
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#4 CDB: Write Same(10)
41 00 e8 e7 47 ff 00 ff ff 00
Nov 04 06:18:51 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device
number 6 using xhci_hcd
Nov 04 06:18:51 charon kernel: scsi host5: uas_eh_device_reset_handler
success
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 FAILED Result:
hostbyte=DID_RESET driverbyte=DRIVER_OK
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 CDB: Write Same(10)
41 00 e8 ea 47 fc 00 00 04 00
Nov 04 06:18:51 charon kernel: blk_update_request: I/O error, dev sdc,
sector 3907667964 op 0x9:(WRITE_ZEROES) flags 0x1000800 phys_seg 0 prio
class 0
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#1 FAILED Result:
hostbyte=DID_RESET driverbyte=DRIVER_OK
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#1 CDB: Write Same(10)
41 00 e8 e6 48 00 00 ff ff 00
Nov 04 06:18:51 charon kernel: blk_update_request: I/O error, dev sdc,
sector 3907405824 op 0x9:(WRITE_ZEROES) flags 0x1000000 phys_seg 0 prio
class 0
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#2 FAILED Result:
hostbyte=DID_RESET driverbyte=DRIVER_OK
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#2 CDB: Write Same(10)
41 00 e8 e9 47 fd 00 ff ff 00
Nov 04 06:18:51 charon kernel: blk_update_request: I/O error, dev sdc,
sector 3907602429 op 0x9:(WRITE_ZEROES) flags 0x1000000 phys_seg 0 prio
class 0
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#3 FAILED Result:
hostbyte=DID_RESET driverbyte=DRIVER_OK
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#3 CDB: Write Same(10)
41 00 e8 e8 47 fe 00 ff ff 00
Nov 04 06:18:51 charon kernel: blk_update_request: I/O error, dev sdc,
sector 3907536894 op 0x9:(WRITE_ZEROES) flags 0x1000000 phys_seg 0 prio
class 0
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#4 FAILED Result:
hostbyte=DID_RESET driverbyte=DRIVER_OK
Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#4 CDB: Write Same(10)
41 00 e8 e7 47 ff 00 ff ff 00
Nov 04 06:18:51 charon kernel: blk_update_request: I/O error, dev sdc,
sector 3907471359 op 0x9:(WRITE_ZEROES) flags 0x1000000 phys_seg 0 prio
class 0

and while the command apparently ended cleanly it took a *very long* time
(hours)

root@charon:/home/amonra# mkfs.ext4 /dev/sdc2
mke2fs 1.45.5 (07-Jan-2020)
Creating filesystem with 976701696 4k blocks and 244178944 inodes
Filesystem UUID: f45b0cd6-131a-4a3a-988f-c5a848611445
Superblock backups stored on blocks: 
    32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
    4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 
    102400000, 214990848, 512000000, 550731776, 644972544

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (262144 blocks): done
Writing superblocks and filesystem accounting information: done       

root@charon:/home/amonra# fsck /dev/sdc2
fsck from util-linux 2.34
e2fsck 1.45.5 (07-Jan-2020)
/dev/sdc2: clean, 11/244178944 files, 15615751/976701696 blocks
root@charon:/home/amonra#

I'm not 100% convinced it did ...

If I just attach and mount the drive I get:

Nov 08 10:25:40 charon kernel: EXT4-fs (sdc2): recovery complete
Nov 08 10:25:40 charon kernel: EXT4-fs (sdc2): mounted filesystem with
ordered data mode. Opts: (null)
Nov 08 10:26:12 charon kernel: sd 5:0:0:0: [sdc] tag#17 uas_eh_abort_handler
0 uas-tag 1 inflight: OUT 
Nov 08 10:26:12 charon kernel: sd 5:0:0:0: [sdc] tag#17 CDB: Write Same(10)
41 00 00 06 b7 98 00 10 00 00
Nov 08 10:26:12 charon kernel: scsi host5: uas_eh_device_reset_handler start
Nov 08 10:26:12 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device
number 2 using xhci_hcd
Nov 08 10:26:12 charon kernel: scsi host5: uas_eh_device_reset_handler
success

I then see a lot of message groups like this in the log:

Nov 08 10:31:21 charon kernel: INFO: task jbd2/sdc2-8:104742 blocked for
more than 241 seconds.
Nov 08 10:31:21 charon kernel:       Not tainted 5.4.0-52-generic #57-Ubuntu
Nov 08 10:31:21 charon kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Nov 08 10:31:21 charon kernel: jbd2/sdc2-8     D    0 104742      2
0x80004000
Nov 08 10:31:21 charon kernel: Call Trace:
Nov 08 10:31:21 charon kernel:  __schedule+0x2e3/0x740
Nov 08 10:31:21 charon kernel:  schedule+0x42/0xb0
Nov 08 10:31:21 charon kernel:  jbd2_journal_commit_transaction+0x258/0x17e8
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:31:21 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:31:21 charon kernel:  ? wait_woken+0x80/0x80
Nov 08 10:31:21 charon kernel:  ? try_to_del_timer_sync+0x54/0x80
Nov 08 10:31:21 charon kernel:  kjournald2+0xb6/0x280
Nov 08 10:31:21 charon kernel:  ? wait_woken+0x80/0x80
Nov 08 10:31:21 charon kernel:  kthread+0x104/0x140
Nov 08 10:31:21 charon kernel:  ? commit_timeout+0x20/0x20
Nov 08 10:31:21 charon kernel:  ? kthread_park+0x90/0x90
Nov 08 10:31:21 charon kernel:  ret_from_fork+0x35/0x40
Nov 08 10:31:21 charon kernel: INFO: task ext4lazyinit:104744 blocked for
more than 241 seconds.
Nov 08 10:31:21 charon kernel:       Not tainted 5.4.0-52-generic #57-Ubuntu
Nov 08 10:31:21 charon kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Nov 08 10:31:21 charon kernel: ext4lazyinit    D    0 104744      2
0x80004000
Nov 08 10:31:21 charon kernel: Call Trace:
Nov 08 10:31:21 charon kernel:  __schedule+0x2e3/0x740
Nov 08 10:31:21 charon kernel:  schedule+0x42/0xb0
Nov 08 10:31:21 charon kernel:  schedule_timeout+0x10e/0x160
Nov 08 10:31:21 charon kernel:  io_schedule_timeout+0x1e/0x50
Nov 08 10:31:21 charon kernel:  wait_for_completion_io+0xb1/0x120
Nov 08 10:31:21 charon kernel:  ? wake_up_q+0x70/0x70
Nov 08 10:31:21 charon kernel:  submit_bio_wait+0x60/0x90
Nov 08 10:31:21 charon kernel:  blkdev_issue_zeroout+0x13f/0x220
Nov 08 10:31:21 charon kernel:  ext4_init_inode_table+0x195/0x386
Nov 08 10:31:21 charon kernel:  ext4_lazyinit_thread+0x2c7/0x3b0
Nov 08 10:31:21 charon kernel:  kthread+0x104/0x140
Nov 08 10:31:21 charon kernel:  ? ext4_unregister_li_request+0x70/0x70
Nov 08 10:31:21 charon kernel:  ? kthread_park+0x90/0x90
Nov 08 10:31:21 charon kernel:  ret_from_fork+0x35/0x40
Nov 08 10:32:14 charon kernel: scsi host5: uas_eh_device_reset_handler start
Nov 08 10:32:14 charon kernel: sd 5:0:0:0: [sdc] tag#9 uas_zap_pending 0
uas-tag 1 inflight: 
Nov 08 10:32:14 charon kernel: sd 5:0:0:0: [sdc] tag#9 CDB: Write Same(10)
41 00 00 06 b7 98 00 10 00 00
Nov 08 10:32:14 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device
number 2 using xhci_hcd
Nov 08 10:32:14 charon kernel: scsi host5: uas_eh_device_reset_handler
success
Nov 08 10:32:28 charon systemd[1]: Started Run anacron jobs.
Nov 08 10:32:28 charon anacron[107039]: Anacron 2.3 started on 2020-11-08
Nov 08 10:32:28 charon anacron[107039]: Normal exit (0 jobs run)
Nov 08 10:32:28 charon systemd[1]: anacron.service: Succeeded.
Nov 08 10:33:22 charon kernel: INFO: task jbd2/sdc2-8:104742 blocked for
more than 362 seconds.
Nov 08 10:33:22 charon kernel:       Not tainted 5.4.0-52-generic #57-Ubuntu
Nov 08 10:33:22 charon kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Nov 08 10:33:22 charon kernel: jbd2/sdc2-8     D    0 104742      2
0x80004000
Nov 08 10:33:22 charon kernel: Call Trace:
Nov 08 10:33:22 charon kernel:  __schedule+0x2e3/0x740
Nov 08 10:33:22 charon kernel:  schedule+0x42/0xb0
Nov 08 10:33:22 charon kernel:  jbd2_journal_commit_transaction+0x258/0x17e8
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x40/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:33:22 charon kernel:  ? __switch_to_asm+0x34/0x70
Nov 08 10:33:22 charon kernel:  ? wait_woken+0x80/0x80
Nov 08 10:33:22 charon kernel:  ? try_to_del_timer_sync+0x54/0x80
Nov 08 10:33:22 charon kernel:  kjournald2+0xb6/0x280
Nov 08 10:33:22 charon kernel:  ? wait_woken+0x80/0x80
Nov 08 10:33:22 charon kernel:  kthread+0x104/0x140
Nov 08 10:33:22 charon kernel:  ? commit_timeout+0x20/0x20
Nov 08 10:33:22 charon kernel:  ? kthread_park+0x90/0x90
Nov 08 10:33:22 charon kernel:  ret_from_fork+0x35/0x40
Nov 08 10:33:22 charon kernel: INFO: task ext4lazyinit:104744 blocked for
more than 362 seconds.
Nov 08 10:33:22 charon kernel:       Not tainted 5.4.0-52-generic #57-Ubuntu
Nov 08 10:33:22 charon kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Nov 08 10:33:22 charon kernel: ext4lazyinit    D    0 104744      2
0x80004000
Nov 08 10:33:22 charon kernel: Call Trace:
Nov 08 10:33:22 charon kernel:  __schedule+0x2e3/0x740
Nov 08 10:33:22 charon kernel:  schedule+0x42/0xb0
Nov 08 10:33:22 charon kernel:  schedule_timeout+0x10e/0x160
Nov 08 10:33:22 charon kernel:  io_schedule_timeout+0x1e/0x50
Nov 08 10:33:22 charon kernel:  wait_for_completion_io+0xb1/0x120
Nov 08 10:33:22 charon kernel:  ? wake_up_q+0x70/0x70
Nov 08 10:33:22 charon kernel:  submit_bio_wait+0x60/0x90
Nov 08 10:33:22 charon kernel:  blkdev_issue_zeroout+0x13f/0x220
Nov 08 10:33:22 charon kernel:  ext4_init_inode_table+0x195/0x386
Nov 08 10:33:22 charon kernel:  ext4_lazyinit_thread+0x2c7/0x3b0
Nov 08 10:33:22 charon kernel:  kthread+0x104/0x140
Nov 08 10:33:22 charon kernel:  ? ext4_unregister_li_request+0x70/0x70
Nov 08 10:33:22 charon kernel:  ? kthread_park+0x90/0x90
Nov 08 10:33:22 charon kernel:  ret_from_fork+0x35/0x40
Nov 08 10:34:15 charon kernel: scsi host5: uas_eh_device_reset_handler start
Nov 08 10:34:15 charon kernel: sd 5:0:0:0: [sdc] tag#1 uas_zap_pending 0
uas-tag 1 inflight: 
Nov 08 10:34:15 charon kernel: sd 5:0:0:0: [sdc] tag#1 CDB: Write Same(10)
41 00 00 06 b7 98 00 10 00 00
Nov 08 10:34:15 charon kernel: usb 2-1: reset SuperSpeed Gen 1 USB device
number 2 using xhci_hcd
Nov 08 10:34:15 charon kernel: scsi host5: uas_eh_device_reset_handler
success

Any guidance and help much appreciated.

David

