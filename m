Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E157141A717
	for <lists+linux-usb@lfdr.de>; Tue, 28 Sep 2021 07:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbhI1F27 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Sep 2021 01:28:59 -0400
Received: from mail-mw2nam10on2058.outbound.protection.outlook.com ([40.107.94.58]:22721
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234177AbhI1F26 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Sep 2021 01:28:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aK7yfanS8KDcweBeTe41vlbdxOeXp4/NHoSsWz6DyvAULfJ6BxbV38/7iniJSJH1ViMGGZVIQHvwWjPtXKPTvbi1X4DWiP8eS3d58lBTGgUljOGhygYDhyRGD7Ct0wfH6OQ5sFmMnwWAh0cEG1NjXz52vyOsKzlh8krLvIFrt62RumJuPRUP56sOzCXJRJa5kwzhE1WV7Xt/KMfvegC3r0PFleFMwnhDtHCDFsPSiIvRRW+EEw5NtoHRNfiL0fncKoKEDjV66ATS58gth/ekhu102xcIuH/QZLDk5ydEBi71m6CstgGC3DbG3oq40l4aj4WCIPTP/Zg2imVkcSS4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Z5LWEU4pK7hY1WHtBCQ9AKRQXRxtb+J111w4IQo2voc=;
 b=jDC5mRe7FRFLziITvHQq/ofRjaTtVByKe7TVveaBmQFw5edWejeFg6CsDoIiSh9OgMbSRDdN0WYiT3MBkRuEFDPsh8MbYS3odrsWL3vnZoz9HWBLvJ7r6Dx63XEOluZuJw/TDHQMg76hKefSpdEC0aaMW3t3jZlQOS7QOn5Ujx2T3JOtgfKvJ05hRTFyzUHswiOF1fHHMIsY5YGsqpXaKGKI6jjcrpQJJ2bWpHc7SkXyUyOxEho+relxDREh3glfUH7LpuEhgYAl9lVhqZietoLVqS7uOK48dJUurZ0Y729AXAukU0BbfR+ut3u/V6o4eNFRxPPYOaCDfULaaa7Cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5LWEU4pK7hY1WHtBCQ9AKRQXRxtb+J111w4IQo2voc=;
 b=XLKnSIMSMVhXY6atDcJ+ZXdJWnSZ/azmnszGXnoDlDythGEy2gvM5tkRFsWJH/WlsRuljvi4BOOGik4P6T8UztBvnwHIpNVjFoyHkCoo68FgiT1JOTOuXV48Ucq9S/DEqiv9oisWvGXNG/KxZkITyhu+BaOA8MTrYYp3O7daQNw=
Received: from BN9PR03CA0135.namprd03.prod.outlook.com (2603:10b6:408:fe::20)
 by MWHPR02MB2221.namprd02.prod.outlook.com (2603:10b6:300:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 05:27:17 +0000
Received: from BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::f7) by BN9PR03CA0135.outlook.office365.com
 (2603:10b6:408:fe::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Tue, 28 Sep 2021 05:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT043.mail.protection.outlook.com (10.13.2.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 05:27:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 27 Sep 2021 22:27:17 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 27 Sep 2021 22:27:17 -0700
Envelope-to: devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
Received: from [10.140.6.39] (port=51432 helo=xhdsgoud40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1mV5e7-0003cY-ET; Mon, 27 Sep 2021 22:27:15 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC:     <git-dev@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH v4 0/2] usb: gadget: Add clock support
Date:   Tue, 28 Sep 2021 10:57:09 +0530
Message-ID: <cover.1632805672.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c0b95ae-a641-4be7-5eb4-08d98240a334
X-MS-TrafficTypeDiagnostic: MWHPR02MB2221:
X-Microsoft-Antispam-PRVS: <MWHPR02MB22213C19A13DFDFCB912E3C5AAA89@MWHPR02MB2221.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dSTBwCYv2M1DwJiuqmL9d/evhWXeMgwuKdFcA/raRsSFy99atsND73geLPO3P/+KbJ8RSbGAamFkTGEKkHJ6n6k2j15wQP5YP0RV9/2J1DhM3XF8gussG+kHYuuE7VdLSPxrCcgiYr2/TOxsIV388q0SQ+PAvHXBBnjWqrbqDezX8YOZ12O00x8d3PbCXU9/CCsqNOFFOL1bcuDAv+LpIM1OQzel3CgBvofIXdrnJzAEjis1gk/zV8YZ+tJNzffMlM4OO28iafDTzGEqWLfq4FwnOwC53MamPZQEo6AW72G2v+5gTn/dHj3pcSsCDT7pwubW0fa2PP+j0XoTjP4+19C5XKLR1eoqgfO8Nxi9b92NA+ksqX7wdb7BZlV1MNE/cYw/CUItOXwCxE1Q2rKG4C0JUBV4lxSymtOrnZTPO7DYSQ/fFdLhUA8l4M95DmR6fkFuxswTUoQ5FJ4LTZJ4xpqb40z+uQosQAhf+J0eCks77Ia0R8k+UOA7FpIBp7ZlAG9yECDUzchcAGLbfxP7jjw1BopHlLDYYIc4ED3N+RXQkSWOV9EKBnI74JLCjLiHwlQyeuSYhJGMX3pdgRCTDU/9ORurzugsSmyCcV6tNccsZr1BHztmNIjALpcnnsU37PBPKVDG1SMT8nCJzro7TefqWP7IzZQdGGtTTp+2Or4cN8/+DCENDh9wb2H5JKoZ2CxVITTCtti9ifIUW/NZDs58gKPijLH5tf+W7HJTKVk=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(107886003)(70206006)(70586007)(356005)(83380400001)(7636003)(110136005)(54906003)(8936002)(9786002)(7696005)(4744005)(36860700001)(186003)(36756003)(6666004)(508600001)(4326008)(426003)(336012)(2906002)(5660300002)(36906005)(44832011)(47076005)(82310400003)(8676002)(450100002)(26005)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 05:27:17.5862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0b95ae-a641-4be7-5eb4-08d98240a334
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2221
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add clock support to udc xilinx.

v2:
Add the clock binding
v3:
Add a warn print
v4:
Update the clock binding

Shubhrajyoti Datta (2):
  dt-binding: usb: xilinx: Add clocking node
  usb: gadget: udc-xilinx: Add clock support

 .../devicetree/bindings/usb/xlnx,usb2.yaml    |  6 +++++
 drivers/usb/gadget/udc/udc-xilinx.c           | 25 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.25.1

