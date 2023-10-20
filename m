Return-Path: <linux-usb+bounces-2007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6FF7D17BD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 23:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6145B21549
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 21:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D630E2B745;
	Fri, 20 Oct 2023 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="apn6y9gZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757D324A16
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 21:08:15 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A531D79
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:08:14 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6bd96cfb99cso1128754b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 14:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697836093; x=1698440893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t/WxCh6KdH2++1xQE9zOJhNaEepvtTtM2yGGCDnfvM=;
        b=apn6y9gZr0qOBP/fjDAk6rvVDOwUxykq86ETONVek+YLsPF7Q6he/nCT0MkytMet0U
         4sdBe7AXnO4LocU4Ur2tzlYlX57Tk0lbYD2TahS2nyFot5yT7qX5Fl6ezLUbydIlXidz
         Ghm+gkwQCUYLqMlrT0vK5023tgi9lrAoxBCto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697836093; x=1698440893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2t/WxCh6KdH2++1xQE9zOJhNaEepvtTtM2yGGCDnfvM=;
        b=ttZXS+6111yZt7q2ch4tBSRMqwhmoc4PB7ctm31QNjVTiL1rYAlNJjMd+4SkN7ElQj
         p5qxsYG1RndZzfgucY3CBVS0Xph6M4MNMVQHbyaB+pP2Rvh9808uam3FGZYAq8Odps8x
         UGXs0NqmX6fXpnFabRaeJuaJldpnld8iIsV2n8i33u2DF+igL6YOGdxozYs9hkseBglZ
         YJfR390tzDMJmyMimtMqRNzITNbnauAa6yX4CtYZXsY0PeIQGf26DGzU70FlYWKQU+U6
         Slxba9U5Qs6ev6BNUMP0CEu7HeFEG7mvUMuzkwEBW7zOKgaq5vHxW5rbIlizn93zpPYm
         iOvg==
X-Gm-Message-State: AOJu0YzmjbBG6jraJOg9ev7+/BvlCYGnfgn8gS8/MkQuSU+hNcIuoQvq
	ak9fJM/lhA9zORHuWWMMVQ3hug==
X-Google-Smtp-Source: AGHT+IE6axLBKc3+wPtanABcT7sl7VGqkG2bF/ojJ4QnAH6ktIyTpmQIevCdzc7G9qZC5QtLCn5amQ==
X-Received: by 2002:a05:6a20:548c:b0:159:dccb:8bb4 with SMTP id i12-20020a056a20548c00b00159dccb8bb4mr3477526pzk.23.1697836093673;
        Fri, 20 Oct 2023 14:08:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:c078:ee4f:479f:8486])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7954e000000b00686b649cdd0sm1969278pfq.86.2023.10.20.14.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 14:08:13 -0700 (PDT)
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
Subject: [PATCH v5 2/8] r8152: Run the unload routine if we have errors during probe
Date: Fri, 20 Oct 2023 14:06:53 -0700
Message-ID: <20231020140655.v5.2.Ica8e16a84695e787d55e54e291fbf8a28e7f2f7b@changeid>
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

The rtl8152_probe() function lacks a call to the chip-specific
unload() routine when it sees an error in probe. Add it in to match
the cleanup code in rtl8152_disconnect().

Fixes: ac718b69301c ("net/usb: new driver for RTL8152")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- ("Run the unload routine if we have errors during probe") new for v5.

 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 482957beae66..201c688e3e3f 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -9783,6 +9783,8 @@ static int rtl8152_probe(struct usb_interface *intf,
 
 out1:
 	tasklet_kill(&tp->tx_tl);
+	if (tp->rtl_ops.unload)
+		tp->rtl_ops.unload(tp);
 	usb_set_intfdata(intf, NULL);
 out:
 	free_netdev(netdev);
-- 
2.42.0.758.gaed0368e0e-goog


