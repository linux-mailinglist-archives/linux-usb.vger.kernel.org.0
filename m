Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CA2414766
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 13:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbhIVLN2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 07:13:28 -0400
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com ([40.107.93.58]:57505
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235429AbhIVLN1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Sep 2021 07:13:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac4rFNM786stQm7Om9L3nmZINcbTpfCnkyiaPywsRln+HE2/5602ppcFMEYi7V/MYYeBd0AlwwknEsjomYCoZxgQDCUUKj65ftYhndwx8G89AcVTqkIR4WA0wHzJB21hw84IVJXMXpX8jTqjbjObZUpWpIpVbrNYSL055VpHR6iBByEhzcMz4wPok93vsAkt0pLrgkKnyLbgt9xLexoDSIUWFarM6aqid2X70W6j16cNxo9sE8u+pOEgqvLPr5n6twZMvyef677ySnZCfq5DQ1JDzeZ7pElJU7yXVgR//KkMqQU+CCcJRfxEmwGg9NXsQnnMXoCQMD3Le7/HixlXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mDNuqEcWclVoT/wvPp9zlw1tVxxGoAWdQiJEVfQ0cxY=;
 b=QpiE2uqlGu3o2fQNJIq5LWYrVcuFqC6erDYY9+XSwah3qjudtLaHQeO+0R/2DwZAtH3SEpWgnvto//cMIaMoAykqgrus1Ayxcd2EwjodL3SVxfNFH1rFkgVDTrnxH++WWwCNOrlscwW3X/D55Tfj5GqxZJ6v1tKGov3XRV1rBmmLoFg60kPP/Vog0TymTowq2JZXfsOw5B8y4fb8/PiTzDI04Jzah9lTDOIzyIDdsmOXTMNradIbF1g7XxEM374dQlv+QrDgTjRXx9nX0YwzyxvVGGsxTUNzxTOrIPh3cxxfTYr2X0M/IAH3DF1Mz3zaqnAw6mNru/xIKX9Ih9sv7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDNuqEcWclVoT/wvPp9zlw1tVxxGoAWdQiJEVfQ0cxY=;
 b=Qc4v2LsWUvdqwQ4sITDxhUQ5JftzaA9pkRkT1vwA9yu3LiC9PMBPxtYVygDZCwTbFfLgU/eTCHRUXkpBQXt8SWUcV0mGx+hDWS69e3ngWFY+YXGtxCRbNBr2diBIuRFRV4vMS0RbRQ49TPegnPFKSfMO0LeEwHDxZI2KFLQyb7E=
Received: from BN9PR03CA0958.namprd03.prod.outlook.com (2603:10b6:408:108::33)
 by PH0PR02MB7464.namprd02.prod.outlook.com (2603:10b6:510:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 11:11:56 +0000
Received: from BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::12) by BN9PR03CA0958.outlook.office365.com
 (2603:10b6:408:108::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Wed, 22 Sep 2021 11:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT028.mail.protection.outlook.com (10.13.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Wed, 22 Sep 2021 11:11:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 22 Sep 2021 04:11:32 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 22 Sep 2021 04:11:32 -0700
Envelope-to: git@xilinx.com,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.39] (port=42856 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mT09z-0005wf-9r; Wed, 22 Sep 2021 04:11:31 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-usb@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <shubhrajyoti.datta@gmail.com>, <git@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v3 0/2] usb: gadget: Add clock support
Date:   Wed, 22 Sep 2021 16:41:24 +0530
Message-ID: <cover.1632307026.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6579f494-e33e-410a-9d22-08d97db9ca01
X-MS-TrafficTypeDiagnostic: PH0PR02MB7464:
X-Microsoft-Antispam-PRVS: <PH0PR02MB746485C3FC57FFD07430E4DFAAA29@PH0PR02MB7464.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8uX8Ggj4SkmeNDwpUN926Cur44HqTp5NZOBF+k/G17KinLOarKbQTr4UUS216ahleBMn4ROF95bqW7pijiFcgKABfGSBArd+fsFYkcpJRDHzvkD4ipgTcyt8NFRTn+1DtupvjxInItO8HTf4rr8yXXfCfMfvhDVTrh1eZYNvfwDMW4DRy2WwfNkMt0LSiwCm+XP+ved6aWJ/in8Va9J3JH8Srj+NZ7voiktVDDnBmbb+lIDwrHGTkIzQHX04a9RGK315lFhaAddJa5MxuDQrFQ3qHDFVMfIrFesvVsEv2hvBjJ/WBd+eBLNJJRUsHaZmYtSTo1gfvT0qvFEg7tdVyTNeJgJrU2V2+0X0Tb7/LQEcamv2+LXAZxgQKlxVKoOKk3ePyw0bJ8TopWV49s2Idb81zvvUpGFSpT1unTbXgknRH75PfW2YJrM1DkSPg3WNGfM+iGzb+gd07jOaAtJP1tIHPUz1kN0plKLe7dZL06S9ySZrzyPOKvNFS006SLwE9a29e16bvaqGuMnRjk4TJlbR9EreTkgw+mAIogT7gwPXk8/mYjvvDObrqM4j+61ZF7JA2ROiuew4U138eAnrsmFTtyGiwmaXmtLj6ydTWq5mclmtVlj4CsUMbsIw3KFoa8XKjnWyw9DXopANFFUGnBMOFg+sR0gDq/t6BwyPH4HraMZ7i73nsiZQlA89h8Uf5ft6JraWy7zra/Sj7fXXh1g4JklLYGUtsNOLf3CbemE=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(4326008)(186003)(4744005)(107886003)(36756003)(26005)(2906002)(82310400003)(356005)(336012)(83380400001)(508600001)(9786002)(70206006)(7696005)(2616005)(426003)(6916009)(47076005)(44832011)(36860700001)(36906005)(70586007)(5660300002)(8676002)(6666004)(54906003)(7636003)(316002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 11:11:55.9691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579f494-e33e-410a-9d22-08d97db9ca01
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7464
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add clock support to udc xilinx.

v2:
Add the clock binding
v3:
Add a warn print

Shubhrajyoti Datta (2):
  dt-binding: usb: xilinx: Add clocking node
  usb: gadget: udc-xilinx: Add clock support

 .../devicetree/bindings/usb/xlnx,usb2.yaml    |  8 ++++++
 drivers/usb/gadget/udc/udc-xilinx.c           | 25 +++++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
2.25.1

