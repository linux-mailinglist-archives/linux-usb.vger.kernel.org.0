Return-Path: <linux-usb+bounces-15267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 101E397D3CD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 11:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C51CF288621
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB42513B5B7;
	Fri, 20 Sep 2024 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fGgbxZBC"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E157E107
	for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726825209; cv=fail; b=W7sHfm9qEQo6cqYLnYAqsNaG8DX7/7iBZZc8bvilohxtBT9FCIy7HUE8WzbImd29FvgRzL+P2jUX6kYUlc8UMSqVDgk5KAn5PDs0PkWgVxHMrijL4Er2Fa/Lu+Q1oBFILiHkzW+doo8L8FMlfrq0xHimrwJr3qjwRr/6VEPmHzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726825209; c=relaxed/simple;
	bh=PsBpL2Z9SNYKc6A6j3pwtjZbyiOr9JcoEyybyqCXJ/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MOPjBnDkO4k6ChNqNrr0ubl28VP2UZJoj5lKDOKYzWmpAKLJcq+CZvnBeVsNGTosZuvIf7+hKjy3rne7Rb5U6XDtsuzu0V2oeVgyOz2OYKigwZBtSwy9eE5TmR2jwE19R741QNUxteyNd7LlJjnbZPJUL7qbHMntm+ZnBHK62/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fGgbxZBC; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkXYQ0rxY58jSdmBW/Ks4fzQE8100pNPwqqlxAyrUmYUZP+xoVtSatTHXyHq0oL77IO6BYMue1vyPwA53hXVCcioKMlKsY5k8PFP0vvw/xUWgxpC/yfeIn4FBl2CIQNjAc6Mt6b6IlgY47/58pN08RP2Cr5sMzpQPbYeEzkfOtGdXua9aGeWoLpu22Jrf1T2AuPYE4LUi/xEYin8qAd3yDkXjT3mm8/QyyCF5c8KnN2XPT5PTSokEaE+K2oFV+oRGqsRn3Lgj6mZVDnKCgv5tXEgfrgHa8llXL6YnUrh1RC2i+bsUdgDqfQ1ZYLdckojGllhIIrzaITjw80TuRhTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+VYpPTFjrsseXDgLUaFxm908ISxu2crss8cOzXTEdg=;
 b=yv6boroh6VNU5FJYX/NDZdVY9xj1C0yOVb3EIW8R6F/KPaUUdN6oW17aV2xYfrJFsF5io7qehbLlYFtJ9687gBuS5Hh4SBGGnfkA13f1WW7ljymqAEFViMyG171YE6hMj7jUf3mrf5JHUDAJugDHXpNF/vB1YsIsoX+ecr7RaguJq0NFgNIn136C41Hh+l//feRV95QMP59/p1OajrftmC9aoOAlFGcSHYPI3f72AJ2KaKQHXH0nhV5geGkhjreedl/js/MvrJDwSfs0B51eJl+GmXFN4yVtGAoQMSOPpbQyWITI1N9iDRn1RHCncUOSd6l+1kPugGdsHlx45uhavA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+VYpPTFjrsseXDgLUaFxm908ISxu2crss8cOzXTEdg=;
 b=fGgbxZBC01TDel7g6+MNCiT4fiIqporoweVkdfS1Lkt1DBz13SGj2EtyJvxueWUrqgyMwriwbQJ6beIMI6slwEfPkAZe/OaHSR4khupNm+Lo/zY/zOVWcjnYWexW+lAMR+FC7fGzTc0YBEXGcKtzt8Cks/uTWwykLRIyDyazV3cNPR8IrSbWTvw9z7Eu5aQvlYFiZmYdvQzsecI5AsrpfWF/3atFLMMAp3hUy06OnJR0gkUVaGpNucKMjAlZKsmMbEQa0FTkvcj94TKN0HpONs3qsZ2MymVM2J6LumTPqVBH8k0iFyTP1SGKmnbb4Sz7/dWvq/drT9JxfTlS+t0D2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:40:03 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 20 Sep 2024
 09:40:03 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 1/3] usb: chipidea: udc: handle USB Error Interrupt if IOC not set
