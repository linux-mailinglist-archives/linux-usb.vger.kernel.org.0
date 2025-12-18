Return-Path: <linux-usb+bounces-31558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEBBCC9F32
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 02:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68730300E4FD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 01:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C28253951;
	Thu, 18 Dec 2025 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ap7m0XjS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F20224676A
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 01:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020329; cv=none; b=p6+ECY/7gU273wwGSmpnf9M9IviXvwKYVyM7SPrk+tEW408gnIKtNqrCzlYKJSgdwBZHNhglMiXfr7Kn8NrXzsuU4WZ3lPe9osNLUlf57uPFDLgr9DoVucHG6YXQQA0urww5CvDSsYFmUVmw2wx3ln/1ckB8MfO1ikjNEwbRato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020329; c=relaxed/simple;
	bh=s9PK0bqGZdNUz/UoLjF3yDZIxEKPvTCoS9DzPQLFNrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YispZc+dfLmdletDSxpkuMvs/avQlSuMpQnWeXku3o5lZtYf1XX/attefDQcB0+SoY7G59DQJkCKa++FjvlbbkBLmA7F2COXd48ZRKgC4jHX6jQTYG/nA8uytqT5VXfiXUlF8CTMykVSGRdWQjeKt9+mDe+dfzpMtjdWYaj9Wxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ap7m0XjS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so127985b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 17:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766020327; x=1766625127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqayJvvvEzIpD6BlpMcbxJqU7Fdf+Cn2lVBKmN/a5pI=;
        b=ap7m0XjSpBKCyqavIKHmP5tMLvKYvc1rVaauYy9the7EBt1AtZ7Oiui9hzzMdMGAxC
         mLQB0KvcjmCF8OC+QxI8ST3t937PqzQ+1KrO+zhlGt+OQX7DA2pqzHtZW07vjW+DGTzs
         +A6BNXR5M3B2r1XoLxTwqM5XyOLdkoZSQWoGrF0zQaEB3CDRQXcROeet8/hVWldOX9zr
         ono4BH8XRkGawgEAIrLsKHzcydDcUoNmRuLoFQTVC5niSGAmvmd9Kb4T9QFTG/vqX+2x
         kRNms1RsFf7ZAgP12zYvjFHavQMha4tybpkRr47YbqxumepWqNPXSkZcJNJ4puG8QTsi
         oWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766020327; x=1766625127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqayJvvvEzIpD6BlpMcbxJqU7Fdf+Cn2lVBKmN/a5pI=;
        b=K3Vr/ulYzFzrpfqvCl2Y1R/ONfdiMxMt6YOLLJpZDtYl/CLuXJhhLJEs9GmJzJ9mV1
         g16hv0g4FYupKqLyBjjMtv9N+b9TQXEwe9cehrMIvbLvpb2jCLQDhbBF2oPGcp0EFk/T
         Xy5IK1KP12VzoNBTds4XptiOAz2JeXulIbsGZXU+rKed6n70crd0NZsBmnmVT7xfK5b9
         R1+Vn1I+b3BnK3RfeCgYJnssdrFo60OzZt+qV1fspA9d2PG4wF0L3u+9LKhuRNE+7nC7
         T7P7U8L4NKqdEIcQeNNWplBnFI+yjU+1Kx1q9Vetex7dAVTOKXd/ZIESZHnex1sU4WCj
         mTxA==
X-Forwarded-Encrypted: i=1; AJvYcCX8raF+VhA/oasMSRL+ZlCEjpBxDt4w16L3HLqLOFL6AHNeCnV23XPFVb1TOgRGIsqUDDzJxpduCs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFv766Gquqszo8zZnyIcnFZNNy6ftBv0JqkYFU71XJQV27Sfim
	G+Id4HLFrxELdbjYSuaGyF2AGaFrag4QAdaQdPXvZA9gHkzX7irkkuaV
