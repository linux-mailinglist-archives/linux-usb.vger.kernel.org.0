Return-Path: <linux-usb+bounces-32519-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D8D3BD60
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 03:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED828302C218
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 02:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B0C26B0B3;
	Tue, 20 Jan 2026 02:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo1ANFQn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299226059D
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 02:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768874405; cv=none; b=TJlXV5EPmIwz/CDa24/cJ8ZLuMTpaoycn6/JqZ5wGoTM2ykMbgYc5pZYhjWuUHCqDll7nDsjD3NNwI/cOa0J++SYGrv/hTdhEv3VV5NH+tqL4C/0dNQ2PRJwxVeKG03G2kHKezgb3LqGo7tqVfnatvazNJk2W9Utu6VGqlEC5JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768874405; c=relaxed/simple;
	bh=rA4jn33vZY454aEHCpZgQgk3ckOe5SHUWCFHGgE003w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NJ5wOGaecns5g2I1vTQ83nioUUHOzkYocRiLFJFaU8+GPW8isteN9gaqfUDdtLNPGgoVdmI7ycW3Nvy1OH+obadixijlae+fqyy8lmF0XDW6g8e4+7L9c1qmiFTZJLZgbATzD1wUjvQWo1QLNJE4PxZ3oGGMb3ryX19Ra/fA7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yo1ANFQn; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34f0bc64a27so2163484a91.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 18:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768874403; x=1769479203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m2tWDW2nXGL6Hs/Iie8O4LsIJWjCPEnqBn9C1IoyWz4=;
        b=Yo1ANFQnYNuJ/x21KukehQn4psvpFDBOV+dVtviwS4cEldoQve21L0CLLIVsIQDafO
         nE5i2Sntkzr5MF1MxJnHEwscHo6fhvxVoxG+9ie59LTYddtanCrQ9TFuTec8TgNYcUfe
         3sTbUq1X0Uee1wP2PART9aC62iEjoJ8ZbHdiQfq0DVeIpqPGVn3+iLSgNoGjasqhl8em
         IFSAksNQQMZoOI2mawtKRp7Uc9NnvidVhFzUXEWhnT4+6PusbCN+5OYfnLzBTgTKnjSj
         ydGUhy2uaTgRUszOeRrLqZaovjyHnUoWMgA6LOOivvd5t0feewYnD2ZW9a3ylApHYCkC
         emsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768874403; x=1769479203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2tWDW2nXGL6Hs/Iie8O4LsIJWjCPEnqBn9C1IoyWz4=;
        b=MjAaqKA2pkbCEqgxJoxEy87ngWJiPabBTG8RlwxD5ikMs3CR8sPEQqajGgeg8XoAOo
         50eG7rucU+LuwaoTvcuiA5W+6EKluj8li3xOt1RByzr9OQoevwl0q7VJlHVpvvchWD9G
         n3fG5ZOlinlNADT6FL/wCSBsMGDYMXK8JYVPLWunRXeL24xvhiWHQVM/xy+AnmxeniyU
         Gz3X6prH+N3aJZRZ4/yV7ZId56dI5IzCuaLGmZ54zsCwm8KRnK/BKHq//vXiKDntANAd
         XbZKw9PQ0ZtL/fyFIISizM2kkNPuyt9HrcUdSktQ9jr+JpYfrivk34/z/3IHz3eRzTsh
         7Q2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo74dyTsv1QwHRBGkIlzLrPD7EwA2H+Z5w/JENzqxAmZ4ZlU3KXzYQvuGCviGATrSHPghN7VDx6Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDTk3o0SwDwmlkr0DUEl1sHh9TH53BLghtnz5evxUzpGCB0xJb
	rOPEz64Ys+6nAOtRVkxsHRRMmuQAvopB4L262FeuSvp/zOBnamf0IB8g
X-Gm-Gg: AZuq6aL/vGJMbwqMhcLjXfiDnzkn5ue0S1pCaHriiyU0WIooHrSsKQcMQadbNcSzZwM
	WNOemhe58tRZRtc1hSg+Q2XE+BU+DTEUZhjJ2oawQtEq7A6nVlsjUfscKHd7YHKgh7whQU34kae
	Fi1JUWYXK9em6NEciyEBB8z0S7LNK3ZmcgLmMHhwUxMMuEFMkTBH39RpBoXkgmQdbNfi2CJc/dR
	QDcAeQw3QaVgXVp18UToB7/aRxhlneM9Vp7eSDrpAPNgP0AzUFXMnzRpQW5pr8QmeUbXhZpvtP6
	rqfXJL2/xNq1ErA9hpzq4deF/PZtEtk4gL+SMT/9QFJI/CDBOBKpSP2UFU02dSOk2zq5rZbdgh5
	GbRDA3IbNjmBbAfpXc3xamidUSEgkgsdBmWNMJLahWhZ/nWP0RdoQzUXjQ7pSnKXH0YVA5zvEJC
	VVFZctnxf5i+wSdcDwRprKQHXRdgQ=
X-Received: by 2002:a17:90b:1c87:b0:341:88ba:bdd9 with SMTP id 98e67ed59e1d1-3527325d1a2mr9413905a91.25.1768874403233;
        Mon, 19 Jan 2026 18:00:03 -0800 (PST)
Received: from insyelu ([111.55.145.213])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352678c6a10sm12725180a91.15.2026.01.19.17.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:00:02 -0800 (PST)
From: Mingj Ye <insyelu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	nic_swsd@realtek.com,
	tiwai@suse.de
Cc: hayeswang@realtek.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingj Ye <insyelu@gmail.com>
Subject: [PATCH v2] net: usb: r8152: fix transmit queue timeout
Date: Tue, 20 Jan 2026 09:59:49 +0800
Message-Id: <20260120015949.84996-1-insyelu@gmail.com>
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

Signed-off-by: Mingj Ye <insyelu@gmail.com>
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


