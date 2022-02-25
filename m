Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3764C47C8
	for <lists+linux-usb@lfdr.de>; Fri, 25 Feb 2022 15:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbiBYOjE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Feb 2022 09:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiBYOjC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Feb 2022 09:39:02 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 52FDF1AE66D
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 06:38:26 -0800 (PST)
Received: (qmail 1080378 invoked by uid 1000); 25 Feb 2022 09:38:25 -0500
Date:   Fri, 25 Feb 2022 09:38:25 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Salah Triki <salah.triki@gmail.com>, noralf@tronnes.org,
        tzimmermann@suse.de, USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Update kerneldoc for usb_get_dev() and
 usb_get_intf()
Message-ID: <Yhjp4Rp9Alipmwtq@rowland.harvard.edu>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
 <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
 <YgpqHEb1CuhIElIP@rowland.harvard.edu>
 <20220217080459.GB2407@kadam>
 <Yg5ozvWf0T+NTWPz@rowland.harvard.edu>
 <YhieIzbS0OLSZTdj@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhieIzbS0OLSZTdj@kroah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The kerneldoc for usb_get_dev() and usb_get_intf() says that drivers
should always refcount the references they hold for the usb_device or
usb_interface structure, respectively.  But this is an overstatement:
In many cases drivers do not access these references after they have
been unbound, and in such cases refcounting is unnecessary.

This patch updates the kerneldoc for the two routines, explaining when
a driver does not need to increment and decrement the refcount.  This
should help dispel misconceptions which might otherwise afflict
programmers new to the USB subsystem.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1972]


 drivers/usb/core/usb.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: usb-devel/drivers/usb/core/usb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/usb.c
+++ usb-devel/drivers/usb/core/usb.c
@@ -688,6 +688,10 @@ EXPORT_SYMBOL_GPL(usb_alloc_dev);
  * Drivers for USB interfaces should normally record such references in
  * their probe() methods, when they bind to an interface, and release
  * them by calling usb_put_dev(), in their disconnect() methods.
+ * However, if a driver does not access the usb_device structure after
+ * its disconnect() method returns then refcounting is not necessary,
+ * because the USB core guarantees that a usb_device will not be
+ * deallocated until after all of its interface drivers have been unbound.
  *
  * Return: A pointer to the device with the incremented reference counter.
  */
@@ -722,6 +726,10 @@ EXPORT_SYMBOL_GPL(usb_put_dev);
  * Drivers for USB interfaces should normally record such references in
  * their probe() methods, when they bind to an interface, and release
  * them by calling usb_put_intf(), in their disconnect() methods.
+ * However, if a driver does not access the usb_interface structure after
+ * its disconnect() method returns then refcounting is not necessary,
+ * because the USB core guarantees that a usb_interface will not be
+ * deallocated until after its driver has been unbound.
  *
  * Return: A pointer to the interface with the incremented reference counter.
  */
