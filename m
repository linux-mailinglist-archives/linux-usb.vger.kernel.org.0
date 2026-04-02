Return-Path: <linux-usb+bounces-35837-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eE5DAEkXzmmnkgYAu9opvQ
	(envelope-from <linux-usb+bounces-35837-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:14:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C6A384FA1
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48CEA3095658
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 07:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1A83890E4;
	Thu,  2 Apr 2026 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c70cmzYR"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013049.outbound.protection.outlook.com [52.101.72.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3370137F734;
	Thu,  2 Apr 2026 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113982; cv=fail; b=mzir5pdR+/ynRs5ZOm5NXtcTKDMJZKPtZoScqNWUyBiNVgXxn6SszlKBWKkl8bcZ0Jp9BTSvcETrg3phn1Swb/1tDLiXBOgW89TuFGKVMljrmXEv1HFMa7CFsOLZqjYM3/Cr4a3TZ0ygvYvh2M1WrzQgSETXFtNfFoJ7hlW/HJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113982; c=relaxed/simple;
	bh=fIovWwFpOf/1JGCKUX17+pD8VkM+CA51G5jDA/1wXSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m6zbHkagNVe7qFjxQv2PGJbl/N8Xg1gFqsctSXA5YbixRKlnJ0+1M1eaxAYWDMYwlbFv8CYx6XkLJY2xHNS/EceIvIsTozmfdOIsS5IjciB0SmwqRtz8CMM9n3xMYXjiRVrr5p0PNekhTpP4DX0cFRfva7w+PtI+L+MO9duaguE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c70cmzYR; arc=fail smtp.client-ip=52.101.72.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2KLbtbUB+N/eg3xfd+WyBKfX6wfB+q/loAsAmw+SG4S7oQZrrVHoEz7Liv7d6Oe0fS49rJsPLreqR2pFZE9EOqDcvt2ViLGyw0hNwtXXUkdqf3QXO0bYTNqpt8VhmguTAc9k7K2MHTpDAfkap7Qjx3cXa1XhZ3ROzNaCtIybGLTiuRMlSmsVZ21Fa31WchbOz1WS/DuqqzZLqEMDenkwKDzMW5QLSrn11x4qYLQbXyxicRTJ/MsyHAPL/q+msBCcE0aP3qKyG8ZTtenB1BkmBA+ZgaX2FcxU+Z4rEKX6Q177w3FcVbd5/opVDr5lSH6w6qV+Tfwq5UfS5QbtDEuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nrb95crwNKc8DosAcc3uSv4YudSuSK52V7bqimP85HI=;
 b=SUAmh0YN0c4dvre+OcDX/MBP5H13J/ero6w0eyV1vFmElFfly5uX+7XAIxXni0XE1QrWd8s4Fa3H47EeXZnPBiqWvoqzzvBGsDMcNHgrX3IZQuZ+z2GcxF0c9GN7RpY5C6R1nPDVxJPI0JQSwLT218fKEd2dGLUmjTheIOe2lXuxhzZk9MHaNBGAnuh6zJNwwpBxlfIZIh2fYdv7iOAZY9oU6gkmyKCmtk1NYbhJHGQrtC2BI7R0GF6N7ID+mdsnnIAawGwXl5RJg/RpU15tlv5INJsXWRNgc57eHdbx1UzDLkDLuch5nsblyb92eb7HWHYt34c/ClDOrO7RSDJU3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nrb95crwNKc8DosAcc3uSv4YudSuSK52V7bqimP85HI=;
 b=c70cmzYRgZB9o6zVuNxFo3DbAHoSV5pj4u56ImnHZsFqHh+tsxY0tt16Kp6aDxO0QkfnQlKZyxTuigitI6UzMCkeCIgQEXJqzpJpSGbFyQ1gbIcwDbBCr7yTuhJteUpElOpQ2O4MfitxczttORh7YfYSh9+Ex0/RtZkFriIsyBjm85c0zrZTQ0wEuxkHzoD+G/4s3rpbmFXShElKzGUkS21d1kXIS63Pui0ukrZm0vPkICuRrKne+caZFEJA1nuKQcVZhBQk1o9F50TVYTJz5VEDdUMURoSzqj6zkSb1ZlvR5uuZZVf8d75+HRLGHaT3KwjWYcpQ41xMqygAq/9Y1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8761.eurprd04.prod.outlook.com (2603:10a6:20b:408::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 07:12:58 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 07:12:58 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 3/3] usb: chipidea: otg: not wait vbus drop if use role_switch
Date: Thu,  2 Apr 2026 15:14:57 +0800
Message-Id: <20260402071457.2516021-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402071457.2516021-1-xu.yang_2@nxp.com>
References: <20260402071457.2516021-1-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 078223ae-924d-4047-2f25-08de9087447b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	OBCA4cvyJF5loajxF4h56Zn673phPyorOxOt6YmDiuyjy+iP4N1Su88sUhLslm9Sba+g3BSqPXwmfT4g4QGygYxyhslq9PxYH4W/yVpuvLUU2ut5/V+EBl+iVeBFh1tZrN+hd3Oa7YuaE4Z9sX0rw4BXht1pTLOG5dzCclnQZYT+c3BJL6NWnVvC4mUTAh/pFOR4h3mmvoue4SRnbUQX/KoA02CNXeVrrAE0tD55hnwNlZ0XXMfIzTLLAN5WYrgnjuvgmOr3goLnd5uBf26bU0fPrVmVgrPO7tjxJ1K5+/v2el46mcfwjxmDPhRmLsOx5woYvZEX5h5ezjuTxRL6okn/B5xgHe7RF2wn8O2HBvy4CXSwflr8o4eWAzOru8qYgPZ0OVG9tjdqnO/E/YjcvBJvl4eCRY6t8H1iWEmLg+OtvcTM3kJDlhTxVoO+4SNPy3eZssil1YI8woQttCNJHXAXMRJXotfi8lowq8NPHplw9+BcC7orZeYrBvBwg/i2AovzUGOJv19DwwRyD7cnSMl3rZRhY2+u/BORR+Zy7xHdh8OpVMeqPj+jt4kPAbWiCRR3LL0MdnlxQ889EqSoFs1w0JNwEb1xwZ5v/HtK6RdjgQXd3QL5STfvCS8ZbKxHP2p8r3qKcut71LUpw/GqUUkAWlMKADO2RwypWGSIDczYyHYugfNme5ljUOQdz1+3MLckWXN3zTqOFl1i+FgdArHqtgxz2yqXUEqxPYKLqvYMoC5MJJrKeJuf9Iao35alZk+yX4A1pU6qpGSQ/FsOtPM3oqLsAC9ojQ0AqevC0Kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4nFP7IqkY5DUnaSJMaInzfUCP3kS5T8xJndvKmhNnjxbC99iONB8zM/R9cbZ?=
 =?us-ascii?Q?b/ja7BXtWKlkrgOjlh+XvakIyi2K3h51/V3/89UxHXuDFAeSfILMH1iC1O7M?=
 =?us-ascii?Q?gVZZQmI9V0WMH85C8HuTQ/RRbt/vSQMPPDLqAa0HqXQi0AIuu4P38OGQWm/3?=
 =?us-ascii?Q?uFz/WuBrM/mBeddVTDWeGROY8UZsHp8KJonHUw8iWwl5VyxvVoG3u+IL/BI1?=
 =?us-ascii?Q?8WqEEbDiFlduRUhZMeRPPMe/qdghPnbRaw8gSuKsRWlruPz+j4K7JAiqSTkV?=
 =?us-ascii?Q?HEIrLQdhZTu37VPg6eTiNgDe5VE8fYa+vJUwlR0d8QwMMSAGisiJT9/WC/vo?=
 =?us-ascii?Q?QuXai/7Tyl89BbtLnSS3zhQfDYYQRK7IIrPyVMC+YhQtnpOfBnL88M+S5n9/?=
 =?us-ascii?Q?xHWo9XsV0gPyhHRNU+HbgCF2aB80hagCckDbYZ6ykT825gkkC11eDbCgqxmq?=
 =?us-ascii?Q?aMvQPoqOdUBXn27SPZlcQEy8vTJgiWG+qEVZ/tqMzq7AeS59N+ye5/IWBQ4Z?=
 =?us-ascii?Q?U4SSMExtfBtx6ZPiXL+6d1Uds2MlLaKept8a8t3Let79V2Rky0YHlRo2pUoC?=
 =?us-ascii?Q?OVHsaXhKDKi5QbWFbifXrlwHNLw6M367yqhwY9/fY0N7pXXNi2/pyRcJ9Iye?=
 =?us-ascii?Q?oxc9fUih6ZR6hprhRWHlTuLIrOLaIhPR7j9O54qk3srPD0RWG1rcF6MsPvFR?=
 =?us-ascii?Q?06dkA8LQ9vx1RhIsNIuxMycVuaDOH17eck13JELdN4L4sMNYK4p7kKdyNskD?=
 =?us-ascii?Q?ke+e/lfdsuuxTqSBUB+n+r4YmaUVIv2YaVlrzCWiDIEgnaYrfnbgDJUT3HzB?=
 =?us-ascii?Q?1wFrSEbj/ftFcSq636AGlGJ0rWZRMSKT5yjkOg6L7q/F0ke3fRyOtvgFkZnM?=
 =?us-ascii?Q?y+MAuC9rYj6Lu3DJYgRl03c+Wy7NEmWhsXGz07B5c18dHnb8jgK1Ju1il5So?=
 =?us-ascii?Q?gNgeTD3fL0MDQ0DN/q7oWnE+L4WZZ8nH458hPdJ60lzYtLCGbxluPlPouWUa?=
 =?us-ascii?Q?LGSDI1Cteg1y62a0RYRpw/jb4AO4N0JLb2MqC+BhWb4aw9l3pvFprGnup/u7?=
 =?us-ascii?Q?b7nnx9CmwQhT8TNk3IePSfyKv2IiinPS5VR2oGk2VPDu0TfCFn9+eVg2ZXMK?=
 =?us-ascii?Q?7/elkrpZLk2k2avQUC/vrqf7VwzCyc84YwlrOuiMOMP690wt3DwF+RgGirdt?=
 =?us-ascii?Q?H6xjqddxwsI3E+lKT37xvqokEBQp27+yG4pHRVnAy1ntvO5+BDaGdgUhRKlh?=
 =?us-ascii?Q?XsdB9KQ5VS2/nV7Sa5pdATy7dzWt+rd0Gen7n1D3Cf3aMO1Ds7VF97UpHObJ?=
 =?us-ascii?Q?wRZEtI1ljU6ZARXYRkwN5yysYcGzvxWKCMcLKpmxmIR1sq9je0zbUw9rPfZq?=
 =?us-ascii?Q?hV7HXAsfL4jQj1I8C9OQrBQfpOfrjyHRYwGWBa4ovzyrzuwLpY5E3MklWQgs?=
 =?us-ascii?Q?ctnFuxKJFuTh8TUOwZLpCoI1dxI6Lsj20BoT7PSCE/IoyFzSNdkuMQDatG2J?=
 =?us-ascii?Q?W8euOThNfZA/5E3mjZki6f61+b0m5skiE3ZL0DRQdXPZIW9RnxdIub29r5Vi?=
 =?us-ascii?Q?lVg/kZD+2/Wh7gWx/TjoP2VatNKbF9W9DKslTbTcqzGJ4urvqsDScaLOYeXU?=
 =?us-ascii?Q?hzyieFKG5y1spe7+WmbYuBaEdWeUyDYYWxnHu46W2AiYxHf4p3aTG+VWO+56?=
 =?us-ascii?Q?brunpiZplkAfIWEOX1WmHchTZgjPXKgN0LXzNbt02Tqq4hvawc1zJuGucxvg?=
 =?us-ascii?Q?VSfGNw/YUQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078223ae-924d-4047-2f25-08de9087447b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:12:58.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzrSqxA8JM/wfOw6e32p+zNwzsYiPMIDbxMnYD0yhHxJnoMjNsOE1wOKFGv08dy8mR3dC32ocTnoWeeJd+OU5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8761
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35837-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67C6A384FA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The usb role switch will update ID and VBUS states at the same time, and
vbus will not drop when execute data role swap in Type-C usecase. So lets
not wait vbus drop in usb role switch case too.

Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
Cc: stable@vger.kernel.org
Acked-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add Ack by tag
---
 drivers/usb/chipidea/otg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index def933b73a90..fecc7d7e2f0d 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -190,8 +190,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
 
 		ci_role_stop(ci);
 
-		if (role == CI_ROLE_GADGET &&
-				IS_ERR(ci->platdata->vbus_extcon.edev))
+		if (role == CI_ROLE_GADGET && !ci->role_switch &&
+		    IS_ERR(ci->platdata->vbus_extcon.edev))
 			/*
 			 * Wait vbus lower than OTGSC_BSV before connecting
 			 * to host. If connecting status is from an external
-- 
2.34.1


