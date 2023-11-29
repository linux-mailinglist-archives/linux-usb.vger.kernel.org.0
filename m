Return-Path: <linux-usb+bounces-3472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894B7FE1D0
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 22:26:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7B82B21029
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 21:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDF861FD6;
	Wed, 29 Nov 2023 21:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LKw4kFTK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DA910D7
	for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 13:26:28 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6cde104293fso261552b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 13:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701293188; x=1701897988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbdqD7No7SCueAxJzZPzHLsBDwHJFNtjAFZMErwtoME=;
        b=LKw4kFTKjkUYR/kWCjARKDyu5veQQCEcUP2K1je3QBwvmlW6e6ceZ67Rf0IGyDpAly
         ByojlZg1en/fr8ZOPzWdq7gyZeS3/iHEW54WLHwxVcE41eTkpRYGlcrkoqYbfkZLVVx4
         IHfOJsXjCA74y9yYlzAJ8KoHaGlVN7fflVfgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293188; x=1701897988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbdqD7No7SCueAxJzZPzHLsBDwHJFNtjAFZMErwtoME=;
        b=gCHQnopNgwF/Ij6hgMxuHLoZY1lIyLOjI4t5doPU5KcQcSeGW0Jjwmismy/hPluemY
         A6P9ej0g5dacmVePdw+XHpyjsof5P3Pbd2bKqZH99K+NEmO29hwbzRoPzcKs/AeXWsNR
         0V1NTxMLNUaFNpn+/vxepnZlVNuVTmkgA8o6yPdGwUP1HKj9mW+UOjfWrKcWfB8ewTrV
         g+8nHLIaqYc579oJi1C6bWWoiKnOQl0iwzlI+srEcmAGj2p9WE53GAAL/X8Tm5v+VqWg
         CQDwkzblxlYXT8bR5cTDXC+V22CGDKcMG6Py/Et/d6B9XlKJJ6Qehpb3LysCmJPst7Pk
         R2JA==
X-Gm-Message-State: AOJu0YwJ1uF7tOEHnzUZgzlnesyNVQIOiw/tTLQ1afuu62WZAkiQYPth
	bxAVXDFiInOf4sbXH1Vf3G8G6w==
X-Google-Smtp-Source: AGHT+IFXh72Ob5MZoR1IO4drHKAFb3RU/RoEmTYcsZkGZDGolKQYx2LRSlR1gen1SPs2SxAZlWPErQ==
X-Received: by 2002:a05:6a20:1581:b0:18c:c37:35fb with SMTP id h1-20020a056a20158100b0018c0c3735fbmr19950181pzj.40.1701293187747;
        Wed, 29 Nov 2023 13:26:27 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:dcf:15e4:5f50:e692])
        by smtp.gmail.com with ESMTPSA id t22-20020a634616000000b005c215baacc1sm11816336pga.70.2023.11.29.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:26:27 -0800 (PST)
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
	Prashant Malani <pmalani@chromium.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net v3 4/5] r8152: Add RTL8152_INACCESSIBLE to r8153_pre_firmware_1()
Date: Wed, 29 Nov 2023 13:25:23 -0800
Message-ID: <20231129132521.net.v3.4.I9c7bfe6fb76850f0323b3996e25a10ef0281fb7a@changeid>
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
inaccessible. Add the break to the loop in r8153_pre_firmware_1().

Fixes: 9370f2d05a2a ("r8152: support request_firmware for RTL8153")
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
index c4dd81e2421f..3958eb622d47 100644
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


