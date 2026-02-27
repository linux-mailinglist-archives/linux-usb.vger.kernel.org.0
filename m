Return-Path: <linux-usb+bounces-33782-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PtmBJyGoWlOuAQAu9opvQ
	(envelope-from <linux-usb+bounces-33782-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 12:57:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B9B1B6D63
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 12:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7080730312E5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 11:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676C2346772;
	Fri, 27 Feb 2026 11:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="O46Yx7aw"
X-Original-To: linux-usb@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020108.outbound.protection.outlook.com [52.101.201.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA084329E7D;
	Fri, 27 Feb 2026 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193433; cv=fail; b=e1H3SInjIymBr4WOag1sclIFnIKbtPrIhsCNwoJbVwZTdF99NT+w9n5KVgU8RvLc1+b741+joFQVCmuVOdPzOV9KyA/CcjrDrPit8BrP9EzianOuN77Ygl/vEZwkYR2QwZGhgSGpPVGEugxAVciL1/9sJV8iyol8cSjlWPn++6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193433; c=relaxed/simple;
	bh=M4hqeLBRQm8+fSSaq+AOsl+ZtZXgWZWx7BAgleS7w9A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OP7ZTjRFLVq9E+yBuxQQtuAcHj5/i5+f/VvDczpUJYIzPUgq9nU6Z1ll/fGWNiSMvUtMSMqJ1BrIxhFRLz0dgMydNRFQs7MqOc7z9q6D+06Z+AJS4JHBHKlKW0uq4D8/2QuUnlIw8E1g1/cUN3zcNrn801WS26UIQE9YvvSRPY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=O46Yx7aw; arc=fail smtp.client-ip=52.101.201.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KW0b1SSJksi4VnYwJzvel/jS7/hTa/ctfdpTkDjXBp0N1+td3/A+EvMhCnM7GEtnoJPKB0NUDUtaT2fsuxuUcWP53NIOY+JjtW5KDztWn7QWzx+7jS91sVGCdWB+7DE+z+hk0Jg029fV482oX/mXw0eaS/ZOKLb8IiXd8AkJS6l4+ib7HC3ja/4ctArcCbQoFml3wUoc5NKZJB/O9MCJK4sGiPyfoIsdKTPZcQ+5bUXVS/4Jw3WE4bvW/deNbKcZ5Rm4XozPH8i+EM8chU0J73Tp8wDmtk+/2koVrTPbGrJzTsYQmzVx07BnOWS02nTjAAPC/pqdSW5jAjuvbnA0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeAb0QPcTCZdObxROPg2cEXk1lrkyggbmuFh68vjSbc=;
 b=CofpMTqpidHkrsI3aEZEJcb3WcRxJS++kmuIX7so+p2VQGtfx/ap2XqBdS4Boie1CZdqte2NXe3Bw48EnND+gzyvIMRipTh+1jAwY0rQ0gUMQNhwqqzD0UaSNMkBV8rPbGqyOeGaKF+t8s1AWb28hFYbMZqUsulvau8scoHESkFcj1Dq6KQ/jPTxFSy02H/7btVw46sERJad/HJOD8kilEJDidgm8UFHpixaLdhepMqPpN9zT9ufhHi342/8oWtD+vosykBJwF1GGjg3zCJzfoOQ+f9OCmnTWEjKfr1mLYG8RiT+A2Thn4xBig0JtawFf+dCFMjfqB2YRfnKxr8Z9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KeAb0QPcTCZdObxROPg2cEXk1lrkyggbmuFh68vjSbc=;
 b=O46Yx7awFaxhyGuBF8PFUu3jxRFJYhlysfNgXaAigoWYrpGFO5d1awCqdTzV5+JLtyS9nTBCqCexePAHNX4QnYLYONBpRVC+BhzJtxJvjoQcVumhSTrqIWLh9A/EeUPOZGYcuuosSd+Yd8P983WHHYcgGahyUY37iwr9GPJT71c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by SA6PR08MB10522.namprd08.prod.outlook.com (2603:10b6:806:446::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:57:09 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::c887:c930:70aa:b156]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::c887:c930:70aa:b156%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:57:09 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-usb@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Kosina <jikos@kernel.org>,
	Yuhao Jiang <danisjiang@gmail.com>,
	Ben Hoff <hoff.benjamin.k@gmail.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Terry Junge <linuxhid@cosmicgizmosystems.com>,
	William Wu <william.wu@rock-chips.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_hid: fix SuperSpeed descriptors
Date: Fri, 27 Feb 2026 11:15:39 +0000
Message-ID: <20260227111540.431521-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0176.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::16) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|SA6PR08MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e8949a-1bee-4852-ecae-08de75f755be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	sH+UBNceYiu+8c2GlY//pVbPNmmw9z42H3gi+f4RmP2MvIFaOb4YYry76wWaWsJTYBbijVas+5ILJn1h3DsrW9cZpC0vNId8lf8THzsLKalweHYhz9D20ccHlisj/jjLiU25WCXwGeagWtg8WLv7oCEnnDAB82Zf60ijEqxuNTdodPIqJfKfRmkOF09KCFR0zCrKXdbkqeelbxoCxvXGRWnkW0SMRvwgJifDqEbMd7eblT+2nnYgIqjDEfP34XeLlF9TjpTQ5vPLzpnW8k/S4L2cfxeIrSKEi7c6GxgV/imtqchHlHUvc4u5Z70HO22FrkPJ0HdKii6Z07orX2wXK2rzbvF/yuMADLqb/tJ+cY4gyBz24nJJwsgv7ACMAxoA+0rN48lTajTVLbhK8eKlCyWu2Sb+i+Mk1NeJANHhHPYijmVtUuw8Xk32QYpn+YRAoJAMjJM5DCvBC2v+McuESzUNWjdHNIXT8jQgEAuib9ZykNocsDLcJzJoFIaUbO5gNIdN8zMzeJEcOlTpdMXa+tdBiTKcdv/yfAVL9fHiG16Xcnej27JtStRNxJjlYNkkwKsdmyr9089NlGEB2rq92ZMabFu/wzqYx9V9Mv3yhMkd6PnZCPJl8tP/4tLMsSrpLnuDUI64GQplvtyxvLh9P+aJ6k945Bdtjt2G7cnPqCu33Fe8INNchlsVBiTDFPKbJqJk8ESjUDZNWTJaqEN6jl1ay3z0Wu2v2P3hK65NgAmOyRc4Y5JEiiLiOmtNNRajOyNBuSYM0469SzVWmS4NZdyB0sLxiBAVsWuchpBWhg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RPdfmWdOoBOZCUO/v8PtkSRZeQEWE3Z4McFiYv0GOCzENQg/ms4Bj6mSzjx0?=
 =?us-ascii?Q?u8O3odg0iIS1FLtIze8nm2WV1WoaNNewq1k9Nx+UOo1z7NoCIth1Qi2myKEu?=
 =?us-ascii?Q?pMg21si6v8BRx9XGmTEbdDXI2eJrFfWUzu+rkcD5jazZ1Gzx/xeURAnZolq7?=
 =?us-ascii?Q?SESD5I5+1kOIgaEwKRVKTpsSYj8Do+5TQyUD3l0phGPx4Rff2/hLFpu2EQDM?=
 =?us-ascii?Q?7IZ579G82oVdnwZ4wIPpTRpLtaeiVcAnEUyVkzY5HMCdllJE/PJGG587wQaN?=
 =?us-ascii?Q?G+NEsuHuliFtgb/jyyC0kdUQtQt/H+hY4EOsnVMzWtZyMwkGc2a+dXaxI4IS?=
 =?us-ascii?Q?dRl3YFRgGValjOs0FJojrZJSGkt7pFHIOlXv9osPm0ocDpbdzUz43Ioat1fX?=
 =?us-ascii?Q?drs30yY1/yZmZd69mzGkg9gtFsrVkrW0VCb/FEcDKveU0wco1+gN6glHHTfG?=
 =?us-ascii?Q?dVhh3Xl2bVc1gdOS/ssz2xL3hKc0l8WcUxDEhPn/6wKOEL0z8ThodmLCCRG6?=
 =?us-ascii?Q?jPT1yOLVktHIJRts8Y1D1KRHgI/VEB/TloN5IkvNrGrjpLHmmMS27as/ApB3?=
 =?us-ascii?Q?y1vDC5hHaY8CaJw/j+PfyHFxxJQYc91pUM0hsH13a4jccMrOxHV5W/d4CZmC?=
 =?us-ascii?Q?237EFOzPgyuh7LWyuYo9S9wnXOb5+iYRZrJhQPmY+h/8B+zkvp77L6a+3jqM?=
 =?us-ascii?Q?6yxX/UM3D/44NQjNmySAKKWZU91PJ4bzWYQ9d567YKH1BQsY9VZokUS/BE+k?=
 =?us-ascii?Q?HpOEToJ8hCWdUsI6lHVYHjUKtLABzyAkjKG1azn8X60iDdC9+0PD5tdsw8o8?=
 =?us-ascii?Q?Ge5nZwmWgbpipnAke1T4s+X6OSW3duSdBKJl6quwbkHy4BGFI/7T8roaOtaW?=
 =?us-ascii?Q?pjifdrYYkVCFQcg4BJp8yHDtAJPWci3aatOBPucLT2LmMG64YX0x1I2worHY?=
 =?us-ascii?Q?Akr5NcfIdSHBPdPKeK+tW6wMdeR8Oud07h859lpgW8AZ1GvPJC2d4rmETsB9?=
 =?us-ascii?Q?YFFfpSlc6vrMLMkKiaNWAf7adKeiIkvwxn5yoa076h7vztTwuLnKueYesVgi?=
 =?us-ascii?Q?sqgqi+QPAfUmQRp8z/iRZcSkE3WlU3DNlkqcLHiHvnmFY1dUk4aPufRUqm+Y?=
 =?us-ascii?Q?vuqDD2nuEpv/KgoYpjlXdUHf2AV/9EJqvSGuthNT3oXCZikbrxttwoH/Q6OV?=
 =?us-ascii?Q?TexbwuXPoIhMZof/gR8c1XhjJROv/cCfK4SQQmQ3MxLJKG29dT7+AEuj2Ts7?=
 =?us-ascii?Q?/kgnVfJHgt4IcrgOI6oFzHIkmkHVbhucEc0PIeqedvGv6ZAfGHFlJ/hr8NnP?=
 =?us-ascii?Q?D6Og1r8i8ft9q6pKlvu9nwZMMDqMZ030+g7wnhAY2POmeA9fM6kmcaJoNBzl?=
 =?us-ascii?Q?EN3nY9eSzrZp7BgTKpZRz0yBicnEta1G1sm7OmkneJCRXvo7e0NB/xSKsLsA?=
 =?us-ascii?Q?O6Uu9GN3JHdZiYz+wGYz9pkir9+MX4pMegRzWJ4IVUkhulkhoihE40R5ke29?=
 =?us-ascii?Q?Tunro/G7tM0KurqClMjw6Fuw5ts4pBfzN0bsJ9y5T+DrtzYqUV16EFPUnlnH?=
 =?us-ascii?Q?cdW/5qjTuACC2rPEee0KbmqrPqI05rsaYouG+x1XtBRbn4YhUu138RbAp6Dd?=
 =?us-ascii?Q?3TUL26XThMsrdEM8JbRr8HtGEWfj0IFOT/RsxS6+WIMsMHpE39pxVxf/JBRT?=
 =?us-ascii?Q?lffQGujSOKadGJDjMCMbabKczje0UhiZGM72mkOZ9Y3LbuKiHyvarG4NoKBw?=
 =?us-ascii?Q?xLPb16wA+VGCJfmu5cOuP8JrglEJFpg=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e8949a-1bee-4852-ecae-08de75f755be
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:57:09.1147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CG8cdk9/mvxd1qpySuwHOxMb7etY0QzxafHA251HGwq6aYFXXHN9aP+dTSqfX5+lCWUfFjepZOdapf3XvfZBrrr20bg0Nfe1dpWI4GCkN0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10522
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[inmusicbrands.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[inmusicbrands.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[inmusicbrands.com,linuxfoundation.org,kernel.org,gmail.com,outlook.com,cosmicgizmosystems.com,rock-chips.com,korsgaard.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33782-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[inmusicbrands.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkeeping@inmusicbrands.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83B9B1B6D63
X-Rspamd-Action: no action

When adding dynamic configuration for bInterval, the value was removed
from the static SuperSpeed endpoint descriptors but was not set from the
configured value in hidg_bind().  Thus at SuperSpeed the interrupt
endpoints have bInterval as zero which is not valid per the USB
specification.

Add the missing setting for SuperSpeed endpoints.

Fixes: ea34925f5b2ee ("usb: gadget: hid: allow dynamic interval configuration via configfs")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/usb/gadget/function/f_hid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 8c855c00b8876..8812ebf33d14b 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -1207,9 +1207,11 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	if (!hidg->interval_user_set) {
 		hidg_fs_in_ep_desc.bInterval = 10;
 		hidg_hs_in_ep_desc.bInterval = 4;
+		hidg_ss_in_ep_desc.bInterval = 4;
 	} else {
 		hidg_fs_in_ep_desc.bInterval = hidg->interval;
 		hidg_hs_in_ep_desc.bInterval = hidg->interval;
+		hidg_ss_in_ep_desc.bInterval = hidg->interval;
 	}
 
 	hidg_ss_out_comp_desc.wBytesPerInterval =
@@ -1239,9 +1241,11 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 		if (!hidg->interval_user_set) {
 			hidg_fs_out_ep_desc.bInterval = 10;
 			hidg_hs_out_ep_desc.bInterval = 4;
+			hidg_ss_out_ep_desc.bInterval = 4;
 		} else {
 			hidg_fs_out_ep_desc.bInterval = hidg->interval;
 			hidg_hs_out_ep_desc.bInterval = hidg->interval;
+			hidg_ss_out_ep_desc.bInterval = hidg->interval;
 		}
 		status = usb_assign_descriptors(f,
 			    hidg_fs_descriptors_intout,
-- 
2.53.0


