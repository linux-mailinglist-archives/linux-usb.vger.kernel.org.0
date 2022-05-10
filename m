Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19AA1520D34
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 07:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236709AbiEJF3D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 01:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236707AbiEJF3D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 01:29:03 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2065.outbound.protection.outlook.com [40.107.95.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF13524B596
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 22:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJDgIOva5cdhv8YymDBXRGqOwX/eVD3k6ldPSsG8WunLd9PGfD+flzGsxos7l1IGFxX/3FNic4cfHGYrqcpyDjzzwd/o747r/bWvpXer/tL5JV/+OO2vFYjPeZcYVwhGwxEwOLKJjIuA0/6SfMzYfiLSZCVsMfInY4l0Vsjy3VZkSCqUMHaP1cSym2eZZj3C2nPSRT5YNryaOgOk22iLK1zMLcIGTl0YXZocnDDQ8Syy7fC73RWTJP7T+N0xlyNP2j79kNK9K6SBYSOdAJej3k5l2Wlc3PhwS/ne7H6HvO8RGnu5zgr8IB75FKe3ZaJPYnHLXDHRWmDhCyC6FZ1YtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xveFU9fIAaIdIfagNG3QJBWWk8HPNb5wIY4Mxfwm05s=;
 b=TfHV0H/4HEsLbEb4nVMdokU4Z7h6tUNwjzMCP/kNA33OKsz5aSX8mhl7XfruNXCZNSoiqgV+JqB7abzSDhW4ynn4kKsxE4d5g2ed1Cy/OtOOdDtTmBosdyPTx6jQRaGcMgnzwi4T+eeFRBcKWzS9Jz8Kc/BGsinHa4ssv9zyiI1xBNwusg+MrlXFB0d/pFG1qS85CN5fX1y8A/+0cKYzzIUpPN375kkWFFRrFhd4teyoduXrHAcrM7DDh6PPV+sbwIhSyLDFPYAlcYIB6P8TSwTvb7Qnj8tQ1sXtwJbk0JaXmocgq4mgHxm+ttKF29K/iyjqpTOFZWFCI/TI72sV5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xveFU9fIAaIdIfagNG3QJBWWk8HPNb5wIY4Mxfwm05s=;
 b=jVRUpAHcu7zIKcX3o44zocw9B86HTpuTLPuD4LLtrkBJ3GMU9Fbw5aESLyuMAS/OTUgIZ2WcWglSGhXqO5OWUmygxcxwRTujDQfQgCZFS/6WB0nWAM33d6y6TlrgR0t0HaX77XrfIgIDAKS6wAblxR40Tf0a1zfPSBzADQLx6Ss=
Received: from DM6PR21CA0030.namprd21.prod.outlook.com (2603:10b6:5:174::40)
 by DM5PR1201MB0171.namprd12.prod.outlook.com (2603:10b6:4:56::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 05:25:05 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::80) by DM6PR21CA0030.outlook.office365.com
 (2603:10b6:5:174::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Tue, 10 May 2022 05:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 05:25:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 00:25:02 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 0/2] Updates to ucsi_ccg driver
Date:   Tue, 10 May 2022 10:54:35 +0530
Message-ID: <20220510052437.3212186-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5f84a44-6cc4-4fae-62ba-08da3245709b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0171:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0171AD90534D574A849865E49CC99@DM5PR1201MB0171.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8rleMirkCyp5+PVCdsb1B5zGwh3EW3yp4RkmgKmgzK0Nny8xRTsSmSv/YbzabBLoIr+Fh2oxN4zhMOwWBg2SnAtC8AIiaho0ySWIMRkKBUTGrdQSBfgHn06ihB8de7aNJ8tKdRXeH1M2rtCbx+1eFUl3sOd9MvNO12LosGH1dntNFYK5wssinkknpywXPZQAV5z390W2XctJgXJGD15hER+yHHnh2ISjhp8qmGeGMz9MFtTEpRK8udZGDaMiJjTUt0oBMSRp2w1sfGXvCSVOPRswPszG/sASGLInwlEes6Tagv756yRkCywPO82M7xk4iITvpUHQ+zYug9m2rKaj+c+drZRYSDFlQBOFWWpxkYrABoP0xD09h+rNnZ3Bt9+VQHc7PUCVlVRWmoB37tX91brPMg03Wj6m0ZpOFFcFxvCIsgXsZHur45X1Rc5IcMKvEnvRyj/Bcp1exBXuhLgMRcB0sjee+q5Pec70YvhohFuT5wBu3wjm8I86Idal/0r9Tx/t/fS1FbmV5IwhSIt8pp9rgTpKTkJMfL1ZzR/k+c/cz8jxLCRBKxW4Wn+MyCMlaAlYLNWwU3c6M89MFpg/qLLskdtGXI8YHg/WfdY4bWDbjQI+3kQgz/21JzTy7BvSID9DTK9O6ECC16MBWNkIYOLxDMsJQOx9y2yBVJPy76Rl5vys1AiQ94uofGeFp08Y3C4i0zol4yk/sntOjFCRg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8936002)(86362001)(110136005)(36860700001)(7696005)(81166007)(316002)(4744005)(5660300002)(508600001)(36756003)(6666004)(82310400005)(70586007)(336012)(426003)(4326008)(47076005)(70206006)(40460700003)(8676002)(356005)(1076003)(2906002)(186003)(83380400001)(2616005)(16526019)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 05:25:04.7835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f84a44-6cc4-4fae-62ba-08da3245709b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0171
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series includes:
- Add ACPI ID to enumerate ucsi_ccg client
- Add interrupt type and polarity check for some AMD ASICs

Sanket Goswami (2):
  ucsi_ccg: ACPI based I2c client enumeration for AMD ASICs
  ucsi_ccg: Do not hardcode interrupt polarity and type

 drivers/usb/typec/ucsi/ucsi_ccg.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.25.1

