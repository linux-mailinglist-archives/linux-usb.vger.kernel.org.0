Return-Path: <linux-usb+bounces-29275-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D3BD77E5
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 07:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C24140289E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 05:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE2229ACD1;
	Tue, 14 Oct 2025 05:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ1+ybYH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A352F88
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 05:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760421163; cv=none; b=VrlmifccC3XeKzCbMRHLIRDoK0gTyIO1end2VX8sQivl/VsBZ609ka7FqB5ySMkMTMadTZSIjAZ/dzOzvCHerSHFTlhQCoxNg88nghsF4ubV6JoxyTCULaITXmdgU05NmnqeOnkflNYfVIsph39cwoWXf5OxUlhUiz0EDMmXfJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760421163; c=relaxed/simple;
	bh=xiqFJOykby4cQK17gVtELNe3dahFjsM+TAM/4GuYD9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RST7ePblLxWoCtIHD+39GdUj4Nf5jksIlXPppb05ue/lKf/73WMt1Au8P8DLs5e4ORkXNSesS2NY3COQe4VplisTJbRv6Lmuqs0KeahAk/jmR5GvsVcPNtp6qVGiBiPkUFMJBetK+RgPNCm/4zo0Hp3ypvW7RiJPdQkjAEJank0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ1+ybYH; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so3864832a91.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 22:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760421161; x=1761025961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWlNVmLtjnf8rAcNm545u/wbHRU51ZDEKLc4vvLow4M=;
        b=DJ1+ybYHL4cjKKbSwkXU6gG1UUY9+h5g+o1p/XIGZoO7DSK4y/CnqS5A0e+NYJe7fP
         09KHxRjHC4ZvC7WGZP3c3yZxE4qNP4pH1mdTIi8GbuAVtQKELP2d9r39iSBLUIq1Qf/r
         c4UDvNA2xUsSQGhcPrxQ85ELUVg3HwxMPDwRAzm748x9/YtMvF6vhP7v2RgjlvxhcvI6
         OONC3FagZW5enMG0bpmzBxV+JKy6mxneZF0Yb6Sy1bpjQ2ukXUiJJHawKG/XCyUNQwin
         0wEeM6So8r42Wo4X2VfkxllL7k4zH+w1byiU4bvSI0qU6gWP2UL2Tx8VymUZqjAPYkBu
         bXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760421161; x=1761025961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWlNVmLtjnf8rAcNm545u/wbHRU51ZDEKLc4vvLow4M=;
        b=gdRXWQ9ugbeTv0BUqqZU1ED56AjFBk/b8hppb9OFRJKjr4JFAt6fE4nvEAgg0ByAd4
         rKPbVRsORGOkNr5npOBzQfKUOF9OdJT4Qrcr4McSeQeWB52FhmWWthRsoSJxVE7ZEntd
         YCUzd53/Tv5Az9E/o7WmuuSsH9+/ZQoBgkvr7BHlIaH41KHfHWCAwvfwzneANuQ5nhk/
         YYsAO6PDZfAb4YMaeJ9l4EDL1QFx/Hpo+DC7nhCnwOaMSoTb3mDI2C2pvgTF4CWGgUJ1
         q7oht+MXmy3pn+X1zA1T0zgcQnCGDzKn2Hj6GAAN9LN8ba/S71CYZfxJ5oIb36dXzL/P
         7qLA==
X-Forwarded-Encrypted: i=1; AJvYcCXLPVnUGAALgnrDKYkonaGLPawIZaBxw280UlIowywqY8cnw/H50Wm7SGcQnYWsDoEWD1RUxKB/L0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+EsbYx0MksSMCQqBu42wM8t2EwTGbkJnYXUw2XFy4MLy/mgLf
	KsbinLQm7PD976xE0um5cXWL5/EQ5H6yGjIwLikSB1NngxAqkt96B2/AU3nig+UVqIk=
X-Gm-Gg: ASbGncuQS31DUIJGFpAXbU4LMw7ffyb3QC1LV7qaZM0eTEjle+mlSt7Vb6f0XdNj7Yp
	Dmg8JR3HLJNtpHUSsEZbqqOlJS8dgHagifKeMPH+y3sl61y5XA5oq+VQYnlEmSuq9a3N/+Ygm8G
	9vpQKllNDCRnsJv85PeNpZu+U3uMmfUDF1eb6vpex6QNuqs65OU8N65CtCZ85kA7cJF5fK67xeE
	3QdWezSWzG0gKZyPd4wEVc9kMUv6lPPTo+yBJzYke1GcYavQVbwFzikTM2VXQcWCoQTQ2XCEA73
	NVcWSdfLL6pPyB8RWl2cC2l4vb1KABoktwkRpNygwPUmOZWNyYOGQES5ZeTgpLk19LHKg8JPBIJ
	Pz2qxPtgcVUrdc8Iwr+JXO78xhyxdDJOAMnsbuzyir7gi3953/BXTOyl5lZu8FcWtGXJFMx6EHf
	ZtmeI=
X-Google-Smtp-Source: AGHT+IGZ4VytOKfxuKimiMVWhQiKhxNFaYk8/G36/eeE0Sx6uLTpUHGY3Bg+9lWRu14oZFzlLrNxWg==
X-Received: by 2002:a17:90b:224a:b0:332:3515:3049 with SMTP id 98e67ed59e1d1-33b5112504amr30797652a91.4.1760421161516;
        Mon, 13 Oct 2025 22:52:41 -0700 (PDT)
Received: from arawal-thinkpadp1gen4i.rmtin.csb ([2402:a00:401:b8b3:f979:38a1:d361:cdf4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b62657166sm14391472a91.11.2025.10.13.22.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 22:52:41 -0700 (PDT)
From: rawal.abhishek92@gmail.com
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: arawal@redhat.com,
	jamie.bainbridge@gmail.com,
	Abhishek Rawal <rawal.abhishek92@gmail.com>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] r8152: Advertise software timestamp information.
Date: Tue, 14 Oct 2025 11:22:33 +0530
Message-ID: <20251014055234.46527-1-rawal.abhishek92@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abhishek Rawal <rawal.abhishek92@gmail.com>

Driver calls skb_tx_timestamp(skb) in rtl8152_start_xmit(), but does not advertise the capability in ethtool.
Advertise software timestamp capabilities on struct ethtool_ops.

Signed-off-by: Abhishek Rawal <rawal.abhishek92@gmail.com>
Reviewed-by: Jamie Bainbridge <jamie.bainbridge@gmail.com>
---
 drivers/net/usb/r8152.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 44cba7acfe7d9bfbcc96a1e974762657bd1c3c33..f896e9f28c3b0ce2282912c9ea37820160df3a45 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9311,6 +9311,7 @@ static const struct ethtool_ops ops = {
 	.set_ringparam = rtl8152_set_ringparam,
 	.get_pauseparam = rtl8152_get_pauseparam,
 	.set_pauseparam = rtl8152_set_pauseparam,
+	.get_ts_info = ethtool_op_get_ts_info,
 };
 
 static int rtl8152_ioctl(struct net_device *netdev, struct ifreq *rq, int cmd)
-- 
2.51.0


