Return-Path: <linux-usb+bounces-35835-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIiUCBgZzmmnkgYAu9opvQ
	(envelope-from <linux-usb+bounces-35835-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:22:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1214B3850FE
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E4D830B6519
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 07:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18043876BB;
	Thu,  2 Apr 2026 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AQs2nF+E"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CA37F734;
	Thu,  2 Apr 2026 07:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113977; cv=fail; b=RGselETDC4wUwjJRc+E2h/dALsSpiIIf1xpbjxP16Qlgw/mPBvvWRFMCaPSYCezwu1L+P7mIRpvvEHtLaenPua8c0PM4+dBekLjCqO8O273/Wv9zwL1THDb50HDwNhOQ9MZzahuM8RSYg+OqHmtnUz3tQX3XKyBjgEhgOSSy350=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113977; c=relaxed/simple;
	bh=QQjMK0ZSYxcsSkSF/vk3yamBgsjzcmWbIkNH2Ag8jqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Vl0gHBlyzlBcE3Y2LiIDEfpiBF42wMkdU+Bj2ul4lNW9R2I4D+ZfoM+b+ewEzcfEifXnbrOarJ3hEDLtNpkKkFZyU8hleMQzQDB47R3AdMx5Wv6MXjVC6RDNOm8KNSCRxCxLgmZOnfGJpFLlZEy5jV4W6HN8sYcgIYwjDTgXdiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AQs2nF+E; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hjf6KAV2XTpAQ00FX/AvP4dRU07duM/8OeYYKHB/vuSP+cg8PtUEOfu6pNYKkBLpoZU48/GAwvP0EI1X4X1wOuWrQ7y9LnZLBBhz4krjv3K/mbJDjhtIlPrN0o2rhH2Wk9C9snjLTv5xmaOrpSAquYuNtw8/2QbU6e2AavQ3yVDg0JHIO2KsnIUIPVPqrxPJW/WjmfHRPH8dufxL96x106rxb/HuTDbFMmfJBcsBtk2yydK/bl/TLvLyG27TY1MEeKOCaQoBwCkgx/q7Y6vD1eMeo+dF0v8yhaJH9op3tAurr+zmxH0V709saH+P1kuUvhidaEey2dsgXSX48Bp67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vad8mlMw1L9TzdqP8ZggxBGw4ooDYABHxlIioYHhFjI=;
 b=MWexs/luPSGL0JF7saCjmvWwSAV9s3p99b1UYxEljZ9pKEi7B38Bzf1ewHtojD/JNEYqR5FQgU6ktIUVNnEqq5yHiSePG12MQCBZ7mh4AK9CQ4BsPBFVLFbs4gBP+yb+MF9yub1Ski5h8Bn5gkWQw4unlrOMZi+DMyIdnAJbtj+fhzO+Nwrf+c3rSNmnOEf8z7aVhnNZ7SBekCEVJaxrbUYgAFw3C6ycGfd+zCI2HU2gpnZOoMfnbUrJicsMpUzGcrNb2QOD4Dc+wKLyU8/FGL2iuRxcZPaSkC8E8KX3OxrVBUPn8jntuxtyKfx7mEGg1NNE7LU+lkgjZ9q4TKVDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vad8mlMw1L9TzdqP8ZggxBGw4ooDYABHxlIioYHhFjI=;
 b=AQs2nF+E506fIZSCRQpytPK9f5gx0ZaOxBxfjS9cyGwr3MOzIrIuQbf7bT3Fex8yiJZshslePenyb83/hgTTB0u9/c96PkqM3rfjX+9Os9TvJ3Xs+0CUf3mtvaEGwWv+JQavsGKLJOQet19chl3jKpbrIEAypcchN2f+kSAgB/8GlsLTUfq9yfoRA9i5cYxsTTcbjZL0eSgZnc98VGME9TkWeYjVejCksc/l4ZS6V2UaSUOfGp+IY2kVo6rZG6rOuXBV3DqK+Jby6gZpxIhM60n+Jq3NHhXXNyhG3oX+3PYee9IrOfkdnAKHlAbv34sS9OTbKSqfS1/r7lAXATJ7+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8761.eurprd04.prod.outlook.com (2603:10a6:20b:408::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 07:12:52 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 07:12:51 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/3] usb: chipidea: core: refactor ci_usb_role_switch_set()
Date: Thu,  2 Apr 2026 15:14:55 +0800
Message-Id: <20260402071457.2516021-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 31798d12-e1f2-4ac4-083c-08de90874097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	TJx+qrHz+UVndAxKNIbKJYTtu9v/YjNhj+KXOzCsMkPs+94NMCt7w8zw1AvKSuJ/sqWusVcY9VUZJLH1a+KQIquLuUp59gOh539hHUw0QRyibMfkaxwgYLOxWLP7MwV3xvCc/BZqZlc3FPxavrVv60Qn1kqdz4cNF/LOE7Aw8o+3v9ofE/T3tLQEZkcPJFMAij9p2bQkybASYXoxE8Wuxl2B2xxzGnm0vrmZzfo5SycTKecDwb/O7H80bzVWJJ14z751mRjF/1w/Tn/bHgCD7jOYRSqVlNxxt79QwPzmGYSDMDGRKtv3t4XpMXuvFNWNXIlvuVdqYqeFvQ60ucJEsO4TPI0Y8L+PnFQ+ekzbeF01sg8+++3nNnCa4IHnZp9GKeaEA1TaDikNm2PUY1/5Ar5cRa3AijO4x+94v5Wmml6iNOXVB7aGEL2cWUXebkgJxblsBsIz6FA5reIJcLnM5yN8nKEre/+khVq0RV46Cqkao32fwlhfQi1EIFulb6mO33YRpKkbeujRTLofG7m/vSS9mymTGi1iIj0czuJnvQXnzZwzLHuX+UH/CjQqP3f/O94dCptxgtbifDFqrjoHg0DZRsyygC49lnOLsOCLNBu+ytm0/SfxKdmhGaDx4QgEvGFnTWdZM5VdS3xemzufBLANR9MYYiLLfTKV204VvHUm+7ucQnfjKv5PGn4JDddSmRI07U+W3cYb6/QxFghhLNoJ5Ml2BThFly6HaATyOnDYX8Auwk8Mlg8ECs/Se0SFQhnlZ/gdV9XK04Rv5lTGi2lmfORrWefqEElaBz3eXiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?prybQWsGlyVSG+A8E//NfcKy+3gNLs1tVQKhhGvxJnzF/tOz62KDrajrkDQw?=
 =?us-ascii?Q?aYI9yP6ZpJ87xG4dA9l99lEP4aoTUvVgMOqCdAbTcVunQmH+hNdYZos5v8u9?=
 =?us-ascii?Q?jpWg4FX0tmljYLP+ANcHZFN3bEJrLSUM2jzazBs1SyVz6ZVBUlLcOcei2eh/?=
 =?us-ascii?Q?wgFlsG9UcbptfkcbCRtfkz06Qr3WeuexIufYz5JCjYI2cZzUq4AxDm7Y7IHw?=
 =?us-ascii?Q?3wkk7nBFFLOZqKskzbsoKknnzyiw8UA+pIJban6FANX4pPLJvm5h7v+XJsS+?=
 =?us-ascii?Q?T+HXX9p8eZmekT0yXlYM/d9NSdrQh5xC7X1iP6E7AAj3jJ07g8E3JNedokGr?=
 =?us-ascii?Q?yBu1hqIQSHzmLCLHaxYvDUAfwoFzTTtdsop9iSpD7VtjHYVw51LvX1QDLSjT?=
 =?us-ascii?Q?djR5F3LDVEOS+E0NMEiTq4Q5mEDg+gVMg2Jcj43lQYZHkJ2s6OciuMS7Felh?=
 =?us-ascii?Q?CAVzdfNKmCiUCyX+N3WvzOkYi8gCNk7Ds+0B1aw3jQi26SSdVHnB7nq6q84y?=
 =?us-ascii?Q?zY+yZ7zzPGsZjGU7puseY1n1tylMvpu/jqbUR+gPH2pHjbwsdwwKWOmDNXZH?=
 =?us-ascii?Q?4NyQ5GqCrk3l3KjKWpmgTxZVWyT2wWDtqTdlyMmaLYEhypQYh8wlh1TySA5C?=
 =?us-ascii?Q?a8GxZ6HEoT/KwAMpUhCDEQKcU4JaITTmDQiocBatPGoapSfgWj7oM9zGzk/M?=
 =?us-ascii?Q?xsfXsQ3vsosNw2BH/J+oHxPy1pMByYUCtembJR9mSg7+/Q26UGvuSXrQ0TPs?=
 =?us-ascii?Q?qZIgGBaqD1HAnyvbpoBdyJ/UY+kWsjecIHbt3WnyDVKruUeoc1bRfZMPeYmx?=
 =?us-ascii?Q?ZtghMABO4/fVpxp91pW1b1ZLCuWxk+q33umO6yYhBPE33wfypphlTMQm00aT?=
 =?us-ascii?Q?yjsGEraQpHSzvY+iL+ML7y5Iv3Gd8JzLIaLwnSRY4OZeuHgzK+OrOblbRVIe?=
 =?us-ascii?Q?FQ9HYGurTCK4nwocoyT2o1re9D6LEFCkUh2CsY9JfZqZLkkoMsvKuONtBMzz?=
 =?us-ascii?Q?mgf22mjzuaBq6NQ5fBhx6wCM2advIeSnMF2P+OqQE9/al1VrJ2v78GJGc5Oh?=
 =?us-ascii?Q?RtGquNmyJabGBzDHkwRs1WBTlYPy2MqwCir3ph+lun6sL7eEC3nByusLNqTM?=
 =?us-ascii?Q?lzo3frmHAhVv5gMxs29QNei51IhMsOc9KswpEbu8PCbReO04mXkV/EPd6vaR?=
 =?us-ascii?Q?8GCfvtdgBLuBbEkscsfDcBUJjlxGppnSGkor61PfcWTOkI8paq/vch4nEQiP?=
 =?us-ascii?Q?cFNIjHszGWa440DHoTgOsm+VAh3rIGrvmaR2XDczpcyfUyPBSNkHv2Oe32Xz?=
 =?us-ascii?Q?dy689ufEPHwSj9NN2ZFf4Y8b26WCgqxdmFQI6oeeNXFz1hzmyP5RUGyXPrw1?=
 =?us-ascii?Q?VYW/Dhf4Rw8fjQCBqKehMIbVsCxg6PLAM529+2m2WfBz4YG1xbbKdNcIUvpJ?=
 =?us-ascii?Q?uXX3JpRwhu+39dWk9oW6INm10kWrsLVrIc6bRx1TwgcWQcz8SVoBRt/nfRm/?=
 =?us-ascii?Q?EwMOLeMXfcucgDf7qcL1VLM/l33iimgtvxWztkiFEfm7Ao/Txj2+O4XyT3EV?=
 =?us-ascii?Q?VtCBWQVr5dJWZqueEGbchxWn3UySI4PKOyeLOa1rjjejlj3Hygr5D4PxgJfL?=
 =?us-ascii?Q?F9yrRj98kQo3gP1SKMk+++Nn4n29JrlXJRXK+Axu0TRAQlnTC4RXNeYR3X5X?=
 =?us-ascii?Q?KAWdm0wtDFXQ9yHYj6fSoPERKswca32I+Zym25UXT7X80ik7tTvFoMDw9Nbm?=
 =?us-ascii?Q?L1ywsI+CjQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31798d12-e1f2-4ac4-083c-08de90874097
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:12:51.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STKDBajbUxMMxOZoph/J4ZtupMqdgvrVEVpgzIVtieQt/fHy2dUl/CmT6fo67n47DkwE8v9LOLUOoL0t7avUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8761
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
	TAGGED_FROM(0.00)[bounces-35835-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 1214B3850FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current code is redundant, refactor the code, no function change.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 drivers/usb/chipidea/core.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index fac11f20cf0a..87be716dff3e 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -618,28 +618,13 @@ static int ci_usb_role_switch_set(struct usb_role_switch *sw,
 	struct ci_hdrc *ci = usb_role_switch_get_drvdata(sw);
 	struct ci_hdrc_cable *cable;
 
-	if (role == USB_ROLE_HOST) {
-		cable = &ci->platdata->id_extcon;
-		cable->changed = true;
-		cable->connected = true;
-		cable = &ci->platdata->vbus_extcon;
-		cable->changed = true;
-		cable->connected = false;
-	} else if (role == USB_ROLE_DEVICE) {
-		cable = &ci->platdata->id_extcon;
-		cable->changed = true;
-		cable->connected = false;
-		cable = &ci->platdata->vbus_extcon;
-		cable->changed = true;
-		cable->connected = true;
-	} else {
-		cable = &ci->platdata->id_extcon;
-		cable->changed = true;
-		cable->connected = false;
-		cable = &ci->platdata->vbus_extcon;
-		cable->changed = true;
-		cable->connected = false;
-	}
+	cable = &ci->platdata->id_extcon;
+	cable->changed = true;
+	cable->connected = (role == USB_ROLE_HOST);
+
+	cable = &ci->platdata->vbus_extcon;
+	cable->changed = true;
+	cable->connected = (role == USB_ROLE_DEVICE);
 
 	ci_irq(ci);
 	return 0;
-- 
2.34.1


