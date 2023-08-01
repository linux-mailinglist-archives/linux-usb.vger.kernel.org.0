Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F90C76A991
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 08:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbjHAG5Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 02:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjHAG5W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 02:57:22 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF65C1
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 23:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af3jr01Hz1p/giyXAez3GF6icfOuX/w+e06kiZmpMgrE2lLWBJPYKCdLOoI+rjbaAKabVclDbVdOLd2YT0uomnq/t+wiAu/+vFfxzp971CR87VRDjI4c7dmLeobrOuO0kY5JshmbdkRKCmdeaTSv5mmQ8uTwktqnMBmwRC3Efrc7BwLoS30OtNlFVY6GHE8SU3yLPS/irgpiN6lW4L3GrEE7wnteKqNG47sNtIwP5Lo2EZ3wil3Xo9B3iWqE3yIIi3BgT0arcWGeKsc4VR+JFXbkZnv3hljK90H8Nmq7RA/TbRuxjY8uD6vI5SfGS8i68aOcunCRUYmoLEqmnBP1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+W3AgcMNDEdEYK3GjwbSduJM7GcXhRXAcWZTPFL2ck=;
 b=MKYVBuw/cxlWEN+OjDkE5k1OGI7BXoglg8JECNLlYZG0aBNtvEjezmgQkWRrfHAyupBd6OhG5sMYf7wpNi1RILf7WQgHmfMyvnbkgLH3G0d9Oz1uep118AzvHP7dvqU79scOkip1inEIwXlcAVMyxlTDNSjVHcVNd6bxtrZxTHnNRfhO04u7xdE6c/mzyLxbX02TfrpV73L+Mjy8SF7wd3GR3+2Ecyxnfsf4q7/Hb1/LSqiz2KBRpGDCVd84SVnQxqgEmJEVLcy2MxnIheZdwVyVZ+GJa6KC1ILY1NsOYfV+wtQYv+gc1l6VTDbzhiC/wW/xQaGZM557xd5bgZAl7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+W3AgcMNDEdEYK3GjwbSduJM7GcXhRXAcWZTPFL2ck=;
 b=ksCC9Ur4hpPMgCYwGFpT90pBNkrma3UYVwCnAKgynRbhC2k6+prjh5le9MeVDN6Tt9Zv1N5ZE2zGs/izcE1pi0tV4TNDqoc0lyHp9jCBSmllcveuFh4MXnSfrcK8IJ2c8JtNGCplsrlrbmzlicEpekGztoLE3at8dyHlEZ4SV9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB9006.eurprd04.prod.outlook.com (2603:10a6:102:20e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 06:57:18 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::1640:f76f:1d74:82fa]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::1640:f76f:1d74:82fa%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 06:57:18 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: [PATCH v2] usb: typec: tcpm: not sink vbus if operational current is 0mA
