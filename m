Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B003A414762
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 13:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbhIVLNN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 07:13:13 -0400
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com ([40.107.244.65]:12354
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235473AbhIVLNL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Sep 2021 07:13:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntdw2er1ZnTKY71CMGjfNqa8YYbCw8zZBro1JveRMSWWQLvlUI7GoilQQhMDvZbg3LUchbPtj9mXfkNYggubbzMY31ON3a9xYXDePCLK94wM2AbLQO1+tPbNaPbz2nHQQTkBplZkOqKpbdu2sdpuLLIvxbOKzjRSajL31Ojs4wNlyJ9AoQp6feN5BhOV6WqJ9FrkT2az7A8tTF9NymmZOZEzyJgayFgbUGpfItPfqS5S0u45oO3umZtmKQPTrAjx6mwJIwQrQkzRnmrsfIuTCoX04TLFI0MGngxDtuO/67muz9vA2C3l1Wh31FMs/rmoW1e5JeaZxZUxgEQNOdtgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5YTwhqxH1kEva5CHBXOcnWMXuE6tLYkTI9EbkfSenrs=;
 b=BLbfIAUbBfiAOwC425DCsgI12DwymemqBrUK0qeuQPph0K5mAfT5o3XsU0gTmdlQ3fASWiAyVX2xJWBrNVSjXJlHYSg44OR86/A2hbWQ1NanTi191q6jF0SPlJX60NFctnI/65NZi9JnAG4TzgSAbhvuiCPqsWGRpDtzRWh0Gect3z8DcI7Qb0jF0+qTFDJTLnvHORSICd4sPM2tmm0T6mKsyI/uqC3wUuMC7H8uI/wj3xkEDVg5VzozNReKKbsr3pXJog/oByIhMBM+NBU1/vtKbpEfihKRVnxMog/G/P4VBnQMgAIpCLr2pk2kPJIMBxGHLoNcg363AI0mglWz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YTwhqxH1kEva5CHBXOcnWMXuE6tLYkTI9EbkfSenrs=;
 b=hTLnbfcExW9QsHbTx7PVZFDigKtWSqiDRROEodb9a3jFA2XopkReKJZod/wJ8AktjaQa5oX1IOt4mQiImnnUVfP0Ps3zwrsDJ/s1APvT3YGr1VzUp/p3JPuC85gv0BJi7+wdw/k63XX0dR5bJzKvVXjV3AaN/RXkjjDgcneAx1M=
Received: from SN4PR0501CA0145.namprd05.prod.outlook.com
 (2603:10b6:803:2c::23) by BN6PR02MB2788.namprd02.prod.outlook.com
 (2603:10b6:404:fe::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Wed, 22 Sep
 2021 11:11:38 +0000
Received: from SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2c:cafe::94) by SN4PR0501CA0145.outlook.office365.com
 (2603:10b6:803:2c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.7 via Frontend
 Transport; Wed, 22 Sep 2021 11:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0032.mail.protection.outlook.com (10.97.5.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 11:11:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 04:11:36 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 04:11:36 -0700
Envelope-to: git@xilinx.com,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=42856 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mT0A1-0005wf-VN; Wed, 22 Sep 2021 04:11:34 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v3 1/2] dt-binding: usb: xilinx: Add clocking node
Date:   Wed, 22 Sep 2021 16:41:25 +0530
Message-ID: <625a34188da7fcc4132b8717afd3d69e6bdc3316.1632307026.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632307026.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1632307026.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a07b3f2f-b1d9-4416-d34a-08d97db9bf92
X-MS-TrafficTypeDiagnostic: BN6PR02MB2788:
X-Microsoft-Antispam-PRVS: <BN6PR02MB2788ECF202EE31E5498D7594AAA29@BN6PR02MB2788.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KTobbiwrK5AXkjNhTo0JeXjLx9E9paLw4KPVN3BO/YUgZnN7D95oxUEtzzQQYlctEQkhJwpTyJ4x/pNW2G8cuZa0JNYn30UsgosreRMIZSl5OYyK7ghIRWIB8IpeiMb8vdNmy68lYpahLXoI/mmLnG5VFKjoVlDBWmf8ElTqsg1D3iTtSVIM//nhD8YZTnp5P2tueanBg91bQ2Kn57+LwcTJ5eemXUv9hPQV/vN+I/UmHnLDsDSa1Ry2veFdPe0Y/f1C88pHBHwuJH0NlDJ2HK8OIuxfnHgM1p2C1NKTvm4wjQOESRFmMtU5H8PfuMhVw10x5zBK2PxUI3j+OZ3KOWviW6qDF86AkT5/njPkuAsUeIxX16fkM9Oa4KypzCNzpBQZc5p5LqWvkR9x6VKLb0HIB68a5iHTSHSAQkEONlfbLEeQPdqNB8Fmhc94r+7/Ub2OpFgcE5Hq4zAPoukb7UVqUnbjb0GB40B+2oq2v6B/dDHIppRqBVR0rqq8I9uSaz3nnMbHYxsZs+iBarr2e/qJ1D7pmW3VLhzi3DrNHG025f+15oU6hFv59LO14Ep4EzK0QVd2g6UXryihta1PhgERdRAcVlKVutjWH+VJZt0cnjDNAct/Gn0yJUqkwNTY/fNh1KOaJGvoaa+4PovRvsB6MwpF1N/tOymO5Z13x2UDaSjDshYXPnWsxDm6pJottLtdOTK5JnCBOJkvLNLcgS5Pk7X+5A2bcVupsgwAEe0=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(508600001)(36756003)(5660300002)(83380400001)(2616005)(7696005)(70586007)(82310400003)(47076005)(6666004)(2906002)(36860700001)(9786002)(107886003)(4326008)(26005)(4744005)(70206006)(336012)(6916009)(7636003)(44832011)(316002)(36906005)(8936002)(8676002)(54906003)(426003)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 11:11:38.5168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a07b3f2f-b1d9-4416-d34a-08d97db9bf92
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2788
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
2.25.1

