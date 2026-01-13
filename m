Return-Path: <linux-usb+bounces-32224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4827D171FC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 08:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0728303DD0E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 07:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD00C30F95F;
	Tue, 13 Jan 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/WgJlmV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5AF2FC876
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290882; cv=none; b=CD8XDnokgAD7VUxGaIrK3pikZ9bnBKaeOYps7FcKOTQgmRX4JzqL21MgLqHaaQmyPG0QloPgG4ae7osPe5LqnSPOTegS3B6T0bvI9fMl7H4j6aQ53RIAj9pNdOnVac0F1+4GhAAVZTu3YNHpH7r/Ql4WV+wUwcPzYAl6yvn/sMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290882; c=relaxed/simple;
	bh=mS/ImxgTIPtYHtUdYa5+DcwmvWKqjwrkf785uukIzKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rtAEf1vh+5J7pqFJBx+j4MgaUd+oM2Fo8s6TW1IXPEJHHoq47U1OcqSMOcl4ct1Qvvvx0ZfAE8/Xk9nukAOR7zISndP+6NtzbsZcE2tCaWOyWj4kn+sLsvOweWCVxg8p/DsYt0Kb8Rh80QT29trAyskBLyzQ6u73sBzBXtTidCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/WgJlmV; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-121bf277922so8477974c88.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Jan 2026 23:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768290880; x=1768895680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CuO0PG+ZQzuLZ5RUQqnVTS6xiXIubFViGec4PWXsLyo=;
        b=m/WgJlmVH308WcAftwEuRQIGwuzST+vETpxtJb6ZxlGHnI/HqRBEmz6ywZBvTtt6Q5
         0RUhwSOl6YrNcfl/IcO16UsY/31fknf3cyo7gcW9L4ryG3LR/wmCewBzpJCSdESZr4Ji
         +M0EbXKNpZqpr4D68qeXw2s630LQA84damqoF5YXsgG6KCXtnOpik8/1kLXeq/iQvQ+M
         JVbkxSUj6pAzz0I+B/UmWy265JhaidTTu7+sQGSKSLEq9t0ZDPAfpY6VrWmqRZ5khwit
         T92RDnx5v6KVuPlbF142/9MhcvVZlcmJUQgKwswEQheTbJoy7Q9pnR4v7se60tT0tg1I
         j4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768290880; x=1768895680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuO0PG+ZQzuLZ5RUQqnVTS6xiXIubFViGec4PWXsLyo=;
        b=DUkWFzwujxvuCQSEK7j6ur/46/9zDxYQr8BlaUPRkYVQVWhmNrS25EOxiXJQzKGzEz
         xZCv79jz2Vwyx6isIwntvAzZs06LwfGZcNnkaH86bdERB+DnOFhU+qWIykS7RXQBFT4k
         R/srLWhH41KuyUK3MCH46765UjjubLmOLlmQ1iR8OaCn5++/84lSNQ7/M4JECnxAPZ7q
         jHKiGMnF02F9/SMHAbkZa3/APZ756imsKe9wyBJfNGwpz793Muxm4dxHrHZt+BdxBkyU
         b5eVLkVLso/ITQ/Bb6PTYk0DNal3/Bjc31x7AYdgyiqPG9aqBTzcmKKrgVuYu309NsNi
         CPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl6bzvWW50bQPweO097OHbu19jlAsqUSkjCSJ/PcPTabidPqs7c8bF9bGQR+tL+QzBdw0OnDGPmyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrijKYJn+H9E4SK5jrH3UNRJG9jwSvR67tNWL1UCKSSs0kHzjX
	3TW9CGNaFju6U+wNbG1SKGymcQFRfJFFPDIoIy8t8CMuDyaL2ve4yZsf
X-Gm-Gg: AY/fxX7QM+Ox7UfNb2kW/rUC2XbzkfZJbBeJa9qI4hWT4UltxCfHAVzJg8pjPIm6fmp
	Ww4L5j0QzGKtlqqxtTh0j5uJUlUTT5iPS9CE8ndUJhPjc4f4KyXia7maknDVZul5562mR/Ivncr
	V3cJpCHG5qWirsIXX+6vZcvw/LQlxyEI6fq+2jakO1PWIfjgVuCLEZgDoUPEqbmt4LWHcGxaB4m
	8H5v0kijCroFmwcp81cKzOQMs0D68vt7Nv0ei8JTG+UaD+nos5M/D1xbHhEiIpdpON71E2rtLC5
	JScfGIHzphysE3fRZuFxX7v+n2OhoL3I3bS5RXHGaYI6sL0DiPWW8NbeY4GFcDFKlJjRmb9oyb0
	lpChJ870iFiLNSUznIEVPNJXsY666XdA4mi+r8mVr1mMtbK9xXjRO6IHZn/3X9Ou1l7mCe2JvDP
	/TgQ4wEbw+5/Kfg0rCMA1+blaqei2aD3dVdB+Mv89Pb7bCppyrl3sB7NQs1Zim3a91CC21Xyrrx
	mwy9C2lGh5dX6u0wHae7wA40Wegh3rM2TZtEdTl9arL4iC2aLwezJebIH0XWLJFDuat30j0VDSI
	p4ZZ
