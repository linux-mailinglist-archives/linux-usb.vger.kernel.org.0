Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E100A4ADF9B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 18:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384375AbiBHR1c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 12:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350519AbiBHR1P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 12:27:15 -0500
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC025C0612BA;
        Tue,  8 Feb 2022 09:26:57 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id v4so11080062pjh.2;
        Tue, 08 Feb 2022 09:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G6qiaTZVzcBFSEfi2ejXiIR3WdJ8ZKcDbOU4qpbfads=;
        b=ILrQTQWpp/cPBqrzf7c+9G0jEIchwJSJkhz8ndv2ilYfuJ1Xgc7mRzyKDwlLGfuzcS
         5v/BIgUygpoklyFOSVPwsp0/zxQSYA0RYSVrysZOx5ihTs1s1KkZD+VkVzkGuyLwzZo8
         8wtNiDCIU0pxKweMC+0p9w8CPMEMXempfSe9ac/pZ/biVEqeOyqlE5r50Lb3aDVLrO7U
         nn/zVaRrYQjuOJsPDKgXmLTPXOFiySNqdtLPwOfkx+yqU8PyNdL5urq2pxcCFL/SuDP6
         wWjp6oJiem/tmCs35TCrWCrA2JMGf5AZ9b40pF2FH2ErTii6keOqnpHFsHcz94mDNAqk
         pXKQ==
X-Gm-Message-State: AOAM532Mpxv7AS8dU1u77Gw8yP+QoXdU6g1PfuqYq1F/V+gWmLp43Ogi
        AGO4H9eHSnj4ohK3KvUiwVr34WI6Sgzi/nGv
X-Google-Smtp-Source: ABdhPJztgmPCEN/GrKcFbkf0sgpDllQ8Wxo9qKUZd6SfPAYgblhiBggHHbXAGuR7AZ89s708j+2rgw==
X-Received: by 2002:a17:903:251:: with SMTP id j17mr4707826plh.2.1644341217043;
        Tue, 08 Feb 2022 09:26:57 -0800 (PST)
Received: from asus.hsd1.ca.comcast.net ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id q1sm335116pfs.112.2022.02.08.09.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 09:26:56 -0800 (PST)
From:   Bart Van Assche <bvanassche@acm.org>
To:     "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-scsi@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 40/44] scsi: usb: Stop using the SCSI pointer
Date:   Tue,  8 Feb 2022 09:25:10 -0800
Message-Id: <20220208172514.3481-41-bvanassche@acm.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208172514.3481-1-bvanassche@acm.org>
References: <20220208172514.3481-1-bvanassche@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set scsi_host_template.cmd_size instead of using the SCSI pointer for
storing driver-private data. Change the type of the argument of
uas_add_work() from struct uas_cmd_info * into struct scsi_cmnd * because
it is easier to convert a SCSI command pointer into a uas_cmd_info pointer
than the other way around.

This patch prepares for removal of the SCSI pointer from struct scsi_cmnd.

Cc: linux-usb@vger.kernel.org
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Oliver Neukum <oneukum@suse.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/usb/storage/uas.c | 43 ++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 7f2944729ecd..84dc270f6f73 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -113,7 +113,7 @@ static void uas_do_work(struct work_struct *work)
 			continue;
 
 		cmnd = devinfo->cmnd[i];
-		cmdinfo = (void *)&cmnd->SCp;
+		cmdinfo = scsi_cmd_priv(cmnd);
 
 		if (!(cmdinfo->state & IS_IN_WORK_LIST))
 			continue;
@@ -139,10 +139,9 @@ static void uas_scan_work(struct work_struct *work)
 	dev_dbg(&devinfo->intf->dev, "scan complete\n");
 }
 
