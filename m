Return-Path: <linux-usb+bounces-31193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C1ACA6014
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 04:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1084B30B846F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 03:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633142BD5AD;
	Fri,  5 Dec 2025 03:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oRVml2x/"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48BF221FCF;
	Fri,  5 Dec 2025 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764905331; cv=fail; b=no+swrs/NksqCRV9wqgkWemNU3Zw2nAN47m62YsEYzs8qWvw8xUbZ4mQn/3c9Q6OvAvsJmjsPu3Kp0dZw4Crt2lUQReFObB/MXdg+NmRPlpWDH2Nbs17Wv7E1mDb4USpgVF0JtQVLQoK7ZbcUb61isI3DQgciNbdqKg65fQHgNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764905331; c=relaxed/simple;
	bh=AYYBXVpG1RvqbnpWj8H8Z9+6eKUi4ulzuL+KiNGwLBg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LaFDRdiDHmcIHT/nQ7KsalcYJxHcffykSxtotY4RAfxmFyW+2XK9/jQy/rjQqr5xAv9TDbrdB4dYzFcxlQ1Y1T7jUBbU9s8+NO4jYZFsSVpwyag9pCIx/F1mAqWHh5FHX3rCm6lyjLfWRslRjpA1QXfoo3H8op+ljdq3hnSKFP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oRVml2x/; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQdpA49wRIQGaz+FkA1aakqEtC9nWf+CQHtZc4I0U8Kh5Ow+N+s2DyESKtq10OYerB76nkN4ZlwNqLYxshM+Z3SHSFIwZtuV7ehGvpNH+X98vWU9DbQfcqIic+OfE0HnGf4mz6ZUkevfArgwrc9mvrkVKyTy1VQQl+OtbS1u9UlM2WF4rT2epSq36lH/DzSWl+QQnKPM/fBso56zTMPk6afsukY9ypPgfrdPhajIF91CLUy9srgTRJLw4k1RC4gjqf70gkzlV/RTJ3Lg3ftbMYBIlrGd8u2jvQscEaBkHRXK/wCaAKl0i3jpUPFKpAF9Lw4LF815Ed4o0pSHz6T8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Y6awX/vy6heWldk4AlsS1ky78XIUWVA6VUE5BCst5s=;
 b=Zu9+BaVEp0aOZalLSwVq/hDjEQe+0R6k6UNt+bIr1RXYuiit7EqRukG7ky0unlU3qgOkrtghFRIJj6J15besjXR7zrCrMU3CxS7M/fdeA5YkhCQ7majaT6C75PLhXwU0OlksQtmnl4KbJGsiNaR/s6crwWtnbGqIV0cP7Raugdq37xipOXUu3RHlzTVxwCT8RhOhxFgPxwLLElQgYifat8nIesbNDHjcLawkWnKsiE8YadCd0trTMXU7Rav2lyjPYjLsYS7j/RHee5hha4nY6tss8336FiCYeYSPXHR+/QhHiGdl1ePUvjzCsxRhCao0L6XB1SVVU7zRp6QMmivjGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Y6awX/vy6heWldk4AlsS1ky78XIUWVA6VUE5BCst5s=;
 b=oRVml2x/xnohBYVJha8W1wSZyYgH2BPdQSVBFrNWmLYYA2ykDeFWNGPoVt0u6J88fD7WU6o5Z/KGUFSlf2GHsKbj3ug+axsTSvZmft6YLwQ9GKOj5Wro68x1OGMmXsYgT6lmnKIyG/Nb36kpNNivR81evTBXbq3pqQE2K9lAXrGkvdVRzCo9MhY8pkxLKToXSKXTifTJsAC86CNI8mQ3bno372GaYa9r6rHw8bl6i/NT5sE9Kvv9X0agAzDPih1HnLccADVe0rsgK5+aDOguDizi9CDqEz9FwfnUefpll3I+lhbmEhbvwoHGi4W+BoG4d5dck2AVQqkC0qOUasP8VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com (2603:10a6:10:366::7) by
 AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.11; Fri, 5 Dec 2025 03:28:46 +0000
