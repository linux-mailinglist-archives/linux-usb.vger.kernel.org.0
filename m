Return-Path: <linux-usb+bounces-15268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB797D3CE
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 11:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEE881F25D1E
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CEA13C683;
	Fri, 20 Sep 2024 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DZgJQPKD"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC313B59B
	for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726825211; cv=fail; b=RoEfPMwBYLDBgqkDwsoXvQ9fTsqfvx0qr0hjt75GxHaf8UYdV69OzrMbjZ/rQPubz5r3GeGgrY1Z70fs5eCrPlrN9KnzUbrTvvAO4Oyx8UMO/C9FH91oMV1BErsTwXOb8thl7I/MbLbdSwgVGkWxXIvAwd7ONCYjHCJxd13QvBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726825211; c=relaxed/simple;
	bh=K+yhhZPvrOOUZ/AJx2Rjkq8cgeWB/JLTIUSYwmNBuu4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=baqOvNo5gP5yJtppbwqQ1HjDGz6QcZW/goU+Z2nRm6KmV/nVmLhmDzHZ0kICvPARAGcl6aUeOMWqlmRnVqwSETa80M5YocGkOQAZBF4cq2C/ho3y5Ropu3sHGGb3+a0F0utgy7bGex24qwe5E5wQZ0r4zOdntesjUsxKj7/QaLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DZgJQPKD; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL/kXqQ42eprMzUD41D4dWHmFNUpoynffiNPXIZ37W+ZRbbl5VYEP6VLYI2UDJz30vZj7yqJHNzM2T390JVrz0gbASCsw8D5e0Scra/Eo/qYDWs6qbf1EfJgWmka9bOAwxsVxpi9G9hGeGB88gWf5eX9Krw2If6YEc6BCwCBWxsu4H8GvpcOgwm2ADfe8S2shU9urCBjYvPxwFzRTIdn+838A6dtE8Z/mA35FZ+3OHTT1vGL9aiS4Ag/usTLGLiTTkhiFP+Dn1pcKZiWs/kJ1arklxaK6K/lL/++Bc+q8j4QHFKeMVq5B9VctW8Jyy6JkKfztT7W/cXyvW9Wup4HvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YV0/VUNSmoFKNRggUm6Wc8xIiIlealrJJmoEPGjoJE=;
 b=GSXUnYR5OjN3VW2p5cQaQhcBPqGAwTPAopI33+g5xw0BD/icAYBmvCNqWnKGZq7uiaMVALGGVtuqKQBRaGepLX5vt5pDS7AdlTFKut3LennmZTAtc+HoZ5ycWH2luu1g4R8COHtxlvmY6lxHOO4I84WMVevlCVPtlNwDyXG+CF38nChavI6cKID2rDFpQ+JSJatoyMVOiYNrTh4Amk1bKO9kABkjtgyV+XzLq7/sitaRRjUPl2Kj1kAF8hBDVsm6XTw6pW5JWHhrJkbf3n23P39q3X0G1HQLXM3t2ISCYh8e+/ozjScp9fdXAYqD4jIrQ9Kl9RFtR4oh8QSVeO5Ygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YV0/VUNSmoFKNRggUm6Wc8xIiIlealrJJmoEPGjoJE=;
 b=DZgJQPKDG9yW9kkKuGyj0NyRikElq/E7A+Yj0AwEO//mv2lwJEKc+6jBWFf3t2D+Rz7NKK87BQ52nWJMFtiqgPYweG5MlNKTg+u/h0viI/89Vz979MwCagHErY1i31nQKJv6U6yx8fs4cywQg5JEIXoMilVFjwz8lHH90S4RfzssE2rSHwCDu5mtvrydmwFUD41xOOzaWVtZIpChpyM0P/rLPMO16IrMxreF+KJdSMXWthexyN8R4RiUaCKxtwTm0decfwczu9yyQfjuOulmA0twiPaYeFqK1OfddA2QbR0+OMd+qH+u45anzWy79lU9BvhoRxiZId7aqRSZBzcY+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB7072.eurprd04.prod.outlook.com (2603:10a6:800:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:40:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 20 Sep 2024
 09:40:05 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 2/3] usb: chipidea: udc: improve dTD link logic
