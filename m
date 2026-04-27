Return-Path: <linux-usb+bounces-36505-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLdpO3oW72kQ6AAAu9opvQ
	(envelope-from <linux-usb+bounces-36505-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:55:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0246EA61
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FD3730073C1
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECBC397E9D;
	Mon, 27 Apr 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GBAtpcFg"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D3D2D9481;
	Mon, 27 Apr 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276532; cv=fail; b=D252deBeDgAQcDqQCsd8sOXPx2m/1fdVchT/T7FQJyNwSAgIy4XNo9vY3a6Xl5aN1hbv6avjoA8vlpzVry18EIQp8ofcnvFh1A/RpIf4H6nHi1nm62KFRzgm+5zbPp21KJbSffcG01K5+DVM3emEwhlzbouS40VJ2MUHNxsvK/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276532; c=relaxed/simple;
	bh=rq/xX2My4SLS/RG/3FsRwiImaDSmy6ezqSG5otH/NBw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PuDiEHB5rfBGZ34s2re3qTocrEZxFLw5gNee306KnhsE2mTWGANIKldPmSnSrkw9lYm1Y5rPy/PTZLSlLJm9GKagG28hB1u8/r7xSFno3StDOuko1zYT0fKg84chu9pfElXUVRofJcErIjsWlLnpF+fa2+TsXiH+ssSWf5mO89s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GBAtpcFg; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgD7jXhxCsh+i0ofK5qR/BqmGN5Or5TShAXqCcYObgY/etzi7aJQSbRXzQEIELy8cIxt2TVaYPJNWFLx3QQUzcIM3KG7q/cp7C/v+SCMsmqy1177Tu0n7KikE6boMm3Q7wySapDsd0Gf6Jrz1bkq7z+lvYhzyUuT32bySVoa9Ww1Euup+ETjFXH6sFVT4aW0kG4vKOnbrRQd9mQDBJMlCpv3u1SCut8/vS7TsbmNde4UTU0OBZanzLMRHUNzodWT49dFOIepMfRhHde/DUTsyfV3fRIZDp73ybZKFUhxNBndOsDUE6cj110jGZIO1akMfizmVHS+VeVoxAXXHX9IrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYOIlo8hKobbZ7K7c7sjh8zUuxW2gY5ldZTklNQYtak=;
 b=Jo3PEJAO7uHIkli7iga6MzkGVQvQs47USrWvj+vtg5hBpjS5DKM4JVcC6yXqQ9b+5yrSxFkNuKEcgNAvhKyL88yOqubGCNuzD9q+wzhWHA68NUDgLkA5/QisGb0sor6AZ2EDjVjX8rNkrYm0f8sQvRocra6UDJOOg7b2kCvKkb0KAaVguFBR4FOQjJZOJhj1bJcZ2CrB5H+eNZnUapMHX0wA8difEb17HovyFD4RmxElmdBooJDbVYRHBcNGP1e2UiPaZ3Ii7YRcqBLVfRB9oZPscvU0PoUJVckkwF+CFT/Y60CE/PYmGl9L0+7SD7AB63il2m0X9qz1CSDex8H+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYOIlo8hKobbZ7K7c7sjh8zUuxW2gY5ldZTklNQYtak=;
 b=GBAtpcFguvhQt5Ogj6kZp/ObGt2VwkZhRgBzeD3zWjsz19WgwmFlfdPyOxyi1jNQMGsxqi34xHzjRqXwMsA9UC67c8VIzee6TR/ShcNLt9OHDulLCGyNAVRLkGP7//tpfmZi3H0O94j+WgOxv8+4NR7Kx62gqmmnbU6CpUJC4cCu5hCBXpvSCAwvjtGswWbjIFcZKYEUJW7dyyAYAv3RcJrB46IqqEulAaPXBPoksf5t1PxPYEy2ih8LxchZ9Huj36525FulevkRj61FQMqPvyrTBWZMnssoNBFnYWCfOYDosnb+tOuoVYkKSVgx10O8cqKMjYHkjs1nijKad1sYHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9407.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Mon, 27 Apr
 2026 07:55:25 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 07:55:25 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v3] usb: chipidea: core: convert ci_role_switch to local variable
