Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9BE2458BD
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 19:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbgHPRTY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Aug 2020 13:19:24 -0400
Received: from w1.tutanota.de ([81.3.6.162]:39822 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbgHPRTX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 Aug 2020 13:19:23 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 23B56FA01AB;
        Sun, 16 Aug 2020 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1597598360;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=Gi3w6dYvszIhNmdn8K3f13r474z+EsQSWYigqXPBxAM=;
        b=D1CvKof1nVQZk9R18QpAcSfj9W15lwqCL+crEro978qAfik7BtCaqVlRPTXQOfJx
        PN+32KRnLgIXA6WPesPeq1QzHKSFh1dBbyhi4T932k+kC0oRC0pANMG/dVI7IQimUV0
        k7OJS0xIAF34pOWegRRmCNnuN6Sd3upNUAjlBxe4fSAIiv1FdE6dzFdUVQI1pyFklpB
        FMdHNPCd7libkR74Q+b1qMB2RoPnTszLFMUkr2CgJDJO9P0zoEodml5dccTj/3hbWDY
        OgNPPx/eUMuQb2TzGWfnTJeXRXkPg9T8hPK7kszZ1YGjViCBf0Q1QA+FiglX94dHzig
        ZbZ3SB29Gg==
Date:   Sun, 16 Aug 2020 19:19:20 +0200 (CEST)
From:   Cameron Nemo <cnemo@tutanota.com>
To:     Devicetree <devicetree@vger.kernel.org>,
        Linux Arm Kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Rockchip <linux-rockchip@lists.infradead.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Usb <linux-usb@vger.kernel.org>
Cc:     Robh+dt <robh+dt@kernel.org>, Heiko <heiko@sntech.de>,
        Balbi <balbi@kernel.org>, Gregkh <gregkh@linuxfoundation.org>
Message-ID: <MEsH4zf--7-2@tutanota.com>
In-Reply-To: <MEsGppx--3-2@tutanota.com>
References: <MEsGWB_--3-2@tutanota.com> <MEsGppx--3-2@tutanota.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: enable rk3328-rock64 usb3 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Cameron Nemo <cnemo@tutanota.com>
---
arch/arm64/boot/dts/rockchip/rk3328-rock64.dts | 9 +++++++++
1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
index 86cfb5c50a94..ae27f449f4a3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-rock64.dts
@@ -392,6 +392,15 @@ &usb_host0_ohci {
status = "okay";
};

+&usbdrd3 {
+	status = "okay";
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
&vop {
status = "okay";
};
--
2.28.0


