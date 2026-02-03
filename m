Return-Path: <linux-usb+bounces-33025-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCFhMANSgWmLFgMAu9opvQ
	(envelope-from <linux-usb+bounces-33025-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 02:40:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D248D370E
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 02:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96D4A301E947
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 01:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51DB27EFEE;
	Tue,  3 Feb 2026 01:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFMEtKdB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6622B5A5
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082781; cv=none; b=ujKS1b+aKOVOzyP6ckIWSW7e33BAkWk/beOy6a5jH8eoXCxv+4pRh0kuj62v2C1XZ0j+a46c5Y/FJtC/MAKIlah7YubkmusNFkxpd7FSeuc5KqJcSPI0Qudees8KcxHz6BrDLRvqKUkHDFxxBG1iiNKJB+tkEvV0GKXa9BNR1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082781; c=relaxed/simple;
	bh=loUI7EgbYb5OeWue2BHmAqWdkjUZ+YRUPFnGs67fTs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHsJTjJPrBApEgmUYnNYM5CkQDx45nVw2TNDL0pda5i1LAlmzAmkUMT71mS0VcN9m/tQDtFHKBc4ADfIUufPkSphW9wzwQdsLuyx5xaiL7RrGbznPREWP3zmfsQBgB3qNUeHZbmOmXkFAnwI4zX2QuHiNOMyb5w9wkVd3Bt99OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFMEtKdB; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b71515d8adso5077657eec.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 17:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770082778; x=1770687578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRsmajcOBWi1yis4RiEAOPVLDZ+gafbhmHNH16HP8tI=;
        b=mFMEtKdBJfdKSF/0oLCCZffy8B52I6C1BcW7o9DKE/IV8vddZpd7GkDcUCQGUq0qO3
         tjPj8SmbW3hPG02dGVicDEHtoY3HZUBJ4oJ/CHQyFkUsBdz3UDeJRKB5PGnrKunY9Yk8
         pCrrZyoknt9Hq1gf5KdEIIAWdX1Dwt5iR5WgGRfHu3HGXALbQh3BO84Jgf9mfB2kaGBn
         iFbjUsW7kHDR89X0NtyNYYovOdzoRj1zB7EkBsloAEM+EaQneFncL2+llfXf+PiRByGL
         SpzGMYm4N7Jkn3LRXR/5L1AzOHcuVyN13TcNZJy52eSItR3Olcuzd8jOUq3uMUTQiP1D
         er6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770082778; x=1770687578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRsmajcOBWi1yis4RiEAOPVLDZ+gafbhmHNH16HP8tI=;
        b=a8WWmdk8knJT6LK5mYe/IX3sUnSRG9L+9k9EGAfiGQENRwsHaX09iDbOTvCi3C8TVg
         GyUmMM+Oq2rNL97bwpwFikLe68DsWVch+F9o0P3ox9it//q9MQ0PD1IemAlJxZZ3uX65
         TG8TEQuJ+Vd9ttXGwM0x8115YiFri/PBkNorYdCodEOBN9Dm1XUJM+NqfdppZzTQcupT
         I53auT2WLCX0YFX7rviwhGYjnn626RjX+3yZR/fmeJBQyiJHyvXfz1PQKzQxmPz0FhUY
         0tDrmzedDZFMMCyWd16+ySdUaqAjpcq7XMpD3DYwoPDpwiwLIKUKQ2j07JAkGr3XD+OY
         1fUQ==
X-Gm-Message-State: AOJu0YxeGhB+kDnS1MRP8CHyX0B2N+GFfgjgd/EKrB8rrmaG3DbG9SKc
	2VrPuxrO4xIBKI8Wm7V56UOTI6Xy0Cu6CL8a9sZ8JhPp2JaeEUy8sL6F4kjunP+u
X-Gm-Gg: AZuq6aIQUPeVJ4n2ty5j4hu6ofgZFf2xQ5I+J5lg2jd2HiGgWURQpp39m/90p4wdoxh
	Tq3Ze5lEttt7AnzJ+zLAwZI30Jk7/WD8hqjpk51QatC9tx9j9PtXhEZ6Brj7yEhLHzfYXlsmLQJ
	KSoK4or39pWQQDOrA9Qgw8ewe6i3JHvFBrVgKD7wby1urSfw05kcrONWerOIFaB6jg1NWb4SNek
	foW/I2ncVB2QzytkbHiET/7OUvU1PJHY7Y19LZ4D+nXxIe1nn4pb0xUsHt/HgZKpvJE7HB9XxFq
	eyfw7p3LP0KiE+bu1uXXwwYMKz3MBM5UDpyTnXGKUKO+2yCJ+0tNBp5WE6ZAhDaixGN4P0/qQww
	AXenklJJrKXvRhTKJjXLn96f8rvJ/+llbLAR/UgsBPBgncAeI7x2dVH3EkBcLtbennpKVj/HXGb
	DiCojwvpaQv0vN0/yq7QrPvJaBgiiwSr966bdMhQBB6/AKW5bKsgJ9E4b82vKdCp1ArPaBlDdxb
	DjKvOO5zwnFSEA8tb4eZCKLMJK1R+z6ZdIlIpjQXNPVYM9RxrhjmYfP9m7rVF9fTKBGUIzScYpH
	zJE+
X-Received: by 2002:a05:7301:2f95:b0:2b0:4b5b:6820 with SMTP id 5a478bee46e88-2b7c88da4f1mr6045650eec.26.1770082778320;
        Mon, 02 Feb 2026 17:39:38 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abedcasm21162096eec.21.2026.02.02.17.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 17:39:38 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Eric Biggers <ebiggers@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH net-next v3] net: usb: sr9700: remove code to drive nonexistent multicast filter
