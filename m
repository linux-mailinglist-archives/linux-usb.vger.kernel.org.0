Return-Path: <linux-usb+bounces-32134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905CD0DA7C
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 19:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C969B301B647
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 18:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60B229D26E;
	Sat, 10 Jan 2026 18:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmkrMGuo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAAE19CD0A
	for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768070082; cv=none; b=ua6AAYRBUak+ly3mq4GlcsXKPun2aBM2aEGdhBc7wALYWKHB4fayNQJx67TQQAyzLej8w7aolw5e43z4Ehz76a4ZCdEEIKu2rzQPnoq4cJnhrCWHsVgVzHXUmZlyDYDAn4dhD3rnV2o+OXOV/j/Gfjx1CQ7R8Z8gZo+HdFdaw/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768070082; c=relaxed/simple;
	bh=W7ZzdtHk5mk8L928J/ejv2T3tcR657Gtr+YyCTdcj7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uJDUWdE7sj1AGJm1mdqdCXUrI/eFfngMfDxkDOwvsyH/U8vB52SSK2r3g3lqh5ZI+Dzn1DftMqRkQT/u2W8a72VBclwbVG3dOefc0kg9fLgb2y488Ct2hUqOGxi55Eo2g8SsFliOpIjjP5og1pKF4w55nJBSFWDuCtw9/t9JfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmkrMGuo; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4f1aecac2c9so50052271cf.1
        for <linux-usb@vger.kernel.org>; Sat, 10 Jan 2026 10:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768070080; x=1768674880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bUc/ovzMdhMl2w5A3gusr3wN1SHEFug4wxgErX68Dxo=;
        b=AmkrMGuo8tNOfWXHZLdrWjPvHgq+WDDUWX43RNFCpYN4nyALf2yoIyZ1MI5UuIKOvL
         vtUA1i6EKCvcFVYLT9ma8V2gwBGQVrECe+6fB6a00mTb08y7MeeWvBrhrWin+hSfxajg
         XK0pWwiJKpkgsGovNDcdwMJ6T2ZbzkS7oN/PQGfnNyZwqZEWBM4+OZj5YvnfTocVxneH
         5ztKguSr5IgxO0bffy+xDXlzMIVU+DcTFglCMmivXFJzoACBe9YuYxuHUDusFiwq8h4O
         9rG2UWr1CpaehtPOLDVjv2tEcLqYK1Oh1vMNmx050eQ+aPEV92ClvLW4KUX9kAJKNVSF
         LHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768070080; x=1768674880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUc/ovzMdhMl2w5A3gusr3wN1SHEFug4wxgErX68Dxo=;
        b=ADshSOOdm1MO1wEGm2V/jSy4O608fkFHw5IFXfcsyfImkJbge++tl4mvNchAbbiJpf
         Q8ggyl5FYR5zBzHedui7viemqIV9vmthgh0Au4OQnkvfZVxA8LSuAR+adjfTV2y6Y7zb
         Own0kv9GjLAJk/Ob54Z3JIHg46hRqknpfuXrO4VYaiV5OnJB9QCOp0nZJ9oZa1I4IvRH
         HOYE45tvArJmi8W29MEtBVoACQ1C4zZvCxZwUGFwti+qGNnL6ahe0e2dkbdpOozPtvOA
         422WxtGjfZfQkodNtKFxrJ7D12bQv8MQOsoN7vcCFhIgoh1AoK8pU4g/SCo6ZugaySC8
         +/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEIUQM9EKNavKPTTqN75PGoCW8GYwUYa46PYO6QoV8ynoWrYM8w0zIqTe+3efavU/JAlvDtO/P0dc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32B0OEaVnPg8vyLiIy6XPm//LFEp2BfDpP/1j0nso6YcWZw/R
	yLJjx04Da3KZE1PTOJ9Vg/xiA1OxySJljaS1gJiO7gPtBUD2WpG7A/lU
