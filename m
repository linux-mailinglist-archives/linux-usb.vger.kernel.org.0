Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 856BC23F96
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 19:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfETR4R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 13:56:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42250 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfETR4R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 13:56:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id 13so7580640pfw.9
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YtT3QQC/EcCQGVPUxChzIKDFjejylVy5RwDw6h0rP8Y=;
        b=CxFoYWn12E2Wfl/DUay6zYNsj7HkCPiuVskqwVaONHUcKwExrtZmQOUQe3Ey65gpym
         dAOGhlevbrpgGEs202kzU4iLQG4beU2kc1yQsScSMSHPdzEI2Apm3x9wOXfEkc/mhrVz
         YFNNrU0Y11kLRKndmuzqLvU8tkqX4lUaA3LPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YtT3QQC/EcCQGVPUxChzIKDFjejylVy5RwDw6h0rP8Y=;
        b=p83BprJu8G5UDm3k+dr9jcDbSHF9FpUnXpZ8ruoYCH1J+98Uvrf2cNX9W5Iro3FdJ/
         Mje+avsnJhsm6XZ0sTECTcWUz3QDslVQrcqkkDmlT4lysA2xBgdoMkiiGHdZsfulOMuj
         dw5gswb76P3j5HyE3Gq3Ck2rjXSso+GsYy8xae4FYzIaQYz7BiUtCB5a3tQK14K2MMuJ
         +wDV6Af6byTGscb7mFlJBEPYTudTJVQSwTyAHvsJiQ/OD8PQ2z9PkFO1W/rVWqLpo6Co
         c29CoCItiPbQIJ/iDxReVgKv8e0D8Z91EWh1kX6WKOWH9N+IhHRkGegcHlYuW4aZDFp+
         yZfw==
X-Gm-Message-State: APjAAAVq1e7H61a/FAt/ZnL3SHe4VOFZEOHei7MWvWAvWeZo058+NSGs
        HCHcCLbV8Ol5n8hE0eW+/Nad8KULvFA=
X-Google-Smtp-Source: APXvYqwliCorEDZCbklnXSYAbGCutGmLbgJZVbkDQsXYpFHd/ACzt+u6KekgF4vh+NU86UtFjG8ebw==
X-Received: by 2002:aa7:9e51:: with SMTP id z17mr81249778pfq.212.1558374976378;
        Mon, 20 May 2019 10:56:16 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm16852723pgq.1.2019.05.20.10.56.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 10:56:15 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, zyw@rock-chips.com,
        mka@chromium.org, ryandcase@chromium.org,
        Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] ARM: dts: rockchip: Allow wakeup from rk3288-veyron's dwc2 USB ports
Date:   Mon, 20 May 2019 10:56:05 -0700
Message-Id: <20190520175605.2405-4-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520175605.2405-1-dianders@chromium.org>
References: <20190520175605.2405-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We want to be able to wake from USB if a device is plugged in that
wants remote wakeup.  Enable it on both dwc2 controllers.

NOTE: this is added specifically to veyron and not to rk3288 in
general since it's not known whether all rk3288 boards are designed to
support USB wakeup.  It is plausible that some boards could shut down
important rails in S3.

Also note that currently wakeup doesn't seem to happen unless you use
the "deep" suspend mode (where SDRAM is turned off).  Presumably the
shallow suspend mode is gating some sort of clock that's important but
I couldn't easily figure out how to get it working.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3: None
Changes in v2:
- rk3288-veyron dts patch new for v2.

 arch/arm/boot/dts/rk3288-veyron.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 1252522392c7..1d8bfed7830c 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -424,6 +424,7 @@
 
 &usb_host1 {
 	status = "okay";
+	snps,need-phy-for-wake;
 };
 
 &usb_otg {
@@ -432,6 +433,7 @@
 	assigned-clocks = <&cru SCLK_USBPHY480M_SRC>;
 	assigned-clock-parents = <&usbphy0>;
 	dr_mode = "host";
+	snps,need-phy-for-wake;
 };
 
 &vopb {
-- 
2.21.0.1020.gf2820cf01a-goog