X-Gm-Gg: AY/fxX69NaVMiLRM2B7rARm6z/3a2/xZ6Y7spnd9hzHrlCxc3xGT/iR0a0OWdnO4g/L
	TW26NEQNP+jO24GHmii9NqyL9mOYKtEcRsnIBzAnz/vsqcBqvrItLkZsocB8azQWfVup27QnsIc
	IScgKmaBNo27D74UG9wOMN24UI8pNlSm9ZA8KLV//fR5KQVWgwwbYVoSV6bS/m/T0XV20SKoKSl
	rXT4rPQCbhePH70qc4Ubm6VgQ5teUIl4BCZzF7viBumpglAbzZfvNDdUwrcOoJSk6d48LbKPkkc
	A8DGfo4AmsGmO8EuQqFzQKCuVAZka7+RzmDB6XOPAIRS3dDq7K9Dsqigg05MqDXbm8QilsM8un9
	9YTpzSY8zugXlzMIGEVXQRsnfyUUi1ek9uctnhkfMaSvmzAjS5ekhrRAPXD7OomDzvCpcWQcYMj
	LyWTGevIzM7A8QZE4tPXdrQrmERQy9xPcDAiKFw5Uxa3AFnx/NR7WTA5aEHm+2IPH2GJw=
X-Google-Smtp-Source: AGHT+IFJqoTwqgKVjRcNNsxMRErlVDSEk/2rabThjD/yG3RsjGp4Bfvmj1fiJuJB/w7vsAffrQ/hLw==
X-Received: by 2002:a05:6a00:1d9d:b0:7e8:4398:b368 with SMTP id d2e1a72fcca58-7f669a974c0mr18352826b3a.59.1766020326541;
        Wed, 17 Dec 2025 17:12:06 -0800 (PST)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:a45b:c390:af5a:2503])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe70c4b853sm106470b3a.45.2025.12.17.17.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 17:12:05 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	khalasa@piap.pl,
	andriy.shevchenko@linux.intel.com
Cc: o.rempel@pengutronix.de,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+3d43c9066a5b54902232@syzkaller.appspotmail.com
Subject: [PATCH v2] net: usb: asix: validate PHY address before use
Date: Thu, 18 Dec 2025 06:41:56 +0530
Message-ID: <20251218011156.276824-1-kartikey406@gmail.com>
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

Validate the PHY address in asix_read_phy_addr() and remove the
now-redundant check in ax88172a.c.

Reported-by: syzbot+3d43c9066a5b54902232@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3d43c9066a5b54902232
Tested-by: syzbot+3d43c9066a5b54902232@syzkaller.appspotmail.com
Fixes: 7e88b11a862a ("net: usb: asix: refactor asix_read_phy_addr() and handle errors on return")
Link: https://lore.kernel.org/all/20251217085057.270704-1-kartikey406@gmail.com/T/ [v1]
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
v2:
  - Remove redundant validation check in ax88172a.c (Andrew Lunn)
---
 drivers/net/usb/asix_common.c | 5 +++++
 drivers/net/usb/ax88172a.c    | 6 +-----
 2 files changed, 6 insertions(+), 5 deletions(-)

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
 
diff --git a/drivers/net/usb/ax88172a.c b/drivers/net/usb/ax88172a.c
index f613e4bc68c8..758a423a459b 100644
--- a/drivers/net/usb/ax88172a.c
+++ b/drivers/net/usb/ax88172a.c
@@ -210,11 +210,7 @@ static int ax88172a_bind(struct usbnet *dev, struct usb_interface *intf)
 	ret = asix_read_phy_addr(dev, priv->use_embdphy);
 	if (ret < 0)
 		goto free;
-	if (ret >= PHY_MAX_ADDR) {
-		netdev_err(dev->net, "Invalid PHY address %#x\n", ret);
-		ret = -ENODEV;
-		goto free;
-	}
+
 	priv->phy_addr = ret;
 
 	ax88172a_reset_phy(dev, priv->use_embdphy);
-- 
2.43.0


