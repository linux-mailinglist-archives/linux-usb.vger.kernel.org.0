Return-Path: <linux-usb+bounces-615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AC7AF5B3
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 23:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id CEDA32839FB
	for <lists+linux-usb@lfdr.de>; Tue, 26 Sep 2023 21:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0234B20E;
	Tue, 26 Sep 2023 21:29:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEC94A552
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 21:28:59 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A0FA265
	for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 14:28:56 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3adc9770737so6012347b6e.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Sep 2023 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695763736; x=1696368536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1loE5eg1Eoj4ZTfC+vU3O0r4gZ2OLkuivrhZ+A+bBkA=;
        b=n0iEUIJZLZHal0tpBXmBPg99RnWiFacLJT5nsc//If9A9v3R1yk7gDIrkhtqPg0n5j
         XcT9T4gNsx0Z/ZE6YUyTcdNHquUmYPhwCsD/yA5FCj2LF8xD40/I80ycF0NRx4iOR5Vb
         Nix8n4jULZdUHcGa+soPXgh69sMfdAvDZ4lZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695763736; x=1696368536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1loE5eg1Eoj4ZTfC+vU3O0r4gZ2OLkuivrhZ+A+bBkA=;
        b=Nv8dRD2noro07O7PhlqtGCPznE6r9dVaUKJ9LvNqUpA/Ctg7IE+FNWRW8IcLs6E7ZY
         LFQsbYVmR1FTwlu/aFzO/eoOO8HxOoWvcreF6NlMc4PiXbJHmcZc86G8E6O/Rrg1KWln
         3xg5Ps6qFgJjs3Cd/KXA82ztrbeZa1Mg76WgSOoa0CatNy7lGsaS0zAs9cWGPLi8xvBP
         B33PaW3WaM+Ey+fTRz5/UxzVd4RgChpf13v2iyaoergljznhQzb1vo8/ffmDO7IMhsDv
         m8MFzrvmohgM7qGNa5ptZd6U89qc2k8oUudCgksyAlsfLLkBM1GzwAhcbLb2tEBhkuzH
         UTwA==
X-Gm-Message-State: AOJu0YwyW8E7o0yJWkIJbxrdMbOQfQxDams1ZapkNqg0P6KurRS90ITy
	s3lhqzr7MF5I31Gy1m+u1R3pfA==
X-Google-Smtp-Source: AGHT+IF9qNMEYob7OXrxHyrG09tHkFsXpQZG6RDgC/gNKP4FupaZmh2+AHPaaHZkN4OnVPiNuR9dNA==
X-Received: by 2002:aca:1218:0:b0:3a7:6d64:aa68 with SMTP id 24-20020aca1218000000b003a76d64aa68mr232514ois.18.1695763736267;
        Tue, 26 Sep 2023 14:28:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:f39:c3f2:a3b:4fcd])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b0068fece2c190sm10337251pfd.70.2023.09.26.14.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:28:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: linux-usb@vger.kernel.org,
	Grant Grundler <grundler@chromium.org>,
	Edward Hill <ecgh@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	anton@polit.no,
	bjorn@mork.no,
	edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH 1/3] r8152: Increase USB control msg timeout to 5000ms as per spec
Date: Tue, 26 Sep 2023 14:27:26 -0700
Message-ID: <20230926142724.1.I6e4fb5ae61b4c6ab32058cb12228fd5bd32da676@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230926212824.1512665-1-dianders@chromium.org>
References: <20230926212824.1512665-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

According to the comment next to USB_CTRL_GET_TIMEOUT and
USB_CTRL_SET_TIMEOUT, although sending/receiving control messages is
usually quite fast, the spec allows them to take up to 5 seconds.
Let's increase the timeout in the Realtek driver from 500ms to 5000ms
(using the #defines) to account for this.

This is not just a theoretical change. The need for the longer timeout
was seen in testing. Specifically, if you drop a sc7180-trogdor based
Chromebook into the kdb debugger and then "go" again after sitting in
the debugger for a while, the next USB control message takes a long
time. Out of ~40 tests the slowest USB control message was 4.5
seconds.

While dropping into kdb is not exactly an end-user scenario, the above
is similar to what could happen due to an temporary interrupt storm,
what could happen if there was a host controller (HW or SW) issue, or
what could happen if the Realtek device got into a confused state and
needed time to recover.

This change is fairly critical since the r8152 driver in Linux doesn't
expect register reads/writes (which are backed by USB control
messages) to fail.

Fixes: ac718b69301c ("net/usb: new driver for RTL8152")
Suggested-by: Hayes Wang <hayeswang@realtek.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/net/usb/r8152.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 0c13d9950cd8..482957beae66 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -1212,7 +1212,7 @@ int get_registers(struct r8152 *tp, u16 value, u16 index, u16 size, void *data)
 
 	ret = usb_control_msg(tp->udev, tp->pipe_ctrl_in,
 			      RTL8152_REQ_GET_REGS, RTL8152_REQT_READ,
-			      value, index, tmp, size, 500);
+			      value, index, tmp, size, USB_CTRL_GET_TIMEOUT);
 	if (ret < 0)
 		memset(data, 0xff, size);
 	else
@@ -1235,7 +1235,7 @@ int set_registers(struct r8152 *tp, u16 value, u16 index, u16 size, void *data)
 
 	ret = usb_control_msg(tp->udev, tp->pipe_ctrl_out,
 			      RTL8152_REQ_SET_REGS, RTL8152_REQT_WRITE,
-			      value, index, tmp, size, 500);
+			      value, index, tmp, size, USB_CTRL_SET_TIMEOUT);
 
 	kfree(tmp);
 
@@ -9494,7 +9494,8 @@ static u8 __rtl_get_hw_ver(struct usb_device *udev)
 
 	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 			      RTL8152_REQ_GET_REGS, RTL8152_REQT_READ,
-			      PLA_TCR0, MCU_TYPE_PLA, tmp, sizeof(*tmp), 500);
+			      PLA_TCR0, MCU_TYPE_PLA, tmp, sizeof(*tmp),
+			      USB_CTRL_GET_TIMEOUT);
 	if (ret > 0)
 		ocp_data = (__le32_to_cpu(*tmp) >> 16) & VERSION_MASK;
 
-- 
2.42.0.515.g380fc7ccd1-goog


