Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8021554A6D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 15:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350274AbiFVNE5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 09:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349892AbiFVNEx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 09:04:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEFC17E1F
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903092; x=1687439092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0C/9qSsmMcABIeycwGOjKNCnIce0Ux/uWZw0K8/a/YU=;
  b=kj5ehZEW8fxpUE2LYJjjvBCMfd8F+k+IvLW1gwk9dNVZhO6i5LdHxSYw
   mnSfveLhzO153JW/enmpYQhXKpDh07GLejlEZtL3eFtf72drIc8KtlAsy
   0XMa6Uu8O1aqRWhEddQQhrxtymiO/AyGb8H6PIz/emp6Ot5JrLtja0Mjx
   +reL++Wnzh95BjWhrHODB56jNiHxxPvSIEWrLiAj2hzlXWYx+BI31yyeT
   NCAbid8Af4a7DLt9je8wzGYT2KSlNnmuxcuGLi33kPlskiiSU+wlHG06d
   ra8en28cOyPji/kPpZ9aVJkHbysmP1nJbR7vqEgphh2aMR7HeG0XeG+Ie
   w==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605522"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 22 Jun 2022 15:04:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 22 Jun 2022 15:04:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903087; x=1687439087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0C/9qSsmMcABIeycwGOjKNCnIce0Ux/uWZw0K8/a/YU=;
  b=PGbuEGSFxpLDFy4DicTiHhFTKdhXyLNvBi5ieGHPcffcD0AZUHmm6EgP
   yxkMMIOLi8+ZXH0PWrdS6rbnzEyTQ2EImitg3qOsrjdibWC3mMJ1VtCSl
   PEcmM0naPn6/1gOjl2Ews9/SmtTfJqTclWuXgSUJK4/qYoe6bKzVKfOlz
   l1prFrDSPaAeVl8Fkwu7mCJga8hsA0fxbFpIaU1HD4WKXo7GGl9F4HpGc
   v/hP5q5TVwOynrcVCFIjXqz98RTX+CVTTEYImW4aidZYwMfqB0JJytxBk
   FtEh9L3dncXjYSol/ZO8WX5P8ITdPtkZq5h+2xHN3nt++ujrVVdzHBQqP
   A==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605521"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A293A280056;
        Wed, 22 Jun 2022 15:04:47 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 3/4] arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
Date:   Wed, 22 Jun 2022 15:04:39 +0200
Message-Id: <20220622130440.955465-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
References: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With this set the SOF/ITP counter is based on ref_clk when 2.0 ports are
suspended.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index cbfe841fa38b..5f10fa6a3fde 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1170,6 +1170,7 @@ usb_dwc3_0: usb@38100000 {
 				phys = <&usb3_phy0>, <&usb3_phy0>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,dis-u2-freeclk-exists-quirk;
+				snps,gfladj-refclk-lpm-sel-quirk;
 			};
 
 		};
@@ -1212,6 +1213,7 @@ usb_dwc3_1: usb@38200000 {
 				phys = <&usb3_phy1>, <&usb3_phy1>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,dis-u2-freeclk-exists-quirk;
+				snps,gfladj-refclk-lpm-sel-quirk;
 			};
 		};
 
-- 
2.25.1

