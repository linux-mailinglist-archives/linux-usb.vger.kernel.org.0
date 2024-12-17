Return-Path: <linux-usb+bounces-18574-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA69F46F1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369C916CF92
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F101DE4C0;
	Tue, 17 Dec 2024 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C+cK8uWk"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADD1DE3A3
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426724; cv=fail; b=DvA0Zx73P0DTf6YFbypyuaOat8K6o7wx5WUvFKR7F5OjVUDz19Ah8tUKRTMqnAM6/tB0see1uxlqZ1gyTXsVerBUhZTBhTaKospYLfIDolgQ/xM7htq0BK3Zo+gsv8N9nJhr2zds50OvhDH+9R2iRsgE8lHIu00VAvKG+2hmB8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426724; c=relaxed/simple;
	bh=aewCBU8iav3vndaXcdo2CaoVXDSJPZA9qxgo9OJDJcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B1qfCQ2sGo5Ww5oZq8ZQu0r5JniEywwf7OozRWX6tzs7gSrkJEEAeDIajHbQ3bLCdsH6F/iGNb0Fu4yWtZwBTdVN+NgDmzn4QbmTh4b5YEH1AvxxP04qK8v0gP+opNHW3rG3nRITV6rUidE1zLPAhQbPpYrTSTHEDp8DjpTy1D8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C+cK8uWk; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrdwA+IuvsYHEpW26nFGk3Iol4OA7GqsRWCrxkMfSkyALX9UvuUYyMh4rYfGfxFMEzX0IKkBVjuYJEy+a18CrQvBnLGL5pcmgXl+WX/WbDfLIAf3hWvsPtT9h+jhOXBpcFsZ5Byaj8yvse9CJ4Hht4mMxrvRzyh6x1fWJlSAwACfrtofe+mBCRox8Ku98sPaFuI38QpIWYC//Xz8E4DPn6BvVYRcrqfH1y41jmgmZFO6C3ss+XQbcr+VCcQxfMZBoIzUpUR6nOZLUG2OFpRWCd3ZEWvEw0M5CPeeKyc0ppa3D9FO359VM0FjUrBWxb8Sn+tBSHaG/soUG56mOHIdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx2aw3QTpc7s9zvNU+zqvF3hH21GxUB+1pLWY7HrRoA=;
 b=pKiRdW4AuSHfQH9+djue1Rj22GHTHIzOPkkF+uKbLh9tUdv4IoXiFIEwO0MsO15lZXQWF08VvE9FPeUZGGNOZf5s0k55XUTprz6bFr81QRAPBGW2Aodoj3Bhbwk/MBCflDQFvYTiPD/bucx5B2tSsbajHKnANwcF3pGXpngkTSqt7yISzE93mrxrbfwCZz55O2y5i+Mwfh6eLjeMvN7jcp5G7AcYKE4SqvoreLEwLUAXLsXzjwak7cqhNqeNQLuK+vGXTuqOE+UqXrZ3m6bh2aeJF6EECvsDsk5M2Tx0PafoIBSJqw4toXdhmR3nHVk/Zvd7iDECt+tqtj0jo6pT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fx2aw3QTpc7s9zvNU+zqvF3hH21GxUB+1pLWY7HrRoA=;
 b=C+cK8uWk/zltU/SJGFxKXvc+0na7N1J8u2+Y95b8Fz2ThbqQ7HpxEJ97y9K/7RsR67dJkyKwlsKic8q03XC1bGd/gr9p95uZNwFc3kt3yy3J79CpCt2XySYUcmWwQJRtGs34YDOmnV8qXRmY2IQmvIsBgNUhkEJi1jY6PrAKFKV5AD6ULxLApJ+jGp9QmvjkXNeOeSgeSnxxFyhXCjehuQ5ag4JSQI9gb7hJ8ylekIjbeEhG1uyIYAWY0ZYncwMovcGE2drzwUWEc5GeCCENPPD9CuplqkFOYoeEghBwLV7cw1i5y00wl0YxTsjJJMQfTlyXptPgP32zt/cVRAU0tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU2PR04MB8888.eurprd04.prod.outlook.com (2603:10a6:10:2e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 09:11:59 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:11:59 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andre.draszik@linaro.org,
	rdbabiera@google.com,
	m.felsch@pengutronix.de,
	dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after devm_request_threaded_irq()
Date: Tue, 17 Dec 2024 17:12:08 +0800
Message-Id: <20241217091208.2416971-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217091208.2416971-1-xu.yang_2@nxp.com>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::26)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU2PR04MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 707e1683-4e22-4658-dc9f-08dd1e7adc51
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?hHhHixNnu8WpCB7TQiFolW+Bz3hSgQHTjUA5BHoIJ9pLU/G+G3lT6+sgfioD?=
 =?us-ascii?Q?cbUCwd4vLrsjb0yFXZy2VYMgXm/+bYLUYuPDrL4jOO663j2Qp67Ty5iUm/8Z?=
 =?us-ascii?Q?HD3xDBvsoGH+rEnrDkOYtHoULfYqCwkNHFue7CCGv42g762ZnN6DtyRCPqTU?=
 =?us-ascii?Q?bTqq2n1KxTMoa28dS2rfCRtSVydK3TadesRVXv74hCw+nB2790/z4D2X+iCj?=
 =?us-ascii?Q?SW0fhVDHYjM69ya1Lq72kHFuyD0Klt/66129N20EFKy6CsXcMg+0SDo56Sq+?=
 =?us-ascii?Q?5SOXOpJpANVBbh5epcmKxaY//eCC0nFFcQCNbDG8HkiRRQd/D0pC0y6USWoz?=
 =?us-ascii?Q?loPGPEWxEHHbQ9t3SQRDzy4cNNXEAWBVrTD/1IPjClFf/8CS2Jp/NFqrqkn4?=
 =?us-ascii?Q?JSQLjRpWVdVGSYPtdi954XJCuwrqnppPhxUbD/n9jD/lwQxAkkVCyHU0BmGG?=
 =?us-ascii?Q?ySJu6OEh6AZNAPJWIIyV7TXNMOgFxBXF0zLLHHOx0PyOoQo/uK0ypiOmzzvq?=
 =?us-ascii?Q?5LxOLDXBB7Qx+WNcaIFttCx9rP7/gEoDuldQ37SzXAMqhb1zyBn6mdJcl3T5?=
 =?us-ascii?Q?4kP7CMM0XC4j5kmW815kCYdsRirzCm4rcUejkg0APoBQuiK8gK75GGrSYQte?=
 =?us-ascii?Q?vIZAiDqS23+sAtV4liSE6wmcrEGHmjAdEHuiKEcX/Xsj9cY9iFVvo3beD2AH?=
 =?us-ascii?Q?64uDQLZcDjpUMIT8l0g9YOIk3LhwTncaQbbsIGpb1ktr9D+SqUa/Tg3iQw1J?=
 =?us-ascii?Q?vQi71eEhiuzouY43Cqk5akiUAfa3ILXMOEZkFUE9R8WW6TXeBxsCkuwAntyM?=
 =?us-ascii?Q?3kqHnJz1KGdEzFzoJJF4XfxMmYDFWxCQY/YqQMqgE9uDtIWy2gTqcXQ/OXup?=
 =?us-ascii?Q?NfpmaxsqcL0jFLwT0zXAqzm7aef222QqNZhho24C4PN7IHWu61NApndXSX3I?=
 =?us-ascii?Q?Cnab5lcpIdCTgnFix+4B8qwfV8ccpxesXzJNyn8Uln4sMG+wQ2XfJ04QWceq?=
 =?us-ascii?Q?7w5CxNqKHxvRC0FA8a4nwR1lVlAoJxO2NezidhoQG+Gb37CFj4EPAZ2GUOjA?=
 =?us-ascii?Q?B8+N8g5UE02v/RaJEnPPPRAKcbmHzztlw2efm81Ynpou03GvXNAPvZAe+U2v?=
 =?us-ascii?Q?05DIujcfkjSJtT4GU7LTzTZfnUu6/y+7vGwwmqo6MkZIsZ38ckocp1yWtDMi?=
 =?us-ascii?Q?r03SEfHyW//U47FASJagVnuCsJrRM0t1UtLgVPTjUOvS3p72wqCABad7hIt7?=
 =?us-ascii?Q?lFRLm6RWT7yOoNpOg8nKfi1YlF3OU/mbg91zjG2AWbipOCRpwJVV45DJujG2?=
 =?us-ascii?Q?jt5xpAmUKKjUKYlAIg01PtKfVmfKuM9DX/WvJesK83JoAWrUA7zJZpP7CIdl?=
 =?us-ascii?Q?suxNpM/uiQ+0cB5saGxENPmvSGWMbZ48fluBYYk06A9BYZD4ptTDBEdqmyTS?=
 =?us-ascii?Q?ib7dNJSZR1P2+gFVZWFm5t6DCeJiSADOdJllRhnZXwvdmwVFn0neUw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?LomybtqrQvZ2h43DajX87OWifgrSy/CJp4V0ksJjsId+Cejdtx3vxNQsfyHE?=
 =?us-ascii?Q?RhG4BKy2r2x3zcTmAlLRRhwgjWgMHsa7kdO9bEZz8lnLNW9VyPKRUWBDX/q7?=
 =?us-ascii?Q?BshAsm+P8IruJeXD0ZonvKoL4knagw5e+4pzb24CI6YLzqKScfln7Vkvq3/2?=
 =?us-ascii?Q?MwbuKCckG1szX/KslHIcjU3+P+4VSkCFLkV6G3y/6BvHMxMPV537aJRkJiG7?=
 =?us-ascii?Q?RQiir7dENLqexBb43WHPbNtDb5Qm39vz7OK2fpovyUo8Jg3VgplbiY1us3dW?=
 =?us-ascii?Q?cu79asFe5rFCaFMA+KX8yCbXbMfmy1XN7IpG7lc6nsLXOTb6uwZyXE/UtBh2?=
 =?us-ascii?Q?TMwp2ifE2G6Xmfc+NFGmVs2pJNLbAL06Kg8G/v0zdCgicg4MpbvVV5YLKsAS?=
 =?us-ascii?Q?+RlpRl4pmOmYKvJ2hCJRps8AhJXKN57+yqh5SS25tCz1OWAKgrgznisBIDom?=
 =?us-ascii?Q?2IOpcfGJNlCS1U9epVHS96nmfyoC6yIFfE8KC1heUh8B7kCyqttek6pJnxHP?=
 =?us-ascii?Q?kBD+53nnZYqNN/12degREZ6iqp36Q0nwP5vXEbOXe7zu7Yt0wKhMZKEQ6XPP?=
 =?us-ascii?Q?i0AoA6NDtJipL0rV4oCaVF9qTwFpSG8oaqjTxjzjJq9n4yQ3ZJo1YabFvotr?=
 =?us-ascii?Q?BvbHriPZehDUwIA3ApU8rgXk8Vy56bde+77fR2YPUMWwVNxwejmWpZ42K9Fb?=
 =?us-ascii?Q?I3vlFc9MYhowSnkzxl27W6fRCy3wGdq75LoSEgPhKFnqxol/KSsmoRV2zfoQ?=
 =?us-ascii?Q?TUMIXbJC6qUmGSlQky/jzeDpOhiRtDto5kNZ+WDKhvuBr7lN+CDgmGp0Zxl7?=
 =?us-ascii?Q?scHENB7pvbRAikpvn0xGR2DY0pTSac4o85wj521rkJ1Gm0qspC5WGtUdzseq?=
 =?us-ascii?Q?R0iQmLRZFRDrzKmbG1avXBmceqAQ+Dw/h9YaJt2dSbgNURH/DBb0UphF4xJu?=
 =?us-ascii?Q?i5E5BonZGx6cmq9eKuKz8qgZHodm72WlICtTq+voP9ZtoTXJ0tqOVbdq5pc6?=
 =?us-ascii?Q?ViQa5oqU2bIUm3C52qRIfKLK3Xp+ZAq88m9OIZFb0zCuVJB/W4V4aGraY8CI?=
 =?us-ascii?Q?3jfN4kBbxJ3kGsEgjZfhK0zWFtkNs36GIxBEXlOedkfyF1wtlSb3tyRoKPWu?=
 =?us-ascii?Q?Kh8lueMAbFAsUp/tJrgAalsTxr7AzkVppiP1RlgoNH+MeOBIzxnLs4n2fSCg?=
 =?us-ascii?Q?c6HDOWBeIpncNK5d6mY0sCjMrpevP19BM+7rkawuILBNddSGGNZYub4JjCDR?=
 =?us-ascii?Q?jATCjQV36xubBszVh5tV56A1b9p5I0qOAYbylrDnXNwoLN7/Lql7Y2iLkjBh?=
 =?us-ascii?Q?WVNmzF+e0E7twBKu9CQJknP+ZFo5HbxbJnSdKp6ZwsoHQsyNPK5w9G5RQM0U?=
 =?us-ascii?Q?1KHUTDjyeAqCNoJsWC625HFd6Hq7Nm7+rCi9SrBIpjYlJQM48Cc3aQEeUYoo?=
 =?us-ascii?Q?d30WtiyHuK/FCzu7i63YoGmdwFByr82AYZNOw2WkjWXAyGwLIvIGBmlzWea2?=
 =?us-ascii?Q?pZRXXTXQMXKoNBLOkUMs7sEUoxIblbcczdQgURE41ciAup/7xfgPh84n9Jkh?=
 =?us-ascii?Q?kw/VGXtgK5mbs3bCa7c8yuoWjYYliQ2n1AS2tdCl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707e1683-4e22-4658-dc9f-08dd1e7adc51
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:11:59.0585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLwTfyuFIfKG28zQquX9Kh673+T+aU922sAZqg1XbWQ8m4njeUDp3F2zXRoI0eTRXM7tVkPlcjLcJqKu3ZUlYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8888

