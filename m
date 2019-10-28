Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5F12E7851
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 19:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404370AbfJ1SXY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 14:23:24 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36464 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404359AbfJ1SXY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 14:23:24 -0400
Received: by mail-qt1-f193.google.com with SMTP id x14so5688115qtq.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 11:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bYdyfTTVAmyGW21ZGGqnnoD86zc6/IpuGIb/U04K8uI=;
        b=L15uAcXSF7j0iLmVzieZstNJpuLMz+ce+dovme+wlNu8+hx6J5j44mW5uNS+kUSiHK
         w29wSEu8ajENkKxD+B9Jtr8KDrzC4XdTscr0wriajfadOd1vlAkNIgVnf3bgXmDXELfS
         J//jn0gjTr2OFOtXrXAnYgs9mIYPy8ANRLl/hLbC0U9SPNmn5mYp9qqmn3T0TWFzpTp/
         A1ParnpqahmjKuGq7aXvleStxg2D804t3/3fozxJ4gDClZWIsTnepxr5N+sgpt3kGngD
         mPFBA5oDkJrzgtX9psmuFe1Yy7Sqfo+cw1DhLCTWsUUyZJ+C0PuvAbth7YZxn17Sy4MM
         tLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bYdyfTTVAmyGW21ZGGqnnoD86zc6/IpuGIb/U04K8uI=;
        b=jyxxKEmEcjQiYjuFfcD4LE1VcYa4nrT8gQIxVjWfFEilPUN/3YdkcDe5ruppKAtyX/
         i/GT4SQT6bOZCivx6IDKOLUXDocxdXKtL7BFKxfFtOwnrfEGBC2IHYKVgkXPZSnv7WEi
         QU3fseVFJoi5Bi+PpdNQ6r4Iyfzbp57B0ByXfTTutKY9/2bR7sgUz+NZAJcYrDIPiY5B
         fZE2lghLmfk+lj75UzANEgISNnbYtLkPnkILu12pdOqA36yyutiri5sLJWGarKOKvqYu
         SA/DjRdGCsMeMzsNgr2CKZb4AgcTP5PvStjn7BRD45i8dqOzIT+Iu5RBLTwmz+JkK19z
         FHlw==
X-Gm-Message-State: APjAAAXLNmlZvKkp3nbSrJudN6femtdAaaa+iv++byq8cS36dbMHWIb4
        v8YLaGOAiq0zpQANygW+uOA=
X-Google-Smtp-Source: APXvYqyBALN0xL62K4rkfFWmGboru7kCh/giq31JFj9yvizQqCE9Z5w702lsedNOszgfmlv2cY7gWQ==
X-Received: by 2002:aed:3baf:: with SMTP id r44mr16827909qte.255.1572287002822;
        Mon, 28 Oct 2019 11:23:22 -0700 (PDT)
Received: from firefly.sparksnet ([2601:153:900:a52:6f12:874c:d2b2:a9d0])
        by smtp.gmail.com with ESMTPSA id x9sm5808631qkl.75.2019.10.28.11.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 11:23:21 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     heiko@sntech.de
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, robin.murphy@arm.com,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH 4/5] arm64: dts: rockchip: add usb3 to rk3328 devicetree
Date:   Mon, 28 Oct 2019 18:22:53 +0000
Message-Id: <20191028182254.30739-5-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028182254.30739-1-pgwipeout@gmail.com>
References: <20191028182254.30739-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that we have a proper phy driver, we can add the requisite bits to the
rk3328 device tree.
Added the u3drd and u3phy nodes.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 31cc1541f1f5..072e988ad655 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -805,6 +805,47 @@
 		};
 	};
 
+	usb3phy_grf: syscon@ff460000 {
+		compatible = "rockchip,usb3phy-grf", "syscon";
+		reg = <0x0 0xff460000 0x0 0x1000>;
+	};
+
+	u3phy: usb3-phy@ff470000 {
+		compatible = "rockchip,rk3328-u3phy";
+		reg = <0x0 0xff470000 0x0 0x0>;
+		rockchip,u3phygrf = <&usb3phy_grf>;
+		rockchip,grf = <&grf>;
+		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "linestate";
+		clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
+		clock-names = "u3phy-otg", "u3phy-pipe";
+		resets = <&cru SRST_USB3PHY_U2>,
+			 <&cru SRST_USB3PHY_U3>,
+			 <&cru SRST_USB3PHY_PIPE>,
+			 <&cru SRST_USB3OTG_UTMI>,
+			 <&cru SRST_USB3PHY_OTG_P>,
+			 <&cru SRST_USB3PHY_PIPE_P>;
+		reset-names = "u3phy-u2-por", "u3phy-u3-por",
+			      "u3phy-pipe-mac", "u3phy-utmi-mac",
+			      "u3phy-utmi-apb", "u3phy-pipe-apb";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "disabled";
+
+		u3phy_utmi: utmi@ff470000 {
+			reg = <0x0 0xff470000 0x0 0x8000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		u3phy_pipe: pipe@ff478000 {
+			reg = <0x0 0xff478000 0x0 0x8000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+
 	sdmmc: dwmmc@ff500000 {
 		compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x0 0xff500000 0x0 0x4000>;
@@ -936,6 +977,37 @@
 		status = "disabled";
 	};
 
+	usbdrd3: usb@ff600000 {
+		compatible = "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3";
+		clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
+			 <&cru SCLK_USB3OTG_SUSPEND>;
+		clock-names = "ref", "bus_early",
+			      "suspend";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		clock-ranges;
+		status = "disabled";
+
+		usbdrd_dwc3: dwc3@ff600000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xff600000 0x0 0x100000>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "otg";
+			phys = <&u3phy_utmi>, <&u3phy_pipe>;
+			phy-names = "usb2-phy", "usb3-phy";
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
2.20.1

