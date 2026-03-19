Return-Path: <linux-usb+bounces-35129-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEJaJATOu2mXogIAu9opvQ
	(envelope-from <linux-usb+bounces-35129-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:20:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0442C9617
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 11:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FF7330500F3
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380F438759F;
	Thu, 19 Mar 2026 09:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gUvGlUQu"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A863815EA;
	Thu, 19 Mar 2026 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914121; cv=fail; b=dLMBuCtJTignQNcRsELdAwpzAVxDeAELTl7+lvNjavZin8QtP/n83BwOpLBdErQfFomkOIkQDHQVtpokzw9CfSoQssuQoVf1YTcswA1iPP+fzlgKTFcrWSDubyHvEnRHIChEvsqcsAdb+G87KvLR8GoaQvwdSfux9i9P9h+rHxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914121; c=relaxed/simple;
	bh=J4I1LItnTkoouBdtR25+ATjObJj4TVSwFUutYTRJaJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dGYcDmwIhbEnEmok1GuOyn5G9+gQDn45LK/T6pG2ulb19rZV6Mo05RD4yvdCaDrlZeByyY+iJ100Wf9FEEHDIS1IwTn4+q0ApIdIfw2kgEMDMr7RyhqSUvWZsuBeJEkOUmBpxUWkdSYg1kLRrUjWUHTN0n/1ygeV9Hi+097VYC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gUvGlUQu; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgn1ZbpwTDoqrQkyPIDevqet6AaSJDost+fJEHzK5NA2wU6mSbQQyvzT8EqZDYHYHgB/jWXtzvjzBNalgyYQrxrSFYOFsR1R+HD2B4GmeYBya9/sLgM5rQCNE4dbWZvh+GshqL93Wd5ew5FJN1uw1LZYEzCz3Uq78lnMhbpqpk23JTWhL57QeXBApmpmSn7Qrmg+p6Mh4ksdG95CWooysNZ2SMnvmNHNBHcP7DPu/rnIG/PTR7oTareaoMMjXzSeyZXsh9+1+yUIEi7neeRSvt/XSAVWKhcuxdk8jx9ftpN2R3sF+dl481p3K5aVtqW4H/Zw5uqzqcOVTeltBepTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT83D8swoYJ6xXPAKKlKVt3MKkon7PdIlw5R9TGhxEw=;
 b=EfJuZVeyVEFny/oyl4GcdUWAtAh4yC4Gu2CPs5pdq271KnLEYbiAH4L5ISk0fcRGrZ/GsSoY+TmRRCg4HVArIg9jQ8sZ8rjeVONlXzv0l9PVvHsCoSH3NstMbgxlh3kgqaSEOYGZ1lI/cPk+JSIVDdVrnmZK+cmvPcI4obJ4LhQzcSgliqMRBRu7tXrpFRLxO6C2q9p6OvDikmaKgf4jRTvg27JuqvcnctwOpWYcmtuVauaIDj2Ax2F1LcoW+11CD+kZh4rebtN029rkTjsMgPIFlMtXyrDp76EmbcgpOHWD2NkdmFHC3XtGE2S0rmzbFAiKRr3vl3UhL+c9pBjIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT83D8swoYJ6xXPAKKlKVt3MKkon7PdIlw5R9TGhxEw=;
 b=gUvGlUQu0FI3K2aJRRB0Op5+D2SYZ+Mghzsv8AAfYPAfuKlCvngdzzXs+ZvpbacdWHWg6Q8A13n/pyJMK/VZRfYmY/b7t9lDrYoMrxQRB3vor19L24etAFZB62lH+RwI/LF0dwvwq+/TnRI7qkl80lswo+EWTYjxZp1lvMh5UzsMUKsrumrYJq9/+CQ7YJBrwAlz3AKItQRYqLthzAvCgYGryJSdtJrZFXyrJ0DWcj7kAouPn3FQ5QT2i4oIjLbINlIQ7UOYdfafEqgtktwL+F6XMPhej7zff8+3J8YQo3VkdfI0CbUBd0GkwoVBVe49MAP1EEAo2g7H30k9FAd/7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB11057.eurprd04.prod.outlook.com (2603:10a6:102:48f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:55:14 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 09:55:08 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] usb: chipidea: otg: not wait vbus drop if use role_switch
Date: Thu, 19 Mar 2026 17:57:16 +0800
Message-Id: <20260319095716.634568-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319095716.634568-1-xu.yang_2@nxp.com>
References: <20260319095716.634568-1-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1836c8da-7589-4a9c-bd1d-08de859d9a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lW+nA4STUqtsyQlfu69bxFkGnuEmUBnAqfPncY9QYx44ny4bVYg48vRana4L0dJNF2T4BLf4GupRuF0vrysB3HRpwZABxjCmOqdhVm6CN60hRYyRezSeRVg+2QtI1ZmDhIYNC3LoIfnXO/vw3e6gmc8peGSi5L50MlwgMasng/fV7EPV/j7TQobCAD2/JFspKzBm8H2oO38MO5/eRJ01nEvuf3O0wbDSV+kaRYziJX9+PYB/Fhl2dkhBXKppigATSpqG+k1LSem5/EginWQ6ayJmSI6eZGDnhDHsj2ej2sp1hddmpw2O/UUf8jcnmffpxTKsWfwYbBppDHmZ6BKrCiBLR/alz9pTatLwrJ6GxJAfRYNCNfktnK8HxDqphSOpDFoaVE2uJUl5ccxeoWBkDVhQlTeQ7uB4ufiknkCw0XadAjCn1Jh26b8W4I21mpjeua9XUbGNtDIALYGAli1kIFVLi2eKr+lOQNe8zP+fiXsAuB8btIpKY626PJtyIeUJSoOd/EKyCLAp0Jss0cZvQI/P6Eyh5nO94qyhTtj5WMn4q0lEEizS44hTZ7qVvGfT0CbFlNn0BAjGl40XatREmU4FEWYFMJbDugU74feeDN75ZHOFRUvo1PvbYgA962dYT0Zhnkuiac6JmeA2zC8COX80GR6Q4OqUQP1kwwfgfAPUqVrgawWT7RH0nsEEzX6SO1SMZzhb6/BI2JxJyGOKHb0slik/emERApMMMBL9PM0D/ahJ8Y1keA5ya2RKjy4adfWHyymnNvWORdnudm3CQY9+up/DKgCZcsz3Z/h/yDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yZO3ndT9xyGWcQT5hTzDjb0LRDWdzjxJqLUxpVvBJa+5DAyquLMe6dO0Ehqm?=
 =?us-ascii?Q?cV9CtOoCH+Mzjsh+/y2i1V3btY9Zf0yxrliBofCBu0Yco32WPGAYJ4D7GVLy?=
 =?us-ascii?Q?zNK1k6FgTCVZZ509OmdeKr+Vni9OiL5GrHxcpgrxoLssi1l3eMFQV7+M9aDe?=
 =?us-ascii?Q?GYXAoZi0JUjTgsrWeDt31gy8g6Na2kzxQGXK8zewQ/nJX6tbEwXosMfY8qfR?=
 =?us-ascii?Q?NWr8ayW/jhVCghlWmqnC+jnM+7pnXoPuBNhT3gWceT9Sl+ijiLAO72k2r1PP?=
 =?us-ascii?Q?EuI62f29eih8OAlaNUO3Wg9/jJ1Lx6bycGQ70x3WHIcu9jd+cjLJfeLU1gvI?=
 =?us-ascii?Q?E6wssyao0euD97lmKipd1x/Vs8DBrI26S8N3N9BMT3aqDTMF6ykQNCQGpUY1?=
 =?us-ascii?Q?T0k8EuNiK40JzgukD76hxa9oix3UYSB3X8sDKGEQuect1dvRPBug3qOMnGil?=
 =?us-ascii?Q?ZOdrPtx6k/Vb3mrJpaSbjD/qQMSt3G0EAjdT1EOO8Td9j2rUhAj/2JkSEZiG?=
 =?us-ascii?Q?7LnfLXQBqfWnV7kxMYFEfu9VTAScE8H/8jQKltk2DKUCNbhW0TS/FNeQ+4Bb?=
 =?us-ascii?Q?SxEyK0kHoojaO8UTMH/PGMaHMAiTjXN7mAeMT6OTuTZ1i5w8yJRO2W038hfK?=
 =?us-ascii?Q?pqz5lDbkvw38BtNA3EQZqos4Oa6sglWN/w0Eyurmd0yMrVzRbr2KTUrGBzRG?=
 =?us-ascii?Q?SSR/MtfLs74zsFF4DNcrXaSL9RVhCcvWI/7CppnBe/cI1KvAOPNlryPqaPM9?=
 =?us-ascii?Q?vQ8YcCUDpTnXfxd8VecfmCSizeH65JJ8wlFdpqftkB3KPgAhkRE1pNCdhc8y?=
 =?us-ascii?Q?tWErnoy301eBM3STzwPu76jc15MltAACxalmATfhODhg6F/d74yK70E3JsU5?=
 =?us-ascii?Q?rnQqdCNszT9rc4OQYX4Wkq85uaRJyKKFuELglp4y/cAQb+yeqybyu2rFTpNR?=
 =?us-ascii?Q?d9W6Q1mbyX8WjPBah70NyCuZei0zWQMHkZtl1fSAYSwsJjnQK1TMW9k3Wxi1?=
 =?us-ascii?Q?Duo8GPEVan1bssHXowUbA7elGpiVWimdBe52ehoH2oIdiU1EtnzMomCpN93y?=
 =?us-ascii?Q?oWnPGat08lzcGW4ZllSmYSJSOJLUx5WSh/8HJ6FeZces812Qy2J9RiZeKaRS?=
 =?us-ascii?Q?crGVQCHVUzBDa14KAV4sOgAFSjgtpDHgSwcTXg2ge4WLaJPMlD1ZZyk6sn9L?=
 =?us-ascii?Q?oCGSDDimrRRsBynjRuJBzDYP/8Y/yQ+yzgRhPmA1YfsDNe6dGZwqLaJtAy2n?=
 =?us-ascii?Q?sDoQWPmMxA/a/m7dQl6lxN3TD/3KQderywE1S3Z2heGoUZOlzQsjPJ3/m1Qf?=
 =?us-ascii?Q?YyXJ+fzLGBGQXYtMFyEAaXsJlLFEoJmHOd6dbKiryvkMaKeSLIVANQCxWt7q?=
 =?us-ascii?Q?75ICMPY9IBhMfiUgnXlzRXL6cnFO+C5c53U/r4PP6gNlTSidfmBanCe9f1Be?=
 =?us-ascii?Q?+RPdsuxUcWvF2SgTTdwgvasJ1UWP7PxQiaN9MTYgO/YspQCJ05i7N0Giy6n0?=
 =?us-ascii?Q?XejDZX1owc3euzHMQheqxGEu20o4F0CU4HHvMoJSJJ+tMd7w8l2Rq+0K7O1e?=
 =?us-ascii?Q?HuHNy3tV5TOHFEw1fq9emf1+5ulOsOmEWMc7q9SS2FicCRbLZAjS3U2EtGiD?=
 =?us-ascii?Q?a9pJy62ywTlStvDY3imM2A9/o1BEUi4jfNld3VH7VfwC7zb9r6TNBjbQLay9?=
 =?us-ascii?Q?Q2brqyE5X2yYvP5XktI0apoSOvuudCUap/FJf7uzuBMvSY+TjmoeuvEczjas?=
 =?us-ascii?Q?kmF1s36G5A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1836c8da-7589-4a9c-bd1d-08de859d9a57
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:55:08.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BOnXmKaBYOLBHbW0P61UTfkeWygZndZQLNH8oz9NogE7eMK1GAObc8QTAI2gzoAH8Ku8/ZFkYm6IS+CwsiivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11057
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35129-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.993];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E0442C9617
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The usb role switch will update ID and VBUS states at the same time, and
vbus will not drop when execute data role swap in Type-C usecase. So lets
not wait vbus drop in usb role switch case too.

Fixes: e1b5d2bed67c ("usb: chipidea: core: handle usb role switch in a common way")
Cc: stable@vger.kernel.org
Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/otg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index 647e98f4e351..2371789effa0 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -187,8 +187,8 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
 
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


