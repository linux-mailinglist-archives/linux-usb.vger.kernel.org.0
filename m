Return-Path: <linux-usb+bounces-34264-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK2kJL15rmm2FAIAu9opvQ
	(envelope-from <linux-usb+bounces-34264-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:41:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19975234E7E
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D1393027D9D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 07:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2F368965;
	Mon,  9 Mar 2026 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lBNZV1+h"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F30367F54;
	Mon,  9 Mar 2026 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042094; cv=fail; b=MioA8ZYEfYUR2PFuz8276VJIcS3dVIbArFykgkFTeSS0XCA71r+menlDwfjR41/8d9dOfjDfX1PZK/w8+OqvAE5j3WhrtKWtytyaYffEPOnGjcfvqDxAfuY+ATEg1ILjxj1udjAgi2ywlI8pccVjWpI4U534dcUy26q+qc6QR/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042094; c=relaxed/simple;
	bh=iXGwCfO1ptD0huQ8UEu9OQwe6VEgKSljRUvU/wRu0Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PvrDXvCl9Xqx+y8fXRX8+4IeQai2wzQDIL5FKIyGcx/uPk2qYVpHeF1UAYLJxF1D/6gpiYUluoU3OXgis+eVvu+yYxekUWibke38tjxF7yA3CmNzwZiZZ2jcL0rfz8gQeEuOtej4mxuX2tw/emRZ3eCSjEhtXTIQRzJyD2m1Vy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lBNZV1+h; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbjmFcs/lCcbw8WbvhqUGnwsHTmLFN3VVtr9ZMwSkzYWXWFaEeqzotz3xWeU/iCB6/fzNKWevZ9sLYfLomfJbDOKPSuJi/G7VIAiq6ETSfoX1NssQO+rFz++/QFIhDFJeBG98Ut0ieE7qfOfm0Leib/NWAxXMT5tW31/MtzmLU6OK+9v9mFr2dCucmAO7FTC7DV6GNPbtZOsni8Z6n5TnWftQsy39qvHb82ra27vsjE0K+WwfcAnHQa+5eAX2+lYLW9O50nx4pxlimoyw+ilmYiMT+KFcQqFhVZikH9b8O8CyYCFFsym0snaCBrkJVBZMKylPSAbNa0triiL4vLDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA5t8sKP59gxuMrP10AYsT1NuV9lR5uX20TGmdnU7CY=;
 b=Ekk08jiEW2yQ+UgC8FV4MEXiOmWc5nmIyT092UGjF/fmDYQwOPrcakqgEkUizF4BBmzJooH6fEj5GhkEqri9YrIbFdVbl/JS4lAgUakhzhON/mjrq0jbFKJupYItcLNUoxyRcklPTLi9lGiwwg21Wz4m3wGsS62rJiIevKQFXXb796eXIEleZ0jmqnffQJGqXOXL8KOeZFhefi93ITnVFUqVaanhXlKTqZx2e3u+YWMUBOanP97We9cO/upcsy1n1/+prvLegLOIC3hi0/vWDoyOP4lNj0RezLVrmyYbPY8LuR7uznjae2fx+HjjYWhC7DH+9UUxF1WgV+x9oab6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NA5t8sKP59gxuMrP10AYsT1NuV9lR5uX20TGmdnU7CY=;
 b=lBNZV1+hcjLSz/yLGCZG/V/hLCFVrjW25IGR7qJl4bnUYzHbvVR2/B56blq5FvbTQLOPT/ZmGFfqKNVD/0hlz0uqim3Pyixa88FJSNP6X8RE3YV81bIS5H4GkqmMm4laXkiD9oIcWbAG4dFICvIjTTxDgMGOBAkejfpY0cWqOZWpZFPFPMgarLliuzYfvbXWHTKYCANdESw+rjUu0MMB/I3LR0GCZ0n0jppyNY13vXiIuYdkpdZJfhf1eg1Blhax3UiZjLvOvsphTzvyky0L3fCxu/ShaDnVzI6TzCCldtt0QADLPOfbsbxV3b1Jjd62V8o/RYKpqFuV1gqSRJWokw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12470.eurprd04.prod.outlook.com (2603:10a6:150:341::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 07:41:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 07:41:30 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	arnaud.ferraris@collabora.com,
	dsimic@manjaro.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 2/2] usb: roles: get usb role switch from parent only for usb-b-connector
Date: Mon,  9 Mar 2026 15:43:13 +0800
Message-Id: <20260309074313.2809867-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309074313.2809867-1-xu.yang_2@nxp.com>
References: <20260309074313.2809867-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0174.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB12470:EE_
X-MS-Office365-Filtering-Correlation-Id: 1152474f-9e32-450c-2cd7-08de7daf46b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	FfGLYbiN/D5ejs1kcBbxLAu8p4j926hxBI6xGBpxASS37568zf6Wqd2ClbhM2x+z/U+4PgIfcnlkAS5Xuwzsj9Tdkqht+Q6UBeImK/4ujE5pbuc3O9ignsVwSiH1AfKpTPeCkjhBNtl3uyELD8z+IWo/ouwQw/eBocddst/cBnUYPKYauckfVJFh8QLIfuESRjpcnqbeuLttBAdQNW8PalWhcozt01m2Z9TTiSP1zVDXISV8+y0rKoUEudxtloC4ommx1PAX5AIiTvF5xIS6osPWb9IxihfPogLQEicpec0sKVp4RtV2tlV2p8KEwm4fxdez4FcptgSVkgw7L5gZbbJQarij+CVY9q5oIc8CoPxAaXFD3gIxuKCmv9SEKbtwByCKZsomXAObS0V4xltbySRTPm4QDWzAKpqcryyLdtNVlrWAammFBQZzcEkEo7PykVlmNFIdQZTK7Bn4PIkP0wRk8KuzTQraIdn1S4shOwN20Ks9fEOrxvU8uPSdDsMBPN1B7bOLM8Syes7pR20/mV+iJTfLrGOeGuwVOugP5LdY0o//G77MEk/qsKRrNIt6sgXGWTARcYHAg8oqV5qwQ07LdgsUBQDG9QN1WriTBm9GAqfMcQjNXHUd6OWepmvRoz3uz5tbvRGjLKg6Y3LJxki30h1MCUOD7kLsKzLutgLdfkbvQ2ibB6VVlzc71KoXnH8kwyvQo+S+ugL+eH4pbCUDs8QXT17BUv7VdBY8rsxtAD3Q7xE9rG71mT96xtf9ZFD3PcJmS+b/cmqyDQnoCoAgJKiuI8TwpsxyFF4zg9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SVUDETZyUEXmDsqUe55mQjKnFYT42QRlE4oUl71TdGfTXzYBN+/zL70zVKe7?=
 =?us-ascii?Q?JOt2d9r3MS9WsCN6ZebN4fJ3aJRgC75EpJ+BQEvAPPGzye/sRywk2bNTXTwq?=
 =?us-ascii?Q?KvAminKnX9zbdboZeo824pE2Y4u/7YDHKFimFFxuoy9R0Xu//fPKpN4ANy/X?=
 =?us-ascii?Q?hD+8qxt/jTowz5n5TGxUV556a4AzDCzgArWqkPo1IP/DgQGu/sND1wP+50Gn?=
 =?us-ascii?Q?4onB5xhKtqyXcJgZ5psqCIszKXoU0kwsnrPxn5bhqRn85o9S4Vq/s0vlS1QD?=
 =?us-ascii?Q?8ckTEPw8gaLRAXz68lWQfbEXPlijcVnEDMA5aTdh+Kc07rhkS2pJm2y5/d0N?=
 =?us-ascii?Q?mr1j3EsoD59mJiRkV1Q50Rhpp1Xc+pTgg3kUnSQ8+sEgVhNgtrA9RJGmO7lp?=
 =?us-ascii?Q?tGyD6hnghXhzfEuwsuIY/hTX6nd3ZVkCIsdL1ICdFjmmREXJA20Jjcy8e1zF?=
 =?us-ascii?Q?jCX9r9O86itn6OLyriNE3Ibttz/D/tI86CXgDjeNiFlVMOuph+qkXpAbOsdO?=
 =?us-ascii?Q?P0meAakBz22njBg2PsTTrPowe2tOoVsc49GP990D/1jk6aOtJ4CknkKBqNvn?=
 =?us-ascii?Q?ZaYt6aKEMF3GnPcUYVN0EpI98g6Q2XxzWDeFsk8tkvVBQYNO3nZmGOYqlFS2?=
 =?us-ascii?Q?D2BHZiOzi/AovxKG97W745hZX0VAeFr0fBQLaNg9Fox/qG581eo3IhjVi8yz?=
 =?us-ascii?Q?kiDFk6tEBeNhTmeY1yi7EY5qoSRKQfYLgA6WnIk0/mYTzN+MHkDWHd/7Arp9?=
 =?us-ascii?Q?57pAwP/kF+W2BSHhkK9LW6DLNpV+hbd7xVrsLAdD2Qbj8azrukiMZxYkdsuF?=
 =?us-ascii?Q?7K9Sx2cgynvbK7WmaE9rhp661PDUW9rldM/6OUM+2bnho+2ui/ZBWHUa8Lqu?=
 =?us-ascii?Q?8m1CwKkI1ahB87BJjKjO8tP4yFcfcyTyhZE+fcKpKo2O9wnLePLm0p9ufaXb?=
 =?us-ascii?Q?mRhJNB2vaF8ePDwqEX/vlFPygeVweLiwwMJdHV2byXqYccreON4Vdsj1uLjQ?=
 =?us-ascii?Q?fn8WQZ7c2XilV81WPp3+2v7GuHdxAIH8857miZOlJPdeUkExhEyGo1+zhWH6?=
 =?us-ascii?Q?VDstoSopTsT4xQgyvco1/QDRhtGHr5w4FPs2I7IFsCIE2rDp+Ph24AJTTmw0?=
 =?us-ascii?Q?o8R2E7kZ4Sz5QAHhm2GxZNNDQ5RBd0Wsswz3GcCOK1ndnxbFJsxhqFtrVo0X?=
 =?us-ascii?Q?E1yZuIPMvsqepMqNL7S3etvtfBZiEh9wqdX3WTV23+F/dZisrQorM+tNBZmf?=
 =?us-ascii?Q?MT2NZFeFHAB3KkOHB1lErT2Ot7VcZuP9OpZ1SvnKVURtIOCpJF5IAeVTHVLG?=
 =?us-ascii?Q?TDxNT9+uqdOwi9HEEoLc1Rha0jTU0/X1qP1uRbiWtJxyrmkWpGz7/QTLRgpw?=
 =?us-ascii?Q?TNtKZSrY+fqk1c91s687gQhUh5ROq7WGLvfWbNEQdkhV8fOKhG8o7I9FN+SX?=
 =?us-ascii?Q?ZlNk87WAM8aVQ5PA4kdL9mk7Qm9btEOOlOqp0tLEjUYeLAKKXLrAKt5+hF/1?=
 =?us-ascii?Q?9IRgazUzdPFvRuc/QHDlzwLdYDdkv1esv3DP8gnG+n8C0SUJRVdzzaq2ehU1?=
 =?us-ascii?Q?GNI1JLj4pnSjOA3jJm7Yt5KP/EgjOMKKkWJHkMtoXPYYz8dzI4wuswlRa3Cr?=
 =?us-ascii?Q?0wF8ERledX4n6PC0gpQhTE9BCJrzBENePHx/BDfsa1KphFeFHeB2PCUTOI3l?=
 =?us-ascii?Q?e0qPTwuU7Jk2BIicy5ZEcMGoQgmBYN0A8j+GWUMKvCWEfUi2XZmlSjMHe6sM?=
 =?us-ascii?Q?9yEUO+GNOA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1152474f-9e32-450c-2cd7-08de7daf46b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:41:30.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ua21OgK5ntf0AIkZKO9SLu/6LMyTcy7P1QHCNWY8u4GouXZVZcbGPMtx/wi92GVIGshrTWFeXV9J5MvW4yLx1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12470
X-Rspamd-Queue-Id: 19975234E7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34264-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

usb_role_switch_is_parent() was walking up to the parent node and checking
for the "usb-role-switch" property regardless of the type of the passed
fwnode. This could cause unrelated device nodes to be probed as potential
role switch parent, leading to spurious matches and "-EPROBE_DEFER" being
returned infinitely.

Till now only Type-B connector node will have a parent node which may
present "usb-role-switch" property and register the role switch device.
For Type-C connector node, its parent node will always be a Type-C chip
device which will never register the role switch device. However, it may
still present a non-boolean "usb-role-switch = <&usb_controller>" property
for historical compatibility.

So restrict the helper to only operate on Type-B connector when attempting
to get the role switch from parent node.

Fixes: 6fadd72943b8 ("usb: roles: get usb-role-switch from parent")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 drivers/usb/roles/class.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index b8e28ceca51e..edec139b68b5 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -139,9 +139,14 @@ static void *usb_role_switch_match(const struct fwnode_handle *fwnode, const cha
 static struct usb_role_switch *
 usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 {
-	struct fwnode_handle *parent = fwnode_get_parent(fwnode);
+	struct fwnode_handle *parent;
 	struct device *dev;
 
+	if (!fwnode_device_is_compatible(fwnode, "usb-b-connector"))
+		return NULL;
+
+	parent = fwnode_get_parent(fwnode);
+
 	if (!fwnode_property_present(parent, "usb-role-switch")) {
 		fwnode_handle_put(parent);
 		return NULL;
-- 
2.34.1


