Return-Path: <linux-usb+bounces-31530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF778CC6B17
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 10:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87C5F3030936
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 09:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD00C342CAD;
	Wed, 17 Dec 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htG3QTef"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE05B342519
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765961473; cv=none; b=g8CDKPhpNdxO62QGLwHJQ5XqZ9/Ox1iVBjxvIYutQHp4jJwOXn/f1kNsl1zvoiRj3rVbZDC1egSYGTATPNQXmCRgmOMYFtiuBVBZus8dDC+7vZT6jighVrPZV9Hxv01DWuuRrRWxBRU9lgVhvCc4kloemS/j1S+SdMPdXqFXMDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765961473; c=relaxed/simple;
	bh=dpOQWuBh0QYcp41epU4bOBn1YkCEX2RBE5dAA6qahPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETg1yS2eC5uad+KKPXcu3QfTy4nUt5NKxt1wqqw3od7J8zIxvbiL2FmU/CJ7nLK0bAgMBuwvwsmofxSsb34A5B+h9VrTkXR7taR/vR6rIE2Xwx7DHrRu+5xiH7Z7M30AUBuBARKX7fDvky+MHUvjJAJem/Aay/tlhMY4qW/czss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htG3QTef; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso4471999b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 00:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765961471; x=1766566271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=InBMy9THL/+AKttWz10fgYUD/zq8kVUZDf3eTuw65J8=;
        b=htG3QTef0iXqh5jPkxxW1NF4xyts36wIELh65mN2+VxJG8nTMO2+fA7pGnNQyndHYB
         /Lt1vfDzr2FwKL+oDPGts88BRjJJav3kKOFkE+z3y52S7SG51rB3BsrSt46jyiNpCiQi
         A4kL8dLjQ+qKzirSBp8/g//ARqiCh8nyX79uAVFlb6YozlB8g6jsXFICIsZ27Ny6AZm2
         H49+o1rxK+IOj9Yw4ycs77fzpkRvJ11bj0c408IY0yWbfPQWdqDtAZyGtm0ntnjV0uRw
         ylM8dkOjOa7Hu8TfVfyHLUgusypglH5N4it/ULbZq+gtydgBFvhNMsDAP7/70M5VHfDv
         rp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765961471; x=1766566271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InBMy9THL/+AKttWz10fgYUD/zq8kVUZDf3eTuw65J8=;
        b=mHjcPCwgpfonSOyBnKcM4dW5r6IGGUBGQKmIVI9uaUiIoFdT4WM5YP57aQoLYgL+8+
         mew6sqitv2wbWv7EU71HGZWx0Xw+4cT03IW3jUk/3ilATLd6LtugS++oAxcdFDIttRGV
         fgbLq3Xny3YF76rOjjamYI3I/CjE9ciWL8GNTDDfpZO0+2C/Jmim52LWS7oZmQzUUMS9
         4IVosr6yN/eFUlv6WvDOSQkhTWwHAB2KAJUbG6jSsWDWUT1uKnE8gDeGPTx/5WJtr1vU
         HeiONgdC2R0h6w8wO795ZMz+1hjjQopUlUuFSoJ2Pn/RxQpMwIubd7oNU0vKTxGpmSfY
         v7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVomsW+4MN427FxaJ9kzuPIyS7HAvLvddkQzrDAZRoyT9QrB80qkxWmgxolR/AN3nNcJ/giRVm7iHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/1yxPuEY/iuWAhig6DAOsl8PH+km5yC6P7acvT/+RENtUSHa
	niEOu38apkT3Rn4kNMdj4UCa8qCw4aT6Bsi1llUS9pznOt+odFnDXsqy
X-Gm-Gg: AY/fxX6nk0MX9cPpdGeAHZ7oM2qsK+mf8sV10nPPWkPrNbOv4XqtYwst4/DyoTavIzh
	AFzx2UgtRROmvqt60hZJQLILhbFpg5ZLyVvxBEasYJzNCQg5ts44ltP7XaNbOyp3aU5VkyirIEN
	QGvTvhHq3YJeXYdmYfu4FovVGTaJErHmXlfK/swHbFo8JIrPrNKOY52jDvCPwBTJJ/XI//HqkN+
	Pnd6kttNhmvPlgilnnO8Lxcop85Nag8cQSpWjTsKMmdSEDsTzbQD+BNunbhwfbJLLH/7CACGRKP
	jvSfTw84Gj+jkUbCf8QcQ5ZIcubtOwSMPFmi1RY0nZcCDCSdb0Qi4532bi31bevAWF1zOnn9jJw
	pF4F3RWlqztSp5cisBOdVc9YbxVNQD8FExhSdGko1ZcNxSIga6pzvXSCWk1EiwYeZJzP1yn4YvX
	JctPndIZj/tT13PFvVK5HJ9ANw9OxkMInXKWJh/FmJcapjWGmf/yhNR5vAvyP+Cd7SJCI=
X-Google-Smtp-Source: AGHT+IEZIbsXjRYAzwthqUL9izCT0P/bBYc6ctvrcCaiRWG4w6M0LZKqWuthurxHYK2J2E0kB/Ip2Q==
X-Received: by 2002:a05:6a21:6d96:b0:35f:5896:85a4 with SMTP id adf61e73a8af0-369ad5e9564mr16560809637.5.1765961471020;
        Wed, 17 Dec 2025 00:51:11 -0800 (PST)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:d95a:1e5e:256b:2761])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2b8e0fb4sm17531670a12.25.2025.12.17.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 00:51:10 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	khalasa@piap.pl
Cc: o.rempel@pengutronix.de,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+3d43c9066a5b54902232@syzkaller.appspotmail.com
Subject: [PATCH] net: usb: asix: validate PHY address before use
Date: Wed, 17 Dec 2025 14:20:57 +0530
Message-ID: <20251217085057.270704-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASIX driver reads the PHY address from the USB device via
asix_read_phy_addr(). A malicious or faulty device can return an
invalid address (>= PHY_MAX_ADDR), which causes a warning in
mdiobus_get_phy():

  addr 207 out of range
  WARNING: drivers/net/phy/mdio_bus.c:76

Validate the PHY address before returning it from asix_read_phy_addr().

Reported-by: syzbot+3d43c9066a5b54902232@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3d43c9066a5b54902232
Tested-by: syzbot+3d43c9066a5b54902232@syzkaller.appspotmail.com
Fixes: 7e88b11a862a ("net: usb: asix: refactor asix_read_phy_addr() and handle errors on return")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/net/usb/asix_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index 7fd763917ae2..6ab3486072cb 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -335,6 +335,11 @@ int asix_read_phy_addr(struct usbnet *dev, bool internal)
 	offset = (internal ? 1 : 0);
 	ret = buf[offset];
 
+	if (ret >= PHY_MAX_ADDR) {
+		netdev_err(dev->net, "invalid PHY address: %d\n", ret);
+		return -ENODEV;
+	}
+
 	netdev_dbg(dev->net, "%s PHY address 0x%x\n",
 		   internal ? "internal" : "external", ret);
 
-- 
2.43.0


