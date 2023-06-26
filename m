Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656D073DB61
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jun 2023 11:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjFZJ2R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 05:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjFZJ1e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 05:27:34 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47431BD2;
        Mon, 26 Jun 2023 02:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Glv525ezYAPf+5XjpT05rxSKf1aQUmP7aWterE3sOpjkd5XruSGPORg5pz5A7LqeQR1MJALhnuDHchOqPHSnVi1KvkjXh8ZYCQxH1ATakaS2dtLYYcsyDp48lxzyK09bdM0fY+wWcvREXV1Fo5u+3ZebZvQiI14mX84wkgjK0XU0c0tig1hBLIqocMHlztraAJ3GjZJz6NS/cxqStN1/rrytbRPpKxN3wdLupUf0zXabGtmkMEgwt4Rw5rxPEn9rC37H8dZNt6X9Sj0B+2FME263X8BJL4IIxs99S6zTIKfarOULTk1HxxzurveeMxQ2NsIg/X1IOZ0ZaKZatUtAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72dMijjcpkoe/7UWH6FMl3zE66rWMX2rbGyx3gi3b8w=;
 b=WFreBV5qQTbF9PfFPHfXe2PSn6evgO4vms6uCXCxpu1eSEJbyKv5QGS3/6q0aiuA1DZPgEdZUnerzdGiJ2rIy5Dr9u8Cu5VU0Pazl1q6mhPSglF+t5YzZReTnGqwPMk8TdxpMq1hqyGdqMA6mQVmmpA51fNjJppoHszpYMZIWGXEn/NTGO8vSy5Q+/8fyz7R4xSCbyKgXmmivadIZzxgyy2u5WRNdqsaMBiUCkHL3yveBNu3ELO28muI/nviNANxas3EUACv8TTO2cBW5Pho9CGv/DwjMJvh1IaEsXLg9ea5PLL6BhXqn9Ray1tzJVwlRvN9LO3fnSSBe0HoXtjJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72dMijjcpkoe/7UWH6FMl3zE66rWMX2rbGyx3gi3b8w=;
 b=RB9pfjoU1XxF4ptivED7slNk5UvdgSKi9uFDv4vPeoRe3nursGN3bGtK/CbM+19XUFkP7tyJhhWa93KLrG8q2cBxdTL6lm5+xB3SiDzn50yJUBp2p6QC5WK3sLeGNA2MvpL3iFrWVWbKxpjctmwp3rcwPbLi/T6RLglZWj4EOYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 09:26:24 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 09:26:24 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 1/3] usb: chipidea: imx: improve logic if samsung,picophy-* parameter is 0
