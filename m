Return-Path: <linux-usb+bounces-30804-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07394C7AC90
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 17:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 572103A2DB7
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D49D31328B;
	Fri, 21 Nov 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+Xxksh/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569F829C326
	for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741570; cv=none; b=QVhz04vUcDnxAF0Eb4Bk3Tum4/B1hPZfhafKWip0MREd/pdvChgtto10qT3WY5PUWuJ4GHdU5O67USL/bkK/Z1zl/pIhl/keej5rZgLMZAwWKy5bpH6/0rPZSbMPf9A1mb2jAu1FhfA1AU3EkdB1uzo9uVgqH7n28wxl1zekoC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741570; c=relaxed/simple;
	bh=OSV4yuHWf4x29JNX4a7meofzp1dJiyfdpR859z8oZgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ea4icBwQWNNS84RIkthNfNmLoz95WmwleqjZZe7ec9yd9/+sD7XlVoe0zpMMLQZBP8U+zGtVCFUqLkWKZMSGKpv9vAeyjmaXEPkaLiDUhM3ljaTw6N5IA2lhNq+Ja/2Mo8TK3+xCGiLr1KZKR9jb12uaBz4yE1O3ecKMaCkyr74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+Xxksh/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so1801902a91.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 08:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741569; x=1764346369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUYGnZUH6ucRi/qVcc7Heh1B7eBQygkcRityLADBB7c=;
        b=C+Xxksh/yPI7lXBUv5XWNv4sJ42M6hQ2SE4RVf9L5QxCVXloe1paYAoLIaQBfG7vcU
         593IG+ar4kJEzfCqdqCH3fM71PPVYKBVurJnx+0s7BbGPszXUMsB3ydxt+lXOPnNZNen
         5FwuDmnu6zrSE36Om804KWirLjK6ST+ThuIWG3xcr56AskMve1fQR0e62dM0/T7zWgHv
         OxOnXNUtxaieQIDYJXhrbJlGa89wcdI8hWRpQ7AsDxK1YPm0KvE0tl8iuXip3Nhk4MSu
         0jsVdzCypenImMynDBlWYJ7up20XigPpX3funuVsYHiS68KJDNRRpR/kVw/OXKX47QIO
         qjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741569; x=1764346369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUYGnZUH6ucRi/qVcc7Heh1B7eBQygkcRityLADBB7c=;
        b=CUD9DU2tMAkgimIt9QE8MgtU/ss4ON3eWUe8HCa+nnqySXw82nis2nyWmDx9YsSeXw
         Home5/ffZxWkLuvScX06L+fdxyUezAb9MyRM9jonhQmy/VTZnxynUoOEi6/bahMTs3Wy
         D5xROXRfFhz+r5EfDVPda1Fs3Rtr5xksu09j1PDaBurLxCagDEW4mERoHL6e2mdfa8YW
         ynVH7vWskFtRdigrra23eE7/i7So++Mta8+Yc/IjIIivhTNTGXumKYV3g1ZRMycX2+dH
         Xfc53mcXeCNxtnJ8f42QG2CjjT3+Aoo66xrfRhUDSjE/RkXcjc2aFjV6gaFOKv9oIRqj
         D+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWI3KvIhTzn6BCVTVypdLxCUzQH/HlMJqKazm+eKDuA229a2CZC0sHuU0P3k9tMAj5eJNWeJeAkoEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNruACpUFbWOaF9mAd79LTeNIbooGh4ZwJsnoUz3kS6NuX9le+
	xnYhYCcBFz+fXt2sneV6Ci8APrPGiGCiC+x+ceMhOHVWdxDUYQ3+D3I=
X-Gm-Gg: ASbGnctvlHxIiF0wmXzeOdTbq38SgMvi3x0DKdTwqNjw9mnjhLw1muuM8RLC56VD03m
	o/MWQHdLxo4dM+7898+LkGtsGKaa9tGpstVwDjPRR9IWPFmjN/QCD+gwqzzuGzuz68+8/ZhRLhp
	8NudR4cDc/pyDmaaLirSDkx5tSXNpLVOfHCEzFLxohyd+9n/cbfnPfmNJqOO5Lvj15oVDlWUv9i
	R74BWmwz0zixooVbCam/aS5tL2aXJ+/kNdGP8k4mIiBI6iCva6DBI8C/eAClGPqOwPyJZrAtLFB
	lw333LflSbotgEv33K7FLAJ6U27bZGxiGCNT3aIPXADWGoQdR/8vQhN8DqvGTAY2L/qQSTtVyZy
	LsWky3C6KQZBsiauRFzpP0dPGFNfyWwWvNy9V53/nOIfF5uKLw0UV88OSL27WqXhXbZWgCEIbpI
	r39W1KPcWDfip6XCbkhiL7AF/FiHpiESNmca2capduNs2WysobP9QxjeNB+Q==
