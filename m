Return-Path: <linux-usb+bounces-1940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882957D03C4
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 23:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07930B21485
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 21:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EF4405F3;
	Thu, 19 Oct 2023 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hNgF4d53"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A11D3FE2B
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 21:22:17 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C181BC
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 14:22:01 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ca72f8ff3aso1016135ad.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697750520; x=1698355320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2Zb52xqU9YG10pBRwWVILZJr4eqiLRUY7pMspVelCk=;
        b=hNgF4d53t1HA2mDAiAdDE9c9nVJHEPGUZqHkg3NeHxn85laVdDehQK9z1ycwLxQODN
         DTbMmL7wVWQPGP1lf4hmtWN2yK4Kw/heKkSVi9tOSafCbRZYGwECPErqE1CKz53oDK16
         3w4MmJyur+WiKN0nEPaNo9wouRRPAAeD0z34o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697750520; x=1698355320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2Zb52xqU9YG10pBRwWVILZJr4eqiLRUY7pMspVelCk=;
        b=MNXStinfh2nLxKmIpr8B57WA7lMfvPuS2Rpy5Fb4l0FI1vM1HMgUOtGgJcg7noUxkn
         DytYM4UHuvXg2Z88MVmu502V/Gtvof/XrTmiE2qP1E4am46G235taXtdmdXwAtYBuaEL
         nO6LReSOpBZSLiHMUOSF9EEaIaU0mOYoMzi+78BhqhO8Dtf/MZBXjasqDaeO7xM2vkgf
         Tl50BXbAKH3wWqN5ag08ANH+gptaiqiSnZM9+Q0C+lmRj70ZEBmfiR7k53BQxZ7jWtWK
         C705DDa3dq9zlE9MMij8sLT7iazWwDmROwA8UCSIwwFLqJC6STXuJFEiSz3sNWjGvJHW
         mobg==
X-Gm-Message-State: AOJu0YzzxhutYwNMhKRAJ7cRdtVzEn4jVR5yhMtXpLCsiEJMYwwqMS3W
	R+mgD451/cP+DxwFr/WSpC+eOw==
X-Google-Smtp-Source: AGHT+IGJt6j2mTd8SV07ZZuKDgTE+QfqVgU0qKZcGmDh43UvCguz82GGBb8VkqQyAqaN860xbIStgA==
X-Received: by 2002:a17:902:d492:b0:1b2:4852:9a5f with SMTP id c18-20020a170902d49200b001b248529a5fmr59681plg.54.1697750520517;
        Thu, 19 Oct 2023 14:22:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:a6da:6f08:412:e04b])
        by smtp.gmail.com with ESMTPSA id l2-20020a170902d34200b001bbdd44bbb6sm154100plk.136.2023.10.19.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:21:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Grant Grundler <grundler@chromium.org>,
	Edward Hill <ecgh@chromium.org>,
	linux-usb@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 3/5] r8152: Check for unplug in r8153b_ups_en() / r8153c_ups_en()
Date: Thu, 19 Oct 2023 14:20:22 -0700
Message-ID: <20231019142019.v4.3.I6405b1587446c157c6d6263957571f2b11f330a7@changeid>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231019212130.3146151-1-dianders@chromium.org>
References: <20231019212130.3146151-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the adapter is unplugged while we're looping in r8153b_ups_en() /
r8153c_ups_en() we could end up looping for 10 seconds (20 ms * 500
loops). Add code similar to what's done in other places in the driver
to check for unplug and bail.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.42.0.758.gaed0368e0e-goog


