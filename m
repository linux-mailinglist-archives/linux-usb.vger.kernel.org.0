Return-Path: <linux-usb+bounces-36438-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNwzGDHw6WnxogIAu9opvQ
	(envelope-from <linux-usb+bounces-36438-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:10:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F011450606
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0F2613036BE7
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 09:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3823E5EFE;
	Thu, 23 Apr 2026 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lszN6LI7"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D523E5597;
	Thu, 23 Apr 2026 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937900; cv=fail; b=OXT3RpLD2hs4ux8cbUL5UZXCDSW9PNVKErkTHIHpxGaw9X7HjwfiRDYBhUEts4c6Q6Jgkbnv4/1unhjBsEvbNFxpZGhOCcQRdH33yYe9Y7eRfOBU21kfAajya6mrOpDYWEEPBHdZSKAJYu9fKAFMvVkuOdy49l6Pn5ZyzlWTVJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937900; c=relaxed/simple;
	bh=WGu+/ySdiknpFNEGAhCucRja9AdEmVzaSkQCdiAxJ5w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oQ7hOSsltCcSXLEyDTedPhDhXw0ITLYaCEYWm0mK5ByjvZEGPPj6T18qCVOSzVCXzkMArKqFXEEZ0oQGEQQqgebbZDWKQFCQcUSnO5OamkiqYQeh5BJCRn+XDVeogl/FdbOE9JSJlItQlhi6Y1u8nJVFtstzfXcm1FTqMR+SPHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lszN6LI7; arc=fail smtp.client-ip=40.107.162.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMUjw/I617RLpa1J6dK6wuR5tlqiEUZ+WU8I1/8Uq2jGLg2QrVAvMCdGbIZ3AbVi906GxFn/G1ahUmUcky0J4XZuWOobk5feQXtoiOd0vaTVGsPbkSN2k/DwM3VdGEcAOmf9hXRuHDPvFzaYAQkBymQ9nZ+IVPAZOxMUlWr/1IXfWEi/x5Z5nWsumtXCJBtbiJ9Vg18Po30c+XHw+0yHNxQjRPhvPL32LujpKBwUTm0pzUH9mQvOZtZqTO+8Dxi1BHmoOAawg18UsUoA9rmhRsO3IGsWNKLXC9HtuQCsfyzpSnl1iAvfb00OtuM82pXhTsaMH/NH7oXbWnymv5vubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRDDj4nMs4b482Tg99PzxiT9TbfJHoO26KBIybUDWuY=;
 b=X/ejqaUk58HbLib4uyCRmm+GpnN3gPLrxA55G+m3EEiMigy2T3u9duwYvHW7oVWq93OGhoSxujwy43MkwxTjXmY7F5PxwSPLw4G/DesSmJud2uP4SwoMApHW5h/SXW3PuyX+jCmez1DGXRyTbICwE1UMgTE8Z6Ak8LJjmP1IgE5SQwvhDQNDF0WK4/yemoa6EUOfKQCsBb2rAx3PULkkESITDthkkOWl41PvniUAQLfBPiSYauH4ox1w2UXUXgpk6ulnoeUMkHYGeUC7sljmslkWRYY6ame6yBOnramv+CQpUjdJyLNyP/AQ8z9NtI0Nt9TioVa21tq39q5wP1p7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRDDj4nMs4b482Tg99PzxiT9TbfJHoO26KBIybUDWuY=;
 b=lszN6LI7XaLhouImvKtbNwV6D/0Xj27VQSG/ROJX/uwMsbk1aKqT4PFuh09iWZFAz8dhH5PUfy4OQ4Ks0xlktxnZOV5GkRPv/oXEjsHFbbXsEIL8hppKfMY69BNuzFTi6wC8PtAyFepO1jjq1IwXHDqX2NilBdWz9aynwNbsPLF4HxWyWAxTcefORZx0/mgrEUUEttOiMTQdm/Gd1r2cE9xAUCwUqe4a1pwVULNlhLk29DTh97pfIINZ5GEGfmWsoe+EZ/IoWaUzfLlS7+3XKakE5UOdxkQs6K8/5YvS6sZVtz81/SGgYzpa6MzcA3Rz9Nw43sXrdr2zPIdMX4+PKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9334.eurprd04.prod.outlook.com (2603:10a6:20b:4de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 09:51:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 09:51:32 +0000
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
Subject: [PATCH v2] usb: gadget: udc: skip pullup() if already connected
Date: Thu, 23 Apr 2026 17:53:55 +0800
Message-Id: <20260423095355.2673035-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eed55a7-09fe-4d9d-2b92-08dea11de648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QqIWEc1zrEcs82Vv6lcMAOK3ZV9elT0iDShIj9ujUZ/r58oeSzqqIjTVmdsDLvq2AFU6O2saZMfAX5XaOkgtuI5hxoubAEiMLm+4ZPtuIU4Eot7X93l3jrELRt1flzwWk/53MucwqXJjf3qYcLKNwTr6qWrrMLZGUs6LlPsPJbVU2Wp0JSKgUMt40UiAAPd75HrsFiqFYaZnS+PoXMmCNvdjnDcraP2gd4bC72xax4+FHGSwmahHS8NgFEJkmMzBjezP3jzGibCPVagypfSXj3gyLAli6oz0wzGrIpOAiTrK2khIXqEAVTMrg3fPB6zINTlOJMavqVa7Tdt00EsNqwlw/0WaiiwHipK4xuw+17j1Cq6EblO5YGr45GI2zlZjaL0ZHWAQscUJTOtZZWXyeSCacOXexkkyi6O8yaHiMeOvoFIPN7jzsuV36pjoLrqu6PJRLHbm/Kauu+0os6OgKUyMUc2JKN0ZWi4UOSnuWu/g1UH6MI3YwIbt3WkRY/ytDy7XlCpdzrEBc72RUR1F6rYnUWEd+1ULayVd1ebPDvBsXFE/rjHRDIMhUDldRrnmTQgqSW/X3SuC1BxFQNuJ776Ya/CjnL64ZTDiVwumZlzkcBc2UxUeg3W3lXILc93BPW8yW5dQbBu467sxIpLoZ52YPtNzrCnDxDMnX0ZIeTZJ9kfiwr/nUNL9HBoE261DJm2J4bygepPKNByeiDE5gcwX+WXF8oerMIirvBAygVil/8XR11nF1m1+UvCkXAw81e48sl6YJllJyi0vAvONWz7X8LfekQNf18PxlsSMC/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ph0U5sdIuD3b9M3InOFzy7dtQ377/Mt3CdZVe/bHUs/tpOgYlz02Q3uEf743?=
 =?us-ascii?Q?7TjXg7FxpqbKyEXPkGn748vVZYBCOM+k0N5G9QziTgUNRjFLaZEK7oAA5Xp+?=
 =?us-ascii?Q?/pRDXQmudH6SKoB9nSWqz8t3CW0BwiazqJQxhvEZurGwjniFYiBNkSc0K1Ys?=
 =?us-ascii?Q?G6zGi2EJcmfjO8gQq8WENQ6TzroRSEIgPVen6svb0yc69QO+ovkKAqiB+e/L?=
 =?us-ascii?Q?KHaJa3yG2YfPy3qvhJhFoMt9VOrMR09vcAHFf65oFeZvQPYLZZcxqi6PrGRR?=
 =?us-ascii?Q?AquQ2tvUmfPL4gYAV4SXIDRf8ML1fDteKRF90DgmUnJ1Hl/Q6HjJepPRC3Av?=
 =?us-ascii?Q?gn4k5lAo1oWcEo0s+mkO3QlJKM+EjZr3WKu0xGqoHqLMSJNeSL0IAMCiFiod?=
 =?us-ascii?Q?Y1VrLC5dxzHVt/zgHekI0v0Sbu1f1czWYz5lPw8U5ddVBfO8nzhCOnvLC15u?=
 =?us-ascii?Q?oJF8RUu2sF6NZ0r7vBIRS7fkU6zCvhx3pfMCsQ/XcI39AnayGhoeKbJNQs4r?=
 =?us-ascii?Q?1Piv0HnlenL8L5nAleJmkgo1RzuD5QdZJYMqsygT5Yzvnrm+RzRpHPjCIprm?=
 =?us-ascii?Q?dnsMSJ7GRUFysxH4MALZJmSVHugU1ETw/iqS0uph40RcCgqerbstbX7gXcFV?=
 =?us-ascii?Q?RYk1JFUIij3zp8JibD9kf2xTb8VGTUEby6J/oMlAXJGM0VY+sqXV2zXukSdu?=
 =?us-ascii?Q?H4Q4EAAV4OP7cxC4i6T1mYrnePh43JYy8xS5tvEXdG0yfdScWk8u6OjgiJ8O?=
 =?us-ascii?Q?5QOVX8E5naMqilrmFOMmMMBk6D0hq8A7UisxdkxAaj6n9EeDi911Y8ww8UEs?=
 =?us-ascii?Q?jJ27v8scVvwEVqhmgg17QpsWcj7eZcOUrMI4U1XeeZTqTQfl8qv3XiTrOzO6?=
 =?us-ascii?Q?bjaCKqy99t1de0L2zo2D7LHdoZEWkcYc/Cu/+V2Ti50mnI92Cf41dvsOUJZR?=
 =?us-ascii?Q?h5gj323O/e9dhLFK/XTcb4E2PMx/qqk7W2Qp5OvsYna/V/02dJwDcHvxI7QY?=
 =?us-ascii?Q?bi1nOGxqEJ2Gbsq7+gBmgR0kW+U1JPauIBfY6DbvH1N231R7zmdDWbVNYEjh?=
 =?us-ascii?Q?1AhFBCnp2Lq5ouFE77djA5hUCZmMJOzXLMDNtMEsbEC7m9QEUm0zo5wL/cuk?=
 =?us-ascii?Q?UpEeFfHybd+dpoxvwab0/e0liOdWhFSMu/B1H+2coveg5sGL16ElwcizDwLT?=
 =?us-ascii?Q?HcnBFke2hroyor4Ck46ajX85GclymgIxUrSmLt68tG9CQiwhXW1EOWMMTjHV?=
 =?us-ascii?Q?p1Q/1eIDc2GpuGDUaiAIw3RQPssqKpNY5gW/Q9z6RQ9WB+W6xhxlIhEV6L0g?=
 =?us-ascii?Q?2aJOXlpk37Mm7k/nCiPg9Qo/ohclFfOYnSZ5vFO9wF2Gct7B/j6GWh3AbF3K?=
 =?us-ascii?Q?R9psIsmkuQWcEWF5cINWoglSDFAHeZCAzd8BOzJriE4HEkPYC0qelOxGWzd4?=
 =?us-ascii?Q?CdsnouppiY46gPh9kquPR9Moz3+v5uYSGWqhfw+Nvi9ycDgLh49snPKJDw5k?=
 =?us-ascii?Q?T23aOiHqgbODgafY625kYugZ/FM5KJm7D3HACXrgBTxhusI9bpbx9VMZGX+N?=
 =?us-ascii?Q?RJooRDaOkgrpgNUfJtwwOjv9qyBgNwwbC3a17o0W3WVylxx1YDNvGV5Yi3Bl?=
 =?us-ascii?Q?2OcUyL7hm5ae1Fp7N9oJ+aZagydxB25uJJrB4DBUawnD4WFqaWuCXuG95S3y?=
 =?us-ascii?Q?XOxYdslZHmIvXgnLtV1w70d/zBDHddt7r4JQb7YaRKqt9beagLbH+tkEsQyy?=
 =?us-ascii?Q?RbzrtfQQ1A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eed55a7-09fe-4d9d-2b92-08dea11de648
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:51:32.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WAtBAgLe20PRlBMkl4wJfxE5xAGx/f5L0GgQ0fcFOIG35DCPf81A4t85O0MbQZU42Nh31Lb4g7R+MVK2u5xlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9334
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_FROM(0.00)[bounces-36438-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F011450606
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The device controller may update vbus status via usb_udc_vbus_handler(),
which tries to connect the gadget even though gadget_bind_driver() has
already called usb_udc_connect_control_locked(). This causes pullup() to
be called twice. Avoid this by checking if gadget->connected is true.

This also set gadget->connected as false in usb_gadget_activate() if it
became connected while it was being deactivated. Otherwise,
usb_gadget_connect_locked will return early and pullup() won't be called.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - reset gadget->connected as false before calling usb_gadget_connect_locked()
---
 drivers/usb/gadget/udc/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index e8861eaad907..60340ff9edbf 100644
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
@@ -885,8 +888,10 @@ int usb_gadget_activate(struct usb_gadget *gadget)
 	 * If gadget has been connected before deactivation, or became connected
 	 * while it was being deactivated, we call usb_gadget_connect().
 	 */
-	if (gadget->connected)
+	if (gadget->connected) {
+		gadget->connected = false;
 		ret = usb_gadget_connect_locked(gadget);
+	}
 
 unlock:
 	mutex_unlock(&gadget->udc->connect_lock);
-- 
2.34.1