Date: Mon,  2 Feb 2026 17:39:09 -0800
Message-ID: <20260203013924.28582-1-enelsonmoore@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,pengutronix.de,armlinux.org.uk,korsgaard.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33025-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev,kernel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D248D370E
X-Rspamd-Action: no action

Several registers referenced in this driver's source code do not
actually exist (they are not writable and read as zero in my testing).
They exist in this driver because it originated as a copy of the dm9601
driver. Notably, these include the multicast filter registers - this
causes the driver to not support multicast packets correctly. Remove
the multicast filter code and register definitions. Instead, set the
chip to receive all multicast filter packets when any multicast
addresses are in the list.

Reviewed-by: Simon Horman <horms@kernel.org> (from v1)
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2:
Remove unrelated cleanups; adjust commit message
Use netdev_mc_empty()
Changes in v3:
Rebase on latest net-next
Drop now-unused CRC32 Kconfig dependency

 drivers/net/usb/Kconfig  |  1 -
 drivers/net/usb/sr9700.c | 25 ++++---------------------
 drivers/net/usb/sr9700.h |  7 +------
 3 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index d050adfe860a..52a5c0922c79 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -319,7 +319,6 @@ config USB_NET_DM9601
 config USB_NET_SR9700
 	tristate "CoreChip-sz SR9700 based USB 1.1 10/100 ethernet devices"
 	depends on USB_USBNET
-	select CRC32
 	help
 	  This option adds support for CoreChip-sz SR9700 based USB 1.1
 	  10/100 Ethernet adapters.
diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
index 49764bcf0912..937e6fef3ac6 100644
--- a/drivers/net/usb/sr9700.c
+++ b/drivers/net/usb/sr9700.c
@@ -17,7 +17,6 @@
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
 #include <linux/usb.h>
-#include <linux/crc32.h>
 #include <linux/usb/usbnet.h>
 
 #include "sr9700.h"
@@ -231,31 +230,15 @@ static const struct ethtool_ops sr9700_ethtool_ops = {
 static void sr9700_set_multicast(struct net_device *netdev)
 {
 	struct usbnet *dev = netdev_priv(netdev);
-	/* We use the 20 byte dev->data for our 8 byte filter buffer
-	 * to avoid allocating memory that is tricky to free later
-	 */
-	u8 *hashes = (u8 *)&dev->data;
 	/* rx_ctl setting : enable, disable_long, disable_crc */
 	u8 rx_ctl = RCR_RXEN | RCR_DIS_CRC | RCR_DIS_LONG;
 
-	memset(hashes, 0x00, SR_MCAST_SIZE);
-	/* broadcast address */
-	hashes[SR_MCAST_SIZE - 1] |= SR_MCAST_ADDR_FLAG;
-	if (netdev->flags & IFF_PROMISC) {
+	if (netdev->flags & IFF_PROMISC)
 		rx_ctl |= RCR_PRMSC;
-	} else if (netdev->flags & IFF_ALLMULTI ||
-		   netdev_mc_count(netdev) > SR_MCAST_MAX) {
-		rx_ctl |= RCR_RUNT;
-	} else if (!netdev_mc_empty(netdev)) {
-		struct netdev_hw_addr *ha;
-
-		netdev_for_each_mc_addr(ha, netdev) {
-			u32 crc = ether_crc(ETH_ALEN, ha->addr) >> 26;
-			hashes[crc >> 3] |= 1 << (crc & 0x7);
-		}
-	}
+	else if (netdev->flags & IFF_ALLMULTI || !netdev_mc_empty(netdev))
+		/* The chip has no multicast filter */
+		rx_ctl |= RCR_ALL;
 
-	sr_write_async(dev, SR_MAR, SR_MCAST_SIZE, hashes);
 	sr_write_reg_async(dev, SR_RCR, rx_ctl);
 }
 
diff --git a/drivers/net/usb/sr9700.h b/drivers/net/usb/sr9700.h
index 5c04ea0306c7..d1663cb1e8cd 100644
--- a/drivers/net/usb/sr9700.h
+++ b/drivers/net/usb/sr9700.h
@@ -101,9 +101,7 @@
 #define		WCR_LINKEN		(1 << 5)
 /* Physical Address Reg */
 #define	SR_PAR			0x10	/* 0x10 ~ 0x15 6 bytes for PAR */
-/* Multicast Address Reg */
-#define	SR_MAR			0x16	/* 0x16 ~ 0x1D 8 bytes for MAR */
-/* 0x1e unused */
+/* 0x16 --> 0x1E unused */
 /* Phy Reset Reg */
 #define	SR_PRR			0x1F
 #define		PRR_PHY_RST		(1 << 0)
@@ -158,9 +156,6 @@
 /* parameters */
 #define	SR_EEPROM_TIMEOUT	1000
 #define	SR_EEPROM_LEN		256
-#define	SR_MCAST_SIZE		8
-#define	SR_MCAST_ADDR_FLAG	0x80
-#define	SR_MCAST_MAX		64
 #define	SR_TX_OVERHEAD		2	/* 2bytes header */
 #define	SR_RX_OVERHEAD		7	/* 3bytes header + 4crc tail */
 
-- 
2.43.0