With edge irq support, the ALERT event may be missed currently. The reason
is that ALERT_MASK register is written before devm_request_threaded_irq().
If ALERT event happens in this time gap, it will be missed and ALERT line
will not recover to high level. However, we don't meet this issue with
level irq. To avoid the issue, this will set ALERT_MASK register after
devm_request_threaded_irq() return.

Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - remove set_alert_mask flag
Changes in v2:
 - new patch
---
 drivers/usb/typec/tcpm/tcpci.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index db42f4bf3632..48762508cc86 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -700,7 +700,7 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 
 	tcpci->alert_mask = reg;
 
-	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
+	return 0;
 }
 
 irqreturn_t tcpci_irq(struct tcpci *tcpci)
@@ -931,12 +931,19 @@ static int tcpci_probe(struct i2c_client *client)
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(&client->dev), chip);
-	if (err < 0) {
-		tcpci_unregister_port(chip->tcpci);
-		return err;
-	}
+	if (err < 0)
+		goto unregister_port;
+
+	/* Enable chip interrupts at last */
+	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
+	if (err < 0)
+		goto unregister_port;
 
 	return 0;
+
+unregister_port:
+	tcpci_unregister_port(chip->tcpci);
+	return err;
 }
 
 static void tcpci_remove(struct i2c_client *client)
-- 
2.34.1


