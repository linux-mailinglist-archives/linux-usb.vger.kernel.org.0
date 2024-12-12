Return-Path: <linux-usb+bounces-18425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B99EE697
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 13:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D2E21882D51
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 12:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F6C212F95;
	Thu, 12 Dec 2024 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KHKTA1Dn"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF3212F8D
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734006248; cv=fail; b=mTl7oLPWsIiXE9t9/Cjg7PB20hY22c2Q5D6AY+4TfVeiN4BPJCFGD+qKEPKzaRZJhIAtA8Lpg1SFys4ie6quzrBU63uhbuZpJq7TqjPNoy3jOds0sMswTCAGQvMFlAFTCB3DmrE9GB4dn/rNT6bRubZL14l9iCq/dJBnUF9JKbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734006248; c=relaxed/simple;
	bh=ueCVKTkvrgpHV9zhWDU2ASOoE+SOkPlyBV4xv4Lessk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XiGoAZw4Lw1p0Nma0z0rDDn0YCGJCEbpkO8oZsbUv8/puWNZaRJTG3Q64jEHZYtz1m7X6G8q++MvpUKYFCHHFr/rwUFARsVYNxkX5DiIIzTJ8/JR4k93mxwfBuElzk6UUP7Nwo0bDrL4+4nBD8qv7slv5duLLMUO5gAYx+vrc5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KHKTA1Dn; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWsJ9KWKa+kwZTZq7TbhR252N0p6PwqdK0ByEMExez46a1+S+j/hAZKOPmyhMd7YnD7S/mIn1hGJEXhOCReN52ZSYx34TYXVGJ5qMbBEMpqmB6cHXZUrYXnnykKbdSe430Aa7NdanMUP76j8/d8hHrhJobqYzyVKcoedS5LLsrLMbpFRfspc5x0+5U2yD1JBQ1sd+9qztHm4LeuB6J9xtGpuPSo2WhMoeEcLiuU+hx0Z3iVCxEEZ3eg1mcJF+XujXEhLnP60GuqgyQejhYZeVx/fkAHZYctUlomTfpu0rs1t4yyTD8m+3IkswlCLIHNRvjuwxqnrfNY1roTa7A8GYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VED280jk9jQbKhKtw/5rlspksELLuEUX8XZpVqJ2pjI=;
 b=wipItzIen3CQlKWG84oQEv3R48RB7VEzx10zEQBv8q3+NO1XWEd8Wf41Pv3u58xwIPKqabwnSjm32nAmNBpfJi5wLZqBTF4oyA1THMTPam40HfCtr3XcUvZDpQLlC7PFBhn8CjSC38dIFblZhBpBI6v4HCwRis5Et/KM9r2Ye7QacGvLA6D8QEv52GZRhMeeXknL1WOMYD02f4J/D20/meTD8FU0pb/9KkWX7HHgVCWH2dgpAPRk8Mz9HO/JyAdDFGZfxpt2upfIb74dRPJgwYq520G9tjrfPrzTTWDq2Z6/IdWX4MJrz2LfsFjC2pLcsk0o4selTpk/ORtUOQqK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VED280jk9jQbKhKtw/5rlspksELLuEUX8XZpVqJ2pjI=;
 b=KHKTA1DnpseFuHmYCTkrAsVz6R+NoMIMyeFEKBsNTCZ6Ug2Wx35toLJxcgsxPVvRQAzGNYPquBHgJvAG9UnrI7qI/xGN2JGbLj/iexGz1aEhu4eGUAY2B7CzfR5xTpRFOZY4G4I4Psqr5U5yHlUEjQl+9JXsDHbnL8TT2u2JL1YPGRMhONf+1Yng4BROkWq4eMohTbZCszzex/OKLxnDZiGtE7WT4pr9lSzaJoZANtupuodLTU1S7jAkR2YCG8UCJuVd2qNrqxzEJ5BOJ0TUvYkaHV+ugtE18dUuTmb+b0g6QdRaf5nGf5Y/oVyOuTUV25+4E1r4pfUVGMQx7P6Qxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9263.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 12:24:03 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 12:24:03 +0000
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
Subject: [PATCH v2 2/2] usb: typec: tcpci: write ALERT_MASK after devm_request_threaded_irq()
Date: Thu, 12 Dec 2024 20:24:09 +0800
Message-Id: <20241212122409.1420962-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212122409.1420962-1-xu.yang_2@nxp.com>
References: <20241212122409.1420962-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: 909ec15a-e64b-44fc-497c-08dd1aa7dd1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?tRbxFtZCsW0FZ06Fpnh3oeeP3V8tjKBpzRK2sKux23UzSIAOmmivW7wHfWKk?=
 =?us-ascii?Q?hNE1NZyaUvmz7LBNs84rwVeYhiSTA5YZIZ2JqFWUQq5ae5qOABgkr5KHvOHH?=
 =?us-ascii?Q?g696GDca7xSUoZ9gyB+by/Lu3uZ4bYsoYtzjNE0N9ULyHvXdgwelRSJMmc0q?=
 =?us-ascii?Q?0PaxztsgVwMf1HICdlFA8W1pGan72B+u7JcmGheMsAV9woqzv/nRon3xdM3s?=
 =?us-ascii?Q?ajSoreFUa8TO5zp58IA0/cATwHyifloX4UliSgTWjV9/lbcvrGyzQ0o8V3Rx?=
 =?us-ascii?Q?Qaoi2MB7kf5mwikZbtFaWwWcjrxKZ2Ai4JUnTmGIc+EPR2WaVtt3ePIqMzyz?=
 =?us-ascii?Q?BGEkDNvv/5eenk7ZhmIAzvixiWhy0mtigd5yTQzv9QaB4iHMrEC6vdrcHQ9O?=
 =?us-ascii?Q?VfTZIU3zsfndHaSDVZvj6KIqn5+DYQH41SYznRj5gOTo3EmveygyVyn3wQWa?=
 =?us-ascii?Q?BDWkMjwhYL4szzAxkIiaCG3927vhXi673hk+ksjXzdDRL1q0QXFxgAS0gx/6?=
 =?us-ascii?Q?6/aLyauaagxAk4Jl+78IgI8/caExFWP9qpXay0TEvhMPpszjsb2S2CfYSP91?=
 =?us-ascii?Q?eNdClUuM3ggi6rdF69guNgqUp04SDrOhss6SFkHlJGHlsRdznKZJugLjpnoK?=
 =?us-ascii?Q?/7V1bhMNfQokLCr0600jDAchrJY1DOJqbQK0elOvCyB0YUGxWGxfKhYJ/MKm?=
 =?us-ascii?Q?jehX+j071dcfgqwlsC39QbQlfIqiSJHOJKWZEQZUWpFBOPiHqCJ3PP7mDu5S?=
 =?us-ascii?Q?I29Dcbi9JYZwYTQeZ/N07QBNRC/lDbtqUcFsGZx996thd7fGJbBBaphUWIfL?=
 =?us-ascii?Q?8I7G1NBf9EzZmfiOZVGLRQiLbJqRX85MMNfsAhUtYcZEhTqxjPm21rY+bkzf?=
 =?us-ascii?Q?W99BS160jVjvXpJNJtOX+DkPnCaQ5U0+DcY/CcdXeLa0TPfkyOHtkSBlpmkv?=
 =?us-ascii?Q?Y5bDqLlXk0y8X5kQ9o+q3V4BF7Q/kcT0GD70YKiuX8p6ylh82qc5f5fbTkKd?=
 =?us-ascii?Q?QmMHOpzMOem7MeVIxLuz0B/80oPfHYMDnwFVUjgXfH7FGetIh2Rw+lfqQImK?=
 =?us-ascii?Q?+lMA/REEVqDtd46NfqyrcSjgxnworETDKdZcHammV6S0vOCzVJYmm/p1UUKx?=
 =?us-ascii?Q?gm0ANel/nPpQOlVK+rysmbP+q8Y3Aey/R5fRdp6NJpa1Nh3OcDiOr8GRs9SU?=
 =?us-ascii?Q?YODUFRMBaQ6/xxGJTo/bMIHzluz1Sa+4Z67Ax41j+fsBUMeZ8dRu1uWpUTjT?=
 =?us-ascii?Q?5dWUXsMmGFyBSLMRUY87KfHqfAVxG9UT1DY1u5z+h9ls1A/5IU9D3pEVIunA?=
 =?us-ascii?Q?roj6Ddde3eLjbvwrcA1szLZKleRAtThlw/hsZ8+G81X9U6xSyiq8+DI2GA7m?=
 =?us-ascii?Q?9gSrh+Maw4RevNficxtjZG2RS/ih8OjZPPfFeMu+dai/FYf0QJgdV9x3OUi3?=
 =?us-ascii?Q?Qb5KjGUqEj4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ptIov6oTtnzmA65+oPiO7oR2FmwFg32ITDJJKnPICyrHj4RhQQ9MkZj8Yl8x?=
 =?us-ascii?Q?GlGWZWqn92yzcE3oRtnJXK1QpM8mrNSWKQqN/wSnunSBNlTwgX9vJtr7RbJO?=
 =?us-ascii?Q?602da2sNPr5uyKGyKfMwrHqGphPL5KgThwNG741fTKaPvbSF2SgvqYb4KwRz?=
 =?us-ascii?Q?br1+T2SWrN0ODmyuxqiKmzjl56k/zf7K2u1xhscLnU4m53cS1gWvMiU9NjrQ?=
 =?us-ascii?Q?K2iG9NU2HxQ9OW27Ju9bOA3Nd8gv08Qhl9dCOE39naQwpMYGezzp4a/wJPmV?=
 =?us-ascii?Q?xvktf3yz+4YAAwinpMODcFycJYa115CIeJS0wMt3Ki9FBtv+YQzEfllwWQil?=
 =?us-ascii?Q?rK+YQdGqjpbfr/mtTi4vOdZiMViUze2JgrCS//zOHrnmG/Nw/DLVYvi/IySh?=
 =?us-ascii?Q?ISZFBXMdNjCQwJlhgduoOQP6wB3qJhW5cR+vjvOsZgBt9uSd+zSn6TPSXMxJ?=
 =?us-ascii?Q?GPppd+6DnYJaguHq05dqJYVYTwrKkgsN9S6Ou+eNhtpIH3V2YrDbaPzceFQv?=
 =?us-ascii?Q?empMZOb81dLWhNwWnEpJIUx1fyHyVEHLofAXqYrK0B1QQFOImmV0cVMdOddi?=
 =?us-ascii?Q?AD/LuonxAOF3VzOk9cfcfqJ0IbVCZvkxIJ1a5OW8mWDk6yvWucGyTbT9guje?=
 =?us-ascii?Q?HfbAd5BJVp9f+br8Aq9YIB9UBzv0zsQrydybqlBH6YskGOkfj1DuAk2ONqK8?=
 =?us-ascii?Q?BB2JTVZmXgxMUBHdTOxYMxGqna4oiZeTph8gnfHGYC0jBnJ9QVF2q2eHTnIa?=
 =?us-ascii?Q?BmJtOdYysaFUkM0J/Fpny7MJF4jkUMfusn8ytibEpBazd7mX1+EagTO5uY2S?=
 =?us-ascii?Q?yqng/kSqW4znt43Ad4y8zV0Z6E/izVM4eCMk0AE9jlxFwt+sOAoMRubu2Abk?=
 =?us-ascii?Q?QzRXYks8Z6/xn0UDEBVASAYwVDVNe1pQhGPCtdp91KGNy8EWWnO76J5tjaUH?=
 =?us-ascii?Q?0cDIiiOyf1Zyq+akPnF+0EicZ69rJj2xs1/O3ezdAT2tdZel9/I7mCtNwi/h?=
 =?us-ascii?Q?i6YXmxLPiLRwFEhw357EL3jGHVzUFGdBKpqqWIpa/pt0to3u99yWWM5P49cf?=
 =?us-ascii?Q?WoiXqTh5WYJRWiSnjog8nfZ9q4iOpikHSJq+M0wDM5AY6k7jbyiNJHOCNK8X?=
 =?us-ascii?Q?gkYpxGGN2cT21g54HcnzNr7r8QSQa6X17hfCfiCA+nOKzA0jt60Kyr33GKG9?=
 =?us-ascii?Q?m0/pN1OiNjFCLUA5xP80RAVRyJIaNbcO+jnJA8mtvHVpKc0pfvGl1f9dssVh?=
 =?us-ascii?Q?xkpuCRLPvP4J6Z3zBTPwb+I9Rm539JgoY2LAVChaarFvU3iMeP9fs8BwmI6Z?=
 =?us-ascii?Q?S8tuDgP6kpRhQyZaUySQTs0lV/SKjxJ4LV899bQmdIquAnE9FRnReXB4ggu1?=
 =?us-ascii?Q?yL0/bRNm8bqyB99+ZzWDuZyXuyhPrR/cl/Us0ALOighVOW1OgXcLC0C0koG1?=
 =?us-ascii?Q?jljJ6NDdfRCPuSoHmUmdiTcqIBPuSCKaFF0R9aCdehcXu1O2q9+T5vCjqM5T?=
 =?us-ascii?Q?X/APqbAscoS5HBU6Jq1AvRZ0+kn70/9b/pU8SH+qPPDLMttSfVZ8+LfYbJmV?=
 =?us-ascii?Q?B30EBOiRYYonwxFChGSI7VhDuxg2eW0sklBztnhi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909ec15a-e64b-44fc-497c-08dd1aa7dd1c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 12:24:03.0579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jX4fU0r7ZxJIs8XhPp3PesoJbgtGRrL1ox8K3lrI/tKtqhLA+Mt7pUP/9gO233g0JafiG8Ax035h3Rs2ulE7fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9263

