Return-Path: <linux-usb+bounces-25368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7F7AEFE8B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 17:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E1833AA202
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 15:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E01279DBD;
	Tue,  1 Jul 2025 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b="Beb2niim"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F627702D
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384495; cv=none; b=ftFEXLRAw9TQjL1qrYyNGwwvA1JElg4k5RKuI+4x8ORoqO76DbpF4KVe8YD1MD0XoV+mHuivxB+wvBBKrFI6RepfHNZPgaijR1X7vXQNp7lmhahg6hOCL92qV+CuMQYmLELPFl/uzqaCDwKWUSR67MABgMEJ81UkkTr5zisX8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384495; c=relaxed/simple;
	bh=vssQDmpqsqtEsVZ+J0Rxu/Bc2+tTBwvSxd1dgCxlXZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=huafCYeavzyi6cZOanLqWD+i1LWWiG9U4TIqDRuZubwnIlTQrYcL/GwBLh9UptqCUvYIOrt2pRnew5sOXujQfwiWzo6UH/CqLIe6qfoF79krm4QnI6AVrKDAVcYGmEVrum1WIST8fAjosIWykxFtCerpPItXE3745kIXjNo7Lh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com; spf=pass smtp.mailfrom=zetier.com; dkim=pass (2048-bit key) header.d=zetier.com header.i=@zetier.com header.b=Beb2niim; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zetier.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zetier.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748e63d4b05so2268778b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zetier.com; s=gm; t=1751384493; x=1751989293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=59de6pmFOQy/rScsXfRhVQYqTrbVpesPpP5fOBkEBh8=;
        b=Beb2niimVluHZ09GrFiQXJ99dprdGuW82OxY4ID53EcM4S4SkLtL8Y/kafSu1WjAir
         sTttOBlxOW9i4Re8i8k0bgdm1OELc8LFMrOQVBjj+H+hFNgNmxuIXSBp35pDLNSUzOjz
         sHe5WOzapa5jGF7zJJgWGqJE5SCoHB2MGPkIr/bCwEZ4bbug8FrXrB/RZ8ndsiWN4TXz
         W3JoGOhkbg/37W2mDGUFfZCCgh1DT9PQQwW2+QvTwSDlUa3VI/Fqj4OTXuvKOTYmejyU
         K1xdsqH75/Wu2JQP//d/iv7BR8oKHbqXJyZa/5CjoDJRygf9Bvl1iX58qYVPs0XVz5nv
         Za6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384493; x=1751989293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59de6pmFOQy/rScsXfRhVQYqTrbVpesPpP5fOBkEBh8=;
        b=NmzhAZ6IolExbi/EVYd69dUEGBfIWyqfoxSQ09vAdfkPbh9R1DyMkq/R0FFLipimdN
         1t+3odTIRGWhXl7e5RrirPrbkPIUiCiXrd0kZ2cjg5I4SbfnITvgq6oJmpYTalcvyr1Q
         3d36kzD3WYAylWTMBJqPszXboAD8CPigIouPy4PhNOdmPcA1A6IeMR7dBT5nWpCA/7aR
         hVfMqIvRTFwGGrL7eTepKbDeQ2OibAv7w22GZdNsImSiwAZvamDOgH98VfCbUcIOKkYy
         9V1+J1jKuzDwA0HUjsD0T/b36cENnriWJNf9uzf9odFLxa5wK2/o/15CT4ZTk9WhPn69
         BXwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/rMFCv7dWmU9mRRLDH+La4rtdpMMFaTWumC5C2URr3vi467iXdR3YevcTYe56RED1tWwsygNqQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPhVb/WX7A5yIi9ycPxy4hwr60S5g9HnODJmO/qj4BIzkUZLGe
	c6jPO4A/jWfR9lhh711TCvKv75gMFUA/3f0iW7c5J5ZTvW7yZLi4Qrv7uVb9WuMPnRqyhXRcqae
	hpWpQ7Q==
