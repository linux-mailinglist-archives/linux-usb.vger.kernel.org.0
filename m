Return-Path: <linux-usb+bounces-36467-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMC8LuMd62mRIgAAu9opvQ
	(envelope-from <linux-usb+bounces-36467-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 09:38:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A545AC5A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 09:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD8C43011BEE
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 07:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598873382DC;
	Fri, 24 Apr 2026 07:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hwiOfjoP"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D94B34A767;
	Fri, 24 Apr 2026 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777016274; cv=fail; b=tn8qw5ZBjRyJAOolDU2/D3lFEntWGSzJFJ0HlKKxlVoNOTF8pkN9zi43Df8VHg843WhLDLCQ38UskAuriTdLR8snKo93IrBMJTU/HYULu0FVAkhismkPEk3fxovhDvwkJwUI2hfFlMzUXzsnA/mc5z6Gai9OXSINIhyZVyAJO0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777016274; c=relaxed/simple;
	bh=U5YqGyw+HKw8ldfY0uQo0oLTwLUT+LOsTzWcfkOKPQM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RPGtOov0uN74qvRQhvP1kNjyvXOfOhCLmGqrDJBrCuG+csCUfLn7KppEPfUlLkesDUKS8MqFqDeQ5yDEe64RKsZpQ+yEqEjQzXEXqSGCDM+wJRet7CNoLX+OZZEMakVxxWN3pyL71vTnn6IF4OkSrx8Y7RX8HrtfWifyYaCSgVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hwiOfjoP; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMQLkbKY5q+En70b7vouYWoLSy8GwH/y+nxShLCVSTtr5cWzIj9/12WHmbPqCF11OfCq3S1J+7kxUJsajly2oM5LvRU4XMgaL/JWHdQSrLsI3WRZWL5+44h4FbKCbeSKAxvmO6gtgVmCVnOhC8KNHGNwESjwGlm4h/Xvus2YEkUWMVGsp65EjRwlhGlpTfgjJm4yCnoLd0k1qbBSYKXATta7nJwMZAkIjQhWb7OyA2moJG81QyDCW6Ohi+JjtSt3U9KHLACu4ZJn7+Mv1bhIuuHKTFNV27cW81KA5uiJ3eOtkzBf67psuOGekgjf1u/N+hFNqLdeqUJ8JMMDBmMJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By0rpXWAqEPHy/gDqEOx/x5l9QNukIwBjdejevuHO8c=;
 b=ofeeZlgOtBkrna81+T9dGQY1gOoLbADotZByn2HdDovh4BtOxs8HN/k0LftmaYy1mzrWNNhgaKQ+OF+wUMrXxna2Y+/a4PS4z1n7c8LBrz7SuOMJbkzfHN9+QsHjLK5NGaxX7xibnlz7MMAg1Eg1fosX11V21Q4BAaCPt3rdNAmCYh4nhAXWNOKDpXmUjsSkzCj67h4IizEHcik6mp0fuWT+L8D+gMy1oreFTE1zakUKrUVvdBTLrVucKjjDrSWa6n7YR88DzddmL5aSnfdrQvEOpbYoWF9mww0of1y1fs8B1TO835J6Nr+P2aC23FBBOMIGONmsn/xSgR8CQ7cOhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By0rpXWAqEPHy/gDqEOx/x5l9QNukIwBjdejevuHO8c=;
 b=hwiOfjoP0jLm4ZX72v1qdE/aiCU6GZ5g9Kivh4Y3BxF6y0bo/YP3ObDpUmDwpHoy2B3HRHn9KxW/pWDK0KJER/sHxYYwNL38bfpo7QPX1LT0LotMpjyUrHYN/EMayo9QhDL3Uw37kcwA055fXGjCxH32rdlcUoWjFEVNbBvctVGWftzpBc9iRBdVS92otn+0tE3LFiBkR+l4brcESuy55uo41FE29myjeA45KsKB3JTAlvj0hKbJR13F0DYH/5EBMMGK7axJZJGUl2zeoGpVGGSEG6KhV7nk9WZzygrqQOjDg+zb0m9XZeLsQTVSkSS0XKsTQ+0+64T2CU8jQelVgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8519.eurprd04.prod.outlook.com (2603:10a6:10:2d2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 07:37:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 07:37:44 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: typec: tcpm: fix debug accessory mode detection for sink ports
Date: Fri, 24 Apr 2026 15:40:09 +0800
Message-Id: <20260424074009.2979266-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e2594d-a7e6-4fd0-10da-08dea1d45f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|38350700014|18092099006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jE3fqVoKvEhnXwQ7LTafizqgVESu1aHBFVEyQ23zUf5SZ0J/dQD0gbnl8v6rPVjse4s3SpsodmQ8XdxBToJ6U5PlezA0NMxp8EB8sljwN1uDiyhXMMjKnRxN2PKrV6t5odfbl66jjZ3v+E1jggfpSIQWNfOepWXs2+rSrKqaoquOySYY1yFJYmChaH0HBFnvhvmLta1a5TSw7Bwy0LziJ9u+Xb0yoUHMgSbhPTz+OGqMrGSOMpKIaVwjV3zKMJDO/pn/lMEtrSwM/Qj2p1hchLj0JPSg+z6QHgDE1QhvctLNlR63qtu4Vq8RJMs5/vHU4QcWoz6YEHiR4yDH3v7Ld0AGbtTfSAZophhUmERBX5IJ/h0jkSxXEZeb1gaZe7hsbYlw2/KNR1dpQvjwyXwzSe4ErByoytFMEJqvuKs3NJE1f2plCGCRlzLatmUM9oPAk1/PZUzeKyJ5C1ZXa9OlYFgS5wWIrf6qsKDgLaZLtuZgi/hcgfOj/6x7oC8uX6FfHqHQ+2XufDKdkmB32iI0EHb4Nfiei6ol3TqikUgJGj5h2Q51NCHvWEGF+qk0cayfPO92vQk+I5bcYUV7brv8HL1xCsFqdCu/Uk0clFWvfpfLDcNp33NFc3p/zb3YuJgE0SOkRFXcLJCPVHsE1XuHOC/9Qgj3UwR680X8N3hR+InEkerzykj3grdyvlt+PIEgKsCG5RGijbSSkdZACA1flUW79AOFkPXQ9h54pfaojWessLRfszbwNPrFpAVLQL/ATSFeMltk08woCKgu9sdtN9nWs8h78jHpJhQQhux8nXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(38350700014)(18092099006)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GjBlt8e7W1q7/yWSkUl07UonMH1ERNqP9AY0uGuppRbwJuI88BUgjV3AkjNH?=
 =?us-ascii?Q?eQQSFdRUGUjuabiwAO8Lv9lQA7Ea0AzN9KxzT6hvZ4TYcOaGlz/Gs2p/VH6D?=
 =?us-ascii?Q?7ubqFpYF52vaRV+iKPhA6y3Pq3ek/oqycjkgIcrUsHxemTlXnY6f/TJp2Ut6?=
 =?us-ascii?Q?edoxPTRwQkxNIWMQcU8t6kYpnHnLnZfi2qLOlGYWD2XMKuJTpxk2norEw7fq?=
 =?us-ascii?Q?XEZjAlgfy7jq8j/rAVKjMUIFbaVIW61Hn2L6WvxPT4bK/bt15DafrDXrB3Nu?=
 =?us-ascii?Q?HcS27tp3UR5Ov7vms0Xj3LYN0X4dumNWlVO35Pa4VhOzuj1uWdlY1oYw6M5+?=
 =?us-ascii?Q?peZlgGVp6jX0mqQXPszdax6wfwq2t0gTzXx7XzGGQd9p1W8JwT9dafItv9Km?=
 =?us-ascii?Q?p38izjjUDAaDKL09Rh4zMfWUzgmyznbH3RmgxlAkkmUvDRPTf2F2SuE1+sxv?=
 =?us-ascii?Q?Jr5bsELSbT30UuxyXBdg0SNcwAs5glcfoA0AnqX3aOg8G4q+e+pSsf9iDvHM?=
 =?us-ascii?Q?7RVc7jBxfKxuvM4FO41XJgHVif6xBXC9qK5dkS5V+Plxs/fPm4o1bG5cL4i0?=
 =?us-ascii?Q?dPv11Q1inhDJTDYW8lYFHHsWiq1CLTbyNvmbzcuLZ2Z2qj49RH49kJhvzLfr?=
 =?us-ascii?Q?GGVZ0UJ8Q2cd+7y7dPxEuPsCLRBZu6N0FP4zOyAO3L/tY0laVcnK8UIloaGW?=
 =?us-ascii?Q?w/tMFqDhTuLY54NxBBd0m185efurVQOr1+A+34mJLShVDmLMgebLvtMqEsOb?=
 =?us-ascii?Q?H5vHkWusotZVMqHJz0d1XNJAnZd0yVYi0ZvsZiXO+xRhS04po/FvJf3rCqHY?=
 =?us-ascii?Q?7WPEbrNUzxVEzpWdbOG5QH0WL8bpUTLVm/RDh42f7ep+BNXm0ucD0fMCZEwO?=
 =?us-ascii?Q?NIlzdagJk4MrXYzvX7UkxP8flmyBIWPgi4eV+38goEpYAu2kbomJPxSars1q?=
 =?us-ascii?Q?1VbkgwPjB5H1XLluopoDE4c4D0eIDYeUv5e4hOXJgjCyQMSu4HDh0XVkYUhv?=
 =?us-ascii?Q?g+Wn+P5SRgrMI72/gpRycapc6vAQj+XYnycnb3/xTLBD+F0/TuOc6Jdg7B8Z?=
 =?us-ascii?Q?BjIW9jriyEJrT8V3u/nIAqHya/KRWB1yXXqqaGPBXfOMjoHaV7Jo14CyBW3L?=
 =?us-ascii?Q?nibPzSzt8HfwpSRpFm/L6x/ncmrGG2/Z9SUKlIJScP8CU1hGmJgmfjrMkXHO?=
 =?us-ascii?Q?uT3g2/Hk3JH2SjFWbLz0jFJFgaq67cP4C6K5Oq2l0etjPNmIskp/nt84yU2v?=
 =?us-ascii?Q?c8R71WcreB7xUdRnX1m9peGv3+b1O1qt+w20mx8VQ38jD7zne77yxjto4wlI?=
 =?us-ascii?Q?pLFp2XA40m/sQgoVeTX8XInDKgDz5N20Qklb8wnXlxPom9xvTOI7Lfk9/qYA?=
 =?us-ascii?Q?C+AVKn4eHPZX+20HFnWjjXMlb2Z0X2UXwneR/wSP7PHOP77R4MQbyTEnM0am?=
 =?us-ascii?Q?Gzns3Ld2YYGSBVMn0GOfKNVu3HWT+AiI5dAyV/RUROLokysxmhlZU6nH1YiO?=
 =?us-ascii?Q?nDKLVPZBU0B0A1Bjf2NFqbtOvbLJLL6ETEzoNtR6AWWnmBvfZB3LrcAT/4kK?=
 =?us-ascii?Q?Neq+f7p3ZpWYrWgy8RECggz/099XzN+iMfJaEXtEtgz38vrbAuS9ouYRwR83?=
 =?us-ascii?Q?qdHTYvPRvmCiMjHXfAgVsggUFL8eYHlyu7F/gRuAfcCs2vfCXumQUro0gvNn?=
 =?us-ascii?Q?/JRX/4cVaiVi7InyFfCZCl4rfLxvuqXggGiDB57/k9dm8OFFPSUNHJdwQ21z?=
 =?us-ascii?Q?b8T19lTCQg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e2594d-a7e6-4fd0-10da-08dea1d45f3e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 07:37:44.2557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttju5YTxNFvpJp+S/AtHemMIzCYvnsqF30E79KapMMnkrGHYULBsBRio6shu8HQ8YrXjA1heH4sUj4muKxJenw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8519
X-Rspamd-Queue-Id: 276A545AC5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36467-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The port in debug accessory mode can be either a source or sink. The
previous tcpm_port_is_debug() function only checked for source port.

Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
accessory mode debug") changed the detection logic to support both roles,
but left some logic in _tcpm_cc_change() unchanged, This causes the state
machine to transition to an incorrect state when operating as a sink in
debug accessory mode. Log as below:

[  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
[  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACHED @ 180 ms [rev1 NONE_AMS]
[  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarity 0, connected]
[  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NONE_AMS]

It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.

To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sink()
helper to explicitly identify the power mode in debug accessory mode.
Update the state transition logic in _tcpm_cc_change() to ensure the state
machine transitions comply with Type-C specification. Also update the logic
in run_state_machine() to keep consistency.

Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - update tcpm_port_is_debug() in run_state_machine() as well
   as suggested by Amit
---
 drivers/usb/typec/tcpm/tcpm.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index dfbb94ddc98a..6d258efae6f0 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
 	 (tcpm_cc_is_source((port)->cc2) && \
 	  !tcpm_cc_is_source((port)->cc1)))
 
+#define tcpm_port_is_debug_source(port) \
+	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
+
+#define tcpm_port_is_debug_sink(port) \
+	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
+
 #define tcpm_port_is_debug(port) \
-	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
-	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
+	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
 
 #define tcpm_port_is_audio(port) \
 	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
@@ -5176,7 +5181,7 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK);
 		break;
 	case SRC_ATTACH_WAIT:
-		if (tcpm_port_is_debug(port))
+		if (tcpm_port_is_debug_source(port))
 			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
 				       port->timings.cc_debounce_time);
 		else if (tcpm_port_is_audio(port))
@@ -5434,7 +5439,7 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC);
 		break;
 	case SNK_ATTACH_WAIT:
