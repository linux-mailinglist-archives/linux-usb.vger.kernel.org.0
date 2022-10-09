Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5178D5F8A12
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiJIIGY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiJIIGW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:22 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130045.outbound.protection.outlook.com [40.107.13.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE20D2E6A1
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLwW9pzRH/qhIgXxsr8o8sH0AVMnJkF8N/JOeSAY5PSLH4ZPozz1AHhjqJBhrCus47J71iiqVQ//KtQja633LcEqzBH7F+K5l7Cw/PxGDfaR+gmAtmFDlYQbRUev54dIpzo3Zp2yldUn3S/HZ4CYgQf/AOZ1ZA4aILK5HOotFmt9rn4C2q8y236BUoVT5ibCOAYNFBGPvr3ZtkVFNADy4NmN8QY+AgZBm494x786Za+8oSvCuLKVU49cc6FlZ+DgzBtvKY8rOeBhvtbW1EYl4b/hXbedKqiE7/XxATtt2qoQuCynzyuLom+JADJO/ALVD/+5jlmGEALKCYSquEL3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFrQss2q6Ylg3ripeMpNIs2wXbBm8SzqRcsWv3+u6O8=;
 b=XBkqWgvD07u86HD9ewuwg1hhauG+YCYOXf9EK6LEOZk5KTyb/4qPgI4b0IbLeaIYMR3k0qMCzzc1wS6hpOymD/tAIj4pyocm/e2KNvL4J5PnZRQBBU4+AyOuhVDiSc0dXYuPGed9Y+NzSyEXBhcAtwVD7IiIsAlcO+ho6ELXVHUeS1SemoTu483Ry5JfBr2hhbhpaBePITMPkOzjkvj45lbcOgGxQ+sO/3cjLPRxYXmQ0r++BdrTHlm+KyqK2hdEe4N4uZdfja7hGHqKg006zfYSkE6bly9dtLnXZuWBOxqTP3Tr/qGLBl/2limcg//IpK9ZwU9+/SLxjmllVK4+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFrQss2q6Ylg3ripeMpNIs2wXbBm8SzqRcsWv3+u6O8=;
 b=q4MZ858F+mpoipHb/OymIURy1EkiWwOZIxuYrNbPonJI3ru1RH6490J2nv7XFcVCKngDFYd6/xy5unwNyzBZDK8yzeylpMd8psC+YQKAIhRPlfRiB7Hsuw50bFq+26xfFOoZJ2aUKpm5hEqNaOzWw72JXOKD/oUGk7D699/rk4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:19 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:19 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 6/8] usb: chipidea: usbmisc: add power lost check for imx6sx