Date: Fri, 20 Sep 2024 17:40:55 +0800
Message-Id: <20240920094056.2680590-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920094056.2680590-1-xu.yang_2@nxp.com>
References: <20240920094056.2680590-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0619f2-17b5-4289-205a-08dcd9583530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8MWImkcYTVKGqP70wD1NO+BH9VUB7qE9tnKQWjSSGyysrvMt7hDZIdyQ3R8a?=
 =?us-ascii?Q?ppTVxfQImPf4pNvGhUNvzMdKrTb7UWjLXRkF8s4ivckmuxELJ9ayIn809r2J?=
 =?us-ascii?Q?53OhDC2+FciwotkqavjRs64OSxSm6z7ssq/7HBuaQkVnU3L7zlnICoFYv9z8?=
 =?us-ascii?Q?k/tghtROp+S6WOS2YF0KmU+7RT7bqxNel5gEgApTo5QOu6W/SnEivsnVwztv?=
 =?us-ascii?Q?GpOV8qjT8J+jKTRuC8rqRvqKMDQ05P7KfmbtAdQ9LiMboAFffeflMgrNClQJ?=
 =?us-ascii?Q?RS3+EUFer1yV0zNGUhr1Sr/bJE36WJEuank9E62f27sJuQB/JRcb7/02r7uy?=
 =?us-ascii?Q?n+zegsUMJN5Cs9xYaBPxND/Ofcgpnmpbz/vtqynV5KI2l3Am9F4sv7nnV58a?=
 =?us-ascii?Q?iljWCcuzRdhByeqmn0dAA/y38CO7S2mDpSdhdOSvPaUsp8x++0hCMGANSgn2?=
 =?us-ascii?Q?if/q2bYAcxUVMowiUjJGPS1kc4ufxG0WdW+jTRcDj/U1lJUscyhsNiLh37WN?=
 =?us-ascii?Q?Hf5kBW24VEEBAcMFG2kF5lbv63TtGXm+B02TRLoYxNl3KHbXd5egdidPymBT?=
 =?us-ascii?Q?eZV9HjFZansWRAXIzu8pjLySbI7kfmO7z/1xf+zJXNI0VLwSbOEyHOtZjZlP?=
 =?us-ascii?Q?0FbzVwkXo7Cl3JYrQ7p8lb8YojUS+Xs9roJJmsYhoJnI8aNd0xsmcyE6tS3c?=
 =?us-ascii?Q?TMzZ6RPbSNLbqPKqewTMqMk3K5ELBqT6d/QYzBQPxmiW+fxA0+iREDBXoZiR?=
 =?us-ascii?Q?MgDsIjHr2tsnydyCgIdEl/+OP6cGNHbaIHuL6emf7OtUKGLAssJzPT3gKzpz?=
 =?us-ascii?Q?ChyGIs7/rjZ1zlUpxmT8dQvtUoEx3tWGDM5CXVdG4o+wH/QosrhiGyiJZAA2?=
 =?us-ascii?Q?AjsDlNVWZfyyaPuzHHLhoA0R+FJESK72P1rgWrHY3nrKVqr251ZMaX+CTgjk?=
 =?us-ascii?Q?WMbQJCUg0qb/T16uyyVKb2KGxUSC15HP0CukZvojRvpd4JI0f70G9De7xdN4?=
 =?us-ascii?Q?ydUNaHIOhSOi3pnM916ZH8r9xea+Fd1vqUnO6XDFRjWq2Vd+4UhI7bXyThdK?=
 =?us-ascii?Q?vdJaYmBWT7/YfAjHSBRaCsYThRPHpXCM838tm4CGrHSZGYFD/TOoP2kNnCRm?=
 =?us-ascii?Q?RIwI3T7mU/tSI829drs243uonY5I3PQTy15ARqi298YxbN5o+DJrx2ZgaynY?=
 =?us-ascii?Q?i1/9kxJj7w3RgjgbpQRMKaJZBHMIauf3V2CmB32pp8J4qoC2dIW6f4SNGt7q?=
 =?us-ascii?Q?JFK2tnJoX1x8zpKZWPoS1680R4kTPprHF7eMFwtbL5/nUha1ttociMDW/u+F?=
 =?us-ascii?Q?3oN2kkTarnzQneOR0V6Tw/YUlfjQuqVa5wdwfhGtjlNBFrZuFin6Ti0Z+4aT?=
 =?us-ascii?Q?Sgs8xHCZSS9IE/cYo/Ir1+IxazK5FJc+pqJ8MoDDqWoa9q0/AQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5jBJdHT0sG8WghRx7CJIWzjIaGRrkeEdambK+B6VRTpxmFzVaZs0YBhIwFof?=
 =?us-ascii?Q?XQqEEcFrYR67dPKivcSbbmWkTQR3a3+8Vbn8POZWo4GPcFmUstEVbsaKB5ab?=
 =?us-ascii?Q?2KtV4wqqpR3Ukl2OE3qDWPYkoKzkIFJavdfyxOOoktizpIJZ4YBgo/0xZwQ7?=
 =?us-ascii?Q?DWW74sWDY983enIWp9jd7JUDX+4wrvvnrpDFkutPcKADuZBiUL5jOVuURU8m?=
 =?us-ascii?Q?ig2Gkg9chphNmfquGCwEnLZKzaDgXFWBVGCirZSh510le+kRPce45QS4+5uI?=
 =?us-ascii?Q?6Kra+bOcxcDGgsD+wZVsDu5dcCNUxWt/WWzFx87IZAISERHUEuDQkBOHmAQ8?=
 =?us-ascii?Q?MLmwftnE+/T90hYP4NzI/4TlPKUI2jiehqesBHhOvhEntcWB6jtI/aqrchgy?=
 =?us-ascii?Q?iNDlDuW6aT3cLX9QJ/A/RU8GtaDPFcGUnxi8ty8/iBqe2l6VNRI0ebnMkrMS?=
 =?us-ascii?Q?SwCVQ2LnCtmeHB7pp9ES24jKZop8GVp7wYUpxLY3LBvRQecX37ODm+TT6Kvh?=
 =?us-ascii?Q?Aa4KbVptuZP/Cl/gGMPGuX2ItCZtqDgWsDAyhDh1SqVilSIFThXej/Dlv/xM?=
 =?us-ascii?Q?0QS/w0r2DxTJPDnwFu38pR9hchx/LedUd+W+6pp2JSbpXNtNX0Wouf0GJenP?=
 =?us-ascii?Q?55zjcEFB7MGWc9YrBEuNcaJE4oo8P0rMKydl+WrHEfKuH3kdziNmJA/NBxg2?=
 =?us-ascii?Q?GGuv9acD3bHGp5GI6lsAqQbGK5Nn3xZLM8gLIycaG93deXl/xLM7rLgwRtJt?=
 =?us-ascii?Q?16bWZ2GlzoQ8YAr3se3mK/Ef8l1KkCebmKyPAd/ScKPlhv+vIkdRFFJ1Bkzy?=
 =?us-ascii?Q?8QV5FmPE6Os4gl6Hra7sI3prm9xxKm+DuX2HeNQpmg5iVrpgmORZq6rblEOh?=
 =?us-ascii?Q?dfXEfg7CX0lwrQK18C5q4taM9ni7FfEuTYRvECTKYrur46bCKBS+Vf9M9RXJ?=
 =?us-ascii?Q?aMzACNf70iXvkdaEap3hY1gMLpUs7t8wdThlMzCyShSsESOoy/PcwA9tGn4z?=
 =?us-ascii?Q?1tN4GitcLWiPFhSAdS8+lh02qKQJlZ6XBRBl/fRHb/1ct+Hwfd/dxuFTDU0Y?=
 =?us-ascii?Q?XWnglRlOxNc3SGF8SlvZIo90XjO/zrQCgzZf1M62zQy7NvZdnYwoV9NtnCnG?=
 =?us-ascii?Q?Cm6Cn/m0lPDdKzhmF3RTUhsHDMTxZlDTUbDsMT4H/phqlZDHCmZhXNMrno6c?=
 =?us-ascii?Q?AglK9paTizlMeVgb8aSks0l5+8i15uRpvRisvUA9XrmUS76I5QVc65a2nFP9?=
 =?us-ascii?Q?HKL/NWCuUQY7ygLnF2M2HyMolmwH4bMDVdp02G7UKh3mQljytde/kFtEap/n?=
 =?us-ascii?Q?o39neL+hgASkMFun2swGWGrEyghYrC6djkWTDgkUjRHkX/fCKhfQbGhW2I7m?=
 =?us-ascii?Q?TyUAdHm1AWfKCxbKAve+ctUmi6XudxJ+X9nO2GOg1KbeoJ09IuUUuOzHKMyF?=
 =?us-ascii?Q?+RKxeXY0J9PzCrE/fWdYfgKy4apY24lmVwiaUqHVPJsIV4V4vazNDdE1YCfE?=
 =?us-ascii?Q?2OH5eMYE5wQn9UKEuzSAq4qJnPw6KASDuusd6znmBMMTz10LzWlhHHmC3L8W?=
 =?us-ascii?Q?hCAO+nTckAMcMaBmCaeSmQwNDInraOCLxjmqVuoo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0619f2-17b5-4289-205a-08dcd9583530
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:40:05.4178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iGNe0XNpL3CD0QHcE6aSEEl+t/gtmYigNjYc5GhylrCfhZ+WA5Gm9oyY7KyW8pxyLN+CdI1ibO05KtKyaczAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7072

