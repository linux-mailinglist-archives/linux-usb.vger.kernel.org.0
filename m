Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50BF913569D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 11:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730038AbgAIKPn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 05:15:43 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50999 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbgAIKPn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 05:15:43 -0500
Received: by mail-wm1-f66.google.com with SMTP id a5so2255610wmb.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 02:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WhPSwUwjAsJRbhdmE0cVGRUouZ5x8oaruQHda5jd55I=;
        b=HC8fxqJPjClPxESQg+0LexxqsyidMnZOoLeiIdUEVFGcSScR8sksKA8q5LQ6QyhVV5
         8VBJIJEry4vesoZt4jAg9/kBIHnwcETmPNkSAADxYybXsQR/UKd+wa/m6lVPDPd+B5Td
         13QrybTcCngrUVdXwb58E0/eQaDP0flCvPnqLulrWUvepPx7EUeHe6eJDQ+QsW/oV4nx
         UNraPa50rixC4EH+olOkJKgpoKEFvFWN84EiB+XcVbTNqZKlwa/0ZNfV6ER5mLkg7z2Y
         zKAK6QA2B0KAQrZgSg7oNulTVVT9aO0/LHgomXjDA78sQrB4Q2h6fm2yZ4gkNPBy8vY0
         8XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WhPSwUwjAsJRbhdmE0cVGRUouZ5x8oaruQHda5jd55I=;
        b=pijbH7gSp40l9TvEDmV7EoXSXHqGa+gQxHaLd8cWqXiB5anAnkOc3/OVH7f2bbLgP8
         HG9+5pZDfhZ6n7wsgK6HXyQlAjQJXqV0DJ5B6JrWbaLTpaVGaUhGeqosnLE8SAT8aPPx
         yLOYulnDdWZgNTVZcL2eHQHZaxMq0thNhVx7udq57xvqJ1KOS6t9QnANo91I6c0IvEaF
         CNaHjP9+G/cZNuiJ7fyohi3O0k+ki05HRKtkCkZmlpm9U+8JjbMNRL4Q2ppGPrqLplj8
         LeL+j1skYELvMIXUttb+hTeFg9TwfIWbV7md6cLq2GFIvWdB2gLoht6EbZTMn1E+Rt9c
         i6Bw==
X-Gm-Message-State: APjAAAXzoWLsc+K2mhJASFWroPPK+C/QqhzVKZaELXUuyAxj5G8zreYQ
        gDbomftdGSsaDIJTWl1rmKAdHQ==
X-Google-Smtp-Source: APXvYqweHN/a/x3NQ1r25V7h01jTBfRaAmdv+1exRitS5eU4c76wXJrzSyRMerZ3vIWt3dYZVjp/ng==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr3822007wmk.124.1578564941075;
        Thu, 09 Jan 2020 02:15:41 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q19sm2250460wmc.12.2020.01.09.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 02:15:40 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     balbi@kernel.org, khilman@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dongjin Kim <tobetter@gmail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>, Tim <elatllat@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3 controller
Date:   Thu,  9 Jan 2020 11:15:35 +0100
Message-Id: <20200109101535.26812-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200109101535.26812-1-narmstrong@baylibre.com>
References: <20200109101535.26812-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When high load on the DWC3 SuperSpee port, the controller crashed as:
[  221.141621] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.157631] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
[  221.157635] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
[  221.159901] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.159961] hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
[  221.160076] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[  221.165946] usb 2-1.1-port1: cannot reset (err = -22)

Setting the parkmode_disable_ss_quirk quirk fixes the issue.

CC: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..4b002e799e5c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2381,6 +2381,7 @@
 				dr_mode = "host";
 				snps,dis_u2_susphy_quirk;
 				snps,quirk-frame-length-adjustment;
+				snps,parkmode-disable-ss-quirk;
 			};
 		};
 
-- 
2.22.0

