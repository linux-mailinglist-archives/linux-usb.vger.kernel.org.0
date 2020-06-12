Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D128C1F793D
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jun 2020 16:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgFLOCM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Jun 2020 10:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLOCL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Jun 2020 10:02:11 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA381C03E96F;
        Fri, 12 Jun 2020 07:02:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x14so9865708wrp.2;
        Fri, 12 Jun 2020 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=akkZ5CcN2estHPn/j8677EKazv05ZTETWmgOXSOMGAg=;
        b=WXz3tnYF6jjpUAYNGK3xeINfmxO7spB3uBuM2Ups4gjo341cq84JNNhjQhe21wpU+/
         DnwnqaTnGqUovXPkBIfpFU0TMHp1fsdV/sS2qZK+212gVSjTm8qFNC671fvtd8+bLv6G
         090jddhdl8SSIYJ6I9BQGc4+TctmE7BxQU1D+6qSD3d1mwE+6DX8T7k28ZjLxDqhlcAm
         z+PfuwruF3DIm5Dy+HsDqiRc4IoNerzPkN7niDzN1+AxLzxGjcQVkrANj6a8fil671tq
         r0rpR2uJQWFPNUIM5vFSrO6m7GCOD6UUfltIKg6bdqFkZIGcJJ+oGZWwBEGvMVMwt0Eu
         Dbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=akkZ5CcN2estHPn/j8677EKazv05ZTETWmgOXSOMGAg=;
        b=ZzWQ06tpuNo0mJuvjXseAaLvfxS2AK9xlPS5X5esXd6it2i8eGmJV9XqopP/jafpJ5
         Tot7c2UX/MItsIJfCtBM+tZKoNoMHPpQWAwBQIiGQAUI+7FdB8yJEHBYT9ltsqj6eJvJ
         rjIgaDnBAoltPYNr8x6rcZ1Goq7HLDSoJlcTcbUt1D79HrRoPvdSO4snfq7szGDHB7Tp
         3E0kdptzzuZQ1pEKpi5vPsrY471rrMMNj9zBQ9PQdH/+c+mlLaiceR08PxEuH5xi7ilW
         wJMq70FZJSHeZG+xbGZQQjBoFLY2asbxpaNvuE3pcaJoMvLpQaJkYfuTOOE56Ei0vljC
         lDhQ==
X-Gm-Message-State: AOAM532cxSgtMbGWW6N9me8WzRWXRriBV4SNfPBEodhHTDqTywwrcyIT
        YC0obrb5MtuYlUCBJH8kCcQ=
X-Google-Smtp-Source: ABdhPJzK3j1LBhz8Se1O6BCl7+LWrqUAPftuzBtZlq5yv7A30P7bSJrPWzHxMzaJTRIJ71BU8yUTSA==
X-Received: by 2002:adf:f8cc:: with SMTP id f12mr14797474wrq.418.1591970530346;
        Fri, 12 Jun 2020 07:02:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k17sm10437798wrl.54.2020.06.12.07.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:02:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] usb: xhci: tegra: Remove PLL power supplies
Date:   Fri, 12 Jun 2020 16:02:05 +0200
Message-Id: <20200612140205.2342900-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra XUSB controller driver doesn't need to control the PLL power
supplies directly, but rather uses the pads provided by the XUSB pad
controller, which in turn is responsible for supplying power to the
PLLs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 2eaf5c0af80c..9ce28ab47f4b 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1853,11 +1853,7 @@ static const char * const tegra124_supply_names[] = {
 	"avddio-pex",
 	"dvddio-pex",
 	"avdd-usb",
-	"avdd-pll-utmip",
-	"avdd-pll-erefe",
-	"avdd-usb-ss-pll",
 	"hvdd-usb-ss",
-	"hvdd-usb-ss-pll-e",
 };
 
 static const struct tegra_xusb_phy_type tegra124_phy_types[] = {
@@ -1931,10 +1927,6 @@ static const char * const tegra210_supply_names[] = {
 	"dvddio-pex",
 	"hvddio-pex",
 	"avdd-usb",
-	"avdd-pll-utmip",
-	"avdd-pll-uerefe",
-	"dvdd-pex-pll",
-	"hvdd-pex-pll-e",
 };
 
 static const struct tegra_xusb_phy_type tegra210_phy_types[] = {
-- 
2.24.1