-static void uas_add_work(struct uas_cmd_info *cmdinfo)
+static void uas_add_work(struct scsi_cmnd *cmnd)
 {
-	struct scsi_pointer *scp = (void *)cmdinfo;
-	struct scsi_cmnd *cmnd = container_of(scp, struct scsi_cmnd, SCp);
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct uas_dev_info *devinfo = cmnd->device->hostdata;
 
 	lockdep_assert_held(&devinfo->lock);
@@ -163,7 +162,7 @@ static void uas_zap_pending(struct uas_dev_info *devinfo, int result)
 			continue;
 
 		cmnd = devinfo->cmnd[i];
-		cmdinfo = (void *)&cmnd->SCp;
+		cmdinfo = scsi_cmd_priv(cmnd);
 		uas_log_cmd_state(cmnd, __func__, 0);
 		/* Sense urbs were killed, clear COMMAND_INFLIGHT manually */
 		cmdinfo->state &= ~COMMAND_INFLIGHT;
@@ -200,15 +199,14 @@ static void uas_sense(struct urb *urb, struct scsi_cmnd *cmnd)
 static void uas_log_cmd_state(struct scsi_cmnd *cmnd, const char *prefix,
 			      int status)
 {
-	struct uas_cmd_info *ci = (void *)&cmnd->SCp;
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *ci = scsi_cmd_priv(cmnd);
 
 	if (status == -ENODEV) /* too late */
 		return;
 
 	scmd_printk(KERN_INFO, cmnd,
 		    "%s %d uas-tag %d inflight:%s%s%s%s%s%s%s%s%s%s%s%s ",
-		    prefix, status, cmdinfo->uas_tag,
+		    prefix, status, ci->uas_tag,
 		    (ci->state & SUBMIT_STATUS_URB)     ? " s-st"  : "",
 		    (ci->state & ALLOC_DATA_IN_URB)     ? " a-in"  : "",
 		    (ci->state & SUBMIT_DATA_IN_URB)    ? " s-in"  : "",
@@ -231,7 +229,7 @@ static void uas_free_unsubmitted_urbs(struct scsi_cmnd *cmnd)
 	if (!cmnd)
 		return;
 
-	cmdinfo = (void *)&cmnd->SCp;
+	cmdinfo = scsi_cmd_priv(cmnd);
 
 	if (cmdinfo->state & SUBMIT_CMD_URB)
 		usb_free_urb(cmdinfo->cmd_urb);
@@ -245,7 +243,7 @@ static void uas_free_unsubmitted_urbs(struct scsi_cmnd *cmnd)
 
 static int uas_try_complete(struct scsi_cmnd *cmnd, const char *caller)
 {
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct uas_dev_info *devinfo = (void *)cmnd->device->hostdata;
 
 	lockdep_assert_held(&devinfo->lock);
@@ -263,13 +261,13 @@ static int uas_try_complete(struct scsi_cmnd *cmnd, const char *caller)
 static void uas_xfer_data(struct urb *urb, struct scsi_cmnd *cmnd,
 			  unsigned direction)
 {
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	int err;
 
 	cmdinfo->state |= direction | SUBMIT_STATUS_URB;
 	err = uas_submit_urbs(cmnd, cmnd->device->hostdata);
 	if (err) {
-		uas_add_work(cmdinfo);
+		uas_add_work(cmnd);
 	}
 }
 
@@ -329,7 +327,7 @@ static void uas_stat_cmplt(struct urb *urb)
 	}
 
 	cmnd = devinfo->cmnd[idx];
-	cmdinfo = (void *)&cmnd->SCp;
+	cmdinfo = scsi_cmd_priv(cmnd);
 
 	if (!(cmdinfo->state & COMMAND_INFLIGHT)) {
 		uas_log_cmd_state(cmnd, "unexpected status cmplt", 0);
@@ -394,7 +392,7 @@ static void uas_stat_cmplt(struct urb *urb)
 static void uas_data_cmplt(struct urb *urb)
 {
 	struct scsi_cmnd *cmnd = urb->context;
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct uas_dev_info *devinfo = (void *)cmnd->device->hostdata;
 	struct scsi_data_buffer *sdb = &cmnd->sdb;
 	unsigned long flags;
@@ -446,7 +444,7 @@ static struct urb *uas_alloc_data_urb(struct uas_dev_info *devinfo, gfp_t gfp,
 				      enum dma_data_direction dir)
 {
 	struct usb_device *udev = devinfo->udev;
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct urb *urb = usb_alloc_urb(0, gfp);
 	struct scsi_data_buffer *sdb = &cmnd->sdb;
 	unsigned int pipe = (dir == DMA_FROM_DEVICE)
@@ -468,7 +466,7 @@ static struct urb *uas_alloc_sense_urb(struct uas_dev_info *devinfo, gfp_t gfp,
 				       struct scsi_cmnd *cmnd)
 {
 	struct usb_device *udev = devinfo->udev;
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct urb *urb = usb_alloc_urb(0, gfp);
 	struct sense_iu *iu;
 
@@ -496,7 +494,7 @@ static struct urb *uas_alloc_cmd_urb(struct uas_dev_info *devinfo, gfp_t gfp,
 {
 	struct usb_device *udev = devinfo->udev;
 	struct scsi_device *sdev = cmnd->device;
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct urb *urb = usb_alloc_urb(0, gfp);
 	struct command_iu *iu;
 	int len;
@@ -558,7 +556,7 @@ static struct urb *uas_submit_sense_urb(struct scsi_cmnd *cmnd, gfp_t gfp)
 static int uas_submit_urbs(struct scsi_cmnd *cmnd,
 			   struct uas_dev_info *devinfo)
 {
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct urb *urb;
 	int err;
 
@@ -637,12 +635,10 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd)
 {
 	struct scsi_device *sdev = cmnd->device;
 	struct uas_dev_info *devinfo = sdev->hostdata;
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	unsigned long flags;
 	int idx, err;
 
-	BUILD_BUG_ON(sizeof(struct uas_cmd_info) > sizeof(struct scsi_pointer));
-
 	/* Re-check scsi_block_requests now that we've the host-lock */
 	if (cmnd->device->host->host_self_blocked)
 		return SCSI_MLQUEUE_DEVICE_BUSY;
@@ -712,7 +708,7 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd)
 			spin_unlock_irqrestore(&devinfo->lock, flags);
 			return SCSI_MLQUEUE_DEVICE_BUSY;
 		}
-		uas_add_work(cmdinfo);
+		uas_add_work(cmnd);
 	}
 
 	devinfo->cmnd[idx] = cmnd;
@@ -730,7 +726,7 @@ static DEF_SCSI_QCMD(uas_queuecommand)
  */
 static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
 {
-	struct uas_cmd_info *cmdinfo = (void *)&cmnd->SCp;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct uas_dev_info *devinfo = (void *)cmnd->device->hostdata;
 	struct urb *data_in_urb = NULL;
 	struct urb *data_out_urb = NULL;
@@ -910,6 +906,7 @@ static struct scsi_host_template uas_host_template = {
 	.this_id = -1,
 	.skip_settle_delay = 1,
 	.dma_boundary = PAGE_SIZE - 1,
+	.cmd_size = sizeof(struct uas_cmd_info),
 };
 
 #define UNUSUAL_DEV(id_vendor, id_product, bcdDeviceMin, bcdDeviceMax, \