Currently, ATDTW semaphore is used to safety link new dTD to dQH. But this
code has a bug when the endpoint is already in error before polling ATDTW
or just met error during polling ATDTW. In that cases, ATDTW will never
turn to 1 and the cpu will busy loop there.

When the endpoint met error, ENDPTSTAT will be cleared by HW. Therefore,
ENDPTSTAT should also be considered during this process. In case of
endpoint error, the current dTD should not be pushed to the head of dQH
since some dTDs may be still not executed. Therefore, the link logic is
also improved accordingly.

Fixes: 26c696c678c4 ("USB: Chipidea: rename struct ci13xxx variables from udc to ci")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - modify comments
 - fix kernel test robot build warning by using cpu_to_le32
 - add fix tag and cc stable
---
 drivers/usb/chipidea/udc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index e0092c735a75..c0b8745234c6 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -752,10 +752,17 @@ static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
 		do {
 			hw_write(ci, OP_USBCMD, USBCMD_ATDTW, USBCMD_ATDTW);
 			tmp_stat = hw_read(ci, OP_ENDPTSTAT, BIT(n));
-		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW));
+		} while (!hw_read(ci, OP_USBCMD, USBCMD_ATDTW) && tmp_stat);
 		hw_write(ci, OP_USBCMD, USBCMD_ATDTW, 0);
 		if (tmp_stat)
 			goto done;
+
+		/* OP_ENDPTSTAT will be clear by HW when the endpoint met
+		 * err. This dTD don't push to dQH if current dTD point is
+		 * not the last one in previous request.
+		 */
+		if (hwep->qh.ptr->curr != cpu_to_le32(prevlastnode->dma))
+			goto done;
 	}
 
 	/*  QH configuration */
-- 
2.34.1


