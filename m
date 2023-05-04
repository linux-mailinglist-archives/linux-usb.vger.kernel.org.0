Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DCA6F6DE4
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 16:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjEDOlj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 10:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjEDOli (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 10:41:38 -0400
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76828118;
        Thu,  4 May 2023 07:41:15 -0700 (PDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 9604420126;
        Thu,  4 May 2023 16:41:12 +0200 (CEST)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (3072 bits) server-digest SHA256)
        (No client certificate requested)
        by ns.iliad.fr (Postfix) with ESMTPS id 84A9D200BB;
        Thu,  4 May 2023 16:41:12 +0200 (CEST)
Date:   Thu, 4 May 2023 16:41:11 +0200
From:   Maxime Bizon <mbizon@freebox.fr>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Benjamin Block <bblock@linux.ibm.com>,
        Oliver Neukum <oneukum@suse.com>,
        Hannes Reinecke <hare@suse.de>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-scsi@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Reproducible deadlock when usb-storage scsi command timeouts
 twice
Message-ID: <ZFPEB3lbEV90OJ91@sakura>
References: <ZEllnjMKT8ulZbJh@sakura>
 <34a2e50b-e899-45ee-ac14-31fa0bb1616b@rowland.harvard.edu>
 <20230503102440.GL18384@t480-pf1aa2c2.fritz.box>
 <941e8420-f99f-5832-2ea9-3ba5eca545ad@suse.com>
 <20230503125137.GA1032383@t480-pf1aa2c2.fritz.box>
 <d25bfa50-b5a0-bd0e-fd14-94967e374033@suse.com>
 <97a67f78-4888-4fe7-9bfc-87d0bb6cc8b2@rowland.harvard.edu>
 <20230504085226.GC1032383@t480-pf1aa2c2.fritz.box>
 <83fac55c-4005-416d-aad7-04bcb3fcaea2@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83fac55c-4005-416d-aad7-04bcb3fcaea2@rowland.harvard.edu>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Thursday 04 May 2023 � 10:05:38 (-0400), Alan Stern wrote:

> Maxime, would you like to submit a revised version of your patch?  The 
> key difference is that it should abort the currently executing command 
> (if there is one), regardless of whether the srb value matches.

Yes

before I do a format submission, is this what you have in mind ?

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 8931df5a85fd..380b04273969 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -406,10 +406,8 @@ static DEF_SCSI_QCMD(queuecommand)
  ***********************************************************************/
 
 /* Command timeout and abort */
-static int command_abort(struct scsi_cmnd *srb)
+static int command_abort_matching(struct us_data *us, struct scsi_cmnd *srb_match)
 {
-	struct us_data *us = host_to_us(srb->device->host);
-
 	usb_stor_dbg(us, "%s called\n", __func__);
 
 	/*
@@ -418,10 +416,17 @@ static int command_abort(struct scsi_cmnd *srb)
 	 */
 	scsi_lock(us_to_host(us));
 
-	/* Is this command still active? */
-	if (us->srb != srb) {
+	/* is there any active pending command to abort ? */
+	if (!us->srb) {
 		scsi_unlock(us_to_host(us));
 		usb_stor_dbg(us, "-- nothing to abort\n");
+		return SUCCESS;
+	}
+
+	/* Does the command match the passed srb if any ? */
+	if (srb_match && us->srb != srb_match) {
+		scsi_unlock(us_to_host(us));
+		usb_stor_dbg(us, "-- pending command mismatch\n");
 		return FAILED;
 	}
 
@@ -444,6 +449,16 @@ static int command_abort(struct scsi_cmnd *srb)
 	return SUCCESS;
 }
 
+static int command_abort_any(struct us_data *us)
+{
+	return command_abort_matching(us, NULL);
+}
+
+static int command_abort(struct scsi_cmnd *srb)
+{
+	return command_abort_matching(host_to_us(srb->device->host), srb);
+}
+
 /*
  * This invokes the transport reset mechanism to reset the state of the
  * device
@@ -455,6 +470,8 @@ static int device_reset(struct scsi_cmnd *srb)
 
 	usb_stor_dbg(us, "%s called\n", __func__);
 
+	command_abort_any(us);
+
 	/* lock the device pointers and do the reset */
 	mutex_lock(&(us->dev_mutex));
 	result = us->transport_reset(us);


-- 
Maxime
