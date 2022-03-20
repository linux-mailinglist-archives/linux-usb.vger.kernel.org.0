Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEAE4E1DA2
	for <lists+linux-usb@lfdr.de>; Sun, 20 Mar 2022 20:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343603AbiCTTvZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Mar 2022 15:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiCTTvZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Mar 2022 15:51:25 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 615FF275FC
        for <linux-usb@vger.kernel.org>; Sun, 20 Mar 2022 12:50:01 -0700 (PDT)
Received: (qmail 78250 invoked by uid 1000); 20 Mar 2022 15:50:00 -0400
Date:   Sun, 20 Mar 2022 15:50:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [RFC PATCH 3/4] USB: gadget: Fix mistakes in UDC core kerneldoc
Message-ID: <YjeFaCijdcfw5fdc@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YjeEwspj0V3JaV1L@rowland.harvard.edu>
 <YjeFImy6hY+2MHe2@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjeFImy6hY+2MHe2@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch fixes some minor mistakes in the UDC core's kerneldoc.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/gadget/udc/core.c |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1262,9 +1262,6 @@ static int check_pending_gadget_drivers(
  * device.
  * @gadget: the gadget to be initialized.
  * @release: a gadget release function.
- *
- * Returns zero on success, negative errno otherwise.
- * Calls the gadget release function in the latter case.
  */
 void usb_initialize_gadget(struct device *parent, struct usb_gadget *gadget,
 		void (*release)(struct device *dev))
@@ -1441,11 +1438,10 @@ static void usb_gadget_remove_driver(str
 }
 
 /**
- * usb_del_gadget - deletes @udc from udc_list
- * @gadget: the gadget to be removed.
+ * usb_del_gadget - deletes a gadget and unregisters its udc
+ * @gadget: the gadget to be deleted.
  *
- * This will call usb_gadget_unregister_driver() if
- * the @udc is still busy.
+ * This will unbind @gadget, if it is bound.
  * It will not do a final usb_put_gadget().
  */
 void usb_del_gadget(struct usb_gadget *gadget)
@@ -1476,8 +1472,8 @@ void usb_del_gadget(struct usb_gadget *g
 EXPORT_SYMBOL_GPL(usb_del_gadget);
 
 /**
- * usb_del_gadget_udc - deletes @udc from udc_list
- * @gadget: the gadget to be removed.
+ * usb_del_gadget_udc - unregisters a gadget
+ * @gadget: the gadget to be unregistered.
  *
  * Calls usb_del_gadget() and does a final usb_put_gadget().
  */
