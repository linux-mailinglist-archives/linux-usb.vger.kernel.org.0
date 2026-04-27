Return-Path: <linux-usb+bounces-36503-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJfSETwW72kQ6AAAu9opvQ
	(envelope-from <linux-usb+bounces-36503-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:54:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5146EA3A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6B97300462D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 07:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FD43988F1;
	Mon, 27 Apr 2026 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QRQ7ricn"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF87370D7B;
	Mon, 27 Apr 2026 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777276471; cv=fail; b=FIJUicInOg0U32+4bmbY0Q9QnW5JjIBkS0P29M5XQSeARqoQnWI+NNRlGdi45uD+TJQjJ9ClbsXpk6ZnHOJkFxo3KJq0TIXsLMT9yeOUZjhtaqaIdAHG0TpOCV9rD5XXaKiRY0GnMQYzGdrJV+GgcaMbShMV93IhTQvaEpRsILs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777276471; c=relaxed/simple;
	bh=i6Z0Wsutw6pt7yXlSSTEJGAQ+txz0TymwJe7C9nVevw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Hg0LRvGw6/zH2jJVyX9U78x96duE1L5KBXeuSwqxy+0qEDPggn+kVZ4ulGWGJ0Dt3dtBjZuLN3AkkZ4Y4VJhK7stnTS/6xFvfpI8s1Rm1Go7dAXoOFg7xL97u8HCG4U63E1mPWigU0JAmOBJEPCMzA2+U+K7EZHYZ8gdIRYUW5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QRQ7ricn; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7ThJzsjBSfsLjsnLaxN36Uae/LVjMg5XjBCK/+c9Ek1R5z7Gic0uxBEnEgezZtOUxRdd7SyfAoh0ujNSVwXV5pJGyzIzjUkZ2b1b4ouVf2WJLugFm2JJWZXtUWwYUJaIsyu4/zxgLEzFZtSWPcR8OKVOxv3BE7h0biCndETpHPs+4ESFmLhbndmi9bjfxSf/jWBMVqa0pHPZxxgi+SS079mvmdH22DTQubZWCY+oImGix6AqmcOp32yA1Ix7ZOTN4I7vidU6mJIWt+tswthkNiYRODpW22oW+jDv3I/mEAi2+nfbgOlenFHrKbO2t5Be71IOhlY0O1thu7/HpDe4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1pCtkCNev52UEJzv+IQPFKdy+2avvpKDuYoGjnE2p8=;
 b=KJ+gtIpVlKhfR1CfVoO1isn7JCEO6dlGquHq8txNYNySFx8tMD+B2jvkFThkTJIOL983+IHkmbt4i0pkZprbJ71BhMCEBKt+FM6tbEwmYpdC7raX/wz+mDGCtqMKQgp+Rkbg63ZlfLFCkz3oKdK0xv1l/55QjXPkq5pm5Nmru5feEUrIVZMUkvj4/4d45TYCK91UFtydMZeOvTZZWlHoTpafGzW9Y5ebD60+uNbm0hSGvkBDOKcVaiMz463SRIbi0h3iEMB5wB2tl6XOFpd+bOjq+TWzJOwL/+9OIUer/KvHodrwwfl8ZQxEFdOJErabY6rwRMRKVTOJrg5Y+GBJ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1pCtkCNev52UEJzv+IQPFKdy+2avvpKDuYoGjnE2p8=;
 b=QRQ7ricnWn0TKnpU3Pg5lft1Tzqhgz9X4jSoR7bx4mPBhGnT9mw+MRB0wXggobHgSIKjeHtUw80OR7HtL5VeZEiemcSFe39qcaH4SxVH0shCMsye276kLRsLvv3kW3vdnY9qI6C/NSnrvdXJwj+i5LjFFTbGF7SHU6q5vr8GZ01yil0NHZF8B+rA4Wncl8nLCRPVabK1i5ybobyPIUg31V0mWgrTk5RLZVrpbG8x4mmshEBQAeJrHSVni+gjsshgHwwU0I5PBD6iriuzn1wrkovsPD/pVlzE6SCHex2wOvDZHTwvUR/INPxBJmvjEymP26TaTJeIAG7wNlqXcucUEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 07:54:24 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 07:54:24 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v3 1/2] usb: chipidea: udc: add a helper ci_udc_enable_vbus_irq()
