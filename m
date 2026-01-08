Return-Path: <linux-usb+bounces-32043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D6ED019ED
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 09:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9637C3433174
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E5E3815E1;
	Thu,  8 Jan 2026 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="knVmbH/M"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FFB37F8BB;
	Thu,  8 Jan 2026 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860061; cv=fail; b=MleIncSxZgJSY1NUbg7TugjYNeIwa8SmQg+HI4Ltsw0z7gA7wgJDpNDDW5VNkGuQ8n7ZPho2pPYo2H7zPXGh2CQQLlNavP64cJgkjh4LwWIM9X96f/OZH6KX0kdcqYWbloBTOfS/DdMD5n9vQcfz10ge2LHVj23bxw1+qZ/JczY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860061; c=relaxed/simple;
	bh=h6iLWcSXOm9EOCkeRkbU+ta0BI2+cyDq2nz0K74gNq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HP5Pe+pLOZBS1aMFuPkGP/eXT8CFg6f6Q95PDPDb7I64S7sYclZ+hZyxqDNEFyvf9uPiT6zdaVAYym9DD7a3d1x3SD3GzUPQWs7mySqX86ksMjowjlkiZN1AknD3IYqlsGDEpRu4nGi/GwCXr6OKL29feIXek36ZZFGPq1zUPZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=knVmbH/M; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gee/YYCWDNTlbuh4SYdY+EOfMumFz3lW8T7yF91R3g/B9VfMQw2VegFYUEcso8b+aV89TgBFbn63vbpm/2yXd5v/HzzRU924jhxKSLr46eAwlkgWT++WFpYQRXND0DCfjROxYjHiTogM8dzrI0Zq5g6Th+QjFGHzqMK/Sqj81NYcoM5a2e+qAaJgzSoQo1FUg8x4kHY+lbHUfeLdd41chS5jY+PG7VbgGBZVQTH9s9NOF9ntj3WVd2JIiLQfTOKREMEDZFJa70WghGmtok2xuF3xczXqRLFhnXk5CK60kdmPgp9hsdNOu/2qLF1RVwib6LG/BMx56dHScSsqBg5wbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOpKu29gbkhYCVM6ymo6QJshbyqZrRec0zE9f0B29aI=;
 b=KgA+xelYb0zKhM5xbii0kDgmj1UIZ1b9QKYh7txY7w1AjBGZ3YyOZLVxQ4VkNhKICSff87jHkUWOLMD8iDwaHOIDwLbODLz3UwbxroSewfgoOMhOJjwPF8Cu80UoCKdnWcZ3gcMjuQy0+26BlDYU5dG54vwik8lQa9ozpixX0t+PjFVS8cI24tR/Wq1ZQT8vpqE2w+WMaJLmrPwLifrXFEdM0+sONYi6QjVteHbNL7cS57GOk20QFT69pYk4GgAjuvJiYlFHYSasO1kxSS4uiUB59MLB/tjbuVus8UIcUgazozhNZZ5FzKq+93DYIrm3y9QzE9NPEKoTezq990HJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOpKu29gbkhYCVM6ymo6QJshbyqZrRec0zE9f0B29aI=;
 b=knVmbH/Mejyal0Sh/DOrHO2irUUHvyUXTu/drODDlFlNyeHq+acEDzBdo2GFBl5b9ZEX7KQlXtltFixOKeM5OcLllAOfjJfMPs5UbvRx34hKGi+XXSKSoumIBxZUJwTs8LpcnYtOm7imbzXoDJa+yc2W8xigTxdfjVyTWddLlrZmEJfle/6HjPqHS9Dtb5Ba9IR+9l1Vf1+jZxP8uKDswmsBCckrA84ISwk9SC020Nn36RpefNcUGmo4BIUbY06mRT0oODvn+MTY2VTbKcmhRx3x1Bkj1mQdbjlfGDpw9RB2fYbYSg852B5ctYjlBKFT+WCBOTFWbp1NTcy4coBAgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB11916.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:13:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 08:13:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host role
