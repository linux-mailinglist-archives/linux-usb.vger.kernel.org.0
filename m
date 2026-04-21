Return-Path: <linux-usb+bounces-36381-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLipHS8152mg5QEAu9opvQ
	(envelope-from <linux-usb+bounces-36381-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:28:31 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5EE438232
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 10:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E9063020A90
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 08:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB26439936B;
	Tue, 21 Apr 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ju+eYyta"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20D392C2E;
	Tue, 21 Apr 2026 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759746; cv=fail; b=PNgkLABIxhHwWg24W71iV3Hx3ly9vpdyHabxUXbjv/lcM2UPgKCNTXYyItzSiiGoCtIvKSI8G6utiQghGzRLh6ZhGeJ1nYNXTnPUebFIlTL18L+hwIIpDx9Qzimjois94f6hHjQIwXV/hejmpuEAhlbp0oej6YquYipKD11VAzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759746; c=relaxed/simple;
	bh=Ryg8CMhQNtHobKe4+AOgnDgNAyDn863zSEFhEZWXSS4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=a9KdNAEZ1+d0xC5N0UCDmojeI4pkWuFrHdx9NcTYPAUVFJ4nVdi/DNJUWq8NEA+wkxVsASzOsW7zoO1q97O/N6jeZdvg4Ru+RtTbb6ihr4QEgp5+DUvdnNBaFnrd0cAVTG9msMpg1XYMzqiB1hlSvLglZ7WL2nYlNomksqUQckc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ju+eYyta; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biIC+FlnwRr+l1ey8nnVml/sAULn+VzU407kJ/pVrRoztEiVGWu1ZEkVnxxpfFTt7ASKPu5QCsy3TFctVomCMcXDRMt6cOyPOiIiz91ihKRO/kV3dPZI7KEt9wL0X5NXULDAfahroyacDPFLPFUsnSCs86fRZ557Bx7QylTDOn45Hx3nhDm9q0u/JTNmZZqluvBUP0zGWtqMnkYNsnfUi5gHLjB7pkKmy/GEOvwFISOxPMmoXxuGdUFU3SVioIE8/Jv1yhW/usMmwgwjqUEbzHpEN2xN0F6Qk+ntCrFsOBumuJviKCOLvQhD3HZDdbOYwtJlEF0wSrUfzGKNx+Eg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DiEPxff62LDTvU4dB18ggVe4zSiiaL4E3zrXe7ctvM=;
 b=HZkPZ2XnLv10WjElH+zfV3LfowuFBHSWFiu7ONuJ1cviWy7pWQ2bibdmQ9BAMuFbznHf6SnD3PnO1iWTbWb6KHqqG/AtlB5CtnUS4Zd6mrHmgKwrd2o2/CgQclQDxQXKK3eINdQIZWUS2Iuyji6G1sOOLPPpQZwAGYlC3fO1naGuSefO/eXG1taN8FtnwU8TJUu813GnrlTNZM9BfsDFyfVti9u/gbLfSDIvRacJ2KR3ZF6ORIW5rzEylL2EUtbwLw+Wgy43i0qEYB0ZStrGw7YtprUhp53RRnlqHoNHFhyL0irMesnsK5Mir0rsTsyrb6iLk76v+6En8oEtHAbhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DiEPxff62LDTvU4dB18ggVe4zSiiaL4E3zrXe7ctvM=;
 b=ju+eYytaxOqw7j1vTuIdpYG5LzMVAAgz3QMmPuNCd9oJHTZi7X6PU5DTuXK9aWf57YAm1c2Jkg6CPwvQ3JZAg9yVNK04btsbIXGNSRbn1LEoP980jhhURbmPNSLXNpRsTRCwE/16NOmGjG5wSS0idRw3ko8LIjaOs6JfYd+EPhIh/eUGUJqaGJE+oKcl25UngVjIpmgKph5BxNqB/vFDOgRtylLH3Xp5OwUsvEKquVy792InRigyEJT0c4bgH6Ri2DoNMu1eGJ7nOqyc0Y2khRXAe/6vYB9wcaBZdLckfTQ+9JUOuSxsM8jzJoCNW9SdRyjvtqIVcpBEXOhIalR1JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 08:22:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 08:22:19 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/3] usb: chipidea: udc: add a helper ci_udc_enable_vbus_irq()
Date: Tue, 21 Apr 2026 16:24:34 +0800
Message-Id: <20260421082436.1264442-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0219.apcprd06.prod.outlook.com
 (2603:1096:4:68::27) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7532:EE_
