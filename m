Return-Path: <linux-usb+bounces-2204-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9E7D7CE3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 08:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6AC11C20ED4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 06:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F092D616;
	Thu, 26 Oct 2023 06:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ez+7t92v"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6497610E3
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 06:34:00 +0000 (UTC)
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id A9375C0;
	Wed, 25 Oct 2023 23:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tAnAk
	c6TwBJA7+4fp+4Np5WkOZfvzRbrX0uyOuK61KA=; b=ez+7t92vmB2fOPMCK+x4t
	DL2fhHnbL9/a3se/VzVcvNtU39vHFekOnd47GHfssoFR9prMU5cdaTWHbJPNQHCH
	wgDl1ID4Mv/w0nnE4Xc1d8CHVRuHTI139cbWLLaxv+eWe133vv2KB6E+MKwK11Xj
	A6xsH/b7FcQekz1Rt5vVkk=
Received: from ubuntu.. (unknown [171.83.45.213])
	by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wD3P0lFCDplUGTZAw--.45306S2;
	Thu, 26 Oct 2023 14:33:41 +0800 (CST)
From: Charles Yi <be286@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Yi <be286@163.com>
Subject: [PATCH V3] usb: gadget: f_uac1: add adaptive sync support for capture
Date: Thu, 26 Oct 2023 14:33:13 +0800
Message-Id: <20231026063313.1574618-1-be286@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P0lFCDplUGTZAw--.45306S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFW7KF1kKFyxAr48tF15CFg_yoW7GFykpw
	1UC3yIkr45ArW3Jr48JFWruF43CFWxGry8GrW7Ww4FganFy3sava42yrWFkFy7JFyrZw4I
	qF4Fgw1a93ykCrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRn2-nUUUUU=
X-Originating-IP: [171.83.45.213]
X-CM-SenderInfo: dehsmli6rwjhhfrp/1tbiWwcV0mI0cg5OXAAAsj

UAC1 has it's own freerunning clock and can update Host about
real clock frequency through feedback endpoint so Host can align
number of samples sent to the UAC1 to prevent overruns/underruns.

Change UAC1 driver to make it configurable through additional
'c_sync' configfs file.

Default remains 'adaptive' with possibility to switch it
to 'asynchronous'.

Signed-off-by: Charles Yi <be286@163.com>

---------
Changes in V3:
- Changed sync mode of capture to adaptive as default.
- Added implement of 'c_sync' through configfs file.
---------
Changes in V2:
- Updated the indentation of commit message.
---------
---
 drivers/usb/gadget/function/f_uac1.c | 32 ++++++++++++++++++++++++++++
 drivers/usb/gadget/function/u_uac1.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 6f0e1d803dc2..edf3c50766b8 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -33,6 +33,8 @@
 #define FUOUT_EN(_opts) ((_opts)->c_mute_present \
 			|| (_opts)->c_volume_present)
 
