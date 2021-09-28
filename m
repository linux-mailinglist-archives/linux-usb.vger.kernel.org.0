Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581DE41A71B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Sep 2021 07:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235343AbhI1F3K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Sep 2021 01:29:10 -0400
Received: from mail-mw2nam12on2055.outbound.protection.outlook.com ([40.107.244.55]:64769
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235320AbhI1F3J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Sep 2021 01:29:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHvZ5nPvaIqYq9rOkvJi0dFC4Lq2CCx6sfJcG5k/jmWp0HSmPElAuXQ3LZfNEKu1zbZMueW2MMr9w7HSmKa9UdbdvtuMyCkKua+h1Q3duxDMWsTYCHEWoz3fbp7LSaLW6d1FhHV12ldDHYNttJQ1gd0sZBAAZLg0Pi0YIA+N137/jWKaLokTyT6+zrYRsYwWzOoIht08v0Ow+tBYUHXGvv9O5i3MJ6tSZkc24JiOoz7rS0FhqmP/g4znx3uNayQYa1s9a9BzBcGVm0oHXN927MTDyLZr0cDUEF8CQEGS4vQIG1kxOifFcJ2qEFkf5uHAH7E5MjU+0w85V9lBjQAdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zgY1FqDmlci6LNNmBbpfop28QsFhRIqMvv5VH3Pn/xM=;
 b=i9W7HZm9FlbUvBGw9cTss0mGZBqgCY1OWuT8TTdl78R6/vaucz0MxoHhmMROnyvQdyebyPOnVveQU6v9Pc9VDq9z6FOLAUiQ5dMs5iagIgNmBbjDH5AyUDZ3Iq0bAH/FAmfFkq0V08gzC77nmDMoRuH4r2mODLaUkcXBjAsgwO3xgOkDu6yZfbCYZaVdgF+w65MebA2595FDpPyKEOFd4DHxkUVJslb0y85eoq0cMHWak1CFWqsQzWJbghBQm43zP6rCVxbVgvMBWb/picl8/AEtjLri/1/WIlB1GIWUH1KsJ5FwVawv4viCgG4KQ+vpq0QGOeVYa2xCP4v2KMS38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgY1FqDmlci6LNNmBbpfop28QsFhRIqMvv5VH3Pn/xM=;
 b=YD8vL+zsm52O0dVzaDn0hfC+iFTlmDMvdBb8AJZxVy6cuRvRaL0TD1dI0AksfvTQbAHAFtlO4v3j83cbafJKAlveowSrQphWTzjYUDpnErqzmuAVwZZnzVIQyEBVGvdI56fYK9PW3y4xmKezmlwLZoYVo+pAyBaieHa+AuGwjl0=
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by SN1PR02MB3759.namprd02.prod.outlook.com (2603:10b6:802:2a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Tue, 28 Sep
 2021 05:27:28 +0000
Received: from BN1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::87) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 28 Sep 2021 05:27:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT038.mail.protection.outlook.com (10.13.2.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 05:27:28 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 27 Sep 2021 22:27:19 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 27 Sep 2021 22:27:19 -0700
Envelope-to: devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
Received: from [10.140.6.39] (port=51432 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mV5e9-0003cY-Li; Mon, 27 Sep 2021 22:27:18 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <git-dev@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v4 1/2] dt-binding: usb: xilinx: Add clocking node
Date:   Tue, 28 Sep 2021 10:57:10 +0530
Message-ID: <30c7d87ab46a0ea2da2dd04d824f162a2e3da4c8.1632805672.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
References: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fd09808-0f20-4063-e34d-08d98240a980
X-MS-TrafficTypeDiagnostic: SN1PR02MB3759:
X-Microsoft-Antispam-PRVS: <SN1PR02MB37596F83247FC9F53FDC8EC2AAA89@SN1PR02MB3759.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1mcj42HpyTuBjfQreukLkgEyiluqvz6DDBokkSI7D++RHISGPwmWPcFzG8SbtYsJ4r8+BS04i+CC3LKeulJppbsMd/Ztq7CBBrhHYAw5GP0LMfsfa6h41+RO/VxEWqUjdjaV1nMmTeWtLx+46Ul+NLh/pLN1TpLhIV/hNzYUyrkZKRXs9F/uZY7LWgM2laTiHYmFdm1wLaTvWs2Aml4sAcvAU2oTEDoQM7Kt1BVEmSNbiClgwwFI8toDWWlSsPpz5yuapRC4U9HpR4L3Om48kK5ZVcrpK5QtV08bYf/ORcIExypEmqb2fe4MUlHQSLcNMiw+2jsWF2rry+Plg976K7N5aMqESoXVrB58zlDWQa8GffF5tOQJoHvMQBqK/1LtodR5BEANoUASdSn9IH4mNF62bxZrg8fC2w347j/J8FhASuR/Vae4VN/wQGJXOUVqkGQqF6GCmgAs1Rq68WkCBg6GbDvmHP2TJNPtEw2k6cCNYfOiw8bbKJxC3Q9PTDXnrOHphs91/Em3dviRBrsKfA6MeIfD1VciwZJQwj1nE2rdLs89qukdi0+8AqjxkTxqq7sGnJPIj/EJeXPC/eByyyxE8q0dxPZinThbVQDtaWDOsquDMxQQ5uCdT9+vmRI8Inkg6R0U4ysc1Uw3ky9JIKouVgK2kjViBfVWWafE81VUSK85UJgosH+hu7EoT/XXemDJZE5TWVoA7AotbrnhhtvwYFS22eqhXQEr0EG04sY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(4326008)(36860700001)(508600001)(107886003)(450100002)(356005)(7636003)(82310400003)(9786002)(26005)(2906002)(7696005)(44832011)(5660300002)(8936002)(8676002)(110136005)(6666004)(316002)(36906005)(83380400001)(70206006)(336012)(70586007)(4744005)(36756003)(47076005)(426003)(2616005)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 05:27:28.1620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd09808-0f20-4063-e34d-08d98240a980
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3759
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a clocking node for xilinx udc.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v3:
update clock description and names

 Documentation/devicetree/bindings/usb/xlnx,usb2.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
index b8acc415eaf1..04c123c7252a 100644
--- a/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/xlnx,usb2.yaml
@@ -24,6 +24,12 @@ properties:
       If present, hardware has dma capability.
     type: boolean
 
+  clocks:
+    minItems: 1
+
+  clock-names:
+    const: s_axi_aclk
+
 required:
   - compatible
   - reg
-- 
2.25.1

