Return-Path: <linux-usb+bounces-18915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E49FF04B
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0113A2CC2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E25A1993A3;
	Tue, 31 Dec 2024 15:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhodzjRd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1589D2C181;
	Tue, 31 Dec 2024 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660060; cv=none; b=IeMJjoRDJM8QNZnnG6srCvq5QwfpskV4KjmqmmhhvRhpAg7Qb0g7FRCmGSLCoV4kwlEAIJDoxbRWZ+i1zAgspX92JFuxRj9hlnVC7klwWQAVndE6+qgaYTd4ZNHuHCXV/VLkRdPpSOb5isZCuBty0Jz+YoawnBebJfch/cfsbKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660060; c=relaxed/simple;
	bh=5GU22BzPVa79FllcNoXKQHm4qdvw6X8M8Ts0ZhNqBuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dHawMoUqqsnmoDjbZIavYB4n2r2WH2rKoiX77s9X5mc/mghoIF0pNeWM+ECphSdqC4x65hveh0IWjFuNOXuTwa/hUhMsHItXBzFteUhhMKR4rmsa5l9ol/esuRNL3t3SMVpUZQ9nG1OleCs8Z/R9aYQ5znuja4fVkmBjSOfVAWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhodzjRd; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e38838026so1362985e87.3;
        Tue, 31 Dec 2024 07:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660057; x=1736264857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZThhPwxWWM2D9EOoeuPpgHmBmk8eVzgCglm0QlDZfLo=;
        b=BhodzjRdH4ymCfQfvYy8Cfag7UnhaBDYjV3YnkHwIZ+mZvWGWch9TojIo7AzZ78IyR
         +KktIUDtLv66dXYZtXkyUZsnUY0B04geg6cA5L2lrCKT8DduOhiVF08Wyi8E7WAUrfOT
         RQb/GFo7aAb9P+f4EqT1WJ0s28t77VRXIAi+gJh4bPJylhJ9wLXhuRUjMJX2xUPu0EzA
         Lez6FUvDDjFYPl8VH0iY6xWHvg3lad2iPsUTTe+dNq5++fH2vQy3JjtgdWBXQ7b+lrph
         tOyau4wWjudfXL15eZCdRbxNxGz2XAYKePDx3VB9DnLV9gwGZwwJm506OgaczyT4NCUb
         J+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660057; x=1736264857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZThhPwxWWM2D9EOoeuPpgHmBmk8eVzgCglm0QlDZfLo=;
        b=MkqinHZQSAsGj9DxOLYGsQUil9uy8143LdCx0im7NEwLc1KgU0SuLeBAgXOKdAYbtk
         BpGhgrueMn7L1Root6JKwSloxuUY5MN65MUv07lTPHIPH/6WVFxUqb/dn5QLUV4BAtDz
         kQJ6LiPPnJ4t76vK8Xb4LwWf3LOXkg4YO7pbXtNXYBA3QE9HfaIJBRQfqOuBTa/xj7jd
         fCvE7lv0iUOIIZWz8KbQWggPXiYm/tlExksTcyXh4msR+fTF/UEy+tunXheR9YVjpq0U
         9rhT/2POBQXYkHf2/R9gHIyfXZ4BCRTfQPfyDy/9a1wQtIEU7GOsJfdHgi4a3ut0ylPV
         mb/w==
X-Forwarded-Encrypted: i=1; AJvYcCV2xx1chWu6LoAt6QXZ+AgGyyVF2e/TZeFYO3Gkj/lqEtHYgSEA8RvNCvtNJr5tse7DpBKebQlX1yQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGddmZEGsZf9fw9gAZ73nVwBSh8K1jU2tsmoxCqMvv6RS3bE77
	4kZozQa5AcjTmz43qD1MRiH5SkQV4Bdd0WVUYX5mwBZuv/o02BYN
X-Gm-Gg: ASbGncuMPuCSXI4trDjhPECNuGIBVvQVt987KXPJokiOukEAb7Y94+vYIWpVG8TZEfO
	rXYE5Bk/nWbAxFrSI5YOPJ4kfuRhSauOq2P7N9oZc6bDWq3v+pe2FbhVQuWHprbRZa5lg674s9H
	hqxosNKBN15W0s4wmGFJK0v1+opewxmTKCctt3pykss4ZC/0ykgCBQbsIEWt9jJzS0ry2qa9c+9
	tpy2oTCaWES0ONwyadtw3Cjq0zjsFQuAzVBgrEzWS7+kJ2CYXweL1AeJAlGs9TBIpgUAYFqm+WG
	e7g9LpvOtsmwxf/k1hdN3asxEio=
X-Google-Smtp-Source: AGHT+IGUBDpGpBWWIhuGCdrfsoOjSCIsMwdhGA9gEitD2MvIJrHhcVvMO+Pmux0dl6EXua43+pfY3Q==
X-Received: by 2002:a05:6512:3054:b0:53e:3a8c:e9ee with SMTP id 2adb3069b0e04-5422955e163mr4411565e87.10.1735660056979;
        Tue, 31 Dec 2024 07:47:36 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:36 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 00/10] HID: Upgrade the generic pidff driver and add hid-universal-pidff
Date: Tue, 31 Dec 2024 16:47:21 +0100
Message-ID: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series is focused on improving the compatibility and usability of the
hid-pidff force feedback driver. Last patch introduces a new, universal driver
for PID devices that need some special handling like report fixups, remapping the
button range, managing new pidff quirks and setting desirable fuzz/flat values.

This work has been done in the span of the past months with the help of the great
Linux simracing community, with a little input from sim flight fans from FFBeast.

No changes interfere with compliant and currently working PID devices.

Tomasz Pakuła (10):
  HID: pidff: Convert infinite length from Linux API to PID standard
  HID: pidff: Do not send effect envelope if it's empty
  HID: pidff: Clamp PERIODIC effect period to device's logical range
  HID: pidff: Add MISSING_DELAY quirk and its detection
  HID: pidff: Add MISSING_PBO quirk and its detection
  HID: pidff: Add MISSING_DEVICE_CONTROL quirk
  HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
  HID: pidff: Add FIX_WHEEL_DIRECTION quirk
  HID: pidff: Stop all effects before enabling actuators
  HID: Add hid-universal-pidff driver

 drivers/hid/Kconfig               |  14 +++
 drivers/hid/Makefile              |   1 +
 drivers/hid/hid-ids.h             |  24 ++++
 drivers/hid/hid-universal-pidff.c | 177 ++++++++++++++++++++++++++
 drivers/hid/usbhid/hid-pidff.c    | 200 ++++++++++++++++++++++--------
 include/linux/hid.h               |   8 ++
 6 files changed, 375 insertions(+), 49 deletions(-)
 create mode 100644 drivers/hid/hid-universal-pidff.c

-- 
2.47.1


