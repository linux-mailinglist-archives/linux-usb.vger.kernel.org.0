Return-Path: <linux-usb+bounces-15482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9F986AF2
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 04:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2234C1F22801
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2024 02:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08618175D2C;
	Thu, 26 Sep 2024 02:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B2ROUiOT"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13CA1714CB
	for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2024 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727317692; cv=fail; b=SNMNSVLjx/YW55dKacPPIIiTn75KkC2qPA0coWe2hMUL2kDycrWAGHkZ7ZIWesPZLmcdxNqZKgzKIsA0aok3uaNFv4lq5Xf/IvhDzo6mfJplfOCkMAi1F214pDW3YwOxVUXq9zCdL2Yj5ihvl/N5i69CdU8J0Z7tC5JUZB17734=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727317692; c=relaxed/simple;
	bh=h5BYZJWlFKnSZ8p0FjTCGZuISn/ucgpU5JWYRuRcfH8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WLQcac13Q44AnoPCe9x0E6yKNfmL8MP7exR96CMG4wO88405oJqBogEY93bdIXMMzwYyj1BAQm9BRz0PiLoeR98IBHWi6TR/PbLFs2w16a3nB6ZwIbnNZdfBkq9iscfhHHPojavObOPVYHHL4ZG1pl/eRj30VT69APaHZpulRzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B2ROUiOT; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mik31jFGP6ZrOhzd54X9I2BUYLWdxczghl7yyo5jP8FXTukq1RMHWHYmnrEzP7gxKtVtq9f1tc2asrvxGr5kZoOMGG0J5hV5jQf6W0zSVutlYruSsQ+326AMTf6Aeaknekko9TEnqdi1AmI5n9NCr9DREXkiV8+z21zqaY8/tQKrV1l3SN3hJvOvnwLyp8Fux5A0fIOZ28Enjsb9zBTQreO9SQeM3IZ7A+tTcPvqqXwHDVcOpf3DhGy6X/PM5CssmlGoIXaCNB0QedDcy89IHRKP/UAmiO0T553qBuT6JB6WXrwHJbcjttWpYAXsY8t9V6jN5bMkQXt4hJxmMqjCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9inbm5XNT30h6XX3nSQ5+r7IGQS3ksitmU68sGVbrAM=;
 b=GeOsXB3sd1NokooD3u7f9Zb0odJDvE9S004JCqpy0VNn/a6TWgSdoWXqpfIKoPES4AOsq+48Mt/VCsZBPvUHLGpwlnOpvSf/Zab9Z6quw5TKNhReq3CIhLdFvbehZMqOAd+6N4xu6mMDng4/5USSmw2FBVoOxLraECH/1uwoPWET39UmZ0KDPjsnlDYgsXXeNRXLG4GgHKTwk9umOPUTLGXuGjMtyupn3P+0aUMw1N2HyFaeZGBWBheoIYd22B8Dmk10fDYyGnx9qRo/6XurWLZeCFuWifwGyv8V/dudkwSeMtzC34QI3FPKi/zhNcYo8jl8M1xuCeEd++N6VDm76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9inbm5XNT30h6XX3nSQ5+r7IGQS3ksitmU68sGVbrAM=;
 b=B2ROUiOT8aJMHHr4HF+zWOv51M+Ewlva9DHwNgoTTkPDsucUz3hE2ttsk655D7/UNo86sdNl13HEqdwSWUr71v9z+NrHY/T3lARXGiKt+JAEGi26M1qjueOKG4WbMgayELG38/ZcbtpOQlTFlgKcyxdRT0XXDrtaj78ZX9QA9zrwv8sw6DNmJl1uEQZ+1gOUFkT0O3zrFPlnGBOxMUlprX7aCPXOHL5448JqR2XtiYmuskJHKH0CWnoYtAwP0coaycNhWfmBcSb1O4Is+BMWEzWWHr3j3yMMW5P4reEqiP4shA3ay1HVvhjTJblbX/kyisy2LprQwA2r4safBPmpsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DB8PR04MB6972.eurprd04.prod.outlook.com (2603:10a6:10:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 02:28:03 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 02:28:03 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 1/3] usb: chipidea: udc: handle USB Error Interrupt if IOC not set
