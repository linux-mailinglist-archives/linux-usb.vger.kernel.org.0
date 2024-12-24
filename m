Return-Path: <linux-usb+bounces-18765-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF30D9FB9D3
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 07:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98852188571A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 06:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253B516DEB1;
	Tue, 24 Dec 2024 06:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl2ENnXv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E92C6A3;
	Tue, 24 Dec 2024 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735021459; cv=none; b=cw/ICj22c/KjkioHKdgyDPFljzGnAxjrjqKkKl1sS+aWvodUlExOg8gW95VE8nGmtPoZYwxCNHtCe14ZTVCvBViWHfwuzQpcuc0NbUPkGQXdKRhwAiepxGnmjfVXz9GTDZd22ObbFewjKgKIjUHdRrEDg9ys13D7RUelzOvxR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735021459; c=relaxed/simple;
	bh=qSkJWadDUiDLrKL/3yuiJFbOfZQZMWdhWrHtt9J57pY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XjLKSyhc55/kqv66+362xU9aVqBpVXDToJ/bAKKVdm2y5J8+S8GrntY5f94iGMX7vXCZY3z/MTTPMnw6horSH7mUR/ch+KigtajVRKfM4Dp3X4UbgZGO3/RyOHOg4D9NFKljePuLN2s0E8FY/3keOaOKpGu3gTQlT1XH74RseqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fl2ENnXv; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-21683192bf9so53098615ad.3;
        Mon, 23 Dec 2024 22:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735021457; x=1735626257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8KtqAQPZ4xCZhOpU5OqhoD91xYH86Y/t4bILjE4H96Y=;
        b=fl2ENnXvEpmK/HazEqA4zCiCpvDo0cj8n8KeuJQepAcAZKk63ohuh2JubspLWBHdMU
         MFCUM8DEXhi65726FIas8K61wCU9P/fj2pGOQvRA9RzWFZ4gxMFOWGWTrFZPSdoh+GVl
         I5YGcBFUZzyq7WMCbHW//FweF4yunPwxJqJqvEVwCnHgxrm4Ffv2dAp+8GZ1dbGlv16F
         rVI0Zzbpony3XfvOOVUx8PafTNN71R3XTNm72CmUMH4LDni/gY9EG2rnK4EOSKD1Pcly
         ZG5SpsT6LQMsNL85jfoM0kQcoWJ0hOC8TDnLRLmmcvyP+on7FvhEM3bAB8t1gZoW5Woj
         XgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735021457; x=1735626257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KtqAQPZ4xCZhOpU5OqhoD91xYH86Y/t4bILjE4H96Y=;
        b=FENdGWPZ+cswOOBF6vFkkVRIJ8iEUEDHTivz5v8RNhLs78yDGG0WVdQy0JbcKzJkNQ
         KuE+PpXvHnLmdjAG6HVFf+DDgbkY3vJ/RI8ff+9GJCldILQofqFvAce/JEx3hRwBWQpl
         FM4dLk2jHZyEbuuQA2CblsOk1yYfmdlHebwOt7dPRRA3qv3ui1Uumudr1uWeNtfBH8aT
         kYJebKie+MzK4b4/K50MIMk6SHYjGsZQzqjkA+bViSURTVmuYCI59Da9+ON+neJcO76x
         +lpaFBz0SOvy/2rKr9H5KPjBxIOdEKwgdGxT89/ytw1SKOyE96SG8vWUK1hBmeFdwj8C
         T29A==