Date: Thu,  8 Jan 2026 16:14:33 +0800
Message-Id: <20260108081433.2119328-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108081433.2119328-1-xu.yang_2@nxp.com>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM0PR04MB11916:EE_
X-MS-Office365-Filtering-Correlation-Id: defdffb1-c19a-4145-482c-08de4e8dcb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|7416014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BVYCV4HxgbfGeSerjxPIrVATfwerRzKmK4gmyAl2lDnJ21s0lNpnDiO7+mPK?=
 =?us-ascii?Q?U5C8S+syvZna//7oheBmmbB5smnFk9qLl25ckDDAQQNszNhzsbYbh6L0XPx9?=
 =?us-ascii?Q?y/Z2c/nxjwlSmcXrOb8q3/45ISgZ18PC69euf+NTOrkg8c/UtLCk+zrdwq0c?=
 =?us-ascii?Q?3BJUqd2LUxd4CvjXTreTJbAch96spvDSqS+Nn83KClufxLMaVVvBp3PiuPjr?=
 =?us-ascii?Q?v2QWVN4dn896gnYElIgc0NXiZ0a5VmGmIBSLnkYKFRmS/8AVQAMLOHT7Heyt?=
 =?us-ascii?Q?oFnqstkQWjXKPrD/xxBKgFWF19JiQVRka5fCpae7rOs2yUyk/3EPrAfAvwar?=
 =?us-ascii?Q?FKmZXjaVAZEVlNMnA5E2F5M8kHVj9H1r1tjXGNc6B1/RUYVHac4Zs3qztRXh?=
 =?us-ascii?Q?VW6Rwd5Smdkp6tn/HMa6WSpBgGCvMYGHv9qTTw2fJq163P3Teh1m8E7xdjug?=
 =?us-ascii?Q?DbwLMY1bDdYU97h27iFfiKQU9DkefMk4mQbpwxgWgP68tGaIYv3w3uv7YuJc?=
 =?us-ascii?Q?f2xkif3O49I8mPh95P8ch/quonKzuSSPoHRKVZuiJoHJnNFsEbaRXm412T1f?=
 =?us-ascii?Q?wUm5A0tELshzVB/SVb7MlndROTl9jCYYRcIqUpQHzjfrKzmQmmad78lvfeSV?=
 =?us-ascii?Q?M5fLBWPWkwq9aW4ltqkz9vqKbUEzIma0uWLo9N6VylL0mfAs2JMTX2zUyYo/?=
 =?us-ascii?Q?dTZ8U0BMxDsQLBprgnE1JcvxdRXoGeokNPigr+uWznFwJqnMyeK/UWvV8PL6?=
 =?us-ascii?Q?G8XxmVlaUZpuNOKCp8i8DWB5dt+F/CotLaEr3+NERbNC3gaL9bdMpfodX4U/?=
 =?us-ascii?Q?m+Fv4zK5hB28NS0wnoAcHoSBojosBJdWwun2IWWYPHzkGk2NbRBStTuI7750?=
 =?us-ascii?Q?wCKwl65R/HpvC6mw+VvN2NOBBRSWrRlyVy1rt2pXHqTC4s7MGBRlswHmvzq1?=
 =?us-ascii?Q?sBC3jUfJUtBjPrmwF+FiW1IvnXJDwMzAU2ufSJX7oKkJPj/znjofWbHLlTLp?=
 =?us-ascii?Q?btmohPka2y7+YRRUKeRtuExN+3YcLS+wfwfW2sXn+Gok+xPjTiTTD2R9jkY0?=
 =?us-ascii?Q?E/sIra0rDqxPbKPqT0g02oKEN8lKFIOIEhsTXUF0Ruih74lZ7yQZ/qHo4BTP?=
 =?us-ascii?Q?ebSKkjflV9rw0Y8h6roxw7tAxGBjnwcl8WUcTtcBS1bzIZ5Gg9zmlKM0k5ou?=
 =?us-ascii?Q?gWRaJmkTa8kKjATyYtagKb/PdDyMQVDIW/dAnAVzZUGdN23MNKab0vjB3XeC?=
 =?us-ascii?Q?9b4kZrV7GueTt3R2Q0HAYmoxANLHbTdatacJmfaAm9nH76lVbnW80mkRPvJT?=
 =?us-ascii?Q?BtZdl0gbyZLCPHcEwgVIK1JhoHxr+WqXk6VizpJSLutKarQqqNs85u1c0ue/?=
 =?us-ascii?Q?tvqz312fpi4WoS6etr0YL1L96MB5M6B8BYKzRZ28LYZNRZga5AKHNnT8S/Do?=
 =?us-ascii?Q?fknnrULs8mv0vO7Xbvmi2E6rQoeeTm0VhVRPaWJzOJ/aKqjj2XLmq4QdaATp?=
 =?us-ascii?Q?sh4zs+3VdiAx0vHZez0TdCvKEh/Sg00DWvd1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(7416014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w9eD3mcrNFq5PKosqTwrv/S4m/rmrbXjyJP+9GQKQa5MLSESY32NfzUclwAn?=
 =?us-ascii?Q?aw/xD0Oheisdis0fae8xKxAXpcsfLjF8rGfYF4aH2p2M/K38DoAiGVn8R99X?=
 =?us-ascii?Q?fRgAnGVd9KIWz35OE352gv6RAcoqIg4AmZJk98XAQ8J5yC+nfkHjXH6uGxU2?=
 =?us-ascii?Q?vDTCP0PUKu6dMdwAnJhr5bFB9t4kybVNVN/Zcd9VlSE2of9C3qliuQGs5PAj?=
 =?us-ascii?Q?nDcsZxvu4VG/dKWSE2+Mcpa/Eozgp4TONhoAeZTvS26nDzTmw6zeXJ9WuKxe?=
 =?us-ascii?Q?nxHVYwxcIdDkf1FVfWUBjvz469Z3aMvzGEjRqKcpTxQwi0J6KHu4BY3u94pI?=
 =?us-ascii?Q?Jdd3V0JyCmmsWzgqRpB/nIb6b+aPcKshQL2f+0o1R4c0OliWVqTcwcH5PzyB?=
 =?us-ascii?Q?TRgR8AsZv69pXmOmk46TB4zKocjPZoMQpU1G8jrlT5jVMCNRS5ovU6aWKve+?=
 =?us-ascii?Q?c1toxhthRR7vSjnmrSC9T6MsM4zoT1uRWxMTt0myn11AV4S0qMVjbIu8em3w?=
 =?us-ascii?Q?wBQ2W7N8zd3hmIQYigVGZev0B5DDNKSUTZ4WNps2KdlCKMuxf1FZiE5vA6qD?=
 =?us-ascii?Q?ndtcx5m1yfHH8p9a9c0XbF6jTqzuW6uwzAiLquhzQUkzGzCpxtaqvGMyN3oy?=
 =?us-ascii?Q?LwjbzjR4mo0yDz7ExIK9rSu5Qck6xrdizSuIhf6WajcxFfDd36zLpnV4IIWt?=
 =?us-ascii?Q?dVbUIUY+Vuj8k706UQq+sqjpgsR9tVfNGRk4UOPeA8h69L7x08KpMhkOKCnL?=
 =?us-ascii?Q?JUsrrE3zi/izzeElwFbK79VHLCoW5tsWcaG+qPA28Jc8cIf0akjjcDEeh+Bk?=
 =?us-ascii?Q?4scwLCBRg7i6Iw0W2q006Go9FaMWM4YlTLbDWD/blHTjkZiHEtFan2mjcp3W?=
 =?us-ascii?Q?jHBbrsUemSZMzsQL3heDcLT3/lJCsPtBiq+F0d6Q5c3kMl7hsr7yRyOO+xy7?=
 =?us-ascii?Q?0a4e46y7w6i1/a1TCiZWokVLV7YRcJQPbYrRArL5WbBc6fwekoFvEnn6OCTK?=
 =?us-ascii?Q?ixJqA2UbyS75IxaD2O114z7ItM0bwb+0HX/FmRHFwGxgFrZJ+GxrHfl6/0um?=
 =?us-ascii?Q?Db/4yxSpx3IQu7vAtJNEV92EKhSVb+1pp+btiDTjw6W0qljZpNhx7PzgpxpC?=
 =?us-ascii?Q?vyEIivgfnUtwa6vvUfB5JtINDMtsAIfxB+yhbZgt4cz1S2qHegJ+CmKa8eJO?=
 =?us-ascii?Q?ARXCzFsySGnUIqbKrFWckQWaedMmMlwmU7+4DoTGjAIcCr7H5WvhyDpgIunP?=
 =?us-ascii?Q?Cx7GtxcdZ0USHOCwljuAdPNj5fKSTyaRWmk8QJIaZzA0waNj3GPxvs+vNmrP?=
 =?us-ascii?Q?xulpKDgjKWecNv4e/8YinB9AXA1mvTTe5N4mG/ncmShxBhv5nP9U944B41WR?=
 =?us-ascii?Q?MOGtOrx4x22+yKZStfmLJQnIVRRAtkwX/a1YnT1wX6ZW8kCBls4te1d8SxK/?=
 =?us-ascii?Q?U077helNqqUD+RHKxnZEMI1WDdE6khJ4tWXqb7geZrSZOhBb+B4gZZ88fxfV?=
 =?us-ascii?Q?PimXqZpRNmVkoIi4obdx7YMJ4diDrexAUKzFtIRfHLk+z86ufXvWCT8RndpA?=
 =?us-ascii?Q?2rP9nvEhS+BniLfmJSCAG5YkK1AvuM+Y/iZ0rDJSEbTYTJc0erPPFl+sKXII?=
 =?us-ascii?Q?Gdi9sfc5U7OeVMyLQ4yV083/QpEkfkiSVAXz/JKQO5pYdKQLoi6SOBHvtHHX?=
 =?us-ascii?Q?pVXWKvFPwuUhvXhETGtRd22SyNivFBFyN63YHBLqzau5BZvv6fvZX7TTEhVF?=
 =?us-ascii?Q?Nl/vIuTkpg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defdffb1-c19a-4145-482c-08de4e8dcb4a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:13:24.3396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QispXB7PnGonDUNjRWr0KLz/2xAfxEQpCyFCRcBJgDnWu9cp/ZudRDVoGjIlZhGLxG57WNLU92sZ38It2Z7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11916

Do dwc3 core auto suspend enable for device and disable for host
, this can make sure dwc3 core device auto suspend setting is
correct all the time, the background of disable dwc3 core device
auto suspend is to make its parent device suspend immediately
(so wakeup enable can be enabled) after xhci-plat device suspended,
for device mode, we keep the dwc3 core device auto suspend is to
give some wait for gadget to be enumerated.

Note: It's a temporary solution until we switch to using the new
      flatten model.

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - add A-b tag
Changes in v2:
 - add a note suggested by Thinh
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index b0f5266af954..b3d7252bd910 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -158,11 +158,31 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 	return IRQ_HANDLED;
 }
 
