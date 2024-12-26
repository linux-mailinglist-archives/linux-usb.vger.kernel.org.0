Return-Path: <linux-usb+bounces-18811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CB9FC76C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 02:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0285C162414
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 01:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026011B95B;
	Thu, 26 Dec 2024 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaKbKO4J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9220EB;
	Thu, 26 Dec 2024 01:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176601; cv=none; b=c8FdU7FWH+BDvvGgF6Y7tV64/Ap/m0LAq+p8thRkVe2LcA3qspieLhprAkgSSozCQMgDBlxwyTklL59SFV/gGB/mLbazki8VEDAb50AEDKuSGvE4c9B5d9vSRxB5rX6l/Z1FeTBMzwNP2TKctQi5Nd0Mm8bYmxg5GLL2LTw4l9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176601; c=relaxed/simple;
	bh=FS48afw4FgM7S/whrphCTqAR/X07lLMF+jFbEtMr/oY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HOvMgLGFN3RVQMb1Z8wrj8YMBd9hgiuVEpzqCTUyuO0TEjPWCHg1mBNUgA8MP33yP5flBYX6nLEwmmmG7AQuTO5XFDiKEGZsWzg+awckZtMmokwo2kDQToQqQFpYtphDpu49GDjTjjB79ssKGMo22r3ywZ3gIy9DwCzV7MmbxBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaKbKO4J; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a81a0277d3so22504135ab.3;
        Wed, 25 Dec 2024 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735176599; x=1735781399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQweqECZzVE93s9E8V/9XFNtUPLAAMW3o71+PM9B78I=;
        b=EaKbKO4JMl/JK4Y32926RBwisne2ynXTRTsHHsEQ5xqGB8G3p4RoA4tWZbN2TxxgL2
         LsaZ/4v7hlC9sJpQU1xqCgh4GIekwxTxGKnB32uA56HCnqY535TrKP9eordw4H0qz4VL
         w218xRotwD1AB1cqK+rEk1GufK/YnfUQne/7rek3wcnApSH7MrrshH2UdG4Jn3WpXUPo
         Pw9GcZLWAkRQrOyKo5QLUucEgrSaGZCBjgBLSR3Sqkj6D5hwAzSpFlexdoDKKyn/tbL+
         xZtTkoRrJubrHBPdx0Q0eBnuvPuN0XR08McApH0EaZRdpVuHH7017y5IekDguqz2aYCN
         Fmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735176599; x=1735781399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQweqECZzVE93s9E8V/9XFNtUPLAAMW3o71+PM9B78I=;
        b=VbD8OfFifh3W9b7K9d3Vs6nK3larKoHbv2T/G0yE3BU/ff939UNgpDX6ptmUK5ux0b
         WNMCWLqnJl0WEtvx/ZutB/qxAqb1Bvl1VnX5xyaZiPYWkwbWE8CvVukiS/qbBnASR6Qe
         Rci/n4pa/K26V6d2SYRWaPJEWsGBU2xelF7V8MRuXntqJHP6IWFuLY3FKZv3K/vBzass
         5TECM/lFpJV0TNVQuwjT+kJiXwbOJS4bgM7uUd+cw8ykPbDGTjleywdPjXYAPZvcWZ4a
         IoZ5gwnPxiTDkKBB9dgj0D7e2A2P3cdi3tJ81o4uZ2VJZU4NGAs0aiPIFYakb48ARj1D
         jorA==
X-Forwarded-Encrypted: i=1; AJvYcCWURDy70HdTQwKWS3B60SJk3rDrnNEQeONXPlMl5XmSM4bucqa/IyOfsMydYPuWv9ZWA2RTWfTLnZy8@vger.kernel.org, AJvYcCX/Rs4Kt27SejxXiXu1Fl06BKxmcvVXfX0A3kVF51BF8dcbwVFp0sG5DmQJDd6bkWpegrTNTD1XjiFaqkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOiEr/e1pM4tZd1B7Da14if66I17AqFBRnQSvsAzEzYUO0rV1E
	X+BWkewOL/TfDprWvqiw8tzkL2vGFCwqgxNfhpRCNE3/2X1UKbM6eLIFAQ==
X-Gm-Gg: ASbGnct+KIFkQ5VP0/rGIJxhFGmSGO1Zced5NSYLt7sHGz/uGLh6FGbp2PRo+KoIld5
	zcPSEh2cQOfBZLzoiZIHYpg33fm1OnNqRfpp8msS+WaJZU1bX1rcu6DAip4WjRlfVZLr1sW+b/B
	OngVL8Y27GHpiWRe5pFfMOEIlJQQomGMouUiOsgOKJ5S7cxMuLDuh/TYPBf9/9nVgljcbM1K51C
	A49qbCS7eva42D+fGp07eUwOFM3STvgTuE8kBfjZVm8My6F5tyuw9qFhgifQPoN2y5v
X-Google-Smtp-Source: AGHT+IEjlcP7YLPOck7x859ZyGwzPu+Ekg54K5hx0SBkBzOj9Il8AUVB9eqEaFfih2vKs91b91+4qw==
X-Received: by 2002:a05:6e02:20eb:b0:3a7:6c6a:e2a2 with SMTP id e9e14a558f8ab-3c2d2568e30mr178104695ab.9.1735176599097;
        Wed, 25 Dec 2024 17:29:59 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf4f56bsm3461598173.22.2024.12.25.17.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 17:29:57 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: gregkh@linuxfoundation.org
Cc: u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2] usb: gadget: m66592-udc: Add check for clk_enable()
Date: Wed, 25 Dec 2024 20:33:01 -0500
Message-Id: <20241226013301.683202-1-zmw12306@gmail.com>
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

Fixes: b4822e2317e8 ("usb: gadget: m66592-udc: Convert to use module_platform_driver()")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2

1. Add tool name in commit msg.
---
 drivers/usb/gadget/udc/m66592-udc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index a938b2af0944..bf408476a24c 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1606,7 +1606,11 @@ static int m66592_probe(struct platform_device *pdev)
 			ret = PTR_ERR(m66592->clk);
 			goto clean_up2;
 		}
-		clk_enable(m66592->clk);
+		ret = clk_enable(m66592->clk);
+		if (ret) {
+			clk_put(m66592->clk);
+			goto clean_up2;
+		}
 	}
 
 	INIT_LIST_HEAD(&m66592->gadget.ep_list);
-- 
2.34.1


