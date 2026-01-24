Return-Path: <linux-usb+bounces-32668-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFZlJO19dGne6AAAu9opvQ
	(envelope-from <linux-usb+bounces-32668-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 09:08:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C97CF3F
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 09:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE28C300A61C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF9C271469;
	Sat, 24 Jan 2026 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1LefqPs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56284039
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769242088; cv=none; b=uIDsa9mUX6xwP0iLX4o6YF5sIsNrMauKCTpTSWfOT+4wb2YnIMzKHE+9rJhB+p7BZR1rl5ATSDdey23mSpRkXhgpq0n5OF+LnQSqphwj5oeV+99cqOLZ4ygu6zKYGzkAxKxDkgtveG0bQ1Z/Ac3uWJQ/XIBKIbo57/RwXsIClfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769242088; c=relaxed/simple;
	bh=mlN9zkh9M3tZt5lOx2N1rJAxHiAi5K7DEEmHZYCmjS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQobw+HB//rLQdd9+SNIyW27ak1dFxdI0TyKWda4KCin7ft/GuOJSrvH2le9Vbop1XI747VakLEm2sQbNxcZ0pmJRGogOnDQumek8TPEZJyq6eVytZKGQOLujfIids63kUw3xIn2Bii3ytqpvDI9P4KdTx5y5Y5qdu+nZlItI5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1LefqPs; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so5182782eec.0
        for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769242087; x=1769846887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxFsfTf/n8/5lnAFGn+tLoUnsynlfYu93KTb4EE0l88=;
        b=X1LefqPsPeK+XaoKW9/ngCzIzGaeXJ5RndGyNbgGj7pk9CeADoM2b1RDgnQ292GXax
         qhKF0qQZCkRMvWw0YKV9btqA9OCsFCPB36Bwn5LBnba9Hqru03czYM+/pxowLq/jQ6kn
         cSiv937Am6Pw3hBzTdgd5LbEWbaSYpUY7AUUp2udrU0/5YwtShH65C4+Z7iKqld3ZDnn
         3MfCLOcjkBhjcPhkM538w9nwd0gc/OFcXe5HkV/EzjPo0O1el3lgLiJBAi0zHH/eysL7
         NLuMpAIkZJTHACVuL/ONdW7FudCJ6QzF8G9JUs8gN7njYkM6+yHBXWbNwpa7JGDtwfC4
         C6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769242087; x=1769846887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxFsfTf/n8/5lnAFGn+tLoUnsynlfYu93KTb4EE0l88=;
        b=JLgulk+PRNxuLqcvRCGPm5pA+9K2lFfS+lcTTo3jDOAGRejEE0LNXIcObhYc/ERAMK
         6DVTQGTPRGui3D+dNDdf8juRKRyum0zvjB2CnhMwiqWj8TizmI6F9seWHty8f16fXgf8
         vZg+ep70Hv1M0OpYdD0tZRy9u0A8iH/oPtNpBj30g6jI2dBRVoBc52zKc3xA+yhJ0XLv
         b6jyym8b+M1HsWmbAAli6kCn/F8+VcK9btlwvUTVx1/kQDzkiYe0dxKgpJHX6MSODXDv
         YfJv+ifSrqFP22+g77xkyZafVVD4WSB89drpoI24XwXMq+dcvkfORE/IXjzicad3YPM7
         w0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWCcqTo5PietiXJ7jTDmvW4wdnmPtAHccukrpdsobq0ih/3ShuTAXqN4S/cICOyYAsacQZKQilpXx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAF3IuhSu7j64zoQ+lHDbz5fHnxSNryGBn4gYhPtQZgYoPHpI
	o8g0jLxCTIqHOo34bLNVIOkRqBTevy+LT2MduGTBLGWZbsPyYRUKEQOD
X-Gm-Gg: AZuq6aIK2ulnTCclLtZpPiXXocl9XzwjkfsCOfwrL9cuATE9Ag0+nvParhBVxRH77XQ
	zaEfZz4g/iIESguNmPnw28W+xkw319zS3qjy92MpmSusZXQx0BUjIysI9Zrsrs+YIPwBXaJI1k8
	76PkxRw7rGn3t8elRuFl1eIkRrgdPZ9vG1r7aFOl61OlXGwxJkzUKneB7quSDIhOhQ4J2KSlXGV
	KNCQiS4dkLd7H6oYgPSOMDuRm2dNV99EXR/8sA2o32TtWPxp55aIh6k8LFefMm5kLiIo+eBjqwP
	UYm3mQ8bGVAAUqgEba8Pzs9B6b8Hl8HVt/i4ShBoU/DU1u4CUXn4iLqr6XlefYjRsHQju6T45mq
	aIzJPdU6pesyGjDVDJoCdDdq3SAslFZIjPHKT2qQauG4EwuviHk1qY8jT8M/hBo5+qBlduPtXM6
	bZD13sFJk8fYcb/T7+DLfpX4t5e3PFkR4nuzqUGCiff2c/RlMsYb2gPBsZBnatTOYxLtH2wOgKq
	p/aLeEb8dWyCseFR0aV6u43477tEnNvsA9wLx1NtOJiwMAE18tIqXhFrlyKY1FdjYnDRYWLZulU
	2lKd
X-Received: by 2002:a05:7300:e613:b0:2b7:20c6:36cb with SMTP id 5a478bee46e88-2b739bc033cmr3268834eec.34.1769242086553;
        Sat, 24 Jan 2026 00:08:06 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90d13esm8155986c88.2.2026.01.24.00.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 00:08:06 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: usb: smsc95xx: use phy_do_ioctl_running function
Date: Sat, 24 Jan 2026 00:07:51 -0800
Message-ID: <20260124080751.78488-1-enelsonmoore@gmail.com>
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
	FREEMAIL_CC(0.00)[gmail.com,shawell.net,microchip.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32668-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F7C97CF3F
X-Rspamd-Action: no action

The smsc95xx_ioctl function behaves identically to the
phy_do_ioctl_running function. Remove it and use the
phy_do_ioctl_running function directly instead.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/smsc95xx.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index de733e0488bf..c65402d850c9 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -854,14 +854,6 @@ static const struct ethtool_ops smsc95xx_ethtool_ops = {
 	.set_pauseparam	= smsc95xx_set_pauseparam,
 };
 
-static int smsc95xx_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
-{
-	if (!netif_running(netdev))
-		return -EINVAL;
-
-	return phy_mii_ioctl(netdev->phydev, rq, cmd);
-}
-
 static void smsc95xx_init_mac_address(struct usbnet *dev)
 {
 	u8 addr[ETH_ALEN];
@@ -1139,7 +1131,7 @@ static const struct net_device_ops smsc95xx_netdev_ops = {
 	.ndo_get_stats64	= dev_get_tstats64,
 	.ndo_set_mac_address 	= eth_mac_addr,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_eth_ioctl		= smsc95xx_ioctl,
+	.ndo_eth_ioctl		= phy_do_ioctl_running,
 	.ndo_set_rx_mode	= smsc95xx_set_multicast,
 	.ndo_set_features	= smsc95xx_set_features,
 };
-- 
2.43.0


