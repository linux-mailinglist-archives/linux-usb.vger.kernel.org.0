Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB46534A64
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 08:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343542AbiEZGdi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 02:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiEZGdh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 02:33:37 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2E0BCEB3
        for <linux-usb@vger.kernel.org>; Wed, 25 May 2022 23:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqqucd4aLlMhgWSqafJ+aCdL/JcyfWNXL26kElYLyU4bEwyS5YCUdCJOQnfI8qdLoWznJbLeXLYv2O3hAZrbMPxSe69ctYxZpMo9hQQ07SFH49744jgGkZlRc8LhdcSAKqug6BggZ0Lq15Cg2dbIT5BmblsrkIDvG/3WVivPfjFV5vnt0+X7zkIalW90ybfXo9cBZKqpWMn/p113WsFFWrvPCZ4XCdAuYAQyYraaC9q1qLYgK22l24KPnJ0PZx1NaUvUGoytZ1MZtJCVrZB+rnqv7veNPmK/8vsp6fAzLUrpc/4QnZ9LGgyda8JDxUWjxTCm9Y7uXNs8SwC/PMv/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KefKJjD59IrPK691bjZJ2z0nniLypjoskX4dkbrbaKA=;
 b=Gg2im6jjPXfnLasRW+WEe8NYQ32BzOpWqpL4oQm0dtSznI6RdbOMYriyOOQU4SKPp8kZvWH1WK4Fw992GtlviT/PsTCXQW3Co9UySlcj0UdhRysgIf1aPaHEqMbOe6ONgCv2VITwBUhQgpDQ5gzNoGP+Q4b1TiX4Z1AXT99KLhNqSrkVQDgZu1Ab3aMwuFuLtXd2UVBUppjU4llF5uMiPAubHpXm3KbbkWKhecnaVDaMGUqe89mKVXlpW1Qx5Wvu6nc9eO7zRlPpsytEc3a/jL41Alg/keFYz9loHyiqUt70xchA8ROq4OtyZHp8NRPjmFUbXD0gpn9vkjUpz5VGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KefKJjD59IrPK691bjZJ2z0nniLypjoskX4dkbrbaKA=;
 b=uHlhMdnUX96/euXwJN42eilO9/UhG3C2jZSV8wIwkt/4zqfB3gqbJWOUkdwnd72r/WkpFdNPn9yu2pUAP8yqwPoFPVDY8tATFJPy2jXbQYHgvYoJ5A8dU3GDEoOcEw9JLdlg7hf2gJ65uC5+WiNcLyDCF8hEqmeiXT1UTMtbXJ4=
Received: from MW4PR03CA0032.namprd03.prod.outlook.com (2603:10b6:303:8e::7)
 by CH2PR12MB4007.namprd12.prod.outlook.com (2603:10b6:610:14::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 26 May
 2022 06:33:31 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::a4) by MW4PR03CA0032.outlook.office365.com
 (2603:10b6:303:8e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 06:33:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 06:33:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 26 May
 2022 01:33:28 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <ajayg@nvidia.com>, <linux-usb@vger.kernel.org>
CC:     Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v3 0/2] Updates to ucsi_ccg driver
Date:   Thu, 26 May 2022 12:03:03 +0530
Message-ID: <20220526063305.3144352-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad48c206-bd0b-4c13-2c9c-08da3ee1a6a6
X-MS-TrafficTypeDiagnostic: CH2PR12MB4007:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB400786205FA44C8BCF4774659CD99@CH2PR12MB4007.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Od4+i38SnJJaZ6tFfcWUnl5HYmTl59KatiZGImcqgLqTIIAKjmA/M/ZjY/tkWVuqUiAcNARkPcBs6v0wirFY5aFe5OBYMJBav23x0HKpgP4YpAME3zoSCSwijgnH6GVydvD/nSVgTxZGwvyNLlBhGMU4o2ZBi4aRUotm60BVIJA501UjV/QoBzZ/PNCPeW8DikVqxRIZIwTVOf6McLab5HOph27pYoPC726CEOQl8AQaD4PJMdSb9tliDOcaIOPC4Rmx3i7Z9zcMwWkDDhShJ1ge2a0PNzkbkaww5edQY5oiRM5vcseiEUCVw6qFoMecfYPHkelcc+8XaPvqZPHA6rLIP0OmU9P88K6Vq8PsTDA0llI8p1iHmzfSrg9u78gxYHTSz/0IGk2yIwLpEGo+zonOlacaDDAW5XWLhYa1/sRBmbim4VPbVxwR809sHtQIyVX2Pao9n8+xmedMwF26P3QiON0lPafeP5g1e98jIOruy+jFDC5yroxLcONywRaL8spVuWu/Ipk/GW2LkWmsAoPu+ZMlqN5gfhgCIyXb3IOP1AKHye1Vwc7ovcPyuMb66ZQ+K0VB2TMtGefdLD9F9dVTl6t45+w9W0MCwPxHiFSOCmBtrpmbjo7nc2MZOd+IQ31neGWNWOJIUYsXuiTB9UITnSVvhO+ngh1P8ekNtDMLLfiIvlP8oAvVofNFFffoRAQ9cLSof4tFwsAhumBtdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(40460700003)(4744005)(356005)(47076005)(36756003)(110136005)(316002)(2906002)(5660300002)(8936002)(81166007)(36860700001)(70586007)(26005)(86362001)(70206006)(8676002)(83380400001)(16526019)(186003)(336012)(82310400005)(1076003)(6666004)(2616005)(7696005)(426003)(4326008)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 06:33:30.7537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad48c206-bd0b-4c13-2c9c-08da3ee1a6a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4007
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
- Add interrupt type and polarity check for some AMD ASICs
- Add ACPI ID to enumerate ucsi_ccg client

Sanket Goswami (2):
  ucsi_ccg: Do not hardcode interrupt polarity and type
  ucsi_ccg: ACPI based I2c client enumeration for AMD ASICs

 drivers/usb/typec/ucsi/ucsi_ccg.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.25.1

