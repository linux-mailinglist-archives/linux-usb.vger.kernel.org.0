Return-Path: <linux-usb+bounces-18890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64CD9FE3C3
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 09:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05C533A1F92
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 08:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E731A0BD7;
	Mon, 30 Dec 2024 08:39:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8B1A0B06;
	Mon, 30 Dec 2024 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735547947; cv=none; b=TJfrbrh1eKskZN4WPSWsqk0smF9fMfk9XHTHDEvjzlGN+L1vVS7dW6PV8g4avGa26acCMj7Wib6bGwVup++/G2kX5vLQoCnQmk7hKOpfc6ehPAk9TFc5XXiXQ/e91/V6S4Z60jahLU3ACKfgYM4VPzSCR5xG9lCFXeXfL5Z4avY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735547947; c=relaxed/simple;
	bh=nE1UeROHUAkfbhCh8Cmerb2rPtv+qV15LnpeyrI3cB8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iUbkyMYsX3ytzj0DJDdkDWGVkAzADnU8m+Wt88Hwwni0WoNCC49pDIAOPciGlR4ETgVuzAf0SYABRD/YYLpTgDbJtaIETJ871y7sGJ4SDLTCBPCZAxUUNnUAzzZ9P9pLz0L1jPNa8fie4as8J6D4em3Ab9+/Q9RYZBsPeEg6jZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165448243fso138564055ad.1;
        Mon, 30 Dec 2024 00:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735547945; x=1736152745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDiR3X79Qx1UVFQaFPgOH8K3Vgl4yHmQwK/enbq7zjg=;
        b=ayxPp+wY2AY8B6a8DhwWIOmm2H8XaL1VsnC/SyL30p+RY7dGYppybYxwXafGmcN3a5
         gbVBNJAQNFbO4DZoa/gT95I6PO7jzufxtrzTpq8qKiclo1d3WP60oLaZlLK2UL4S2PUG
         nIDCdD2XDSe2jjk0KBNpqNmqO2aHq953T42BAQHujLwe9+7l1Yaia8SkkMHtGjcVc4M+
         PStSIioEvPVxHYUqf3iylvCBb2NF7fGdGRSVx/JejYlyWSXT5GuLAa/+yKN2cBGgmnK0
         3yL0s3BVBahbVPSckXGFJQHxFlpV9lxzBnj+3UmlTf+C8myFvO/KeICzW1n/TUZqVsb4
         +mMg==
X-Forwarded-Encrypted: i=1; AJvYcCVjvCouUUaR0RjcAznDyKd6iusuOem6Pr7EWPp4NZHYYWHT6P32O1G2ynSC7KzqOO6jo3TFIK6Sk8BBt6E=@vger.kernel.org, AJvYcCWVTXR8mciQTkwcJPtC6SoBT1TwV61yrkbb2I1zujdB6oCSfBX529OnSLpmqjXTK31sfxyELMWlaJ9K@vger.kernel.org
X-Gm-Message-State: AOJu0YzvG6kMnWyOpWdkfifz/5pJ64dWerUJG9nKY9kRusyPoUYmC6Xq
	Ob0t3QEK8yDfNEkFSh9Ru6XqBCg9QV5BNREhG/0hMBAviatR/jdOpGHP8bzg
X-Gm-Gg: ASbGnctVMawctwV6DL4h4264e21K1PImLIV5cQAn1xP3Ae+/IPLTsanhxTdhIDWPvVA
	/ith5eURhPePkF3LX372OtuBOpB9lbjxfLy+mNkElZbzJ1nV6VkacJjHpDlSd0ZzJl9+BvFua8c
	7or4Th+q/IHwEkjor3TD7P6NFuAPJ7RmZMq4PQbNxCrqrE5tzFm9Mqm6km19FfHwM6sVwXKzjP+
	5MconkIsv5oJ3zAoHXxO4DB9kenhI+GqFyuR4bGWhups7Ed0bLY7IVLoPb4vYjLCGRIovRbWw==
X-Google-Smtp-Source: AGHT+IGiMgJLmjoqH3z9BexbH9A1O9C2WN+IouwM6iycn+lJNcWtzzRSOOqoQRKOsLjBNfajbMeDqA==
X-Received: by 2002:a17:902:c408:b0:216:69ca:772a with SMTP id d9443c01a7336-219e6f297b3mr475755665ad.53.1735547944647;
        Mon, 30 Dec 2024 00:39:04 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc971800sm173840155ad.66.2024.12.30.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 00:39:04 -0800 (PST)
From: xiehongyu1@kylinos.cn
To: pawell@cadence.com
Cc: peter.chen@kernel.org,
	rogerq@kernel.org,
	frank.li@nxp.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH] usb: cdns3: remove redundant if branch
Date: Mon, 30 Dec 2024 16:38:55 +0800
Message-Id: <20241230083855.52482-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

cdns->role_sw->dev->driver_data gets set in routines showing bellow,
cdns_init
  sw_desc.driver_data = cdns;
  cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
    dev_set_drvdata(&sw->dev, desc->driver_data);

In cdns_resume,
cdns->role = cdns_role_get(cdns->role_sw); //line redundant
  struct cdns *cdns = usb_role_switch_get_drvdata(sw);
    dev_get_drvdata(&sw->dev)
      return dev->driver_data
return cdns->role;

"line redundant" equals to,
	cdns->role = cdns->role;

So fix this if branch.

Fixes: 2cf2581cd229 ("usb: cdns3: add power lost support for system resume")
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/cdns3/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 465e9267b49c..98980a23e1c2 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -529,9 +529,7 @@ int cdns_resume(struct cdns *cdns)
 	int ret = 0;
 
 	if (cdns_power_is_lost(cdns)) {
-		if (cdns->role_sw) {
-			cdns->role = cdns_role_get(cdns->role_sw);
-		} else {
+		if (!cdns->role_sw) {
 			real_role = cdns_hw_role_state_machine(cdns);
 			if (real_role != cdns->role) {
 				ret = cdns_hw_role_switch(cdns);
-- 
2.25.1


