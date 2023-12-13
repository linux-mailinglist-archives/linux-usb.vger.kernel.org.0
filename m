Return-Path: <linux-usb+bounces-4111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E91F811041
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 12:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 196921F20FB3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 11:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60E324206;
	Wed, 13 Dec 2023 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zoho.com header.i=strongbox8@zoho.com header.b="BMrj/Ee7"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 904 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Dec 2023 03:36:03 PST
Received: from sender4-pp-o98.zoho.com (sender4-pp-o98.zoho.com [136.143.188.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F2111B;
	Wed, 13 Dec 2023 03:36:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702466446; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aV/STaqFgtoUEa3uKgY4DjZ+hci85w8tX2whL8WzfBhOCyc9HZNE05OkGFdAvCDthj0Ee5+kTfm9VtA5tTmzYEvJprCZUpbermjHd1fVBc3d8ZaOYItCWesKpWH3YiUB3iVULq0OuPrpIPDOgidBaOAQpFmDKbudTCUVcA7KFUg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1702466446; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=firuM7VKy+QQk1L9Mdlx8Uwt1lsPScX4bEk72ZSTe8k=; 
	b=DL8Hwg9w8otwr8AYeKbMTfRX8llEoF6q5vRMCLNXuT40DfBUaIDGu7/rnZIaL/SZ2b4QbBweNansYWqYB0GxCdOJGDWXbblf/iSyV6f0LeslEcEiMZfUVUICoi697joVu6UvdTg6E0GS6Fpfw/cHHTQZ4/NEd+TI+0sv52yAWao=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=strongbox8@zoho.com;
	dmarc=pass header.from=<strongbox8@zoho.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1702466446;
	s=zm2022; d=zoho.com; i=strongbox8@zoho.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=firuM7VKy+QQk1L9Mdlx8Uwt1lsPScX4bEk72ZSTe8k=;
	b=BMrj/Ee7YdmpkXh2cAIh9d0KN0SOKSIQlaGnIeROfTE5fWcDnT0LxxnU7I+peN7B
	sc26fNYY2cjQZpPfC4rG+7TlbbJDq8JnH+Z5sfy2B2prkb5YPc6QmWqHRlfQwuwX1ac
	Nl0KDczC7Zd5SgIjutg2fUbf4EX7zX9b97mafYgk=
Received: from archlinux.www.tendawifi.com (120.221.11.38 [120.221.11.38]) by mx.zohomail.com
	with SMTPS id 1702466444097570.7183324103629; Wed, 13 Dec 2023 03:20:44 -0800 (PST)
From: Perr Zhang <strongbox8@zoho.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	xbing@usb7.net,
	Perr Zhang <perr@usb7.net>
Subject: [PATCH] usb: f_uac1: adds support for SS and SSP
Date: Wed, 13 Dec 2023 19:21:06 +0800
Message-ID: <20231213112106.605260-1-strongbox8@zoho.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr0801122805ba8256e1b7ddd9f861eaaf0000aa748a894fec2d554b18fec0c1c48bea3237a385f6b26a46840c:zu0801122702617a37bb6ac3e5d743a7d6000010b71f074b8b1e401f117831fd61b128b9da30bb74d04643be:rf08011232c76d0e4017613f5f7a2970ca000035737f766cbd3fd5c729abb010139db6c9766f4a469aa7c1397a2219a64b9df2ac336d3b:ZohoMail
X-ZohoMailClient: External

From: Perr Zhang <perr@usb7.net>

Patch adds support of SS and SSP speed.
Tested with rockchip rk3399 dwc3

Signed-off-by: Perr Zhang <perr@usb7.net>
---
 drivers/usb/gadget/function/f_uac1.c | 77 +++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 6f0e1d803dc2..78634ea7863a 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -292,6 +292,77 @@ static struct usb_descriptor_header *f_audio_desc[] = {
 	NULL,
 };
 
+/* Standard ISO OUT Endpoint Descriptor */
+static struct usb_endpoint_descriptor ss_as_out_ep_desc  = {
+	.bLength =		USB_DT_ENDPOINT_AUDIO_SIZE,
+	.bDescriptorType =	USB_DT_ENDPOINT,
+	.bEndpointAddress =	USB_DIR_OUT,
+	.bmAttributes =		USB_ENDPOINT_SYNC_ADAPTIVE
+				| USB_ENDPOINT_XFER_ISOC,
+	.wMaxPacketSize	=	cpu_to_le16(UAC1_OUT_EP_MAX_PACKET_SIZE),
+	.bInterval =		4,
+};
+
+static struct usb_ss_ep_comp_descriptor ss_as_out_ep_desc_comp = {
+	.bLength		= sizeof(ss_as_out_ep_desc_comp),
+	.bDescriptorType	= USB_DT_SS_ENDPOINT_COMP,
+	.bMaxBurst		= 0,
+	.bmAttributes		= 0,
+	/* wBytesPerInterval = DYNAMIC */
+};
+
+/* Standard ISO OUT Endpoint Descriptor */
+static struct usb_endpoint_descriptor ss_as_in_ep_desc  = {
+	.bLength =		USB_DT_ENDPOINT_AUDIO_SIZE,
+	.bDescriptorType =	USB_DT_ENDPOINT,
+	.bEndpointAddress =	USB_DIR_IN,
+	.bmAttributes =		USB_ENDPOINT_SYNC_ASYNC
+				| USB_ENDPOINT_XFER_ISOC,
+	.wMaxPacketSize	=	cpu_to_le16(UAC1_OUT_EP_MAX_PACKET_SIZE),
+	.bInterval =		4,
+};
+
+static struct usb_ss_ep_comp_descriptor ss_as_in_ep_desc_comp = {
+	.bLength		= sizeof(ss_as_in_ep_desc_comp),
+	.bDescriptorType	= USB_DT_SS_ENDPOINT_COMP,
+	.bMaxBurst		= 0,
+	.bmAttributes		= 0,
+	/* wBytesPerInterval = DYNAMIC */
+};
+
+static struct usb_descriptor_header *f_audio_ss_desc[] = {
+	(struct usb_descriptor_header *)&ac_interface_desc,
+	(struct usb_descriptor_header *)&ac_header_desc,
+
+	(struct usb_descriptor_header *)&usb_out_it_desc,
+	(struct usb_descriptor_header *)&io_out_ot_desc,
+	(struct usb_descriptor_header *)&io_in_it_desc,
+	(struct usb_descriptor_header *)&usb_in_ot_desc,
+
+	(struct usb_descriptor_header *)&as_out_interface_alt_0_desc,
+	(struct usb_descriptor_header *)&as_out_interface_alt_1_desc,
+	(struct usb_descriptor_header *)&as_out_header_desc,
+
+	(struct usb_descriptor_header *)&as_out_type_i_desc,
+
+	//(struct usb_descriptor_header *)&as_out_ep_desc,
+	(struct usb_descriptor_header *)&ss_as_out_ep_desc,
+	(struct usb_descriptor_header *)&ss_as_out_ep_desc_comp,
+	(struct usb_descriptor_header *)&as_iso_out_desc,
+
+	(struct usb_descriptor_header *)&as_in_interface_alt_0_desc,
+	(struct usb_descriptor_header *)&as_in_interface_alt_1_desc,
+	(struct usb_descriptor_header *)&as_in_header_desc,
+
+	(struct usb_descriptor_header *)&as_in_type_i_desc,
+
+	//(struct usb_descriptor_header *)&as_in_ep_desc,
+	(struct usb_descriptor_header *)&ss_as_in_ep_desc,
+	(struct usb_descriptor_header *)&ss_as_in_ep_desc_comp,
+	(struct usb_descriptor_header *)&as_iso_in_desc,
+	NULL,
+};
+
 enum {
 	STR_AC_IF,
 	STR_USB_OUT_IT,
@@ -1352,6 +1423,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		ep = usb_ep_autoconfig(cdev->gadget, &as_out_ep_desc);
 		if (!ep)
 			goto err_free_fu;
+		ss_as_out_ep_desc.bEndpointAddress = as_out_ep_desc.bEndpointAddress;
 		audio->out_ep = ep;
 		audio->out_ep->desc = &as_out_ep_desc;
 	}
@@ -1360,6 +1432,7 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		ep = usb_ep_autoconfig(cdev->gadget, &as_in_ep_desc);
 		if (!ep)
 			goto err_free_fu;
+		ss_as_in_ep_desc.bEndpointAddress = as_in_ep_desc.bEndpointAddress;
 		audio->in_ep = ep;
 		audio->in_ep->desc = &as_in_ep_desc;
 	}
@@ -1367,8 +1440,8 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	setup_descriptor(audio_opts);
 
 	/* copy descriptors, and track endpoint copies */
-	status = usb_assign_descriptors(f, f_audio_desc, f_audio_desc, NULL,
-					NULL);
+	status = usb_assign_descriptors(f, f_audio_desc, f_audio_desc, f_audio_ss_desc,
+					f_audio_ss_desc);
 	if (status)
 		goto err_free_fu;
 
-- 
2.42.0