Date: Mon, 27 Apr 2026 15:57:55 +0800
Message-Id: <20260427075755.3611217-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d73ae04-6692-4f86-8c3c-08dea4325749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	VvYShwkhwkqcPB1CRqvtlaYRzj7I7N5yQeVCur8ewWZOK901tFPwMTJwBV+HcPeHUCYdhmW0B4XlSecGQfAsBISXLUMlkqzofPdfm7dxVerPQjXqXRCvy9X43A+OgnO0VSDSd4iQ8y74oea9ygHohE8tPRHMSNtiymVCshHI+RNpzhfrWifhrQXryxj4TPTeE8HCJ4NfkX2rsV0OPR03mClZWV/l1X9cklrw1xH7xmxN8SG20Kl4Il9ZgJ4GgbfZm0+9ll3BUzezXzjmDh5JZQZYvRPOcK4zyUuspWy9n4+ihi9Qp68JkE5j0HHTO9y2bYT04tCkVuSY/UoA8WKOD2J1qAsEakqNliTxnT65owhCXfHzixtlnABFMZSpjTfsR9LmJIXAFyKqNn5RWeHhxO6PzjVJaaP3zTg2betvFTM+Uj/T02Qqp43Sr1bBJqAYDGGMHYrRROLx7t+BS0MUy13yFLW7YqADbE+D4iEqdSPIV4iVdwB8MRX3pFP5s+u0ZYDD4QTGkXotfLtOipeXuiHOCr564bn8ymVZfrvuRIh6uo/f76DsFFF7ogP2e/PMfsd4M/cCpNj/GDmVs7JNxlxf83gC5Vf97Fep3F0oL8sLGTU64sOGm41n4PJ9dvgV6Ir2gpZTJMMxV6ATc3+TJI9sIHelTc3MInX4M5WVaWF9FwOHlAImfQ1hjgmH6BpAqu1Y11dbn3RI84moy9Jv6MCcF5Kje54VJI7uBdES8TS+bTQLhx0Y99u5DBvzO0RNBQyrJf1GfNt2OOoU3vEtcjyvfB8cnJl02GKfiG0TKtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nnThOAaNuOmW6kitC/L+Vdzesc3BC8W6vCh2ZatCt2luF376vs9essL9NXfr?=
 =?us-ascii?Q?8X2L1o7rNOl9ewaqKt7I1Y+Es8xGAollKjSZ4saSzoVnTdWQVNZqUo33+tGx?=
 =?us-ascii?Q?mFbfZKBquVkCv4BCnxRlChQ7ToQr1AqbS7kJBKfqNUP4A1KH6o5bEmqmWcVb?=
 =?us-ascii?Q?HfP1O2ZUCclxY7mWyBtp8xyhs+X9nw37dT7cVI5GCM5wA5yHXeEvETzcSrj6?=
 =?us-ascii?Q?lN2bebB4Tt4MzO6SMSALiV7zXm9X6PVQFzQZ2AuO06EzP2jX7M8uhl/JTdm9?=
 =?us-ascii?Q?pb+oQ0qy267GS/DrEdNxGeYId6musMUXYQZ44TLldziddnOQbCX4ydfj/t9p?=
 =?us-ascii?Q?KnbJWo45yCaEgRaD8exGh3eK2MHQ4If0C4jEmrg92V7uaoDHKodDaS9sbWPm?=
 =?us-ascii?Q?zH7QjZXWbWIGfWLnD+wrgkN2muHRwbOoIOgwGef+KJHCt9zaWYmof2/ezVwS?=
 =?us-ascii?Q?9jzuurFS/H8SU+fdqF9OKrylRn/OP7TCx+vofTymgk28P3Kj6T/ihh17ssoo?=
 =?us-ascii?Q?sYoUjAbLM6CsM/cWXC5AI6tlv4krmPu7jtEjwPaM8YKaqYOp3MKGwbuQBQYT?=
 =?us-ascii?Q?IFutD0CY6827hWbtaKIWzNusFaK/Yz04czbz/bDBj/yuMQncu4XayWpVHsx+?=
 =?us-ascii?Q?UoxfgIpzq1A24RXT4FM2M/jErKo5d1U6PgetEz/E1fj7rZ7BmijmlSAl7TVy?=
 =?us-ascii?Q?wC7wsCkoNiD5iIGsBesliUklMTNCBekPYm00AZxSE1nmwTJA+K0qA6VykMgb?=
 =?us-ascii?Q?ZliP2GOhqbN36IrVwgrUclIJWehiGNZnHeHv0wPb0QIdjVX+y2zuVvmKtpkz?=
 =?us-ascii?Q?UuQAUhBsmMRUoMSJIo3XExcVXgf01F0Q37zcpjdKq+Gl3w15No6s4Ob0n904?=
 =?us-ascii?Q?TkPGh84l5DCQSD2mYg2s6QQLLM+KJm8aY4Xp39siqPNbJatE1+74AwNM3Pf0?=
 =?us-ascii?Q?SMNAlA1RH8otLRxeg8xdLE/iGZj+RqpOkrR2mIwTUABd0mzCFrzBQFmfVq/8?=
 =?us-ascii?Q?Wt5KOYCQbTAflrSVifKwCGPAQanLC1J4ZAYGWNEGiad8ks+mnOJgGL78/uNw?=
 =?us-ascii?Q?cTCykAeGA3PRP0qls1stZUIx8SxVYsAuU02hDUDguZxziQPn3YOhDicYvWsa?=
 =?us-ascii?Q?wwIS+ppxwn7zUAXa8jleG0DY/J6AJgj8I4jXZ5sxiYeUpcBi61K1Xq/G2BSH?=
 =?us-ascii?Q?1fxyMr9FxfA+aQv0DxL5XqvSW9dXTf64AKf+f+Ar5EOvJycYJV3WY9/otDUa?=
 =?us-ascii?Q?8LnvNcbJYKNHZJ7ubgNx+WEFOu+Vl1tahX/xGqiA9LLvHlNTq54BjrFy8LJf?=
 =?us-ascii?Q?GSemDgchuI11ANZbnou0INzClX0Kzpp5YvcB6Xw8KJ5z5QZi3zTmOlE4A3o5?=
 =?us-ascii?Q?hLftxlr4bxJ7wlKWDBJLKwQI3ru8gN6DLOWum1QH4BC5KlJKYKTLa6H45lcN?=
 =?us-ascii?Q?Ql5Qak65zy7mxOD80jfYc57cyRawON/GO9W27zBwv9kb9mfQ8zEasbVBRBM2?=
 =?us-ascii?Q?wRtxZRyfJFR/QTjc/sydjHIqE1t9jqydWX/GvHTObKb2T9lEAoi387ma/YXo?=
 =?us-ascii?Q?I9nRcqJGQEVK8+gNtY9tqit7dAhJaO/MihuLTOXMIW3r1aGqHGFF2lX5DG6r?=
 =?us-ascii?Q?CJqnrjb+pbfM+LdVmptxEm68cOLsyYvnOp0kvJAuWhp3YWTjd9OF0yWAb/OS?=
 =?us-ascii?Q?mRyNjd7cgxEFbxJUNUsD52Iiu1KJZcOAAyswkH0COFzPuJL3MaxuhjSNPolo?=
 =?us-ascii?Q?fgbxG7RUXQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d73ae04-6692-4f86-8c3c-08dea4325749
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:55:25.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YfxTstKoUDzTFyY3y1bo5VIxeRKsRPSZDozxcg/f/gu5pUa7Xy0rEG7h328CRQylfN6fTzl/KfHJ7V8jzJCqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9407
X-Rspamd-Queue-Id: 66E0246EA61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36505-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]

