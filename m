Return-Path: <linux-usb+bounces-18924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0C9FF05E
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27B21623C9
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5861B4237;
	Tue, 31 Dec 2024 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMYpF7Nm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358421B0F0B;
	Tue, 31 Dec 2024 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660073; cv=none; b=a+KhpzihheeoVrJt1EjaSGJpq1F97y8OYFWZxMmK75ka0pOHWVlF9z12hsFBC0ZVZXg7hYVTs4KeFu7P11Ec9/pi3AAVfYM0bgePFKUD0yr9CdPCspY/GkyTVL2sZ7AK/DPC+i3OQ/fdPhfkeWQ4iZPTJ6R06XBKVsn3O0h/+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660073; c=relaxed/simple;
	bh=ag+0cxuK73zoYGsrfMXFvYFFR1YKGVjZHWh0GDKSSqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzdsfDjV+nCNQEDCgIdVE6qeqd93j6olderXjzXubiIOvzCKrKMd4i019MgE72NTpU+KuApuynFAlx9mb586KUsH8Y9+AgQYpyckyuB+lYAoXe7YmE7LpQUuDgXnJeyt3THMo9YT6ryrmMeyXumuUzLE/WilhIrBKBnUAux+cMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMYpF7Nm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e15299724so1314280e87.2;
        Tue, 31 Dec 2024 07:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660069; x=1736264869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbYCK7GWBhW4MFt5ULHo5hCX5ObLdyz/1VYLg7hJlT8=;
        b=TMYpF7NmyZEj3NRv1ZvumJ8FwXzCmJ1kR5inSgSnbe8U8nNXD39RFVKMbAnKxmaFCz
         A+/0pL6CFmOIzFecmC65v8ZqeSoJv+dPScNRGpG/891WeLohfLIrww4Fnch6HWJq1nOW
         YlOAt9f9bQFCzNYkJBLGLtN18nP26eCNPJsbuvVkVEDqovdS/AoatmcBtW83sGfY+Cs7
         xeQ+j5z+TIr6URZIpxEyHFsYm6EePtk5t47EzB5Iq8LukfQb29vtMdKLkGatpj8A8Dq2
         r6Ze3n/Vc+0KyCl/byUQ59TIONHuTva8KdRXIl9kMk8dOkJ9C55aEVcEssZeVqc37lti
         Uq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660069; x=1736264869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbYCK7GWBhW4MFt5ULHo5hCX5ObLdyz/1VYLg7hJlT8=;
        b=bJfIkUvxR91zwvEL/cuFTI7jDQMfKJbQi0DxIKmmYhZB6bUzy/8CGswbaz8lODKAD4
         GTKAQKfFll1KAN712sP8u8/aB0U0mdsR1gt8Fh/YTMeJ8gSzum2Qb5qA7IETeo8He7RC
         YI7VTAeY4dSe77SDT7va61Ykbw8LasBfG/yb/dDfSrrE3wLN9i41bwNmPTQFk3HIgz4k
         4H786ICERarGAOD+DncP5E9QsHNBCVPRjXGPFrchoqw1QdspLbBpeAx8KGpcRDdyNw2K
         +wbY/2DcihhmHTbfGJbWeUlTFtQKNvsNAppT5A9cXyy9AEaGY6vHGMOLrI2OCyfiv92Q
         xLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhnXz4c5sN3TQBhQIPKYDAS4oknUghF+wI0CHuqBzbGnB8XikMmS30MDZEfdI23ojSbNL78ZuKhxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBfggRZO8iG7YqPxFnTsRnsDxqoOgfRYLYHzwOlQMSJ/Q+roi
	NW0PVQpkXDWvNsYXBGnhHVQzPJhrJzb3NgHL22mgD6JdaFu85rN3x3CNFT2P
X-Gm-Gg: ASbGncts11OON6Ljp0kBqgTnNpOHigU2B6A5HEhbgw7lLwUWva5j8E0EQLLaVmvd4z3
	PdkuQKy+3ePiMA3gOld5jXruDCt4alYzDYjdmnNseaW+o5t7CTEgi1n7BRt1j3k9/xmINxZHLBO
	A1HlZoDMPvaHyZloDVt88Ts6K/JAeG9GYhwSP6+KbD0FoiLfxnYYdn02U+ATfv0pfgPeB+yK7ih
	6RGri2lEbJup1gPWk+ODb6wPJMth/nsYaV3irBW/XJoMoc/+YoX+HUt06Em2wNvLZPu/plEwEr3
	1BrVBq+KQLMLBPh4evCISF3qYX8=
X-Google-Smtp-Source: AGHT+IFE9pb2JKpTSVBH3YtD2Vh6jFjytZLI7D/N3CzdDVTyEcm5iRwtcLwG83OVdEwzLDSO9Pdwiw==
X-Received: by 2002:ac2:5f1d:0:b0:542:2972:5778 with SMTP id 2adb3069b0e04-542297257d3mr3028276e87.10.1735660069127;
        Tue, 31 Dec 2024 07:47:49 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:48 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 09/10] HID: pidff: Stop all effects before enabling actuators
Date: Tue, 31 Dec 2024 16:47:30 +0100
Message-ID: <20241231154731.1719919-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some PID compliant devices automatically play effects after boot (i.e.
autocenter spring) that prevent the rendering of other effects since
it is done outside the kernel driver.

This makes sure all the effects currently played are stopped after
resetting the device.
It brings compatibility to the Brunner CLS-P joystick and others

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index cc02c5d1bd04..d5749020549c 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -109,8 +109,9 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 /* Special field key tables used to put special field keys into arrays */
 
 #define PID_ENABLE_ACTUATORS	0
-#define PID_RESET		1
-static const u8 pidff_device_control[] = { 0x97, 0x9a };
+#define PID_STOP_ALL_EFFECTS	1
+#define PID_RESET		2
+static const u8 pidff_device_control[] = { 0x97, 0x99, 0x9a };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -1240,6 +1241,10 @@ static void pidff_reset(struct pidff_device *pidff)
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
 	hid_hw_wait(hid);
 
+	pidff->device_control->value[0] = pidff->control_id[PID_STOP_ALL_EFFECTS];
+	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
+	hid_hw_wait(hid);
+
 	pidff->device_control->value[0] =
 		pidff->control_id[PID_ENABLE_ACTUATORS];
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-- 
2.47.1