X-Gm-Gg: ASbGncujehHx/VFsmhUHHa6QEfVBjT082okvWU2bUxVKW+1W4FcPDHxGKXqTypNNnNw
	LH7qVxzQ81c4It08OhKt7GnXAmTui5zw9l7qB9K/hxlLhjt4F3pPGboB4MT2o2vOqFwO7hIa3QW
	FbQQFp4u+yABurWOQ9f7YIZ0eozqXfO8QeLJBORJSqX9eSkZr8F7bRb03QR7VEwa4Ca5F+mj6x6
	dMHvq5qG+/oFvrn1IprS4SwvDX/KpsjxLYC8PA34KTW7eaL2XzxgLv/egYW4Hrvav+8UI3SuIW2
	da2k+bX5U06EQppWBXJdDTXgvwOMSz0gRbi3Y4prPW0TwS7XrpC707r7NAg7b+A+Yv6J2TwyP2+
	b4QtNRinheAA04VaQg8+GC61FM9dxWnF/1ZQlbid8PbxJ3ZzwOrN1bpcY5T4QoSwrx1M12ZA=
X-Google-Smtp-Source: AGHT+IEclQh5sNqNxGCJ9QcJrals8daG9Os0Vgw+JP1Dhlzs2OqOepPslgK8FbWpG+V5py//MrkbPw==
X-Received: by 2002:a05:6a00:2447:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-74af6e892d6mr27354642b3a.3.1751384493356;
        Tue, 01 Jul 2025 08:41:33 -0700 (PDT)
Received: from system.mynetworksettings.com (pool-71-126-161-43.washdc.fios.verizon.net. [71.126.161.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5806b52sm12574910b3a.169.2025.07.01.08.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:41:32 -0700 (PDT)
From: Drew Hamilton <drew.hamilton@zetier.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bin Liu <b-liu@ti.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Hamilton <drew.hamilton@zetier.com>,
	stable@vger.kernel.org,
	Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Subject: [PATCH v2] usb: musb: fix gadget state on disconnect
Date: Tue,  1 Jul 2025 11:41:26 -0400
Message-Id: <20250701154126.8543-1-drew.hamilton@zetier.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unplugging the USB cable or disconnecting a gadget in usb peripheral mode with
echo "" > /sys/kernel/config/usb_gadget/<your_gadget>/UDC,
/sys/class/udc/musb-hdrc.0/state does not change from USB_STATE_CONFIGURED.

Testing on dwc2/3 shows they both update the state to USB_STATE_NOTATTACHED.

Add calls to usb_gadget_set_state in musb_g_disconnect and musb_gadget_stop
to fix both cases.

Fixes: 49401f4169c0 ("usb: gadget: introduce gadget state tracking")
Cc: stable@vger.kernel.org
Co-authored-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Signed-off-by: Drew Hamilton <drew.hamilton@zetier.com>
---
Changes in v2:
- Cleaned up changelog and added Fixes and Cc tags
---
 drivers/usb/musb/musb_gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 6869c58367f2..caf4d4cd4b75 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1913,6 +1913,7 @@ static int musb_gadget_stop(struct usb_gadget *g)
 	 * gadget driver here and have everything work;
 	 * that currently misbehaves.
 	 */
+	usb_gadget_set_state(g, USB_STATE_NOTATTACHED);
 
 	/* Force check of devctl register for PM runtime */
 	pm_runtime_mark_last_busy(musb->controller);
@@ -2019,6 +2020,7 @@ void musb_g_disconnect(struct musb *musb)
 	case OTG_STATE_B_PERIPHERAL:
 	case OTG_STATE_B_IDLE:
 		musb_set_state(musb, OTG_STATE_B_IDLE);
+		usb_gadget_set_state(&musb->g, USB_STATE_NOTATTACHED);
 		break;
 	case OTG_STATE_B_SRP_INIT:
 		break;
-- 
2.34.1