When a system contains multiple USB controllers, the global ci_role_switch
variable may be overwritten by subsequent driver initialization code.

This can cause issues in the following cases:
 - The 2nd ci_hdrc_probe() sees ci_role_switch.fwnode as non-NULL even
   though the "usb-role-switch" property is not present for the controller.
 - When the ci_hdrc device is unbound and bound again, ci_role_switch
   fwnode will not be reassigned, and the old value will be used instead.

Convert ci_role_switch to a local variable to fix these issues.

Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")
Cc: stable@vger.kernel.org
Acked-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add R-b and A-b tag
Changes in v3:
 - no change
---
 drivers/usb/chipidea/core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 95d9db159ce8..07563be0013f 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -655,12 +655,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
 	return role;
 }
 
-static struct usb_role_switch_desc ci_role_switch = {
-	.set = ci_usb_role_switch_set,
-	.get = ci_usb_role_switch_get,
-	.allow_userspace_control = true,
-};
-
 static int ci_get_platdata(struct device *dev,
 		struct ci_hdrc_platform_data *platdata)
 {
@@ -787,9 +781,6 @@ static int ci_get_platdata(struct device *dev,
 			cable->connected = false;
 	}
 
-	if (device_property_read_bool(dev, "usb-role-switch"))
-		ci_role_switch.fwnode = dev->fwnode;
-
 	platdata->pctl = devm_pinctrl_get(dev);
 	if (!IS_ERR(platdata->pctl)) {
 		struct pinctrl_state *p;
@@ -1033,6 +1024,7 @@ ATTRIBUTE_GROUPS(ci);
 
 static int ci_hdrc_probe(struct platform_device *pdev)
 {
+	struct usb_role_switch_desc ci_role_switch = {};
 	struct device	*dev = &pdev->dev;
 	struct ci_hdrc	*ci;
 	struct resource	*res;
@@ -1179,7 +1171,11 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (ci_role_switch.fwnode) {
+	if (device_property_read_bool(dev, "usb-role-switch")) {
+		ci_role_switch.set = ci_usb_role_switch_set;
+		ci_role_switch.get = ci_usb_role_switch_get;
+		ci_role_switch.allow_userspace_control = true;
+		ci_role_switch.fwnode = dev_fwnode(dev);
 		ci_role_switch.driver_data = ci;
 		ci->role_switch = usb_role_switch_register(dev,
 					&ci_role_switch);
-- 
2.34.1


