Return-Path: <linux-usb+bounces-27858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9556B51478
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 12:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 669865421E2
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 10:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFC730BF6C;
	Wed, 10 Sep 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VbA+SeXY"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A4725A320
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501451; cv=fail; b=NpMjpqkLLvBHUFOq5o7Bbj3BzC1KoFTQ7YD6nrl0FrXX/fbV3fSSziCvGH5Vpx/UtPtqnpq5kQIyrhX2om06Bej4LHuMW26IqNgW3J9Ftz5VUF7gT5wFd/KZWTaMesrzf46mr/ms/tdZ/Y9hQFs6vJOggHDzrKCe9U+1c6LtSU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501451; c=relaxed/simple;
	bh=cvj3lJNJmqkFiblJfzn3WlTdTjEKc7uwXCDT/f9QplQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XoeKuc1poJMPSvE74nmdlmBIhRs7WtSnyye0bVCYzR6p20V1dANskABbVopQ06izpONPXlb1IWLHqVj57Av9C37FGUe09l+29yhA14Z5u3ByAY78t8Hh6mUxN8FLUzAQu7nFznKVrzdkKgfsbPilHDVeDVggT1CscdGVBe5mw10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VbA+SeXY; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9DFaNBld6oimsDoBM+Z3h+02EuXR0UQQEzw/2Pvb9Syevsc4Nm1DLLOIv7ZURA8P2Mh1eUrh4jAlaoq1SE5nrGqiOF4PhfI4KrOFgMm9etIP9kC/YrAjqAUtHpeZ+qFrKVTEeTKHrskCucKzzTi9smGqSivDQF8XNzcYFt6OJU0jEExgwF7HQcgjKbDEEeXUQh3dkKMGZ6xI6M3m5Xfk1K5Lo8zxZAUo4Amj4U1hTDeTht05JpXr7DS2kcbJ85ytJV0HJYdLL2WK2ljQjSqXaNTzgMtkuT/dCe2P7159uQvC9AUnOA5WXGHdGiRgCfndYPCDhf5m3GBhlDouAaNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMFSAH334A5/DUbM0L3iWM9yqsDceuk0hEFn7UpuCW8=;
 b=IN3bKB12zJolQIUb0dQQsh/HvLhon1drGu7V8hLP0UegMNC2vnzg/++KZ4VPjdO7opZi1EF93dxvl7Ygd1fRyMuga7l66x73tLc0/405u5bEiAQSc+ivEP72CymImi2i4uOFWJMZ0yehCn1tvbiird7w9204gDtdagkoHU7RBWr3ihF5Iv4r7vlo207m96EKi757eV6r0RPpw/TGRZbmgnvWr44XlQM1PYoQbnFqgv8op691xCqODzASfvjmRC9/WGGjjL49rnhRcMoBDjJCe3z3QEonBxc/IZubpCuY8VC1v4wfSBeVePXsGlotJGmzhjOGSWZBihdZktWte5g07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMFSAH334A5/DUbM0L3iWM9yqsDceuk0hEFn7UpuCW8=;
 b=VbA+SeXYCPaPo3LrJgVd62lHYVTz/6h+Uevwlc/NksUrEtw70XM1Ed0qtlVhi0+0bPmaQsKWk2aeAarfOK39niuyjy1psNU4sY1v/XXPdu1xm30Fz3196bQLxhuGUOp03uNkETgMck1qSWprRTb840+DzhvrtUEmso8/92ffyL1xUY6brq2Eh6O+3FK4ZWQ7QB4y85568QYTHs4kKBDSjBNH67ohwZsRO7lJafpkQnvU0vnTQbgfg5gOwlvhYEcKwXBrBaqgr8JTTVduFilwPorN/g6Xr/azAEBGIEQs7FBejN4KUnb4duU2hDCpcFxHHgCODXiZou6nwhXKDDavtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 10:50:45 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 10:50:45 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: typec: tcpci: add wakeup support
