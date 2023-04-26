Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9035B6EF9A9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 19:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233146AbjDZRzu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 13:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjDZRzt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 13:55:49 -0400
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4C235AD
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 10:55:45 -0700 (PDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id AC66220AF4;
        Wed, 26 Apr 2023 19:55:43 +0200 (CEST)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (3072 bits) server-digest SHA256)
        (No client certificate requested)
        by ns.iliad.fr (Postfix) with ESMTPS id 9D5C0208AC;
        Wed, 26 Apr 2023 19:55:43 +0200 (CEST)
Date:   Wed, 26 Apr 2023 19:55:42 +0200
From:   Maxime Bizon <mbizon@freebox.fr>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Reproducible deadlock when usb-storage scsi command timeouts twice
Message-ID: <ZEllnjMKT8ulZbJh@sakura>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hello,

I have a faulty 128MB USB stick that happens to randomly timeout when
reading a specific block.

After the first timeout, the scsi layer retries the command. If that
retry work, then everything goes well. But if the retried command
timeouts as well, then I get a deadlock.

To reproduce fast & reliable, I'm using these settings:

# echo 10 >/proc/sys/kernel/hung_task_timeout_secs
# echo 0x3f > /proc/sys/dev/scsi/logging_level
# cd /sys/block/sda/queue/
# echo none > scheduler
# echo 1 > nr_requests
# echo 1 > nomerges
# echo 4 > max_sectors_kb
# echo 5000 > io_timeout
# cat /dev/sda > /dev/null


dmesg with timestamps so it's easy to spot the timeouts:

