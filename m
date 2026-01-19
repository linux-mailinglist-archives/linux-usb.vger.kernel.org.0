Return-Path: <linux-usb+bounces-32497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC2D3A5FE
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 11:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F4C6302553D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 10:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0AA1EE00A;
	Mon, 19 Jan 2026 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6CzPu6l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B299271A94
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820236; cv=none; b=QEC4IRnRnthc7JiCnS3/YRuzuB50ciLM0EvUbuswML/Z+ZhJHcNksGjzqwp8uihhkQrKy5cdXv71ksmu5vNoG/szWXS3WKkCwzDzc3JbOHE9JuLxPEdtUd2y25aVmQveet7Rt8LLNHAeXWQvD/yy81NldJmn1Gut2fPxZ1G0Fuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820236; c=relaxed/simple;
	bh=9w14KZHWbtXQ4bZuOIO1KWG6UqHqkSJxbWGAEo86CBA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JwtJfgJM26YfJSPd01gsjhwhLlPO/o4GRzMUzrgK3+TxU+ZMPIShvM3scxEAYW+6MO4ZjcC7fBJ2LBktMQcLg6KjNRyUm2wrfyINuBMNTvV6vDNOZo8gypFq1CzsYdMvOdhdv9I3YxawGkK0YKKcV3Hp3ma/Jj1zeETKqrgJLuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6CzPu6l; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a07fac8aa1so30107375ad.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 02:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768820233; x=1769425033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnggbONwgIdaiaOJGG3BcWc+1OF/p9b8lGQ6zKeztQI=;
        b=a6CzPu6lmahhgSnh2RBWbSCX//eq7LXCBcn0pfv4Ix7o4Ly32mM0TXapb7SuVPzWBY
         y+d8rua3zPnWYuxLwCYitcy31qUZiHsP6uPNJ3Ga0tKkGZk5XplXAo2p6XR9H70ahfsh
         ZLik7vO650PIuF58s3rJWVQB9qDDSN1UuPwxn/opt/dU3j6sWu/kZVE4H1RrFVYZvobq
         ebZzVzQwz+oFxnh4tzZcFaK2Cb0BOgNOS04PWE9Exc+O9kl4kXW/bFA7RStBrC5sm4fC
         EW/2Nu/TfleP1KzM70Sqr4+o/udnKPIv7UR+n81h5Z/qGm1lxzDNxPWtwE2za6cEObM2
         UlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820233; x=1769425033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnggbONwgIdaiaOJGG3BcWc+1OF/p9b8lGQ6zKeztQI=;
        b=Kc9pBQ3OMyf7Y9kMWFenf3A9DPNLHaAL2MSUo0VoD7vxfZ1wiWmxy8QXUfyd53JU/W
         UOcanNP1KmGUfXz1k6Lu6CykarNtVZqttrdzeMM2YbDshcvNeRWIFkhMhwVEM1B10/Pp
         qoyvifhiiLU4md4Zu1vPtEr07OhtJxELtxuGJQaI3YC6aPVHxqW+W8n0how0684zwXJ7
         7y4juJJNpOa5dQ2ZcOz3DYlWJqO6QHRlN8Mctex7WxKSMmhJjmECmwMGSQAOqtRi2KBD
         yjCFqH8n23bOBtZjzwvUnHA1/UUU+NGvOBUCTnF70OJaCHTxV/kX3feqy6o3zVQaVW9C
         Sxog==
X-Forwarded-Encrypted: i=1; AJvYcCVb1KGccMCgu9oCz2czB2giiP5YOgnwoHurEELY25IajNwlbKjDdwEvLnBCvTew17x78HZiDalOnrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK6AOI/ZFZ0b8/Y3jv0bGtvw8Oo6wAIqyx5jNd5/miUdRbGAxY
	JKcxvM8AAfm06AhCDoQW8+m5Trw3Mgm1zaYTqeheIRcx6k1an22hTNgv
X-Gm-Gg: AZuq6aJEfESqX5Wh/83UNJpP5ER0xVfj3d8EUdR5AkDKVIijf/F0ArlmXBWdzXeW/op
	kYVhaGVLEB8v9Jb/1ZY/ZSc62qH08VCixbZq5EMWE0Ec2Pyi3x6BFVVmIKs4CS8NEersZLMJ+gO
	qDTnTL1KrWPmEx3s8odgxScwNwhPadS4Q435L83qm1smfY8f+Gm4jaG8MbS/xqlPntlVQ6s23Qt
	vK7lXqwlgSEY9y7YWUo9FD4mH+tYuyP71KC+dmSLQ0MIylXIr4Sgs8w2Byyjx5bIQxd6KCk7uac
	JatUO+h5o/3HXv3YXkFrrnbIPZWdJmE6FJ45RTJEdejgy39ZQFwc6TD3Mi2Ro7P06NpFs8FvAb0
	wftmLlojIBwOWCoEirwwe6KoRK01fAmBYDrZjt+Jwo0ESPf59LvgKIK3aeEytXJyypWPszNnboz
	BM2GtdL9bIbDGFfsS5
X-Received: by 2002:a17:903:2a84:b0:2a2:d2e7:1601 with SMTP id d9443c01a7336-2a7176c829emr111579475ad.48.1768820233442;
        Mon, 19 Jan 2026 02:57:13 -0800 (PST)
Received: from insyelu ([39.144.137.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9e85sm91362935ad.26.2026.01.19.02.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:57:13 -0800 (PST)
From: insyelu <insyelu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	nic_swsd@realtek.com,
	tiwai@suse.de
Cc: hayeswang@realtek.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	insyelu <insyelu@gmail.com>
Subject: [PATCH v2] net: usb: r8152: fix transmit queue timeout
Date: Mon, 19 Jan 2026 18:56:47 +0800
Message-Id: <20260119105647.82224-1-insyelu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the TX queue length reaches the threshold, the netdev watchdog
immediately detects a TX queue timeout.

This patch updates the trans_start timestamp of the transmit queue
on every asynchronous USB URB submission along the transmit path,
ensuring that the network watchdog accurately reflects ongoing
transmission activity.

Signed-off-by: insyelu <insyelu@gmail.com>
---
v2: Update the transmit timestamp when submitting the USB URB.
---
 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index fa5192583860..880b59ed5422 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2449,6 +2449,8 @@ static int r8152_tx_agg_fill(struct r8152 *tp, struct tx_agg *agg)
 	ret = usb_submit_urb(agg->urb, GFP_ATOMIC);
 	if (ret < 0)
 		usb_autopm_put_interface_async(tp->intf);
+	else
+		netif_trans_update(tp->netdev);
 
 out_tx_fill:
 	return ret;
-- 
2.34.1


