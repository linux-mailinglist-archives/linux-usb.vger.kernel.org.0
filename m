Return-Path: <linux-usb+bounces-1100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D307B8D54
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 21:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id A974D281D56
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 19:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A13C21A1A;
	Wed,  4 Oct 2023 19:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dSbYTypp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6BC21A13
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 19:26:57 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A34DF2
	for <linux-usb@vger.kernel.org>; Wed,  4 Oct 2023 12:26:55 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-692a885f129so145016b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Oct 2023 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696447614; x=1697052414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5PJMycEXBTARd/V1ON7uAyaQyF56XJbZsQp7M/oePc=;
        b=dSbYTyppKK6GGdgo/uzVNGfGelV7sntQNk3cCy/W5fvqRYKufRUOlKFkL9tMh1aFEC
         tbU/1lrT+KQCzUCWSL+1mIoilwkd6SWrTKVairzdJt21mNTydGPmKB1gfO84e5TueYx6
         kqo/tJAVzqVuf5SFwj4kk+mOMBNDvC8qmH3Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696447614; x=1697052414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5PJMycEXBTARd/V1ON7uAyaQyF56XJbZsQp7M/oePc=;
        b=s4c/XUnxr7nqt5E/5CaiyyhJCGuM/3qb+sgSvdQdT878kKzb+KK4Irj7c8nPCOz/WO
         Q1CvZN8gY+SPokDEY8QVIaYbiC7acTrds+gClrk7y2pNc/s5cQfaFxVr4Q+r0AoNxT3H
         LIgaYWwBy+v/dCWYZm3GcA5GO/eitZujctoYo6bC4Ush0VuBQprFz+FqfOWyX+UyAhOM
         UFu69h5NX3H659jkcFocn5ZsVmTdhLNm34oWWVf1xeb5AyjJBWLQcPT9u7eSI5xkbCaS
         tOHFmbDw0KjXU0+WqksIJYtQrUVOh4QXB/exAnihNFWgEmPuGMXTcTHZT7tZk8BMzsU2
         D+fQ==
X-Gm-Message-State: AOJu0YzUPFIO3yP/vXiSFginvH6EGKbYYjj+Cgbs4AvRuda/ZfXouo/P
	6JbhpjaX7ceurm+lLgzl1tRrUQ==
X-Google-Smtp-Source: AGHT+IEh1Bbk/DThNmwQX1a1P0K5A+VqFGwIb+W+IHmklxH8tFWIr0+VpYVV9/RIanpifdMejZ5YjA==
X-Received: by 2002:a05:6a00:1951:b0:68f:ca4a:efd with SMTP id s17-20020a056a00195100b0068fca4a0efdmr3534941pfk.9.1696447614536;
        Wed, 04 Oct 2023 12:26:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9cce:13a8:f2b8:b799])
        by smtp.gmail.com with ESMTPSA id d190-20020a6336c7000000b0057c29fec795sm3649151pga.37.2023.10.04.12.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 12:26:53 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: linux-usb@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Grant Grundler <grundler@chromium.org>,
	Edward Hill <ecgh@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 3/5] r8152: Check for unplug in r8153b_ups_en() / r8153c_ups_en()
Date: Wed,  4 Oct 2023 12:24:40 -0700
Message-ID: <20231004122435.v2.3.I6405b1587446c157c6d6263957571f2b11f330a7@changeid>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231004192622.1093964-1-dianders@chromium.org>
References: <20231004192622.1093964-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

If the adapter is unplugged while we're looping in r8153b_ups_en() /
r8153c_ups_en() we could end up looping for 10 seconds (20 ms * 500
loops). Add code similar to what's done in other places in the driver
to check for unplug and bail.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Check for unplug in r8153b_ups_en() / r8153c_ups_en()") new for v2.

 drivers/net/usb/r8152.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index fff2f9e67b5f..888d3884821e 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -3663,6 +3663,8 @@ static void r8153b_ups_en(struct r8152 *tp, bool enable)
 			int i;
 
 			for (i = 0; i < 500; i++) {
+				if (test_bit(RTL8152_UNPLUG, &tp->flags))
+					return;
 				if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
 				    AUTOLOAD_DONE)
 					break;
@@ -3703,6 +3705,8 @@ static void r8153c_ups_en(struct r8152 *tp, bool enable)
 			int i;
 
 			for (i = 0; i < 500; i++) {
+				if (test_bit(RTL8152_UNPLUG, &tp->flags))
+					return;
 				if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_BOOT_CTRL) &
 				    AUTOLOAD_DONE)
 					break;
-- 
2.42.0.582.g8ccd20d70d-goog


