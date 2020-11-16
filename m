Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8580B2B48FF
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 16:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730401AbgKPPTX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 10:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbgKPPTX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 10:19:23 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F062C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:23 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id 3so13102382qtx.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=96RQbd3xbCoXq8nQaSvV25c7fBVmlkmtbILb9lLEVCc=;
        b=TQ6YksiZV6nNmzn4KO6jK2ge1GzMrVa1svfsXapdp9thN3ZUITDdwUlTzSQ0dpPfYh
         geJEUW344+HQEFlZGBdjxMnMLhik6/mV6ADVcbT3dcFj5ZmuPJMqf99UPMdFtOQ5SRCu
         l0mpSd8SbWCQzEWYmoVQHhDJagRUKY6VJx2b/7PyNT0y3Sc1k3nXvUwRGgSI8ATwKsVg
         EgSP3JXy+7c/c97LZ3iuSAizuQdabqNXYl2n/CbhyjZcD1ynxklduF7zgxG8Cue0Ep//
         SLy5RtiE1RgsFHn4qvsJ1VXdbYByCqZPe6XeDMOLG93/5CWupms4iy90imhdFk1Moqze
         BWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=96RQbd3xbCoXq8nQaSvV25c7fBVmlkmtbILb9lLEVCc=;
        b=rmIpvOxnRaX1wxA6/bqcjFziRvoi9njaaC7rIq1GIoW0YdKb4QlRtUZMgsTiChkr+H
         eK5X2v2a5AggXdlo2bQBpDhcWAbkELq2vSWLG8WYNf46idt8/hfNQI55w6x8ZihdG/p+
         B4XGZcMq9EZGq0s//YhJaj00vM84zwItcws7FYNIhXN1DhBurYexbXZ6sLDzYGnxyzsN
         TxN9XWapCSuSKtGL0whFnakZvhUZQ09HSPqksGOhmsT4k5ddmH8HbDwgFl6L1IVy4PHG
         OblN6JdMVf1GExOn4n3OyHlnur08KpI8t8L/KbolzL/sx0GOGW96vQflpSMmrQluaodB
         XUFQ==
X-Gm-Message-State: AOAM533l/aHyn+5QYImHSCyjrMe6EUJuVF4uDhLzy3wGmppXgp4URxYG
        1nM56cOMaM6TxVEUgkWIt4U=
X-Google-Smtp-Source: ABdhPJyyrcB8/QuxOXY/HwMuNFrHfoL262pDdTeD92yflaQrFlebYxfBUlull52uCQufmLKxtF3Dbw==
X-Received: by 2002:ac8:5ccc:: with SMTP id s12mr14307478qta.309.1605539962795;
        Mon, 16 Nov 2020 07:19:22 -0800 (PST)
Received: from rockpro64.sparksnet ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id p127sm12216818qkc.37.2020.11.16.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:19:22 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, wulf@rock-chips.com,
        frank.wang@rock-chips.com, william.wu@rock-chips.com,
        zyw@rock-chips.com, kever.yang@rock-chips.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 3/4] arm64: dts: rockchip: add rk3328 usb3 and usb3phy nodes
Date:   Mon, 16 Nov 2020 15:17:35 +0000
Message-Id: <20201116151735.178737-4-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116151735.178737-1-pgwipeout@gmail.com>
References: <20201116151735.178737-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the usb3 controller and usb3 phy nodes to the rk3328.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 65 ++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index bbdb19a3e85d..9fea9203d114 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -853,6 +853,40 @@ u2phy_host: host-port {
 		};
 	};
 
+	usb3phy: usb3-phy@ff470000 {
+		compatible = "rockchip,rk3328-usb3phy";
+		reg = <0x0 0xff460000 0x0 0x10000>;
+		clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
+		clock-names = "usb3phy-otg", "usb3phy-pipe";
+		resets = <&cru SRST_USB3PHY_U2>,
+			 <&cru SRST_USB3PHY_U3>,
+			 <&cru SRST_USB3PHY_PIPE>,
+			 <&cru SRST_USB3OTG_UTMI>,
+			 <&cru SRST_USB3PHY_OTG_P>,
+			 <&cru SRST_USB3PHY_PIPE_P>;
+		reset-names = "usb3phy-u2-por", "usb3phy-u3-por",
+			      "usb3phy-pipe-mac", "usb3phy-utmi-mac",
+			      "usb3phy-utmi-apb", "usb3phy-pipe-apb";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		usb3phy_utmi: utmi@ff470000 {
+			compatible = "rockchip,rk3328-usb3phy-utmi";
+			reg = <0x0 0xff470000 0x0 0x8000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3phy_pipe: pipe@ff478000 {
+			compatible = "rockchip,rk3328-usb3phy-pipe";
+			reg = <0x0 0xff478000 0x0 0x8000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+
 	sdmmc: mmc@ff500000 {
 		compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x0 0xff500000 0x0 0x4000>;
@@ -983,6 +1017,37 @@ usb_host0_ohci: usb@ff5d0000 {
 		status = "disabled";
 	};
 
+       usbdrd3: usb@ff600000 {
+		compatible = "rockchip,rk3328-dwc3";
+		clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
+			 <&cru SCLK_USB3OTG_SUSPEND>;
+		clock-names = "ref", "bus_early", "suspend";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		usbdrd_dwc3: dwc3@ff600000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xff600000 0x0 0x100000>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
+				 <&cru SCLK_USB3OTG_SUSPEND>;
+			clock-names = "ref", "bus_early", "suspend";
+			dr_mode = "host";
+			usb-phy = <&usb3phy_utmi>, <&usb3phy_pipe>;
+			phy_type = "utmi_wide";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,xhci-trb-ent-quirk;
+			status = "disabled";
+		};
+	};
+
 	gic: interrupt-controller@ff811000 {
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-- 
2.25.1

