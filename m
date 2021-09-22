Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7392C414174
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 08:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhIVGD2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 02:03:28 -0400
Received: from mail-eopbgr130055.outbound.protection.outlook.com ([40.107.13.55]:59297
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231908AbhIVGD2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Sep 2021 02:03:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjlUAHnW3+eI0R3rH+LWAXE0NQEvzwu6tJEu9Y264Vbtyd1RypLi7HfX1QXAg6jkDuFM/lobWKKDiBl6zpczCUV2xIdcS3nhQJd4AbFebJzSAe8JVKlDfSYQDGAphPaiwaqGSTwCN1HjzMLuzooc1J1a6o0oTfshH7Q2NDcYhIiC0n3xSjlC2SfdehlqlSx2j5v6NT3QBej9JinDBdTOyDIJeP9msvkqfTErNQct+Kl4uewuwB034mwAV0x+vViokgnVZxvqSITjTZZf40km5ScqKXyFmzGST+99l/XlvAsmoOR9x+uODWIO9WQKFGdCVwBfoxX45YJMUOWqaWDWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Rl8/dJoJXMMS53uKp/pjitwnG6VDPkTs+9x4hTrRv8U=;
 b=jkiZfvjVgYjNKwdB494ZagTBwuqC7FNyprnLNkTC2fO3EbZT/ssEJnsUYYJKmTUIDbEWLhSX4rgXbdDbot6Z3yz728fi0Ja8UspoHYU5tKU8ej09RyD16ujga33kqsPIusUTSLYhttIhSa/91LLyIwas7MatJBC1dt/6lzeyxxsKYcXtjAf33YcJN3FvI2zVa/EP/QtII+0kR2KPPgslvS5EW/zw5SH4SR4GB4Y4cMUK/4fpeaQ+kJmeDRcx+qfjzV1+veJEzLsrOj1Kvq7dDKDnucyheN1Xq0w1HeObizUd3ZH21xSafqszg3kXF1bX4oVqQuP76FM3Yn+UtjvzHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl8/dJoJXMMS53uKp/pjitwnG6VDPkTs+9x4hTrRv8U=;
 b=Y4gRAUiPbme8xL34tdVQWcYNCAklNy/0qZyyXbzAydFYeTMBqXBeu8gHgcNuTKDq6jjs+1C8XoApSQv0fQcNyoeamKLUM9ITKL8t1yeJKc7yI22JDDb7DWAGCtdLhgLSZ/g64peUoF1sBp3FQomvXAK3VxbLJFlC9pd0RPssgvw=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DBBPR04MB6267.eurprd04.prod.outlook.com (2603:10a6:10:c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 22 Sep
 2021 06:01:56 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2%8]) with mapi id 15.20.4523.018; Wed, 22 Sep 2021
 06:01:56 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpci: Fix spelling mistake "resolbed" -> "resolved"
