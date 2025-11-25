Return-Path: <linux-usb+bounces-30914-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E65C85BFE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 16:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B5291346AC7
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 15:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FE1328259;
	Tue, 25 Nov 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG2wzfEk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB8D328257
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 15:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084201; cv=none; b=KnUdgLBXAiVwRVFMQvmkD77XeJeXVsufBpH4xB8UZTR5XfzDWbJEZXzVPDcgXcXl322jFCiaqEcJijnHG5HBH3MoNuaGXFvxs5UvsJ84weGbNje6Pw4L+o2TQVgzgP3z4qOJad0vpcJ0/gTg5iADSd01CU8K4M5RL62ZwAQWxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084201; c=relaxed/simple;
	bh=cZKCDok2bvgHpy/QIdyMpaY5kiMPfYKS7NyBSXZn3R0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j58QrR8sPZ684ZdoWLOX18EVmPfjhI0ozgVCI77wlAtHhotqpjCDyaTtPrIjUghqEt3fQkrFcBXjVFTqgT6RZTE4mPqa9wU2osV4UqVS7cUrpuZPI9sVCMIrrt51C9hFdZ9c5Wepct/VoYfnSwwSDijyZ51CM5OxBQ5K7ZWxgW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG2wzfEk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429c82bf86bso3317202f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 07:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764084198; x=1764688998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kq9qSywkO4PP1gvaQ5TihW+kIalcwEhayZAl0fTMBI=;
        b=gG2wzfEkKqLr6AC1yCfZtOKA6nOZqSbowOqO+NwgD7JTeayeQIrG5n4B7Ai97ll6vZ
         PZLK0lbbvav9V+P3Se5fNlc2JDv1uASvDI1qtHxI1DlqbMK19i0olCiAL00/UrxrxmBl
         5LwL3d2h0TZrmcQIXspNlvb7yjay7jMzjbFdU/QUVUxmABtNKk1I2GhTxKtZVCScb/9o
         h1SkZDHO1dUjHVYRZRo7z+VzeKsKDP3duY6fazxa/JwpS/+8VBaW0tmis4WELskDXm5R
         jwkiwzgss7t/XHcaoZvpq8h2qJpM39ItkysCXg2TY0axhAhD2pLklwGtPUaI3yWL7kVV
         jSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764084198; x=1764688998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9kq9qSywkO4PP1gvaQ5TihW+kIalcwEhayZAl0fTMBI=;
        b=nD2u+4KnNPTS9A4rYfsttZDI91uyk6tZWQyeVm51FnvCsOidM4StmVYv7fwe/CQsy6
         XCfz9UmFmNwAtw1pqMxagCMVQdrIrzECxTf2GKB7UhurpK6ffNXSC1ElTsZDSHxpHLpf
         E0pmN8RTqS8V0EgNeyXplRrU49iVnP/xpiWxYU8qYfc8ZwNA/9Hj/tpxOfwDYFVBYdd4
         FSwjW9B8uj7qP1E2jitK/kFwpu2+7+vuUVepGhVMwiglfBpVYgf4DdV5i3iULr6wlF/q
         txMYVlQCZPJYWMaejhIcovCDNQbS57gPb7jlEeNGK8aAV6ZS6vhprftnnhUNJHBFhTez
         xCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPad7X7CjkFewbb5v1N14zsB6ttNg0LQ8vUhPumdLbSrgRXaQqn7EYvqeiKtTVjP5YL2pAmBqrGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo04lhBQIfwwTF5jyjiMEMebQoj10Yfs2tgsNZLhp4EPyyu0cs
	Fsa5WWqHbBkx2b1iD17OXZr1Ni8tC2ym7zRR5PEiZTKyA4Zf+zI8Jt5bSvTH5A==
X-Gm-Gg: ASbGncvFLfpdrRYqVftk9cu7qVBk2GrDT+xDrwaasvvFW8TFcg1bowR0gCIJaXdzalh
	sFFIPyhZqouKk0sy9SG0yd/rq55qhCEI7jghi1I2UK8EfpnYejtsWDAxkzueBmuHe8zDabofXcx
	E776SKCBCjtHifZ9cirts6e7iMC+lqHocYdugChIoCSZaPHKgkescKNYDnXBMpm4hSPHoVRFByd
	glQ9mbscX26gJCv5twrSJCD5lDAmwU10WLUoJVChwwkam72AVElq23GiPzIk4l0JK54nns0gqU6
	uEcNROHV7rmz1f45vK0zdboQEiYZlg5K6kbuY3x+pQ2C+0luYczlLIzgEHpqBoiE7K1cRgkHHFf
	Xgm93/PzKoqLb2ojwfTmJ+HPuEc7pGobbsce23TA6lfhv95w5KOOc3SLkT7M9yHSmE3IG4oyMvn
	BfoWGg64Nfga15YGCDULj87V6f9CWaytm03wLN2+5vSNn5jGy/StomMlXVSMFipNN/7NUGAHcPB
	s8GiLseCIXltPgAKx5U7i7zn5vozJg=
X-Google-Smtp-Source: AGHT+IFFqV6odpW75+4aihlkZiX/H84LE6EeVgzzfzAId0k/t8Kkmv7eyAlfCCkRFtKoqJOe9PPvOw==
X-Received: by 2002:a5d:5f91:0:b0:42b:3bc4:16e9 with SMTP id ffacd0b85a97d-42cc1abdf6amr16156448f8f.4.1764084197693;
        Tue, 25 Nov 2025 07:23:17 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8d97sm34397911f8f.42.2025.11.25.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:23:17 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 2/2] USB: serial: option: move Telit 0x10c7 composition in the right place
Date: Tue, 25 Nov 2025 16:22:37 +0100
Message-ID: <bf0bacfa7d36a4c955dd710d84432b5961501d1e.1764083851.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764083851.git.fabio.porcedda@gmail.com>
References: <cover.1764083851.git.fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move Telit 0x10c7 composition right after 0x10c6 composition and
before 0x10c8 composition.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 drivers/usb/serial/option.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index b9983e6f5eff..2610bb860682 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1445,6 +1445,9 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c6, 0xff),	/* Telit FE910C04 (MBIM) */
 	  .driver_info = NCTRL(4) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x30),	/* Telit FE910C04 (ECM) */
+	  .driver_info = NCTRL(4) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c8, 0xff),	/* Telit FE910C04 (rmnet) */
 	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10c9, 0xff),	/* Telit FE910C04 (MBIM) */
@@ -1455,9 +1458,6 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(5) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d0, 0xff, 0xff, 0x60) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x30),	/* Telit FE910C04 (ECM) */
-	  .driver_info = NCTRL(4) },
-	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10c7, 0xff, 0xff, 0x40) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x30),	/* Telit FN990B (MBIM) */
 	  .driver_info = NCTRL(6) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10d1, 0xff, 0xff, 0x40) },
-- 
2.52.0


