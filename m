Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF4C49B883
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 17:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238468AbiAYQWh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 11:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1583474AbiAYQSi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 11:18:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5221C061748;
        Tue, 25 Jan 2022 08:18:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9E12AB8173F;
        Tue, 25 Jan 2022 16:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4498C340EC;
        Tue, 25 Jan 2022 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643127512;
        bh=vRDpKZFZETn6MvZEf3bprTs1tghONakQ9rTVi1azmOk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=azZLiM0c/MPpOicaF0zIjU5ZmbKWYo6YdfLmXMq+261w2UUr70AWAUlMTVkXoNLae
         gh6eWxuL+W6ogzagg0TnwQ84JvqLHByDQ7VH7wFQwIWMRw2vBfdAScXLbUZ1GskKDZ
         Pa2YPR5sJy526gIEa5SWrHoTbEYWHUCFYDEb37krcU+6egRG2+Y7K0q3T8CcozJ6oU
         vTj/u5Z/l/h8qrrQI+EKJxYbQOlVRikT/PFVwaaWg5e/yuOBiKPZry9En7GdFaWS9W
         ePmOKOdgqWV3FtZy56o/isczBLL4jsuwNwwYRoI/a5bpqC6fZUNn0ZkucdaJim0X5V
         nohnlZn1QoQOw==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     hminas@synopsys.com
Cc:     dinguyen@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg"
Date:   Tue, 25 Jan 2022 10:18:21 -0600
Message-Id: <20220125161821.1951906-3-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125161821.1951906-1-dinguyen@kernel.org>
References: <20220125161821.1951906-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DWC2 USB controller on the Agilex platform does not support clock
gating, so use the chip specific "intel,socfpga-agilex-hsotg"
compatible.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 0dd2d2ee765a..f4270cf18996 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -502,7 +502,7 @@ uart1: serial@ffc02100 {
 		};
 
 		usb0: usb@ffb00000 {
-			compatible = "snps,dwc2";
+			compatible = "intel,socfpga-agilex-hsotg", "snps,dwc2";
 			reg = <0xffb00000 0x40000>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy0>;
@@ -515,7 +515,7 @@ usb0: usb@ffb00000 {
 		};
 
 		usb1: usb@ffb40000 {
-			compatible = "snps,dwc2";
+			compatible = "intel,socfpga-agilex-hsotg", "snps,dwc2";
 			reg = <0xffb40000 0x40000>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&usbphy0>;
-- 
2.25.1

