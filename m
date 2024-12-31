Return-Path: <linux-usb+bounces-18922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D579FF05A
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5D216216B
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8127119D06E;
	Tue, 31 Dec 2024 15:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlDumc/6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FD1ACEC6;
	Tue, 31 Dec 2024 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660070; cv=none; b=S8cQUF4z9rKiDjL2vZCEjWuld+Am4Uq5pAH9hRZvsYfC9LQL2KVVmhAJrbz5HcKRmzQJcjlYoK5UCzbtAls2gxpHU80T5wut2yipHfLkOzZVarIJMff9o3R4neG7CVLWEkLDtB2cRWLaEqbm0owP3KemFuE4kVfKDHMlPahZfGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660070; c=relaxed/simple;
	bh=bNNWrHvrstpNkLISWDyYAYCpnkTyyXDOg58FtM48k84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgBlBOjsGbGuuNdvtuH7ZCDi4MUb57qyUMO1tNdbB7FDthjYnviNaucGk6e7C/jxSWktw/tm+8X76TzoN8lXWoqPu2VuBzHC1gUQhytNA2cLD0fudq5artzdzOzBBOO15vlu8Wl5ZE+A0M1CwolsupazS64ROqhda3IB8wpCEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlDumc/6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5402ec870b4so1534356e87.2;
        Tue, 31 Dec 2024 07:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660066; x=1736264866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTX8F3p4S40eatfHvwSuGkxjY16XjyhwFFVi3Zimu78=;
        b=DlDumc/6Y0rrUV3wTmgDcGyBalztg3AGeUqsVa/LrF/qDROcrvGEgQqUj4KGDFN05X
         wsTi+TZ231tSrESJ+wdAD2K56QFTIreyo8xuhOsimRk3Cf9Fn88phb6ZrHOwCJhSA8UD
         JVjOn2JJlzQ6l3YxznWBkqBSLQP7YdjeUEKR3QpGBw0gQNE8iwSKdtHYlYn8I+bW/tpi
         64vuY6/S+3SxCYfRF7vQMgPOWt20e2loWizBbhxUXRCk0MKyIMw5PuC7owYZA6B5PzVb
         5BlGVDzJ+dXQzrST/Fe7968OJhXO+iBw/u8WaTrrL+xWNbTKyAzGEz6cCsWCEf/OWOC1
         3xOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660066; x=1736264866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTX8F3p4S40eatfHvwSuGkxjY16XjyhwFFVi3Zimu78=;
        b=eh4P/PHSdnRP6lds8dWkHSr2S5z0DH2zEOGMig0dI5joLaRA6AiLgzm8KSns8nYVyS
         Fiyf3NLLks8wcEaLAAB8sGuB8L9fccYS1ReOCrXA/A3cvcte+nZmFQlA82nf0pNI/DEo
         PGLS7uNs1TgH5oWJxfaA4zmkdOn51bo17nZMnI/URXe4IXxUzdmQUL/D0CjrCy/IxY0d
         UOOGRePXzPox9J9fsFYIUx0XDOMG3S9O5qiQe8PPzybNIvTF3sbO6ynfbQTjIUwTxvXY
         8AtrhmvrgDfiEJECZWL5HUd3I8ajqF+Fon40MhyUkno2ArxiiJECicVlTBgiMUK8bTJu
         wiLA==
X-Forwarded-Encrypted: i=1; AJvYcCVAZ2zrkUW6ftCyW9stdblGM4BuaEYOrzBJ2qn/aIQOU/WZc4Z/dV0YhTDJ0IeOR3JO8ErAZ5s8bcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynFk5y8CcCuB3yvB95ithDmFVF/IaN9FZhBLQiZteg6uj+h9QI
	8gQA3NS9Fv4sRtqqJZOUZnGwhFwkBMh0l3xIAcgqVTbtfv4cC2YS
X-Gm-Gg: ASbGncuOwLtJJJvc0ZKTeEqe63hJs2ROO5lP32vJLbpGyVt3u/d7sisw2VSPYkXd3Tg
	cDJQZY8VOABxsF7Tg8C6odief7ho8b++WcGhl2YLH9d2cEhlmXZBTjZGVg14iTzswld+O5TVXc7
	KbC9S8Cj504CijQywq1fWkU6FWjt2dEUPWdD9aibhteeztphIo9b3UkeXPk1TBTJbGBWfLA+Jf9
	LLET1nyTEFUusExduNHN+/lzTLpNqK2Fa58rNR0B0qv8U3xiId001cqtvP9+8s5zM+or6dz+n2s
	sQDcjiaAK3QDjFs8FbfmpWA3Gec=
X-Google-Smtp-Source: AGHT+IHiOPfwDMDAJ+2FJ95NX5jjn1NEDgAFy0cYvqMwpbK1G3JfslZQFc9IZ6cM8TWb6kR/0l1yDg==
X-Received: by 2002:a05:651c:2204:b0:300:38ff:f8e1 with SMTP id 38308e7fff4ca-30468510d0dmr46966541fa.2.1735660066390;
        Tue, 31 Dec 2024 07:47:46 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:45 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 07/10] HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
Date: Tue, 31 Dec 2024 16:47:28 +0100
Message-ID: <20241231154731.1719919-8-tomasz.pakula.oficjalny@gmail.com>
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

This lays out a way to provide an initial set of quirks to enable before
device initialization takes place. GPL symbol export needed for the
possibility of building HID drivers which use this function as modules.

Adding a wrapper function to ensure compatibility with the old behavior
of hid_pidff_init.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 15 ++++++++++++++-
 include/linux/hid.h            |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 40265744019c..c919e2db8dc0 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1299,8 +1299,9 @@ static int pidff_check_autocenter(struct pidff_device *pidff,
 
 /*
  * Check if the device is PID and initialize it
+ * Set initial quirks
  */
-int hid_pidff_init(struct hid_device *hid)
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 {
 	struct pidff_device *pidff;
 	struct hid_input *hidinput = list_entry(hid->inputs.next,
@@ -1322,6 +1323,7 @@ int hid_pidff_init(struct hid_device *hid)
 		return -ENOMEM;
 
 	pidff->hid = hid;
+	pidff->quirks = initial_quirks;
 
 	hid_device_io_start(hid);
 
@@ -1400,3 +1402,14 @@ int hid_pidff_init(struct hid_device *hid)
 	kfree(pidff);
 	return error;
 }
+EXPORT_SYMBOL_GPL(hid_pidff_init_with_quirks);
+
+/*
+ * Check if the device is PID and initialize it
+ * Wrapper made to keep the compatibility with old
+ * init function
+ */
+int hid_pidff_init(struct hid_device *hid)
+{
+	return hid_pidff_init_with_quirks(hid, 0);
+}
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 2af9db0296d1..93233c5b75a6 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1223,8 +1223,10 @@ void hid_quirks_exit(__u16 bus);
 
 #ifdef CONFIG_HID_PID
 int hid_pidff_init(struct hid_device *hid);
+int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #else
 #define hid_pidff_init NULL
+#define hid_pidff_init_with_quirks NULL
 #endif
 
 /* HID PIDFF quirks */
-- 
2.47.1


