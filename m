Return-Path: <linux-usb+bounces-10041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9B8BC5DF
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 04:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6265F1C21508
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 02:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0CF34CD8;
	Mon,  6 May 2024 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOBGgmp6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377019479;
	Mon,  6 May 2024 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714963458; cv=none; b=lA9Qycmkxgxd9nQoYbLhaeLew6E8y41PCOPfQvOcs32ly6QtGZLefNDkNqyiokH1/I02HD9OCOvo22ITuFRSZHth7/Jxhq1MM0kriE+P7kW6VeW6VsGBkqF9WLn8PoN3G4q3uL1+LqcyzaxZNJ89ABMqvP6eJ5uoXV92incj+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714963458; c=relaxed/simple;
	bh=9IJ7eL/NXZnN6iaxGyEly5g6ObXfEECQHJhrZGGTc9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CN3wDrentjuxUaK6d4kC/OJhXxN6LVRQpEOyOJpKuOt/tbSoFNjdtgPIqaegsav4zfXZQB00xgTvZQ91n4hDDExDIs8Fiu8QunmjDjQSoHss7vy1CtXNo1E37KFXBFj2e0/6BjR4YH8SVP6uRX2URvR1AdFykfuUSiiw5m5ZgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOBGgmp6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ed012c1afbso10620315ad.1;
        Sun, 05 May 2024 19:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714963456; x=1715568256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eeHa5cvAFWS6KkAuD02BZwd0wIMOooO6IwbFyNPbjJM=;
        b=jOBGgmp66fZE6/A5N2LUvX7yoK1CwC8b5f81aHlryPKdb3baslEq53ch044YxEweoc
         +Dz0RwWTEyuWAfkD7wcMh//0Bwzidvg7WwYQLbKYy6YBlcfgE+yHyo1flBkqu0SVhNDe
         FD6o/xh17XGpUP2wm4BHBVusPm+RikuwaNjs8Cqxdqn/sBqkzKCtnxkBPiIaQKzpRnly
         9IS4YFTdxsiz2+OYbbtneMWA1tHrCWqyb2/MYy3OmVwHyWymq+1KKdR/JOjuHbpjOAqj
         qFDTLQRhW26UBalorijQBXdx4noHZpC8AsXG9RcIp4Ht3lBUZfrCCW8DALpFyK/KrMPC
         y/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714963456; x=1715568256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeHa5cvAFWS6KkAuD02BZwd0wIMOooO6IwbFyNPbjJM=;
        b=GSj6D7znJQNjqQogkCVetD6fCYv3SGM51CDJwAYxbsBRzC9zNh6KJhvpflOlFrOUoE
         eUCcv/g6pSP+3DviNJJR/8tLG3IWw/7HPGkZsFivted/AInnlALXy/0v9qeeOvK7fMjo
         5GDBAykyU5UDBF7iBMR4twwxlJhg0MtmiGhMIT8xoXWgx5W37/95SREvjDq7tCUP/Lv2
         dIk3WevdjsyzPA5lKEOkygqS3S4PQOIw+xYfJymB5Mew8ndpPeFOftbMZ0NgqYd39sis
         XnNMSkmmQDozqsgDmIgUF7hc4vSLoB4b1QT061Sy+HjjbaAJKk3t7R3FU3olmGys9qxe
         7YMg==
X-Forwarded-Encrypted: i=1; AJvYcCWrolOdfewxr+nECkXvkazOe3NONEzscGiKudEScx/qrV6fY1MXuS6d39mYzYU8oG+Kc+SewJWXQuZzUqc/rESAkFmz4mFPbv4j
X-Gm-Message-State: AOJu0Yxm0jaKTkYKryg2JIcXyazNaKIHZY5WTMgxBYSVDJiRYCYKA3Zu
	BT7xFGP+4uCZg4G3jCX3/CR8ZZcs8htjfLvZPVmi/Qi36xmQccD5ZP4chjPrc3Q=
X-Google-Smtp-Source: AGHT+IHbnOBnObgwxWEwtWP/CWIRPGwUPhe7ORjBHqUhSbuZRKoN0UTaJv+4wQPQaX98txh7gPhnlA==
X-Received: by 2002:a17:902:6546:b0:1ea:691b:3692 with SMTP id d6-20020a170902654600b001ea691b3692mr14746033pln.17.1714963455957;
        Sun, 05 May 2024 19:44:15 -0700 (PDT)
Received: from localhost ([42.80.85.11])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902a3c500b001e99ffdbe56sm7284177plb.215.2024.05.05.19.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 19:44:15 -0700 (PDT)
From: qiurui <happyqiuqiu9604@gmail.com>
X-Google-Original-From: qiurui <qiurui@kylinos.cn>
To: gregkh@linuxfoundation.org,
	corbet@lwn.net
Cc: linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	qiurui@kylinos.cn
Subject: [PATCH] docs: usb:gadget:hid: fix hid_gadget_test code in documentation of hid section
Date: Mon,  6 May 2024 10:44:08 +0800
Message-Id: <20240506024408.19344-1-qiurui@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bzero buffer before read()

Signed-off-by: qiurui <qiurui@kylinos.cn>
---
 Documentation/usb/gadget_hid.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/usb/gadget_hid.rst b/Documentation/usb/gadget_hid.rst
index e623416de4f1..c4ee81a6b48e 100644
--- a/Documentation/usb/gadget_hid.rst
+++ b/Documentation/usb/gadget_hid.rst
@@ -410,6 +410,7 @@ Sample code::
 		}
 
 		if (FD_ISSET(fd, &rfds)) {
+			bzero(buf, SIZE);
 			cmd_len = read(fd, buf, BUF_LEN - 1);
 			printf("recv report:");
 			for (i = 0; i < cmd_len; i++)
@@ -419,6 +420,7 @@ Sample code::
 
 		if (FD_ISSET(STDIN_FILENO, &rfds)) {
 			memset(report, 0x0, sizeof(report));
+			bzero(buf, SIZE);
 			cmd_len = read(STDIN_FILENO, buf, BUF_LEN - 1);
 
 			if (cmd_len == 0)
-- 
2.34.1


