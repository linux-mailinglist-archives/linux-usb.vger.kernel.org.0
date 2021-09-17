Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACAE40F54C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 11:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343982AbhIQJw6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 05:52:58 -0400
Received: from mail-mw2nam12on2041.outbound.protection.outlook.com ([40.107.244.41]:11169
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343958AbhIQJww (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 05:52:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+FU+C5bEpjA+JTARZg45+4dSh/O/ogGZ1zhbdRwoyK6b0dwqseHOOFf96Au8FZ45PbgBeMMmf1A0R73D8Wb0kQQT9L9NBdz3v59eJkSLOGnXOUAGkwbwVmm6yohmw4A8rgZBIXV2jj7MaZw0S1hhmliPsTTbNl5q1PEEkHklWVSlqXv+1bHFk7WIMd0f6+idGoFUpyBrPsOu3ZTqgi5Y36ilD3nkxW/xyUiiqWOAhuObzr41yHrYEOJFcJptBh4B+D9v8Bov/iPPeamBcUjgmS+SeiOrdDt1xhzjS8HK37KOYR8oewjJX8tRCCGJJrJda6EyH/XFiiZO6tu7fBpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=boaX9IyI/HFNaYE6eGlPk0Vj9BdTFpufE3zVgfN2uYE=;
 b=aOOuLq8ZROHQh3lt1ecxqDNjtVEOl0jLhCEKYYLy9ctCd5gIpldvARAUH0ZlIdbTu22wcmHlCV+LS3HLxSlWma4vrkhHUV5OjOUb8hflOvvll37sM6LexuhqQAlYsan157GdJf5YlQEeqN4regCw/+/PUmPFmShU+BAb0gcuHuHCnlFArM0ydAeHpcjQ/hfW8P/Ms1bpOw7O00Jz2OPaB3lFx/+gNaatDzWGEVilcioNMxyF0uLq3cwTYtPGn030aTaAIpl974P2P0uTXImpRXxA0wMF1W2kp4aqZMDxmrlefAdpRTrtDbHjLisQWJpYA7lHQF86mNgglt+BOSg4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boaX9IyI/HFNaYE6eGlPk0Vj9BdTFpufE3zVgfN2uYE=;
 b=GLlia4jOYdywydh9mdusYQ+TOPJoX5/h09B+kJ5XTnK19tZM/RNQTRe6exi2HQ03dwkNd9nm+5w2EAuHj47on/Pe11Msn0CiSUhExp4LS1dN80M0uW9v+WsuDqTAwSUMOWmIlQ98co5PSIbzwjjdycgpU9p85mpu5XNxLeTuKME=
Received: from DM3PR11CA0004.namprd11.prod.outlook.com (2603:10b6:0:54::14) by
 PH0PR02MB7174.namprd02.prod.outlook.com (2603:10b6:510:1f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Fri, 17 Sep 2021 09:51:30 +0000
Received: from DM3NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::66) by DM3PR11CA0004.outlook.office365.com
 (2603:10b6:0:54::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 09:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT059.mail.protection.outlook.com (10.13.4.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 09:51:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 17 Sep 2021 02:51:19 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 17 Sep 2021 02:51:19 -0700
Envelope-to: git@xilinx.com,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=47058 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mRAWc-00069A-Ae; Fri, 17 Sep 2021 02:51:18 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2 2/2] dt-binding: usb: xilinx: Add clocking node
Date:   Fri, 17 Sep 2021 15:20:59 +0530
Message-ID: <01211a76aab345fbecf3bb3f4cde6d0ad79864ab.1631871264.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1631871264.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1631871264.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbd06427-55fe-42f5-6584-08d979c0b952
X-MS-TrafficTypeDiagnostic: PH0PR02MB7174:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7174052EF17645B3F42959D7AADD9@PH0PR02MB7174.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URVCk2Cvo/r7hZJTI8SGhSmoOe/cIYzoxf1th8W72jPhxtE6j7Uqr2KKqkiloLO3xOv+o7Ew2XpGCN/rbIpyBhTa1cvaXH3CPmkxVfkwnNSF79wduEFxtrXgEgIaJlY9C0mdPGgNJ8DLNdFnfgpLvqSGdzik3kfUR7x7ZBhhVYu5YbgifyPBwk8Sf4ThnRoHK0Ei3X9lppefbxF1WXRXBmXn+xq0JVuJKcQgGjU7dDWUWJLtGfujfrtiAm+aJ5R7ssXob7jrFQclhUVXNxWUFuEcqsY7L6IUJZHmrHx0UipmJhrjjwbxl+DESbx+9GCNIuU8Ck3t8nVKU/cZ9Xbv4BFs4hIi9aM41LVjzRt8nvOeUiWrwH51dOU6NzLWBoFJTu8ILkiqEiIVUZ5g24zpm3leC74ZsKKBnjI9d/9sHgld+rsgwM1/7n8a2UtCJEHQG7aX0Szz1Q2HbFK1DSHTwvp+zBFLChG9sKoloiMGpECH36EbyhHc7ZXl9h+VTxNirZsMcAAO6QqYC7RHf6xNLhnhEWBI1LXUE9T2+bVp+WCkCAjtStqZ+wj0ZMGTAvdAwtdyeqY0rpt6n8HRiXn6nrCpXRJc3olD3LjrX0ZtUXBDlNMVNBPfoNyEOWGZLVdMhcFjzgwq/rNcnPGjVYLAq2Q/PSif607BsLlkTZJuvU9OSRqGMJffiAUxID0tErBcMtyqJogzz4OLxTmPFzRfJTy8QFFteNLWmGlLaJrV6QY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(336012)(44832011)(36906005)(7696005)(83380400001)(70586007)(26005)(47076005)(70206006)(7636003)(36860700001)(54906003)(82310400003)(4744005)(6916009)(36756003)(107886003)(9786002)(508600001)(356005)(8936002)(4326008)(6666004)(8676002)(426003)(2616005)(316002)(2906002)(5660300002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 09:51:29.8592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd06427-55fe-42f5-6584-08d979c0b952
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7174
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a clocking node for xilinx udc.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
index b8acc415eaf1..39213806ac79 100644
--- a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
@@ -24,6 +24,14 @@ properties:
       If present, hardware has dma capability.
     type: boolean
 
+  clocks:
+    minItems: 1
+
+  clock-name:
+    const: "s_axi_aclk"
+    description: |
+      Input clock name.
+
 required:
   - compatible
   - reg
-- 
2.17.1

