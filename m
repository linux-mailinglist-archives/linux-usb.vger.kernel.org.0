Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4648E77966E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Aug 2023 19:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235886AbjHKRrG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Aug 2023 13:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbjHKRrF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Aug 2023 13:47:05 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5D68AEA
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 10:47:05 -0700 (PDT)
Received: (qmail 289959 invoked by uid 1000); 11 Aug 2023 13:47:04 -0400
Date:   Fri, 11 Aug 2023 13:47:04 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: gadget: f_mass_storage: Fix unused variable warning
Message-ID: <cfed16c7-aa46-494b-ba84-b0e0dc99be3a@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix a "variable set but not used" warning in f_mass_storage.c.  rc is 
used if	verbose debugging is enabled but not otherwise.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: d5e2b67aae79 ("USB: g_mass_storage: template f_mass_storage.c file created")

---

Resend: I forgot to CC: the mailing list the first time.

 drivers/usb/gadget/function/f_mass_storage.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb-devel/drivers/usb/gadget/function/f_mass_storage.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/function/f_mass_storage.c
+++ usb-devel/drivers/usb/gadget/function/f_mass_storage.c
@@ -927,7 +927,7 @@ static void invalidate_sub(struct fsg_lu
 {
 	struct file	*filp = curlun->filp;
 	struct inode	*inode = file_inode(filp);
-	unsigned long	rc;
+	unsigned long __maybe_unused	rc;
 
 	rc = invalidate_mapping_pages(inode->i_mapping, 0, -1);
 	VLDBG(curlun, "invalidate_mapping_pages -> %ld\n", rc);