Date: Fri, 20 Sep 2024 17:40:54 +0800
Message-Id: <20240920094056.2680590-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 8034cc37-15d7-40be-dd97-08dcd95833a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XCUVDl3Y0KPy6gTZK1e4BbHsMkNXvXLmCAl335qEafkLyNt4t2PX98FslG+S?=
 =?us-ascii?Q?ixwIZ9WpIOaPnGfR5+4v8n+9z4Kx6QX4lXqGS9BZ3s4uTcr78XjnBaorDCso?=
 =?us-ascii?Q?ufMBB8QfnbRHo7RafTDsxpsS5ZxC+CGiCGj7KV5Rwn7tdWNaTnASBWSsN2pd?=
 =?us-ascii?Q?FA8JCtP3n0wStdBAtGcGJXgYk2ZsIGZ6bpsee6YlxOihKc18qmnLEmfh2Wtb?=
 =?us-ascii?Q?RlsPv+kOuuAqCYLDHJvd6PMpQr+ObXIq5erp4awOVLkxssykyDT4bD2OPy4S?=
 =?us-ascii?Q?rmd+E1otgX4VvVp/gtJkgOAIJJjQ7M6o/0m8uV4uWdcxuKy9T+MixTcxLBQr?=
 =?us-ascii?Q?CLk8arYnYfNpWscoVVc8Qf4i3WhlOhSF4kkqVyGYWXCco7DQu+j5mk+vCPJP?=
 =?us-ascii?Q?IY2g23MI074D4Qr9v55n7blaUN5yGHpnUqsvsxeuaI18ikJyIc2gdRJEHstN?=
 =?us-ascii?Q?yFf9r+t6Xnb2DgzaZzSK38jxs0/3rQk6d68l9p66Cvft2bhduX7fpQZWd0vo?=
 =?us-ascii?Q?0xV78169oOuG7dB3D5XK2G8FmduDr/9m9ytnhGMp/nxI8OYmFEKOgzq6kDL8?=
 =?us-ascii?Q?dYtM/w/K9vf4P2tBYj92hgy7PtYin+byfRhm9c2XUyFGnX4nGekOobRLNhMG?=
 =?us-ascii?Q?L79xNP19kRYVO6UUrPhvYb1rRdjJmM6dUlU33R0WXLQfsL8G65tvlzpbNdXT?=
 =?us-ascii?Q?oE4+tcXswKFtqgGmlp+CcJ756hD2aBAOWYqly0CFZlYXmhucw7/cJMvBxqJi?=
 =?us-ascii?Q?QpGQiB6LqDJ6XNTnhv3jsslUSjRII1PUIREJ0bcS5lpXD5hbEzL86wA5EHDt?=
 =?us-ascii?Q?6fL66uwM0zxmJ+vPl6LsobJ/0SGBu/oeqPR4o5S4K5du0YUSF+JZt27DBlD3?=
 =?us-ascii?Q?VpRpiNwCmj0uA9AzIuA7TGJgFdH46rbvpCLtR4WuVIMxJBkYMSOZBRWV39B2?=
 =?us-ascii?Q?div/0r8fAVQE693HqbsY434DHSH1zuikwW8tZ+tRZtWUnP7vPqdF/aZuXRKI?=
 =?us-ascii?Q?c3XNTfnCc8OoHC2W9lEqONk9USc176eqb+zaoIvfyI/kBtqaTqF5Om+hvYub?=
 =?us-ascii?Q?hAx1VK+GpRXRwNE4OZNVeUrhAU+SdaXQSvdDcaQt1f+gdSE2W/fCTDsUxcFA?=
 =?us-ascii?Q?Ecri91w0XErDXFK6PukzANlHBd298P95axDS09zRRes27Coc31NVaLHRNFj4?=
 =?us-ascii?Q?qbV3qhh3wJ2l9+qK4QBbiffei79XxTNOpI1trU0qqeBbYM7IeoGSbgDoyQkj?=
 =?us-ascii?Q?riy497wFJYvFVuSsakg2F8Xih2nG2hoDjmBWt7nWaMSqNM5B3cKT0PPfPO/g?=
 =?us-ascii?Q?3OovuFhNW93406rr6NJ46Xi5zDBOHSeE22O+D+akgKFEN0e/lk8Q9LJ688BU?=
 =?us-ascii?Q?HC1qTK5cEPDf+Vkn2+FtMekgowFxPY4lNnq7lZpVm7Sonl1drQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MJJJgghTCt53B0O8RM0wMlzgsjJG5kwicOFCuDKfXtxXh1yUTuLO0Qj3n9Ir?=
 =?us-ascii?Q?1zLr3G62FPbpjPc1kCdc6AZgchsTGZlW12OK2OBjKI4wrTZuJKx8qBp4K10z?=
 =?us-ascii?Q?zB/lWV20Do2U5k1Ml/sCfsZu6G1VISkkTnOQGScEMAslGGE3cEpTfICNursz?=
 =?us-ascii?Q?mA89RMH57HS5zG1A7lrqwQO+0IcvO+sO3+Ateef8SWb7Xs7nI9C7Xqv/sUDn?=
 =?us-ascii?Q?mI40c37WF+ZSmtdc8Il1XCEGi1YnavN+4XKmJf1flVYOu9b11loz/crr6ClH?=
 =?us-ascii?Q?WL8Rku0fxOtIro8OIJj1r+692tGMXU9tf9o1KgL5esdeO7kvBqbIdnyoas+B?=
 =?us-ascii?Q?NOfB6tSZtl18dHDC2MFeEPXxwBCXFLIDr5FpWM8YKdvzHILZAMtCabVYmJB+?=
 =?us-ascii?Q?FvcjIke6P2mQFzOHdCbmYxOcGOLy0TizfJ91iAd5mbq91bw7tGTpn+g9LB0H?=
 =?us-ascii?Q?4Mk1gm9Brpn/P4ncA0aZQewx9I/BYbrP56F4HWk9fbcjJS9wgRMX2lDOhE8c?=
 =?us-ascii?Q?1v8fErvw+4ZJGfCbF6zS2PVlyLLUws2iwAOBf7y+/nacinrgbXvQChJSUUSd?=
 =?us-ascii?Q?VU6VvT4P1Q8rMw0wF2hpZGqCC9sE6Hi0X4dxcqvL6H5mnGI1pxeRK+h6hz/p?=
 =?us-ascii?Q?8/gQ9kXJoyIMdMM4hAgu49ZpPkUyG6c2/+tsj/yKYPrmqju7cdtgny0aam2B?=
 =?us-ascii?Q?Jc9RqQli0/TtpOCMDjnwbkFGeXZkvyPWFGoneTpdDFMls0vahjIhU8X1ag3n?=
 =?us-ascii?Q?rP0URIL3LmgyGx2xklx+LdUQRtK7ra0DdLvmN9/GKezZMi4jZ41Vt1/B3/Mi?=
 =?us-ascii?Q?/3JWYsXcZQzBD2UrigPUAZl+ELW7l798FYmkiZVN/6b6a8/HlOtL0PKTNoWU?=
 =?us-ascii?Q?U5RQUDu+yPprX8N5TGP+48SkWMI03srp/L34xKLVH4BXarAoOgjjo1yBkvLs?=
 =?us-ascii?Q?34VXfkP/52vlycxc91sCZduOWye1R6yILVKn+fZr8Il1vAVNl1uyHvUQHjAd?=
 =?us-ascii?Q?QdLPumuGxLf80prhushrsjHSsoyZ8iuyyoI0R+U7W2srxvcDueIEit8IW+ij?=
 =?us-ascii?Q?rIeoopspK5TNEUkQp5L0Du11swSWs8KxinvpTKbRdubFOEVkMier/aNpkVcv?=
 =?us-ascii?Q?WMKOfGZBTvXDX0iNBe7K4A69AhisJUmPzbgHS/k1V4tB6j/0iVGUwvoo2uSg?=
 =?us-ascii?Q?rdKzmGSZ/4U4rWZC8ctLH1QUc+y2Y5vvBButt1eAM8Yb7zbKsWIp5p6BbV3+?=
 =?us-ascii?Q?NavUCuTNXgWiOq/ijjBi1xUJWgyhlAmS3ZWOu0RqtkauqAHMG9yUe30+y3xl?=
 =?us-ascii?Q?Mp46ma0brc3mOVSe16ywrFp5Z4GArGl2fHoX8inZ6FgEMmQ/ezOTGuTiM07S?=
 =?us-ascii?Q?MmtwxfCzZla/fa+qpmp9Nk7qW/zrIO6k9a42jTmNoE9ctg7Xdik7BmF7rbbd?=
 =?us-ascii?Q?2/b0VII7b2IYuOFNOax1W63s3OlylxLuO27NxxAE+5u3SsAplFIY1yqM0D+I?=
 =?us-ascii?Q?gSFWygHTWK4B4rqxhRuI3rDVhav4zI4QrZ7xe6zoYqOB520aTR2KErJ8no+Z?=
 =?us-ascii?Q?1W1WB388iB6wPzzTYv0KivzPH948SbX+nsXnPUxj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8034cc37-15d7-40be-dd97-08dcd95833a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:40:03.2218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: big8yi1XP/Njvnq541znMQJHMHMvuO+mJ2MbC6Afoj5Myys9RZVLdyvUHkIL0ihYVjFZbW3OeM1IDsNBydBR8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

As per USBSTS register description about UEI:

  When completion of a USB transaction results in an error condition, this
  bit is set by the Host/Device Controller. This bit is set along with the
  USBINT bit, if the TD on which the error interrupt occurred also had its
  interrupt on complete (IOC) bit set.

UI is set only when IOC set. Add checking UEI to fix miss call
isr_tr_complete_handler() when IOC have not set and transfer error happen.

Fixes: 26c696c678c4 ("USB: Chipidea: rename struct ci13xxx variables from udc to ci")
Cc: stable@vger.kernel.org
Acked-by: Peter Chen <peter.chen@kernel.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify part commit message
 - add Ack-by tag
 - add fix tag and cc stable
---
 drivers/usb/chipidea/udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 95b697f08a76..e0092c735a75 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2215,7 +2215,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
 			}
 		}
 
-		if (USBi_UI  & intr)
+		if ((USBi_UI | USBi_UEI) & intr)
 			isr_tr_complete_handler(ci);
 
 		if ((USBi_SLI & intr) && !(ci->suspended)) {
-- 
2.34.1


