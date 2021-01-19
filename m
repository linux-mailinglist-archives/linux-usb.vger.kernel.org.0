Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3A42FB845
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 15:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392008AbhASMQZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 07:16:25 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18772 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731579AbhASI5f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 03:57:35 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60069ebd0000>; Tue, 19 Jan 2021 00:56:29 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 08:56:23 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 08:56:21 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v6 10/15] dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
Date:   Tue, 19 Jan 2021 16:55:41 +0800
Message-ID: <20210119085546.725005-11-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119085546.725005-1-jckuo@nvidia.com>
References: <20210119085546.725005-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611046589; bh=mvN5hTqw5+kX1iYGS+XGaO12JO7Us+IzS/6Gn+rdcC4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Rt6m+P1xTmIYrvOA9BJ2QN/RcGVpWqWSmuT/k/H6BMqJbClEJqSsh3DXRo2HOPXky
         v72okR1s1179iDxUnY6rX905FL79bl0wbzZXLL2o3Sq26zxMD/PW46MQ5dPDmDB4om
         QHmokK0UxyXb54WOyyaili/ksVUQj+XfhUeQy1dyoT+tylQ5YwZ9ioi4mC7o5ObsGX
         EwqIWqIOOq/1tRb/AqKv7RM1IXF/hDx0C02bBPcD6Tn0EWA5siQO668Q+CvOUz1ff4
         eb2pMdvy+DXD0/BQKNAnHXzUEgyYVA90qsyZtjs+KrJscs6AjSOqeN1dVxAmDl1vhu
         ScAEFLiZcxwPQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
PHY driver. It is a phandle and specifier referring to the Tegra210
pmc@7000e400 node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v6:
   no change
v5:
   replace "pmc@7000e400 node" -> with "PMC node"
v4:
   new change to document "nvidia,pmc" prop

 .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-pad=
ctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl=
.txt
index 38c5fa21f435..b62397d2bb0c 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -54,6 +54,7 @@ For Tegra210:
 - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.0=
5 V.
 - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
 - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V=
.
+- nvidia,pmc: phandle and specifier referring to the Tegra210 PMC node.
=20
 For Tegra186:
 - avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI =
PHY
--=20
2.25.1

