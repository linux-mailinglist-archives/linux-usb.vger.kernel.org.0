Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890CB3E2EAE
	for <lists+linux-usb@lfdr.de>; Fri,  6 Aug 2021 18:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239199AbhHFRAG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Aug 2021 13:00:06 -0400
Received: from mail-co1nam11on2075.outbound.protection.outlook.com ([40.107.220.75]:61696
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232307AbhHFRAF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Aug 2021 13:00:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWkA1KZHvAtIj6LjbeniR43NOlJ7NjfyaLPiu33XwrXzU2dQWjSfTOfvsNTb27Ic6kmEuWqT6Hhx+TSN8Ozx7LFezNPiwL2z2F92SzNHkspwigPOrKw8DM5nHfevndEOE3B+Ww7SI79kMBa2P9kUpNKXUFAvDVFP/wSgJ2Sg3efj637ckdkL64X9AyHZo+azlaAsYHrn+4tftuUYyky7kLcgkU5eS1T0dhH+JUNB5x7fyx4rGGpLjt59AncCkvvSjEpHqy3ox1cBAqDateWY/DPcYLVw0X7KkNnYr6Q00Zy+09a/K5x8rpeJ1NC+rd6wJRazz678KCZ/N06xXzK6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXhj7ig5MiwY7YLH/m/ttS38Ma6eMjxIMKmoEdUqXps=;
 b=B7ZcHaHHHQ8S+C4p+oizHCiVXk3YH9janaXA72i/6mvSJJ17bnZlL3snd5yh4ox/O9TIKuoxLo5ouQfHfrcQbNlaxvGuAJvVyuToWCN1LoaYgMO/6om2DdCkTWMZslaosPdIKaKhfekAP3HoXGLMDE4LZ7iiv4Di0wS7Jt508HNptlVX+aTxG4TzXe/CW2rU95nkFnK+D0EUWJMlhvzi+RxYVSfV8MzrXD9/zrk4huqPNXQJn+wtn4UPdP3y85OXRSN2828gTk3qRbWpJhHnUs9gSp0j3h1O6ba3i21ZNm3cv54WSO4Grtv6kNQTPwjHGvluVsae3eL4oh3JHcHWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXhj7ig5MiwY7YLH/m/ttS38Ma6eMjxIMKmoEdUqXps=;
 b=5FGrGwQSm7pBeDWrZ9ZnzRldEwtOS9UDq3pGqnyNeOKFTT7dlrzCRWMHOHZ6cdI9XAuE2zeoGJyb9nOFNHD8jP69BHN/BzyTTVx+jYxj1Biw3vhzjzjfmN2ssTDJTS1z6HwlSjUZHlOsI5XwsstVdhWfmmR7f2QT0TG0NHOVzPA=
Received: from BN6PR22CA0049.namprd22.prod.outlook.com (2603:10b6:404:ca::11)
 by CY4PR1201MB2501.namprd12.prod.outlook.com (2603:10b6:903:d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Fri, 6 Aug
 2021 16:59:47 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:ca:cafe::3c) by BN6PR22CA0049.outlook.office365.com
 (2603:10b6:404:ca::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Fri, 6 Aug 2021 16:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Fri, 6 Aug 2021 16:59:47 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 6 Aug
 2021 11:59:43 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <Nehal-bakulchandra.Shah@amd.com>,
        <Shyam-sundar.S-k@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v3 0/4] Added some bug fixes for USB4
Date:   Fri, 6 Aug 2021 11:59:04 -0500
Message-ID: <1628269148-51355-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95e07ef7-bc1c-4114-1dbe-08d958fb9904
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2501:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB25017ED6D370D0B4461EF43CE5F39@CY4PR1201MB2501.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hGwFyP0zKsf3fFFXbSxOZkHH6ZvREk7Cz52o06EOUYoDVDOIwLQqEJNaalFQ96i4Ng1yZ69NZjoVhYAMJHWOgZys/325pQ/+XhCQGrUfjC8BbU1cDI5IOcVfV2ffxBN8sfRl3rZQvcU5yOcXiu0mCHG3oC+IWx6rEGRxNIeGFeShbmOAuVaEue6bgg4fPyaJvBrOP6rv3yDdDF/9vFnDiOtHee/Njzg94V8I/mZc9MIdafGTE9lVVxqANchTdCnjJtpEE0C6zTEKU5PTmKR3PI/goO21E1aDefa3wdTSOivw2oLdo/grKE0ervZD4yO1lL5/1FdwyG3Ivp1JX5tEcoXWp561MDIS1blq1pFR7pGxfG6zABOc6izCawIuC6kfRnnTNPLWBPXuTwHsVibWma1ELDGb+FwQNkqlG8WxUDOXlGC+pwjUUXXe1T3JCOlP6Se1xX1OZYBrt6oIbnKaKY/l7TjsApno2NYTrZDD334hjnwi6w4kMGNEjJpaPWyx2weI5zBoH/qZeUUl3j/m+rTFeVgmaZ5DCm4eCvDTmYtmL0CVcSvIc2ZtbNv/Auj/co9dP8s1Aia6OQZMKYN45O9OSJB1JkqmHU3qWy22SBJ6CoCu6KMkccQkc8y63prZr+NIVeS+sigK/8Wp99U9Rr3Q7NgAXPCN12+SMIUYc/znzub8UryuTLzT0c0IYhQbCSYFjqORXN+Jht8Ha/Fbyn6dJyCetJEnvzgdxkuVIQk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(86362001)(8936002)(8676002)(2616005)(426003)(82310400003)(16526019)(26005)(186003)(83380400001)(47076005)(36860700001)(316002)(82740400003)(356005)(81166007)(36756003)(2906002)(66574015)(478600001)(70206006)(4744005)(70586007)(5660300002)(7696005)(6666004)(336012)(54906003)(110136005)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 16:59:47.6415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e07ef7-bc1c-4114-1dbe-08d958fb9904
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2501
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

This series adds some general USB4 bug fixes as per USB4 Spec.

v2:
	- Added quirk to handle any vendor specific quirks.
v1: 
	- removed PCI-IDs as AMD USB4 controller exposes USB4 class ID.
	- removed clearing of interrupt using interrupt status clear register.
	- skip port Adapter(0) initialisation for both host router & device router.

Sanjay R Mehta (4):
  thunderbolt: Add quirk to support vendor specific implementation
  thunderbolt: Handle ring interrupt by reading intr status
  thunderbolt: Skip port init for control adapter(0)
  thunderbolt: Fix port linking by checking all adapters

 drivers/thunderbolt/nhi.c    | 32 ++++++++++++++++++++++++++++----
 drivers/thunderbolt/switch.c |  4 ++--
 include/linux/thunderbolt.h  |  1 +
 3 files changed, 31 insertions(+), 6 deletions(-)

-- 
2.7.4