Date: Thu, 26 Sep 2024 10:29:04 +0800
Message-Id: <20240926022906.473319-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DB8PR04MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c6d12f-734c-40c1-e498-08dcddd2d8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1cC2SiYbiMQqJdlghGJWGNHY8VnoPpK1M6rj04oyTJ0UP/RWXZpX/QZTQMi6?=
 =?us-ascii?Q?MW3LI510ECrvgs6OAO6m+edvnCh8VcSe2WDlwYE9tyglMNoBTEfmhaJNnkh7?=
 =?us-ascii?Q?RvkyPQItjcFl+/45R5q87UYyrQ9aWHPeD2pY1AFR1YXi409Vpum4ov5PIZfe?=
 =?us-ascii?Q?MpyhHNRuav/Aq/olaXpPo0Go+x+5l+BSrMugGOBUYcbNjPp5SbUswqwyYAvv?=
 =?us-ascii?Q?1WyVzENyQjXnD7hFJPdQK0p73KAWRjkPB3U2z/M+gOnzJI9EQqG2Dyp7R2xe?=
 =?us-ascii?Q?vdQZXS/NvFAld66gutBAcI4X0UI3zrlkQdcgcawRNAhGqazea27L0Vtgjzqc?=
 =?us-ascii?Q?IYFy4xSUdxpEj8XqwpLytusfJL/9zDQkvwUdbrC+Aj0xsbPnjzITW6ozoscG?=
 =?us-ascii?Q?EfjpUJ6fpnfZsAllZsMpFRhWNHd1QISX7gzqH6UXjhMBHrR32fVO+VWTF+DU?=
 =?us-ascii?Q?Ad0iwtdAIQXhkOE2slUUfYY8y39tLlwauqZEervm4qa4+6AU9WB/3175dTAd?=
 =?us-ascii?Q?aT6xYlP3GK9RBD76wsiKDa4q7fNf9vfwhbbpF75UXjfYKz0+K+fBOKPTYwG2?=
 =?us-ascii?Q?5LRFjyDrGAhbTdo3S15F+K/0sR6Up6G+zxlDm01rrf3TahUrzUgE/Z07Uags?=
 =?us-ascii?Q?+RPTpheI0AonP96azKisUJjYGzIBnmqbz/Flt9ZRZahPJIg0mwdWW7BasQIA?=
 =?us-ascii?Q?FcQxcBw/QPtasEJnKsAZo+BN1+BSvMYmzv1yHa9SNEYjbeYdgti3ra9mqp6d?=
 =?us-ascii?Q?b6VHMglMmY9FNMPS7F0cbbBJiR9IyY8xhjEa2xv0aUIOTn8RuCD5AkP/4loo?=
 =?us-ascii?Q?v1SRToHGkZ1iGpiDIBMJQxu4SNgBYXNdKZb0iUs7QzkeD0qHDriCnKxfvAWi?=
 =?us-ascii?Q?uELvBQOjdP6VPqXOVAv7ztbaYvpTZKrk3HmkY14bxvv/3XN2tvmNqJIOoKy/?=
 =?us-ascii?Q?kMGfwYCx4aFcCGsG20wdt4IcHZCyBw5LmlJHEksHlXOMvEv8AIEcGUAF7vwe?=
 =?us-ascii?Q?+Q9RiFxPi3heemAEQnBz+UiqjrCqQ1i5Ys+WGnULp+XsRMjpCYjlDHSZJslV?=
 =?us-ascii?Q?AI8ullC52A+/2I5j74TXZ+S9E0sV6L6kWHII2sDys7vG6WVsj68obDr0fyDo?=
 =?us-ascii?Q?E6qGpOvuMI/iDoUx78eA9DdHVFArQf7xaaHZJCKgGABVk3spCq0XFO9pmkuL?=
 =?us-ascii?Q?wUMtA7J7aqyAY9FYv07mv7kH2WhJui50yPEBMkQsOJkdXEFposgFP5TzajCy?=
 =?us-ascii?Q?XvZedylVN1jPkj44ks1z51bgNpqmOdiQtjCfOHL9T3DIXtPnB5kgU4vqegjk?=
 =?us-ascii?Q?ryx+1McPoG7eTkrU4rf5Y0GQwvCAXGG5oep1DjFtJhskZoXRRZ0Hwngdp9/K?=
 =?us-ascii?Q?KxrsRLRhzWFuDd13qvlyfSrvhHPfu83sOa6cxzxzaiMq68Jz8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4FcC00tTIlAGAQ1NPCNYbOuC2mg4d7iHZjrUKBbuWhBjJW+kMraPX5wzOlM1?=
 =?us-ascii?Q?ZJjVO1WZ+95n17gQqk9hZOTcTFk7/wbXdIuuu4459eR871bQeE9bOwkZXcmj?=
 =?us-ascii?Q?CQ9jD8weKA5LCoVLQe0cGKcCBank0Fg/GFBjzE6zJfxPnw7dLCB96oI0FfHO?=
 =?us-ascii?Q?NkwJzivBj5jSGf2QqAcUwZS2AMrkKhO/HktpECjA5bTqeyaIJUUbyWPwmwEh?=
 =?us-ascii?Q?glvm8dz+2AbvNdEIKGM8WsSkc5JaSQ8Y021TZg30sVi+Z1v6AOLxx5eX78uz?=
 =?us-ascii?Q?n2C+Y28xrKXm6K8lo5aZ+RkJ7hlGIUuKdU3dCKBLtssyMFiTLNanmGmDustx?=
 =?us-ascii?Q?UUN2SXS3xdJ9H4n93vXk39w0FrcbtwaPpfrBm+WnFkx2qoj+9pJ1HeGNPpc/?=
 =?us-ascii?Q?BC8K47nmmNpWFX7+hU2E56kn6PA7cBuHZmB066OsTdXnig/dbysxMmFWOHBa?=
 =?us-ascii?Q?cjPh3kdCo0SI2QVQqJU4zDYFV9GS14ZyEjGkRvy9pKLdSd8a3pfHPyDErals?=
 =?us-ascii?Q?ySegkffhzkRcWPVw1nuDLoDsyw/wzMteuwTaSlFsXTNeKynmabqB5ndd5Yks?=
 =?us-ascii?Q?ELIi487beZ1pFWCJ/1ScpyrrTTf82dGp9eAHgj7Muv9jPvLDDTuPEqpQYlUF?=
 =?us-ascii?Q?zxJSkZlGYXZ58KOYgRvHR9TgzQM/q/g2HRwEvEBZ0quqdoewj4de23kNZGs5?=
 =?us-ascii?Q?VwU+6g+M6qgqO9p3eOGMkXjxxHryyTMBN0dk3xVCfx3v2R05VYINmKOwHdW4?=
 =?us-ascii?Q?NnaxQwK9SbuvnyXwUk0i+I0D8dKJ6KRN5Cr4MGzvh91r8WhSM6VEGt8c5CZo?=
 =?us-ascii?Q?vPazz22TGOmwQdZL3XXj5TvFFeiujqB25qyd2rzIe3YAf/EYalioA9E1kO/+?=
 =?us-ascii?Q?qCnt4wKrR33DbIGzyQJpMvbxIQTXoUx36gpKIupfpMAwK6Hly4/yrKmcAz+/?=
 =?us-ascii?Q?IicmU5LFPecznFY4AhGAo4QW+/ePboLaMP2I5eV7XsDLo0GfWX8Y8pS1WUyY?=
 =?us-ascii?Q?qV5Ar9HAi1nuQSlgH1oZVh+0tqzFsLKsbcq9KRf42ecTaV6BUjxvofag0N7x?=
 =?us-ascii?Q?ZWZKu+mXDy1TKoQyPPIT7CXwzF5FTUSJNEzNgN8N2eSs55nDVAN+RBzJdefC?=
 =?us-ascii?Q?3uoIOwwxBwFt/9zxUKI/e/CdO83FWlU3P8MfRq/lFIOZ8tSE+XVpT4zXw6JE?=
 =?us-ascii?Q?h/BiV5zaYs6LpxSj2F7G+Av5pmZMLJwiXPy3sqrP7CjFFyRu2pARAREHPW1h?=
 =?us-ascii?Q?OaZSweA0byE+vxyInY2quhabq/EtxSegLQwBqwmGcQ6AUhL9A8tLSRi084Z0?=
 =?us-ascii?Q?YTwJwcY2VUGk6NEOoRUFOg1amv4+RSMMYa92pnE0xX1jRl6u29xdv36Kthe2?=
 =?us-ascii?Q?RvhAzAgYCLfluFzh/0uqr7Q7hX2gWvff11FycVCa6VaLKzlQK3GqpvC/OOyT?=
 =?us-ascii?Q?b/FOJRnDXlfs1Qh94qcnoqavVdGn/2cuNv2R9yoqZZKDowIU9IqaJTKwW/7W?=
 =?us-ascii?Q?V0fFxXKU5THl3keFLiG3sxWMAY8ek1aN/AYGeFiwm+KqJQV0y7sFB6+mGpbZ?=
 =?us-ascii?Q?QJfIABJFmwE5nmejlIHHuFHvcJpARNYdSe4odoHz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c6d12f-734c-40c1-e498-08dcddd2d8c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 02:28:03.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ztblEs/0I/HZJ+8993X0uBo15MWYipybhpzUJh0W2/RH4feupr5TTmWR4gfl0BU3t9INvxsmXU57Glx+SQWFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972

As per USBSTS register description about UEI:

  When completion of a USB transaction results in an error condition, this
  bit is set by the Host/Device Controller. This bit is set along with the
  USBINT bit, if the TD on which the error interrupt occurred also had its
  interrupt on complete (IOC) bit set.

UI is set only when IOC set. Add checking UEI to fix miss call
isr_tr_complete_handler() when IOC have not set and transfer error happen.

Acked-by: Peter Chen <peter.chen@kernel.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify part commit message
 - add Ack-by tag
 - add fix tag and cc stable
Changes in v3:
 - remove fixes tag and stable maillist
---
 drivers/usb/chipidea/udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 69ef3cd8d4f8..b9ccf62e0a50 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2063,7 +2063,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
 			}
 		}
 
-		if (USBi_UI  & intr)
+		if ((USBi_UI | USBi_UEI) & intr)
 			isr_tr_complete_handler(ci);
 
 		if ((USBi_SLI & intr) && !(ci->suspended)) {
-- 
2.34.1


