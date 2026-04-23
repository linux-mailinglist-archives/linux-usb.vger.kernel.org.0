Return-Path: <linux-usb+bounces-36440-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DbCF+ny6WmepQIAu9opvQ
	(envelope-from <linux-usb+bounces-36440-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:22:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E526845099E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 12:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 12F333085EB8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 10:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A363386C2D;
	Thu, 23 Apr 2026 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GrjsoqRT"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001F3845AB;
	Thu, 23 Apr 2026 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776939460; cv=fail; b=q/vvwAaHAW3g7uPvMeh9bEtVMrhRp5kwwXfsQe70NWGkszE2B/VtH94DDcOujzQFRELMDNyUbvKq4mBPa0Uc+/0TTpjuJ9MyrIPlG5RTB/TOoYwACa27WiyMF0d/bBKBqCZVUlOdKRSvOyVHew3XX6s4wQSM5RfbQ4Z9cylYT1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776939460; c=relaxed/simple;
	bh=txXQRWip0po5B/dkzrn3MFmQ9HLidNTzEMqFos8h7gM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tj2LgFrb+G+kzFTJ7KkhZ2fcbsN2poPRT9S5jP8299AfLFGvutCMrbFuxXtny2V0vDv/fzZEmQdT5gKv3+T3+2s1nO0sBxIMxK1GCkX3yo6e7naDBu1zf9CakKJePm313bxr9cSkVzC30tIIKd+rv0dtww+Z8qNx4vrFW7bmfk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GrjsoqRT; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNKECUI3zWTB5T6pLoO3j4rTfW8iIxYM+logGyjN0K94BMSZZXLjK/Dr+4zxud4cAvJsVdnH+TlTQAyjKAM0Wd/WOgGQtbWwwG/KgXhmWVaDh8rQXm0XMFlomH6GtxYm++DDo1XhqHAaucU4b5b/DvH5m1L+7ANTfvWCLC4EgJ4nfPVjUpnCjQ65R4B42ocEXZq1hipe+RpWV0bH3WXC48D7gWOBvIkKieEToKKuADJ54LcopCBsx0+nSNBt/eBrQlUEvv7xX0eF6+V8JJsuxtqZndgXhL2K5XgBgjQqZFMrh+R4fPJ8UQIUFQp+42yWnUMFu7+mMCA3LjlhJ91p9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBv06aZKkavQ0dZ/WiXZPdcGobXsa8kPjkg06DVO+sc=;
 b=AOqlqUfeGMtMIN31KxHXMgIuvLBWTKVDkZJBsx/28prHwbJB+dMeLekrvy72LMQHSd/+8iD8vMxFQMJmRMr00gf/fIAlg6VrY0ssBH21JE7Hz7wcFBgJXoMMhfadsMzg43uq5hwtn3vMp/SkSvtWB93UD03UhS2cgGM7vqmlJ3t/hIPtF8Hk2a8/bgcpkl2xV+dmEez2KDquUfI0hkum6YNl3WxQ/+S2U7OUe3ZxUZyZZQhmQPf/KKq7/XVRCBnpEm6DPnJwXYW3ptKN2SFGiNdWBuacLY1iq/DRtcslUlRqgPp7hrU81JwGumcOfxoriFTQppikVpLwahLqN/u6jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBv06aZKkavQ0dZ/WiXZPdcGobXsa8kPjkg06DVO+sc=;
 b=GrjsoqRTCdSMN3NP+DWZJSqZPhQjR0wsj/ef/kd4RxxH8bOwgMmBkcYqmOAj8NBK+X+cVM4yN6h194WhfMbNskKCmmRcCMUZqD/x+IC6NALhDONvNjXealOjZfG7Q8WYClDa1qXC4HGqhA1hQHkHfEUpCrdMH1oMtpehNmW+GZIvxHdET+JFs7vt05IiHSWqqljI8DoJn5kY3v0UZwfCJlqXmeX1uMH4ReGeUszWIbicPNhukV/iBpK14ax4XG4BZyT/q8vOA0zwMeW2k2NdgtbcYW99rcvpcYwWF8dNtMm8gHWy5GJn70bl8scNGbHEudP+ojqz4aZlINIqVYUilw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10855.eurprd04.prod.outlook.com (2603:10a6:800:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:17:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:17:35 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/3] usb: chipidea: udc: add a helper ci_udc_enable_vbus_irq()
Date: Thu, 23 Apr 2026 18:20:00 +0800
Message-Id: <20260423102002.2675414-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10855:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4683d3-2949-47cb-37b4-08dea12189f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oVJ+7ERhBzWG3PXHTVJLX5F7MDuTSuEASU4Y5rEK5SM7KEZAu3XmOD8FKKr5e9N5fIfEKAXk0aMc4QoYgIibIRjLxNKGdylifuladGIiw5ocXB7jWuY753BAzywGEKdKoSMA+hjRNA+SKPBwYYg/uRfxLDpDc+8wq4syZFkouj3rIydUi+/SNFgi4n0agly9Sx5USh3RkzM6G9Jf2CVhTJZEKx2pF0IvcKm3oh8NETeKqzQ5XVv/fdUJrmYpFvGYRnCohKWW0l6gsbtXL3B4QbWhH/bzIpFF54vTzUtu6QxWxpmjoAhhlC3W3vrLjU3Bjo9b99XNnNjC7e3GD1UtCrke+Fjwc6R34X5vGXuKOR+DjoaZ3QZUmZd99r08Nk/0HoUiMoSgxb8hKZFBjZ7kluDs5ZD46jRzfAQ4juBZWBIktMZZ1HqTqUZSz/qWfKTs2FN0nw7pVXo2GWjS60RhHJC9wEKwonmaf676/sDeQfWQgkLsX8EP9dQkyr2dDTSPsZQpXegVcf5AGjJz0bD0Lw2N4cmL5OamRrwCBuLzcKXVlj+cH9kl4fHNckgFyv2RhBKsm2lgWqsHBWa/CU6ddYoiX7TT14iKPf3gHoYmEvilW+N5gh6SS2uH+lMi8meHhOqTQJibEod5Xh1dCgsmB4eOsuy20cOzklHDWIwdS9VWz6TKlBKOou4qAzQY8vNoOtQI9lDcpaiPoJm8O/i1XUQHVOg7mM025vH7ek9bMYU7Tn/eKKwNjvxunYyHNbWm35u5tKQ7Hi0OjnwqtXyr6SnF6mkZrjXE/OBSJgU0LlQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RWc/fbJg5cMjJWE9MY7wOn8QgbVaTgQi+8n12ZzreMRPlkd6O/v9O7XT+tXn?=
 =?us-ascii?Q?ZJ4JXBLNM6gnXKH4ms3mc33qZYxg4MZmBR1rJpF14JMtxSI7m8X8XschoDtN?=
 =?us-ascii?Q?YTxsNgQJh+xuNZ7iiuKf0GJkqO5oV0MgWNhP3DAPI0WvDjbR8zOMmAwMu/RB?=
 =?us-ascii?Q?sbZXkKYQZkYn6qasNEMcDnFOYtMHy5CEWK0KgBsounr80gVRBNBG1i2omm2j?=
 =?us-ascii?Q?NlZY4tN/nAO7d6TX7BHnZbvHmaiTgpL6KBKhaZHNeRKkXZ/7t7LtC9OAo+Q2?=
 =?us-ascii?Q?luJXQ7KQ9eANuYg+rw+p4hLVpCNK/kVuEe5GJ8s/lwnZQeXG1kcjC+fqSMYZ?=
 =?us-ascii?Q?g3Bx0y+hYFm9mo5OAxENWsUCfJoyli11zyhCrsNcpJaYvMhZtcw2TLe8brmv?=
 =?us-ascii?Q?kMp1PlGtSzTF62s3Yxh1Iikfb3wBRVV296inKmZpQb71vlqrRxwJBiPEifTV?=
 =?us-ascii?Q?9bWwLZXY3WsJ4oqmWyiqUpGVOxiqQ5ww2YQa0t2MVOnfD66vLI4C5vLaGQAw?=
 =?us-ascii?Q?9Df5a5GVkO+Vr6k/6nzYspeyDzKmarzG+Mh8S173DtXrEgNJqFpPjpMMhVlF?=
 =?us-ascii?Q?HD1xtAceZTs//DY9XdbFJtT9F4m27uinkSehJlq9pjvb+3r7SS974o/oL6dz?=
 =?us-ascii?Q?ddw4lNxSo4fQZ2DwlQsE7O+VOnoGgOKnxd14++XqVHHObRkHqek6Rs6zYOXd?=
 =?us-ascii?Q?nBaDwi/5Xt31ClDk+TqBu0B6BnM8CsQLu3QEGwa9tfVbTijn5l1eZq8iEDTJ?=
 =?us-ascii?Q?h0aT987nWY8pAaODMZS1UUMwT4hwODt9oUBEtMIHjEWmUg26Njs5OY9Uvyk6?=
 =?us-ascii?Q?RmkuOk7LgQYTGTQeY/ZoPyVIfwxQAb/iLGEHZQxaetCoKXvnqG78NFGpb6Fk?=
 =?us-ascii?Q?HoWCGPrSlITu0OPHFMJniUGer2EkK5vSJFRZPUI9fGhjDASHL/Vn/c1mFRzI?=
 =?us-ascii?Q?rfSldrELCUaZtFgmUCAsQusmwzj/tSzH5buZy0TlVMmQQhjKDKE329FQoztj?=
 =?us-ascii?Q?5WUvpuxr/gXM/RZJNqHhexgcQTeaK0TToYF14Yk3ZB3eA3O9FVtiEYK6Vmwx?=
 =?us-ascii?Q?LqOgZXHbzknYBCqWCeRBYpczpe4cTb/BgEHZAM9DEwMQsZHDCg/nAUm/amjw?=
 =?us-ascii?Q?G0xRgZfMon2VTErrCoJxtlEtgSxTRqqkh/DK/WaJ7eFwT2QYLdHUze+NTw0X?=
 =?us-ascii?Q?fB0cu+QgvWx7CHfJc7HIbYfulDgOXVHDfVjC1UWKprlig2f0xlm8y0TBAtOo?=
 =?us-ascii?Q?gdh4eqLYIDU3iw4A4Sq6LAKEc2Gq6Ose1u62FaC9hP5dD0sX9kV46Stn43CJ?=
 =?us-ascii?Q?/CPhxE6BFjU3Yn7ShQLMivT99UlNAPcnihJ2mzjjvzFH7wPOuDvHVpeYoJNx?=
 =?us-ascii?Q?2dhnTX7TdZBoVprVvhKxK4eeb8WCg0wiTlvZkJZIRO7pYcP+67ozjyKO44TX?=
 =?us-ascii?Q?TBJG1RMqLq8o5gX7o4qH2ZxK3tivCC5jTpXnYy6NHYeKTT8cG5khc8L9aqRm?=
 =?us-ascii?Q?cyh5MWtSDMES0xPGzXaidwQRiZCEr0Sf9A42YjBZFaSBLZZkCohC6Yj6AB/s?=
 =?us-ascii?Q?YXgCIN380WGizcEnfzv2AQ3etcRlsUBDr5W3SUpjXW7rNo8Hv397zlV3jBfz?=
 =?us-ascii?Q?3MAmq3a24RZ2zrAXyMBUzUnvljCxgXhW2CZ50DYtiltCrZTLZcrmR1jkFv9g?=
 =?us-ascii?Q?L3muvR7lIiCCEOcQA30BIb3olBtFlnZXE4sDV0PzN2paireA9VTLe78SB7EB?=
 =?us-ascii?Q?a4Mv+hRRVQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4683d3-2949-47cb-37b4-08dea12189f9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:17:35.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To/vIOXRbrqtEksgdXkKi+PU0z2OjkTf8HVEccXW1C/7+Qk3nCJAfRwaVG4iKyUKlJ2dRk0g+DWsTEnn8xY8QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10855
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36440-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E526845099E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VBUS interrupt is configured in multiple places, add a helper function
ci_udc_enable_vbus_irq() to simplify the code.

Acked-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add R-b and A-b tag
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


