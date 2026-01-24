Return-Path: <linux-usb+bounces-32663-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CUtGCM7dGlt3gAAu9opvQ
	(envelope-from <linux-usb+bounces-32663-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 04:23:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B077C4BE
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 04:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26CCB301BCD4
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jan 2026 03:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BAB25785D;
	Sat, 24 Jan 2026 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8aFMEDY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDE1150997
	for <linux-usb@vger.kernel.org>; Sat, 24 Jan 2026 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769224979; cv=none; b=qb0EaBlLy0J6Vvw2uONxzQhylWEBWLqLWs/FINjIWgrdC+It3Fb0p1l4uJ78DD/8XZtmAjxBpR6OTv2GicCJh+qizWmSzS91utAEst+5BPlxk9NCaCnI7NSS20Bde8NzLGLV9/hOR2isGKIeaTIHt5tUUxvv27HyTlNaLXz3BIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769224979; c=relaxed/simple;
	bh=hz4PGhjGMavgsH90Kj08u7Yi8vVczpJyk4hknyVJULA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nWb0jOgqGLry2QiRTuZGpo6fwsYeOugJJzMlPddG5juBO96k2ZIJA8BtxCJmybKu0kDhY5NRh6cQiYlbfGTeVd/8oNrVfge1FLbhavcFboHFdLdhb5rKlDJ2p9mm68Sd1zQHCPl/vMy22EKM1QN+QVIQsUyuQVfVfJrdtLffo44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8aFMEDY; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso6871408eec.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 19:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769224977; x=1769829777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0oLk/yYsqWZDJCvnFpurWUS1lV8pRnDLAfMkKbWKpcg=;
        b=Y8aFMEDYbS2wDmWh5V+zSffScbHVSqLMOpK62THbXl33W/l5xc0gfupn/m+wvQ+ug/
         Nmh9ZQDovO0C33aRziv2NoBxTUfl42leOqihecS36EWRfmzM6zS40XOcbUOUdxdEE7I+
         Pq1wuj2NJy5YkVzP9ytuuJp2b7V1UEPy75vd5Aifio/cAwDGCvjmvsPvaSOxj/un+Ueb
         kESGhuRqSToT5Y+EZwSj73WguRTHeoKCIR4qz7EBfQMK5wRGr2EVADZpI1tZIdjyolZC
         QePs/m13aglKIqbY8w5xT0ofrWxn29/cUFvcxDgrVhvt7bTKYY14j32ICRASHB4mequ4
         Ddmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769224977; x=1769829777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oLk/yYsqWZDJCvnFpurWUS1lV8pRnDLAfMkKbWKpcg=;
        b=dyy2czPi9qTr3jiNOLpPuMLgxh/ObBUfPwbE2C/vNnW3QQ9IX7V+7LgpAWGDS5zXd9
         AYpNwTVq8jF6DuljUdCLxkg+SvPPRV67NKvHtFj06UlkDCQkQ7yuVTrJ0BaUN3oEjwED
         nkbLL7w+qQNEAWIQzTbcCeyfPpmOSq3Q9vq4+o5TIjuzTeNIuFi/8ww7mMlhY2GmZ3zI
         2g4GsGqyyAwUJgBuITAw1VwmEtfA+ZIIagY+33jEiITRQ1uvP04RwJss3RHCqN0MSKFp
         2JQoSPqNclbekWIyukTzpJcfPgcH3B6pOQrg1phyGOtJXJIxPKP7bB97f+i3XLWuZi15
         ELGA==
X-Forwarded-Encrypted: i=1; AJvYcCURkvlkpvlwkPIhUNy2tP4tEQizzR7x2ECSnTYBaNZFvNGRnRLX15rErW5P/pJ7JCoKqshggZCvTFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5vhw+DjReD95W8LxECgXinFtH+o68rX35UjRtqDbqVDgJyNI
	TfgVqSlm+7VkZU2gBsOTpZfU2U4tAXnYhgca77VdrV7Mk14YEHG2Wyqd
X-Gm-Gg: AZuq6aKgJV7T959vkO043lFFC4vdxGHjYhZWSkZGeHFUAsM1MWnfNh5tEfaXBwUvmkz
	JnA3araGlwtvru3eMnUyo+v19mjpmWUR9rCj7Z9RpUxJ51UOpFAMuwD49JCLev2DW5iXdY2qdkg
	I88/Y32FYsQP3bhvlYLZ4E0UblZuGwn8bH8wZ89Ldfq0WfwzRXVmndk1XiS7xzXGWvQafSNV5I1
	IpdOOQGB9+L/oU9STt+BcQjy0G5b2MLGxnvdzfvtSPCYz2hRfMkRK0ESFjT10dX1nKvKSAVBS60
	im1/wd89oZlA/c5BWhGuc0zFwAKGGyHPLZUZQM7jym8SfiBpJyR31bXN8OThGnkYxMNHJ1ua7AJ
	yXSEdtpI/B0TvQch5FUgmBC8JYa+0chkiZ0J188gYTw/DAMjCdfduf1JRV+ajsVcDBna0SoHs+z
	7BPYY7sNOfu3zWlkYv35r5nWechXXyBqxtHGi3d77u+Th/xd4vIrGN3vKq7Uxvpe4sTyfXYQo4T
	iDmjAko8C7/9Rs3+8jcNr0a8S2QkUF1kZlujGb97KfBPSwu+tSzfy7vPuUE4bOqlnp7nfebcYS1
	0jBb
X-Received: by 2002:a05:7301:fa87:b0:2ae:5b01:bfa5 with SMTP id 5a478bee46e88-2b739bb249emr2963832eec.32.1769224977502;
        Fri, 23 Jan 2026 19:22:57 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa03fd0sm5540278eec.23.2026.01.23.19.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 19:22:57 -0800 (PST)
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
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next] net: usb: sr9700: replace magic numbers with register bit macros
Date: Fri, 23 Jan 2026 19:22:43 -0800
Message-ID: <20260124032248.26807-1-enelsonmoore@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,korsgaard.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32663-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F3B077C4BE
X-Rspamd-Action: no action

The first byte of the Rx frame is a copy of the Rx status register, so
0x40 corresponds to RSR_MF (meaning the frame is multicast). Replace
0x40 with RSR_MF for clarity. (All other bits of the RSR indicate
errors. The fact that the driver ignores these errors will be fixed by
a later patch.)

The first byte of the status URB is a copy of the NSR, so 0x40
corresponds to NSR_LINKST. Replace 0x40 with NSR_LINKST for clarity.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/sr9700.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
index 9c7cd0db1768..8ffd2391e6d7 100644
--- a/drivers/net/usb/sr9700.c
+++ b/drivers/net/usb/sr9700.c
@@ -366,7 +366,7 @@ static int sr9700_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 
 	/* one skb may contains multiple packets */
 	while (skb->len > SR_RX_OVERHEAD) {
-		if (skb->data[0] != 0x40)
+		if (skb->data[0] != RSR_MF)
 			return 0;
 
 		/* ignore the CRC length */
@@ -455,7 +455,7 @@ static void sr9700_status(struct usbnet *dev, struct urb *urb)
 
 	buf = urb->transfer_buffer;
 
-	link = !!(buf[0] & 0x40);
+	link = !!(buf[0] & NSR_LINKST);
 	sr9700_handle_link_change(dev->net, link);
 }
 
-- 
2.43.0


