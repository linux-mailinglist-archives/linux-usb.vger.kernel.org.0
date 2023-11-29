Return-Path: <linux-usb+bounces-3473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 657AC7FE1D5
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 22:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B8EF1C20B66
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 21:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404D32B9B1;
	Wed, 29 Nov 2023 21:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MJHG3FeN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11B8610C4
	for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 13:26:30 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cbe6d514cdso231137b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 13:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701293189; x=1701897989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOZ1iLO8KtuEsZF7yZy5/8QOIlpTKo1m7A68f7ka2pI=;
        b=MJHG3FeNRJCV08bAES4RXwkf/jmlD7P+a2DJaKxg4x3vMs+05LcH+QtFy6akdFQxNB
         GAiYp/SgiSOcPphniGk4d5fikI0D3hXbOwqQqZ6fEN+PsdOdJ9QFKYkGgjSE5/FljEDN
         5YZqk667LykslGSxFsmP6n2C6HeqJDnuk3XsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293189; x=1701897989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOZ1iLO8KtuEsZF7yZy5/8QOIlpTKo1m7A68f7ka2pI=;
        b=lyIGX+i1mOoJR5md8KJ/Pj67o4o4iZFa57K2EbQnNV5pJEs6t7doF6Jl8tr99bQm0z
         Tk1hpCTpQesMEnD/To2h8MnSygW+cQb8PC/TdH8K80/4z/kyNFZYHBkgUqMs+tKn0pEh
         UVtAT/UwTWndasFQ3oRBSYkE17kJ9vAqWcrcp70Sippvfly4KURRFhw1N45HWr14kg18
         Xq09wi2d2hTwmK/XvO109RWm0WDKp1KUTquaL3X3418/2zWQxsz28LCJJEGNHtFG0GsY
         gAqkYtEwgI3OWScjEr9rsLIzAewyR8XLCVPoF1x9WZbzwRGoGjifTdYjgdavAFM8cqOR
         1drQ==
X-Gm-Message-State: AOJu0Ywo+Js90EVhGW1jV7T5qc9niMo/AEwg9H4CzAAu39IvdY2sQwP6
	J9Vb31alwFTvpoo+0sdIOg7MZw==
X-Google-Smtp-Source: AGHT+IEhYjXD7fB92XlW1tMK7UHu4TadS7/wiHBovCTqBhKemR/gkXXjTAQ9pSQRYbjR1uPPeh5LiA==
X-Received: by 2002:a05:6a20:9698:b0:18b:4dc2:a4e1 with SMTP id hp24-20020a056a20969800b0018b4dc2a4e1mr18432953pzc.55.1701293189548;
        Wed, 29 Nov 2023 13:26:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:dcf:15e4:5f50:e692])
        by smtp.gmail.com with ESMTPSA id t22-20020a634616000000b005c215baacc1sm11816336pga.70.2023.11.29.13.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:26:29 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: linux-usb@vger.kernel.org,
	Grant Grundler <grundler@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Edward Hill <ecgh@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Simon Horman <horms@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net v3 5/5] r8152: Add RTL8152_INACCESSIBLE to r8153_aldps_en()
Date: Wed, 29 Nov 2023 13:25:24 -0800
Message-ID: <20231129132521.net.v3.5.I1306b6432228404d6e61b2d43c2f71885292e972@changeid>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231129132521.net.v3.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
References: <20231129132521.net.v3.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delay loops in r8152 should break out if RTL8152_INACCESSIBLE is set
so that they don't delay too long if the device becomes
inaccessible. Add the break to the loop in r8153_aldps_en().

Fixes: 4214cc550bf9 ("r8152: check if disabling ALDPS is finished")
Reviewed-by: Grant Grundler <grundler@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- Added Fixes tag to RTL8152_INACCESSIBLE patches.
- Split RTL8152_INACCESSIBLE patches by the commit the loop came from.

 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 3958eb622d47..fcdc9ba0f826 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -5803,6 +5803,8 @@ static void r8153_aldps_en(struct r8152 *tp, bool enable)
 		data &= ~EN_ALDPS;
 		ocp_reg_write(tp, OCP_POWER_CFG, data);
 		for (i = 0; i < 20; i++) {
+			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+				return;
 			usleep_range(1000, 2000);
 			if (ocp_read_word(tp, MCU_TYPE_PLA, 0xe000) & 0x0100)
 				break;
-- 
2.43.0.rc1.413.gea7ed67945-goog


