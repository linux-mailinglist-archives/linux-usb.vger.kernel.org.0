Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D3739AD67
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 00:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFCWEW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 18:04:22 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:41560 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCWEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Jun 2021 18:04:21 -0400
Received: by mail-wm1-f46.google.com with SMTP id l11-20020a05600c4f0bb029017a7cd488f5so4544176wmq.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Jun 2021 15:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjLxwJTBVB9yc/9XL+uip7upmycpCMFQow54ZN1KIYs=;
        b=uEKNGkdPcBMMAPf3T4yFQFpR1bTg7cCfMNmGpZo3pGBmxfdOCBqsFlQzazah7b9X6t
         dVGcgl77b+Xmf8yKbzaLbln1jUUtBJPRJ0ADFFV8ZW9H09ACkOdHoTMSnEcPcsSKg9ol
         sDQPwmmGQcOZOyBMXgZE8ssz/oNIjnetj+yS5y68uxt47U9Ra9fzRw4olWTWH6GO0v0q
         9ZzwxSLAhXldLSP/ueayYNU9/VfN/XoD33tiwe5+9azDCur9NkFYuC/+iiJfBGD+NdCY
         e4RxYWiCfhdkMOTzt9Vva9zcuJu9gOpIitDSIabOzwd7NBI2LkPpAphXcHSzB8W6Syot
         Xg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjLxwJTBVB9yc/9XL+uip7upmycpCMFQow54ZN1KIYs=;
        b=GwpMpYi3oOhG4poc2kEBHcRUPaVnGBdCVJGV50gmJYSJnFcYvMjnaulD1jf2IBXsPm
         F5JRCWwNGs7TNANEssO1PdpDwcN7mRlU6rMM9nSbMzfXCabONWk8aqQe+DJCeHh92fPM
         IBisbvyZLNvgqEs4u92CQO26SAsF2Jmq/Qmx4O4916cYfev4zkYOkZ9+uhMWkvtA6li/
         BoFWmObJYCbtU/rhqgLB12znDtHRixEN7cgZVRWb3abRZ1fyyQixU3eehOy6G1m6JxTF
         hiByl3OO8+LUvbeRytHYSlbYzLRhezZ0Pj5oPekWE27mIk54i6YshtpYgIH9+jLhBcV7
         wkew==
X-Gm-Message-State: AOAM530RG7Hv72Kh0I+8prPAkF3V7NBtPXYv/nzKXKSSboYkOM4InsQt
        AfXOxW6+AsTAoJX6kd6p4IPl/Q==
X-Google-Smtp-Source: ABdhPJztGTkFgtHSAd8DSLkwCLYQ0NuSyMd6flO9DLZyfgbyo2Jp0KZbhBs4d2U2IuWqlZEBb+Gs8Q==
X-Received: by 2002:a1c:41c5:: with SMTP id o188mr513473wma.60.1622757679530;
        Thu, 03 Jun 2021 15:01:19 -0700 (PDT)
Received: from localhost.localdomain ([2a04:cec0:11bf:2693:b60f:d58b:e3f4:1a80])
        by smtp.googlemail.com with ESMTPSA id s128sm4078404wme.6.2021.06.03.15.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:01:19 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 1/3] usb: gadget: f_uac2/u_audio: add feedback endpoint support
Date:   Fri,  4 Jun 2021 00:01:02 +0200
Message-Id: <20210603220104.1216001-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.32.0.rc0
In-Reply-To: <20210603220104.1216001-1-jbrunet@baylibre.com>
References: <20210603220104.1216001-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

As per USB and UAC2 specs, asynchronous audio sink endpoint
requires explicit synchronization mechanism (Isochronous
Feedback Endpoint)

Implement feedback companion endpoint for ISO OUT endpoint

This patch adds all required infrastructure and USB requests
handling for feedback endpoint. Syncrhonization itself is
still dummy (feedback ep always reports 'nomimal frequency'
 e.g. no adjustement is needed). This satisfies hosts that
require feedback endpoint (like Win10) and poll it periodically

