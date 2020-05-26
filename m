Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5729C1C3301
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 08:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgEDGde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 02:33:34 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4148 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgEDGde (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 02:33:34 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eafb7310001>; Sun, 03 May 2020 23:33:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 03 May 2020 23:33:33 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 03 May 2020 23:33:33 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 06:33:33 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 4 May 2020 06:33:33 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eafb73a0003>; Sun, 03 May 2020 23:33:32 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V2 1/3] dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
Date:   Mon, 4 May 2020 12:04:39 +0530
Message-ID: <1588574081-23160-2-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
References: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588574001; bh=Mc5OAfI8+/1794bFfJqfKbAf+lykMUer/jaZaREQkMg=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=dSDzQDmhbZCa3bQ0fz7MWFSocUT2MMbo2dy5ljVWYJYqfboV8CwQfRY8XEyzTKaJu
         i6i6fmzryAUwKnk8NF9vt5Xbpziun0wsHRgHXMTsQjBBfo5qxch4Mf/I2h/TNOgSPR
         vhadA9Ch4f+yz5uvL5AoZXRSqf8WX2yuSiRrFAulheM78viaLao7bGRLmFUnet4yuI
         06hHKhqY68QIWZEkYj0cSSBLC4Q7cixdAUynmmJr+hXd9qSp5aBjAEcCq9c3BEPtpd
         U0iClsD69b0kDeQoFE0wxgbQUzvf/ZJK/jcafq6RrUzwL9j+DcP+/06iFUq8ptdXgn
         7IpRoNHSJgRHw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Extend the Tegra XUSB controller device tree binding with Tegra194
support.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
---
V2:
 - Added Acked-by updates to commit message.
---
 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index b84ed8e..75ea946 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - nvidia,tegra210-xudc # For Tegra210
           - nvidia,tegra186-xudc # For Tegra186
+          - nvidia,tegra194-xudc # For Tegra194
 
   reg:
     minItems: 2
@@ -144,6 +145,7 @@ allOf:
           contains:
             enum:
               - nvidia,tegra186-xudc
+              - nvidia,tegra194-xudc
     then:
       properties:
         reg:
-- 
2.7.4

