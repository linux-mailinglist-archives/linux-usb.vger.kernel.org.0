Return-Path: <linux-usb+bounces-32698-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Nw/0JezkdmkCYgEAu9opvQ
	(envelope-from <linux-usb+bounces-32698-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 04:52:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E024F83BFD
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 04:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A58E3006B08
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 03:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADD42EE617;
	Mon, 26 Jan 2026 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZXJISlV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C21E00B4
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769399527; cv=none; b=c6ooizWHzXttH8KoqoIvUqWZP2Dbmt539t7jhFixs68d5gC3C3MunS06wYhdaGHRvILielqMbb5oUApfDIpcd1EJqVfb5bRB+rxGGZxgBC+f6tr1fmyIY0r1QZokM3ihQQWIRNjEX/GfMQsBU20UC94dlOVQ4RQxgVzdIQBrNGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769399527; c=relaxed/simple;
	bh=crXu8pNugPi6rfhLeI9b0Q0hjuUojYgkupq319fBZWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGaytS4wr63jFB8Xmf2/HwzaXynTyHnCq6Mk9XQqBy8ZYlIGFeaLH5S3+yGdJ9/nWo+w+dSmmtYKu+3XjdPSlA8iyUT9xQCY3zsuTw+TuWyUBe+r3UWGCt4RKpvnGtUNsMvPjeACkctt0DpgoFXxAGBY/IrIztF+Z5GbhUMVNvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZXJISlV; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1233702afd3so5518087c88.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 19:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769399525; x=1770004325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caeWPoflpwgw9gZh9BqEw370JT4+JO+63LYKAcE0IoE=;
        b=lZXJISlV9ZZS8PxXeEIVqS/0UmHYTW5W788Sx2K83onlqFoG33TP4k3jGJg74mvxDW
         rAjFfxjlSBV7I5J60kv9JrYexrnetmQyaAGpgtHNVc7JJRn7edwyhTvjElMMPVivLVtN
         MGnBgIUstBK42iMBYgyRUJXo+ChKYL+q1xbbXrPih5CS1Zow6+GOqVZBceBZcWpnHRdl
         6HGLUfkJgKoTdKMhismPx448tcZelzFS2gjBsgFaRFRP3aNf97QLWnHXsYjZVs7pJ7/D
         Dea2JZzOSh9owsX+ohySOH8Swt19390HsXZH3wRo8fuyhPClLjYBerTKjpw41xLQ7hQu
         ZTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769399525; x=1770004325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caeWPoflpwgw9gZh9BqEw370JT4+JO+63LYKAcE0IoE=;
        b=b2clmGjgnzzEUvC5xchg8afpTzMvPMEx7ve9xTfZlKUhm+2jzmchAoPcVUzXTdJliW
         2dx5aTeNgV0K5DVboWZ8YMhqUCQmvbeTiy7BEECZZOSXY/FgbaqN/B87Tv+SALWObGUQ
         Z7XktGz8d2jCW8HTEchWtJ0EuwYHp0Q8rp5fNFBzuCLzhKsjcpUcNBqKgMVpxYHCaIiU
         5OesitOqHOw2gmk5h1iwVjuYSyfrQRsoFHEp9pVNg66Q9YyhxXpNOElz6DQ/EAw5TcLr
         XaPyKmfqzjT2Y90PuJhdTQjGX0Hd2PTUFFAaweXWZz1JmyFVr92XIbBRniw/1AixJ2Hs
         pONw==
X-Forwarded-Encrypted: i=1; AJvYcCUMdFkxkOTcaT6T40KSNpukGJK5eDllaT7y7hE21DM/zGCKtvGkIHD39jV7YEeSnCdqZlzTZeJlW/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCBFbffH4ZuBvB30oPai9YSaTeAttSlZOzpt8BiTE0Mxn4AxC
	blF8nhb5OF+DA7qCtDwStqVI663NkHjYC2dKMdxwsGovQevFY0eWdauv
X-Gm-Gg: AZuq6aIdRSxKnKehWo7A0pNIENhcQ1gQcvSkAp5MCKX5QMHpFcROh9vdguG2h+t1Hck
	hwjHZFBjXaBh7tTZfuj5GEe3W8iW3a8xC5JvCryPL4jHHbkuvjBSt/kGeOsX9VpRZM0PpqdQs/m
	Zs7MSVLl6b9tn+ozh/I6Tf8nETK7rpk6mkP4RFZ1H0Q07rSYCL3ykBmuk+BRIO9PLoTzZ5QSQgV
	SQhJSALwcV335a65Z8wzO+0FcrbDJRjp4G8JMQRSRp7ZKJi6UVqfAiymx0+pb24rcCrqT42fyTm
	f9M1OFZIiyi0UfvFQp6e0nLBAByt/azaoj87NkqRFLWlHw0itMwQPDsuaUgirEfvUIk5meIXSJo
	a4gFoNsoilAhKHd0J9fWiixd1f6zAN2oAnCZcOJP/O5G3Xby4CaP3xvX2tzL0PQU9bv5tuWfNDR
	2RP2xuMT2UcDj2OPVB94K/WV02+vfallWhsolqUSzYi1imZN8QWuFfBHsDYONsg/caxAcQHbDKS
	iKu+I8KDMf1I3qKiDJwJGCa50iCmD6oBQfBcPmSpGIawwDumSP+gA/SYYcbtieS4/VjU2xn3DmL
	W3kyPglq
X-Received: by 2002:a05:7022:2389:b0:11e:528:4185 with SMTP id a92af1059eb24-1248ec8d84cmr1896642c88.38.1769399524773;
        Sun, 25 Jan 2026 19:52:04 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-22.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d997f7bsm17422718c88.11.2026.01.25.19.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 19:52:04 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Petko Manolov <petkan@nucleusys.com>,
	Oliver Neukum <oneukum@suse.com>,
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Foster Snowhill <forst@pen.gy>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Eric Biggers <ebiggers@google.com>
Subject: [PATCH net-next] net: usb: switch to two-argument strscpy
Date: Sun, 25 Jan 2026 19:50:15 -0800
Message-ID: <20260126035052.31216-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,microchip.com,nucleusys.com,suse.com,fintech.ru,piap.pl,pen.gy];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-32698-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E024F83BFD
X-Rspamd-Action: no action