X-Google-Smtp-Source: AGHT+IEtGVA2RgxpZWzfCl72bC4LOBfDTppM9kYSwY0A/WyalYIfn7eXGCw5y6PKJ586/rRp9GZkYg==
X-Received: by 2002:a05:7022:3d88:b0:122:1e3:5356 with SMTP id a92af1059eb24-12201e35552mr8557633c88.29.1768290880248;
        Mon, 12 Jan 2026 23:54:40 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm26901889c88.4.2026.01.12.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 23:54:39 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: usb: sr9700: fix byte numbering in comments
Date: Mon, 12 Jan 2026 23:53:21 -0800
Message-ID: <20260113075327.85435-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments describing the RX/TX headers and status response use
a combination of 0- and 1-based indexing, leading to confusion. Correct
the numbering and make it consistent. Also fix a typo "pm" for "pn".

This issue also existed in dm9601 and was fixed in commit 61189c78bda8
("dm9601: trivial comment fixes").

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/sr9700.c | 42 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
index 820c4c506979..bd90ac40acdd 100644
--- a/drivers/net/usb/sr9700.c
+++ b/drivers/net/usb/sr9700.c
@@ -391,20 +391,20 @@ static int sr9700_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 	int len;
 
 	/* skb content (packets) format :
-	 *                    p0            p1            p2    ......    pm
+	 *                    p1            p2            p3    ......    pn
 	 *                 /      \
 	 *            /                \
 	 *        /                            \
 	 *  /                                        \
-	 * p0b0 p0b1 p0b2 p0b3 ...... p0b(n-4) p0b(n-3)...p0bn
+	 * p1b1 p1b2 p1b3 p1b4 ...... p1b(n-4) p1b(n-3)...p1bn
 	 *
-	 * p0 : packet 0
-	 * p0b0 : packet 0 byte 0
+	 * p1 : packet 1
+	 * p1b1 : packet 1 byte 1
 	 *
-	 * b0: rx status
-	 * b1: packet length (incl crc) low
-	 * b2: packet length (incl crc) high
-	 * b3..n-4: packet data
+	 * b1: rx status
+	 * b2: packet length (incl crc) low
+	 * b3: packet length (incl crc) high
+	 * b4..n-4: packet data
 	 * bn-3..bn: ethernet packet crc
 	 */
 	if (unlikely(skb->len < SR_RX_OVERHEAD)) {
@@ -452,12 +452,12 @@ static struct sk_buff *sr9700_tx_fixup(struct usbnet *dev, struct sk_buff *skb,
 
 	/* SR9700 can only send out one ethernet packet at once.
 	 *
-	 * b0 b1 b2 b3 ...... b(n-4) b(n-3)...bn
+	 * b1 b2 b3 b4 ...... b(n-4) b(n-3)...bn
 	 *
-	 * b0: rx status
-	 * b1: packet length (incl crc) low
-	 * b2: packet length (incl crc) high
-	 * b3..n-4: packet data
+	 * b1: rx status
+	 * b2: packet length (incl crc) low
+	 * b3: packet length (incl crc) high
+	 * b4..n-4: packet data
 	 * bn-3..bn: ethernet packet crc
 	 */
 
@@ -488,14 +488,14 @@ static void sr9700_status(struct usbnet *dev, struct urb *urb)
 	u8 *buf;
 
 	/* format:
-	   b0: net status
-	   b1: tx status 1
-	   b2: tx status 2
-	   b3: rx status
-	   b4: rx overflow
-	   b5: rx count
-	   b6: tx count
-	   b7: gpr
+	   b1: net status
+	   b2: tx status 1
+	   b3: tx status 2
+	   b4: rx status
+	   b5: rx overflow
+	   b6: rx count
+	   b7: tx count
+	   b8: gpr
 	*/
 
 	if (urb->actual_length < 8)
-- 
2.43.0


