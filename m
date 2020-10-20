Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3D92905E6
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 15:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408151AbgJPNIh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 09:08:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12373 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408110AbgJPNIQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 09:08:16 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899ae50000>; Fri, 16 Oct 2020 06:06:45 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:15 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:13 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v4 09/16] arm64: tegra210: XUSB PADCTL add "nvidia,pmc" prop
Date:   Fri, 16 Oct 2020 21:07:19 +0800
Message-ID: <20201016130726.1378666-10-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853605; bh=k6FNxX1j/CVzXzDQQ53Tp5z4kdBq5VsMAGGNYqFYs3U=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=pRAv2Maz7CMvvL9yk6NZesWKPlUxQ75SbfPfyPSqFeVSdkaILNcEHdhc04+qT3zpR
         0C/SD91Ai2EoYewBFZ2tspp7//uS/RIW8L0JQzSlwYgokk74SxYcgIJk+htBHG404I
         YpaDwDNlaLnU78HdRvnjb2/Us3BNvXE6X06hg/hNTQ1+vokqEJROsOC+Um0M2W9A9i
         cYdvwXmSnZemGCV+M5Qmmn4dZT5BypAW/XdO0/4kVvznmUI8Ki0mywKOnpsUjIaWp0
         28FRH97aYb2furnTwbaFzEhn5mGhjXjGX9ZyMBKow5JGS/0jqRYxizXhdkaW21cDge
         SeU0fM4m+pAaw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PMC driver provides USB sleepwalk registers access to XUSB PADCTL
driver. This commit adds a "nvidia,pmc" property which points to
PMC node to XUSB PADCTL device node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v4:
   no change
v3:
   no change

 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index d47c88950d38..120b92d9b80b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1042,6 +1042,7 @@ padctl: padctl@7009f000 {
 		reg =3D <0x0 0x7009f000 0x0 0x1000>;
 		resets =3D <&tegra_car 142>;
 		reset-names =3D "padctl";
+		nvidia,pmc =3D  <&tegra_pmc>;
=20
 		status =3D "disabled";
=20
--=20
2.25.1

