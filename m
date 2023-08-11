Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC31779664
	for <lists+linux-usb@lfdr.de>; Fri, 11 Aug 2023 19:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236674AbjHKRok (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Aug 2023 13:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235203AbjHKRok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Aug 2023 13:44:40 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 7C11230E7
        for <linux-usb@vger.kernel.org>; Fri, 11 Aug 2023 10:44:39 -0700 (PDT)
Received: (qmail 289862 invoked by uid 1000); 11 Aug 2023 13:44:38 -0400
Date:   Fri, 11 Aug 2023 13:44:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Badhri Jagan Sridharan <badhri@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: gadget: core: Add missing kerneldoc for vbus_work
Message-ID: <1e5e7cda-b2c8-4917-9952-4354f365ede0@rowland.harvard.edu>
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

Add a missing kerneldoc description of the vbus_work field in struct usb_udc.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 50966da807c8 ("usb: gadget: udc: core: Offload usb_udc_vbus_handler processing")

---

 drivers/usb/gadget/udc/core.c |    1 +
 1 file changed, 1 insertion(+)

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -40,6 +40,7 @@ static const struct bus_type gadget_bus_
  * @allow_connect: Indicates whether UDC is allowed to be pulled up.
  * Set/cleared by gadget_(un)bind_driver() after gadget driver is bound or
  * unbound.
+ * @vbus_work: work routine to handle VBUS status change notifications.
  * @connect_lock: protects udc->started, gadget->connect,
  * gadget->allow_connect and gadget->deactivate. The routines
  * usb_gadget_connect_locked(), usb_gadget_disconnect_locked(),