Date:   Tue,  1 Aug 2023 15:01:10 +0800
Message-Id: <20230801070110.1653394-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PAXPR04MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: 024348ea-bf47-41c2-d30d-08db925c8bd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OFjBPtrBCVRmqEP+01axOBN6FcYEzqIqG1EM64hr+a4/u56+4gLYRJDDjTXYG+fQ+GXPxcY66nCngfDgaLFoF3378PAK/Ax0WtCXRpuX4UcFFKwHxkRLZSJaU1j82xpkviRFZcDBa8BEFLU4j3pzgcB/IPaPH8But/2sklXL+iz/JMIIyC3c3xXMGukKOJzm9EvEkhmublUJBLn2QweZWooNVClaAA2W4DhG/yOcP2S9gy0YujEwgEaM087hHSxjI16m77+wDKb2l60JQPYOwJTPg09wFnnBkkc0SXWxvxdpyCQJAD/pz6EEidV+KP+nqTPQ/grBc8lzhFsLhfFOsNtEZzuXoFUtPDFc4uxtD4JXa7xzIjq/p7r9PSwm/jWQCjWYYjS/18s+EC17MNJ6OIF50lGNSisdJ8F80h3kVCKLo3Ay4szq5rbwmyP48tNosADv+/5VKZKeaJfAL2p4a5/MB5dakXK0jdyaihiVdx/mYsDGr7Igki0r1Z/GTrwOUfOAqDdrFAgk1gH2jgfw3U2Q8c/W1WVpapFde9Lg1ptrfxP6ZorYZL//1ykS4ffj2XKKJyUy1LYXgF0Q/BMoUVVnwUKf6Ig/qlBxJayFeVRexR3q37hwoscCfd2RXpv7XmJ2Owo+cYdIl//WueZzjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(8676002)(8936002)(36756003)(6486002)(41300700001)(478600001)(52116002)(2616005)(2906002)(6666004)(83380400001)(26005)(186003)(316002)(86362001)(6506007)(1076003)(5660300002)(38100700002)(6512007)(38350700002)(4326008)(66476007)(66556008)(66946007)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XSZuT2MVt66J2SseCx5PNn9KUQMZ31ULmepWsnyCJG0R3KtWst72ooIe8w9r?=
 =?us-ascii?Q?yHPADLr7WnnPKyelW4s7B5W7dlpM0Ijd3vTuUhoI7gJiHItjP40wkieZOPf5?=
 =?us-ascii?Q?kqWxwukZsqA7nGhY37FAWeiJ2Q43MrzIasKtHArWRKDxXmWSxNl095VgWq5b?=
 =?us-ascii?Q?JQ6jiti9KWxpCdrEfLxoud2R/JRfEcxtvac8v2pfxNSmWE3H1nlYnuj05E3n?=
 =?us-ascii?Q?Yd8wvs/CrWfCVBeNym7A9VB/4rrYIKw2xKwJRgwIqxsHbaqpzad2cBy9ocnn?=
 =?us-ascii?Q?GBK3/tbNtTUKglL20PXpvvcCfc6wSxioYMMmEsV57Ma4fb2n3f0Po+6td2UM?=
 =?us-ascii?Q?ht91twJ40juio7b142tlxRt+Dgz4LkjZ4PZSo0ejr6fLaV3tceX5I+jj70fw?=
 =?us-ascii?Q?FG6WF6SrxiEGx8JYJ6GUjDm9EKTUGdvfVBCQSe8oDcTM/QorDx3x6NOt5Glj?=
 =?us-ascii?Q?pRnsdYqKqif9/gYZAwscjD49HzyxQWCPLQyhyJHFGY5+ZHUx6MQcvuSO04Ga?=
 =?us-ascii?Q?VdxJ3h0kJc5Ef8D47Ohk5l3IMFZI5tR/UaV6sDCuFuX365qNycXuO75MOfrA?=
 =?us-ascii?Q?xzWmQc9Z5zx62/GtEnqXYuOdTdNLgkj5m+FcBVpsTiigTX4UE31fz6xBoVNc?=
 =?us-ascii?Q?VwUzanyx6xuFiN9X67nrxWNm+sYGTF0eoqHV95Zt0ra4K13GL/2+9OBhiz8r?=
 =?us-ascii?Q?qP5pmvp8zFWal54++0/+SLQpDhuyPB08+jvxrHBQis2UhN0pV4F2K909f8hb?=
 =?us-ascii?Q?FmR8nX7IAJ/oRhn34sAH8mL+zaOFeyxpguDUBp5NAxe/CHsfDGEfF091N+Ic?=
 =?us-ascii?Q?8LmJBWsdbrD1/pqTvFMbk6UpQUKZIqw5Xd8zQZdt5dCZLIB4LP7xEvkwOtWQ?=
 =?us-ascii?Q?0218y1YiuAo1qjih2wVu5/o92nu5qho1KffvGdzQEoLrIUmvXHR0A342CmZ9?=
 =?us-ascii?Q?otkMMEBp+556IlhduWaKYLOxicijylxxXzkF7Cpxl+TD216Pd3H2AR60MNKm?=
 =?us-ascii?Q?pq7saa1LAHEE8VsglYgiqvYMnJnE9j77tGgK4pZyehw6KbW8ZtpZOYE1KTXQ?=
 =?us-ascii?Q?Qhtz/V/nYqS1w2uEVfhNb1DTsuOcNu5wauznapFcyueAr8XQVsrUqWgvPP9b?=
 =?us-ascii?Q?DBxlVF0pMpxSvOssqXJ3/nPOhc6lTcPSS4QQMNQ4/2w9V6r5dVyiUaMu8aoY?=
 =?us-ascii?Q?lBICPvP1bBV0+f+iJmGNv17hYIABTpSItWzGfARVa1Lwqj9kh+I3yO08wNsu?=
 =?us-ascii?Q?cXC/8QPyy+OhOImidKsuEltRzjyDzds9xQq68efc5NbzGKpyA6/AVWCFmme9?=
 =?us-ascii?Q?rKm1hCPfKt3THug/yPEY0tuxb/Sg7LnJndtYbbIvn+fsZwTPMG34fdCOa8G1?=
 =?us-ascii?Q?FOTEENjgphzcRVtJ5cY143GwNSNde+W3uG6tak3Bvwplp6QaOTCdJ2dhlKPQ?=
 =?us-ascii?Q?YL5taUiMDY6CBGDR99940MPedloUKoQ2tkuLwzNAqdHJSWOCCiXqWJxsz1IE?=
 =?us-ascii?Q?A4k9vpWuCFTpHUKyzwq+QshI/MQjTh6CqCNaHzDjrRhjZoBQ30DYIKFdNj+J?=
 =?us-ascii?Q?0LLHmRMG3H0llDIV0CExigeVUSBlj641Z6iz49pL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024348ea-bf47-41c2-d30d-08db925c8bd5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 06:57:18.5679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICdaIq9X8AjAShccdHlzZ7/yR+kPWYA2LVzzpglVIuzBi08DZugzByd0SOLP9ZH5aBxXaTcr3ObCdMD2BVnOTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9006
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PD3.0 Spec 6.4.1.3.1 said:
For a Sink requiring no power from the Source, the Voltage (B19-10)
shall be set to 5V and the Operational Current Shall be set to 0mA.

Therefore, we can keep sink path closed if the operational current of
the first fixed PDO is 0mA.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
  - also call tcpm_set_charge() when charge is false as suggested from
    Heikki and Guenter.
---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 829d75ebab42..d999e6984fea 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4301,7 +4301,9 @@ static void run_state_machine(struct tcpm_port *port)
 			if (port->slow_charger_loop && (current_lim > PD_P_SNK_STDBY_MW / 5))
 				current_lim = PD_P_SNK_STDBY_MW / 5;
 			tcpm_set_current_limit(port, current_lim, 5000);
-			tcpm_set_charge(port, true);
+			/* Not sink vbus if operational current is 0mA */
+			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
+
 			if (!port->pd_supported)
 				tcpm_set_state(port, SNK_READY, 0);
 			else
@@ -4582,7 +4584,8 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_current_limit(port,
 					       tcpm_get_current_limit(port),
 					       5000);
-			tcpm_set_charge(port, true);
+			/* Not sink vbus if operational current is 0mA */
+			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
 		}
 		if (port->ams == HARD_RESET)
 			tcpm_ams_finish(port);
-- 
2.34.1

