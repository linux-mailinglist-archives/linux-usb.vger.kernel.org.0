Return-Path: <linux-usb+bounces-12557-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7065B93EF77
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 10:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20270282B8E
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 08:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE1F139580;
	Mon, 29 Jul 2024 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GndOvOc6"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F413213C;
	Mon, 29 Jul 2024 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240627; cv=fail; b=FbgDdGesEvsgqbXAQ8VoJt2zRzm+x4xbjC7zSsX8MTgwTwn9wfHyfCfWOefTZgXpvffgAgeMnoyoR7MX7R55gpnwylijXlklWN6KuqPfrzcLobxt2pLsf/OXuBVmS8Oh8RmpXWQjydXal8trLfQtToqhaLkdyQY9PVM/VJYbo9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240627; c=relaxed/simple;
	bh=NlMz9IiXmzpzmCb8NP+Vjl+/AXwCUGtVat9OHyv9jAs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MI1/xvr1EuovPLn064p8W/wDXQ88hk+o2Zn1ji7TZ+Ad7yRwfM2AzKRZ1dtALZP3n+QO3P5SuE8ZWo9cT0gRYorLftb/7w2926WuegGzWw4o/bI/jcFYQKnliUfkCtYyl4atxgzjz6qYYul4ADg/vzNnTwWSk3w1deOOw6cuDM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GndOvOc6; arc=fail smtp.client-ip=52.101.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWhyHSYg/0Bdi8c6+95NHnccBQr6lDIOhvone1ujPEwVJA57uUkC5QARWjkJ+Nq+UKzijiGu6zxuaId0bHXr8HSB2oT/MLPa51+1lqdwulJJoU4v27mG+5mRNk4FUchFDgIZ0AjkdZJF3kf/1/2Xy+HQzQjf6KmA8YLUW7D9NfjffduATvpOhEe3I16o3GPk0k6vSh5nb0a/78My77KWThKKOG+5lh1AsHEYZB30gdPeGf7trSX7ubzlV4DZADvYUHVCHKsVbWrPMpwecLSJXj1JMwobzBgHBHPvreUzLI+V/5J2OEjbF0VL8JulJdZr+PzN+pR1acnjC0c8yqpdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9PKakBKkTVa4CZfQp3BcEjq/YzkDjPEODKkCji+3VU=;
 b=FA7Y5e6+sneA63Dvkn9uUi7alixBwHXIG53SRQTuOfNzyJoQx9UVpq17Cmr5JFrvKVtqpwa0qUduVw5THPfWDC1ELdUW1nTEn9ve6p0uBNNY8939tR4ZcQtwZD6w1kZio3G4S8p1t+ViMkievdFf3VW3vvAKUr6rf88hGpGs2wZuizYcKd308TiS0F86V8rV2T9sgC77AGxnkWwjtYP8IpjwPPl/JWiK8RR+vHX5U7mEHWo9xmNOQBVrKNdlZTXl7IEKBRgde//jvfHm9wqpf31wmB/5dXKTaEgIEm3w0cuwipTDI75eOTekD6V3D0SE/1RGcaHaTlQJ5zRi6PfmdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9PKakBKkTVa4CZfQp3BcEjq/YzkDjPEODKkCji+3VU=;
 b=GndOvOc6lzE1vnWcqpcWTsAjyvyPy5WV8urgfY3uIGzl/88hNLohLbdsgzmp4/qkBgWaKCURr9V4o19ZpZveDDIV0BP/4bfb4jd/ohgObUz7MbT8oJ2Soj8PpMoopJCTs3+mi6ZhUk6U8+/1piovwodfVZq3rQuC6o3KHKPk7b6esxsxc3zC+0Ya5x1KLOtQo0g8sNTFN8/OlFwXg1LDDDJKMIsWKJmZ78h7/Z+DaBO4aAvqtH/kZtX7/1vcVEOvfi65PE8SMyhyGPcSToPq64jck9r+83gHS0Ta7kSNVL2Ht4IwranCwiL9R4tZH8S9E6V2hufAg9trdng6k//HMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10302.eurprd04.prod.outlook.com (2603:10a6:150:1e7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 08:10:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Mon, 29 Jul 2024
 08:10:19 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: andersson@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for PTN36043
