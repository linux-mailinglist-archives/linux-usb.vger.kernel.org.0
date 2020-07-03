Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF79213425
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgGCG11 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:27:27 -0400
Received: from mail-eopbgr40054.outbound.protection.outlook.com ([40.107.4.54]:7493
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725764AbgGCG10 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:27:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJa3kPIGdyWDtuLCZ+PYMQoTaGc0kg+ial0E7rF9DLc79731MIcfgN99L79OlCCjAdNXDcJ4MJuvxrAiflhEsw3Kaf3Cqxy6ZYOrFh6ojEAdOjV9rkVxWnux/3GR8/3O5WtC48wR9CPbWOu240HGNrQvbaC8m4/6HvuFL8M+X1dXxcQT2s+BYVJ/aCdDrBORk8FzeR74G1nlKihTdXzi5WsWZ+Y/h15f23YY5DNbzvE1UjwTHwDkenJjGPGlzfCbts4w0dEgme90EhX4Z41qdoe5SxQVPGK0ovw7+vG1UHDlpU0R7BXakor7ThPDS14yaBS7pGwgcX1VezWQVLUSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSvEBE+KCAkB94M/t9GdktCL2AaLc3cRFmrEspB10s=;
 b=m4fC67hJTifXb25O3Mbo6aYh4JL+RSxDmS74QCmNSubCAOlL0FiAGDFjzhebIRNE1mozcI6K9x5sq9dZHPyiASJfe+N+/GdA4imBYYRmAH9xqvbQ9pevkoTsqNsImlvEAUOuvoRjKub1XtM/cHLhg1MMi2cHDCWVrEAo/57bI8Xz+HMEib8q1kJQQ/R1OWsthwFJ8G9WFIEwvdUx9P2F9Juh90xQQ1BZ5YQvteP5kyTBnfjuf9Awfinqj2YmMjHysDvRTVDA1qlF65V/djFUx8JjYN5Tre899MmvjiUDFdA7gB9ttJsxyyy7JtOOE7DHCSW9hXM/tZ6+zPpYnoSp6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSSvEBE+KCAkB94M/t9GdktCL2AaLc3cRFmrEspB10s=;
 b=fwaRDuqZhXQPdgT0LkdPllcT/zq50ssVDyc9Un7oopIYS568KVD+TGbH/K76kMneoIMZPkI2aV3V8DII6gRouFZeeu3v3HGp4KUHzIKFVl9ZNxyFo1n67CJg0rLpg9omTUHkoeDLftnNSOUcf2a4pCPVV4MKcY24/aK/5YgisLQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4166.eurprd04.prod.outlook.com (2603:10a6:209:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 06:27:23 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 06:27:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v4 9/9] usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT
Date:   Fri,  3 Jul 2020 14:26:53 +0800
Message-Id: <20200703062653.29159-10-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703062653.29159-1-peter.chen@nxp.com>
References: <20200703062653.29159-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0107.apcprd03.prod.outlook.com (2603:1096:4:7c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.12 via Frontend Transport; Fri, 3 Jul 2020 06:27:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d7d8ced8-e7a3-4544-c120-08d81f1a2575
X-MS-TrafficTypeDiagnostic: AM6PR04MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB416692EB785F36C9D95BFE828B6A0@AM6PR04MB4166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-Forefront-PRVS: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0KHXi3KZ5pwBRxvCpzFq2buG8mgK4a1InTSjdQjgx7sHnbo745Yoksiex7yqFFiIg/8fj6KpgcNlUxIXbEf2d/+eZ+LwLvShhO3/td6Md03OIvNEl3yE0Y0pVpPZAtuG/HwYc8wcs4y2AaMF0rkOAoVWWntuVt+st1qc5KxxS+VbGAf4vFs9FDd5128MlsJLRwba0zMqRpW1btRdnSjcLGoxuFNDIE+Xa45LLeY653EgLR8dHvVhX9ujvmi9p8s59+slj/G/NwbVUjj6JmBIFGcSy9qR0ZOvPti6wXbN5uBgcTGtJH//sCTnLlyTWJQ0pNH/lp3Pcuwn73VB5Mnvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(52116002)(4744005)(6486002)(1076003)(8676002)(5660300002)(2906002)(8936002)(86362001)(186003)(6506007)(16526019)(44832011)(26005)(36756003)(316002)(478600001)(66476007)(956004)(6666004)(2616005)(66946007)(83380400001)(66556008)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5VbMV/yhR8OETyEwlhSG0vqlRKaBgS6QBWHwaPzuilM3fhWhRjpfWZqUsRifB9L+faFHpICVBoqDkLzgkd9LcOQx0fPDFVBf+ec/ydcR+THaUFd1I+NZdn9oSaK8nUrgLzLCWvaBYUhljFoPZxYSLTI6kqR7rvc7f1nrRra+VzqrfCli9iRciuIxiLxq0IBbouGGvSIzV84CghIA/YHdprtNbfr1+wHH6F52r3ET8qGOg8fTczyAuy/J7bEdED/mwodNlKAPIkm51lVdsAHf/zfu39lb6SluIkelLZ0E3uL0sdcFU2WNZcRBv0z7KxNLWmcJf0msbY7aQTB9KV1EGmdjdkWop5M89sL8eP4QCLgeyF+tQjlyNwX27SHzwoq5xWSZjWBGXtpOZwim6YOfQh52F3PYrUO8CZvjTyG4LXh5LfzldUxpo2lvonAQ2JOUnR+apuCp0NRdegvafMWMeyx6C4VF+5VuWBlS912qe4M=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d8ced8-e7a3-4544-c120-08d81f1a2575
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 06:27:23.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLrOt/s3UjqGOouqzN6sSTEe0PlTEF1sWf31B99V+/bz4AYYO7d6jSIJS5/4kpCUyKKx+gPfqs9S+zxLg4aZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4166
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cdns3 manages PHY by own DRD driver, so skip the management by
HCD core.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 030d6421abd3..1dfbe23fa089 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -24,6 +24,7 @@
 #define LPM_2_STB_SWITCH_EN	(1 << 25)
 
 static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
+	.quirks = XHCI_SKIP_PHY_INIT,
 	.suspend_quirk = xhci_cdns3_suspend_quirk,
 };
 
-- 
2.17.1

