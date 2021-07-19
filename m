Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A546B3CEFA4
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 01:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354490AbhGSWUA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 18:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359446AbhGSVpx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 17:45:53 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D39CC0613BE
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 15:21:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d1so10490452plg.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 15:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kr2j9CaXxciS53UTRehcKMdcqK5/tdAVzDNwoCD+H6E=;
        b=fTccJfOsHh6JMWpILS6FHigeaL6i0nuLan+ze4Zs14B0LIdha0N696hFpe8xig0wCH
         AFtOWI+QIQIMUgYGlhKQtPnEBrRAIAUog0LKxAaA4xheGykQyK7RS8fJ2w2FgDS9qZwN
         Win8zqC2Nz3Mak8+pF4MbYfEhfmsrv45UEbKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kr2j9CaXxciS53UTRehcKMdcqK5/tdAVzDNwoCD+H6E=;
        b=ppSaA8Z0FaMpTaq5h2nwMwqla7whkQrv7o/KO86nt5VFWWizU42rAOre3pP762rWaY
         WDIVr9Sg7lZ9xJGFmJh9qEE2+rHiROH5DXSjFeCUYPhvNkMkp0Nc/oG6W1PDf4hjZeFP
         BvPMcKIqAEhvz0Awkdtxb4r+/RZKzs33vaJ77ztW0OlBW0fV2Vek5R8+9djoyJIBNY7x
         vEnHoWiPmrjuN7uzLKKqhniZwiTnD1NdB+lSm2ppLPnZheUJuIS9udJH2mjT75JPN8e9
         356tHNUsO9RZr/ZcT7S5KnkwhyQFzGTMhq2xoy6fWkzEwyKMN6c9o8w+RXdZKCEX/2sP
         RiUA==
X-Gm-Message-State: AOAM531j4Y/b2BYNq6GfnUCeut6yv64z2ZDwE0hKRuGQZAi3i9nsLsx2
        4eLYSbogor9NIliFRDvMfAnT+A==
X-Google-Smtp-Source: ABdhPJwTwZotNkoksctnaCDVBY4TNTimpPmvP3pvsoZWqhlNur1wkrLjA5vmWpxUE59ImGQVEg/JmA==
X-Received: by 2002:a17:90a:4d04:: with SMTP id c4mr31533425pjg.148.1626733300231;
        Mon, 19 Jul 2021 15:21:40 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4d0:bf5f:b8cd:2d67])
        by smtp.gmail.com with UTF8SMTPSA id x10sm13438641pfh.56.2021.07.19.15.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 15:21:39 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v14 3/6] arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
Date:   Mon, 19 Jul 2021 15:21:25 -0700
Message-Id: <20210719152055.v14.3.Id45138610b749ff775186ac10b3d01c504ddf4f3@changeid>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
In-Reply-To: <20210719222128.4122837-1-mka@chromium.org>
References: <20210719222128.4122837-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The dependency of USB_DWC3 on USB_XHCI_PLATFORM is being changed
from 'select' to 'depends on' by another patch. The defconfig selects
USB_DWC3 and implicitly USB_DWC3_DUAL_ROLE, to keep this unchanged
USB_XHCI_PLATFORM now needs to be selected explicitly.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v14:
- rebased on v5.14-rc1 (with the rest of the series)
- added 'Reviewed-by' tag from Doug

Changes in v13:
- patch added to the series

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..b243bd11a4ed 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -802,6 +802,7 @@ CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PCI=m
 CONFIG_USB_XHCI_PCI_RENESAS=m
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_XHCI_TEGRA=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_EXYNOS=y
-- 
2.32.0.402.g57bb445576-goog