Date: Wed, 10 Sep 2025 18:50:42 +0800
Message-Id: <20250910105042.695146-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: a9da54d1-5809-4930-bd54-08ddf057e541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Fkf6SiFG5ApWUWxg8MMPhrW3vY4U23ruip0y1NXdECGmG6wSg1XgQSIPNCf?=
 =?us-ascii?Q?c0wgX033j9IlpTeJVZF2WABFf0Fg+5WAqGcswUrVB0VVnSc4jVi6U5xw2LOU?=
 =?us-ascii?Q?w3nOFARDk0VCkWzfvYr7t/D1szOxmj6b6wqJRA3P/0e8q97wqQ6lZsYHkO6e?=
 =?us-ascii?Q?ImNKi2ld823vY32VRuAwpzWIrm+8RVcWOUf187uzD8E94p4PWAL4Jov/L0de?=
 =?us-ascii?Q?G6JkWWGUc9PzeYrJgmYpSs9hlsP7IpRRVRRdTFei8f6mfWu5vXoOa5oonZOm?=
 =?us-ascii?Q?Ki0OCzjFFwdUbCrr2oQzjuU944MMUq+oQK+4ElyTQYBVD5/DniNoJui6vOQk?=
 =?us-ascii?Q?2BDkt2Mw1yVFaQfBtxNNRIgrBz0ocSVwgaZYqhIKY+y/700WNsnjs6coYEFO?=
 =?us-ascii?Q?OWYwCFXMDy7iqQ+B7O9TB9PX3Qv7RUI5iY8IW0sZzbjHB1dcRjStqTFR1BXh?=
 =?us-ascii?Q?x3Lm/gyQC375mk2P3Ai8+nkz9qtsV9+OJ4EIzXixJ+tXNIxUIU5tXz1ezOkQ?=
 =?us-ascii?Q?7s7QtuymPxKbZpGskSgWKPcCTZy39ha3Kw0nmkA7SKoB0pSCFom4FbXYcFmL?=
 =?us-ascii?Q?UHZH5ALuU1oURakS/JAkEQGNvxciyPCacmulWwo1bBwNg1f6YDwVndLwjA8k?=
 =?us-ascii?Q?Q3HtikPFR9JkIhk4zPBV710QgKGMUX3FfTsbvSrUwGX26outTUKk9RdZ3Cid?=
 =?us-ascii?Q?0tgqGTAe2UUou66R0HrX0ySQTILoTDaFAwK6Wkw9PhAMkzgNVNja3NhLfj1e?=
 =?us-ascii?Q?04sD2vG2vXMSaGUIE8AvRXpueIBv2BN/N2DesRCPPNW8FkDeQEPWkPk+Hd3G?=
 =?us-ascii?Q?KJ+pqQlj1J6GCLvKeXXmyrZQzIZWgGastacj4zqUDU5zrvReM4Cd95wfy8SP?=
 =?us-ascii?Q?ZglRx7h2czVM6CXO/XqghqZOo7LIpxQTdMXR5Ve1l5MVrofyHZtLNMW7hdz3?=
 =?us-ascii?Q?1lfkPRcSoV23VyQfUF/fsYrRBN7rSOaupTuDm7A7ATWxva6KadlN0AcBsEIc?=
 =?us-ascii?Q?EQXgFsrBxrpmhs6uir1cwdZBysfGI3ciN4j0jjsdiq4uTuxi6gScbLdeBozI?=
 =?us-ascii?Q?OsTQXql3r8RnZPkM1YAIlckt4IOVAw7xJMlY0ThkFVA+ONVMuk3RglqnHBag?=
 =?us-ascii?Q?KLtTaEA7DF3Qc/M/0EJ4vtxUHHIzh9Av1y45cdnztkHUsqLhA//TFUt1hN1h?=
 =?us-ascii?Q?W39A+mrosb4KrtJVmcoIO2rucgUS/NZ4JTE8gX7NuENgR1A4NuYcpuT6tI3/?=
 =?us-ascii?Q?U7T7vA+BFkuGLq7Yg0dZfJUUUNkuLaGgbJQr1PPzD4ws4W4oEzad6n10SJcw?=
 =?us-ascii?Q?gbOk9Yyp6ytzl4lERr/gVAh5olbnaADyx4BRdIuB16s6eBazq1scMfjkGHwV?=
 =?us-ascii?Q?m1ihlB8SCxLbi61toPKJ85vPTFd1N78IF06RdwDDAfUHi1xKRkwvkX3UlF/j?=
 =?us-ascii?Q?cp7kUZPBZk2z+VuPrLoLYw4magXr0qjPLDiVMUjHll0kdS+dkX7cXTaYce04?=
 =?us-ascii?Q?EmStwa2uNLyotvE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?THrn/TTSzlsJPxUOdYoXyHBOo7XBLDXynibqG0Eed64FAuhaQ9bctPkkHIdo?=
 =?us-ascii?Q?VejQtqNzzMYA79ptdYswvTeemo4nUnsdmLlEGX+ABulbmR13S0fQBVLOAFT9?=
 =?us-ascii?Q?hFxm9lctN562wGHl6y86N2lz2xm2AC4jRw9/A4hfW8UUpUlNxIzXxgQgjsw/?=
 =?us-ascii?Q?DVdmHSuzAeWH0jNcNcvhmHm1+hfbGMnhWMmm8JwQdDXbK3G85UzjWnGw/iWd?=
 =?us-ascii?Q?abIeArV5JFhRZq+xbBCGovIUiAeU3n3ukX5SpyJerS4YMBISQZB6uvbeKATe?=
 =?us-ascii?Q?YerfAFnIWQbqRPO5gxKymBjaTpbAqrr5v6wAjCFvMqOzWXBm7lrXmcN7yhkD?=
 =?us-ascii?Q?QFKz9Di0s1HGjewdCWl3o/TRJBMBP4gJD60p2fkMcKNGvRQ8MxDjYBiBANIs?=
 =?us-ascii?Q?VadmqC+DddbflZcKpTk5lrmQj8rkNCu7ajJZgRjutw6u7KGf2MZbN/hdZq5l?=
 =?us-ascii?Q?0iWt16dTPB2xsDxOJ3Gmh4dfTFR6AELPKbZnSDpTqFMeZFTuhnUqRxwu5hUl?=
 =?us-ascii?Q?SksMFghutTM9lmdqKm5tdebEI0fItk4XLIK3ObDb1LdH3frWd/LLh0oqmJPd?=
 =?us-ascii?Q?/VDZghazYyuFAhKlA5iUs8U3WGZngULjpLoGAaHACDKcyEx2cXm0OG5yE6al?=
 =?us-ascii?Q?0irZ0e54/G7FB9o2wVD4HDXO2beYIgP4CgTyBJwLnULgelhwr6MT4tpjfpmP?=
 =?us-ascii?Q?HPtcgVVJJ97Jicd4jaQ31RA8Dvi/DV+1Rp3wHt8r0XvGozx9pgCNsedCM8ed?=
 =?us-ascii?Q?IsN/9a4PWD2fGdeW8ctzrotNMYe96ORjW32V/x4+jhNvq+3uIlIvexD8JY0y?=
 =?us-ascii?Q?tC4ys/8Q6XzUrHkqrHxH6ebXt0Y3VJPhV7Uvp1xW3PIWjp6GR4GgYAit48oQ?=
 =?us-ascii?Q?8VI+/zshX1uFvELnlr8kP98AzUsDcnvIEKz91HTzdTO8IMx8A43J2CrrILk9?=
 =?us-ascii?Q?ndBnCnaaFG5yNJn//BcqeupBStcR1uSIBghy0sR82+gtP2upPDiz3bI0fKvZ?=
 =?us-ascii?Q?3VoTJD2W4lh8fH46P7pmn0c1MmTArk+/9u12xmal+DGgc7Rni8VVVFmrsMaY?=
 =?us-ascii?Q?AsUmn4UNgYjSdXDW6d9yAe9xOuUzIfCf+3Y2Mjxk0P29+Gm+4pDR8/PXRC47?=
 =?us-ascii?Q?bS2z4BZ+q2x6sVfD6w2M5rwEGjaa9eBLzUYyWIs1llrwM4mWifvjJwLh6zfc?=
 =?us-ascii?Q?xquFCsiUevcGp4xtlyQP4O/qJHGoNgMbUFqQnCnv6EnXJhjQvKkol7twa8YH?=
 =?us-ascii?Q?vswM3HiTFvbUaZfZ4DnfDGJP3mzfTNn8cI/Dj8sUXDr0Aa/hKoZQBfaoQtFf?=
 =?us-ascii?Q?og6W3jwKAboGt1fEj1puiBURbd5HXzUYQrRYYmLsDeMFKI/ruxJGSEzCAhGQ?=
 =?us-ascii?Q?m4ggFJQM7RnYBWp/g9W/O06s5xCgLMT6fsFPJ+19CY3IEVSXl9txuaILMizZ?=
 =?us-ascii?Q?GxTOjqR6maAyiKth0PwGL+obZIdpsdEKTz0JEqnRnGfSoyoxbr+y3OM6WtOq?=
 =?us-ascii?Q?3Lb5ANt6NNPMo/2JalbWb6k4ITGMv/5myEtPNtEwkn1l3nu65OoS9TiFS0k9?=
 =?us-ascii?Q?y+z99zQUCcaIOta+5sB9Iy3A1EXU083Kt4ubsEBU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9da54d1-5809-4930-bd54-08ddf057e541
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 10:50:45.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl6MlgIzeekJCqcFt0Hkuq3EgkG1Cs1kBfWZDnboQhBv2685All0/8SyUc01mf+g45BL1FItU8Tt22GV3zCWOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562