-		if (tcpm_port_is_debug(port))
+		if (tcpm_port_is_debug_sink(port))
 			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
 				       PD_T_CC_DEBOUNCE);
 		else if (tcpm_port_is_audio(port))
@@ -5454,7 +5459,7 @@ static void run_state_machine(struct tcpm_port *port)
 		if (tcpm_port_is_disconnected(port))
 			tcpm_set_state(port, SNK_UNATTACHED,
 				       PD_T_PD_DEBOUNCE);
-		else if (tcpm_port_is_debug(port))
+		else if (tcpm_port_is_debug_sink(port))
 			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
 				       PD_T_CC_DEBOUNCE);
 		else if (tcpm_port_is_audio(port))
@@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 
 	switch (port->state) {
 	case TOGGLING:
-		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
+		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
 		    tcpm_port_is_source(port))
 			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
-		else if (tcpm_port_is_sink(port))
+		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
 			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
 	case CHECK_CONTAMINANT:
@@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 		break;
 	case SRC_UNATTACHED:
 	case ACC_UNATTACHED:
-		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
+		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
 		    tcpm_port_is_source(port))
 			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
+		else if (tcpm_port_is_debug_sink(port))
+			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
 	case SRC_ATTACH_WAIT:
 		if (tcpm_port_is_disconnected(port) ||
@@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 		}
 		break;
 	case SNK_UNATTACHED:
-		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
+		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
 		    tcpm_port_is_sink(port))
 			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
-- 
2.34.1


