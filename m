Return-Path: <linux-usb+bounces-18812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981A9FC76F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 02:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A2A77A129F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 01:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3150A18E20;
	Thu, 26 Dec 2024 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPxQ/sUM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526CD20EB;
	Thu, 26 Dec 2024 01:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176731; cv=none; b=tr+IkzlDsz60dMvcWUDetdGmwfRvtMBlMVtd1tsMBwadUCzCOHDG/CedXZhuY+LomP5EJpJo6f32vJZ4/UDrzHdNIiewPOVG2uLqQzY/2DPhgOXMWBX2Ou4NS+Dm8PgZpodRNeo9B4scF9dtRmAgWuDFpeKOijd3j5IklGEJbo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176731; c=relaxed/simple;
	bh=gzCZKVtDQ8d1f01q3iIFi/G+Ad+jTh2CJuW/1zqf0JY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dl/jjc7tQ+UIr1UOgKo7AJopRX7aAOsn93kc7DeCYGBJ1OYDyhr5YhA6rYnmeQT1OB4WHHsimwOOKUJ3PhOP0g3J0lcGH01cbOAs9AEhBASJ56/nyn4aIHxtOP5gjz2br7EvOGFANrMZv+xXTHYlPG0WriRNYnUG7Up4hGiMMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPxQ/sUM; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3ab37d98dd4so22022435ab.3;
        Wed, 25 Dec 2024 17:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735176729; x=1735781529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7u2s2boB2BBHCEQ/gabzSk/KUFYI1frVGC4wkfVXOZA=;
        b=VPxQ/sUMvEkLIGgPs81nqbP/gsdWRZpcKxSgzd2fZ8OSIIDWN1Ltqfb88hiNMZ4Bp2
         9ud6FcwvhIRPoLJZ67sCa/kJ/xl2df6ZKeJuW0s0cABKqLQKYqOPlFR0xu9Nk16YBD3x
         /WAbWp3CN57ezXA6N8l98ylK6+HpY2cQg2k56FUW9Q+ZmzaU8Vz9Ny8yulqNtyAr8E97
         SqGXUxcpnS85O//L+9t11CWiKCEFVuWBX76dCnQIv2PvV3Rez8uvRO8V2D29pJxp8NXY
         eQ9b59AqkbtIt96hLQbzeO88VUKiplukXGl74QHWJAKmLBEE632ws8ydqolhbrXWAyZO
         943g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735176729; x=1735781529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7u2s2boB2BBHCEQ/gabzSk/KUFYI1frVGC4wkfVXOZA=;
        b=YmSJ8rts0aNQssRS54Ixer80UobbQFfIL8K22fmxGlTMd1OgK+irBe3UYaHAMVrpcU
         ZeBO2S63q49nkvgVB60fEfmMsV19s/C582tpo4XMVJfY9opg8r+CLF0wmgjMaJl9HEKs
         W0NzKX6LaslqVa8Jg/TaOezLebA1rHfQvR6Q4yguthw0S8ZiGnK88gU+Pqw2s5MCMT+w
         XgmDyls671e9ff+Vi35m+xxlKmAg3KO9UCzFGWRKLP3BMaetIryMltLAad1wF0FTbEW5
         SvB5rGIkiTWFZe/KHO5lUFrRvMYKSqae0LOD2m+CfT5jRoWwnYUEXwgRtrW+LMJoDm2i
         ScPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAEj9LnKeO+0oDAG5bYkGr5ed/U88JuNilVS7g6tE3zh7BwT3Q4V7+exMk2PS1sorTQnkU9G1M46Tp@vger.kernel.org, AJvYcCVK5A7k31B1v3FMHLAF7QcAbf8YSwdnpENB1EucEK86tjN8c2092XvQu44XQw4oar24VQSLXDFUJKmZPRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDeoOVWE17FMtJJNP4Azwt2UBFNmNBQLgJiTjVNqRLWE+95JG
	erqnU6RHfuAnKzlZFSOgfdijPr6izHvs3aSFB+uudWXtpeCAfS0M
X-Gm-Gg: ASbGncuJjzFRhYUQa7XNjzaRFyYcXAzvafHGNX3T7M9pEeccWOzUdXq68m0hVS9o02v
	bURKZoPqBUjxzc4zQkyJXqhFS50WirNG7hz4qE2dkrv2C71Exw7RcNUhWPSnrsayDetrBvh1NMC
	lPxCtLBncRpTUQ8I34YVlOGdU5XGePbNGKbg5f4NcAMEnDI9bsvPun+3yf+ly77+7OZ7Sx3+MIm
	DdMaeHyGVi+3b2PxkJCrwabFl8iXh6vONZUclCOAUThOxsZq7aIuoHQt31XxcCwwTYQ
X-Google-Smtp-Source: AGHT+IGujPMrhGlKvRtHqYt7d/VACLvEK+Ye6zz1ii2ZvToU3MjNf6zp/OsQZ5woLk4JB9mVUYVuNg==
X-Received: by 2002:a05:6e02:1a44:b0:3a7:6c5c:9aa4 with SMTP id e9e14a558f8ab-3c2d2783632mr162675985ab.12.1735176729515;
        Wed, 25 Dec 2024 17:32:09 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0e3f36354sm36588225ab.52.2024.12.25.17.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 17:32:08 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: gregkh@linuxfoundation.org
Cc: u.kleine-koenig@baylibre.com,
	aaro.koskinen@iki.fi,
	balbi@ti.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2] USB: phy: tahvo: Add check for clk_enable()
Date: Wed, 25 Dec 2024 20:35:00 -0500
Message-Id: <20241226013500.684623-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The APP-Miner reported the missing check.
Add check for the return value of clk_enable() to catch the potential
error.

Fixes: 9ba96ae5074c ("usb: omap1: Tahvo USB transceiver driver")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2

1. Add tool name in commit msg.
---
 drivers/usb/phy/phy-tahvo.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
index ae7bf3ff89ee..0b8801318cd2 100644
--- a/drivers/usb/phy/phy-tahvo.c
+++ b/drivers/usb/phy/phy-tahvo.c
@@ -342,8 +342,11 @@ static int tahvo_usb_probe(struct platform_device *pdev)
 	mutex_init(&tu->serialize);
 
 	tu->ick = devm_clk_get(&pdev->dev, "usb_l4_ick");
-	if (!IS_ERR(tu->ick))
-		clk_enable(tu->ick);
+	if (!IS_ERR(tu->ick)) {
+		ret = clk_enable(tu->ick);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * Set initial state, so that we generate kevents only on state changes.
-- 
2.34.1


