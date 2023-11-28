Return-Path: <linux-usb+bounces-3451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691267FC81E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993661C20FFE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 21:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AE050249;
	Tue, 28 Nov 2023 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KwXj6vzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C84B6
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 13:40:37 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-285949d46d0so195772a91.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 13:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701207637; x=1701812437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdYFcaVqzynOfnyusz8jDR2UhNqPzUcp03x21uK643I=;
        b=KwXj6vzwnAzCxZVnBkxy9sUifv4hVmU8/mAmFjpVsWTM2piSNBFene7KvluylT9APd
         EmtauclLAcFPAbqT53jQakuUt0y1jMNFS2P12ktGFM35hqutbY9oIGAGQdPO9c+YPFQM
         Fkd398kFP06nTYMPl47Y1cQNG4yt/aPLfVUeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207637; x=1701812437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdYFcaVqzynOfnyusz8jDR2UhNqPzUcp03x21uK643I=;
        b=coBfKtqEx63AY1l6YQgbLVvFfC1NVaqbbSVOxQ2KPbQDXULWbnikrc4dPK+hdVXfz0
         Il9DqpczvDzCPm2FJRmhV8YYoy4wESI3xc19OEXEaGOFFHdPO6H4bojQ/CN6nxnKpUYO
         S3rXE4Wtp+rvkgEevGbj/HsK1s4wCA1lQ6H6wlZ0MdDW5pTiEPkZ8XG0tR0FDjBLJG8v
         pzoWMGXQKrqe/OODWIda1jThnck0w3/iENOHjagDWQTtm7JrXK3ELqrTq35zdrmLevBC
         gbvyiPP1k2WgGEn5Hfyke5UBv8vSy6gvhs8EBS5NnWp/tWyaDsk5Gl5Vv9Q2vYRus7St
         8osg==
X-Gm-Message-State: AOJu0YxhwFCd3tOgc0VBEhFz7laFsAgoDNqSfITahvV+Gy/P+cZM/t/C
	Z0IZIhFK5hr5IFvouoVt4Z4WdA==
X-Google-Smtp-Source: AGHT+IH4RO53658h+Al2BX088bV2/Mnm/iG5ehJ6k9Qim39+0UaugkvSbn2eifnYrVUt/cwOT8dUpA==
X-Received: by 2002:a17:90a:ce81:b0:281:3a5:d2ec with SMTP id g1-20020a17090ace8100b0028103a5d2ecmr27744675pju.8.1701207636843;
        Tue, 28 Nov 2023 13:40:36 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:fc3a:13ce:3ee3:339f])
        by smtp.gmail.com with ESMTPSA id ie24-20020a17090b401800b002609cadc56esm9634285pjb.11.2023.11.28.13.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:40:36 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Laura Nao <laura.nao@collabora.com>,
	Edward Hill <ecgh@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Grant Grundler <grundler@chromium.org>,
	linux-usb@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Malani <pmalani@chromium.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net v2 4/5] r8152: Add RTL8152_INACCESSIBLE to r8153_pre_firmware_1()
Date: Tue, 28 Nov 2023 13:38:13 -0800
Message-ID: <20231128133811.net.v2.4.I9c7bfe6fb76850f0323b3996e25a10ef0281fb7a@changeid>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231128133811.net.v2.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
References: <20231128133811.net.v2.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delay loops in r8152 should break out if RTL8152_INACCESSIBLE is set
so that they don't delay too long if the device becomes
inaccessible. Add the break to the loop in r8153_pre_firmware_1().

Fixes: 9370f2d05a2a ("r8152: support request_firmware for RTL8153")
Reviewed-by: Grant Grundler <grundler@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Added Fixes tag to RTL8152_INACCESSIBLE patches.
- Split RTL8152_INACCESSIBLE patches by the commit the loop came from.

 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index b7bbebf09d85..26db3f6b3aa1 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -5645,6 +5645,8 @@ static int r8153_pre_firmware_1(struct r8152 *tp)
 	for (i = 0; i < 104; i++) {
 		u32 ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, USB_WDT1_CTRL);
 
+		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+			return -ENODEV;
 		if (!(ocp_data & WTD1_EN))
 			break;
 		usleep_range(1000, 2000);
-- 
2.43.0.rc1.413.gea7ed67945-goog