X-MS-Office365-Filtering-Correlation-Id: 39561ddd-c8ae-4bc3-e7d3-08de9f7f1ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|19092799006|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	TmbZVmoobKKwZEbPNUamBV+PlaFhe/hkUWGvHM7XewXy7o8HCXqYEEbKWhVH7vVw5iaUFa+obkqj9TAgy6nrURuzYLvEDci/jdsanOHT+hnoUWuG9kHVaUhML76Rz+BFf2WkiKIvgpvJWz1pnrOtpGSJE1oLX1gDiZf+W9YfjRTwv6JCg8F3gHKq/TDboICPjluln7vGonVe2xiKU6qaSbYilSd+2h0tfX8w9c5AJ8g/auRCviAepQN7k+yn2A50xVVa9rtiUlmMQIDxMjTXTGMTpPm3Dkm6bGimoy+eOHY5jdGFQsG7DxCJynQii1c6fR3ECAa1qQYzCi6fN+YaJblBg9ejVMV40EfivXhGD29DgxIgskOiDJyndtc5MIfUry+SatnXJUSmydyZaXGte62YFl3C/KfZHgEhNIpKBUqxZQ2ahleO78PlL0DZMtAh0/1EEvDZ6uQhtENUQ0xlWXBvzAe6OpKxGfLC1soE423d60fyGzzE5CeODn0FrIk1X1MM0Jd+wOoi/h+uXjSSdiQBhwF4SVKzPxm78x7sb1pKVJNtbWv1bsiLCBlcnGxgdgd8MqY/HU9uDXXltg5tJ290fmffLBpOZ88W0arV6T2RVd+oh9isSIy5wGazm4dYteGTcX8cXdp3PGU34XYdtCa4iCaiKjlqMfTy3ttbNFkqKjatHDYsKXunYlKZ26t5fw+aAyPwD03ab8LKhWJIwGaiI44e+hiG6JJR6bZLS1G9+B2mQaRuB4T7Ul6okSjIJHuXPnF2CKhWSUmiEyApfwrXO8azqMICM8VtNoVMZRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(19092799006)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WvJ9wWR59Lu2xw7OUaY4G/PN4m38bGBBjc55gKV5K1tXjzuoFtQCvjXY8RUZ?=
 =?us-ascii?Q?bkUdOzHITIkxhm5gKxWPq0+b4+xvA8EnwQKGXNdEEp1NBlMUXOIk/eITohfz?=
 =?us-ascii?Q?VFbOe08JsH78vsSkJeKlYAb/wrwfu4PD8v6UM+tzL+zXgjHLdwWBTBdoKk6m?=
 =?us-ascii?Q?kR5YgZ8nSppt4rtN+0LjQ5I1zNuzvpb3dRuwXjRa97CPz8rBay6mjBxNbXBA?=
 =?us-ascii?Q?MA47kTXFJn/j+Qjrwj3zR7G9IoRrTDuYYvvXssp73xsA5LcMms3TN6fBJ0ak?=
 =?us-ascii?Q?Gbue35hOQ3PkMmkws/TwmzgoxF2qQo/51/+Oc4+9keV1KKOzqH6XQpjbiPm5?=
 =?us-ascii?Q?ZmJQQpvPi9rtRcC6xZLHXlFCwupbQZs6LOGM1UDh4XHLAXXL2IMd1+hzMf+A?=
 =?us-ascii?Q?lB2ctFce6Dvg6zw7Alm2lE1sm8FQbyYFFIULtaDklugt5EM7KXghBZDiS5dz?=
 =?us-ascii?Q?j1zD/Gg/7xy7u4aQ5hF+ur/ztB1eYvW2jP65eMW7YNJMzt892lYo2ApXAEOT?=
 =?us-ascii?Q?L8TTtbgM5swaIdYG9EjU3ZBORf4/yvp/UT3/0AT2QTx7ish5GYxSHC7nSVsO?=
 =?us-ascii?Q?JQkXV4o6b9U2v3ZaDnRN9A9pTH4jyM4QcXVpdgCNMKgCSPlbMyGULYCJOvFb?=
 =?us-ascii?Q?8lVcoNFvnxF1vX4EJE3DQ1hFdDs2XdJtDh5JsiZKR2tDzkMVxWHiqwHZV2Q1?=
 =?us-ascii?Q?5x/FDwkDpuZJDEupJjYypaK7YoWXeLhco512FqPEnclKMz0L/lx4BIxGM2Qd?=
 =?us-ascii?Q?+9B8i8kHtcUt8OrfhZ8cT71WzFP1PNcsPHDLi/H32A9rZd3/hNPaLnJSWsfA?=
 =?us-ascii?Q?kFW0bjr+34XMJ/Lpm9Gw1koJXHqycmN2BFzkmfYafRmcYk1CHEYvgrDypxw6?=
 =?us-ascii?Q?bOYyj9oX8shgE+sq38tJkGDlOP3VJ2WQxI6D5zEuhYVK3cJ8Co2v564lmM+3?=
 =?us-ascii?Q?AF1L7GdngBzzshjbtjyJVDyRiZxsxcBzE8M6WJMbk13+sfyQKBzP0QaXCI5z?=
 =?us-ascii?Q?9k9Ro2HyAhu2/amnGEoyRrBqi6g6NS/vWJX6QBCUDcIIq/aGDHkQxKoqrmtG?=
 =?us-ascii?Q?5iIk4GWSqaZElqlIzICUrTq4659mPfiyf36LcM+9z7I69Vrg87znbixjmz2S?=
 =?us-ascii?Q?OBNlivUi0s8xfpBmghDdKAF7lCK/zU5vIPSz199JkLTx2yNvTbLkVEdzEJ+4?=
 =?us-ascii?Q?lRfwwoV9K6dxmkLmLG73gKhkFfOOla6ttJJaihQTOny9rx724aBOlod/ED83?=
 =?us-ascii?Q?+hjQghI1M8f4OEnWNVaA7XbLT8h83UVUGfpybZwPEtEWPsaVBmqbh/mZ/V+P?=
 =?us-ascii?Q?JfiqGQTlTd04lL1DkJu/FN4+CctHCTSuD+QtayHUYtaREw3u+pVUyS+Lueny?=
 =?us-ascii?Q?fH0r6bzz5lOWeo/7X0PEqUqnpaCNRTvQwrJ85ZoUPNddyRZu1v+2X1IvbjA1?=
 =?us-ascii?Q?F0Om3JlWRq5t2oWkEavSkKS45rfq2fOtYpE1tXkq+KpwSGaxZCZvDRpaaaDs?=
 =?us-ascii?Q?3cE/SFjOwH7L7WXLBU4g4hMqTd6TTiagrHOIAMI0WgMJ9kjrSay6fKMCRVEl?=
 =?us-ascii?Q?39d81ZQGuktWF3hdyUeyW7sOkhuM1HI6rK5shq3VlzsEkbAVUKkUdGxS5Tj9?=
 =?us-ascii?Q?iPiSLwThs10lbjmy+CQITccB5HOL0u1m8SkO8+2zUs0RVG1HNXa+ymHpMk4f?=
 =?us-ascii?Q?qdNUm9x6yQrONLAvZAhgIFETPH8dVzDezKPdf5hAu8NsztYQWyfLsV6XmiA3?=
 =?us-ascii?Q?NUzDWFQrIg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39561ddd-c8ae-4bc3-e7d3-08de9f7f1ae2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 08:22:19.5562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FU0pAezQltGGPJs60dIwVbMNlz8UqablT7lg3bLqTNp6YeHRknkgaACHyfvNso6O36TtKxY4Dw9UVWjyJLyXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36381-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC5EE438232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VBUS interrupt is configured in multiple places, add a helper function