+#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
+
 struct f_uac1 {
 	struct g_audio g_audio;
 	u8 ac_intf, as_in_intf, as_out_intf;
@@ -227,6 +229,16 @@ static struct uac_iso_endpoint_descriptor as_iso_out_desc = {
 	.wLockDelay =		cpu_to_le16(1),
 };
 
+static struct usb_endpoint_descriptor as_fback_ep_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bEndpointAddress = USB_DIR_IN,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
+	.wMaxPacketSize = cpu_to_le16(3),
+	.bInterval = 1,
+};
+
 static struct uac_format_type_i_discrete_descriptor as_in_type_i_desc = {
 	.bLength =		0, /* filled on rate setup */
 	.bDescriptorType =	USB_DT_CS_INTERFACE,
@@ -280,6 +292,7 @@ static struct usb_descriptor_header *f_audio_desc[] = {
 
 	(struct usb_descriptor_header *)&as_out_ep_desc,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
+	(struct usb_descriptor_header *)&as_fback_ep_desc,
 
 	(struct usb_descriptor_header *)&as_in_interface_alt_0_desc,
 	(struct usb_descriptor_header *)&as_in_interface_alt_1_desc,
@@ -1107,6 +1120,9 @@ static void setup_descriptor(struct f_uac1_opts *opts)
 		f_audio_desc[i++] = USBDHDR(&as_out_type_i_desc);
 		f_audio_desc[i++] = USBDHDR(&as_out_ep_desc);
 		f_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
+		if (EPOUT_FBACK_IN_EN(opts)) {
+			f_audio_desc[i++] = USBDHDR(&as_fback_ep_desc);
+		}
 	}
 	if (EPIN_EN(opts)) {
 		f_audio_desc[i++] = USBDHDR(&as_in_interface_alt_0_desc);
@@ -1317,6 +1333,12 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 		ac_header_desc->baInterfaceNr[ba_iface_id++] = status;
 		uac1->as_out_intf = status;
 		uac1->as_out_alt = 0;
+
+		if (EPOUT_FBACK_IN_EN(audio_opts)) {
+			as_out_ep_desc.bmAttributes =
+			USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
+			as_out_interface_alt_1_desc.bNumEndpoints++;
+		}
 	}
 
 	if (EPIN_EN(audio_opts)) {
@@ -1354,6 +1376,12 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 			goto err_free_fu;
 		audio->out_ep = ep;
 		audio->out_ep->desc = &as_out_ep_desc;
+		if (EPOUT_FBACK_IN_EN(audio_opts)) {
+			audio->in_ep_fback = usb_ep_autoconfig(gadget, &as_fback_ep_desc);
+			if (!audio->in_ep_fback) {
+				goto err_free_fu;
+			}
+		}
 	}
 
 	if (EPIN_EN(audio_opts)) {
@@ -1596,6 +1624,7 @@ UAC1_ATTRIBUTE(u32, p_chmask);
 UAC1_RATE_ATTRIBUTE(p_srate);
 UAC1_ATTRIBUTE(u32, p_ssize);
 UAC1_ATTRIBUTE(u32, req_number);
+UAC1_ATTRIBUTE(u32, c_sync);
 
 UAC1_ATTRIBUTE(bool, p_mute_present);
 UAC1_ATTRIBUTE(bool, p_volume_present);
@@ -1618,6 +1647,7 @@ static struct configfs_attribute *f_uac1_attrs[] = {
 	&f_uac1_opts_attr_p_srate,
 	&f_uac1_opts_attr_p_ssize,
 	&f_uac1_opts_attr_req_number,
+	&f_uac1_opts_attr_c_sync,
 
 	&f_uac1_opts_attr_p_mute_present,
 	&f_uac1_opts_attr_p_volume_present,
@@ -1685,6 +1715,8 @@ static struct usb_function_instance *f_audio_alloc_inst(void)
 
 	opts->req_number = UAC1_DEF_REQ_NUM;
 
+	opts->c_sync = UAC1_DEF_CSYNC;
+
 	snprintf(opts->function_name, sizeof(opts->function_name), "AC Interface");
 
 	return &opts->func_inst;
diff --git a/drivers/usb/gadget/function/u_uac1.h b/drivers/usb/gadget/function/u_uac1.h
index f7a616760e31..d0a4b86bff5c 100644
--- a/drivers/usb/gadget/function/u_uac1.h
+++ b/drivers/usb/gadget/function/u_uac1.h
@@ -27,6 +27,7 @@
 #define UAC1_DEF_MAX_DB		0		/* 0 dB */
 #define UAC1_DEF_RES_DB		(1*256)	/* 1 dB */
 
+#define UAC1_DEF_CSYNC		USB_ENDPOINT_SYNC_ADAPTIVE
 
 struct f_uac1_opts {
 	struct usb_function_instance	func_inst;
@@ -56,6 +57,7 @@ struct f_uac1_opts {
 
 	struct mutex			lock;
 	int				refcnt;
+	int				c_sync;
 };
 
 #endif /* __U_UAC1_H */
-- 
2.34.1


