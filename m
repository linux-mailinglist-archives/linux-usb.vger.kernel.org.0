Return-Path: <linux-usb+bounces-32702-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDnIODsId2lGawEAu9opvQ
	(envelope-from <linux-usb+bounces-32702-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 07:22:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA978474D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 07:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 220543005D14
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 06:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9025C26F46F;
	Mon, 26 Jan 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c01LnzpM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD19923AE87
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 06:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408494; cv=none; b=UF8OpVC5SFNOVbHGIceQOXryKp1RtP8HqE+lI6CzuqQqM6AcW3bPXkk28EQ9MOUik4APU5I0/YSTrSXvegeXTuN5jg4BPs4rvxXE8FiLZBHeuwuDbhGLQunX0JRFRXBdoc2rsTFy9KxjtwFuTxlleFc2celOxfSbh4YchTo+12E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408494; c=relaxed/simple;
	bh=MwLSOA3uQCNtmf71JgeF5X8NEQ2zmM0uL2ZVH33yHVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i29Br/vy1+j5qor/90KmD0mBai3TZQA3oiKe8jcSpWXgD5S3jYjKMS1xpPQpuomEMFm77I04dgL9a39BF5/8P1xv1yZjiN4+F5CfhEHEBn8NYXmXhwv7qcGip5m9hpB3e37x5Yz1PhhcIuc7k42yNUyfFW3HTrCWyoMX6tRpI6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c01LnzpM; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-563610de035so4016869e0c.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 22:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769408491; x=1770013291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQBy6DRxXy5h5AscbNfB5n+HhsWUMKIsOSrmArTqC34=;
        b=c01LnzpMN8uKxZPsSBBFT9/kfYFUsRTOFAelUfRorqAaDVyGP9AU7sJcaPlkpQUggo
         AmVbdj5PfSDWTkiI6J0OEfK7z7NwzzBc7+jkhR5TcRjc8myNNG1NMnCyjH67j06pkfsH
         UaxTU8eqs/6nLukWXt6V7VnUqoYFWWaZUtTJEeTxagEqYWuCfzw2jaqnK3h1/wIaHNdm
         z9a4fnNOV1ueJcTlg2zrGz3W2RGns43MlSPJKFOWFm4j7s8APRlT9TSA2Nb6vRXy1bad
         TYttYNakXwdwdOFfKDIKCKTvFbpEaVd6C5avxyNj0fka7Jex2Rn7l9PBTN0wEOqnj07Z
         g6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769408491; x=1770013291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQBy6DRxXy5h5AscbNfB5n+HhsWUMKIsOSrmArTqC34=;
        b=X875nbMm0Te8BGhg7JlpeyW27UCRmgZAPZ71/1tDk0FiEhdi7hGjOxuRG6/BxQFKMC
         djueTYKdN8D9Ja2YYOoXIXJMysbSvgmbh6UVTq+ieYTzU1Cbj1LWG/6DfhmEJdPQTG/Y
         ZDtj4sisVGXJD0vu5c+20higDZlszgs01IVOhOX3xmfpKO9lGe6oteTgUEit8w048Umb
         4ZyozZKdBrLdAiyNvW4A8vWVEzzUJpnNxTP0eytwbmqLQ6Z6jmFNcCM8Z30AEOiKgN/F
         WbOflXlvDoF3su8ITVCu92mDRdiXGm7SyTl/8uVBxcSgVHjC3HlJs9FHR8WX9XU9ia1V
         Ef5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcWqmQvZ6Nzu65mXgN25fvh1ugLtkCL3hc0yZLv86JpW0/ArrXgtEGYaOXPmfhbKySwaW5MtAVZsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCED0Gg0jhv+jBO+nnj7s86WrQuf/5MOVglGVyBRsllIwMe/G7
	IYR3JM9FFS1S1d4Qp/054OiNcHGB175PxkW+G5oux+eAShqHVTWP5JAk0cbXax/Z
X-Gm-Gg: AZuq6aIJ+0kym5UnA+Myu+XoOlr1TQpr/hxbW9GHcgwcD1wfmp4hv+BkxGcZ1511TBa
	egss2dST6tvryNVjmgw5nBPcbwENmSEiXZb30dFfFbZQfMRY2j/fof2LmI3hs4FMg7bDKJYotJ/
	eI+F3wMqnOuk+C30WwdZ/qRGa5cSgind+LkVPv0gl0gC1ukLXxfPpEWICK3l83bHQGBMvsv3Ta5
	9NCEzIEPwtlSUfzDWKV+NWFV7oo0aLDFJmasW2diZIO52Zh/9GULzUZybMOgYCRReNXmvRnaXns
	qMc7lkS9s9SOB982Ba06t4SHbOaiLZ9SKlUmrdb3Z3Q3nOP6b7EuDDl1p+TRrqvuQSM3CWeUCO5
	FhYjTzqbAx1ntLi+FDERXAW7ehecSxbGLqNFo59W7JJhms9SimIPQUeyaeeS7MPLfzwNfjsdhpq
	8op1ohKkyRM25SKhNC6eMhoCgUKxyRrIV2sUtgRUzXUYWRUmq7we30BqkbKs8gUoX0BoxJWHSx0
	UULjReo3WDQzSWJHCiaW7ZJe5hWw+NCX8mNB5yEE49fdq43M/7dQAYoO/ZhVqenY0VU6vSiMVS/
	uJ3E+Ys8
X-Received: by 2002:a05:7301:1691:b0:2ae:5e6b:dc41 with SMTP id 5a478bee46e88-2b7643426cemr1437848eec.14.1769402493623;
        Sun, 25 Jan 2026 20:41:33 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-22.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a9e1c52sm11728841eec.16.2026.01.25.20.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 20:41:33 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Eric Biggers <ebiggers@google.com>
Subject: [PATCH net-next] net: usb: int51x1: use usbnet_cdc_update_filter
Date: Sun, 25 Jan 2026 20:40:39 -0800
Message-ID: <20260126044049.40359-1-enelsonmoore@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,pengutronix.de,armlinux.org.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32702-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BA978474D
X-Rspamd-Action: no action

The int51x1 driver uses the same requests as USB CDC to handle packet
filtering, but provides its own definitions and function to handle it.
The chip datasheet says the requests are CDC compliant. Replace this
unnecessary code with a reference to usbnet_cdc_update_filter.

Also fix the broken datasheet link and remove an empty comment.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/Kconfig   |  1 +
 drivers/net/usb/int51x1.c | 39 +++------------------------------------
 2 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 856e648d804e..d050adfe860a 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -564,6 +564,7 @@ config USB_HSO
 config USB_NET_INT51X1
 	tristate "Intellon PLC based usb adapter"
 	depends on USB_USBNET
+	select USB_NET_CDCETHER
 	help
 	  Choose this option if you're using a 14Mb USB-based PLC
 	  (Powerline Communications) solution with an Intellon
diff --git a/drivers/net/usb/int51x1.c b/drivers/net/usb/int51x1.c
index 6fde41550de1..87bd6be1fcb6 100644
--- a/drivers/net/usb/int51x1.c
+++ b/drivers/net/usb/int51x1.c
@@ -4,14 +4,11 @@
  *
  * Intellon usb PLC (Powerline Communications) usb net driver
  *
- * http://www.tandel.be/downloads/INT51X1_Datasheet.pdf
+ * https://web.archive.org/web/20101025091240id_/http://www.tandel.be/downloads/INT51X1_Datasheet.pdf
  *
  * Based on the work of Jan 'RedBully' Seiffert
  */
 
-/*
- */
-
 #include <linux/module.h>
 #include <linux/ctype.h>
 #include <linux/netdevice.h>
@@ -27,14 +24,6 @@
 
 #define INT51X1_HEADER_SIZE	2	/* 2 byte header */
 
-#define PACKET_TYPE_PROMISCUOUS		(1 << 0)
-#define PACKET_TYPE_ALL_MULTICAST	(1 << 1) /* no filter */
-#define PACKET_TYPE_DIRECTED		(1 << 2)
-#define PACKET_TYPE_BROADCAST		(1 << 3)
-#define PACKET_TYPE_MULTICAST		(1 << 4) /* filtered */
-
-#define SET_ETHERNET_PACKET_FILTER	0x43
-
 static int int51x1_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 {
 	int len;
@@ -104,29 +93,6 @@ static struct sk_buff *int51x1_tx_fixup(struct usbnet *dev,
 	return skb;
 }
 
-static void int51x1_set_multicast(struct net_device *netdev)
-{
-	struct usbnet *dev = netdev_priv(netdev);
-	u16 filter = PACKET_TYPE_DIRECTED | PACKET_TYPE_BROADCAST;
-
-	if (netdev->flags & IFF_PROMISC) {
-		/* do not expect to see traffic of other PLCs */
-		filter |= PACKET_TYPE_PROMISCUOUS;
-		netdev_info(dev->net, "promiscuous mode enabled\n");
-	} else if (!netdev_mc_empty(netdev) ||
-		  (netdev->flags & IFF_ALLMULTI)) {
-		filter |= PACKET_TYPE_ALL_MULTICAST;
-		netdev_dbg(dev->net, "receive all multicast enabled\n");
-	} else {
-		/* ~PROMISCUOUS, ~MULTICAST */
-		netdev_dbg(dev->net, "receive own packets only\n");
-	}
-
-	usbnet_write_cmd_async(dev, SET_ETHERNET_PACKET_FILTER,
-			       USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
-			       filter, 0, NULL, 0);
-}
-
 static const struct net_device_ops int51x1_netdev_ops = {
 	.ndo_open		= usbnet_open,
 	.ndo_stop		= usbnet_stop,
@@ -136,7 +102,7 @@ static const struct net_device_ops int51x1_netdev_ops = {
 	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_set_rx_mode	= int51x1_set_multicast,
+	.ndo_set_rx_mode	= usbnet_set_rx_mode,
 };
 
 static int int51x1_bind(struct usbnet *dev, struct usb_interface *intf)
@@ -158,6 +124,7 @@ static const struct driver_info int51x1_info = {
 	.bind        = int51x1_bind,
 	.rx_fixup    = int51x1_rx_fixup,
 	.tx_fixup    = int51x1_tx_fixup,
+	.set_rx_mode = usbnet_cdc_update_filter,
 	.in          = 1,
 	.out         = 2,
 	.flags       = FLAG_ETHER,
-- 
2.43.0


