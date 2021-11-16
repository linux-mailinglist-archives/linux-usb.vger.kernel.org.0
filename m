Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D32453AA8
	for <lists+linux-usb@lfdr.de>; Tue, 16 Nov 2021 21:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240411AbhKPULV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Nov 2021 15:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240326AbhKPULE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Nov 2021 15:11:04 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE31C061200
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 12:07:59 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id o14so147125plg.5
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 12:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plH00RAHWrUaoDk7ZWe9qkSJhRskMVgl9eoKPnmv1Ls=;
        b=PKJ1tkbe+EFKv4fXLmzUVqsuS1zwdvwgKdZBeMJiKOcWpxIs30BoE5Jd+bFqCp1cMd
         AwOiPJBtReIAzQ66lKaPNHP0PZyvJY2Zob31hm2t6rOBE9nelHFumt0Efvwl4dlMZgUZ
         ZI2Ug3mduH0Tpm1XPkiseMJG93PuWYGqxTMoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plH00RAHWrUaoDk7ZWe9qkSJhRskMVgl9eoKPnmv1Ls=;
        b=g9hl4M9SpfMb3xHHjjSdIuojeqIqm4iDjSg5mLWGNLpdnF938OKSsfjJnx6FOy4KFG
         r5JZ9PhgGVRchGUWXb9lqcXUuZZPH2+r/julJuyW/JY5Swpo2QgVct4vok/EbUT5F3Cv
         oAqkqswToP5Z7A5qGbT22B7ByWRu0qYpdgVH6RBVt+MCSJW69PTodCKx3rwALP94RXPJ
         vGEwDi8e53zOaPRzvTR8n6LSIZ3VwJnac9S/6kbCLotpkcLDfItIKP60ZKZPUKB3DUPU
         rgGqwji+aDAYnDsJGkgc57rWyjOo6+YxgMh9ZdyhJ0zCF3UzIJl1VhSjEneUknEE4+ui
         g1dQ==
X-Gm-Message-State: AOAM532tGi8WSkJmfXKFkStuk5PqG+hZbDKlWLHV9ookClva2PYRjwWU
        yHTqkKqyp7FDIjOtuQwMrK027g==
X-Google-Smtp-Source: ABdhPJyRPJG0Ovy0h1+/Gfnv6J5MOuyixdmQ+Q6c7F60s/VmC8GzBGQ8MVO6lwNf1KWE5z3iEjUHzA==
X-Received: by 2002:a17:902:be12:b0:142:431f:3d1c with SMTP id r18-20020a170902be1200b00142431f3d1cmr48989370pls.32.1637093279401;
        Tue, 16 Nov 2021 12:07:59 -0800 (PST)
Received: from localhost ([2620:15c:202:201:54aa:73ab:b480:41e2])
        by smtp.gmail.com with UTF8SMTPSA id o1sm3040031pjs.30.2021.11.16.12.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 12:07:59 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
        Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v17 6/7] arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
Date:   Tue, 16 Nov 2021 12:07:38 -0800
Message-Id: <20211116120642.v17.6.Id45138610b749ff775186ac10b3d01c504ddf4f3@changeid>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <20211116200739.924401-1-mka@chromium.org>
References: <20211116200739.924401-1-mka@chromium.org>
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
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---

Changes in v17:
- added 'Reviewed-by' tag from Roger

Changes in v16:
- none

Changes in v15:
- none

Changes in v14:
- rebased on v5.14-rc1 (with the rest of the series)
- added 'Reviewed-by' tag from Doug

Changes in v13:
- patch added to the series

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..588ab6aef755 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -811,6 +811,7 @@ CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PCI=m
 CONFIG_USB_XHCI_PCI_RENESAS=m
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_XHCI_TEGRA=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_EXYNOS=y
-- 
2.34.0.rc1.387.gb447b232ab-goog

