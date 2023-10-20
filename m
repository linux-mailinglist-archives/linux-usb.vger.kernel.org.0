Return-Path: <linux-usb+bounces-2010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A07D17C9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 23:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48EC728260D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 21:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8F332C87;
	Fri, 20 Oct 2023 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jjPP0R+Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA222FE0D
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 21:08:21 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9C010D8
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:08:19 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68fb85afef4so1261346b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697836099; x=1698440899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAHIdwVQAiU7foM+hKZA1xP7duO0xSFXmMfBzAEr0JE=;
        b=jjPP0R+Zvip59m9GnAgCjFOC5ZF15TLYAfIkxR04byd7FNrDKaiarIblamhi0ORbje
         xfpt1fG7hy8ApnKxT/ypaiehvhf0p3bgboxbvPk+hoTbhr/9w3u+w6Ismd0ejkv3FINH
         YHYzi0dF3D+B6L+LL2jSO0ht1U6tbHLAShq64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697836099; x=1698440899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAHIdwVQAiU7foM+hKZA1xP7duO0xSFXmMfBzAEr0JE=;
        b=r9pzD/Eaydk/ck6mi/H1S+nlsmPxA7fIQpzvQwSzNId18YqYAodsrSW/JrYbdDjDck
         KKAdzakWBsJmyG9cqVBmPoRxekxntITu/F9lPsLNP0PBGGcxBlgos3sc5E89wilqPSfb
         RJmU8Xy3Afgkc+11v+JaiRNyeWp+KzKAaIPA22B7deM1j0KjroPjZJwVkxSrmd2DIxpb
         7bh3GaOBCxmtR8BnqTf6FsRPUDSvFRMEFRo88Ty8g9TnLdBrkzdcNToZHMYGX5An9Fcg
         Li4tp7fns1GMrMavG9JAEqztzlIXUXfzdilBWNPmJo4YSe0WWYczTTNQqO6FY9Qpl67l
         LDrw==
X-Gm-Message-State: AOJu0YwI4Nhm7Ryv8n5rk7XpdKKXFdLSWl1uxUaLSVc9f7NlQwUBUOVP
	pe4EpKsxoPqQ91BTLy0mOMk/kA==
X-Google-Smtp-Source: AGHT+IEn6jcxkt9TyQiKUw23seFuVPHzoEYn+HWDkq+K/reiZe+dgtgWKedWHh/Hs0mkO3kxL0L5Iw==
X-Received: by 2002:a05:6a00:1402:b0:693:3851:bd3e with SMTP id l2-20020a056a00140200b006933851bd3emr3272815pfu.3.1697836099153;
        Fri, 20 Oct 2023 14:08:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c078:ee4f:479f:8486])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7954e000000b00686b649cdd0sm1969278pfq.86.2023.10.20.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 14:08:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Edward Hill <ecgh@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Simon Horman <horms@kernel.org>,
	linux-usb@vger.kernel.org,
	Grant Grundler <grundler@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v5 5/8] r8152: Check for unplug in rtl_phy_patch_request()
Date: Fri, 20 Oct 2023 14:06:56 -0700
Message-ID: <20231020140655.v5.5.I300ed6c3269c77756bdd10dd0d6f97db85470186@changeid>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231020210751.3415723-1-dianders@chromium.org>
References: <20231020210751.3415723-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the adapter is unplugged while we're looping in
rtl_phy_patch_request() we could end up looping for 10 seconds (2 ms *
5000 loops). Add code similar to what's done in other places in the
driver to check for unplug and bail.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- ("Check for unplug in rtl_phy_patch_request()") new for v2.

 drivers/net/usb/r8152.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 656fe90734fc..9888bc43e903 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -4046,6 +4046,9 @@ static int rtl_phy_patch_request(struct r8152 *tp, bool request, bool wait)
 	for (i = 0; wait && i < 5000; i++) {
 		u32 ocp_data;
 
+		if (test_bit(RTL8152_UNPLUG, &tp->flags))
+			break;
+
 		usleep_range(1000, 2000);
 		ocp_data = ocp_reg_read(tp, OCP_PHY_PATCH_STAT);
 		if ((ocp_data & PATCH_READY) ^ check)
-- 
2.42.0.758.gaed0368e0e-goog


