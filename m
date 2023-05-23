Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D136370E4E0
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 20:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238120AbjEWSok (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 14:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238017AbjEWSoi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 14:44:38 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2044.outbound.protection.outlook.com [40.107.241.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401A3120
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 11:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQUL60Kdgn21QYIrdVttvZxleWYAbWCLfuX4vvr6CKDXb313rkOy5UqLeRikxEI7GhejSJgac9C71rVSnnWEpBluWzkImu9gsnu/KcjU3Q1VZxxzLnpqV97EjNFuzq+b8obuDfCbB9TbFzCFry/eT/10woqo7MxtGM9og1l4dOfKtNbjocbVtv5w4Lf0K3ollNCPQuo4zRM0Etl9DuCUy5tbODfVEnEnVAhTa4904vv5ZufNr5z/M/dW48FDsjoFyOouOo3hbOroOTlLT8aqhXd6cWub7WvV4Pgh1C31/teOIRqLYZEyFs+8Fi32LoR73jjnRAULhTeP6BkTqPNctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCvt9FNb1WW6VPp7xl1A9NRVQQ9ffQeNUk0FowpsytA=;
 b=ofJ3ydoBDzCDCJX+uBEXhcLy/pxkzxr5BOzi66l9vVBdaKcNyW2exvPofx1Vn4VOUjCfjnTQVESGHDrMrltGieB54xMgfUvAiT0c9EIcgGUIOjmYMB/VfeWrfxtZicEhUJY4rnLkcCsu4kd4FIxXUx+ldOlKb/FOSXXI1ZukK36fCiQLSJcqtUxl3XEeERmXo9MKxAsB0uKGsbqRMfCAJMtluJ+dIyGo/RXjH6dCqYHBpmeUuxiACXqCZ0n9y3UimlCkREVZ5vxjKvtkl5Pq9XpQtZYNzf8V4N1up+zDOhxZ1/UZDETckiBPkb3CBsFvu5itQzcM7YtLRVbbALRTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCvt9FNb1WW6VPp7xl1A9NRVQQ9ffQeNUk0FowpsytA=;
 b=jK0gUIukY0r5qFmC08Xyf+D03mfmlemDuaBaZ/sEyWYTWT1z4743rl95DZZj6HD9GH1pLNQ+HIw2ELVhSzKg3+9Pmm0jmKYtfHXw4ZVzU54M9JQwnVLhMCUR9iVDFXhwURsV6hNl3c3Tc9N63+of15dvZXZFVmmwUqccAFgnuqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM8PR04MB7283.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 18:44:29 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 18:44:29 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, Shenwei Wang <shenwei.wang@nxp.com>,
        Frank Li <frank.li@nxp.com>
Subject: [PATCH] usb: cdns3: imx: Rework system PM to avoid duplicated operations
Date:   Tue, 23 May 2023 13:44:12 -0500
Message-Id: <20230523184412.204582-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0165.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::20) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a7444c3-dfd8-4546-cd3c-08db5bbdbdc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QavBjzOuN4hn1QhrQ2/PCGjEjoElOJofgmJG1i4yfwz3tRarn0T9vD1cE3O784HaXYGgQTlth0KgRDxxvyUK0Z+Y6ibe43He7fe9Pvnl2NtFrw00t1L6uvVt0m09koUhl9nqvqrOWlFvTBylCi04ee6TTyODqD4gzHp5WzzNCAXaQN/FHlqqQsuadwCQC2aopNugf3w8jz00VZ7JKvvUR2FTqSaVk74ZdBGL82tr2djewVrYOLD5xOaomokndhueePelk2cSVslxWMfAqHwT53KdCDhf0+/mX/4HcopP9jFPxNP4W2G7J6i5GKkjjd/QQ9HsYk6gBqdRlPcM+JUdTfEQxBy+mw4cp75buc2guolXvxy5ErYAY1/S/ubKmjEfHK8utRezBKhyzCoeDyZvv9df+GuEH5EGE7/QyyU+8d5MGrxw+QjB+gqG2CaesgNl8HvmAFK0q3DAv1OCXdhhsDYT7i2VHqnwZYwokrARbxuiAq//AZf3N+zHsshmV/wujt7wQUJ17g76bLmEN2DDe7mA/BpmMckVxCBiIy4iwInvk+0RFDOkAdl7bh84Gu4fQqmznIe8Wc+hVgdmscudg1SpmBIZoqtR/dweViYSia1+wS4Dl54ZTI466pgI6diX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(186003)(1076003)(6506007)(55236004)(6512007)(26005)(7416002)(44832011)(38100700002)(38350700002)(2616005)(36756003)(83380400001)(2906002)(6486002)(52116002)(41300700001)(316002)(6666004)(110136005)(54906003)(86362001)(478600001)(66476007)(66946007)(66556008)(4326008)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZHR8es4ZrMNbxqkCmWXTJbto0CacI++a23EfCOLuHYS7hAnIIITs0JH1jIJ?=
 =?us-ascii?Q?jZXxDNFT61A7Wu5wLkhNBkU+QRhtC8I+EkxYPSeiBJHzBjm5TlhPajb6x9Jn?=
 =?us-ascii?Q?QuBb6H7aKnmI0rs2pGPrbJV2E1E9Dy2nmGL2wUNT1KV7TguqXadtNcjS3oT+?=
 =?us-ascii?Q?RjLIifklFgwDfiIRHnIdIuUgI8X7dw39D9UyIi4wkRX/gnfSVfvUhZMrWexO?=
 =?us-ascii?Q?cxxQZ6l0oNLLgtxFkgj+DwfYRUA1i+ERQzUvJpT8eWXi+gsERPt03qpktCJh?=
 =?us-ascii?Q?lxMmjzU1Q7Hcjzy4592TesNXTPVBZS4zE6fwG4r2PkJHofd5uVShrEQydi6+?=
 =?us-ascii?Q?v1VU/zRZ6DxmUqDMk8wX0cuUJhskHajRuuUMYJBMrE5XNsIFeAu0rzQv3N+V?=
 =?us-ascii?Q?R/j/QPH7GsaPitlhENUlrzR5tj8/hGIzcLuqxazKOKR9pxJ7+9S72qYf8AQC?=
 =?us-ascii?Q?2+hW9p2bGhunHnWXutuUlvdm+KstD3yKz1zjoZPsgaJrkgjSAfr2+eTfE6h3?=
 =?us-ascii?Q?s7fRFuQ4FtIVLWLnK1+3aJM+vs7cuRWRV4s84/WOVUC4Ioe1By4mK3bGd7+9?=
 =?us-ascii?Q?zXcVTiJTh8PQIubHQ30aQAUCOCnDSMW7otwbZOv4vUCEUdv+yOtE1zxVbYA9?=
 =?us-ascii?Q?t414KlUgqELJtoPfB/hD1YV7vg7OKEb59Rvy/jp+SIU3Xx7ZhkjOLOHgjVUi?=
 =?us-ascii?Q?Kuz+1TOXi83e/I2/IKkyTTvRjZidG15//e8u2LK5elPkHTDWl6zuk7qa5yoE?=
 =?us-ascii?Q?+rD4Qzi5jP6ajq3xDbHtG6eh5JGVPRzxXRNrKPUJn+NuP8q5vuz93gfUS51q?=
 =?us-ascii?Q?VL+edAYxZtgotuRoiuT1btuRvdtfpfn92T4V3jOdv1iC07gH4NPwfMnkt0c8?=
 =?us-ascii?Q?RWlKB8dzch58Fp7eiOvL6CbkEHq6haNlU3w87YScaSZkOalrxPU0HNA7y4rL?=
 =?us-ascii?Q?iAxKaXyXjEZHijdvkDrNbe/cDlSXu2m71g7wI+zz3E0BZvYWSQj8Q9Zr8FjD?=
 =?us-ascii?Q?R2g0h9jHSiRb7WdsXnIjJcMr8OJudr+UYsEMobE+G67m/sl9BYho1/pQPaWE?=
 =?us-ascii?Q?5P0t7ya/L8x/DLYCI/1X+Y0j/FwwkYxGkP0od7CGCEy/JKYoQ0aUdxw8KeeS?=
 =?us-ascii?Q?ciplV7WAh/MAQUMNhjifuw7Qi0ZzjzmhZi16iRTam7cPgyzVkOKe043vvBk4?=
 =?us-ascii?Q?HmRcOd8V9aV1jcbV97yK0L15Suw4xdTBIlDbIwyGCLOxZCTqs6mU8HxKKF8T?=
 =?us-ascii?Q?8pznff8JbPAn8iVY/8EBwDCNiIsE5bqrPtep1MiktkH30in88Ih6+5toN9zJ?=
 =?us-ascii?Q?Xtcv6vivxJMEZKpyDHZd7T6CmbAvH9Zs16QWelAECJH4I/lkauCz5t5jaSnE?=
 =?us-ascii?Q?Ii9taTU0PHKJqsx/XnKFJVeNgFwLWpIu5bSCv55XWsEeZqhQlXEnXUaMTfUR?=
 =?us-ascii?Q?8PG5q9xueioD6G96f7RjZ0JS4IX4GUEX88Ee9ZEOGbwFMUI5kOA/pBSCffIp?=
 =?us-ascii?Q?JWx/oK492U+OleTc1dCpsD8bnLNFOuRDbVn8JmRfPc4zRomaltwR6Whc/Z27?=
 =?us-ascii?Q?eyoRit6F2aiOHLAYueqOk7R6efd2lXhafl1pe8DJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7444c3-dfd8-4546-cd3c-08db5bbdbdc6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 18:44:29.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRh0jAuNjbUFtPoF9suRkkpoz0CaYDtb3xy1pboY/bdUqtoLz9ackNuimQyx2dEks+l03FvjQ5gZcflSzsJhTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current implementation uses the same callbacks for system PM and
runtime PM suspend/resume without any state checking. This can cause the
clocks to be prepared/unprepared twice, leading to kernel warning issues.

This patch resolves the double prepare/unprepare issues by separating the
runtime PM and system PM handling.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
Reviewed-by: Frank Li <frank.li@nxp.com>
---
 drivers/usb/cdns3/cdns3-imx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
index 59860d1753fd..1c6bc6036c15 100644
--- a/drivers/usb/cdns3/cdns3-imx.c
+++ b/drivers/usb/cdns3/cdns3-imx.c
@@ -375,14 +375,22 @@ static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
 		return false;
 }
 
+static int __maybe_unused cdns_imx_system_suspend(struct device *dev)
+{
+	pm_runtime_put_sync(dev);
+	return 0;
+}
+
 static int __maybe_unused cdns_imx_system_resume(struct device *dev)
 {
 	struct cdns_imx *data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = cdns_imx_resume(dev);
-	if (ret)
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "Could not get runtime PM.\n");
 		return ret;
+	}
 
 	if (cdns_imx_is_power_lost(data)) {
 		dev_dbg(dev, "resume from power lost\n");
@@ -405,7 +413,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
 
 static const struct dev_pm_ops cdns_imx_pm_ops = {
 	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_suspend, cdns_imx_system_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_system_suspend, cdns_imx_system_resume)
 };
 
 static const struct of_device_id cdns_imx_of_match[] = {
-- 
2.34.1