X-Forwarded-Encrypted: i=1; AJvYcCWGPh7qWE3Gb0ciY/XjtlrMoahN+L3dC9Wzx5ZwzDw03DSGHsPSc2s9F1FD/YPFw0mRUj+4bkJCYJI=@vger.kernel.org, AJvYcCWq2N3JLZlMPkXLNMyd6HnIB3omOH8pvUYDJ1Vm1vtNULxPeLJAkxiXw8T+Ld7945zpg8tjelU5+uBxCpnU@vger.kernel.org, AJvYcCXZ9OKnY+MBy1qo1Kr/ySTqnuTlNv3DVFwKAw29EjmXdR9jS1l0GM124jOgeeRcXZJtAeasZGrG8q1N@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzimjQesk4BGEnKB073RzM5/B9q1Vw1tPrv9hiIEhct1JfVMq
	4g9jEyRwdSzvqUqFJz1Ft8vV3YDBHJsjtAB+ojAMgX2wz0RH3MvhtjS4bhyY
X-Gm-Gg: ASbGncvaH339S2GgjOrGWt9gnhyTfCCJmhgQG1w8MOyKbt7w9LD7I6CcTy7xwtHTzmx
	5XOOxwbEfRiwOADZ1dDILvkTNNZzIaJFV3xJB37QSXQawxWnVi08JO73YcUOsx7Qpek9P5sBlGs
	G2MsPyAD8M0F/fAZLNZCfoe4fhddtucAjSrOyD7FayltoBzy849zNdyPMZXmOolK0f/ZfIYvgHM
	D8222jcJSkQ5wwidVlhF5ku4aW4wY7l+nWsDCHtdRZ9s1seq0qgvTVmt7mEKEIbuYjgKw==
X-Google-Smtp-Source: AGHT+IF/l6LkKzl73/GZbXhxDN41bVDC2HqazM1ZEy8CJoxAJ/FNK2cspCx44TSwQDDv8mclfQYmBg==
X-Received: by 2002:a05:6a21:e96:b0:1e0:f390:f300 with SMTP id adf61e73a8af0-1e5e082f951mr20987619637.44.1735021457457;
        Mon, 23 Dec 2024 22:24:17 -0800 (PST)
Received: from localhost.localdomain ([39.109.141.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f4fsm8170948a12.11.2024.12.23.22.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 22:24:17 -0800 (PST)
From: Gordon Ou <gordon.xwj@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Gordon Ou <gordon.xwj@gmail.com>
Subject: [PATCH v2] Update USB/IP OP_REP_IMPORT documentation.
Date: Tue, 24 Dec 2024 14:23:36 +0800
Message-Id: <20241224062336.63215-1-gordon.xwj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to correct the mistaken byte offset of the field bDeviceClass in
OP_REP_IMPORT documentation. The previous field bcdDevice has length 2 and
the offset for bDeviceClass should be 0x138 + 2 = 0x13A instead of 0x139.
Offsets for subsequent fields are also affected and fixed in this patch.

Signed-off-by: Gordon Ou <gordon.xwj@gmail.com>
---
Changes in v2:
 - Updated patch description.
---
 Documentation/usb/usbip_protocol.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index adc158967cc6..3da1df3d94f5 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -285,17 +285,17 @@ OP_REP_IMPORT:
 +-----------+--------+------------+---------------------------------------------------+
 | 0x138     | 2      |            | bcdDevice                                         |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x139     | 1      |            | bDeviceClass                                      |
+| 0x13A     | 1      |            | bDeviceClass                                      |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13A     | 1      |            | bDeviceSubClass                                   |
+| 0x13B     | 1      |            | bDeviceSubClass                                   |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13B     | 1      |            | bDeviceProtocol                                   |
+| 0x13C     | 1      |            | bDeviceProtocol                                   |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13C     | 1      |            | bConfigurationValue                               |
+| 0x13D     | 1      |            | bConfigurationValue                               |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13D     | 1      |            | bNumConfigurations                                |
+| 0x13E     | 1      |            | bNumConfigurations                                |
 +-----------+--------+------------+---------------------------------------------------+
-| 0x13E     | 1      |            | bNumInterfaces                                    |
+| 0x13F     | 1      |            | bNumInterfaces                                    |
 +-----------+--------+------------+---------------------------------------------------+
 
 The following four commands have a common basic header called
-- 
2.34.1


