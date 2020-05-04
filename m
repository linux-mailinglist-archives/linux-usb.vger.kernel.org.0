Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61B21C32FE
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 08:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgEDGdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 02:33:31 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19609 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgEDGdb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 02:33:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eafb6bb0000>; Sun, 03 May 2020 23:31:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 03 May 2020 23:33:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 03 May 2020 23:33:30 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 06:33:30 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 4 May 2020 06:33:30 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eafb7370001>; Sun, 03 May 2020 23:33:29 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V2 0/3] Tegra XUDC support on Tegra194 Soc
Date:   Mon, 4 May 2020 12:04:38 +0530
Message-ID: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588573883; bh=8dKivDV9UwxpcqmL8X5yY6Atv8WXJsbXieJcgZNM0Js=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=BLuwhdsmZxR42+JVfBGYgTJzJfVqWrxJRyex79Rep4LGDHf6Tg7e6neBqPW5fSqjG
         FmLQRXQRvf5Zkbp7s4/VF86tzCh0NqRwcFhikk0t0FypUycnm6dcZX7sV+D7DurFs4
         P1ND9+ZgZopHwewv1MEMh5jrG8QCtp8nv2+Qd7Et1TPx1vno/bsXQ8+lKKD9wV89dt
         /uD2L8k0BPSZAp2ls5qQm7nwaoYtFUHyVChxXgcpc2QJqINbEffoHg2wD55RFI00oj
         h/GSdnLCcS/5D2qVv2mGDF81xqLeWcKNd9X62v+78syB9kty1kIe0kdG0X5MoKheKA
         q9ocDL19n8Uew==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds support for XUSB Device Mode support on Tegra194 SoCs.

This patchset is composed with:
 - dt bindings of XUDC driver.
 - USB driver changes to tegra-xudc to add support on Tegra194 Soc.

V2:
 - Added ACKed-by details.
 - Updated commit message for port speed quirk.
 - Fixed checkpatch errors.
 
Nagarjuna Kristam (3):
  dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
  usb: gadget: tegra-xudc: Add Tegra194 support
  usb: gadget: tegra-xudc: add port_speed_quirk

 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |   2 +
 drivers/usb/gadget/udc/tegra-xudc.c                | 123 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

-- 
2.7.4

