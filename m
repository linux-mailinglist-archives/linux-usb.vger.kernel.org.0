Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8063F821A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 07:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238952AbhHZFff (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 01:35:35 -0400
Received: from mail-bn8nam12on2083.outbound.protection.outlook.com ([40.107.237.83]:42081
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229760AbhHZFfe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 01:35:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1jPtOzGG1sCDlU55mn+KEEfCyVrLnYiZVhjr0C5zv1/PIS4gLid6kli2cDXtqfGQKwEBI6B4FyzkLV7+AbPAz+/buyjVMVh9chJyAFuebbTWEWrYOa56e6rguCNuVKpdKn7acPvs0DrVFu7ICdoW/+0mqSb0dXm/gAaVwHdv3bY3EJbuX1LcLZp+pWtrgn5P+TVwlVzQLjERbmc2zcB1pI092CwMlmz3mTC7u87g2Fdtvdo30v4OvGhyxC2N618CEJLubcEztV2xWnWHh7mGKlh4IakM0KWyxlUF8KGQvMHW7p3q9/uhQ++8SgKGh/Eou7rdFvNcNKnoi7OJo7DEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfYb2ve4Pk8gRao25tAb2FrILnj1bH81kWiwjdS34W8=;
 b=KpTMHKaoTipsITs/2s2/7RqG83Bgo8+btfaI44o8R2pTW43GMqkEJulwT3dATzIK027qqJmbWCDWkdNRguVYrkgP7iITYiDczSaPbSwq4Qm/+RAxmYJ5uvz0xxpkBh6wzXxxM5yuNYijYfOPum+ig2EewWZ0TkgN2WLL1jXQXIdW6N3SOYabKMbcPhMKlVWGO/2Sgdf5UOtdEe8vjv6jRV6ZPbKotxTXDYmLthlsPZi0olxZNwfrOnk/hAwuPeJ2npgXrlGOEOSVEPNNSYV5uK1Mh2RVMn3UFzS4MbqrXXOg+9KSLZznDQOl94CcTVRyOV/E7ny9ShqJmgGPucYfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfYb2ve4Pk8gRao25tAb2FrILnj1bH81kWiwjdS34W8=;
 b=JNlI/r81rEPtJ3GNzd9jUgpsIBlz487LmsLf+IN8UxmusZP9l28PSNhalkII93/+8871Jonew6adnwEMqHw0H2nCJESkh+sv2dOYodpf1Oa1oIdOFP6z+Aj70aTE6l2gsYPdKFDwLKDYejhARXv8W+QFZd8uc98agyh01zMZAyc=
Received: from BN9PR03CA0746.namprd03.prod.outlook.com (2603:10b6:408:110::31)
 by BYAPR02MB5030.namprd02.prod.outlook.com (2603:10b6:a03:6b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.24; Thu, 26 Aug
 2021 05:34:44 +0000
Received: from BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::eb) by BN9PR03CA0746.outlook.office365.com
 (2603:10b6:408:110::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 05:34:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT064.mail.protection.outlook.com (10.13.2.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 05:34:44 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 25 Aug 2021 22:34:37 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 25 Aug 2021 22:34:37 -0700
Envelope-to: git@xilinx.com,
 devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
Received: from [10.140.6.39] (port=50130 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mJ828-0007Kt-9d; Wed, 25 Aug 2021 22:34:36 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>
CC:     <linux-usb@vger.kernel.org>, <manish.narani@xilinx.com>,
        <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] dt-binding: usb: xilinx: Convert binding to YAML
Date:   Thu, 26 Aug 2021 11:04:33 +0530
Message-ID: <20210826053433.1599019-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94f8d3f1-3fce-40fb-d72b-08d9685335c3
X-MS-TrafficTypeDiagnostic: BYAPR02MB5030:
X-Microsoft-Antispam-PRVS: <BYAPR02MB50308337620D7652F90123ADAAC79@BYAPR02MB5030.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+mr/FSyomj3HeZTiMmatpXOjALchIiWxdhyUT8Vn922aNluoTLlhdyJlY3hrqrvLp3gZ+yQSpGSV75L4jMzqO3agwrtuvGttNgPqX/2dtbiRpj/SV17mtDPpuIRaR3bPfvx6/qjicO92gVqmY7gftczq1+73djIaL2xepYlfvWCOSE+k10jRDO8JVMKquuPxs3wPOBcm07Ji/VVkPKvch5V/PveT3XalxyGUMftF5ZPUjft+lk41d1YongqwrKx1mrCnV8GVr8MwJzR8nfyDsJjQBs86zhZjo3aXperN0BrgXnYnjHstsvEvV0vM9OmYuyoYiPxiNA0mOC2t71HPwrFS6Y1ibjDyNNiOVDZ0fpKOMHnhIhmvLxKermYZmWq4GGknGkIb87srlAueaxXRVfxf7Lgn8PIY9M8jPuG5eUsVaVNLrKrrcyLaQDZGRHnq8cZs7GMO1YraFaaonHozShe0Dr+8k+QzOJDFa8lL8ESbhK4WO69kHhiHZYCRQOvhy/dSkyAPEl6/p9vozHa3yM9/d+GDf2rHoVXxgSzA2QB+l3sbvKHGiSCXzSWjbOPxmRehLWz4cvnnDmVwBqm8RL/azUnM1iUOr9v6mCptesPQHtavwbVIAqYhmqcp4jD4QCfKOGtq9vVTX/MTEQJj+B6qMA2zuRujo+d2OldcuBu81d1ztEnSIGs7lYFDjqZ1VbcihFcFwyjYsRH6azhBOPuG/PduVccFp4jqsV2Rtg4H3YfOaDYDyO3q1LKggA11uSFnOuDU7elCEP5FHg9KNwGnQx5v9SWF9h9aVIM2PVwo7j4SM1GynnOyWOiwyLFepQMAccJ0V7kXCDv2W99RzYdezuJcHjm1jtpYV9U2zQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(36840700001)(46966006)(966005)(316002)(44832011)(9786002)(47076005)(70206006)(2616005)(26005)(82740400003)(1076003)(70586007)(54906003)(36860700001)(2906002)(8936002)(6916009)(7696005)(107886003)(82310400003)(336012)(8676002)(5660300002)(426003)(83380400001)(36906005)(450100002)(4326008)(7636003)(478600001)(36756003)(356005)(6666004)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 05:34:44.1917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f8d3f1-3fce-40fb-d72b-08d9685335c3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5030
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Convert the current udc xilinx binding from text format to YAML
format/DT schema, and delete the legacy text binding file.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 .../devicetree/bindings/usb/udc-xilinx.txt    | 18 --------
 .../devicetree/bindings/usb/xlnx,usb2.yaml    | 41 +++++++++++++++++++
 2 files changed, 41 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/udc-xilinx.txt
 create mode 100644 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml

diff --git a/Documentation/devicetree/bindings/usb/udc-xilinx.txt b/Documentation/devicetree/bindings/usb/udc-xilinx.txt
deleted file mode 100644
index 47b4e397a08d..000000000000
--- a/Documentation/devicetree/bindings/usb/udc-xilinx.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Xilinx USB2 device controller
-
-Required properties:
-- compatible		: Should be "xlnx,usb2-device-4.00.a"
-- reg			: Physical base address and size of the USB2
-			  device registers map.
-- interrupts		: Should contain single irq line of USB2 device
-			  controller
-- xlnx,has-builtin-dma	: if DMA is included
-
-Example:
- 		axi-usb2-device@42e00000 {
-                        compatible = "xlnx,usb2-device-4.00.a";
-                        interrupts = <0x0 0x39 0x1>;
-                        reg = <0x42e00000 0x10000>;
-                        xlnx,has-builtin-dma;
-                };
-
diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
new file mode 100644
index 000000000000..b8acc415eaf1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/xlnx,usb2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx udc controller
+
+maintainers:
+  - Manish Narani <manish.narani@xilinx.com>
+
+properties:
+  compatible:
+    const: xlnx,usb2-device-4.00.a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  xlnx,has-builtin-dma:
+    description:
+      If present, hardware has dma capability.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    axi-usb2-device@42e00000 {
+        compatible = "xlnx,usb2-device-4.00.a";
+        interrupts = <0x0 0x39 0x1>;
+        reg = <0xee000000 0xc00>;
+        xlnx,has-builtin-dma;
+    };
-- 
2.25.1

