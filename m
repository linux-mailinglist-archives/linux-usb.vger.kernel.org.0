Return-Path: <linux-usb+bounces-530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C97AC0E0
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 12:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 887F0282293
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 10:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BDB10A3E;
	Sat, 23 Sep 2023 10:54:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40A92117
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 10:54:32 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8ADC2
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 03:54:28 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id k0HKqXroxN7Qtk0HKqgwxU; Sat, 23 Sep 2023 12:54:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1695466467;
	bh=o6dXl6wZ2p8h+DtX0RSVtic+N8fFWJdpYZ/8V5pO/+o=;
	h=From:To:Cc:Subject:Date;
	b=mcQykgLvv5hKI2mZozZzRXVLylMgYxnioHBSXfRif9ZDjE83Z/OAuwY+RqsnqOzpM
	 Q68eBhNpcMD3XG+M/8YAjS9naOqitumOm5q4mvb78YMGynFQTHdaaExjWFnVBxO9Gj
	 SQr626Hk9TehEbEinQ7CSVJbmBhL6sV93okVDGlKXVcsLRW52qDyde59c5zzkBf79l
	 pXA+8Np6xLdKu+z9sgMh91E25QQ3z0U1PZicqI15p26rDfiqUhPUWBG7HYO3WMj8zw
	 qSF5HPBSe1BCEX3yMey2QOBg8RkJzalbPZvVlI4vWGORh2jOhE/qGwzIFyAH5su7S7
	 ybkC0BMuGIQJA==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 23 Sep 2023 12:54:27 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ben Dooks <ben@simtec.co.uk>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc2: gadget: Fix a warning when compiling with W=1
Date: Sat, 23 Sep 2023 12:54:24 +0200
Message-Id: <5cf603809388aa04c9a02bbfe3cf531c20bb043e.1695466447.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

In order to teach the compiler that 'hs_ep->name' will never be truncated,
we need to tell it that 'epnum' is not negative.

'epnum' comes from in a 'for' loop in dwc2_gadget_init(), starting at 0
and ending at 255. (hsotg->num_of_eps is a char)

When building with W=1, this fixes the following warnings:

  drivers/usb/dwc2/gadget.c: In function ‘dwc2_hsotg_initep’:
  drivers/usb/dwc2/gadget.c:4804:55: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Werror=format-truncation=]
   4804 |         snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%d%s", epnum, dir);
        |                                                       ^~
  drivers/usb/dwc2/gadget.c:4804:52: note: directive argument in the range [-2147483645, 255]
   4804 |         snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%d%s", epnum, dir);
        |                                                    ^~~~~~~~
  drivers/usb/dwc2/gadget.c:4804:9: note: ‘snprintf’ output between 6 and 17 bytes into a destination of size 10
   4804 |         snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%d%s", epnum, dir);
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: 5b7d70c6dbf2 ("USB: Gadget driver for Samsung HS/OtG block")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Only changing:
  -	int epnum;
  +	unsigned int epnum;
is enought to fix the build warning.

But changing the prototype of dwc2_hsotg_initep() and the printf() format
as well, to make obvious that epnum is >= 0, looks more logical to me.
---
 drivers/usb/dwc2/gadget.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b517a7216de2..102b2dd8113e 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4786,8 +4786,8 @@ static const struct usb_gadget_ops dwc2_hsotg_gadget_ops = {
  */
 static void dwc2_hsotg_initep(struct dwc2_hsotg *hsotg,
 			      struct dwc2_hsotg_ep *hs_ep,
-				       int epnum,
-				       bool dir_in)
+			      unsigned int epnum,
+			      bool dir_in)
 {
 	char *dir;
 
@@ -4801,7 +4801,7 @@ static void dwc2_hsotg_initep(struct dwc2_hsotg *hsotg,
 	hs_ep->dir_in = dir_in;
 	hs_ep->index = epnum;
 
-	snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%d%s", epnum, dir);
+	snprintf(hs_ep->name, sizeof(hs_ep->name), "ep%u%s", epnum, dir);
 
 	INIT_LIST_HEAD(&hs_ep->queue);
 	INIT_LIST_HEAD(&hs_ep->ep.ep_list);
@@ -4965,7 +4965,7 @@ static void dwc2_hsotg_dump(struct dwc2_hsotg *hsotg)
 int dwc2_gadget_init(struct dwc2_hsotg *hsotg)
 {
 	struct device *dev = hsotg->dev;
-	int epnum;
+	unsigned int epnum;
 	int ret;
 
 	/* Dump fifo information */
-- 
2.34.1


