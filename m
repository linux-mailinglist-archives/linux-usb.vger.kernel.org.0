Return-Path: <linux-usb+bounces-3471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC67C7FE1CD
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 22:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A19D1F20EF3
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 21:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F264D61FBF;
	Wed, 29 Nov 2023 21:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C4lVJORK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E46410C9
	for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 13:26:26 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b844e3e817so150103b6e.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 13:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701293186; x=1701897986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMcpqMy/WvMvoKWfDIGBKOAFuUqj17oPCULwBqejJlE=;
        b=C4lVJORKiRKQoLOQRaMC0SKViy4tj5C4e1iiha9OLbp2gviPXgdHl7Xarh4ln2cEkD
         mS2A2YJWz12HOoP8DMLXJjMrGizPLGZm87yzy6xoItNNbf82ynA+kLSGoiu3ZcR56wux
         fK0Y6KaA80U64dwQzXNWcokDnh5vYwmj/VnBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293186; x=1701897986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMcpqMy/WvMvoKWfDIGBKOAFuUqj17oPCULwBqejJlE=;
        b=fUb+z1q8er137Z4f2IYVVc72i4fj2kLMCxrZASKIhXkI3ekauV+JWpapxxlQukJEq9
         dEJi7f1cfWpqKX+noUYGy2uwKnjirZZQifyBx7HygFO0//ysZSQ9W2/NafkDTxPaXPwJ
         eh9MXTOS39d4ucOULSPth/gJBFZxKjfbAEdMm7HqG5zKeuUikj+3vD+doQlYrXSsLgje
         U5ZoBqisnH3+81eU3ZIt4A3Why9qqPiWjLMOE+HOAIDjTh+yUCWk4s5vANEaIAh/o07Y
         A9jW/l45Lmk5HIYuFTENGvmXI8h/f9UyDjV1j/JE7s0/GL0QDnIpJ4G2idA16nZz7gGp
         YDWA==
X-Gm-Message-State: AOJu0YxrJI+bu1IqMlIkpfxFFe99QOyyU9BeWv/UG0AezuCQUtM8xmlU
	QfSDhNy/dXjkz6L7ABtz+tY8cQ==
X-Google-Smtp-Source: AGHT+IFo9hDsSnSIWGrEdAY02Q4aEt7ECJUEAfZCr9exhU1TWNqAB4sD/xSLIxG2Em2k71nznnAgzw==
X-Received: by 2002:a54:4587:0:b0:3b8:37ba:7c73 with SMTP id z7-20020a544587000000b003b837ba7c73mr21628925oib.53.1701293185870;
        Wed, 29 Nov 2023 13:26:25 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:dcf:15e4:5f50:e692])
        by smtp.gmail.com with ESMTPSA id t22-20020a634616000000b005c215baacc1sm11816336pga.70.2023.11.29.13.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:26:25 -0800 (PST)
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
Subject: [PATCH net v3 3/5] r8152: Add RTL8152_INACCESSIBLE to r8156b_wait_loading_flash()
Date: Wed, 29 Nov 2023 13:25:22 -0800
Message-ID: <20231129132521.net.v3.3.Ib839d9adc704a04f99743f070d6c8e39dec6a1aa@changeid>
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
inaccessible. Add the break to the loop in
r8156b_wait_loading_flash().

Fixes: 195aae321c82 ("r8152: support new chips")
Reviewed-by: Grant Grundler <grundler@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Use `break` when we see RTL8152_INACCESSIBLE, not `return`.

Changes in v2:
- Added Fixes tag to RTL8152_INACCESSIBLE patches.
- Split RTL8152_INACCESSIBLE patches by the commit the loop came from.

 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index e9955701f455..c4dd81e2421f 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -5521,6 +5521,8 @@ static void r8156b_wait_loading_flash(struct r8152 *tp)
 		int i;
 
 		for (i = 0; i < 100; i++) {
+			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+				break;
 			if (ocp_read_word(tp, MCU_TYPE_USB, USB_GPHY_CTRL) & GPHY_PATCH_DONE)
 				break;
 			usleep_range(1000, 2000);
-- 
2.43.0.rc1.413.gea7ed67945-goog


