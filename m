Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A15340F54F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 11:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344008AbhIQJxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 05:53:07 -0400
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com ([40.107.93.49]:33632
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1343745AbhIQJxB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 05:53:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhhUIF+UKihGRUaKM0XTZ4irMSCTW7vp9evfQPHQzqeU7Kh6Q3/IL2SBJSz14UIw57H/kF/MaIAgp6GZ5whU6hVapBvN+80xx+KHPrukHxyl2PiAO5ArtJ/1DtpsvRIicWL004s5twT178uPRGyb9Krhx+N0mXOvyTF8+OxWJ2ARKrrLH+0k0wEXeebgFvtb6XvRWOvmz3rGwd2NUfq6Zo/JqgINK7ijs63xlueG/+m4V9s0gq2xrkjSHHYS43iFLzL+QkGZDkGSs8wLJVgVwxgRkASxnMFx5cqI4E0Jju2X5Zo79DYyTreenw61GYPWWYOKDl1dN+/y+QaY2V9PYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Erq1+jVe/NmezfcKE7h1/VSKgVVC8u1HFulo6zdib24=;
 b=YgQY53dtbIFIVg1uYYdAeoWWEkv4ixy1mB8ZtK6nv3m3JyQrUE6E+z+yJbBUg5+eyoCZNySynJUcCBSn+/eC1Cs5F+YCgG8iXKCI2yLoBX3DYklcqQ9OTeUVrZiRZ+nlRbiLusV5tfV8gQICZxuvpxm9qmtUD7dbX4Jk3HkNqxRqfPE5kO9Sz454FfvJLuWmuAEtlqbyXed5hB3mgM8ZiOU0Pi3HBmV4KzxV0MkM8vNVilCezSZDAXtSI/OMsyaycYfKqXCLCx3UBd+4eZj21Q6YtXMu1POv3uooRXC8oPVGzhT9Qo2BoUCMSoY1XMBGznFU7uF6wAqjkBicSuTamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Erq1+jVe/NmezfcKE7h1/VSKgVVC8u1HFulo6zdib24=;
 b=gYxg0IszayNWwJcIzhFUcgPyQeVfYbu094JAaEc5xvPcwlmXlljAE3XFjqYczH2OsCB8bgSJs6MWXeyNSOf6NUFt/G5/VmRO/YY9xvMCZjGGspvJSTQtLOCjX2dMzUJJeeO1RR7PdURkhmetpLL//jK1OxI7+/ZXis1GOKJ4jjY=
Received: from DM6PR04CA0026.namprd04.prod.outlook.com (2603:10b6:5:334::31)
 by BN8PR02MB5777.namprd02.prod.outlook.com (2603:10b6:408:bb::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 09:51:33 +0000
Received: from DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::8b) by DM6PR04CA0026.outlook.office365.com
 (2603:10b6:5:334::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 09:51:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT021.mail.protection.outlook.com (10.13.4.249) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 09:51:33 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 17 Sep 2021 02:51:16 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 17 Sep 2021 02:51:16 -0700
Envelope-to: git@xilinx.com,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=47058 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mRAWW-00069A-P5; Fri, 17 Sep 2021 02:51:13 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v2 0/2] usb: gadget: Add clock support
Date:   Fri, 17 Sep 2021 15:20:57 +0530
Message-ID: <cover.1631871264.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82b22bc7-13e8-4002-9552-08d979c0bb71
X-MS-TrafficTypeDiagnostic: BN8PR02MB5777:
X-Microsoft-Antispam-PRVS: <BN8PR02MB577749B48DF60442BCD39082AADD9@BN8PR02MB5777.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vsfmbyXWLrej3X4k8drEhc+yHnovlLjL1cl06+DFDpKZ0xyv7MBhCZldr1nuUNPAVCK+tzgU/UlC5TcOtQdVbVO2/sQiqPUH+HwdWngXG7IsikG75qcMFos1BnfRBjJg1y3JTPepdKyTcLQ9PlCdmlb17KuQxD4xvoP7ACOgCGGVuECWYPKONSWahcdEZ7nGP/4sRSLUnaytM7Oex7D0ZniPONv31N7h+HqjDPKwDl2GYhYjqPAXioA1GHCv+maagGl4+hznwtTd7qblSAqSooCIFewHOge+iq0Rb+absBSNQL0Mfd3vcUd0R6P4O2N8QzJOjOf4/bEH5TZU1PVyo0xt0NYi99gZSyYBnwoXsrOFx/jqDEPc2jSy3d832okHwbBsptdnh7hnuWGxLA4YcPcGTPBL+THU7ZNfeM9YbJu6Q8QNeGaUws4UsVsIwz5pudf7kkXfxXPa7j5DkwTNk6rVCEjhL3Z/RMnxTN7TIj4OqNzxwYu0qYKp+3tuBlgcCV1BP6oRsobRD7HOfcpgz2HAAYSVjlDdxIOc9DfWbzh8QNtxCICcyfWwWSM6CEFW9xMzxVxu1yLkYhwR/qfEBgYyaS3Wz10VSzxuoGiTLVqAH880NItR9MUz/XUo4IQgKy74jZdhwCb4ZyYTerJ7me4vUPvNFkPW3ooJ0D6t5fK7oAp40s7/BMLkDcthvEhyvkfNaQDo+K4gSKrrSUsExrYOO+eEm/WaD5yEAp7bijQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(4326008)(2906002)(47076005)(36756003)(54906003)(508600001)(70206006)(6916009)(83380400001)(5660300002)(107886003)(7696005)(6666004)(36860700001)(70586007)(356005)(4744005)(2616005)(26005)(8676002)(82310400003)(426003)(186003)(36906005)(336012)(9786002)(8936002)(44832011)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 09:51:33.4201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b22bc7-13e8-4002-9552-08d979c0bb71
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5777
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add clock support to udc xilinx.

v2:
Add the clock binding

Shubhrajyoti Datta (2):
  usb: gadget: udc-xilinx: Add clock support
  dt-binding: usb: xilinx: Add clocking node

 .../devicetree/bindings/usb/xlnx,usb2.yaml    |  8 +++++++
 drivers/usb/gadget/udc/udc-xilinx.c           | 24 +++++++++++++++++++
 2 files changed, 32 insertions(+)

-- 
2.17.1

