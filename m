Return-Path: <linux-usb+bounces-23964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC7AB7C8B
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 06:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EEC54C6EE3
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 04:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4AB1CD208;
	Thu, 15 May 2025 04:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zB9ixvAo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69BCE55B
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747281793; cv=none; b=Dt9kHBT78h5ZXKPXI2xavQTDchIyALuOaKZZrd9zFIPOmfuFDhOYtIOCUiTDhtX0nQ3GCdaF3GBmCe8YJBnpIEwOpbchhptO8VyHJmqGddh9l838OKsC3gGnu6ICAOvuq1pWkMuDbASTIn3wYXBbEjuYbYwrup8UjPf+wb8wFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747281793; c=relaxed/simple;
	bh=n4uExHzumO1fQwjk2io6q9vLPmqmud+oReW5kLsLRgA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=OFQNI1C20tftrBRw1N5XlI9rMdoP7DutgD0kTVm20Xb6YjiD1uw34un+MJDyljaqHV/H9LRLCq/PjJBitQfWXTEpfWEV9TVzN0YPn1fiUQ27A2ji8qm40qtz432erFMBmhDPPmTBpvY2kSB8EJ4uNkYYgpfvugvrZdw+KsQflhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zB9ixvAo; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7c5cd0f8961so124272085a.1
        for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 21:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747281791; x=1747886591; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i+ZS0urdC4ZHS2t+t45gk4d+KxYXBTgibfbR8Pb/1O4=;
        b=zB9ixvAoJI9yiq8v8uN0rU7luSkjWQQAa6iY+EFO0mbu+SRovpltn9ZLZcM75wzTu3
         hK9rduvXfn1ET3HCG045yXpHXpM1DryqVZRyIX4eKxNfkvTfUC4OukIPszthw5PayQN1
         oTXJoI3VsY8dE5zEoRe1TJvjHUQY4ne0UopqDDJaapFv6QRCCKHbXgU6+DvhB0mmNQ88
         pd13glgVfDRrJX/2tCm6I9DzHEh5WcGOpb8q40RafMo2S1ghPyvstkyztwrWseXJBRUM
         to5YX5ZJnYcIN5ZE1Ed6V0K87WaKHtlfJr9PoziUFj+Ei61vXser2U2l/mnv1o0WhUs2
         Ny9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747281791; x=1747886591;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+ZS0urdC4ZHS2t+t45gk4d+KxYXBTgibfbR8Pb/1O4=;
        b=Jb2CXC+fhMEzcQ3u2lmtRn0Oj1JuV+hF5KEeLNjBc/MEIh7VL7FnmfEQuuZ6IHRsZQ
         KS51z3KagLs6qem8l8vL30+rvD55YGf9sWuyzd0pTmbLtH/90qHa8m6Ibt/heuuSGwMx
         hrXolCAmSIHUOGbPlcVrk1P9CEGeIZb6q2s2+8ZXbtpePnV/hAJpl2KCq5UmfA5IqQB5
         UIrW+LM2ztV0UDHTfk0U2+lzcaKp5hqFGHIFKFtXRmU3zF5I9iCAXa3nj7pajpUpSHTg
         QINlW1j9erfPHPLocRTZfiIhareJUJPAVF9/hGvj6sQKwfQ3N1O7Gj7sBQrpgopdQh98
         VyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0sKXuSQAA3vJ2/uhcgl6jngwpCxt/kWKo/uxqsDHQtco0AJHp6aTyADR8UnRwqFW7bBdC4b5r2EA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfn/xisHj6SJpvvqZd7ye3KXZCHIT6H6D2B0XDwLAyY1EUckHv
	vLhnnnqtm4x81bYG+mnYZHhI07ebBkY1X+nh4yfjZSF+Co6RNRxMJ2ZRCceTCtvg3ZW/1KWkdMF
	aEQ==
X-Google-Smtp-Source: AGHT+IF3Wqyyndyy472LEFKDw4lbcut1iEeIAEVEaDeoESIchpMsKaRDtH0yEOmBJ/KsWHdtaPZ2JicfGs0=
X-Received: from qkbee18.prod.google.com ([2002:a05:620a:8012:b0:7cc:ccf4:e8ca])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:19aa:b0:7c7:bb07:af07
 with SMTP id af79cd13be357-7cd287e2236mr757842285a.22.1747281790848; Wed, 14
 May 2025 21:03:10 -0700 (PDT)
Date: Thu, 15 May 2025 04:02:59 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250515040259.1254356-1-royluo@google.com>
Subject: [PATCH v1 2/2] usb: dwc3: Force full reset on xhci removal
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

During an xhci host controller reset (via `USBCMD.HCRST`), reading DWC3
registers can return zero instead of their actual values. This applies
not only to registers within the xhci memory space but also those in
the broader DWC3 IP block.

By default, the xhci driver doesn't wait for the reset handshake to
complete during teardown. This can cause problems when the DWC3 controller
is operating as a dual role device and is switching from host to device
mode, the invalid register read caused by ongoing HCRST could lead to
gadget mode startup failures and unintended register overwrites.

To mitigate this, enable xhci-full-reset-on-remove-quirk to ensure that
xhci_reset() completes its full reset handshake during xhci removal.

Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/host.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index b48e108fc8fe..ea865898308f 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -126,7 +126,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -182,6 +182,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
+	if (dwc->dr_mode == USB_DR_MODE_OTG)
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-full-reset-on-remove-quirk");
+
 	if (prop_idx) {
 		ret = device_create_managed_software_node(&xhci->dev, props, NULL);
 		if (ret) {
-- 
2.49.0.1045.g170613ef41-goog