All instances of strscpy in the USB network drivers use the size of the
destination. If given only two arguments, strscpy will automatically
use the size of the destination. Make the code more concise by
switching to the two-argument form of strscpy.

Also add a blank line after a variable declaration in catc.c to adhere
to kernel code style, since the surrounding code is being touched.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/aqc111.c      |  2 +-
 drivers/net/usb/asix_common.c |  4 ++--
 drivers/net/usb/catc.c        |  5 +++--
 drivers/net/usb/ipheth.c      |  2 +-
 drivers/net/usb/lan78xx.c     |  2 +-
 drivers/net/usb/pegasus.c     |  2 +-
 drivers/net/usb/r8152.c       |  9 ++++-----
 drivers/net/usb/rtl8150.c     |  4 ++--
 drivers/net/usb/sierra_net.c  |  4 ++--
 drivers/net/usb/sr9800.c      |  4 ++--
 drivers/net/usb/usbnet.c      | 13 ++++++-------
 11 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
index 9201ee10a13f..71394cf2f450 100644
--- a/drivers/net/usb/aqc111.c
+++ b/drivers/net/usb/aqc111.c
@@ -207,7 +207,7 @@ static void aqc111_get_drvinfo(struct net_device *net,
 
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRIVER_NAME);
 	snprintf(info->fw_version, sizeof(info->fw_version), "%u.%u.%u",
 		 aqc111_data->fw_ver.major,
 		 aqc111_data->fw_ver.minor,
diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index 6ab3486072cb..48a09be6801e 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -735,8 +735,8 @@ void asix_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *info)
 {
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
-	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRIVER_NAME);
+	strscpy(info->version, DRIVER_VERSION);
 }
 
 int asix_set_mac_address(struct net_device *net, void *p)
