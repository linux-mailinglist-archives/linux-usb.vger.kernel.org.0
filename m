Return-Path: <linux-usb+bounces-35128-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN5kHpvNu2mXogIAu9opvQ
	(envelope-from <linux-usb+bounces-35128-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:19:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E42C95B7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9939C30B82A5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109F33859F1;
	Thu, 19 Mar 2026 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DkIddBhK"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2AA37F8A4;
	Thu, 19 Mar 2026 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914118; cv=fail; b=bFKVp3KxvEX0aZOlNGNYo73qCHA0abnWCpTHQmYJB66ICnHBNqGO8kjpiM6nAW73x9sVFKd2E7WE8KPRLtZvLEdLJd26Q3mh9xt4y2V8tMCBSfKDOB6HYXxzHuJ1ZzeM58h3f16lit/ALmXYTXshACxxjCvfkPL9MiTXoQxsl0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914118; c=relaxed/simple;
	bh=mcPSpezCZDBFMadoXQCvjjSemZpzOn/u/EflR+KGl9M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dNrkJDyi1iYX9fV96i3ONvT6Hy1VY+ROU4SzBZ9OYaY1aS6XXDktJwm1bpO+Wh9xvnTBWloVtD/53WHStOrlBz6pZPkFrWZoZPSgjdQQDWq/ftztgn/uurEMIdgPq65MmeqNjZn6OgaIP5JgjMl/k8pJZcqGMz9q1OMlc7T2dt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DkIddBhK; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSsbe0cxqYlNfJph6rSOO0G03stMs9+xTmAdR2G5pxP02g5zHXyQWo5mldJeTtaVHiBTlSDt+TVN1EJiTaI3FR3JAdRn1sh4VMKRU/9YIONdTP4zixmwDALr811ZleMsbdsUKjoAuE+N9fCGyjV5CAPBAqbLVkY+5CwbAAPvDOpW7m20C5F7nZXBoPgOBnjRKMBLHhAGQmM/V8kr3Ruknv3ULPmJVO1/r//EGE0q1UlnRYSRccVhq/xEQatiZ5y2F7kFXD9rpUrxtKd08laHmv3soiEv48pw9GEfr1pVIPPYlLCPpaw6lJoyoCIr3iDRHS4a0lXZQ85LvebkWaH4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22ibsRXyHNMfocPuWqnsEq7bURXD06VFnQtBNqvq3vo=;
 b=DSraHb1E4HKNo0y90XBhJ7OWsvLui1kJpREFUW8+ZIqr4bzuMHjtFLpy4zF+HM8qdd2APUfCBB531g42s1V+XLh5hcQlZKFwFr6FcolPbcZfMR9df/Q+VmtCXisbEd8gy1LkVShXYRKnAuuNethqyUce1IRvM57eHc863tZ4KC0E8npivsAADXdRBV8Crz6bXjnvdwpBwN4Kko/zp4Br5Hw+6/yyEuBs3jXjORZzTSfb5aQ402Dfb1bBp2HUOaiZkezdfjumFB+LX5xyp1xRBRhl4pVXXgaJSfX7yLNhrNChUHW/5/PNOxw8bKIQLCLoTIaSkIhh9udgy3bIPSp1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22ibsRXyHNMfocPuWqnsEq7bURXD06VFnQtBNqvq3vo=;
 b=DkIddBhK+sW/pba9g6cIYGWhlD/mCDzTEuPvT/8vnG6nWFthR9eaM1IC75573jTES3/FkIqOpMRcjLyyWP2IDU7W44vxtVNEs6OIsB2uPtf75LePFxzjxDwnQ/p8OqIEqAnK2T0eH/dvAfUJXigk7c9KpL/ByaDtPThAyP9Ot8iajdONsnJn6eAlSLPVaDuIxeKWgjAPy5IDcgRuP5q5cKWoHHOZbmxQtJcaadTzfs4Hu3FryZ288vE6LJR6sLnAVZhCVUbPsevjE5WoC8YgOnog/KySOb0c2QTLl6GKlWqizpla7CgXvfaFAQq7JXoSbuVAJ9U1yLR0Sa49rHC23g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB11057.eurprd04.prod.outlook.com (2603:10a6:102:48f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:55:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:55:05 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/2] usb: chipidea: core: fix device mode not work in non-lpm
Date: Thu, 19 Mar 2026 17:57:15 +0800
Message-Id: <20260319095716.634568-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:3:17::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB11057:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e4a09f-485e-4ee6-cf4a-08de859d98d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2KsU27yfl7oFjqx2OA9KIj4pyAtmX/L+FsvUh0nCCaxgXTS6f4ftvSirE3LR/6+IkX6rgQ+DkTV0BQeecZ8DvJHQx2bxmzSC6fjPqRjM1p4e8SzsUJYeTwjX/z21qOVZBotuiF8iowsVJnTom+podNrJJwweXpZzwKCeDFZGQa/kUpakiD2BZGz+mQ8SGr080/WyUBi4AkbPrjlkY9ZuNTuEVQMWEyLaP7Hx/xzqwDIUxJfmKhJ3JozaRfUXKDJRyaJzxm1SW0mAHUSgSSDrJKG/DCssCun/OJS0LQvrdf89dni14f4yN9wLejJQAKRHnxrgh6VWsRGVyBE9XcDNpStyyqdxER6xsuu1IVVxpGkw0uoBzn7AH3Mg29ii0xfI+d6BwMX+OJH08B0LX3BBkqJ6Wg3F37lBVNgGGXKqcEZ374zK7yxjI0fBUTHLcKzsicO7UDU9hY609s7134pRoNxu6kcJZGM/qpVTUx7ndSbsRQCjUVCqqfr/Iu4cr8rJ63TY4jrTHkn1GebfaaeKC9fuHpGBvfCTwWuM+EvWRmcngqVy4jv2mzv+oQQt33rl8hAKEH8vSbDUhWf3tTVDUhzO9PJPJfACyJrCSbUevGsMKrOMGo194oe+AxqpT8iMrq2E7kU1Ys7w/aPdeLzpLrEJkRhh4O5SoVSmYMADWZtTabJhwSW72y8YTEtF9baPHBnW3j5rCQy9V14GWNaTq6LSKOu5VJlpfnu+mUuVvbhuDa5ctwqZmAfQtS6jmeDiAR0Mc8hvkMzvcnt29eVVqWlI7qDzUFEWouuw/3OyVyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gw47VpYkn8ux9w3jgrxxoQRpoLmY9fEqMc40BhZ70We0DhKaYUCd8fjyY6jQ?=
 =?us-ascii?Q?VGHiqQyP3ybBx4QbsFfnIsP5V4W+HGjTkCEnOyMYDNTmqtBcMFrEbmPV0eYr?=
 =?us-ascii?Q?9UoHdP8JBvRCUcuKvz4mWo3QoN26zt0sbgSgbp2mgseADZtWR+pf+cq96Ilt?=
 =?us-ascii?Q?+QwCHo53WKxgbAPv25TiKPfE2hLcuE+ZWtqt+tul76GBEcBlxA7CsevUf8wN?=
 =?us-ascii?Q?/uIaZxCH51X59AY6WoZ52UEdsam9vdW5RR0Wbzv+nGRBfolp/AsAmuh2sdoZ?=
 =?us-ascii?Q?6fLekpIrSwqyBdHQDcq6Q2K73l0eMupqVLv+i+PenqAt5diFDoRAkSfaaEi6?=
 =?us-ascii?Q?x0KNyaK3LfbwZDGu6ZqGxancC/ykXyZowf0b7JJ35hiamv+np+BSrTWw6zCj?=
 =?us-ascii?Q?4xepr9YMwE6xufKMYzCaUlpPUs6H7OfYDITKIUr0HnUP+bEdveV9ym3NW93t?=
 =?us-ascii?Q?/D2/fru8c5PchSjRokXqZoZQb/5t7+WDAcSx9RrxIQK63tmpDmgeu/bHjygt?=
 =?us-ascii?Q?jem31bBleSZzOOZMSxHp1OgbIUP1rlntohixbyfeo8OLo6lndEmtph2bsjPC?=
 =?us-ascii?Q?BLjA9RkWAkA+9dovFtZZ93tRch8i/4fkZ2IDh9VzyDv+Vkrl3yICpOHL78ej?=
 =?us-ascii?Q?IDqSzbMJYbl4qET7ZNOXGuqmwVqnIGn9lhQvr9EmZWFBNv1Ho+aI/BYOiGgD?=
 =?us-ascii?Q?AyamQcQXbvLQfSXnM+iwoigXSgilKViC7ewxJtSBr1b7RYde8UZpI4eliVoq?=
 =?us-ascii?Q?uDg7dePHogiVF0WbfxS55W8q+8jhjoEvmLTyRNlcdv9AegRh/aEaBGyqf/Fc?=
 =?us-ascii?Q?mOaHqpR0iwMofMXN/eveCOsb8hWqqz3uFTHN3RQaKEUzFrSNke3QvI+TdYnv?=
 =?us-ascii?Q?eHKPEeHvUeNiaRUadoesdtXHxjx2L2K3GN2gF7JPe8VkJFCgxhR+K4GcGvPg?=
 =?us-ascii?Q?LmyZCIC+1Xzn5WZAO0tIZ3RJ51drf+cu+QRjKMPt30qEA44FCrNOdvRfbIW+?=
 =?us-ascii?Q?ZAjKVU8vYKNlJBIbOfA1jI0MGj2QMv7xi1Wvh/X5rDYGVl7irhLL84hYqyKU?=
 =?us-ascii?Q?r4Imw99bTUa7Z9ulnxm1TaY4EUKVLvp1NGwyb584/vR8+VnRWW65OJVioiYD?=
 =?us-ascii?Q?35F9tRMQnETLwzxyDUGpEAN42Wuxb5CxeWWqdubX4yAKs7GbpqSwjk37pcNO?=
 =?us-ascii?Q?eV+mSIH4GeT7D/PkWgmow//oCjDqvTCibfFfPo0yTibJm0iB5J3NugEnzk5w?=
 =?us-ascii?Q?DQy6X01Xc90brwDl53FHgiG8TZaBIPjcCb1YuAb8dXm3imi3tyRNee1aZm8+?=
 =?us-ascii?Q?oKNzSB6PaZLGKw5sP28wwRrHZXKVx4nlbdcKnemGKdZNeNsSZF67XSQvIl9Z?=
 =?us-ascii?Q?olPnnQy1WdTuZqIkz/vXOUwtL+O3eAjrypedGkMEWKKhyjBMbs3hTWubIQmU?=
 =?us-ascii?Q?NVsFilxAT/l0ycNX0G8Ie9vAuOmgthAejpS1A16EDFNEAT1Wk6fjqmeTP2tc?=
 =?us-ascii?Q?BuDfyE39NlU4eSBsU+Zq6kuiKtphNFeaU6np7I9XsHcaIsInQw/t9PI3u7Q1?=
 =?us-ascii?Q?DczXjRUIBfDYV/CY1GiF3pV7QknxVsbpQLZ3ttk8zySBLREgxhc+7mnuV84N?=
 =?us-ascii?Q?WfU60o5sQu/3g+wC6X/kZ14u1FyeLNg5hgnFVIvr4mNi5nPCiKDjJ5yyzAGy?=
 =?us-ascii?Q?gdMxnF5DPfFqjGAGeS1x5wHo7YRKihe2+cMDQvjjgEoDQTJJViTAEYztC2+4?=
 =?us-ascii?Q?17uYqrKhAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e4a09f-485e-4ee6-cf4a-08de859d98d7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:55:05.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvsHKB0o+BVBEHnT8PVpZU6fSNXqiwEq0Mo5kaVe+wNjansO+LaW9PbJRiTphvM/UQxNs+3Uv/wB8n9c0HdLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11057
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35128-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 933E42C95B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In current design, we expect 2 ci_irq() to handle ID and VBUS events in
usb role switch, like what ci_extcon_wakeup_int() does. Now we only call
ci_irq() once. However, this won't bring any issues in low power mode,
because ci_irq() just take the device out of low power mode, and then
ci_extcon_wakeup_int() will call ci_irq() twice. If the device is not in
suspend state, the device mode will not work properly because VBUS event
won'tbe handled (ID event has higher priority) at all.

Although 2 consecutive ci_irq() can work around the issue, do not do it
because ci_usb_role_switch_set() may or not be in low power context which
make the ci_irq() purpose not unique here. Because the final processing
is in ci_otg_work(), just directly queue an otg work. This also refine
the logic for more clarity and not set changed flag.

Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
Cc: stable@vger.kernel.org
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/core.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index fac11f20cf0a..1bd231a852a1 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -618,30 +618,22 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
 	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
 	struct ci_hdrc_cable *cable;
 
-	if (role == USB_ROLE_HOST) {
-		cable = &ci->platdata->id_extcon;
-		cable->changed = true;
+	cable = &ci->platdata->id_extcon;
+	if (role == USB_ROLE_HOST)
 		cable->connected = true;
-		cable = &ci->platdata->vbus_extcon;
-		cable->changed = true;
-		cable->connected = false;
-	} else if (role == USB_ROLE_DEVICE) {
-		cable = &ci->platdata->id_extcon;
-		cable->changed = true;
+	else
 		cable->connected = false;
-		cable = &ci->platdata->vbus_extcon;
-		cable->changed = true;
+
+	cable = &ci->platdata->vbus_extcon;
+	if (role == USB_ROLE_DEVICE)
 		cable->connected = true;
-	} else {
-		cable = &ci->platdata->id_extcon;
-		cable->changed = true;
-		cable->connected = false;
-		cable = &ci->platdata->vbus_extcon;
-		cable->changed = true;
+	else
 		cable->connected = false;
-	}
 
-	ci_irq(ci);
+	ci->id_event = true;
+	ci->b_sess_valid_event = true;
+	ci_otg_queue_work(ci);
+
 	return 0;
 }
 
-- 
2.34.1


