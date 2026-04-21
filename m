Return-Path: <linux-usb+bounces-36380-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMU7FuUy52k65QEAu9opvQ
	(envelope-from <linux-usb+bounces-36380-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:18:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58E438038
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9413A30055C1
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 08:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305713921C9;
	Tue, 21 Apr 2026 08:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F2B1XWC7"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D671359A66;
	Tue, 21 Apr 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759514; cv=fail; b=tiVh+G9RHTvRtGPs5mYIKVYF36w4j8KueCBa8acST8oyvROwgW0HwMoqlzM/rvThG397TOdLl5dySz7eWVpht+1MiXHN3bqR2Q0k8gmnM/kgi/UUpjYDxIBmllAHp01fKmmiYXlCgCIDvG2o+5MZKA2jLErpoBViLP+YQwhYgz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759514; c=relaxed/simple;
	bh=hCEcLZl1fTZYNrANQN55gZ4H3TmYSaU+8RxOK/t4vxM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e8EP7aA/tcqG0CApIzFq37M+DbieZggXMvz+Ns8T32Y6fN+VCAC6V38eHSaznQU49buNkteO90YHtF4yZ1DfQrdUgKHVSqL/pHMeiub07+Iq+k0YtiSTDLRU75F9MfQpg7ZWzIozhVSID/WmeBz6JyA8owfFSE9bBsOt9xkxoAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F2B1XWC7; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xofbQKFcwmqFSz5cDExC/A+VVPAz5LBv96cQcLlqV0GimCaeBNXWarj+jzDgy3GWmI71OGG8RXpx0hpqMBGY8arCPt/33O7pDIhiX86rmxFE+7kezgRr2hVFk7RflUxqG8eEgaRLOAIA5/ZlBa1wl45/k0MBIMZAuEBqrYTrS43ZQ1x2xXCXz00QZ7AZ4mqWo9iPEm2fQeEhJQd11rqvgyuGX37Z5DFNIImQf0EEJn7vqJH1+hKY7n1QPiOoe2rW04lBepGslXfafkHeI25KjArZYqEXmry60x2/lfllL2lS7GUJhjpQWBHd8dGFXqzE1pvHEzm38FTVEGipn9YbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6iSmdES4lfoc3iz7TE7FQG87FV29aHicCJ2/6Cpyvk=;
 b=Z9BhoHrQHyVjHcyhoDFH89RuHp8Z0cKG2BoFH0cqtRdHHj7Nfser+VeVDKUp7sxrZhvVVpP6CLPhi3F2c9y1ihMLl+VKVhDtmcurVdQ3TvEy9Vd1YSjht2mGswqQ7wjV3ctx5ARRw3IH4Vzed/Cb/m2immVTL5z0L3gLJmpfvYrtybON6hKmTUtWSeEz4Ex7w4vKDoioC9agqD17lkbZDrx3mDl9+2NGgZdcc17lNeYXtDauvpxoHSlJxyv7T05mxsnTvtXxqb1yYNhEcrPrg/RvOyD649SNtP6vT0Wb8ksJ0QHBtESx6cW+xEv/AJjK91TZ+tef6uEPVOupM7Ovvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6iSmdES4lfoc3iz7TE7FQG87FV29aHicCJ2/6Cpyvk=;
 b=F2B1XWC7+3bpfoRrwF0y2g2GKowUwdA1Q++7uHzaWCFlO+ayz915LxRt88PDytxFLn5vvtbeqVX+GOZthZZkSfL/0yM2vL0ZxAJv5q9yfgyd7MJb1sYhYHoaC8oECpUEFv32mm0EYjK4FmowOumdod/Wt0J9fruQ4xdYNC8pC4QE4hIVr4ahssxN1BSC1ONQympLfHw5j0IGSunFXmH7PAVu8OvUwPue/+oTlovdFMPAH0dDbd45p92TVXTyr8mrHkRPmqcQVTGp15U2ZZD2EGvUAswUW78Wtx5l8rSC5GTp0N4bd7auHpRgW9J51I0SAJ/h8qu02xfmeZWB35ehWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7454.eurprd04.prod.outlook.com (2603:10a6:800:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:18:28 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 08:18:28 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	khtsai@google.com,
	kexinsun@smail.nju.edu.cn,
	hhhuuu@google.com,
	kees@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: gadget: udc: skip pullup() if already connected
Date: Tue, 21 Apr 2026 16:20:50 +0800
Message-Id: <20260421082050.1260823-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VE1PR04MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 9deb1f7e-46f9-44b2-d857-08de9f7e90ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5nafrlGnscM06e43sH9cWZ5wOYN9Rf+NLMaQttpgYZLd+lZcJ0ggvB42Tesgz+hlgrdHBwQHGU4yEwCScKtUDbEOMMcGVoGmgiJJA647pBiuMRk8x6E66M/NMJm5ryoAcLDBj+vfHY2OwNVqOd9lwUbjwm/G31LNJtzie0pE22VkavnzBnBN5J+N6QvtCjcvdWpgIckbDYeGcu8536CfhXwI7C5cbHvwkNy6zV5XkIUKAad2xmkWC7u5aDbPO3MnpcBzm7Dz2cUDtMfOEkG9vM8NzNdbjaU7dTLt3qnSxGv5wzgB9WviFpE4wf0EApHT/kAiRwiNKp5GUNlVTg9yXxFegBgzEm3WR6k34Y8o4kIQWrdKN8hDE2hlIlxBI6/oiIA6vU+wC1jaYOSsI7QvW7bOvqUj8rzfJTOA33NU4uVrcKMk+8ZJxp4mvAVS0QL3fZK22fBrRSdv6dwgxUrrJn3cgpW56yNVyMUO+jQgB2PBK1zUnW9puG+/zhctwzq8K+2OffAq1fSlV4W0utBNTsPUbfpg9PI1puTAn4wA39tet89saSm4Sgtm1NA7io9Dxt02XxsA4nnRPOwR8Z9Ds+sRnzJHv3wnLQOxsrEXQDN6tGOgVa1Vm9mTxkA94iUIsJH1i27EsUHFsvAJVgqLmZg8CVJLTjZ+d0s+2aW7gGwTqlJ2j56N2q/9V++KNW/AhZGsCieClCOBzdFN+mNW+Xq+IvtkohRWTKAcDF5iFppXD1b0U6GxaJe9M5rLEgDI3TKen3pkJ/D9HL149KkaBLt4UWoIWi5jJESMIpXRFuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1My8e7PKv1BiBFWdLc4JX7OLVLx6rcEhiv82prwVwXcdkdonNZzkKcpYCSiq?=
 =?us-ascii?Q?IeS9V4wtEeCGv805c0oGgBfKIbCfseyFVJC61sUnG9uLiixhxXhV5/6LZZdH?=
 =?us-ascii?Q?CNLIp48gD8pJPN+o+q3w6eSAYcGzwFovQpVpGx1zbt60TuYx6TOgFfWt8eXe?=
 =?us-ascii?Q?fpQqHzVX8sgF+MXwieMObwN7c2KlRK/ibTrEPgO7f/npJJ1cmSZSPxXtUm7s?=
 =?us-ascii?Q?Zap2Y7B6YHiqfW2UFw0bvQAlV7td+Z2irqaAGZ98n0B8V6Kb4LGztCHBeFSW?=
 =?us-ascii?Q?t7JC/P4Olb2ognkj7lik5fywZboazfbPDzbSK/Pv9jT93ANrdsKtDg240QXa?=
 =?us-ascii?Q?cy6BxKm3yFi99fcfPiQ8IWDOluMWnoUG57d4wT6KNx4tkCHDDakZbhlqKGDv?=
 =?us-ascii?Q?KiDzGcp/huYlRioOcHMo/YzQuTN+JCSkV90Ez6LtBjdX/RCVwM4Ow5YhjW1e?=
 =?us-ascii?Q?GjYLxiaIT4AsG3CDnANTNd6bnhvLwIiKmpVVuhHvRqHdDs+lz1b9eEwHOw+9?=
 =?us-ascii?Q?RznQWaP3d7mQ7GZay+ahKusTxQwuuRcYE1C3L/YRZUQPW8W4AqU1naFwvBls?=
 =?us-ascii?Q?acjMYB3MJZha/pXPJBz5N2wl9fVxMis/7DmjDlWSAf5fesiiFc7y8mjlAQFB?=
 =?us-ascii?Q?8kf6jeC7T6rUp3JnHeNDzUQeiH42/ocM23tt4UQorTWykrH8GUj5QSN+ng7A?=
 =?us-ascii?Q?i5WnTfQmPv2so9YgorJfXOlQRujPnUudCTzX4HC8mWiYsrNnd3FdGcpM65sk?=
 =?us-ascii?Q?HvuKOS96cwTRvmpVAhh0fzqgc8a+2ZEV47DZvC7B2+7WCO6ka5/K7RQGp4JQ?=
 =?us-ascii?Q?1ItmJ6YtznlNbHm2clFpf0lOXFmAsg5/xgyn1sCFGeQEvTo4eFW5gdXyjp5S?=
 =?us-ascii?Q?5h5mkhG1GjsSZjeCSgp9BkL9f7kmRwAYblaKhKnTARAr7MTKQYn/RXrUCdJ0?=
 =?us-ascii?Q?vZ36xlAKe3McsXotuN03+oQU4j2LEIJ57WpAPRZIXu7xAEKK17frGVFFhh13?=
 =?us-ascii?Q?MKr8TQ8PGzP+yRNDpsdSZq0pr3hKeMjKrTd6zvFz3pn/CuG4SL19OY20rcsu?=
 =?us-ascii?Q?e5hOMLYyHH92H2iEwpT/RSZAKzkE13tU65HA1vAeF4A+8dm+zhoyx369dCur?=
 =?us-ascii?Q?DGw7ElToTxj0eSFP7VOW2VRPRyFE4aYzvJ/TlspK/rqsXb8KS2x4qwTlXnTm?=
 =?us-ascii?Q?7Vu1XQMfQU1dahq70KpOvaT2oHyCP0AS8Q6f1TL+0isa6l6JCnbAMzfU/V/+?=
 =?us-ascii?Q?YrEuIW5wtzinXAwyBBznaVmM6GbyK1tLmgUe5vqV8Y6pKdhu3v6nyczaipYV?=
 =?us-ascii?Q?lkQqrsVhPX1vHHxi/JEHEkKpfghBs32iGLKb2+rreSm0Om7qp6ihK/nCJLQN?=
 =?us-ascii?Q?3eynWdVQ1+o6NvHFW8DCi3F2SGeLktHQCD5Trp+jK5qVESlS2SzTF/Pvt1gp?=
 =?us-ascii?Q?yi6DM/VCqtwc6Ahp/Zu57r8tvzZdKj7N1kIZx+PKa9070Gx/e9UZ/xkjoIv4?=
 =?us-ascii?Q?1SHRw/ZO7x6muXkHBuvzKfS9P4gV5krCjmJNOsnQQj50p9lM/idZVUOkM1XT?=
 =?us-ascii?Q?TU6A2PDzDfMnPuKAbfLRD1NE2/2gki4NR+Kc5DC0GuxjAYGvf+Ka07ZgKbPN?=
 =?us-ascii?Q?G9Zn6IY62hjC++5873360Y/TjkhdnZVEWOfGTj8SGaR0ADVuBEAGN2wXBUlP?=
 =?us-ascii?Q?XWQ6pdoIDftmCzEt/YdA6VlAwZ9amySHWxrhyK4nXI5Nk43u2TiUYcgwXH1z?=
 =?us-ascii?Q?acpd/b248A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9deb1f7e-46f9-44b2-d857-08de9f7e90ef
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:18:28.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: worlnPD7S2q9tUDBn+eIFknw9x4cquKBfEV0nfqsHYIcEWOOzMTPTu8zwV+xAPvrH/DcKT4mVZb6Jgsp1T6DTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7454
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36380-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A58E438038
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The device controller may update vbus status via usb_udc_vbus_handler(),
which tries to connect the gadget even though gadget_bind_driver() has
already called usb_udc_connect_control_locked(). This causes pullup() to
be called twice. Avoid this by checking if gadget->connected is true.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index e8861eaad907..be29daa7ad3c 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -712,6 +712,9 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
 		goto out;
 	}
 
+	if (gadget->connected)
+		goto out;
+
 	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
 		/*
 		 * If the gadget isn't usable (because it is deactivated,
-- 
2.34.1


