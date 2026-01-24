Return-Path: <linux-usb+bounces-32669-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id glWcGUmBdGl96QAAu9opvQ
	(envelope-from <linux-usb+bounces-32669-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 09:22:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C97CF93
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 09:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7407A3012BFB
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 08:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31AF283FEE;
	Sat, 24 Jan 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atbeYRUr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840517A2FA
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769242947; cv=none; b=fqwyXVlc1mX554LLPmVkCyAv58aLqFFv40e1QgMrGU1K5nlmNUmR4XF+iaTyKpWOqG6HoTbjGjRA3e5wC5FV5yQgLZr1pBEvh5Jx6cGmHWTY96VWouS+WiisOqV7qA0dwf8UR5PTSj/A75O8N2GN48LY05ifWrD4XavHmNYqEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769242947; c=relaxed/simple;
	bh=4sLGIDfXd1xIm3LJxngk2dLM3NG/bVlSBj6Kjj7ew4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPJTBgTlJLv9N4hySd9dZvh1s8p9bxSkor8Xz1Uscp0kz7bzCn06zBCjPFqGhRYr0iOH1JQxSu/Y4yvuG+ZP+bJZiGoSrLPZJ0iwy2CmjVLqZ0VP/wOury1xFsSow2rWO3GoqqCnbjL92IL0ZG8IxFDOWJ1NrTKnIdI3CZavYu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atbeYRUr; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-11f36012fb2so4613038c88.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 00:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769242945; x=1769847745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LW8OCt4Vo19miV6OizeNdC9eiKKm2vvykQCHxibPDrA=;
        b=atbeYRUr2U7FIUkwqeTbazPV6lBeCc8C73AJV++EnDgzjM/evnbfEg7YzbOh9QnVqJ
         knKZKR+zHoRoDWnz+QH/2g/kSqA/jrXq3TcrrDhAPGWcDFRXc9nebY0gqBhGcjC9XdZo
         tRuYcd/xaNVzlnMBaYotxWVew6X9VlOIIA1YoyPLL2aHvB2VR5ou7StR/k8pBAA24x9M
         uIGZH0Lxj9E7kgV7zptkJNSH4v5OYL7381UnoRFP2upABxi8327zFbsr0B0P842VJeXx
         QSid4z+KEOLa+RIjPr+0uJ776w90LWiKu+8KnFT1u/j5WO1/ViS9Vz19nWyR3FCsp4uf
         oA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769242945; x=1769847745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LW8OCt4Vo19miV6OizeNdC9eiKKm2vvykQCHxibPDrA=;
        b=b2zISSrL/90iXjMTlH0BZ+5ymE8WGqeMT0v28Et4G5vV2nZpRhMHMwsiy/Kojut0J4
         /itMg0QnSspnLUrG0ieaBHtZLsRhnS+VJiDgV2quZsbek6gRD+YXR5Wq4dFfPpuo/HYH
         WetyhOsw5XBLOVVUIxDlnrD1B0nIr/ttzfeMU8D5XAy/yvBIbbWne5nmsPN0GWriP2++
         RTmSNxmYV5lj8dqMF1e8zlaLSwXOvkYrAZQRL9DZl4PdUX8WK0YWBA5b1Z6odxKQIe7M
         4k28dlFdQ0yqrsrO0AWoM18n7r7/tUyWRtzmfXOPKmFR5zCPR/qaYXcqLcZZZe+LaphR
         tX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWn+9q/oTgGxBiuWaMAKEAIJ7Ldr7Zgx0UBxDexgKN+gMZc6nHBjI9p/qhj18Jgziy733zs+NkB0oE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB6vYZwjn61M+aJL7aPC+USplY2iL8GF9RdRkWGBudKagwuJU5
	5wUidtipJYU41tnp/K5NVgG3KKO9Vm4SIhzdulBHEwdUQdv7ydXufINq
X-Gm-Gg: AZuq6aJAPtXEAp/bwY4Xa7T5KHN8Go1G2VvjPy0jeHZLFK9s3pRcjW7g5X7P9ErCLtv
	r8Sz5sOBJO3G8UreHjZHEXaMyiyINUrTCI+xfiRUH97no7j0ljXg42CPcoHGZIhoBvLPYM0Xx6k
	AYooQCUSwBqhYy9T+eQJS4sKCxLbd7WjEBYeJLJseM1giL49c4sSMH2gaBQ0Rh/ldGwUdhucPBh
	YYzFQ/j5AMjxD9M+/dbqzcTwV6f7kb9JQtXE04FVsYXCFqb0eGXAJJqg72qRpvSQ1PFMMdxO8Xk
	fGZV1HvTLbyaHX+yowRjgb1g1j3POk5FXMemiDKVnQYGlgc/XbByFvbJnuv2w6ZGjXkmgcysOPr
	ZgKHgkDQMOGZ/cZvyD/By9hQPjOuaGFfH3PBQTDUZuZGGHJdGWmMXWgpGkKI6gkn9wV6QFW7+zm
	COzBOdZHpXc1qkUriaHEx43DdXjeIwdh7TJTYA354YX3JsDhBGE/ow0yB1iBseIHjiZoIwhr5cE
	e5V354xH0atSR87jv7AxhAO98i0PZvxQCd1yF1Jmjlwl244Nmh11le8WRPabwgmz3SiajZPmbhk
	ddFH
X-Received: by 2002:a05:7022:4184:b0:11b:c1fb:89a with SMTP id a92af1059eb24-1247dbf817bmr3268608c88.32.1769242945142;
        Sat, 24 Jan 2026 00:22:25 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d91ca0fsm7966297c88.8.2026.01.24.00.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 00:22:24 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Max Schulze <max.schulze@online.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>
Subject: [PATCH net-next] net: usb: replace unnecessary get_link functions with usbnet_get_link
Date: Sat, 24 Jan 2026 00:22:06 -0800
Message-ID: <20260124082217.82351-1-enelsonmoore@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,korsgaard.com,pengutronix.de,online.de,piap.pl];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32669-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C46C97CF93
X-Rspamd-Action: no action