Date: Mon, 29 Jul 2024 16:10:37 +0800
Message-Id: <20240729081039.3904797-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10302:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db44222-81ee-4cac-b326-08dcafa5e2af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LeIVQQ2qX3CMw8K8QLoLyg4FLBmBUhINTMNJCU7R85GaM7y5/H8VwfdLZpZs?=
 =?us-ascii?Q?61uZcAoyaS2DwoBvJDtuUAhqMPsDpMA5a7Uf7qjTYu1IQTGxnQs5AVD5R6E1?=
 =?us-ascii?Q?mit5G6JvdLFaE3C1ymX8a1ZtDFtmWZBVtASoHkwfvu7ZYxRBuEtB5U/A4LNo?=
 =?us-ascii?Q?2CJxRR4YJBgGjZ0mYQ+WK2wofYaBODeF0k5Gva12rblMgGOY/ZkrtWuoaFfA?=
 =?us-ascii?Q?7/iqWErGueonVTz2F16GRrj8ILmauodxve5jW7zj62J27VO86e2DYvsgyv0f?=
 =?us-ascii?Q?NqDV1qiowkjChO2qQLdl7t0eXnwEnKypiqEzgDPqrZvMV/KLYncgEqyR0+Fp?=
 =?us-ascii?Q?dhZxG1KIA1I0ngU+0Mm0Rg9BVEZou+swHU09Jt+9ufSgellX3BSpfag+/ttN?=
 =?us-ascii?Q?FZ4ek274zguEZv6RKLKOgjcGgpGX5TTQ6bzztdtqa/1XMAk5nt52QW/sVwSU?=
 =?us-ascii?Q?vmGy3tXA+DsSI0wx/gXFLt+K9Y4q6nz0JnsNkIA5C1sbqXc8uVD8oFAhJ+x+?=
 =?us-ascii?Q?pOmM1e1ZNSS57dpLBO/3/xk/GlM+nmPwq3KMxvemdCVyoKwsso6pGi1oUQVA?=
 =?us-ascii?Q?DXtax0F77eONZi1eYEUSFIEWUTyqNcrKeJMkB4Aut+9yzFAnAy2igaQXhMri?=
 =?us-ascii?Q?xLYSl/2J4CeEgk2pKeQZasOMO39yMQL575JMFdiZ+v9QYntTykJmGHoaCLO0?=
 =?us-ascii?Q?zj8TyF/bONtB6YJQfRuW4nYfowbaku8haf6twzMBr9Ytaib0cwypA+cnJSLf?=
 =?us-ascii?Q?PonFIGGRD4PcQ//fkTlT0Qz2O9bbYvPgMdzaTr90Rl+v0rqY0Pka3d+sYh15?=
 =?us-ascii?Q?O7x2vzX8Yak8C9H9Auijefq8Eel+Qnfb1E4XkFUKqIzKf/37h/r5HTcIwfes?=
 =?us-ascii?Q?ziK0qFqCTpkfOVGZHI+hWvxVjAADxkmjR8zQDMZs13wJMw1xyFbpB9xsL/LL?=
 =?us-ascii?Q?5Lbs1TkxPQoouvOZIl1uPWUd55RPTkfubrDKiXkhkV3x340mVvmmfa6O6+07?=
 =?us-ascii?Q?ntNbOaCeDgWYuc7LbK5W8EAiFMDeg8xenimUDaMlLj1Ptypn8nlSrd72RL4v?=
 =?us-ascii?Q?Eh/LG1A/qNuVZSZn58ZaHYcVuGnC2I9oGbED0TjEmwY7l+NIXGgQrwI/IRU4?=
 =?us-ascii?Q?BtYXiaEjgq3llrohwYxweNaHdntUgv+szJDGxrXO+FMQ1SuPAGh7w/PT9lrg?=
 =?us-ascii?Q?+2ZEpzD3HZ1dR++Tu9V0NFhnQkkGf3EBTBdKZ6mR5emYo9kPke2HWjkJSfl9?=
 =?us-ascii?Q?kK+8H71lVJY9RjNhYV56fS1dPcKsEamaqlbI43EoSDVwT+iZQK6la/i0iM4c?=
 =?us-ascii?Q?a2EmR3+0774FPzvqWbzR12X8VOxfk1RDQ0YmZaYKFZ+7RTSp4ngDrS1n5pT4?=
 =?us-ascii?Q?ViWhzL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AKZxCUJnDIdwwH9Jswn1jyRgK1ozPC8tNNYkM0iqXERueLMMpr3D/6NhfVLJ?=
 =?us-ascii?Q?mC0KHyygkrEO6+s2OpXQ5r7JKOckNlpqm53gW96q3NzRITTVQvlN9VJhxuBX?=
 =?us-ascii?Q?AsMYD4/hKwjwcbKcZXk+Dfp6whiiF3OtdJFwBfxpR43GjJd5qx1oqLEX3pu7?=
 =?us-ascii?Q?/01n/L0OCnmbqYDirQBVFr38wJCA1yAbn2jUENx77mYNa1U2MWOQrbszcvXL?=
 =?us-ascii?Q?UybAHHrms9sbk7Ct1cM+qZtsAr90E2wlOlvBLpZX59W53B20BHEXDlY6eoc0?=
 =?us-ascii?Q?STtypdKsSfMm5OY57dRvpBOe5JHAmE3IqksA0sD0DzXLEf8OVHgQosf5KtcH?=
 =?us-ascii?Q?q/bD69/eUtOd4KfeafxSQ3zqF7l0XWtV4rlrphcjZE3UvdJPh2OwtMwWkUCc?=
 =?us-ascii?Q?AL+kixUROJLAvvxwTfUbed+qBuFK9OQ2qKLrtJ9LVBRQNmWLP9jJF4/LUaim?=
 =?us-ascii?Q?3esZXepXRIH7qiiTTPztFLMzlAqGvH5GuVNCMFqWR/pqCPpDJwAMF/5Vq+kj?=
 =?us-ascii?Q?FE7J/tyUD4DWBP4ZCl+MDEBN6Qk7zNXTduHR1fBB7Zij0mdJjlLJS5FcqIsM?=
 =?us-ascii?Q?se7gTa6/PPZlMcPskG9g6XMcAOw48ua65Wm1m5Ci+cdXqh7zcR1bJNGYQkMN?=
 =?us-ascii?Q?tvf1MeGVcB6kM9zuCfaXgohNnJVmKNtPXSoeeZKnkLQ2doO9FD1VVPg0MgIM?=
 =?us-ascii?Q?uRkcBA/i8IdWhhAqhPISx8wn2IJYtX7TcOess+pqTmW4oIJAjz33hnE+kDML?=
 =?us-ascii?Q?TH5+WReKlWFzQDDq+Z6FiFg0a6zfjzmuwpDAW8Jx9jX58KRzi1fdUA9RFoI1?=
 =?us-ascii?Q?DGiQTFl2FVEynyjuRYTOBwaztcheXqCg9jqTpOwd/Z205ArQTy7HthEbGyw0?=
 =?us-ascii?Q?7G91UDSlg3dd6mXMvJ2oJNRU9D681567ZbXTD4mRxQt6EaDd17p7fZduvPIT?=
 =?us-ascii?Q?OOaBBKiwl1ea8GOCQmff9TSF6W2eztUvV/t3QdVqCIXgBnovTQMNwgKtXGLW?=
 =?us-ascii?Q?My7lCQndvtj+YvjLN2kj2D+4qFdXvK3YT+T5wWshg5FHxKoXM4BL0Oc8cnLz?=
 =?us-ascii?Q?8apUt+rQMMoDBiO14zvM6wy5XBw2eAnz0IVmFGvAMVRiX68ugT70TJx3I8qp?=
 =?us-ascii?Q?3OhJ+y9kzJ+0azOOlN5yp94xts/WJHEeLBzCkuhhBBDCt3PdRcputNqfhnMn?=
 =?us-ascii?Q?JcIapZajMI6PBGL2pQeIOVgxPQ52O53ZAlXodqzPWlcA2I6iFO67kiP7nx+7?=
 =?us-ascii?Q?b2OAbEHq3UXTJv4qwTl2q6oJMjDRXExEiCqozAAyaWRUydgbAnYtr7vQKZ9B?=
 =?us-ascii?Q?m7JD7vq2Gxm4ElWAOzjzBpayoee90IH8Ft7kpdat7SIs7Uy4rIGEHGHQg/5E?=
 =?us-ascii?Q?HpmaplM8U6D+sGD8z7GWlvgMqc5G/UewJJ2bELOlCZVlLI6RJpCYGBd55NIK?=
 =?us-ascii?Q?hiYJiOnvsAUolEJ4ufaBLqXNko2hgc2qdIKI48G+lIpbLp8Ad1HIsXAqPOn+?=
 =?us-ascii?Q?IZJE72q1s/F5IzvjQpBNlJUVpfUa6imWAezWIfuJbb0ooW/p19kVzjQrNSKd?=
 =?us-ascii?Q?nwVtXSegpp8SRVCB/TEskkkGFt4PqG5CKwdkYLjD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db44222-81ee-4cac-b326-08dcafa5e2af
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 08:10:19.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujh1B14HHlVj908wObNAEt+So5VJGVUVcdbzndui3n2/Egwdcir5SpsJ8ihdPrBB3JEFDaL2NKMwPv+x1T7Hrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10302

Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
used for connecting, disconnecting and switching orientation of
the SBU lines in USB Type-C applications.

PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index 8a5f837eff94..152849f744c1 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - nxp,cbdtu02043
+          - nxp,ptn36043
           - onnn,fsusb43l10x
           - pericom,pi3usb102
           - ti,tmuxhs4212
-- 
2.34.1


