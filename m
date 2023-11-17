Return-Path: <linux-usb+bounces-2974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4D7EF93D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 22:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9E181C20299
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 21:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094D1374F3;
	Fri, 17 Nov 2023 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kAkHxOwr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEAF172E
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 13:09:57 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6c115026985so2493390b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 13:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700255397; x=1700860197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wz1t+l8RssdWaevpsmYkaZfUjbmCNYMu71lLo08Sgs=;
        b=kAkHxOwrS5quIbPQh6wjHSXX9Wot39Bcq6Hp/m+/pqUFUhGnZcRl+7btX1SmFR0D5I
         FXtC3Gt36Tpr0pbSdj9GU10CilJmHWfjMp0fKpb9IqpC1Rlkmw3iLhfeeXSbNQCkN568
         K1hyi32Ruf/h0r0k/6VGfXpiaGAnqDc9ctJAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255397; x=1700860197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wz1t+l8RssdWaevpsmYkaZfUjbmCNYMu71lLo08Sgs=;
        b=ovAOei24d1f2e54GJjKfgAO3DLhxU2Z4F0jDRZywOwjZ5yewPfmRks5WAGNLE3R3Tl
         DXVzu2TdJYYEUjD6MdQg9RzhgGKsfTsBhMVGgB6nP3IFvc4qv4FCr2SXTmfCLu+5kOiE
         LGssf4XR9Wv34hVgEz5NjY9g4CcPwMAEn4dTKBvIe0MHXKsgpenGgiygkw3Gcsr1LH7j
         4nC547D8xHxJq92eWmFL4iejrUlNNoOJnzialoC6kNB2swapXhKVJ8MkU0hPqIuhk6RY
         i0Z3tZF+iTlN6K41CYROd4bPhTirT/glRt/J4dodU1ooMwLfnhUu5CBIh2KIhrTA2LiA
         2AWw==
X-Gm-Message-State: AOJu0YyWSjlZYWffxoHeWNvekmRR5zMObMWyB7cep/xFBSo8XgvAAPTs
	MlhsHmVmR/0uPY9qsDCr1GSrng==
X-Google-Smtp-Source: AGHT+IFZoUAtpbAt9CjRIaojkHmlFqJvZdW1uuO02moJ36Q0TclS9DzF+qPPY0wh7Twfrp1yLU3GPQ==
X-Received: by 2002:a05:6a20:748e:b0:187:fe09:272a with SMTP id p14-20020a056a20748e00b00187fe09272amr424763pzd.49.1700255396830;
        Fri, 17 Nov 2023 13:09:56 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b953:95f4:4240:7018])
        by smtp.gmail.com with ESMTPSA id h20-20020a056a00219400b006c624e8e7e8sm1780587pfi.83.2023.11.17.13.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:09:56 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>,
	Hayes Wang <hayeswang@realtek.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: Grant Grundler <grundler@chromium.org>,
	Simon Horman <horms@kernel.org>,
	Edward Hill <ecgh@chromium.org>,
	linux-usb@vger.kernel.org,
	Laura Nao <laura.nao@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/2] r8152: Hold the rtnl_lock for all of reset
Date: Fri, 17 Nov 2023 13:08:41 -0800
Message-ID: <20231117130836.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit d9962b0d4202 ("r8152: Block future register access if
register access fails") there is a race condition that can happen
between the USB device reset thread and napi_enable() (not) getting
called during rtl8152_open(). Specifically:
* While rtl8152_open() is running we get a register access error
  that's _not_ -ENODEV and queue up a USB reset.
* rtl8152_open() exits before calling napi_enable() due to any reason
  (including usb_submit_urb() returning an error).

In that case:
* Since the USB reset is perform in a separate thread asynchronously,
  it can run at anytime USB device lock is not held - even before
  rtl8152_open() has exited with an error and caused __dev_open() to
  clear the __LINK_STATE_START bit.
* The rtl8152_pre_reset() will notice that the netif_running() returns
  true (since __LINK_STATE_START wasn't cleared) so it won't exit
  early.
* rtl8152_pre_reset() will then hang in napi_disable() because
  napi_enable() was never called.

We can fix the race by making sure that the r8152 reset routines don't
run at the same time as we're opening the device. Specifically we need
the reset routines in their entirety rely on the return value of
netif_running(). The only way to reliably depend on that is for them
to hold the rntl_lock() mutex for the duration of reset.

Grabbing the rntl_lock() mutex for the duration of reset seems like a
long time, but reset is not expected to be common and the rtnl_lock()
mutex is already held for long durations since the core grabs it
around the open/close calls.

Fixes: d9962b0d4202 ("r8152: Block future register access if register access fails")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/net/usb/r8152.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 2c5c1e91ded6..d6edf0254599 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8397,6 +8397,8 @@ static int rtl8152_pre_reset(struct usb_interface *intf)
 	struct r8152 *tp = usb_get_intfdata(intf);
 	struct net_device *netdev;
 
+	rtnl_lock();
+
 	if (!tp || !test_bit(PROBED_WITH_NO_ERRORS, &tp->flags))
 		return 0;
 
@@ -8428,20 +8430,17 @@ static int rtl8152_post_reset(struct usb_interface *intf)
 	struct sockaddr sa;
 
 	if (!tp || !test_bit(PROBED_WITH_NO_ERRORS, &tp->flags))
-		return 0;
+		goto exit;
 
 	rtl_set_accessible(tp);
 
 	/* reset the MAC address in case of policy change */
-	if (determine_ethernet_addr(tp, &sa) >= 0) {
-		rtnl_lock();
+	if (determine_ethernet_addr(tp, &sa) >= 0)
 		dev_set_mac_address (tp->netdev, &sa, NULL);
-		rtnl_unlock();
-	}
 
 	netdev = tp->netdev;
 	if (!netif_running(netdev))
-		return 0;
+		goto exit;
 
 	set_bit(WORK_ENABLE, &tp->flags);
 	if (netif_carrier_ok(netdev)) {
@@ -8460,6 +8459,8 @@ static int rtl8152_post_reset(struct usb_interface *intf)
 	if (!list_empty(&tp->rx_done))
 		napi_schedule(&tp->napi);
 
+exit:
+	rtnl_unlock();
 	return 0;
 }
 
-- 
2.43.0.rc0.421.g78406f8d94-goog