Add wakeup support for tcpci. If the user enables the wakeup file, call
enable_irq_wake() during system suspend and disable_irq_wake() during
system resume. Since this driver supports shared interrupts, mask the
chip interrupt by default when wakeup is disabled to avoid affecting
other IRQ users.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - add Rb tag
---
 drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index a56e31b20c21..2a951c585e92 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
 	if (err < 0)
 		goto unregister_port;
 
+	device_set_wakeup_capable(chip->tcpci->dev, true);
+
 	return 0;
 
 unregister_port:
@@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
+static int tcpci_suspend(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
+	int ret;
+
+	if (device_may_wakeup(dev))
+		ret = enable_irq_wake(i2c->irq);
+	else
+		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
+
+	return ret;
+}
+
+static int tcpci_resume(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
+	int ret;
+
+	if (device_may_wakeup(dev))
+		ret = disable_irq_wake(i2c->irq);
+	else
+		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
+
+	return ret;
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
+
 static const struct i2c_device_id tcpci_id[] = {
 	{ "tcpci" },
 	{ }
@@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
 static struct i2c_driver tcpci_i2c_driver = {
 	.driver = {
 		.name = "tcpci",
+		.pm = pm_sleep_ptr(&tcpci_pm_ops),
 		.of_match_table = of_match_ptr(tcpci_of_match),
 	},
 	.probe = tcpci_probe,
-- 
2.34.1