Date: Mon, 27 Apr 2026 15:56:52 +0800
Message-Id: <20260427075653.3611180-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0197.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0031752b-d987-4e3e-7cb7-08dea43232ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9n9lzJ3qnq7Bm0g6fKTtrJ8RY4+J8oQ70T49fgTxvF5I7gaCSYsduMoTDMe1aZBqcsIYCnbGjoqXYQNAo5gOlsDCLhyk84VR+nNcyY0GOMmDQhZ0Rc4QX7kfH6zb+jpnK053F4ZEu30GO3Dxlr7NVmAt3khfx0H+RfFFG0B29Hx5ntbHvU8lC+1HHatbslPuWCGnJmFr6vlHyZWs0IFHNm0D4SP0QFVicveBPd/JHS4b7IUVUi4IREB2I1SIFRaI2D9euhljcXm7NwHjjWUJH1LCs/UJonz4N6Hah2y7af6DaX2kF2CVK61yalGy5UcvoIYJusbXRqx4b29FU2L1dnfYm1Ko4+VnjVf+SrYoUaMMc3P+suXqDRh+S9VbDjY97KUoVjJU0pz6UOXZts/nFpsSlrljDciA1DuC+63XzEo/On0vRLN6pwh//tUIWRTh7npLvULWP5RGj3BBqFaHxIevIV5koF1+wmgdSVcf5cEyLClWVB08RAkxcoocyCB+2kvatXe7a68nJBcnfh1csogvmVWzHdvv/wfqwy5evE3gwe5ypLB4tkumJMxsPWXd+LngxaQHe1DJEsSjbLFS3ltxVL4vjeFP1IXpnWeiKlkyvYxNuHAgp59C0wmKH/MtawMITKE4D+M3qEPVDVAdIX/zTunyz0OlPzZPUH4gGnKEeAnpJMzwtUzba3KV8f6ZUY1m4q5A8U9B+OJJsNa2xoZju7LtmlNSYEDIQXEEa3GCBhOj4AFWIj9ByJhpL17V6sHquqdyZs1wKFz+pHlAm3f0ddUs5xCIxH3eci5Y9cM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?czbtvyoyJnWKrBFjVc0foWOeSEtnOm02uihh5p0PI8Nb3z7gEI5Z/IzLaQSz?=
 =?us-ascii?Q?p+RrO2erg4nO1oQ81BFI753RC+WTuZY9NiSLOeknfT9xl4Qd7B7wE6BbLljK?=
 =?us-ascii?Q?dIYk4R+M7oEZvomJr3xKanOs7u3/ZvpGHsYgpLAAQDjspEeZd6csrkx1Yzx3?=
 =?us-ascii?Q?4nf46xSzSs78No0JXrRBtitwM3kqokm0nWdZ3/vzlzfD7Tu/ceP3jYWBVUT5?=
 =?us-ascii?Q?2C2BDbO6MHW3CxzxVfcXTFEpV6Q8o4qrozXvQvVa2+DYhr3BxsHF4G63pVjw?=
 =?us-ascii?Q?whG05tfwaNh5utbsUjqcH+sfHcQv0Kfm84Z21Wf+5+GPLmcc0r/0fiFn8Z1E?=
 =?us-ascii?Q?1XOnHakn209RYguhXLN0YN3lwPOstnRMxvT4ERSZ9ns6q2KH/A04cEIYX+ff?=
 =?us-ascii?Q?PqYTcupuk8543cglr9CeEyLlzx1y0YVN4UUfYNjIlMcO3V4geevc5Jk3LvWM?=
 =?us-ascii?Q?c6WkuQiErpU056ep5FPZD6fO9g+9OkY7qMDADeN58IiDLvVHDk1ceO2JJNAh?=
 =?us-ascii?Q?P44bKHzcrNFrXdjxMRxInFmDLLxiFDIgodUgq0IY4xxmA/MXZoAg5fjZtzBt?=
 =?us-ascii?Q?EkitfbVYT7moL3Kz2COlTqkz0qDWXQZjeJ8ApuOzmACQL9uAqe0ChFIXFNba?=
 =?us-ascii?Q?CemNm1UkTp2lALdqzWBrUb4/6rOeuA160cNZ6Ju7h80YxIGFtg/PaDQ94Fpp?=
 =?us-ascii?Q?BVmyTE4jDLbNR6ugs4QEN1RNOGZ2k14bWvDKoRsTBtUXWloI9xwvPIP/vaAY?=
 =?us-ascii?Q?4ROrgA8By3sb9+ZZCdHJU73XbF3qOEkIgZViN8hA/gjLnrx7XiiO6gtpZjKY?=
 =?us-ascii?Q?i97lpcr3AkApg3ps02qo241i4sOeHh8xb5Qsk1337S7euqNQUEt3UncjcwZU?=
 =?us-ascii?Q?0ZzkZdeT3fqtv+/clM1sIDdgHiLn7oo3IPVqc5qFwiLWMi04xk1+VXn2zHsO?=
 =?us-ascii?Q?qTwibzBRq37nGlF81ZhiuCjOG01h4R6uN2sCvHDkVaOe86ngbdd0yMd0VA/W?=
 =?us-ascii?Q?hJH/KUkpDbTvYvfAJq0dzp0X3vHsVpoIX3wh6GUXE4Epe/GP2j5zB+fb0h7I?=
 =?us-ascii?Q?Hnd+hLqXnj2ZzV3Mnv+2PWyZVxK91+nghdmZTt8eonqNcHFMc0Erd1sQKc42?=
 =?us-ascii?Q?0zh5+3BEMKXA/e8TQtHZlCuOFXvSV7++gRldGAsm8moeJAafEnqyH4QFY1cC?=
 =?us-ascii?Q?55aHwXv6qjsuWIW3JU/IpJ9qkDa3LQXxrOud7XAj9+cMtybCaiyFuDTQkz2s?=
 =?us-ascii?Q?9Ogzvd6FoF1iZOOUgQuupVdksLdlBryDH6yUDsyFNPnmxmN6NyAi5TNcsXSV?=
 =?us-ascii?Q?gXwmdus5UF5fePD/o2BKto0w0DkhySGyLaiTprSqlXr1TwYm8u0ZCa+5S1Ak?=
 =?us-ascii?Q?FzvrpQnWJPOOVUEOL4qjSz2dHNdaSujKOxktru0+7ikQvEuPkXmBWPl96qXJ?=
 =?us-ascii?Q?sw74cNCg0XCgYQ7ieKo7VMa4udHIXq5CUZcDEnln+6w/7tB6r6VGlWroam0T?=
 =?us-ascii?Q?VZymue7iHqQK0mats6WQQIxgV6tI2MHDVy4ce5BIxIxmrMBMdyGUTtkk2LbK?=
 =?us-ascii?Q?/p+Menok/jjZ9xNQg9QkFs/5LuRlcJ+mGtUO7CySP4SbawuhV0jeZKHwHVjV?=
 =?us-ascii?Q?VyfvQHgnoII7XsWkpT6N7Nvojh41z5U9XK1DtcTML1N0hMg39lDEk5UIbMpZ?=
 =?us-ascii?Q?BPm1dgcSVNr7XJbvUz5S0qV/KDhc4bAT9ssT4UqLhzSp4segfPeNMy2Za5Ir?=
 =?us-ascii?Q?+JdNsrebXQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0031752b-d987-4e3e-7cb7-08dea43232ca
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:54:24.2980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TT6u6Ln1ndfIJJaJkyeWQCj1Lb9q3/rE74D2UUev8YdelZb4wXFrxPmywfGmkytW5UKLsf7zrULDdwzOuGAkGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-Rspamd-Queue-Id: DAF5146EA3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36503-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The VBUS interrupt is configured in multiple places, add a helper function
ci_udc_enable_vbus_irq() to simplify the code.

Acked-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add R-b and A-b tag
Changes in v3:
 - no change
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


