Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0A652EAC0
	for <lists+linux-usb@lfdr.de>; Fri, 20 May 2022 13:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348500AbiETL1l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 May 2022 07:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348492AbiETL1i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 May 2022 07:27:38 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B947269CEF
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 04:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MT7xmZIkGfCcLbTeH9PbQUwWGa8A7bZAuZxHNAmXDbLlyP91bzhyHZvnvM7qMehJCmcBHqALvRr/JIMaJm5P5DCZ8l25pIy3dJHnA/NwARIlaN31+/WJcCOHZWUxuY4l/ztGeHvPlJ6MQVggvsjqrt0Z5axVZr32ekflvh4Tm7/Hr5D6ewnxF4Rd6hnBGOL9sYagrjUL3cdc3x8WL0sjCqWSa4DF+P7DYgICiRTsVJZ+co6tb828wdzByaYvEEEWiPNQA88WdNtQ5dynW0ow84U7bZgTGM++6H2GT1A01FJbit5QxAHX2mXb7Fvr9jrFitwMhjJ0pzoz4MqgOsgrkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGmwawDA96ssIgFHz6YHP87EH3/zgzCiRk4znCaZMNg=;
 b=UDCSHdwnH5t0zA5x74YIsWVCtMbWIOj3NgsyH/dwPJUrTXHBhy2eOKElsEWpa5zXlqbqJzaSiONKLygHau6dCecK0TLaiGEe6iXD2jLZRBNVquju/FQGisUkMx2nm9xk8XYjgNTKlNHi9eWtNzuFMEncMyXHVPZsrBJin1KYsPvFcR2buIuhnTOXpfPEgCaYHw4fQZyWQbzl6V9VX9jIFElC4Mg4cKrKPjgpg+sNJX59w2SG/wKNh0H5ByCceoD7g7WApcumfBvYVW48PXvU8mJRzB6w8uQxAVYNAm2+Wf5IAkgCgLLGAMqJ8dBYEp2RnPwROo4Aqz28/th9RsIPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGmwawDA96ssIgFHz6YHP87EH3/zgzCiRk4znCaZMNg=;
 b=TuztdCdcCxyLoOD1ztMki2pKE1BdhJ4+SYd1LH8SriC7DDxQngeOrfYoj0VUQ4yNimr5YHJ4izXc8aP3fxnzc0jbYURMUtFUl4sRLpQh+54S/otmXFeQ//fOcYNIpUxRyQociPDsNijXKOMqr2ZDneJ1C6ELW8HO2lPzf9ngktA=
Received: from BN6PR14CA0009.namprd14.prod.outlook.com (2603:10b6:404:79::19)
 by BY5PR12MB5525.namprd12.prod.outlook.com (2603:10b6:a03:1df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 11:27:35 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:79:cafe::92) by BN6PR14CA0009.outlook.office365.com
 (2603:10b6:404:79::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Fri, 20 May 2022 11:27:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Fri, 20 May 2022 11:27:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 06:27:32 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v2 0/2] Updates to ucsi_ccg driver
Date:   Fri, 20 May 2022 16:57:02 +0530
Message-ID: <20220520112704.1461022-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2ba4741-17df-4b04-fea0-08da3a53bcbb
X-MS-TrafficTypeDiagnostic: BY5PR12MB5525:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB55257E131EB8FEFD99837B0C9CD39@BY5PR12MB5525.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upS3J0l4PDqkD1FkaN0yTX2K5yShgqTJ76smQClmEpg8jgCdeJ/5UGeS6eDX7suclairAaHpL3WIN1qXeuUNcB3v3hI/s+F6mpWBqOljPjGp2mCYY19vDVys9xw/Z7R/L9oxQi5HT0ZjMdTpCTVIbn6LEG3SFZ4L9rZz6KbtmFwM1widJFVcMKtsxxIDFiO4EVsZ8xdwaVnZHIQxSGzGL+ww7IKL7Q2bMUH2QtEcJOqUTMv6MpZlzggdIO2ESH15dHV4MV4oqInhmjmL1ByPzyie1IMP2GVBOff2/yWTI2b82LgGhjyJ8JovV/hBJ2xv/p8xIFNcWLrqqSVRTZ3dXFrYsOwA7KtLYicCsCCLOdVJNyWEXDtm9QZgLN7uvcvrR5E7xAOqzIRc7tgra4X3MUmb1yV0cqnNMmzYRKs7BdqmjUZ5Zct80+zwdlMXqhz2P5RnqT2GVWh/RoJ5CUIpj023MxNJC9s8CDMuW3lhfiTEZKFndYJwFKGEfQeKfh5PMYJblDf90nDSlM6uv1qYVd/9WJmx6fdzV+9gHtYawR+9DbjuLBapwzI666ycPm7wyIqfKfLYClgSK55XZOOhLptPHoE/QZn3E/ndnR14BaWuUjZ8fOKMyX0Hautluxyu+L9wMmyYtGoq8habpRSB8oGsJNijig6LvvDE5qqVKzWWGYXo2p0YqGFpR7J90TaRzWRaWP6IXgKFjsO915N8ug==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(83380400001)(336012)(186003)(110136005)(16526019)(82310400005)(86362001)(1076003)(8936002)(426003)(2906002)(4744005)(4326008)(70206006)(8676002)(36756003)(70586007)(316002)(5660300002)(6666004)(7696005)(26005)(81166007)(356005)(36860700001)(2616005)(508600001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:27:34.8073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ba4741-17df-4b04-fea0-08da3a53bcbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5525
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series includes:
- Add ACPI ID to enumerate ucsi_ccg client
- Add new routine ccg_request_irq() to handle irq requests

Sanket Goswami (2):
  ucsi_ccg: ACPI based I2c client enumeration for AMD ASICs
  ucsi_ccg: Do not hardcode interrupt polarity and type

 drivers/usb/typec/ucsi/ucsi_ccg.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

-- 
2.25.1

