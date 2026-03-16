Return-Path: <linux-usb+bounces-34854-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MKeAsvTt2n0VgEAu9opvQ
	(envelope-from <linux-usb+bounces-34854-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:56:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690F297805
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09972301D4C8
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 09:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB72F346E57;
	Mon, 16 Mar 2026 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="B91Vd5z6"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0692178C9C;
	Mon, 16 Mar 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654528; cv=fail; b=qqcfA2MIpbA7mmqmSaQkqM0TS6CL3+q1w6DiwrsX5Bzh6U96JTBsluoz2fgA48OtIdJlQczq5ye9lRmw5+wKi6gYwdH9sWg1No17c8qE8c80LFabRUY12767MVskec1voQO9G/biYKeWUnbbQj+34nrvIc/xSuqnPcWOha7XY7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654528; c=relaxed/simple;
	bh=/yCTpMEg9ZIDdRsK0OdnT9NSp7u95yW2evrrX18IJMY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ixyCaEPPBDSQdJrXyDQjc/Yl7m9WXQU1XdH2lyC4gqa4w6qmIfo46lcYwXVPQr7d3Lk1iTjtMYOsRKdm5A8JzKNGMxsLXFM/ZhvlDskTMpGvdvjmV4ADYA1q5m19EErmHfxiikgKncezNm60q2f/vtOnVmLnEV0fpp6qBjs9KrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=B91Vd5z6; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQNaot09omauyoX5LuIEgA0asyaHzxa3qJ0sHIrRvWC0izhQJeba0Vbnxmb8uzSLyxiPuDKvSqMHvs+pWkQTKMAkZ+87MIoB7YUTUVF5Xsa1pFFORRcle+woCzHDhQjJkNpiXjTjjEaVgKNA+pUpM6E56K/TiHL76/7ZoIYt8GvxhQY6bixpXPAuIyZ9vkDiWAgLxIagPPzDz5vpgdbqOdOnOT9ihtZiy0UrfHsJlFJgtpvdynIHaMML/kaPfWErC/RAWXPSS8UW1oteZX92jKgL0pajmxMExm1qjpUW729eMu7CIDcJvAIppemDKfL0x9yfX9TpBJEJ5bOqQyhZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZy26DxXXcYzaDBCUHby+VPIpY+tm9Hp4zg4zSj/YOg=;
 b=TSqfa7qjEgA2Ogu4Z0oeycuQsudMOP80/SIaJpYEeg0cUKaE20bRoihQVEaxkzN4qMs9Juyv8YxC51Jz85uvDeJpG2NB/8uv6C3XT3HqQ7dI4ViBD+Oe37KZAckRsMg020L9/GsUmxs3f3xZ+04cNAP/27+s6GxU5ujLYOG37CaDsNezqUrHcFDMouXjI/Q9RX/l9nWQ/8cVDFj4aKzbnSoyygUbVVQpWdVL5jIPVGcJGhkjp7DFdNV/QOvtr2d/jZwcNPTGJ0wGNRZWNiiz3w8IWFnYKDXmHe/Cl0ZPuBrYQZ1JwnUBGMoIacoxrAB1FO1P2/VPfhzMJ59TbAjZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZy26DxXXcYzaDBCUHby+VPIpY+tm9Hp4zg4zSj/YOg=;
 b=B91Vd5z6eDXu0ZhJWPcLO2oNZ5vHElg6pz7I09bZYQzXQ0/3/jTQXLAOWWU+LyW3pb8w1L/wSOmvLNq1iZ2Lg5fJwUmR1/lQzZsdd71Jwou0mkRcvAidId8rfLt0jFGDCPnDwa/DgVgUPOe6wt2i7iAbaXLEDlxsmjAsp+eKmwa035GVRDfJ8wSrQac8Ea9QqSckEqtl4/aZ5fdZ7aNGN8p7XgDAU5oOY9hGbqtjzDToiefS34Th6FEZSz9b2kHVDThNULussSyjFdLN8hzh+DEtVkKCbxQFxzUjYH63aBdtLUrVrygaFnV+Iqr/J7u0vu8uCx+vsIt8B1Cf8BereQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9437.eurprd04.prod.outlook.com (2603:10a6:102:2a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Mon, 16 Mar
 2026 09:48:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:48:29 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3] usb: port: add delay after usb_hub_set_port_power()
Date: Mon, 16 Mar 2026 17:50:42 +0800
Message-Id: <20260316095042.1559882-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a85ba4-df25-4f05-e5fa-08de83412dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	34rsByoDzeBAW5qhJrjtYLV/QRVXmQOr2XCSQ/CDIi6YR2CSUZ7D74l1kypcZnghu31N8MA3+endEvuvA4YEIdAeMbc8zV/86P50ugmUxu3eLH1q1GHMPOE95UYqy8hRe1y8Wqd4KoPNJjGRLib31z8fSGTmh5GJZS1DFESNP+rEUxqJKAT8b8wW8uWkssH12hv4272MdmMc7OSn1ip1Ce33OOUPVG4DI/zVDox1JQdKTYklWb6jcdOjjhTPO00vNWxh1y4kw+EfCiGq6c5+UidfCGPH2ZZiG92sN+/ujJFXTFa1coymltkJ3lVjslX+Ch4W1Ruesb5FXgFIOyJasdOPlhRJqFfq5Bre4gsFCawHL9o6kUjhBxGeX9Qm/pYTHGLrwdfnxnWSjiXpQ4H5MRDF0hImt2Pakz06IFlVWhZE2K+TojuB/xbSsXtUDR7xOViePcdjhEbjP03qzwaeo9pXDuRwhxeMSAX8PlsS6WCf9q3YPdpdlJn9kZ1FtwMNPWFp8wNTbXDot9tSLqcDCpMY1jJyIPS0YDLFNLSWkmr//6L97OL3PdpjjpKbNWt7v6OYUrGMISNmk6zwt1goUUfD9j8wK8jjE2PvE2uoBJXHSe1AWvdbBjFFqlSTsizXihPjB/Dwb/DO/g0eU2rKc+5jzmB2i3Yc+37doleQtEblkX+uwZAtCJM4szOjpxPS4zgyZ0kqnxDcDzENL5lyf0ax9LH2vbHh3emB4dtWgQFVQIHIknOedBACOFcEqMHWvtqoW7tRLmOFRfllerknfEMRBOekuCpcY+Zz4rU0zRY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U7cdSFRLNlVzIsTrZXnzeiYNzNVH36GJ2r9toPzN2Cw5kQ2A5Cn5AbJbe2W6?=
 =?us-ascii?Q?qr6fvqLQpdHcdEzw52Zna6oIdaGzRstIxscswOQmfL89YFzfSXlcPtXY8y9w?=
 =?us-ascii?Q?xI5wFrqlTTNIJqh2ql0GdgiTNAJmr1S7gEpGqDpYY4YM9+YerePYYiwhvEuP?=
 =?us-ascii?Q?CPnW6eMFPMkc855TeQ2ioie4iwWkvWYxBDwUPEJXfCMJytORN5llVzZq4JBw?=
 =?us-ascii?Q?s6vvyzgTQ75g9ki8TTIEUjMvjCF+92Qo9qvgcUu1EYeqrGAXoq9LHAKEr5Th?=
 =?us-ascii?Q?Rrw7PRcWS/g8ZF1nOymVmvOV1iWORplGWlF/CldqvTbG/t1QLA2Gg5S1x0rv?=
 =?us-ascii?Q?uLmy9lKY7ZYw5UaKzLW6fRyIlt9gsbB+xKvTm7oqZ4nC91O37omR9ftuaBrz?=
 =?us-ascii?Q?ZzEu1BNULCQioEZq9ptefUj1ADYjemCVyEstX3x9objMKA1UWaKk4q95GeHW?=
 =?us-ascii?Q?A7JWHlWoXcOC9C6aSrymqrYr0yURMTxtCqqncM3qnEWVoSp9oQKCx+FBaMtP?=
 =?us-ascii?Q?hL3VMF3JgUe7P+UHLqOdBKG1aT8UMHcVC0OZytwUu4Sif345pb0goFmR8prR?=
 =?us-ascii?Q?3fRZ/9G1mSckNTamXelLgQUCcXMCRmNPbHlcHp1BxaJNUtxEaDtnHhKqbPef?=
 =?us-ascii?Q?fpJlUTMMn3m9/UtgdMTZBsGNnlHAVNfTdrrZqJOKLuqxatHSwwIkCL4M2rsR?=
 =?us-ascii?Q?ccRVWk7hEXMsbFsybkhFkFCq1KHhiVPlB4gyKROYCuaZcl8vubX0+JHIh0dB?=
 =?us-ascii?Q?XpKOqdvkpYith3IZ2MgDDqABWpA1AKpO1ZMKQDP54cdN2cVLoOkPyGqDaSEr?=
 =?us-ascii?Q?cUSoN1rQWEt6JX+leFBaw+qtzOe2rkbF02WWdwAUiIrEhem6Vr7MZwqK1JBo?=
 =?us-ascii?Q?Y/muc/zLVjj4GyMa7cMQzrCMW+hHAO1CkuKvTr8I0e6pKgVPlt8qrjI+Y5ik?=
 =?us-ascii?Q?oc95WtCyoftzmZAqw7AUEA0R6iJ8GZ0fhgbZ9UKdaghi6dJ1PAF8qPiKM4vB?=
 =?us-ascii?Q?268HnqA8uTRYv6heaw3qIq7CTE9kF7oNHuR1Xq5BnqgCM0JL8exOVAG0Sj+X?=
 =?us-ascii?Q?3dYgJHYbESZdzybEugGQPFhUKoOs61gcl70UYpK84CtqaCmQ6jIvj4chBSIK?=
 =?us-ascii?Q?kiA/b5Tp/ROpRec/zT2dnjtqhMlrDGwYEai/XTuEcHA+6HV1RSJRkxA28PYn?=
 =?us-ascii?Q?aa2q5lOwl7k6AEdmCYtLYnZBzQoKvm6gqH4p0cnhVK2HMIbjWzCVmIKpPzNQ?=
 =?us-ascii?Q?yDBA0W6SihjFQ/f8X9U9ki/GoSF5JZny9nzVWJP19h45rVLGrohubVsaKQ+7?=
 =?us-ascii?Q?esmOSECkYlYzL3KTqi2frCbEkjZ3MdNwIyb/J5P8StvtedFk+IHxpjhgFphf?=
 =?us-ascii?Q?+CXg5x6L79OTp+7HXpWmVeR/K6P2t8suhumAX53VVeEoeRBAuoLaoM8Sfjb9?=
 =?us-ascii?Q?b4q1QS9h+vh/FG9AEMsZGdk33MbllKeSW694+PUE6ivZrEJnbxtZF6f6zxg+?=
 =?us-ascii?Q?8OSZnUVGfhX9PxWtyPy0AdD1LGHUGTdDqIjRcrtNbh3s1RLetRYlQoqQzz0l?=
 =?us-ascii?Q?GaKxJK5npEPIBqesNt9pz2Ng0EGPrVqIwRMrpxXjlChyYpI3WsGPCrocTuBX?=
 =?us-ascii?Q?5mF2d/+woULUbTMZcqqr14IWrT3pyr1mToNvdmf94qhXzgIqEsOm4Mm7NpqT?=
 =?us-ascii?Q?Q1cOlxAQz+uptlKeBdJ3ug3gNT3TT/yaKRA3ugsxnQBVUHMf+z3PwXUIAl9i?=
 =?us-ascii?Q?LbP+Ux9iew=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a85ba4-df25-4f05-e5fa-08de83412dbd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:48:29.8695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+D6roBlI3OdBBD4MjR7ab/dlCgb0sSV6Tr9moghbN9I+odhTyiJ7Z7DlGv4/X2YCl698n0JbXV+Kp3OpffcNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9437
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34854-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 9690F297805
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a port is disabled, an attached device will be disconnected.  This
causes a port-status-change event, which will race with hub autosuspend
(if the disabled port was the only connected port on its hub), causing
an immediate resume and a second autosuspend.  Both of these can be
avoided by adding a short delay after the call to
usb_hub_set_port_power().

Below log shows what is happening:

$ echo 1 > usb1-port1/disable
[   37.958239] usb 1-1: USB disconnect, device number 2
[   37.964101] usb 1-1: unregistering device
[   37.970070] hub 1-0:1.0: hub_suspend
[   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
[   37.974412] usb usb1: bus auto-suspend, wakeup 1
[   37.988175] usb usb1: suspend raced with wakeup event         <---
[   37.993947] usb usb1: usb auto-resume
[   37.998401] hub 1-0:1.0: hub_resume
[   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
[   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   38.118645] hub 1-0:1.0: hub_suspend
[   38.122963] usb usb1: bus auto-suspend, wakeup 1
[   38.200368] usb usb1: usb wakeup-resume
[   38.204982] usb usb1: usb auto-resume
[   38.209376] hub 1-0:1.0: hub_resume
[   38.213676] usb usb1-port1: status 0101 change 0001
[   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
[   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
[   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc

Then, port change bit will be fixed to the final state and
usb_clear_port_feature() can correctly clear it after this period. This
will also avoid usb runtime suspend routine to run because
usb_autopm_put_interface() not run yet.

Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
Cc: stable@kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - no changes
Changes in v2:
 - improve commit message
---
 drivers/usb/core/port.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 44e38f922bc5..027a5f21c5f7 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -141,6 +141,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 		usb_disconnect(&port_dev->child);
 
 	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
+	msleep(2 * hub_power_on_good_delay(hub));
 
 	if (disabled) {
 		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
-- 
2.34.1