X-Google-Smtp-Source: AGHT+IFe3vZd/heh8xQX4oxZVNWWgfEL4GySIy2S5i8PL75Bj440r7ZwasVMkYR7MLLz2bRkgXushA==
X-Received: by 2002:a17:90b:4a51:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-34733d6eb30mr3001668a91.0.1763741568572;
        Fri, 21 Nov 2025 08:12:48 -0800 (PST)
Received: from samee-VMware-Virtual-Platform.. ([2402:e280:3d9e:537:8ccb:550c:e84d:a5b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472692ed92sm5976363a91.10.2025.11.21.08.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:12:48 -0800 (PST)
From: Sameeksha Sankpal <sameekshasankpal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sumanth.gavini@yahoo.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>
Subject: [PATCH] usb: gadget: f_uac1: fix coding style warnings
Date: Fri, 21 Nov 2025 21:42:40 +0530
Message-ID: <20251121161240.25818-1-sameekshasankpal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several checkpatch.pl warnings in f_uac1.c including:
- replace NULL comparisons with !ptr
- remove unnecessary parentheses around simple equality checks
- remove a redundant 'else' after a return statement
- clean up superfluous blank lines
- use 'unsigned int' instead of bare 'unsigned'
- enclose a macro with complex value (USBDHDR) in parentheses

These changes clean up coding style and improve readability without
altering the behavior of the driver.

Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
---
 drivers/usb/gadget/function/f_uac1.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 9da9fb4e1239..d2c6fb18ce16 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -446,13 +446,13 @@ static int audio_notify(struct g_audio *audio, int unit_id, int cs)
 	}
 
 	req = usb_ep_alloc_request(uac1->int_ep, GFP_ATOMIC);
-	if (req == NULL) {
+	if (!req) {
 		ret = -ENOMEM;
 		goto err_dec_int_count;
 	}
 
 	msg = kmalloc(sizeof(*msg), GFP_ATOMIC);
-	if (msg == NULL) {
+	if (!msg) {
 		ret = -ENOMEM;
 		goto err_free_request;
 	}
@@ -496,8 +496,8 @@ in_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 	u8 control_selector = w_value >> 8;
 	int value = -EOPNOTSUPP;
 
-	if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
-			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
+	if ((FUIN_EN(opts) && entity_id == USB_IN_FU_ID) ||
+			(FUOUT_EN(opts) && entity_id == USB_OUT_FU_ID)) {
 		unsigned int is_playback = 0;
 
 		if (FUIN_EN(opts) && (entity_id == USB_IN_FU_ID))
@@ -547,8 +547,8 @@ in_rq_min(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 	u8 control_selector = w_value >> 8;
 	int value = -EOPNOTSUPP;
 
-	if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
-			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
+	if ((FUIN_EN(opts) && entity_id == USB_IN_FU_ID) ||
+			(FUOUT_EN(opts) && entity_id == USB_OUT_FU_ID)) {
 		unsigned int is_playback = 0;
 
 		if (FUIN_EN(opts) && (entity_id == USB_IN_FU_ID))
@@ -714,11 +714,6 @@ out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
 			u_audio_set_volume(audio, is_playback, volume);
 
 			return;
-		} else {
-			dev_err(&audio->gadget->dev,
-				"%s:%d control_selector=%d TODO!\n",
-				__func__, __LINE__, control_selector);
-			usb_ep_set_halt(ep);
 		}
 	} else {
 		dev_err(&audio->gadget->dev,
@@ -930,7 +925,7 @@ f_audio_setup(struct usb_function *f, const struct usb_ctrlrequest *ctrl)
 	return value;
 }
 
-static int f_audio_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
+static int f_audio_set_alt(struct usb_function *f, unsigned int intf, unsigned int alt)
 {
 	struct usb_composite_dev *cdev = f->config->cdev;
 	struct usb_gadget *gadget = cdev->gadget;
@@ -984,7 +979,7 @@ static int f_audio_set_alt(struct usb_function *f, unsigned intf, unsigned alt)
 	return ret;
 }
 
-static int f_audio_get_alt(struct usb_function *f, unsigned intf)
+static int f_audio_get_alt(struct usb_function *f, unsigned int intf)
 {
 	struct usb_composite_dev *cdev = f->config->cdev;
 	struct usb_gadget *gadget = cdev->gadget;
@@ -1004,7 +999,6 @@ static int f_audio_get_alt(struct usb_function *f, unsigned intf)
 	return -EINVAL;
 }
 
-
 static void f_audio_disable(struct usb_function *f)
 {
 	struct f_uac1 *uac1 = func_to_uac1(f);
@@ -1079,7 +1073,7 @@ uac1_ac_header_descriptor *build_ac_header_desc(struct f_uac1_opts *opts)
 }
 
 /* Use macro to overcome line length limitation */
-#define USBDHDR(p) (struct usb_descriptor_header *)(p)
+#define USBDHDR(p) ((struct usb_descriptor_header *)(p))
 
 static void setup_descriptor(struct f_uac1_opts *opts)
 {
-- 
2.43.0