usbnet_get_link calls mii_link_ok if the device has a MII defined in
its usbnet struct and no check_connect function defined there. This is
true of these drivers, so their custom get_link functions which call
mii_link_ok are useless. Remove them in favor of usbnet_get_link.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/asix_devices.c | 11 ++---------
 drivers/net/usb/dm9601.c       |  9 +--------
 drivers/net/usb/sr9800.c       |  9 +--------
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_devices.c
index 232bbd79a4de..c73cf52a65a8 100644
--- a/drivers/net/usb/asix_devices.c
+++ b/drivers/net/usb/asix_devices.c
@@ -97,13 +97,6 @@ static u32 asix_get_phyid(struct usbnet *dev)
 	return phy_id;
 }
 
-static u32 asix_get_link(struct net_device *net)
-{
-	struct usbnet *dev = netdev_priv(net);
-
-	return mii_link_ok(&dev->mii);
-}
-
 static int asix_ioctl (struct net_device *net, struct ifreq *rq, int cmd)
 {
 	struct usbnet *dev = netdev_priv(net);
@@ -116,7 +109,7 @@ static int asix_ioctl (struct net_device *net, struct ifreq *rq, int cmd)
    devices that may be connected at the same time. */
 static const struct ethtool_ops ax88172_ethtool_ops = {
 	.get_drvinfo		= asix_get_drvinfo,
-	.get_link		= asix_get_link,
+	.get_link		= usbnet_get_link,
 	.get_msglevel		= usbnet_get_msglevel,
 	.set_msglevel		= usbnet_set_msglevel,
 	.get_wol		= asix_get_wol,
@@ -986,7 +979,7 @@ static void ax88178_unbind(struct usbnet *dev, struct usb_interface *intf)
 
 static const struct ethtool_ops ax88178_ethtool_ops = {
 	.get_drvinfo		= asix_get_drvinfo,
-	.get_link		= asix_get_link,
+	.get_link		= usbnet_get_link,
 	.get_msglevel		= usbnet_get_msglevel,
 	.set_msglevel		= usbnet_set_msglevel,
 	.get_wol		= asix_get_wol,
diff --git a/drivers/net/usb/dm9601.c b/drivers/net/usb/dm9601.c
index 2b4716ccf0c5..5540f7ec4906 100644
--- a/drivers/net/usb/dm9601.c
+++ b/drivers/net/usb/dm9601.c
@@ -266,13 +266,6 @@ static void dm9601_get_drvinfo(struct net_device *net,
 	usbnet_get_drvinfo(net, info);
 }
 
-static u32 dm9601_get_link(struct net_device *net)
-{
-	struct usbnet *dev = netdev_priv(net);
-
-	return mii_link_ok(&dev->mii);
-}
-
 static int dm9601_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
 {
 	struct usbnet *dev = netdev_priv(net);
@@ -282,7 +275,7 @@ static int dm9601_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
 
 static const struct ethtool_ops dm9601_ethtool_ops = {
 	.get_drvinfo	= dm9601_get_drvinfo,
-	.get_link	= dm9601_get_link,
+	.get_link	= usbnet_get_link,
 	.get_msglevel	= usbnet_get_msglevel,
 	.set_msglevel	= usbnet_set_msglevel,
 	.get_eeprom_len	= dm9601_get_eeprom_len,
diff --git a/drivers/net/usb/sr9800.c b/drivers/net/usb/sr9800.c
index 57947a5590cc..ee8c6c9d3962 100644
--- a/drivers/net/usb/sr9800.c
+++ b/drivers/net/usb/sr9800.c
@@ -478,13 +478,6 @@ static void sr_get_drvinfo(struct net_device *net,
 	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
 }
 
-static u32 sr_get_link(struct net_device *net)
-{
-	struct usbnet *dev = netdev_priv(net);
-
-	return mii_link_ok(&dev->mii);
-}
-
 static int sr_ioctl(struct net_device *net, struct ifreq *rq, int cmd)
 {
 	struct usbnet *dev = netdev_priv(net);
@@ -519,7 +512,7 @@ static int sr_set_mac_address(struct net_device *net, void *p)
 
 static const struct ethtool_ops sr9800_ethtool_ops = {
 	.get_drvinfo	= sr_get_drvinfo,
-	.get_link	= sr_get_link,
+	.get_link	= usbnet_get_link,
 	.get_msglevel	= usbnet_get_msglevel,
 	.set_msglevel	= usbnet_set_msglevel,
 	.get_wol	= sr_get_wol,
-- 
2.43.0


