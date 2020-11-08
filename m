Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E21B2AA889
	for <lists+linux-usb@lfdr.de>; Sun,  8 Nov 2020 01:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgKHASh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Nov 2020 19:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgKHASh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Nov 2020 19:18:37 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CB4C0613CF
        for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2020 16:18:37 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id e27so7149865lfn.7
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2020 16:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KKMsswpCnGv0Vxj+BpdUjM//042q2GbNKi3RGaF32eI=;
        b=YFYXxNuP+9YlCC93y7x9pIC3l22rVlapty4gPilpimbR83rheXwvP5usMvxHagMmnp
         5fEXgkM2Euy5waL0eaPd4J9R4/TGkHRjPhS0oRJ4y0N9lFSNGyPpsB2Kx8BtRi++lMaS
         +qI5SHuKV94bvdRAC/Bw9ZkUTOsmUGVVKXYnHpQwhApbfTHCMPGNElZLnw+8u/Cynicn
         O9SN7dEPjlfRUKvyDn5VUrRQIq6+hvzDC9LB7w6RIJC3BkYaDO7DiXYsbKscDJ0tHrZp
         Mh3w7gW/5rYROyvSWGUmBovoRqCBW+6N1fa0CgRryAHi/d1J4wugz9UOQRWOQYhUk4mz
         +XWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KKMsswpCnGv0Vxj+BpdUjM//042q2GbNKi3RGaF32eI=;
        b=IAbCNeSE6MjFk/XSAyC39yIzSAvoIQfRJWjjI8ywc0aTztHoeRBlveVyU0N5Rq1MVV
         9kHXgPNwISh6M8cGXkhQB8IKYGRKVUohlQPGrGEkFLEasm2hKYiX/emkMii5soQLYNq+
         8FGvgwXEBzM0CkqU283NuFkf79+a31akwUgzo7FSVJH5+TFjTWy9fzDFzOJV78mAO2wR
         BtJXIJgPrutNQ+nTDvovz1+h8bLVYvrk2trJruIqPTp8BxyZKH14K+UNJWHEq8xk5JNa
         3G0P76lGDQFFc001906oaHqbLOI0AFHj0OQxNB4bHP20LNEbkoOGm/hQfcQEeHR7Ppql
         mbtg==
X-Gm-Message-State: AOAM532KopKynE8SWlAkwyvd0o4Hfep3ShC5vAO3TTYBB4QrTgMsCGP7
        mKor2GKD4Bm1+7d6DL6/78dG2/s47ro=
X-Google-Smtp-Source: ABdhPJzO+5xyL8Zdpw6O0P3W3J7TkDGljdTTdavtIB+ot0oEKWfAY7xubTY1CTuteKJzJH33oBqm3A==
X-Received: by 2002:a05:6512:304b:: with SMTP id b11mr3370679lfb.351.1604794715478;
        Sat, 07 Nov 2020 16:18:35 -0800 (PST)
Received: from localhost ([80.64.86.40])
        by smtp.gmail.com with ESMTPSA id y3sm880372ljc.131.2020.11.07.16.18.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 07 Nov 2020 16:18:34 -0800 (PST)
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: [PATCH 1/3] usb: gadget: f_uac2/u_audio: add feedback endpoint support
Date:   Sun,  8 Nov 2020 02:18:29 +0200
Message-Id: <1604794711-8661-2-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
---
 drivers/usb/gadget/function/f_uac2.c  |  34 +++++++++-
 drivers/usb/gadget/function/u_audio.c | 124 +++++++++++++++++++++++++++++++++-
 drivers/usb/gadget/function/u_audio.h |   3 +
 3 files changed, 158 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index fb9b875..a57bf77 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -237,7 +237,7 @@ enum {
 	.bDescriptorType = USB_DT_INTERFACE,
 
 	.bAlternateSetting = 1,
-	.bNumEndpoints = 1,
+	.bNumEndpoints = 2,
 	.bInterfaceClass = USB_CLASS_AUDIO,
 	.bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
 	.bInterfaceProtocol = UAC_VERSION_2,
@@ -296,6 +296,27 @@ enum {
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
+
 /* Audio Streaming IN Interface - Alt0 */
 static struct usb_interface_descriptor std_as_in_if0_desc = {
 	.bLength = sizeof std_as_in_if0_desc,
@@ -392,6 +413,7 @@ enum {
 	(struct usb_descriptor_header *)&as_out_fmt1_desc,
 	(struct usb_descriptor_header *)&fs_epout_desc,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
+	(struct usb_descriptor_header *)&fs_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -422,6 +444,7 @@ enum {
 	(struct usb_descriptor_header *)&as_out_fmt1_desc,
 	(struct usb_descriptor_header *)&hs_epout_desc,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
+	(struct usb_descriptor_header *)&hs_epin_fback_desc,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -541,6 +564,7 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 		fs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
 		fs_audio_desc[i++] = USBDHDR(&fs_epout_desc);
 		fs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
+		fs_audio_desc[i++] = USBDHDR(&fs_epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		fs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -574,6 +598,7 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 		hs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
 		hs_audio_desc[i++] = USBDHDR(&hs_epout_desc);
 		hs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
+		hs_audio_desc[i++] = USBDHDR(&hs_epin_fback_desc);
 	}
 	if (EPIN_EN(opts)) {
 		hs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
@@ -681,6 +706,12 @@ static void setup_descriptor(struct f_uac2_opts *opts)
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
@@ -699,6 +730,7 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 				le16_to_cpu(hs_epout_desc.wMaxPacketSize));
 
 	hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
+	hs_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
 	hs_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
 
 	setup_descriptor(uac2_opts);
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index e6d32c5..33c9288 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -43,6 +43,10 @@ struct uac_rtd_params {
 	unsigned int max_psize;	/* MaxPacketSize of endpoint */
 	struct uac_req *ureq;
 
+	struct usb_request *req_fback; /* Feedback endpoint request */
+	unsigned int ffback; /* Real frequency reported by feedback endpoint */
+	bool fb_ep_enabled; /* if the ep is enabled */
+
 	spinlock_t lock;
 };
 
@@ -76,6 +80,35 @@ struct snd_uac_chip {
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
+		 *
+		 * Prevent integer overflow by calculating in Q12.13 fromat and
+		 * then shifting to Q16.16
+		 */
+		ff = DIV_ROUND_UP((freq << 13), (8*1000)) << 3;
+	}
+	*(__le32 *)buf = cpu_to_le32(ff);
+}
+
 static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	unsigned int pending;
@@ -182,6 +215,36 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
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
+	spin_lock_irqsave(&prm->lock, flags);
+	u_audio_set_fback_frequency(audio_dev->gadget->speed,
+				    prm->ffback, req->buf);
+	spin_unlock_irqrestore(&prm->lock, flags);
+
+	if (usb_ep_queue(ep, req, GFP_ATOMIC))
+		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
+}
+
 static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_uac_chip *uac = snd_pcm_substream_chip(substream);
@@ -346,14 +409,33 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
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
@@ -386,6 +468,42 @@ int u_audio_start_capture(struct g_audio *audio_dev)
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
@@ -394,6 +512,8 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
 
+	if (audio_dev->in_ep_fback)
+		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
 	free_ep(&uac->c_prm, audio_dev->out_ep);
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_capture);
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 5ea6b86..53e6baf 100644
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
1.9.1