Date:   Mon, 26 Jun 2023 17:29:50 +0800
Message-Id: <20230626092952.1115834-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: be628ff7-ba3d-44e4-215b-08db7627693d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2da2PTa3WYyVx+2PvSTCWAJDXUy9ViDTaufDSYVR/lOoT7LvZK19zo/7eLkLfCyo2rzw/mvKYDAgww2HNSvG4sli6fmY9GjM0Vu4D7XX/iIPbx1PPUW183XTVMbQe2KafZkilav99rnugkj4QyH8th6tI2POEHjQb0Dw7dQLRMKQaWVanRdoRq5ldbElNwTWoC+qDma6pMtPJkLlgLhHXxXJ9p2ip+zH4XZkTKXouvVYoD86CUxPplyLR2MXIAP6canYfDCKy+g4o6NqOiuJmbHzIuDgUQ/dhMp4t4jAp2OfF8W/8LjAelPeTBk+ew2CvQb6vPnQ7AN0XJfDgww0E9tAJxSmZXEmB113m4DpISJL0SjkfCzycecmZ54Lzm3XejrGaJA+c6IIvQLMUTIyLcBh4VUyMeJ1/wtbNMSXL7RU7SBqY2xpqrQMyRtQdIfIZQ+zZs93Cnpmza4xxyrHxvV6zIdh+wVzrSWTNy8IvOG+x4fooN08xdSLCtl0EGngM0OIfoyxUj8/4yGSO/x3H46YzERQ20e3BXKdHXEtMm+6G+OjBkBhoNhNsg8NHMqjdRZRVE1eTbP/oUoXjb7NxR5XUetEoHaD3CsWrhRNuBGN68uqgeakCcm0X0b96Byx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(26005)(478600001)(6666004)(52116002)(83380400001)(2616005)(6512007)(1076003)(6506007)(186003)(2906002)(6486002)(5660300002)(36756003)(38350700002)(38100700002)(316002)(66946007)(8936002)(8676002)(41300700001)(86362001)(4326008)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b2pFQUh+ze3FO8DIURh4ITbNlVyKFVzZWqNRPG9pFr6mGhtVHLvdNYiT6pGz?=
 =?us-ascii?Q?N/rnc4dHSY4TtYEsnjgnXb5rQkC2Q968fJkMtZv3bGvKQm6A3b9Rnlqin74h?=
 =?us-ascii?Q?c7iy30aZL3KcL/Qii5UlJiqL9Gn0zSXcmsl1Jz0GFN5SwuqOh7FTKpccNKmx?=
 =?us-ascii?Q?C/BBIfFOR7mlVpr9iqX6AwGrDF1KpBTTriZY8e7b/HbnAE0OjKS9JyBiR/vv?=
 =?us-ascii?Q?34NFOvMzyfaPnVWzBrJjWIizNzIGib045cI89RNl1UGuMjWeXlT7+zV6OZch?=
 =?us-ascii?Q?LO2Vo/NToMQ19fKJGOblUAMQ/kD2FRvcleWjytG/IQ2gGgquZ2AEq775lp4Q?=
 =?us-ascii?Q?Hn6LYe2BzaD3qmprImMnLaMLU+R2XyqmLLA+1k85bo/GMByfha4pgRysIBLN?=
 =?us-ascii?Q?Wc+iJF5H9eMJTgtwxsztW/6pn5TTCCz//fNTnSKchtEwF//811M1z0avnnAQ?=
 =?us-ascii?Q?BRIxzTd4m8GnbmwpfWCjwV1c8i2O1LKL0YkyCfAMLgOpuql9iO0nSV/FEh7F?=
 =?us-ascii?Q?6wkEzHYc/d6j86cuZV35nB1VjOMqUo506RUGoeGScDCopLJg8gNeDEu0kiw6?=
 =?us-ascii?Q?wQZ23/1Ovg0U0oUhdj0frh8ytvGaXfl/3NWrvuTjqzLZdKOBYfoOHAhdUigY?=
 =?us-ascii?Q?aCk5yGKWeoPhid/dkYSnxRYFuqCrcjpLMH/z6lav7Ch+wGh1024InG8OLzQD?=
 =?us-ascii?Q?uxhFIiNLLNJwhkA5zWOXbZUbzJYpEHS0F/YvqKP5KYHTfMM7iq0We/k4iX5z?=
 =?us-ascii?Q?ERJanQMzuzkYI9DKJlSDwTzS1tc1f0ogCN17Mb71TSVXLqBuYXjh2ZTQaowy?=
 =?us-ascii?Q?Eu+joLWiSgIRZEfm+6kIw6iDWIuWNi2cl1yfyeZv477192gKnqf/qUIYc001?=
 =?us-ascii?Q?hXHjdO54GWUyqNqUdmxMRqTMwU4xETaSCkEepMdbWgqOmXovJqz0bUPJiMoy?=
 =?us-ascii?Q?srnmIsFVnFNkFvC9Rij97Kg+gwD8JixMJb+GIU5nuygtHVQ4KLfmv2MO3KIQ?=
 =?us-ascii?Q?42qVwpFhWhBli6uKQgBS7CBGlLXKq+wvTb4h5XR2cpuOfMFN21noc4zC61Uc?=
 =?us-ascii?Q?0UdQJC+zeAKl2WKiO+vq62k5ayQ1oebGTG0F2RLQtZd8m/wY5Lpaka1sWaM0?=
 =?us-ascii?Q?oox1Ap2xf+U/d9C+4r9XYso14oK61+YVP3KZo0YM5zLK7WJ5MdtTrjScZwJU?=
 =?us-ascii?Q?3+QhxlP99b5VrLyy7o7J/f2Em0jrI4XPq3O9JKqpD76+xmlNkWVK4vhhXyNL?=
 =?us-ascii?Q?PAvmJq8wdjc3E3682+2Yr63CnLAETfPcSRNZ9U0DOVUYVuqlXELWRySCIPwx?=
 =?us-ascii?Q?tAWSU8AVULpeCcd0zZR92XncRED7DKylDXLjN5Vzj9zESLCgzj4uBgaRT0BH?=
 =?us-ascii?Q?fwXythB8uz/x+Opp+28z0GEPHL+DoyfkWxyaLgr4X4RYItLZp2rW6qm0euxT?=
 =?us-ascii?Q?Gv+5s5QY4eLO3KMMd3PLwNKDDof2necvx1r91hFqT+ZlBkmYsVN19gSOVVZd?=
 =?us-ascii?Q?xjEWrFucinuS3GU2EcbhQXyzTrbY95BtkSV28TRT9OIKgWNlaKcyDRp9Ebdi?=
 =?us-ascii?Q?8NjOBj7GgywjRmYVVnz6tLIul1snT9ucjbIUW5uK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be628ff7-ba3d-44e4-215b-08db7627693d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 09:26:24.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kTYlX9ewciMu43K4n/VZRUgjxfsUnAhaKZqxICduDiy8Zy21hBEhTsYtaYGV5pLqH9yDXrkh4vRP6z2p+ZjZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In current driver, the value of tuning parameter will not take effect