+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		/*
+		 * For xhci host, we need disable dwc core auto
+		 * suspend, because during this auto suspend delay(5s),
+		 * xhci host RUN_STOP is cleared and wakeup is not
+		 * enabled, if device is inserted, xhci host can't
+		 * response the connection.
+		 */
+		pm_runtime_dont_use_autosuspend(dwc->dev);
+	else
+		pm_runtime_use_autosuspend(dwc->dev);
+}
+
+struct dwc3_glue_ops dwc3_imx_glue_ops = {
+	.pre_set_role   = dwc3_imx_pre_set_role,
+};
+
 static int dwc3_imx8mp_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
 	struct device_node	*node = dev->of_node;
 	struct dwc3_imx8mp	*dwc3_imx;
+	struct dwc3		*dwc3;
 	struct resource		*res;
 	int			err, irq;
 
@@ -240,6 +260,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 		goto depopulate;
 	}
 
+	dwc3 = platform_get_drvdata(dwc3_imx->dwc3_pdev);
+	if (!dwc3) {
+		err = dev_err_probe(dev, -EPROBE_DEFER, "failed to get dwc3 platform data\n");
+		goto depopulate;
+	}
+
+	dwc3->glue_ops = &dwc3_imx_glue_ops;
+
+	if (dwc3->dr_mode == USB_DR_MODE_HOST)
+		pm_runtime_dont_use_autosuspend(dwc3->dev);
+
 	err = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx8mp_interrupt,
 					IRQF_ONESHOT, dev_name(dev), dwc3_imx);
 	if (err) {
-- 
2.34.1


