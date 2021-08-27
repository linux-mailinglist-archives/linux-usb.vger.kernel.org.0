Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684863F9964
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 15:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245182AbhH0NNE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 09:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245181AbhH0NND (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 09:13:03 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5D2C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:14 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i6so10375133wrv.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y607GohRHj140++t/bVDBujNiOGNimlRlENuyUmlv6A=;
        b=C7nHbTlLc3gN7Gb40cRm587VXiYRlYZ658KbJSCQKnUt2qaC+wZj2VuXMXwZitUvWR
         ds0YTO69ytKcQ+VgvECBLfaS0z/0kK6iuRZR5ciXJgYIiGrehm5b5RDl/UD/luN0o152
         Zcx8ReLeowxhaFd3SzlLgcg4joVUIPOz0cDZHo5ksnkL2kTJWg3j9BVIRrzm78B5Ya/G
         UH6Yz70jO8MjyXZmssK2eiWpxoJSkfmbJQmv55rCZdDPoUopVwyUxoGgEAr7hArIKtdN
         CcuUX8AaSmYYkEFy6gJLg4WlA3TI9umdMNXysQJtlHad9SzFOFUnyxbtIH2zKmnnCi6n
         gmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y607GohRHj140++t/bVDBujNiOGNimlRlENuyUmlv6A=;
        b=s8alcoSHc+XeR2Tksg2NED7SwfSyv2kACF5+eo4cjJI/SwnFnGfLpzgokcnRZlf2MF
         7AhDots65QDZ3blVbHoERyORGvF96AvZk7MQbfAq5x3+daRbxRds3hCdGRxoIoxlbamo
         0KozF/s7mhM2KRHqoD4f8rkRxlbCbYROwCqk/kl8W9KBzNklQNef4YBjCTd22J/9cd8U
         LAmzegkHvHg1brd4ZM4s1Ka9tbdIusYxTfCIp7RzvSVwwesxCih9gcb7Obq4B2wUZD1l
         3AkxTfw0KcClZJ+RE4d53Vg22qIbSiaYdsM6EKf0w3sx+wOOOzjuUwCBDA0zdW7SiCCd
         lGXg==
X-Gm-Message-State: AOAM5310a4hP8BNt85RFGt+7dGkkmkvm6rJ7hnfEBliv7COzP2s/JlSb
        BumU3Uv/2YMH7HcLpC1nVbLJbA==
X-Google-Smtp-Source: ABdhPJwuQ5Lrm61jHa42oQ5QVtvrE853g6AoAP4z2i2mSMvAZrhOnrvy9h2oSn3Dp6NRw0RlsuzTng==
X-Received: by 2002:adf:9f51:: with SMTP id f17mr8469983wrg.301.1630069933001;
        Fri, 27 Aug 2021 06:12:13 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c7sm5279349wmq.13.2021.08.27.06.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:12:12 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 2/5] usb: isp1760: fix qtd fill length
Date:   Fri, 27 Aug 2021 14:11:51 +0100
Message-Id: <20210827131154.4151862-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827131154.4151862-1-rui.silva@linaro.org>
References: <20210827131154.4151862-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When trying to send bulks bigger than the biggest block size
we need to split them over several qtd. Fix this limiting the
maximum qtd size to largest block size.

Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 drivers/usb/isp1760/isp1760-hcd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index b3a55c5d2155..fba21122bb00 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1829,9 +1829,11 @@ static void packetize_urb(struct usb_hcd *hcd,
 			goto cleanup;
 
 		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
-			len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
+			this_qtd_len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
+		else
+			this_qtd_len = len;
 
-		this_qtd_len = qtd_fill(qtd, buf, len);
+		this_qtd_len = qtd_fill(qtd, buf, this_qtd_len);
 		list_add_tail(&qtd->qtd_list, head);
 
 		len -= this_qtd_len;
-- 
2.33.0

