Return-Path: <linux-usb+bounces-32310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F93D1C2CC
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 03:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0125A3008DF4
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 02:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC87322C99;
	Wed, 14 Jan 2026 02:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8JkkpD9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEE1322A1D
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359457; cv=none; b=T3qUyIXgZSdY9yCtR6uX3mj+5k8VDM+sxV22jGQVp2g1ezFeQQezAFgR2u4smWWkWqD1IffSOUidpFGTeFEfQmfwe+2gc+yjtbnO7y2g6uk2/wPP+VLkRiyDqlgnvDBbXkcvyf8cpiS6CZ2iFELFWwslNiY1JAPtQcwgDfNasxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359457; c=relaxed/simple;
	bh=LjBkblyUkULyDT4omYys3dIwv9tE600i8x24LDhgZYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N5eGt5Z17MFqv+IwHjo8+REj7WGDocj6B/pBncIKW1LEHciOGQV9Rkg0iOQ4IsdfzUYFwdoeWYA5eVAqIWuxf3BUcic7CwLTkfOfUsHB062RuZewr0A5rmJY2JarQqJgM0YfxEXlyHlPnvsJs2ZV8deVzIe64LHKXfMeKWDg1Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8JkkpD9; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so4461956a91.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 18:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768359455; x=1768964255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3wa55kpx6iwIJ8pAH9E5hP+eKzgTqRTpXTNuwbc4Hw=;
        b=V8JkkpD9dqum0XxPpTcktpLl1FXjb8LDbnQ+mNGjgIE1aCPImShhGLaurjOivWwU35
         QQaykQUeFQbR2ja/scNL2SzgM5zsmxHycTxttAupZi0qBEgfOvsCzgOi+UPW1YjX4jjO
         YQSAE+TwjATEGjx1nThBOzpI+tBsmDVU3oTBv5h3izBC93m4FUHiIZlxL1Gzrpw8xCdI
         xoqW470LRJJx9vzbExMtyXPOJJ+jim9JFGFNfaY40cJWMcgLz13jzXDAWOx7QJmC6D2D
         gk36PFSNPhafLcMDB/Bfdd+Q5Gcz8mnMQLhF5v+ZS/7sB1/o65bNG+fdaEleeUOE7cFW
         TlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768359455; x=1768964255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3wa55kpx6iwIJ8pAH9E5hP+eKzgTqRTpXTNuwbc4Hw=;
        b=AAW+m4xlc3LPedNd5FEsTMJVSnOj5KnMdhjnT9F35jV7VCLkfgh7bB7t3x1kRfaVyN
         8fidqJnpjDAjtnJ06TPRUMXftqfjdcrUaU6tvaXxo9QZ0/FKep7btlcewoJ9RqOauQA1
         vbX0Hf696Ogl8pX0WwQpMeMR1ttDF+HSGnXn7mvFy/EAAXPhGexYHYtP+gzUBnXoitx2
         aVZICbQ+vNO5HV0V9/TseCmEt0PUxpnq5wrB9U5ygzq+/hSnkP+zhI4njxojs1PwqygS
         BG1CMmuI94qllFnWw6krdnsS8H6FnT3GwMUcKBhWn9sSqadQ8CgWrsB39SxGYDxeIkRm
         q8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVeoO1ZCvniH+8Seq9pScBVEU02sAupN2Ixyx7qqEQbHFyzt1K+OJuWqr2UAKCG9MheqEq6dDdY5eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeenUgpWwUlQC3og+X98u64gUrrLjnSGqXvIPvZpqG4L3SIja9
	RMs5bj0QVfCRm0TrfJLSri17Xw+f1JvBx+TTW2WFwuPzUkTdYW1+xFPk
X-Gm-Gg: AY/fxX6KwXyLYwEhaQyeP5fadQXWS85hCDUTG/3NfSbQq3DciucTHUysUM/aixQ1RGS
	zxgdIIb7EE9xOxROjTXuVFLifr1zESPezaWqasttrIIqUzWzTrvakRVrTlyQxvb1mR6xqiMilZO
	tzHQreXlnoX1o94PsBMyF3duxdPMJS8ksoupEvQRaP5KHE677OTguoCwvtGSEClhG44yx/8Ll74
	AJhl2gQtHnbMQ437eN61WA/NF7+Q/5SvQiLw+E2l3VV0hzVgqSogU9ZcJfkVUbe10vnW8Jw9tik
	vYT3Nv83tgrJDzR/Obn7GmKuHLLo1ewrzyjkrxhzZYjStrA2z/Ho+XAdw26OUFLp3LZwf34IK4d
	H0XbiKQ73U5PSv5o0ZfB9xGrOQ+d1wgvPCk5dFITIdD98W8bYeA6FAClkxn5thxrDZfCDQJYWjS
	2PTBJTh3wsFW1az96zGJGXnQENEwemm/plZGD0Zgpxnd7lb+SV
X-Received: by 2002:a17:90b:2fc6:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-3510915b7abmr1289752a91.35.1768359455374;
        Tue, 13 Jan 2026 18:57:35 -0800 (PST)
Received: from yemj-virtual-machine.localdomain ([111.55.148.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109b1974fsm433166a91.5.2026.01.13.18.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:57:35 -0800 (PST)
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
Subject: [PATCH] net: usb: r8152: fix transmit queue timeout
Date: Wed, 14 Jan 2026 10:56:22 +0800
Message-Id: <20260114025622.24348-1-insyelu@gmail.com>
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

This patch updates the transmit queue's trans_start timestamp upon
completion of each asynchronous USB URB submission on the TX path,
ensuring the network watchdog correctly reflects ongoing transmission
activity.

Signed-off-by: insyelu <insyelu@gmail.com>
---
 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index fa5192583860..afec602a5fdb 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -1954,6 +1954,8 @@ static void write_bulk_callback(struct urb *urb)
 
 	if (!skb_queue_empty(&tp->tx_queue))
 		tasklet_schedule(&tp->tx_tl);
+
+	netif_trans_update(netdev);
 }
 
 static void intr_callback(struct urb *urb)
-- 
2.34.1


