Return-Path: <linux-usb+bounces-53-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213FE7A0358
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 14:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C900A1C203BB
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A64219F3;
	Thu, 14 Sep 2023 12:05:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B1F208A2
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 12:05:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2052.outbound.protection.outlook.com [40.107.6.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C01E1FD3
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 05:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D39GCHFj6CP909r34tszOQw/gj88VP0/MIVsCAJxw5hqzw1g9HjgFU7BU9w/rQOZEfXlF6i9VYhfGdONpV6eqPDbipUFWYfCor+YIicDJofLlM0Lvyqf47OEWsPaAhPhLFAuHbhvOacMGAqobO0xIN1240Z3FxW21V9zdhfaO110k7bJLtHF6Vn0BVUV7zV4L/o3NtxyJfA+ZExfXA+O+gQt/A9LxpfJh29eZbS/PPg4t8Rq5a4DgV7ptXmD6mE3YY/voId2Lb8b5TEC7klaJ1UOa6DFHdk8PI/1bMuQfObYqqlkO2rt8XjcR1CaxuiQZGywsfVzx8A6sXTZL1vFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hnbv8mmcvDGT990v4EVAhOLpCGHEHIRlQOeGIMZwteE=;
 b=XhyDzzdtVnTRdNeJ5tzFklrk88FG2pfsztIo1TrQ1lCCVChtfLhXifzeBn3VHoU5Od2CBuKLtq5p1O6sYJa09xw0BNoB7WMr7gquBdUIXyL6H6i9Fts9n24KuVloWArjleXCVY4PEzZ55YZAWQvQbN7hfDal7rczJ/bqKKi9Wd3FY/N2lRBAIpkQjE+CF+LfyfhMrFtz2Ho2mMOOVm/DJJ1YhkYxHZHDoTvi4oPjvoFxdf5TBlpoFncOTJWcvFeZtzCwWPi/rjbYJ6H9q2WIEskmTK9IRKN7CQKpZKHxhIJ5Iy43DEjq3ABdahXR1CP5wHTfNPkEw1hU7SJlHUiWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hnbv8mmcvDGT990v4EVAhOLpCGHEHIRlQOeGIMZwteE=;
 b=IJmyUaVvC+jy+rnTIs4fAGIU+J1pSrFJ84LCerSzzYZ4a0k0IWp0Gsru+JIM4LgAEiIZl+7gLObPAwFyHB2nhAH9xl3Vcs491kw9/Ks/2bFpt1j6SlEe2Z76obT5GcIpSrEZDz2YANNrST0duO0JvmAlffy4psJVw4LzmdU+isA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20; Thu, 14 Sep 2023 12:05:00 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 12:04:59 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: linux@roeck-us.net,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Subject: [PATCH 2/2] usb: typec: tcpci: enable vSafe0v Detection and Auto Discharge Disconnect for PTN5110
Date: Thu, 14 Sep 2023 20:09:36 +0800
Message-Id: <20230914120936.2955817-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914120936.2955817-1-xu.yang_2@nxp.com>
References: <20230914120936.2955817-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DU2PR04MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 1695dc43-f745-4f05-30cf-08dbb51ad1a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	seJcpbpacN7YYYhxYbNCHJosMRG5XFUv5bUTpQgddBfcqmSVzMvUVw1LjJ0X05ybupLQ0KrdGigFaWXWnYug/K2V/O2sDuyqgPDhX0Fhx1CSH1hurTgnHMsp299olpIqTCRWGm7vRztvBraNtoxvkgYsofyvva0eVMEoCelQPSKWs2Kugzch4aL7I6BpeLM6bZPTwRa8V8PG0TC26mVT0tdkB5Fwy5NctAaGQFlyaD1w7cbBo3KuXaZj9eib0F14XRnFLahDaNAJZmn13WFf1Ol1NFPIpEa5+8Bphr5/0fapAwrTszyFGsdV4QKZKO5AyL1BDSyrsERGVUAJ0Ro0he+kFQAIP4ZcvgN9x/5EITVoDF7IbTYE5umyQ8z7T/fXMNX/04k860PP0g0H2TWAmy6uFWzzMQiZO5WnCVEUtIdzbEPRW38UF8AwFzYNehHBnciijQPo7aHJcnJH/P8+592b0t2LoaQ3yM0udHlHNksA40oeUJkN7p/2IAtjkNxDviUnM4mFHqV0iXkVy1xmnIgeIp9ZYmlgD9VcrYkB/AaGykFAFXsXfqZ4SCwtlf6NHP4QzJ6w+b9AF8oGfJF88Y0t+/0Tqf4O7UTuIOS3Ug6hhcSXYbYdbwN/D9+VPa4qMOoDBd3Xpnqw/HC47OoAlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(186009)(451199024)(1800799009)(86362001)(8936002)(2906002)(4326008)(8676002)(4744005)(5660300002)(36756003)(6506007)(52116002)(6666004)(6486002)(1076003)(2616005)(26005)(38100700002)(38350700002)(478600001)(83380400001)(6512007)(316002)(66476007)(41300700001)(66946007)(66556008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ma1/ALBxR/vtAjKb2+NC43R9IUfTWuqyhNlSPt1/MpET81uQJx3vaqYjzzHz?=
 =?us-ascii?Q?/+lHDOPVp+mq2xLhYnM2iFUSXn9LSF3F4eebwAZIVvBXuGqUBqAxvbh1vjx/?=
 =?us-ascii?Q?VBGHdtm+8OiefC64L2E3l2UltK07wUFnSIpM7BFt5l+f6KOCrmeqq7xBkpvQ?=
 =?us-ascii?Q?4y7QGJ4LYrydguBjWXUecCUm+hXrRxsiqVgpwW8/R6/7D2BeqWApLdKT1GD9?=
 =?us-ascii?Q?U9aAsyF7hApoEPCOlePujkTMM/EhGpfqomyO7QnzRXsYvB8kzTV31KdXl665?=
 =?us-ascii?Q?Ruwd//XAAuqMo3iiTOtzrapIp9oJgiBSFIl9pdmmq8hMaC/nUkaPkk1Xfss0?=
 =?us-ascii?Q?n0o1zoyE2toAbtbv0i8YhY9F5ZVBuePnJ+WoR7sjykD/i9DzxwFHmEU0E4lZ?=
 =?us-ascii?Q?A22cDD7AAvNcXIzFoQq+VlPN7J6v8Cf/LfXWSFHiQBbqTPFyqFZoHlZp/W9B?=
 =?us-ascii?Q?6ZcMnHEMG9OmxTBeZM78sbhRKbLdLPcEcF0bb+q5p1ky79PxV82hu7SMVNSY?=
 =?us-ascii?Q?c8NVv0c5inie4/OC/8RZk+9ExqgszMfcXgPGzvIR5dCk8Mx5J+LHDJISSoLq?=
 =?us-ascii?Q?VvLKjpUmxqC0/ytSJDxBcM908UkcQPW/va9uzhsv3cfMvprW3hvue0uPu/Xp?=
 =?us-ascii?Q?7z+lQCYvix2NJuYJ+/2xij69JxlyoUbb9K4U6A98FAOUSyAH7LQScITqO5in?=
 =?us-ascii?Q?BjiFrjggIlYibxA3tDRvb7vjYWs9gXlXONnegN5UduoiD6lPsPkFWtw259oh?=
 =?us-ascii?Q?H7TdNlR0lEUFDOBaAFQMECwQlD2Gx7Z2xPiamlyyQ22JVITf8YrdxSdRNc5Y?=
 =?us-ascii?Q?PyOfbkGINmhuEGuaxgbNv6/KDB7kZT1slBOIHbkps+9slSCDI+UB0JdPxKo2?=
 =?us-ascii?Q?PNCEcwJFijCmQX+hmVJw8LRa9d1bexurAqdcxx9miX9wK5n3TzlOa/yA9dlK?=
 =?us-ascii?Q?mL+7cmy0X6bcWPy+qpa7rMZoqcnA1V1012e6yvpVAbVa30j8uHZ/3KhCldHq?=
 =?us-ascii?Q?7TXzZXmH7Q9IwQwpLOvqJs5ILKhAxp9O5OB1kcN/9SgVH9HJnJWBcdIvtPqu?=
 =?us-ascii?Q?PCwaFSqYLzZvLb/4F03VCC2Mkt6P0iThgHkyx7n6W/GdhpzoEWPfV2ZiV9Uh?=
 =?us-ascii?Q?DBOfG33MMEYTXdUxhWjesUhBi5vP+WkYvBZ/l2OtBnQwTJhxYOatlyP3oyQt?=
 =?us-ascii?Q?HD3Wo4KlwztwpnKqm7EjoqimcKxqeYr0b7wpxpekc5CoRgmdvufOhPnYYv+I?=
 =?us-ascii?Q?ADnYeYMg6gIJT9fvI3MWVUCJKKEw2SM+o869W2fGuAQSvQxG5ltf2xq+Lbhk?=
 =?us-ascii?Q?gPHViVHBY3Sj494vRAJy1DAjkgUX451L4ZEByLjLwqLweAtLd/mdBljqJoVp?=
 =?us-ascii?Q?JEe+Xvpxi4k+wmOtNdSsa0euE6PnpW4CTnmiDP9Se/aZjoVB/X+epswFO3SX?=
 =?us-ascii?Q?bXLo6EmvWYNJU8TbT63f9WyODlR34wQ3J18ToFSEMMzUHLuZVfoXx+qwKQNd?=
 =?us-ascii?Q?GuYasrUvPOY0wkLD5tz45aAUrYA9KHb8qRbFL9n7RcgELkQX+Q37MGoiMlgS?=
 =?us-ascii?Q?vPgSadh2aW/2mqkGhLLjQXJKMuikl6JoIMCH0e8M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1695dc43-f745-4f05-30cf-08dbb51ad1a0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 12:04:59.8227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwJPvtF634WVrwRr/zCv+tvwHqtZYwYFTSisAgQvBzCtzo1OzkV3Ll11OUWBSCV4b0rGyWmM9yFZQ6z/NZckcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179

PTN5110 itself supports vSafe0V detection and auto discharge disconnect
capabilities. This will enable these feature.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 drivers/usb/typec/tcpm/tcpci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 8ccc2d1a8ffc..141d313b9a55 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -861,6 +861,9 @@ static int tcpci_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
+	chip->data.vbus_vsafe0v = 1;
+	chip->data.auto_discharge_disconnect = 1;
+
 	/* Disable chip interrupts before requesting irq */
 	err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
 			       sizeof(u16));
-- 
2.34.1