X-Gm-Gg: AY/fxX51MZ+Lpb/QoerTjuXAPfWufFfdFNlBiKIbfyaI9QSCe7GlscCqScDZiz/GlDM
	ygO+JwhcYpZqHFW3krJehnCdYxJQrROp28bZZp0Mpyb0sP4gi4T3jCW4yoKDg56MFgZLoBZsIk+
	NsQxxKQLA/6wTmKJdL3A2cLHi+a3UZAas9HLFw93c13flIJf624jWgiNbWefPYepH83WoiGuQzo
	+9JZg+jfw8IeNsqhsnF7OVvpcJ9tbFUI6ZC+bIfJok1JOd7QSbEYtZF2vHFKnGJPCOC3N4s700C
	jXF5lP1uFjXRjjvrA8sgnu0glgU6oYs/2ETUlGxuTmapx430+fdQeoGTLOz5AHZebXK75Fr/+ua
	3RG7NhL/zkscjTINLJW1QafyKXMK5SAwNmhQOdOHSlXo/bHOKcmoH5CfH72sPJlLIpA1FgeKKIW
	wgcSuxqWsqOEVO7YWzInzYRgzhNEytny5wbnU9XIDsmn5sa1WGru6DNrKTt5fV0mdfRp5FvG7Ux
	p1G9+3KrQl4Yln8iuwRI/Z/LzBTcdVlgapuFWfqwSE=
X-Google-Smtp-Source: AGHT+IGLHqXfKDl7QQYelPdoRHvkDjbKu2HmT9as3UyRsf2S4o15mQzR5mOBnDMoNbiXNkzN/+V76Q==
X-Received: by 2002:ac8:5902:0:b0:4eb:a2ec:6e3e with SMTP id d75a77b69052e-4ffa84fb9edmr249964691cf.28.1768070080003;
        Sat, 10 Jan 2026 10:34:40 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e6ce5asm93117171cf.33.2026.01.10.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 10:34:39 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Reyad Attiyat <reyad.attiyat@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: fix potential divide-by-zero in xhci_urb_enqueue()
Date: Sat, 10 Jan 2026 13:34:21 -0500
Message-ID: <20260110183421.23758-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The `xhci_urb_enqueue()` validates Bulk OUT transfers by checking if the
buffer length is a multiple of the packet size. However, it doesn't check
whether the endpoint's `wMaxPacketSize` is zero before using it as a
divisor in a modulo operation.

If a malicious USB device sends a descriptor with `wMaxPacketSize` set to
0, it triggers a divide-by-zero exception (kernel panic). This allows an
attacker with physical access to crash the system, leading to a Denial of
Service.

Fix this by adding a check to ensure `wMaxPacketSize` is greater than 0
before performing the modulo operation.

Fixes: 4758dcd19a7d ("usb: xhci: Add support for URB_ZERO_PACKET to bulk/sg transfers")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/host/xhci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0cb45b95e4f5..f22ee6cc3083 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1621,15 +1621,18 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	unsigned int *ep_state;
 	struct urb_priv	*urb_priv;
 	int num_tds;
+	int maxp;
 
 	ep_index = xhci_get_endpoint_index(&urb->ep->desc);
+	maxp = usb_endpoint_maxp(&urb->ep->desc);
 
 	if (usb_endpoint_xfer_isoc(&urb->ep->desc))
 		num_tds = urb->number_of_packets;
 	else if (usb_endpoint_is_bulk_out(&urb->ep->desc) &&
 	    urb->transfer_buffer_length > 0 &&
 	    urb->transfer_flags & URB_ZERO_PACKET &&
-	    !(urb->transfer_buffer_length % usb_endpoint_maxp(&urb->ep->desc)))
+		maxp > 0 &&
+	    !(urb->transfer_buffer_length % maxp))
 		num_tds = 2;
 	else
 		num_tds = 1;
-- 
2.43.0