With edge irq support, the ALERT event may be missed currently. The reason
is that ALERT_MASK register is written before devm_request_threaded_irq().
If ALERT event happens in this time gap, it will be missed and ALERT line
will not recover to high level. However, we can't meet this issue with
level irq. To avoid the issue, this will add a flag set_alert_mask. So
ALERT_MASK can be written after devm_request_threaded_irq() is called. The
behavior of tcpm_init() keeps unchanged.

Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - new patch
---
 drivers/usb/typec/tcpm/tcpci.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index db42f4bf3632..836f6d54d267 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -37,6 +37,7 @@ struct tcpci {
 	unsigned int alert_mask;
 
 	bool controls_vbus;
+	bool set_alert_mask;
 
 	struct tcpc_dev tcpc;
 	struct tcpci_data *data;
@@ -700,7 +701,10 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 
 	tcpci->alert_mask = reg;
 
-	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
+	if (tcpci->set_alert_mask)
+		ret = tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
+
+	return ret;
 }
 
 irqreturn_t tcpci_irq(struct tcpci *tcpci)
@@ -931,12 +935,20 @@ static int tcpci_probe(struct i2c_client *client)
 					_tcpci_irq,
 					IRQF_SHARED | IRQF_ONESHOT,
 					dev_name(&client->dev), chip);
-	if (err < 0) {
-		tcpci_unregister_port(chip->tcpci);
-		return err;
-	}
+	if (err < 0)
+		goto unregister_port;
 
+	/* Enable the interrupt on chip at last */
+	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
+	if (err < 0)
+		goto unregister_port;
+
+	chip->tcpci->set_alert_mask = true;
 	return 0;
+
+unregister_port:
+	tcpci_unregister_port(chip->tcpci);
+	return err;
 }
 
 static void tcpci_remove(struct i2c_client *client)
-- 
2.34.1


