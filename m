Return-Path: <linux-usb+bounces-18921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B659FF058
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E41216237A
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C931AF0DE;
	Tue, 31 Dec 2024 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VR/sz2U7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077701AAA32;
	Tue, 31 Dec 2024 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660068; cv=none; b=VXhELbuRVyzV/mO3Ewku96VAUaAZIYKyrgS1nA8nfbeGLToqM4rQAuWWksSdcK1oz08b6cE4pd5ycMbVv5WkpQ1JOhi04UGJK1TyvZQ1hScK4hBQJwwGHlzACorSb/CIuez9gdilokZAa95vwaWnYtpH+VISI2Iopac9MH5MMEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660068; c=relaxed/simple;
	bh=KCqDIocR6VSNW+kF+1pYcBY5/IqXQkv5wyifCzzA1S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NP8u/dP9A82k9mMm0l5CzYP7dRp+2CQN4/7tYhBDmZzbmkEWjRoqtSjZprxSsidvU94+TRJ+XlOnqje+HZhbMW+tmMiSXsxlmZJSufb6DE+4D4cnV+VtxdiKbXbVmsRmQvp0HpIOceEk9+BO3Au8ZMwWjIbC8Wu80z3mDh1B7TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VR/sz2U7; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e395932c6so1671972e87.2;
        Tue, 31 Dec 2024 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660065; x=1736264865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bseiL/nM6EMFEe+z8Ml4udYTl6QDi1PswIQ7XpZOADY=;
        b=VR/sz2U7bszqAq4ygpUbTj7Jr3Fg2GVeW67Un9bj0145SqUstkQWqxbrlFNvQ+fztu
         dkViq5tQ2QAQgusSIf4SGlk3J/8K/ZK7GSbMr1CPo2l3A4fta/S61FOplC27jo/MSSeS
         lAkbOT3sIr9bSRFIap7sZ35w1ASabKVrYywskUo/GqfU4uu8Y9e/2QeHiiZmbtaAE0RP
         SmSNQF3598cLo7e6ZYJ2NqJ4I5EN31S+hGYy6ZrrkuPN+Hk1jQoHPVBnFKMYCpohlepr
         qgbyEO3SWoeKF0TxZmRKZrWnDxGKIJHgFgBsMWF4f448mIQHJnj4xKJg0PcSbRiBio4b
         OvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660065; x=1736264865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bseiL/nM6EMFEe+z8Ml4udYTl6QDi1PswIQ7XpZOADY=;
        b=mUK1/OFxTRxIt+ZxXp5XFy1d6fclHnPxt7JmNQAJE4Ou8W/02y+ikX2Bax4mZu4Bdu
         2JUp+1LXw2Jtu1LOFOLRPzCFagVilivGVdh/y8Gjy3jC2Mk8aEl9IFSfHaEeAfS9ixLm
         FLehMP9lKZCDULVFqdiTdF4LPfTQasQSsFFGXO3zJBWP1HtTvPOZ5pvQkSyaizvLntv4
         O32ngGVhyM0kcXjDLsJbhWcWEdxrzYIKmnRJjMfG4VHDD3FDIvmc5mshzWoAcql0F6+q
         VyFx19EKhugVNdgwgXGXutBtyb/F0TpKyLZP3ioLDNb+Ae7tADZNstz9ODTMHR4Etui4
         r6ag==
X-Forwarded-Encrypted: i=1; AJvYcCXUvWgzPu/7paJoK87DWpQy8bLHGJGnowAOfBw1f3UbMn63aFlfIQQGx5I7WTEmTMgBx/e46Kxj3NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqeD4uRlp94ejAoYTnkKUKop3IZyvtJ2BDK2DV/PAs4OkbL8a
	qlE/m4LfD2KjNaO9CmeYEz+ZRbIR/4JELvdgZdfHp/maTpxH1c0QSxx5bXNX
X-Gm-Gg: ASbGncsUReqTouDMAoGywXzpIPx10KdzGpgf65fmswPqB5d45nZyGFmFcILixhCj9Qp
	RWUJBqcdvQMq52mHkuHl8/4NtBgt9NINkmDCE5FeZNp4XQHOjEGdokNDcz++IjRRojTG+z8C+iB
	fYaTduBBNomxEJ9EtPjw4Ktiq6ghAJ4fKTcmW/0fbB2OYc9YIZt3c8oeuPFVQM1fABsEVvJr767
	jhZJM5EydxxB8rtmaSLw1a6xSowFZ5WpL2PAH2TQe8srLr7VmPdL5sj75/1CQPqGJ3MpXPg3Gea
	rSVV4Oq0rJfvZrLdiWkTEdT5H94=
X-Google-Smtp-Source: AGHT+IFGOr8XyJvieBcR26zRjq+awHfzZ+v7lCjosaKGyu/e1HOnopOqPL1a32Bns/M+mYTvN6SppA==
X-Received: by 2002:ac2:5681:0:b0:540:3593:9fd8 with SMTP id 2adb3069b0e04-5422953ac55mr4050945e87.7.1735660064999;
        Tue, 31 Dec 2024 07:47:44 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:44 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 06/10] HID: pidff: Add MISSING_DEVICE_CONTROL quirk
Date: Tue, 31 Dec 2024 16:47:27 +0100
Message-ID: <20241231154731.1719919-7-tomasz.pakula.oficjalny@gmail.com>
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

With this quirk, a PID device isn't required to have
the PID_DEVICE_CONTROL field available.

Some devices like VRS Direct Force Pro do not implement PID_DEVICE_CONTROL
in their descriptors while still having the necessary control fields like
PID_ENABLE_ACTUATORS or PID_RESET.

Fixes initialization of VRS Direct Force Pro

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 3 ++-
 include/linux/hid.h            | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 0bc093ae1bb3..40265744019c 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1000,7 +1000,8 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 0x57, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-					 0x96, 1);
+			0x96, pidff->quirks & HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL ? 0 : 1);
+
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
 					 0x8b, 1);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 29f0a91f505f..2af9db0296d1 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1228,8 +1228,9 @@ int hid_pidff_init(struct hid_device *hid);
 #endif
 
 /* HID PIDFF quirks */
-#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
-#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
+#define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.47.1