Actual synchronization mechanism should be implemented
separately

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/gadget/function/f_uac2.c  |  49 ++++++++++-
 drivers/usb/gadget/function/u_audio.c | 119 +++++++++++++++++++++++++-
 drivers/usb/gadget/function/u_audio.h |   3 +
 3 files changed, 168 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 7aa4c8bc5a1a..5d63244ba319 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -240,7 +240,7 @@ static struct usb_interface_descriptor std_as_out_if1_desc = {
 	.bDescriptorType = USB_DT_INTERFACE,
 
 	.bAlternateSetting = 1,
-	.bNumEndpoints = 1,
+	.bNumEndpoints = 2,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
 	.bInterfaceProtocol = UAC_VERSION_2,
@@ -317,6 +317,37 @@ static struct uac2_iso_endpoint_descriptor as_iso_out_desc = {
 	.wLockDelay = 0,
 };
 
+/* STD AS ISO IN Feedback Endpoint */
+static struct usb_endpoint_descriptor fs_epin_fback_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bEndpointAddress = USB_DIR_IN,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
+	.wMaxPacketSize = cpu_to_le16(3),
+	.bInterval = 1,
+};
+
+static struct usb_endpoint_descriptor hs_epin_fback_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
+	.wMaxPacketSize = cpu_to_le16(4),
+	.bInterval = 4,
+};
+
+static struct usb_endpoint_descriptor ss_epin_fback_desc = {
+	.bLength = USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType = USB_DT_ENDPOINT,
+
+	.bEndpointAddress = USB_DIR_IN,
+	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
+	.wMaxPacketSize = cpu_to_le16(4),
+	.bInterval = 4,
+};
+
+
 /* Audio Streaming IN Interface - Alt0 */
 static struct usb_interface_descriptor std_as_in_if0_desc = {
 	.bLength = sizeof std_as_in_if0_desc,
@@ -431,6 +462,7 @@ static struct usb_descriptor_header *fs_audio_desc[] = {
 	(struct usb_descriptor_header *)&as_out_fmt1_desc,
 	(struct usb_descriptor_header *)&fs_epout_desc,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
+	(struct usb_descriptor_header *)&fs_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -461,6 +493,7 @@ static struct usb_descriptor_header *hs_audio_desc[] = {
 	(struct usb_descriptor_header *)&as_out_fmt1_desc,
 	(struct usb_descriptor_header *)&hs_epout_desc,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
+	(struct usb_descriptor_header *)&hs_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -492,6 +525,7 @@ static struct usb_descriptor_header *ss_audio_desc[] = {
 	(struct usb_descriptor_header *)&ss_epout_desc,
 	(struct usb_descriptor_header *)&ss_epout_desc_comp,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
+	(struct usb_descriptor_header *)&ss_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -568,22 +602,26 @@ static void setup_headers(struct f_uac2_opts *opts,
 	struct usb_ss_ep_comp_descriptor *epin_desc_comp = NULL;
 	struct usb_endpoint_descriptor *epout_desc;
 	struct usb_endpoint_descriptor *epin_desc;
+	struct usb_endpoint_descriptor *epin_fback_desc;
 	int i;
 
 	switch (speed) {
 	case USB_SPEED_FULL:
 		epout_desc = &fs_epout_desc;
 		epin_desc = &fs_epin_desc;
+		epin_fback_desc = &fs_epin_fback_desc;
 		break;
 	case USB_SPEED_HIGH:
 		epout_desc = &hs_epout_desc;
 		epin_desc = &hs_epin_desc;
+		epin_fback_desc = &hs_epin_fback_desc;
 		break;
 	default:
 		epout_desc = &ss_epout_desc;
 		epin_desc = &ss_epin_desc;
 		epout_desc_comp = &ss_epout_desc_comp;
 		epin_desc_comp = &ss_epin_desc_comp;
+		epin_fback_desc = &ss_epin_fback_desc;
 	}
 
 	i = 0;
@@ -611,6 +649,7 @@ static void setup_headers(struct f_uac2_opts *opts,
 			headers[i++] = USBDHDR(epout_desc_comp);
 
 		headers[i++] = USBDHDR(&as_iso_out_desc);
+		headers[i++] = USBDHDR(epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		headers[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -844,6 +883,12 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 			return -ENODEV;
 		}
+		agdev->in_ep_fback = usb_ep_autoconfig(gadget,
+						       &fs_epin_fback_desc);
+		if (!agdev->in_ep_fback) {
+			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+			return -ENODEV;
+		}
 	}
 
 	if (EPIN_EN(uac2_opts)) {
@@ -867,8 +912,10 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 				le16_to_cpu(ss_epout_desc.wMaxPacketSize));
 
 	hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
+	hs_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
 	hs_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
 	ss_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
+	ss_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
 	ss_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
 
 	setup_descriptor(uac2_opts);
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 5fbceee897a3..f637ebec80b0 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -38,6 +38,10 @@ struct uac_rtd_params {
 	unsigned int max_psize;	/* MaxPacketSize of endpoint */
 
 	struct usb_request **reqs;
+
+	struct usb_request *req_fback; /* Feedback endpoint request */
+	unsigned int ffback; /* Real frequency reported by feedback endpoint */
+	bool fb_ep_enabled; /* if the ep is enabled */
 };
 
 struct snd_uac_chip {
@@ -70,6 +74,32 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 	.periods_min = MIN_PERIODS,
 };
 
+static void u_audio_set_fback_frequency(enum usb_device_speed speed,
+					unsigned int freq, void *buf)
+{
+	u32 ff = 0;
+
+	if (speed == USB_SPEED_FULL) {
+		/*
+		 * Full-speed feedback endpoints report frequency
+		 * in samples/microframe
+		 * Format is encoded in Q10.10 left-justified in the 24 bits,
+		 * so that it has a Q10.14 format.
+		 */
+		ff = DIV_ROUND_UP((freq << 14), 1000);
+	} else {
+		/*
+		 * High-speed feedback endpoints report frequency
+		 * in samples/microframe.
+		 * Format is encoded in Q12.13 fitted into four bytes so that
+		 * the binary point is located between the second and the third
+		 * byte fromat (that is Q16.16)
+		 */
+		ff = DIV_ROUND_UP((freq << 13), 1000);
+	}
+	*(__le32 *)buf = cpu_to_le32(ff);
+}
+
 static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	unsigned int pending;
@@ -173,6 +203,34 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
 }
 
+static void u_audio_iso_fback_complete(struct usb_ep *ep,
+				       struct usb_request *req)
+{
+	struct uac_rtd_params *prm = req->context;
+	struct snd_uac_chip *uac = prm->uac;
+	struct g_audio *audio_dev = uac->audio_dev;
+	int status = req->status;
+	unsigned long flags;
+
+	/* i/f shutting down */
+	if (!prm->fb_ep_enabled || req->status == -ESHUTDOWN)
+		return;
+
+	/*
+	 * We can't really do much about bad xfers.
+	 * Afterall, the ISOCH xfers could fail legitimately.
+	 */
+	if (status)
+		pr_debug("%s: iso_complete status(%d) %d/%d\n",
+			__func__, status, req->actual, req->length);
+
+	u_audio_set_fback_frequency(audio_dev->gadget->speed,
+				    prm->ffback, req->buf);
+
+	if (usb_ep_queue(ep, req, GFP_ATOMIC))
+		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
+}
+
 static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_uac_chip *uac = snd_pcm_substream_chip(substream);
@@ -335,14 +393,33 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
 		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
 }
 
+static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_ep *ep)
+{
+	struct snd_uac_chip *uac = prm->uac;
+
+	if (!prm->fb_ep_enabled)
+		return;
+
+	prm->fb_ep_enabled = false;
+
+	if (prm->req_fback) {
+		usb_ep_dequeue(ep, prm->req_fback);
+		kfree(prm->req_fback->buf);
+		usb_ep_free_request(ep, prm->req_fback);
+		prm->req_fback = NULL;
+	}
+
+	if (usb_ep_disable(ep))
+		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
+}
 
 int u_audio_start_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 	struct usb_gadget *gadget = audio_dev->gadget;
 	struct device *dev = &gadget->dev;
-	struct usb_request *req;
-	struct usb_ep *ep;
+	struct usb_request *req, *req_fback;
+	struct usb_ep *ep, *ep_fback;
 	struct uac_rtd_params *prm;
 	struct uac_params *params = &audio_dev->params;
 	int req_len, i;
@@ -374,6 +451,42 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
 	}
 
+	ep_fback = audio_dev->in_ep_fback;
+	if (!ep_fback)
+		return 0;
+
+	/* Setup feedback endpoint */
+	config_ep_by_speed(gadget, &audio_dev->func, ep_fback);
+	prm->fb_ep_enabled = true;
+	usb_ep_enable(ep_fback);
+	req_len = ep_fback->maxpacket;
+
+	req_fback = usb_ep_alloc_request(ep_fback, GFP_ATOMIC);
+	if (req_fback == NULL)
+		return -ENOMEM;
+
+	prm->req_fback = req_fback;
+	req_fback->zero = 0;
+	req_fback->context = prm;
+	req_fback->length = req_len;
+	req_fback->complete = u_audio_iso_fback_complete;
+
+	req_fback->buf = kzalloc(req_len, GFP_ATOMIC);
+	if (!req_fback->buf)
+		return -ENOMEM;
+
+	/*
+	 * Configure the feedback endpoint's reported frequency.
+	 * Always start with original frequency since its deviation can't
+	 * be meauserd at start of playback
+	 */
+	prm->ffback = params->c_srate;
+	u_audio_set_fback_frequency(audio_dev->gadget->speed,
+				    prm->ffback, req_fback->buf);
+
+	if (usb_ep_queue(ep_fback, req_fback, GFP_ATOMIC))
+		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(u_audio_start_capture);
@@ -382,6 +495,8 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	if (audio_dev->in_ep_fback)
+		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
 	free_ep(&uac->c_prm, audio_dev->out_ep);
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_capture);
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 5ea6b86f1fda..53e6baf55cbf 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -30,7 +30,10 @@ struct g_audio {
 	struct usb_gadget *gadget;
 
 	struct usb_ep *in_ep;
+
 	struct usb_ep *out_ep;
+	/* feedback IN endpoint corresponding to out_ep */
+	struct usb_ep *in_ep_fback;
 
 	/* Max packet size for all in_ep possible speeds */
 	unsigned int in_ep_maxpsize;
-- 
2.32.0.rc0

