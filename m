Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418452905C5
	for <lists+linux-usb@lfdr.de>; Fri, 16 Oct 2020 15:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408101AbgJPNIK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Oct 2020 09:08:10 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14300 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408092AbgJPNII (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Oct 2020 09:08:08 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899b2b0000>; Fri, 16 Oct 2020 06:07:55 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:03 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:01 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v4 04/16] phy: tegra: xusb: tegra210: Do not reset UPHY PLL
Date:   Fri, 16 Oct 2020 21:07:14 +0800
Message-ID: <20201016130726.1378666-5-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853675; bh=kYsUJ4FyGjDkoNVvwMVBvmPB4cUQ0GzCPRz7BqifrqE=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Euq5T/ZGdde9ifIjT3vFo6zFwZuEExTmvpPlZu0yH7ycx6KsYKjOxEtsUnQsEVwBK
         0Yp9cKlCwfdU3LTYF70DkV4gkfMzB8FJh1mJYqHa2zfJ1iKKB9TFC3uaVkX9nkcg8e
         Ra9FYyOZiruUXED/egee7S7JqqC0k27zBEtvcl4FwVQoPWtbCDRjs5UR8p5aipCaZT
         kDHvcj9DDVoRY3VlYlEcd2jRBnHfyYl+jZc4xx37ayrybwDmdazsjqLbHgA3neXjTx
         E8slGfMbusjHSfbiZndnlvFZLxa1bT7fsN5FDTmMoqedMlQ0khKpFTgMH8+chJ0R8k
         4te61gpEMMceA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Once UPHY PLL hardware power sequencer is enabled, do not assert
reset to PEX/SATA PLLs, otherwise UPHY PLL operation will be broken.
This commit removes reset_control_assert(pcie->rst) and
reset_control_assert(sata->rst) from PEX/SATA UPHY disable procedure.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v4:
   no change
v3:
   new, was a part of "phy: tegra: xusb: Rearrange UPHY init on Tegra210"

 drivers/phy/tegra/xusb-tegra210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index 4dc9286ec1b8..9bfecdfecf35 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -502,7 +502,6 @@ static void tegra210_pex_uphy_disable(struct tegra_xusb=
_padctl *padctl)
 	if (--pcie->enable > 0)
 		return;
=20
-	reset_control_assert(pcie->rst);
 	clk_disable_unprepare(pcie->pll);
 }
=20
@@ -739,7 +738,6 @@ static void tegra210_sata_uphy_disable(struct tegra_xus=
b_padctl *padctl)
 	if (--sata->enable > 0)
 		return;
=20
-	reset_control_assert(sata->rst);
 	clk_disable_unprepare(sata->pll);
 }
=20
--=20
2.25.1