Date:   Mon, 10 Oct 2022 00:08:11 +0800
Message-Id: <20221009160813.776829-7-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009160813.776829-1-xu.yang_2@nxp.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: bf99c205-47c9-4b4b-6dbb-08daa9cd25b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +NJP6AgMHAyGsocph36HdC+i8vXekdzuy3ycpfyc6WjUgse35iJwjHry4fx3y/9fB7VDJmMn4KdRFoVAJ7SRxIqHoUUDzkCO1Yt/TN79vP4EuDAHRk6ofp6Jd1nZN9B54JA9k+h4uMUUrwxiy30CofPz+zb2wc+9fYSJ1XtCkrDkKxIFWOxUzPr8tD6p7/7icD44m3blUeW7wwiOPuVrBJdAUVDGyrxjO2YLUSUlETQZYGDiWLBELGkyJPuxZV2TSJBNcm8xEi4E9dk6JPj+oFEQp53JryQlomhNOoxp9CDuhoA4JtemyCHcg1Ox3BeNM0ejDwLNYGpjmnQ7LPCP7qzS4LWIq8bq91LZLPkxZHuTYWr4huYu6ALOGTypIaVMXq3drQKzGdLO+eBENIs0CGcbKoTRmZ5YZJficqd1Kltzo16zdOzsMYYXKhTSf/V5g+um/nC2jStoV0EEjO9i6JTn7otYNuVNhRF+TC3o2XSacZyCf/ouXHbeloaFy2ZqqYff7aU5ZRfa64BGDgVdtZa0B4nQe/d3P4qk1dGey9azRKwhYiOfs3T8elZPyeQJ4yLvO/7gtKDjETdeSatAXLkvVLspOKTXnvH1+MTX9BdRcQfh22yZx6WCTNSIVh48KoeQk8SXfO4WnM2fp9QfBc4LeJIEZzRyJOfKiIxscq3f7/uCk5w8tIWaUB6ZgGp9pxse6NidCiHewXzmXp35Z+5NoPCCuWYEqluTIsDBBRF9xMUB2dkedMw79CuyEkuk4W3Asbgi6abEG6E3JGroWgiGBom5l5zLmmdfXqKct+o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(6666004)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W48/YmH/flf2hHAVykKLigexQ4/2JG0flxUpu5yFMuiZGrvhgR6tmZ4BWucr?=
 =?us-ascii?Q?XUTa7YqTyflNKmeW8MSktx9hE6thiFdlE/EVnBPvWUlXbaUA52U7d5y0ly/5?=
 =?us-ascii?Q?eS1GuYT3i3YzT7w+qIIUxN68f6TalB++iaAaZtrgopDT/gbl63CdYRIZEha2?=
 =?us-ascii?Q?PTJjVWut4Uqw8cQclImb37cRGHoCaxvC/PnSixPMqLPYQJ0fN2mah9LoujxV?=
 =?us-ascii?Q?Imy4U+mRLFCt+mDjVBiyPZYWZ/rEqx0nSrPqwuQnknzBGLaBHHepGE6HU0R0?=
 =?us-ascii?Q?egp4IqZAfZuUqS4MJmAqUbwCsZg5l1jhWoqh4+RefW7Vl+JaB7GF3FJjuLQW?=
 =?us-ascii?Q?XNPE3z9T4tZNvFXlZixWRutGeFjmMcFQ+HIBlxPv696bCaGO6KqjQh9TB+1k?=
 =?us-ascii?Q?45Y9mmf5E9HsAVMnMhMDtXCGU1cQ1gZwWBkElPj6QbWe5Tk/w5ELyXnLo82L?=
 =?us-ascii?Q?cwjqwdZQMm+uFobPLTOdI8wBva9gza8DkhyTUGJcZ88cbHwi9zv5wSsEgkBf?=
 =?us-ascii?Q?GbGpSXfWAAY6eUAwiFmAVBfngxAWkN2uF4ORYgd7ZqGVs2es4/4B6YRgqz0g?=
 =?us-ascii?Q?N+YC/hLucc49NOeOGS680HVmWoY3DELaRs0z/h29VRsTEkd9Bj17AZnQhmiY?=
 =?us-ascii?Q?PbXKmijd5DDOYo8VJ7PW1S18Lt9olnKgisoqjwRgyEcYXAVjco16IlKqYkjX?=
 =?us-ascii?Q?48eEfVLjjyuAT6edvxH+X+r+y6phWzlDKBjrcPg4KNhh5hvo3maYgWz5Sbrd?=
 =?us-ascii?Q?JrndKfy5xy8swmeV5SegvrQRLiR3iGiUzZ58pgJEQcIZpjHcHlkynulhW+eo?=
 =?us-ascii?Q?khmPhUWX0hCCYFC8XePOj/v5dP9XkOTc8PmZHMc3YqFxJgHzP5a9tGAG8Joj?=
 =?us-ascii?Q?0R+Ycfl5JZcgefv8Svlh7NjRw0T7NEjSoq8hoZFPucNod2eq/tfqj1Rojp1x?=
 =?us-ascii?Q?c/Zs0MhWYCW4ceR5s+t9BYbTneHm7pzW/sGWQnsODJcr1dYJHRGLuKWfxyae?=
 =?us-ascii?Q?uez5z2iMGQGCd97cVzTtVlnl/AexRTs+BuAh+o82X/oZQvj4mR6wDZpclkaU?=
 =?us-ascii?Q?NCcEwTBaEMxhHCjH+GvPMM1tUqUtJak8z0Z4//JV1CRStE+P3SM0HmF9GSsy?=
 =?us-ascii?Q?A4c21IWO9va1zes9mMQNo5xivfPBZhOg4MmXHLAKRrqymxpBmT9MFg3t4mQ7?=
 =?us-ascii?Q?9rqRp9ctywdzcTT0wGjZBpE4huDEJYOSgVHVAzlbYh+8SgeYDqEttLwJLQjv?=
 =?us-ascii?Q?gvzjblJfAGyk80wJBTpGCXVyQmaq83CrdKeIcphLTkEDQWaQYKVmI+wutMXp?=
 =?us-ascii?Q?ZS5lSYnnlhOI2LUnyVNz9Es7aEPg15hpCsF01UyZr4PUpWN0K6fdHRdWFSfd?=
 =?us-ascii?Q?dkAxDUsc4uL8fF4JcjB4L2EeNq3Fll694gStSdEbO2qOANpKO63wL5EY4WTe?=
 =?us-ascii?Q?Q6s/s8gkJ+0Y97LI+5voyLX9fhh2fo9hevLC1HXqh3Xxid3AaCVMr2QKhGOd?=
 =?us-ascii?Q?Sgu8zGCIoCi2u8t1zctvLNbSKATlbIvFmWYR2zeU97GfMtR5RqZXMT6l6iWs?=
 =?us-ascii?Q?jGBEQgLxqR3EIgUVi2oDdQT8q0Mcnw6HwYIRGf/j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf99c205-47c9-4b4b-6dbb-08daa9cd25b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:19.4505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iGPye246NlfMjDTKI1WO1x40HymDsKtum1uA/Cg8M1bK5MiQc4ApBSHfmy8sddvgxRO3OJKGcC2TJDUUzjq8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

imx6sx mega off can shutdown domain power supply if none of peripheral
in this domain is registered as wakeup source, this patch add related
codes to check if power is lost.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/usbmisc_imx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index aa815f6d3fe9..7bfbfc83cfe3 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -939,6 +939,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+	val = readl(usbmisc->base + data->index * 4);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+	/*
+	 * Here use a power on reset value to judge
+	 * if the controller experienced a power lost
+	 */
+	if (val == 0x30001000)
+		return 1;
+	else
+		return 0;
+}
+
 static const struct usbmisc_ops imx25_usbmisc_ops = {
 	.init = usbmisc_imx25_init,
 	.post = usbmisc_imx25_post,
@@ -972,6 +991,7 @@ static const struct usbmisc_ops imx6sx_usbmisc_ops = {
 	.init = usbmisc_imx6sx_init,
 	.hsic_set_connect = usbmisc_imx6_hsic_set_connect,
 	.hsic_set_clk = usbmisc_imx6_hsic_set_clk,
+	.power_lost_check = usbmisc_imx6sx_power_lost_check,
 };
 
 static const struct usbmisc_ops imx7d_usbmisc_ops = {
-- 
2.34.1