Date:   Wed, 22 Sep 2021 14:01:52 +0800
Message-Id: <20210922060152.2892027-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To DB8PR04MB6843.eurprd04.prod.outlook.com
 (2603:10a6:10:11b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend Transport; Wed, 22 Sep 2021 06:01:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d335a59e-af2f-4681-fbf8-08d97d8e7b65
X-MS-TrafficTypeDiagnostic: DBBPR04MB6267:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB62673D258BC3A4E36B4781F48CA29@DBBPR04MB6267.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZWG+ZZ+N8YlwjgYlllv7UIHhlGDIHfx7upVH0RNr/h1Xw7RUaPSjHDvoITvqkuJMZ3XyMd5GMYiT2wCDjnVr8lI7g9RJvRM4ZDnlfMafmbch7UJ0pQV37w87CdNZnsfWb0mz1oj3AKJvBKV5NPULN/ZFHd6oDVBEL+/sTqDh9t62NNwlthswslgpOVFbudoSlhHjOI9xvpm5dNrBiUijnbIVVQUms13kT3Zui+3QHNVKD12EUj16L1VnrRes8slemGwZN4LEpuLS3NaXtDqNH0DCA/uQ6OxdcylKQPkNT7IvP5uKtbegN0bBW6jPJPw3XHPGPHEMvwVRUjgjqHB3jQm1SJL2MuTeZl77o5m1RhfCTPKfPVe3vSzTyXdnkq1w6kkpqRltMKdm3F5Qi2UjCeclYuRtwpvsECGO96+NV66pn/I62WiNVFQK6DPQWeTXTlHkHpmdvpAnyrL0pie8/ny6DhOo2NLdplPAsslQ/zxQfnVp4xabk/MIfVucvCMMK/YZsBEDHZyRSkgDwf0B0pMqwhsqse6gfIrOrQP++ZtxFBtUP2gmLDBF8WH+8j6PHMrP7SNvGjAnTg5yvszF5oOsveox9vNxPAoludFJl9Wnn+FhSyaSa0RtW1/pX170feXIzJP/a4VhR9TalmU+Wjrl8IFjF7TvtC1tm9ZKMgAbBEBFAWK47szzYmqz5TirnL+NE8tjzTVg7Hjho3PgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(4326008)(26005)(38350700002)(186003)(2616005)(1076003)(2906002)(8676002)(36756003)(8936002)(956004)(66476007)(66946007)(66556008)(86362001)(5660300002)(508600001)(4744005)(6512007)(6486002)(316002)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DLlyEN8hi4YOEhn7FRDevAcX6S4YRX+N/pLtW9Sxr8AHxll7Sdc3eMg3AVJD?=
 =?us-ascii?Q?3sFfHXw+bOIltlBrYOYwFTFxiFSIWt2eBhXXZA39I1D5qEMr0PHNuLPatPb5?=
 =?us-ascii?Q?VjelNRLJulMvrTfmEr32fn33H1r9D07r7z6kK1f7KWs+CvR8BN2YqyDj1R59?=
 =?us-ascii?Q?sFKk7maCDQyz6N9GqF+LIk0ka6dXu4/EJ60CgYtJ/21vXKhf9RAPPrDdTqHT?=
 =?us-ascii?Q?WPmRR7MX13Dite9UWbWD+QfW6HGweng/l48N1JWovm5Gg9m7OSXaaaj8tCoP?=
 =?us-ascii?Q?mgJWZfRWNx24FUtXBJG6kzkoJ6xv8YX/eR3GDvV9X0M7uwv9/GFENVfFhrrl?=
 =?us-ascii?Q?jOgwAkKKknv3swSiR//gMTpQGrt6Zh49Ml5DeXX4zYty29R27sXmnCcS7aZU?=
 =?us-ascii?Q?tiS+APkLE+TfrTdzfOnHI6iRFzghBp9Ww7c1qfHlSlQpoglYtWKcbsXnauKK?=
 =?us-ascii?Q?vi10ZfWhNYkC4NgNLfsRwP8Kz9oeuUvRrRZpSHopsw4N1tf9r0v1ypbWU0m+?=
 =?us-ascii?Q?NKD7jCQisYwa/4XEs0FSLli03/Ct9UvLywiGIxW/+wsHrFZkrUPg4dorm1wD?=
 =?us-ascii?Q?Jtozpw2ZscltxjrCRkbzgc6IJHWm6bpoNhOjg6jX62g77aTytq1IFDs84C38?=
 =?us-ascii?Q?VjIYQD/YmftLeg2mQ4IEo8uRXghQvKCtpIAp7+Gs8RWWlGU1BmB/UloxRcc3?=
 =?us-ascii?Q?pT5TMFMioxU6lv8uNFTN4opeKIwn4JUeDN0CC+QiaDaEmzDteY2KkAHySOdT?=
 =?us-ascii?Q?7nPKFGkkgLdN7DoNFLFg/s7/75pqSg1yJdk7sg54XocN4NI64mEI0QgX0iCZ?=
 =?us-ascii?Q?5APMDMPk0OA5v3SWiucXBU6pDTes6LKTcNMxo2bFI6hrmSi9e+rgrjL1a9+T?=
 =?us-ascii?Q?e9cmFURZo3MUqttJA+ejiZNW5ZHOx9OWIY1gbBc9QQ4tewnA0ReKk1szqkEQ?=
 =?us-ascii?Q?OZ6Q4iCS4Nhf7fqCj+MFD2vKTqwqChUWlb07rSHn6gik269tRmoBbV5TjBwL?=
 =?us-ascii?Q?jQrWHeKwlyJjjebCh2Z0IJu4E5rZayraH+E9W28IcawtRcPk6/jj0TvY2mkg?=
 =?us-ascii?Q?08r9HqaS1MNSsa51YTw1jAXmFnMOHYI8o7aa71bc666Wa25OILoRxsCOIAQa?=
 =?us-ascii?Q?wc2JGkKCQSb+VP/t6mQh7QlfwwSIU7E/nffBqzKB8jPlQv0/VYYs4AvX+Ddl?=
 =?us-ascii?Q?j5cULDqoFpO2ajz5urbLJac2FjGfr3+2ApRJok0DSc+XFJ6EwvLkB9TWueyt?=
 =?us-ascii?Q?hEFggaoZsIGO34bGKxvBDjvrtRC6pEPZME3yE8qvRav46csfMsHqjpIUeWK/?=
 =?us-ascii?Q?Cci/5iPtvfd21g2+QCYGYWAl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d335a59e-af2f-4681-fbf8-08d97d8e7b65
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 06:01:56.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nWMa+wkTIwz51gjWa1EhT+Xh+maM03HkOvzLIXjf8F8wTZJsPhGnSUboZ7VoFBrFwN8CAz4VaUMoKVkhJO5wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6267
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is a spelling mistake in a comment. Fix it.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 9858716698df..864049631fbe 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -258,7 +258,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 	 * When port has drp toggling enabled, ROLE_CONTROL would only have the initial
 	 * terminations for the toggling and does not indicate the final cc
 	 * terminations when ConnectionResult is 0 i.e. drp toggling stops and
-	 * the connection is resolbed. Infer port role from TCPC_CC_STATUS based on the
+	 * the connection is resolved. Infer port role from TCPC_CC_STATUS based on the
 	 * terminations seen. The port role is then used to set the cc terminations.
 	 */
 	if (reg & TCPC_ROLE_CTRL_DRP) {
-- 
2.25.1