[  211.732418] *** thread awakened
[  211.732429] Command READ_10 (10 bytes)
[  211.732438] bytes: 28 00 00 02 01 f8 00 00 08 00
[  211.732447] Bulk Command S 0x43425355 T 0xb8ca L 4096 F 128 Trg 0 LUN 0 CL 10
[  211.732459] xfer 31 bytes
[  211.732539] Status code 0; transferred 31/31
[  211.732550] -- transfer complete
[  211.732557] Bulk command transfer result=0
[  211.732564] xfer 4096 bytes, 1 entries
[  211.732913] Status code 0; transferred 4096/4096
[  211.732925] -- transfer complete
[  211.732931] Bulk data transfer result 0x0
[  211.732938] Attempting to get CSW...
[  211.732944] xfer 13 bytes
[  211.733036] Status code 0; transferred 13/13
[  211.733047] -- transfer complete
[  211.733054] Bulk status result = 0
[  211.733061] Bulk Status S 0x53425355 T 0xb8ca R 0 Stat 0x0
[  211.733071] scsi cmd done, result=0x0
[  211.733092] *** thread sleeping
[  211.733162] *** thread awakened
[  211.733174] Command READ_10 (10 bytes)
[  211.733183] bytes: 28 00 00 02 02 00 00 00 08 00
[  211.733192] Bulk Command S 0x43425355 T 0xb8cb L 4096 F 128 Trg 0 LUN 0 CL 10
[  211.733204] xfer 31 bytes
[  211.733288] Status code 0; transferred 31/31
[  211.733300] -- transfer complete
[  211.733306] Bulk command transfer result=0
[  211.733313] xfer 4096 bytes, 1 entries
[  218.089304] sd 0:0:0:0: [sda] tag#0 abort scheduled
[  218.109297] sd 0:0:0:0: [sda] tag#0 aborting command
[  218.109315] command_abort called
[  218.109324] -- cancelling sg request
[  218.112380] Status code -104; transferred 3072/4096
[  218.112393] -- transfer cancelled
[  218.112400] Bulk data transfer result 0x4
[  218.112407] -- command was aborted
[  218.209278] usb 1-1.2: reset high-speed USB device number 3 using orion-ehci
[  218.359923] usb_reset_device returns 0
[  218.359936] scsi command aborted
[  218.359947] *** thread sleeping
[  218.359964] sd 0:0:0:0: [sda] tag#0 retry aborted command
[  218.399298] *** thread awakened
[  218.399311] Command READ_10 (10 bytes)
[  218.399320] bytes: 28 00 00 02 02 00 00 00 08 00
[  218.399330] Bulk Command S 0x43425355 T 0xb8cc L 4096 F 128 Trg 0 LUN 0 CL 10
[  218.399342] xfer 31 bytes
[  218.399544] Status code 0; transferred 31/31
[  218.399556] -- transfer complete
[  218.399562] Bulk command transfer result=0
[  218.399570] xfer 4096 bytes, 1 entries
[  225.129297] sd 0:0:0:0: [sda] tag#0 previous abort failed
[  225.129337] scsi host0: Waking error handler thread
[  225.129358] scsi host0: scsi_eh_0: waking up 0/1/1
[  225.129375] scsi host0: scsi_eh_prt_fail_stats: cmds failed: 0, cancel: 1
[  225.129387] scsi host0: Total of 1 commands on 1 devices require eh work
[  225.129402] sd 0:0:0:0: scsi_eh_0: Sending BDR
[  225.129414] device_reset called
[  235.369290] INFO: task scsi_eh_0:173 blocked for more than 10 seconds.
[  235.369311]       Not tainted 6.3.0-00615-gffe64935a4a2 #9
[  235.369320] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  235.369327] task:scsi_eh_0       state:D stack:0     pid:173   ppid:2      flags:0x00000000
[  235.369350]  __schedule from schedule+0x70/0xac
[  235.369374]  schedule from schedule_preempt_disabled+0x24/0x34
[  235.369393]  schedule_preempt_disabled from __mutex_lock.constprop.0+0x14c/0x280
[  235.369412]  __mutex_lock.constprop.0 from device_reset+0x28/0x64
[  235.369433]  device_reset from scsi_try_bus_device_reset+0x24/0x58
[  235.369452]  scsi_try_bus_device_reset from scsi_eh_ready_devs+0x2f0/0x97c
[  235.369470]  scsi_eh_ready_devs from scsi_error_handler+0x238/0x49c
[  235.369488]  scsi_error_handler from kthread+0xc4/0xdc
[  235.369507]  kthread from ret_from_fork+0x14/0x3c
[  235.369567] INFO: task usb-storage:176 blocked for more than 10 seconds.
[  235.369576]       Not tainted 6.3.0-00615-gffe64935a4a2 #9
[  235.369583] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  235.369590] task:usb-storage     state:D stack:0     pid:176   ppid:2      flags:0x00000000
[  235.369606]  __schedule from schedule+0x70/0xac
[  235.369622]  schedule from schedule_timeout+0x18/0xd0
[  235.369641]  schedule_timeout from __wait_for_common+0xc0/0x13c
[  235.369660]  __wait_for_common from usb_sg_wait+0x10c/0x118
[  235.369677]  usb_sg_wait from usb_stor_bulk_transfer_sglist+0xc4/0x118
[  235.369695]  usb_stor_bulk_transfer_sglist from usb_stor_bulk_srb+0x24/0x3c
[  235.369713]  usb_stor_bulk_srb from usb_stor_Bulk_transport+0x164/0x44c
[  235.369731]  usb_stor_Bulk_transport from usb_stor_invoke_transport+0x20/0x5c4
[  235.369750]  usb_stor_invoke_transport from usb_stor_control_thread+0x1a4/0x2bc
[  235.369769]  usb_stor_control_thread from kthread+0xc4/0xdc
[  235.369786]  kthread from ret_from_fork+0x14/0x3c


Turns out eh_device_reset_handler() is called with a pending command
(srb == us->srb), and I don't know if the usb code was expecting
eh_abort_handler() to be called first.

This patch fixes the issue, not sure if it's correct:

--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -455,6 +455,9 @@ static int device_reset(struct scsi_cmnd *srb)
 
        usb_stor_dbg(us, "%s called\n", __func__);
 
+       if (us->srb == srb)
+               command_abort(srb);
+
        /* lock the device pointers and do the reset */
        mutex_lock(&(us->dev_mutex));
        result = us->transport_reset(us);


-- 
Maxime
