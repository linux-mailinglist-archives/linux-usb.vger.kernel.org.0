Return-Path: <linux-usb+bounces-1939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A169A7D03BF
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 23:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90EA1C20F66
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 21:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AA23FB0C;
	Thu, 19 Oct 2023 21:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EXZ6pO8L"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540838DF6
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 21:22:14 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1926110FA
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 14:21:58 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ca72f8ff3aso1015815ad.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 14:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697750517; x=1698355317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eh9gNdfF4X/gCkqak/1kHTLkL80QPwsWChwAwIX/vCk=;
        b=EXZ6pO8Ls3k9/TPQuHkGd8uiw8tNdHMdRF2ncSLiUqL69wK1K9f/p/HGPNUBwacQg+
         UhqCe50ZNV8+/MqwSEO46rfgmT9teuutVTEfLgHax96H/Oo6V23IfQAj5cFNB/1qJuEf
         GDQUEWdg6wWsrGU/kHwOvI2NpMy41vABaizzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697750517; x=1698355317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eh9gNdfF4X/gCkqak/1kHTLkL80QPwsWChwAwIX/vCk=;
        b=Pvvk5IQ/4UKjaM9K2YnfBolQbNIuRJbn9V5CPr1ZaEpHnMeCFapJpN0kwN/IzxsZz5
         WdILDFCtffNIHNTDPH5XgmN7Lo1J1kYv4632JvhMSUO6HBIc7tDX9kv6sx2QSdK8O/vo
         x4vbLnvqzEMEtG/udvJyVVuieu3o8LBFeOu2S6UCRSkUmEXdzx1PgCJr/+20DiKCrXR2
         0lEdQzBnbRZYIebztFvc1SMMDJc4cv2hRQQX9NzYhJ8UaMHewb+s39ALEk5D7VFvc34y
         njHeAmQraamUbBRXwkKJJ1r7f4ieSN6IA5Eq1ZsoCaQOzEhIjT7N0gVgKnoUl2cRkMUL
         WpEw==
X-Gm-Message-State: AOJu0Yx4LEuDQDtNMAacX0NsUIzS+YvuZRhJZlj3swaCQr3F+BQGbQU4
	DtLLS9TDILwiEKf1bYkRtFnnnw==
X-Google-Smtp-Source: AGHT+IFhaCrYRptQT2G1Mdon7Ns/UVfgU3ItPHb4YZENLzX8Rgdh+/NrkPOTBSofuDTZaHCwWkG/Vg==
X-Received: by 2002:a17:903:23c2:b0:1ca:6abe:cb37 with SMTP id o2-20020a17090323c200b001ca6abecb37mr126905plh.9.1697750517343;
        Thu, 19 Oct 2023 14:21:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:a6da:6f08:412:e04b])
        by smtp.gmail.com with ESMTPSA id l2-20020a170902d34200b001bbdd44bbb6sm154100plk.136.2023.10.19.14.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:21:56 -0700 (PDT)
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
Subject: [PATCH v4 2/5] r8152: Check for unplug in rtl_phy_patch_request()
Date: Thu, 19 Oct 2023 14:20:21 -0700
Message-ID: <20231019142019.v4.2.I300ed6c3269c77756bdd10dd0d6f97db85470186@changeid>
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
index 482957beae66..fff2f9e67b5f 100644
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