ci_udc_enable_vbus_irq() to simplify the code.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/udc.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index f2de86d0ce40..d4277d6611ee 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1835,6 +1835,20 @@ static const struct usb_ep_ops usb_ep_ops = {
  * GADGET block
  *****************************************************************************/
 
+static void ci_udc_enable_vbus_irq(struct ci_hdrc *ci, bool enable)
+{
+	u32 reg = OTGSC_BSVIS;
+
+	if (!ci->is_otg)
+		return;
+
+	if (enable)
+		reg |= OTGSC_BSVIE;
+
+	/* Clear pending BSVIS and enable/disable BSVIE */
+	hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, reg);
+}
+
 static int ci_udc_get_frame(struct usb_gadget *_gadget)
 {
 	struct ci_hdrc *ci = container_of(_gadget, struct ci_hdrc, gadget);
@@ -2352,23 +2366,13 @@ static int udc_id_switch_for_device(struct ci_hdrc *ci)
 		pinctrl_select_state(ci->platdata->pctl,
 				     ci->platdata->pins_device);
 
-	if (ci->is_otg)
-		/* Clear and enable BSV irq */
-		hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
-					OTGSC_BSVIS | OTGSC_BSVIE);
-
+	ci_udc_enable_vbus_irq(ci, true);
 	return 0;
 }
 
 static void udc_id_switch_for_host(struct ci_hdrc *ci)
 {
-	/*
-	 * host doesn't care B_SESSION_VALID event
-	 * so clear and disable BSV irq
-	 */
-	if (ci->is_otg)
-		hw_write_otgsc(ci, OTGSC_BSVIE | OTGSC_BSVIS, OTGSC_BSVIS);
-
+	ci_udc_enable_vbus_irq(ci, false);
 	ci->vbus_active = 0;
 
 	if (ci->platdata->pins_device && ci->platdata->pins_default)
@@ -2395,9 +2399,7 @@ static void udc_suspend(struct ci_hdrc *ci)
 static void udc_resume(struct ci_hdrc *ci, bool power_lost)
 {
 	if (power_lost) {
-		if (ci->is_otg)
-			hw_write_otgsc(ci, OTGSC_BSVIS | OTGSC_BSVIE,
-					OTGSC_BSVIS | OTGSC_BSVIE);
+		ci_udc_enable_vbus_irq(ci, true);
 		if (ci->vbus_active)
 			usb_gadget_vbus_disconnect(&ci->gadget);
 	} else if (ci->vbus_active && ci->driver &&
-- 
2.34.1