if samsung,picophy-* is assigned as 0. Because 0 is also a valid value
acccording to the description of USB_PHY_CFG1 register, this will improve
the logic to let it work.

Fixes: 58a3cefb3840 ("usb: chipidea: imx: add two samsung picophy parameters tuning implementation")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 10 ++++++----
 drivers/usb/chipidea/usbmisc_imx.c |  6 ++++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 336ef6dd8e7d..873539f9a2c0 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -175,10 +175,12 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI)
 		data->ulpi = 1;
 
-	of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
-			&data->emp_curr_control);
-	of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
-			&data->dc_vol_level_adjust);
+	if (of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
+			&data->emp_curr_control))
+		data->emp_curr_control = -1;
+	if (of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
+			&data->dc_vol_level_adjust))
+		data->dc_vol_level_adjust = -1;
 
 	return data;
 }
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 9ee9621e2ccc..1c7932f22218 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -659,13 +659,15 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 			usbmisc->base + MX7D_USBNC_USB_CTRL2);
 		/* PHY tuning for signal quality */
 		reg = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
-		if (data->emp_curr_control && data->emp_curr_control <=
+		if (data->emp_curr_control >= 0 &&
+			data->emp_curr_control <=
 			(TXPREEMPAMPTUNE0_MASK >> TXPREEMPAMPTUNE0_BIT)) {
 			reg &= ~TXPREEMPAMPTUNE0_MASK;
 			reg |= (data->emp_curr_control << TXPREEMPAMPTUNE0_BIT);
 		}
 
-		if (data->dc_vol_level_adjust && data->dc_vol_level_adjust <=
+		if (data->dc_vol_level_adjust >= 0 &&
+			data->dc_vol_level_adjust <=
 			(TXVREFTUNE0_MASK >> TXVREFTUNE0_BIT)) {
 			reg &= ~TXVREFTUNE0_MASK;
 			reg |= (data->dc_vol_level_adjust << TXVREFTUNE0_BIT);
-- 
2.34.1

