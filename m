Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73173DEDEA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 14:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbhHCMfX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 08:35:23 -0400
Received: from mail-co1nam11on2045.outbound.protection.outlook.com ([40.107.220.45]:35424
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234524AbhHCMfW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Aug 2021 08:35:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHiSG8vN4Of75ebBx31/UBkbFGNa1FaeySETPQUu6KuFhLFPQXjqZwHIrFJ2AU0lVveYSTSB4pqKRvOepY352AmhA0fqhudmdDoDouAFvvWOpTdrJh5bYvPqMxWblJwpXFGjcqerM76h7kNwWbKVYy8x0ZSFA1N0ophMqAaA9fP2J1z///IpgucmrgE/uh7E6SAcIyT7KzI1cLEspOwOQ5Y/T7EPVzNstbcwXRINDnSCGjYLb8bVHwalYfy75CQHYtRZ3jV0GT7MODnmJq6/8zFXlKFXo2Cyy1Z7i5VT8gWq0PdVRVgWN43BRlKV8psyJ6TuU2lHmW7H++fQuA1HMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRf/i9q9t9gGNkcqvWq14PZhYMKie6+u0e7pm2Oha90=;
 b=FuLuUSvV+2GMkK1T1Gw6aR1ldu74OjrQVObT3esnNYCB5YKSRfJjjC32t5nrKhJDMoQ5aR6g9kfYJpY1QHBOvkjldXwgQNdTouc+q+CqrIIzZVEjsPks4wEQKftrD+N4loXP5TQSkjTEaaT4ZeUTbceRUhUFgJFONuKGPiB9TN6rdX9QC3NDcMa4zJqCc4IVp5ry/NwrWjAVthBrYOY68JeNAcWs8IA9ZdN7jlPWymyQbPsMKm6v5HYAg4qynpBiFwoE9D5ryDyk5DdcLVYAXy63zcHqDQ7mneDmhX2h23WMCJOj66t2ahCusM8PkYfkT8UwsfpAOwj9odTbzIXQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRf/i9q9t9gGNkcqvWq14PZhYMKie6+u0e7pm2Oha90=;
 b=iKjlR/GtFkD7BuCi0FV+2DNv3wL4QB3ukUYkMZwzEgH9SIV+Z8riQpnMpBNo41T49ICTDNML22IchKLhPa4zCnmbvRqL+p9ZPubSgizbJ3e0SEsCF1SNRFyWNsTI7/BnAlQ5yTNl++RW2FCu45JcXBcbOFOP9APxti2YqMEqHxg=
Received: from BN6PR1701CA0007.namprd17.prod.outlook.com
 (2603:10b6:405:15::17) by CY4PR12MB1766.namprd12.prod.outlook.com
 (2603:10b6:903:122::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 12:35:09 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::27) by BN6PR1701CA0007.outlook.office365.com
 (2603:10b6:405:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Tue, 3 Aug 2021 12:35:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 12:35:08 +0000
Received: from sanjuamdntb2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 3 Aug
 2021 07:35:05 -0500
From:   Sanjay R Mehta <Sanju.Mehta@amd.com>
To:     <mika.westerberg@linux.intel.com>, <andreas.noever@gmail.com>,
        <michael.jamet@intel.com>, <YehezkelShB@gmail.com>
CC:     <Basavaraj.Natikar@amd.com>, <linux-usb@vger.kernel.org>,
        Sanjay R Mehta <sanju.mehta@amd.com>
Subject: [PATCH v2 0/4] Added some bug fixes for USB4
Date:   Tue, 3 Aug 2021 07:34:52 -0500
Message-ID: <1627994096-99972-1-git-send-email-Sanju.Mehta@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a2aeaf3-8375-49c2-3058-08d9567b214a
X-MS-TrafficTypeDiagnostic: CY4PR12MB1766:
X-Microsoft-Antispam-PRVS: <CY4PR12MB176689B3585453AEC9FE6AD6E5F09@CY4PR12MB1766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLAFF191arC2R8vvO2mprs/C07nEbKBeX8JS0t3ud8P28WynAIGbrtCpuWvxNGRrb4N8J3FpvM06ihcaEGrarOwdsuCDX969JfncwLQtDoVh7Fb77CU3Gn7nyIRFY5fHTqUSVByHsErHmf29EqaCZ5cBQpqUoHmQFt1C9C4e6i1e8TlVI0JBAu7wVnXLmbqQ8ashxJvl8iIIFpL3P5VgYcOOOcCisBUAHf2Gs4kk+B4etlme5bHSaotRZ1/kPvOptsiQAwQA34RB0hedRSkMAW3dCqmb3ZSGMKOkAziX68ZW+xPw9pIdoZD3X/JveCiGBFO8EHLxqGcVtvFEj3PbiebNs8r4stCtBC9Z6HhKAXVnO7RRoEiAT6LTGyWA8RwsWaX+Xi0zfivYVAX7nxbpkNIM1YGen8x2lrbQvDRAfoQialuYTog8tnOF2/ESOWdQ6eHqS5KCGr8dnUABXwBm81borba/v5gI4uw1nosm2pF/WVr4qH5SAKazBETRIv9cvBBwb+TL6AjT5hn6qr7kG8GZgGvuKLPwN9thP0cV2HdxjIz7zXH5G2eaG4poKslQxBgv7eGK1exmU6bMO5V+3kQCBX3+QdDtaI9zSnsrjGnkzR8Jals0mnaVfiefQN+IBrRORNSSAkxS1lBBKcNUJCbbgGFRkCaiiBsjvkFKpJkF8prEiDph69EXBHrklKYfuY/UMLXddygtnZRw2KilqbJdANmQy9rzPq0RS0YBjzE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(7696005)(2616005)(4744005)(2906002)(336012)(70586007)(47076005)(316002)(8936002)(86362001)(426003)(70206006)(110136005)(6666004)(81166007)(8676002)(54906003)(16526019)(186003)(36756003)(83380400001)(82310400003)(4326008)(36860700001)(82740400003)(5660300002)(26005)(478600001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 12:35:08.8682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2aeaf3-8375-49c2-3058-08d9567b214a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1766
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sanjay R Mehta <sanju.mehta@amd.com>

This series adds some general USB4 bug fixes as per USB4 Spec.

Sanjay R Mehta (4):
  thunderbolt: Intel controller uses BIT(2) for intr auto
  thunderbolt: Handle ring interrupt by reading intr status
  thunderbolt: Skip port init for control adapter(0)
  thunderbolt: Fix port linking by checking all adapters

 drivers/thunderbolt/nhi.c    | 22 ++++++++++++++++------
 drivers/thunderbolt/quirks.c | 14 ++++++++++++++
 drivers/thunderbolt/switch.c |  4 ++--
 drivers/thunderbolt/tb.h     |  1 +
 4 files changed, 33 insertions(+), 8 deletions(-)

-- 
2.7.4

