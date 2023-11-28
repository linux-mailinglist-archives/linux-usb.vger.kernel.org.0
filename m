Return-Path: <linux-usb+bounces-3449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5B87FC81A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B1FB1C2094F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 21:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1579481B1;
	Tue, 28 Nov 2023 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Khu2gVAl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D27FC4
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 13:40:33 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-285b88b9917so2426164a91.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 13:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701207632; x=1701812432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTf7laEeUj3qSMIeKUNEYkxSf/20WZAuUqY6YHsPieM=;
        b=Khu2gVAlHD+csXXo0q1xO4/jkNS+ILEY+a2xvftWq4m/28tdnrOepKj1qgU7HZ1d6T
         oaXEBgQY6M/H4A8WW9JpF9T5tTfuJeQ5+NOBhTlRE4XDuohHbiU7c3uIuNHTloaBsWcT
         /D0AlcRn/ZXvbP6IiJVuyOCcugMFRU3SzLjWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207632; x=1701812432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTf7laEeUj3qSMIeKUNEYkxSf/20WZAuUqY6YHsPieM=;
        b=L/HcOhNB4fgLWZ5dNoR+Z0NvHutOBZ5N/0fYz1vbICjWNrr1upvOQtzzYrlNyDw/Zw
         DU9UPWYul8osqPEqh7IqeiR4rFuiy2kiV+BGT7gCCDMXb9U7pOfXXIhOohER3nl+gYOJ
         ntMD+aT8POBck1QmKMXVeBBnwouDJOwgdLIdxH2wguHK9UKKpr+ef+ofyokKV3xHyFiu
         egYxxrOjoA99m1jeWHPM/ZX3oFG095RjYGZX/aKmaosprnM8JguHGSqsgBoli08/RP6t
         rtksnETWAoGdY/x56QinpXWUVK3ObnFVPqDGRW+Vso7FKSESr4xQNavEo8GB5imgXxrD
         O6kQ==
X-Gm-Message-State: AOJu0YyauvGzQHOB7K9NEgaQ8fAymqi4MlEW+RLp2wEDiSW9Se+XVfR1
	ptH0eD7da3kRikfGvwYUH3l3tw==
X-Google-Smtp-Source: AGHT+IH1Mz3DITqsthMMmrqNY8W6jsmTtUx3yEzJtXZyd44jum45JAWNl2EY4Qvlrg95B5tCq8vEIw==
X-Received: by 2002:a17:90a:d14f:b0:285:8a2a:1744 with SMTP id t15-20020a17090ad14f00b002858a2a1744mr15751836pjw.0.1701207632515;
        Tue, 28 Nov 2023 13:40:32 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:fc3a:13ce:3ee3:339f])
        by smtp.gmail.com with ESMTPSA id ie24-20020a17090b401800b002609cadc56esm9634285pjb.11.2023.11.28.13.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:40:32 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net v2 2/5] r8152: Add RTL8152_INACCESSIBLE checks to more loops
Date: Tue, 28 Nov 2023 13:38:11 -0800
Message-ID: <20231128133811.net.v2.2.I79c8a6c8cafd89979af5407d77a6eda589833dca@changeid>
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

Previous commits added checks for RTL8152_INACCESSIBLE in the loops in
the driver. There are still a few more that keep tripping the driver
up in error cases and make things take longer than they should. Add
those in.

All the loops that are part of this commit existed in some form or
another since the r8152 driver was first introduced, though
RTL8152_INACCESSIBLE was known as RTL8152_UNPLUG before commit
715f67f33af4 ("r8152: Rename RTL8152_UNPLUG to RTL8152_INACCESSIBLE")

Fixes: ac718b69301c ("net/usb: new driver for RTL8152")
Reviewed-by: Grant Grundler <grundler@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Added Fixes tag to RTL8152_INACCESSIBLE patches.
- Split RTL8152_INACCESSIBLE patches by the commit the loop came from.

 drivers/net/usb/r8152.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index d6edf0254599..5a9c5b790508 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -3000,6 +3000,8 @@ static void rtl8152_nic_reset(struct r8152 *tp)
 		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CR, CR_RST);
 
 		for (i = 0; i < 1000; i++) {
+			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+				return;
 			if (!(ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CR) & CR_RST))
 				break;
 			usleep_range(100, 400);
@@ -3329,6 +3331,8 @@ static void rtl_disable(struct r8152 *tp)
 	rxdy_gated_en(tp, true);
 
 	for (i = 0; i < 1000; i++) {
+		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+			return;
 		ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL);
 		if ((ocp_data & FIFO_EMPTY) == FIFO_EMPTY)
 			break;
@@ -3336,6 +3340,8 @@ static void rtl_disable(struct r8152 *tp)
 	}
 
 	for (i = 0; i < 1000; i++) {
+		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+			return;
 		if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_TCR0) & TCR0_TX_EMPTY)
 			break;
 		usleep_range(1000, 2000);
@@ -5499,6 +5505,8 @@ static void wait_oob_link_list_ready(struct r8152 *tp)
 	int i;
 
 	for (i = 0; i < 1000; i++) {
+		if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+			return;
 		ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL);
 		if (ocp_data & LINK_LIST_READY)
 			break;
-- 
2.43.0.rc1.413.gea7ed67945-goog