diff --git a/drivers/net/usb/catc.c b/drivers/net/usb/catc.c
index 6759388692f8..05a5bd632582 100644
--- a/drivers/net/usb/catc.c
+++ b/drivers/net/usb/catc.c
@@ -672,8 +672,9 @@ static void catc_get_drvinfo(struct net_device *dev,
 			     struct ethtool_drvinfo *info)
 {
 	struct catc *catc = netdev_priv(dev);
-	strscpy(info->driver, driver_name, sizeof(info->driver));
-	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
+
+	strscpy(info->driver, driver_name);
+	strscpy(info->version, DRIVER_VERSION);
 	usb_make_path(catc->usbdev, info->bus_info, sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index a19789b57190..a2d45aff93b6 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -586,7 +586,7 @@ static int ipheth_probe(struct usb_interface *intf,
 
 	netdev->netdev_ops = &ipheth_netdev_ops;
 	netdev->watchdog_timeo = IPHETH_TX_TIMEOUT;
-	strscpy(netdev->name, "eth%d", sizeof(netdev->name));
+	strscpy(netdev->name, "eth%d");
 
 	dev = netdev_priv(netdev);
 	dev->udev = udev;
diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 00397a807393..2f31ebf25732 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1811,7 +1811,7 @@ static void lan78xx_get_drvinfo(struct net_device *net,
 {
 	struct lan78xx_net *dev = netdev_priv(net);
 
-	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRIVER_NAME);
 	usb_make_path(dev->udev, info->bus_info, sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index c514483134f0..dfcf42bdbf5f 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -896,7 +896,7 @@ static void pegasus_get_drvinfo(struct net_device *dev,
 {
 	pegasus_t *pegasus = netdev_priv(dev);
 
-	strscpy(info->driver, driver_name, sizeof(info->driver));
+	strscpy(info->driver, driver_name);
 	usb_make_path(pegasus->usb, info->bus_info, sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 880b59ed5422..ef13b7663890 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -5256,7 +5256,7 @@ static void rtl8152_apply_firmware(struct r8152 *tp, bool power_cut)
 		rtl_fw->post_fw(tp);
 
 	rtl_reset_ocp_base(tp);
-	strscpy(rtl_fw->version, fw_hdr->version, RTL_VER_SIZE);
+	strscpy(rtl_fw->version, fw_hdr->version);
 	dev_dbg(&tp->intf->dev, "load %s successfully\n", rtl_fw->version);
 }
 
@@ -8755,12 +8755,11 @@ static void rtl8152_get_drvinfo(struct net_device *netdev,
 {
 	struct r8152 *tp = netdev_priv(netdev);
 
-	strscpy(info->driver, MODULENAME, sizeof(info->driver));
-	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, MODULENAME);
+	strscpy(info->version, DRIVER_VERSION);
 	usb_make_path(tp->udev, info->bus_info, sizeof(info->bus_info));
 	if (!IS_ERR_OR_NULL(tp->rtl_fw.fw))
-		strscpy(info->fw_version, tp->rtl_fw.version,
-			sizeof(info->fw_version));
+		strscpy(info->fw_version, tp->rtl_fw.version);
 }
 
 static
diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index e40b0669d9f4..04b16181d992 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -784,8 +784,8 @@ static void rtl8150_get_drvinfo(struct net_device *netdev, struct ethtool_drvinf
 {
 	rtl8150_t *dev = netdev_priv(netdev);
 
-	strscpy(info->driver, driver_name, sizeof(info->driver));
-	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, driver_name);
+	strscpy(info->version, DRIVER_VERSION);
 	usb_make_path(dev->udev, info->bus_info, sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index 36c73db44f77..d8f5d8ac697c 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -612,8 +612,8 @@ static void sierra_net_get_drvinfo(struct net_device *net,
 {
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strscpy(info->driver, driver_name, sizeof(info->driver));
-	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, driver_name);
+	strscpy(info->version, DRIVER_VERSION);
 }
 
 static u32 sierra_net_get_link(struct net_device *net)
diff --git a/drivers/net/usb/sr9800.c b/drivers/net/usb/sr9800.c
index 57947a5590cc..84fe53d1a721 100644
--- a/drivers/net/usb/sr9800.c
+++ b/drivers/net/usb/sr9800.c
@@ -474,8 +474,8 @@ static void sr_get_drvinfo(struct net_device *net,
 {
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
-	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRIVER_NAME);
+	strscpy(info->version, DRIVER_VERSION);
 }
 
 static u32 sr_get_link(struct net_device *net)
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9280ef544bbb..c5ab449469c4 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1089,9 +1089,8 @@ void usbnet_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *info)
 {
 	struct usbnet *dev = netdev_priv(net);
 
-	strscpy(info->driver, dev->driver_name, sizeof(info->driver));
-	strscpy(info->fw_version, dev->driver_info->description,
-		sizeof(info->fw_version));
+	strscpy(info->driver, dev->driver_name);
+	strscpy(info->fw_version, dev->driver_info->description);
 	usb_make_path(dev->udev, info->bus_info, sizeof(info->bus_info));
 }
 EXPORT_SYMBOL_GPL(usbnet_get_drvinfo);
@@ -1783,7 +1782,7 @@ usbnet_probe(struct usb_interface *udev, const struct usb_device_id *prod)
 	dev->interrupt_count = 0;
 
 	dev->net = net;
-	strscpy(net->name, "usb%d", sizeof(net->name));
+	strscpy(net->name, "usb%d");
 
 	/* rx and tx sides can use different message sizes;
 	 * bind() should set rx_urb_size in that case.
@@ -1809,13 +1808,13 @@ usbnet_probe(struct usb_interface *udev, const struct usb_device_id *prod)
 		 */
 		if ((dev->driver_info->flags & FLAG_ETHER) != 0 &&
 		    !usbnet_needs_usb_name_format(dev, net))
-			strscpy(net->name, "eth%d", sizeof(net->name));
+			strscpy(net->name, "eth%d");
 		/* WLAN devices should always be named "wlan%d" */
 		if ((dev->driver_info->flags & FLAG_WLAN) != 0)
-			strscpy(net->name, "wlan%d", sizeof(net->name));
+			strscpy(net->name, "wlan%d");
 		/* WWAN devices should always be named "wwan%d" */
 		if ((dev->driver_info->flags & FLAG_WWAN) != 0)
-			strscpy(net->name, "wwan%d", sizeof(net->name));
+			strscpy(net->name, "wwan%d");
 
 		/* devices that cannot do ARP */
 		if ((dev->driver_info->flags & FLAG_NOARP) != 0)
-- 
2.43.0


