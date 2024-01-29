Return-Path: <linux-usb+bounces-5592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540A8401BD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 10:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5DF6B218E6
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 09:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0232257867;
	Mon, 29 Jan 2024 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Un2Hn0v3"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0D856B67
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706520678; cv=fail; b=NCYpBOuwaTmjYKvySjw1ULZnxb7RTeguwGWvXlAbP1FCvMExQyY3vh0o0YHwE+uLcw22gyPn6nLcs1AKsMUSU/uuYRve1pw6taVIkARhO/MRs6D3RShy2RaoXCgMikiTAi/OwotQyWiyusPO3jwODxlFDrXbL5FSze7+q/scMic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706520678; c=relaxed/simple;
	bh=EQiP55PNAY5d/5UnqZD8Yu8ZCLyvPOKQ/TkoG+QHOVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ctWbCytXRYfrL9XRng/iInGcFBIKFWoKhMycrTM/1pfHuF2EI8aonLOJR4AVCYeKvSUgwBEOEDi8bpFJv3uQiGdibgSLydgMfFDQLqg8K4og+JIcuG+vgKtrusZ07C2POL4Kvy2q4KiNj0QSIF4zl5pbxBkzVRFPDN2VV4VDJuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Un2Hn0v3; arc=fail smtp.client-ip=40.107.104.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrqBpIDjmS7olOx4aQ1H4d2S+cJ9S35zd3h2WW/exEDKPEgSMce2qTRaTD36QCaF3lnpYNQEQGvM00qr8aHYsOwJGaamDFtONGqP60obyhcOaBYqTpb9MR8fclPIpsHv2MdX5F3pb1f6/s45SzCsWr23rZKRfZSSeLEirlrfnFRo3uI5jwnOLFsakQqa3GI7asUHuKQrPJSCamuT906jQVxyDpAEEfva4+hcbc183pGnYYzFwTjVngqDi7A2f23SLAZU8Xc9hn6O6NLOKavG+ga9mRGclOta1v0cxnydh+chV5QpLDg8K3bzkIYSJMK8yCVBQgWRAw61v7XqYQ9L3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Oewcl+WXESe4ZEBxZCinwnNIqRJSuRxZ56IVB4iqAc=;
 b=fHdpt+3Lyo7eC3jHQHpvK8T5bduZoIYUIvSXQtK9EX37HoOkBLEH421aE80fkzBsQYSIgHEjP2RMWmMG/9QuEfsEW0P1VeJb4I+8tZ127U+mFEZs/dCzsnE+ybrEuI3BWhl7pb2n+aHbQudPALIL/IWYA+P8qEVxNOOs1b+n29XOvNbRZjVZY76wTeKkWATWmGNCB2sFKN7F5/2qJ6leq84ZnmGHrViPIgBMWOJkoykW3nuoY+3LoDzib8oBZaW2+bnyH1Lp87CXiL9UwX4uV+qp+N8Zwzu5Pgs/9jWRWpGoxEpD9XY+fudgB3IewOCOmDeiQCGqZBTOqH+Ov6lvKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Oewcl+WXESe4ZEBxZCinwnNIqRJSuRxZ56IVB4iqAc=;
 b=Un2Hn0v3JTUFfGV2YPZD10I/llxzW7zIcBgB5Yh7ODQ+Jb1PGi1BEcGiJj1aFEVFQDWIZ+9KJCysBPTWzRTkXRzOUCdr/ZKE/ZPEnphGdmjxtZ6kaWJ97MMDkYEClQWpQcVAx8Z/Tj/3QMNNoh9xeYD6rQ6bc/SF5dmAz6YKQ1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB8927.eurprd04.prod.outlook.com (2603:10a6:102:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Mon, 29 Jan
 2024 09:31:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 09:31:12 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	benjamin.tissoires@redhat.com,
	hdegoede@redhat.com,
	ivan.orlov0322@gmail.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-imx@nxp.com,
	jun.li@nxp.com,
	stern@rowland.harvard.edu
Subject: [PATCH v3 2/2] usb: roles: don't get/set_role() when usb_role_switch is unregistered
Date: Mon, 29 Jan 2024 17:37:39 +0800
Message-Id: <20240129093739.2371530-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129093739.2371530-1-xu.yang_2@nxp.com>
References: <20240129093739.2371530-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAXPR04MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c659a1-c2d9-4bf1-cc34-08dc20ad08a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6HgufpZ+/3EEgbicgFXmM8Sav48NlwU6zT3oVaMpZ4yurYSu881Zwfymr+HjLiVi12Ve5LrNwiOhwRSFf1ZIZWQhT1E6BU393izlxihPS/QaVBee8phLWEnx/Ikj9mnh1/r72EmgoOWvfM45sgYh/GrlvZktZ72EPa3OJTCH4NXfMeRbIPjmhiDyvcPL905gat5d8lOX9jq79LCbt4pMzp+CTc5x/hCcR9U1OEz8OBJbAXpCuJyWDYjqiRcObGwxcxcSlP5a4+p0uRfrMh0UpcY06fBSq4acgmD+rNYFUkC1mB+G3CE7YfnmwoVz1JcLc53Cm86nqqarQeOKUueb5i5c2a1ZFXGnCK7ColNNhXrNP1fuKtXwUmLk+YrMWUmZc6/z/P6+/+Bh2ALPsJxLInEzW5mXaKSWpmFgRfEhpTshISyOsxQkldipeGle1MHaw4+X2cQwN6vlUwtqSF1jrGmgoqsglf5WHYx15TmvwZ1wGnm8ORmW5ZZQasWRy7sIBo492TUeRUZQ7Tzz3atrPq/QuoDL0LfxGag/x8l9LqB7bfBtmJKoku+q//br5TJ4kp8TY5tJimKJA0IOmEjUUfrJytL+7oYDATcj/igz5mBU7/st+MOYbM0iR4cKtHh/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(1076003)(26005)(83380400001)(52116002)(6666004)(6506007)(6512007)(38100700002)(5660300002)(8676002)(41300700001)(4326008)(2906002)(478600001)(8936002)(6486002)(316002)(66556008)(66476007)(66946007)(86362001)(36756003)(38350700005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SG1DRTHjlB3rORTd+W92Y754Z7Tm4/SClp0TuyVFsHvWVqniKXaY+k+uzsrD?=
 =?us-ascii?Q?PCDPdBxasgVHByAlHX8bAezkNnJzVp6h/PtF6ow7P8GY+Fob64QrGfmjiRqz?=
 =?us-ascii?Q?AmB3Bk1UEsjPE4oGCxKoJpvMp346Fq3220eeUeE5b9OhG88ABd1dnFaFIG9a?=
 =?us-ascii?Q?sRD/CeWMrpu3l+Nebx9Iex+peF0afNai8731gbFBddGHHNGFmfYgiHqO9C48?=
 =?us-ascii?Q?SBwimCPvEBDTWraVIyKrifKVDQGXtZHHuVdB6xS6AX6JPAtrc0xVB55otrpy?=
 =?us-ascii?Q?Erq78enJQvMzfOv1XuZ3ExlhDLnGCGmzBX9SsgpUjKlqoehxJbDHzj9UyNy4?=
 =?us-ascii?Q?KTy5rVTF9fe6PCGbRnC+gFSsH8SOndx3cWAhIPPpOtpceW+q39evD8+7blAK?=
 =?us-ascii?Q?9OQzSPKwq5qGG7RBkjqF6WSYXz07V+4dzRMGKilr+NxVyfGEA2dpxg2rrOne?=
 =?us-ascii?Q?WK4y6qy6BYb9hJCj0TsxbemKXcZL+J3Z+6phyfBTbCJPBnh4ZOA2d+HY22GM?=
 =?us-ascii?Q?P8yQczP8z/hynPW7l5pu16rW6le5avAy/ZrmbepHXnfaO73Rt3GPkowvai6V?=
 =?us-ascii?Q?Yyg9GmxN6wf15zd9bEnTYbbZJ6GEATEsP9LKGFAJX71aZ/UvhuvxlS5r/y0r?=
 =?us-ascii?Q?xcorQaDAlXbejnnGONGDjWj+SqbVdRAzBDRliZXNdD71kVDWI9KbWMCgkZL2?=
 =?us-ascii?Q?/aEvc9eXk4BSSlDoU+KM9uHOEG50qcIV+xLCYIyXZ+SbRRGIcZhgeyJSCOzb?=
 =?us-ascii?Q?nSl/xgfHKcYlN8vh0u5QzcrTwEcvO/n4uVSmP64t9CnarjCYQcjzhNZrWZnU?=
 =?us-ascii?Q?hGyd8q1rP64Wfn1NzDoySRbY79gDdUez9RufgxNwaLkbhDE63Y9iGAqGmZ/p?=
 =?us-ascii?Q?dcs7Bdb/fiHo0dhwmGRUSC7Axf2dBOtZS/KxPqtmKnPca7azqxoBlmBGAue7?=
 =?us-ascii?Q?nOkmxdM7PUC8j9VKTs1R2pI0Nt8kAVh/hESNpD+2iZ4tNqFl1uKJGyIylLBq?=
 =?us-ascii?Q?pU4DAUeVQGmmgFc4/Yzkgibc3d1wP0fcKy53Tw6+xeFGoCPkSZfgjLOnV7DE?=
 =?us-ascii?Q?8f3owhLmQV5UvBK7t+b/4gfYW+51T6PIBaxtzHtn1cdWW60wq0K5Rn1OFjOl?=
 =?us-ascii?Q?rgbWbzK11UJ+Cm2FIxvHtd//D39r9VKGLPsfiphUgn2uJLc+4JWMysC0chgN?=
 =?us-ascii?Q?QCB7ur2Lo7xLkuqS4Zsbey4MmQCPC0wLx+UxVtpIN4fuKj2w1dLgnpymu3jb?=
 =?us-ascii?Q?77PwotaS4I5TCYQwzQaVLhbleIQ6OnQUciN09YYPGn6avVPRCpuzJb8Xkz5T?=
 =?us-ascii?Q?5sxjVrpcb3vw1E36feg/0hNTg3d7NoMfpJb898URopUvfmgQ/13eo0VoEhtm?=
 =?us-ascii?Q?rLWR+w15Q1PoPQ6Jnq2Pfa/uIO0n2oWX2RUdfDdhz5g/qdw5jEsqnvURlTRU?=
 =?us-ascii?Q?ZlpSpMpkIM0f2ywioEXZJ3rfXjWH+VsMpXEBeYIACYmVBfX9zS0VyfJiHdqd?=
 =?us-ascii?Q?xt4XQA89ncZOjrU5qHTlwToFU2JAt+AVD5KB9M3lxaxwtyTC78KVbCwfdJHY?=
 =?us-ascii?Q?e8TQ9RnbdLHhNgNSz/CABCuzOm18y2rpsMnRwKST?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c659a1-c2d9-4bf1-cc34-08dc20ad08a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 09:31:12.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69PqoDmSEO0YUoo+YLK+HTfoGpb2lLRKQi8L2X6Ew4RBxsgDgpWQJHqMceFSkuZHZmuyJfY1yXk1+yqOMNBRfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8927

There is a possibility that usb_role_switch device is unregistered before
the user put usb_role_switch. In this case, the user may still want to
get/set_role() since the user can't sense the changes of usb_role_switch.

This will add a flag to show if usb_role_switch is already registered and
avoid unwanted behaviors.

Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch during test patch 1
 - add registered flag
Changes in v3:
 - add fix tag and stable list
---
 drivers/usb/roles/class.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 2bad038fb9ad..70165dd86b5d 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -23,6 +23,7 @@ struct usb_role_switch {
 	struct mutex lock; /* device lock*/
 	struct module *module; /* the module this device depends on */
 	enum usb_role role;
+	bool registered;
 
 	/* From descriptor */
 	struct device *usb2_port;
@@ -49,6 +50,9 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 	if (IS_ERR_OR_NULL(sw))
 		return 0;
 
+	if (!sw->registered)
+		return -EOPNOTSUPP;
+
 	mutex_lock(&sw->lock);
 
 	ret = sw->set(sw, role);
@@ -74,7 +78,7 @@ enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw)
 {
 	enum usb_role role;
 
-	if (IS_ERR_OR_NULL(sw))
+	if (IS_ERR_OR_NULL(sw) || !sw->registered)
 		return USB_ROLE_NONE;
 
 	mutex_lock(&sw->lock);
@@ -357,6 +361,8 @@ usb_role_switch_register(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	sw->registered = true;
+
 	/* TODO: Symlinks for the host port and the device controller. */
 
 	return sw;
@@ -371,8 +377,10 @@ EXPORT_SYMBOL_GPL(usb_role_switch_register);
  */
 void usb_role_switch_unregister(struct usb_role_switch *sw)
 {
-	if (!IS_ERR_OR_NULL(sw))
+	if (!IS_ERR_OR_NULL(sw)) {
+		sw->registered = false;
 		device_unregister(&sw->dev);
+	}
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_unregister);
 
-- 
2.34.1


