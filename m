Return-Path: <linux-usb+bounces-3450-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EF67FC81B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0101F20F86
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 21:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C32481CB;
	Tue, 28 Nov 2023 21:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MNzPDxQQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6911A94
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 13:40:35 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28580df78f7so4058313a91.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 13:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701207635; x=1701812435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQusyzrWbRXd2hWyvgtHM4eFYw/jkvHj52PFedjE4u8=;
        b=MNzPDxQQog82ruT0Pm86elahz2XWC9NgB+Nn6hJoKHKqMOhqgb6dksbftGKJSRVUSQ
         VWZZ5tdg8mEjIfj32a1vIinHRAVpbvALXGQ4Ncaboa0w8S1Ji6/AG49Un6J1PfJD3x8I
         a+EQtpP0JeS4nbS5CHHQgkxMAo2TmA3RGWD6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701207635; x=1701812435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQusyzrWbRXd2hWyvgtHM4eFYw/jkvHj52PFedjE4u8=;
        b=cDwVCFFUZrZXYWWdK4buq94SenfZ1E7PRm/b1Pb+ScNr2WjNoeZ0/7g2hRvc3bdxKc
         3eqaVWu2EnM0Pd84AjJ5AwHSFW9j0XaW7MvW4540FHx+CgC9Rr9cJdnFw9f3BhJzMHv9
         5oSeX1G/sqzPqgUMuhJJTkRKleWaXyAalc5vsSvYtuSWjRAnXihttcYU9qxdMTdtTl6J
         Ld8zqdqLfzb2ibpzJ2bv3ar8vXyoTbW9gnEy8loBQuVcddy0ia/KjaD2OLpPMdWB/gm0
         y/584s5rwu4u6jbCeiDxEEKzz6XBcCVbM0FQ7/hfZjNZvDldF09vjKhjBPdXoqb7C5p8
         aYJw==
X-Gm-Message-State: AOJu0Yw0COuMQbm401PdhDCsEeVqEMGQFnQuIULGj3D26iCdvHYEEphF
	+jcHwMrPV67rRb8IQw1M1jZ/VA==
X-Google-Smtp-Source: AGHT+IHjxLHrbFVWHHz1UpDOcxGnHlHtypDnIRIFnoRa58o7N6BLTb9cS6ooZ698m1EJq0bwrHtneQ==
X-Received: by 2002:a17:90b:3846:b0:285:9408:2fb8 with SMTP id nl6-20020a17090b384600b0028594082fb8mr15411756pjb.43.1701207634922;
        Tue, 28 Nov 2023 13:40:34 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:fc3a:13ce:3ee3:339f])
        by smtp.gmail.com with ESMTPSA id ie24-20020a17090b401800b002609cadc56esm9634285pjb.11.2023.11.28.13.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:40:34 -0800 (PST)
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
Subject: [PATCH net v2 3/5] r8152: Add RTL8152_INACCESSIBLE to r8156b_wait_loading_flash()
Date: Tue, 28 Nov 2023 13:38:12 -0800
Message-ID: <20231128133811.net.v2.3.Ib839d9adc704a04f99743f070d6c8e39dec6a1aa@changeid>
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
inaccessible. Add the break to the loop in
r8156b_wait_loading_flash().

Fixes: 195aae321c82 ("r8152: support new chips")
Reviewed-by: Grant Grundler <grundler@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Added Fixes tag to RTL8152_INACCESSIBLE patches.
- Split RTL8152_INACCESSIBLE patches by the commit the loop came from.

 drivers/net/usb/r8152.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 5a9c5b790508..b7bbebf09d85 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -5521,6 +5521,8 @@ static void r8156b_wait_loading_flash(struct r8152 *tp)
 		int i;
 
 		for (i = 0; i < 100; i++) {
+			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+				return;
 			if (ocp_read_word(tp, MCU_TYPE_USB, USB_GPHY_CTRL) & GPHY_PATCH_DONE)
 				break;
 			usleep_range(1000, 2000);
-- 
2.43.0.rc1.413.gea7ed67945-goog


