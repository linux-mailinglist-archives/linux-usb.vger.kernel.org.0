Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD2176D342
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 18:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbjHBQFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 12:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjHBQFG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 12:05:06 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 55F401706
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 09:05:04 -0700 (PDT)
Received: (qmail 208975 invoked by uid 1000); 2 Aug 2023 12:05:03 -0400
Date:   Wed, 2 Aug 2023 12:05:03 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: KMSAN: uninit-value in alauda_check_media
Message-ID: <497564c2-632f-472a-914e-5e19488824ae@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This thread has been dormant for over a year and a half.  Let's revive 
it and try to close out the issue.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.5-rc3

Index: usb-devel/drivers/usb/storage/alauda.c
===================================================================
--- usb-devel.orig/drivers/usb/storage/alauda.c
+++ usb-devel/drivers/usb/storage/alauda.c
@@ -318,7 +318,8 @@ static int alauda_get_media_status(struc
 	rc = usb_stor_ctrl_transfer(us, us->recv_ctrl_pipe,
 		command, 0xc0, 0, 1, data, 2);
 
-	usb_stor_dbg(us, "Media status %02X %02X\n", data[0], data[1]);
+	if (rc == USB_STOR_XFER_GOOD)
+		usb_stor_dbg(us, "Media status %02X %02X\n", data[0], data[1]);
 
 	return rc;
 }
@@ -454,9 +455,14 @@ static int alauda_init_media(struct us_d
 static int alauda_check_media(struct us_data *us)
 {
 	struct alauda_info *info = (struct alauda_info *) us->extra;
-	unsigned char status[2];
+	unsigned char *status = us->iobuf;
+	int rc;
 
-	alauda_get_media_status(us, status);
+	rc = alauda_get_media_status(us, status);
+	if (rc != USB_STOR_XFER_GOOD) {
+		status[0] = 0xF0;	/* Pretend there's no media */
+		status[1] = 0;
+	}
 
 	/* Check for no media or door open */
 	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