Received: from DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c]) by DB9SPRMB0022.eurprd04.prod.outlook.com
 ([fe80::8c26:6739:46ea:171c%4]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 03:28:45 +0000
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
Subject: [PATCH v2 1/3] usb: dwc3: drd: extend dwc3_pre_set_role() to extcon and otg usecase
Date: Fri,  5 Dec 2025 11:29:40 +0800
Message-Id: <20251205032942.2259671-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DB9SPRMB0022.eurprd04.prod.outlook.com
 (2603:10a6:10:366::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9SPRMB0022:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: f023621b-8e6f-415e-32c7-08de33ae6539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KIvdz3moXgEcBsu/SkvBH+GSN8sOYdB1AkqrJTf0OASoYZM0DzvrfrjLSJk9?=
 =?us-ascii?Q?3V8+C0n+4rF8xP5dbToLQXFGfb7ZiW2jTOsfCW7dkPYhSdLAryl1ioN6Anop?=
 =?us-ascii?Q?Trrif6BwwXToFJxIsuAYusxEd6jifE+iuR53BokCShLd5D70IcloG1DKPage?=
 =?us-ascii?Q?fiM5jbL2a4Bj1+dfRRSAwQ/YsEHWzWnKgupno86H9ailA42I5JegFXit/v7j?=
 =?us-ascii?Q?R51A2kbh4NtqzEmzlNEGyH2LSxfciML1o+nlGd5kx8J6T7eMbiGFMKASmiPM?=
 =?us-ascii?Q?qzbGvIl0pXLDuB/NsPjdXxPh+lJ3nMdOCWferfyfpeewNyY5z16tQNVVV8YA?=
 =?us-ascii?Q?6Vyy6g2cvS/d5VpKXW1fgdqZRpW2ooLj2RnvFVjh9MsxjLR6lCA9fTQa+OTW?=
 =?us-ascii?Q?rfm+jMbUZhPrb7SMNqwO0aAf+PS27ufR4x+4Nne8MisbOBxNEZvcTEnRt4n8?=
 =?us-ascii?Q?i5k7o1e5vg1FenE9lweh4FHYEKashNlsr4AlG43UaAG4IiENDyb0DeeVQntK?=
 =?us-ascii?Q?kK+0IhlUj34BDg7kgfpoUqhZU8Z8nNAlwTJJ/rBoD0UrIqdjZ0kTjgekcyFJ?=
 =?us-ascii?Q?vtNxBYcXzcIaT+SlD0EwQcagAka+caxyvpBDnVG8ptfXBnKUnfStzeCgf3Hk?=
 =?us-ascii?Q?IfFZ0n4vUTcH6+h1w4dobPo5FrcTVx13Jc/W7uaS4gdWAF118uyXv82HD5br?=
 =?us-ascii?Q?3vMOm0rT/CDCFRSPDIcTTEoTRRDqZPCZdKuv2MSmhK8694nTvTnfTJs9O7XI?=
 =?us-ascii?Q?5mbQoiB2I5R76nfjSjdD99rtfgrum+ioJoHLc/+YswdLtQJNJCM+/kKFKhQy?=
 =?us-ascii?Q?tDsrWdXeXow6BDNQMbkGmqlvrz87iwzbTLy5/xDNH7sV57ANrdLWdINDkVz3?=
 =?us-ascii?Q?ultYXsfZIVcMagRvaLP3oxNfrsgQ3UeovvMd+0daBOuS06giUf+5IolYl7Hv?=
 =?us-ascii?Q?gm7UcRppIGxl+3HHl1ZYATBGkA1Pavu8BstnNr0jNnYTXCJOCJkwiOe0I/eo?=
 =?us-ascii?Q?MEp4nuojtoy1NMl0gWOJ0wQP/QSfn9QiMgUp/KKi5bt4ijRdkrbdRJ9brLtm?=
 =?us-ascii?Q?7OAFkrmzZv5tPhNbsAfIYy2l25ANoAqOnxWMJhZk4YDCYcwOrxBnhligCtPn?=
 =?us-ascii?Q?6KYBjf34url2fHBiZ3RlYJWVn4A1HG6pDodMnxQdlOW39acXyA9PwnlMuLar?=
 =?us-ascii?Q?m3c54M8nlyhlHXvrz9H/stLL2aHbYccwMIU5mTnBId6AKiRlsV6pYYxzWlJ2?=
 =?us-ascii?Q?g8LeYYqtFmtkRYYMEr+IFuzIUtwrOXdeRlynWHMMEuEwlPKdBUsUnWxOIHv1?=
 =?us-ascii?Q?iAKt1faqkFyuXB3yjTpFUGAhFy2Im+kIC3relRCqoLT1wkp0xsscsr+RcT6H?=
 =?us-ascii?Q?LZ5ZisHwod830aIL880/gpekiOAZHvxoRg0ZT3jdRn95s85VsDjxHMBV8uEY?=
 =?us-ascii?Q?XIbD1yiBpq/8/ct5LCmudgBDr+kAJ1zsOFZBk3uXhst3pnQCgGdYOg8uhUzQ?=
 =?us-ascii?Q?fkF2/r/PJsD6m+X00EsdMzE8dg0Mv3xUQkfy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9SPRMB0022.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pN7leEx/kHDVelc5wjyVdLFMIpS0Z/HfKNj0JDoHcn5H2IrjD7W+/rOhIc9n?=
 =?us-ascii?Q?5Zcn23f/CswmUltIozVibxBo0Z7ujx1RqHhrJHAUlY+LZUuRGsm1THSl3YKK?=
 =?us-ascii?Q?+VmS/HqH9rTBx4KMR+4CmK7K55V7z7mXV9nSGXe2AE8Ll9Ri6f3LfSkOgD8c?=
 =?us-ascii?Q?a3K0h0hSxtBznLUbHjx/EeVWBdEsMcPzHbtHfIgB1C3adEHWAzQia4NP84xH?=
 =?us-ascii?Q?aecqmTyLVAwmVHvGJ1odxLvz6JEEq0vOMCRfnHFvmIYEeMm2kUsw/BntRjN5?=
 =?us-ascii?Q?SBWF7B7SpFo3YGCBYOrGsuWfbBKx1XJgmCeQbSG5PUfZEGBuK7NI/UEUzqJA?=
 =?us-ascii?Q?BAYfr3GyyMbWhjKwcGBiIPC9S7sPVGY6IOGoUauH3e5qJ3kimPLa0Q7f2FaI?=
 =?us-ascii?Q?EY2dAljnV5JYggzowcPjhDMP3Rp58gzvqD/tCgE4+jVqqlcRVVsFG8uXq42L?=
 =?us-ascii?Q?R/nP+iCU9MqmEnojKzCyx7o4hrEwklUnVdrZzW3WqrzQFPPMkInGPVJtrZxl?=
 =?us-ascii?Q?suoybO7z5h1hSGVVS8xTlo4mQzMOFGq6PWi30kt56E4Wzyo/PQEAM6aCuXYP?=
 =?us-ascii?Q?sVL2tcsEtG0aKndV9yN4i+I6fevtol3LZBzANH+vmY7MnRP1lA6uKb8CzP4I?=
 =?us-ascii?Q?4uLPFuKOQnHV2uC+UEMxl1o/nGJLc/6nFjzbh6quOe8x/6nx+j6dl9ci7Jpd?=
 =?us-ascii?Q?uHHTepZahAFVIU+qoFrVapnDiYozb8MbuyrBaXgo3voRljN9h7gRtFw3L23S?=
 =?us-ascii?Q?v76A7t2l7LWk3uyYxyFi0nzeP3ttcZ603BhBG5q9z400afYknMO+MzZkZaJl?=
 =?us-ascii?Q?h7tJicxdSDf9zPB7oAeF8Ux4wiw1SNH4H7oiFJ6FxEcBPSpduc64pdbAavln?=
 =?us-ascii?Q?pA12qAOZhqilBjbas58RLqt17s6d7AyMPAU53f3lUaM3gO56qx3SvVZLeHj9?=
 =?us-ascii?Q?fiZLUQh6HI5fMz6Z/uh7H1Sa+lFXJbyWJHWHRAN7u2gjX9MjseXDdVJ4dHJX?=
 =?us-ascii?Q?k3I5jO6XjF88SS0h5HjKF87pnf8ynGeVOEGnnI7FeEdloBK7A4s4zX6PIALT?=
 =?us-ascii?Q?mIJHE1f2QsnIz4Fw41XwM5eBZecIenJXVdO9UlQf81m+zz+SWXZ4Y2K0kki1?=
 =?us-ascii?Q?K6MKe/CiO4z/zGmsRs3O/caSC4Y07rIYc8KMdMZTzeIWa4fDqB2/Zf1AtYO7?=
 =?us-ascii?Q?r5AL9x/NKd1kqFp0h8wK13t3aiM1tONFIEqX50rDhL8BKHVCJdqYaz0oU4Hs?=
 =?us-ascii?Q?otfcJRn/5ZZ6ac61RZ5TMA/2e7/mThNkbr7l5keG8Oqa9haRd8LlmjSEq+TS?=
 =?us-ascii?Q?RNgKbjHvH9DnvUJpXqE+ztvQzr1bLbz7Hl2mX7fSDMCC4J1Wjbgl3F3NO4u3?=
 =?us-ascii?Q?jt0xeAI+CdIQ9F5qjDTmCRiXVzd5CWW8pHF9A4uSSZzvLrKl/u4AFI95daw+?=
 =?us-ascii?Q?m/HJs5j3JB/+R13SlvLuB3/z4NzqxAr1RduNR4Ta6L8PpK3gnxxLmp3TwgLJ?=
 =?us-ascii?Q?8oeonzpj2bUsz95sL+CjFsWAmT4J4d5a3QqnsG/f+oJRGi+Bxq2lU7wMo365?=
 =?us-ascii?Q?lubI1smZZo77BjY1Mr2e0yeMijDmbaT5r7KnsZXK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f023621b-8e6f-415e-32c7-08de33ae6539
X-MS-Exchange-CrossTenant-AuthSource: DB9SPRMB0022.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:28:45.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o4Z9mEkTQyqlaH8d4ruQeZqxmd979npuDjLZrRll/P2EQwsMcmhZPwlV1Orkh9rVZUtYJu1azP14XL9Xpt93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649

Call dwc3_pre_set_role() to support both extcon and otg usecase, so that
the glue driver can do proper action in case of role changes.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - add Rb and Ab tag
---
 drivers/usb/dwc3/drd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 589bbeb27454..031cfd12300a 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -381,6 +381,7 @@ void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
 		dwc3_otgregs_init(dwc);
 		dwc3_otg_host_init(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
+		dwc3_pre_set_role(dwc, USB_ROLE_HOST);
 		ret = dwc3_host_init(dwc);
 		if (ret) {
 			dev_err(dwc->dev, "failed to initialize host\n");
@@ -406,6 +407,7 @@ void dwc3_otg_update(struct dwc3 *dwc, bool ignore_idstatus)
 			otg_set_vbus(dwc->usb2_phy->otg, false);
 		if (dwc->usb2_generic_phy[0])
 			phy_set_mode(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE);
+		dwc3_pre_set_role(dwc, USB_ROLE_DEVICE);
 		ret = dwc3_gadget_init(dwc);
 		if (ret)
 			dev_err(dwc->dev, "failed to initialize peripheral\n");
@@ -433,10 +435,12 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 			     unsigned long event, void *ptr)
 {
 	struct dwc3 *dwc = container_of(nb, struct dwc3, edev_nb);
+	u32 mode = event ? DWC3_GCTL_PRTCAP_HOST : DWC3_GCTL_PRTCAP_DEVICE;
+	enum usb_role role = mode == DWC3_GCTL_PRTCAP_HOST ?
+				     USB_ROLE_HOST : USB_ROLE_DEVICE;
 
-	dwc3_set_mode(dwc, event ?
-		      DWC3_GCTL_PRTCAP_HOST :
-		      DWC3_GCTL_PRTCAP_DEVICE);
+	dwc3_pre_set_role(dwc, role);
+	dwc3_set_mode(dwc, mode);
 
 	return NOTIFY_DONE;
 }
-- 
2.34.1


