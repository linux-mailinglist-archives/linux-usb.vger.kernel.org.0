Return-Path: <linux-usb+bounces-18577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F719F47DE
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 10:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F31B61892A7D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576A61DED74;
	Tue, 17 Dec 2024 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aZKa/cTu"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2074.outbound.protection.outlook.com [40.107.247.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB661DE3D9
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734428650; cv=fail; b=MMX5+z+uLcBpzAu2vPRQWLnazd7C7wuaGRcwy+13JMoFnqjRzQ2Foe/HGBjL4+eQxVlBM4L10diHorVE7wE2aKg0BAnrGqw0MfRGc1R3QO/GaE7nZ937yM5uIlnUdRwuyPDTdVDHumH6HPcgjOjnFO2Us8N39qqhFnNcwA+gdUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734428650; c=relaxed/simple;
	bh=XOhttCtvArk5JvrUFKvsZfjXyIxqe1Rxa35qeJKPdeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yr3uuFrPzQFG3MzPhPWFqvxRJKsOqnG+uYV1Gj8nDuU5aG1jgXMOftER7wJGBIjEt+Emd2SDvw5B8hbhjAISSk3cR8CwrynbgoAGR//YCY91Q+TgbQSyBFqVST8pZtLOzJs11Wb9bLne+yJ07WmXpGu5CorPVeMi1WUDyV0lPOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aZKa/cTu; arc=fail smtp.client-ip=40.107.247.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv3/O+wY3NO+lFb0yS1r6U2y65Kup/8IBdVVGrb/BjV1PQFv+rDGv524RrN8fExmqXk+745gWifkPekWhDVrLR4Q9B6zK7tSeqCcrxcpNw2H4nSDzRctaRjbF48e4LM2uHKwi6601/NfqOK33G5CMw1oB7sYNiC3MPSZyoGvoL+cIqouFy3TkBVL2A90ncFDepcm7RBOodu0Dcr0/swddmvEbSoLTk/VKRzqL2E+F142sWmIiPsyQm24DoQ15v2VKX9rld05+Q8I1nzulO8VApE1oo/2rCgYn0JXwX3RqSKY01OpP9Rk2h5q5jbAdW1TA2FgOq8HK4maMbm+7l/zjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1/CO3MUCk0T+QYGZKZwkyN1Z4SYx9uVlvUx9pBiXDg=;
 b=wsATCw0CcXc0UMBuVlsmfYeiA/Q6DCCv81QsA1MS6dc43eeAn3MSzxF8atEejcdkpPID+3O5Sjox/Y5u9rsdv1G9I4J4ylRhsIbEqvVBvTRzsmt2PQeZ+XhjNh1gLcM8xkyTMx++5i6a9Vaywm5cxyoBFqy0KGP5QBHUGbFwP6OAtyF5J4QTypiQ9JE5NRACHqa+QT4FJTt+3dqcYzfmja4ewE3znMdevt6nBqR7QvY5vo31OtNoJVqsEk47FqFy3jtj4pO7FSG6kKQhiuAnWl2oFp3tKZ1ha+iFIyjdc8dJkyFEhhCTGwg+L28o//q/8mmrIR4CnkthzME2t9mLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1/CO3MUCk0T+QYGZKZwkyN1Z4SYx9uVlvUx9pBiXDg=;
 b=aZKa/cTuTJw0NK/o7eouhkHCyDYTJyiWtyCs5ZlbAw0+wccbzGRB3BVcyY5fqEctSXkxkUnG2zAQkb54AfIiQYhdS6gTyhmFT+TQHBho9D1Wf6wf5iCUHT5kpRYBVnDFVar3KfSPgZ/ID+3MJmMr1Vd5Otg3mfr1M1zuknbJ+VTP/JFA+DuS8nLWG4pCBoqkAIE9VgiC3SNqhKfHCWD4ckOcCbtpVxIYHdpZmKPfS1PUHtKhOpUb1O28DCka1ie1ntC7zr9zE/gpnqKFolJFDBaVpA97GA0pOlYdRNawQuyau/EnerMt8gB6KfhxLFzpbK3z16WsG8hnRIBPs5S7cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9768.eurprd04.prod.outlook.com (2603:10a6:102:381::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 09:44:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:44:05 +0000
Date: Tue, 17 Dec 2024 17:41:17 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
Message-ID: <20241217094117.xb27iww4dmq2ehvl@hippo>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217092905.GA27489@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217092905.GA27489@francesco-nb>
X-ClientProxiedBy: SG2PR06CA0238.apcprd06.prod.outlook.com
 (2603:1096:4:ac::22) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c494e9-dbc4-416b-547c-08dd1e7f58a6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?4Pn7uRpH0Cjsl57e7kDWcs/v7J2VwtpmlYKhNIzUIkcLZ22DXbuNOGBm/RFn?=
 =?us-ascii?Q?S8NnlVUcM2dXA65iWxgV6eaJRRywePUAcRSZEYlQyC18WMM4Uk0PcnS+H3mx?=
 =?us-ascii?Q?DhYEka+kYZkU6/sQrMjLm+1qvqnGuaoTSas/Spr3H+c5DAoKuoBm73jLFEsF?=
 =?us-ascii?Q?88xBepYAyi5W2jQkMVWFGHVKhv4FvcXo/H72Cwr3IN0OYAWWkvre42CoxcTm?=
 =?us-ascii?Q?Wk/N9Eg2qZTX7/JyMhwqzQVltbr2Hqb1CEFsUoxgNr0vyeUUsA819W/PB3NK?=
 =?us-ascii?Q?qr4IAUaOkgAceLniWFXll1rXPmIWtXmpNCYjdhgx2q17ocZofhQQVz0HtPdV?=
 =?us-ascii?Q?Q5gC9N+gvTnjy4rai2yT184eQRiObOtl70k+9voJPErAEgtwzHGCGsSh4ThY?=
 =?us-ascii?Q?5Mw27fZl2XnxrggedO4hhzdYT5c19loUaYEKdemg049Bo5yjPoNG82eHECgQ?=
 =?us-ascii?Q?UWPXnfzipqlSLuFK8RLdn7R34O5ZxSV5dAxRWoVDUraOw0k/UXYVbTrIdkzd?=
 =?us-ascii?Q?q0IxrIvwH+c/WZH5heCkM+mBWIdsfnUlWuMJTDxy8P4h+tEnfN1sC0JCaG+Q?=
 =?us-ascii?Q?dwHJYlnZr5ksEp/Ga1R/Tb+vZOz32MlYsy6vrO+f840R0BYCQHis0hu+r7NM?=
 =?us-ascii?Q?r7fgDZaqC7RV6qriLiXkHoh3Dke9YPZNtDuaQ1+eZukMOj5xjo2QIRxmMe12?=
 =?us-ascii?Q?EJ29BPBFYKdCvgeAKPg8qoGMw19ofTIWycVAkaheUjvPGv3bwWhxoD8VyIkx?=
 =?us-ascii?Q?FRxO7lqvvWcoqbagsWIHUOvK4aTVSrr/um/SuUOWVAU4wwdJ45Y9/gDmhLU2?=
 =?us-ascii?Q?niczJ9WIuPnFE3seEp21gOHudUZUFNDaE18Sa1uc5iuJANFASC73M1/4dSas?=
 =?us-ascii?Q?P8yPH/NIY3bSIPoiWJDJI99rvG+/T5z154JUvK5vykTpmUAUhYVVP4gzVESa?=
 =?us-ascii?Q?HT3k6g9/rjM/JqsZrJ4YTHCwHAgjnzEurSFWfLKNXP2+/zmccKDgG5LGEM52?=
 =?us-ascii?Q?aQIMtjqxJE78927bcp+ZawWWSKaI5YzJxVqLAayNlVMMC6i7t2IwMKK++Nfj?=
 =?us-ascii?Q?C+7dNSi/oW0fvWfOLH8MixFxtwI0VYb826hTZ4TQHg3pbGHnsAlcRtTyxkMQ?=
 =?us-ascii?Q?+Lm50I4LHlzTuzKImbthm1cXM8/S4RJdylIrH/ShhVbVZTHgCy3TUBAH/r1S?=
 =?us-ascii?Q?CVZEOAJLbQi/kvuKrbm4TSrkMikObylI5IbFMXCnInbswjIsyK8i38w7KyFB?=
 =?us-ascii?Q?+3hpqdJOj6pOEJjuasjHVvS5i4mk+R9/uTb36GWOX1xNkv4zoECvsoz8YeO3?=
 =?us-ascii?Q?xGBY+zJW9wd2LWqRg3aM2uB1NXv7o6/zs2UyQ5hbc6bnY5pZyA1CRFhNpSI2?=
 =?us-ascii?Q?oCmOWBv+7bJzHCNJFAHEuRt9bpvGS6RNKylXmHm1dBPX9RGbNYYeUKQRPbHI?=
 =?us-ascii?Q?AL8Q1pjQRvngtgZZoqbxSd4ZlBr8pVm8?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FCmxO4YLJNnZEtVwMYduJ0EkzoSw/XoCs84jlroANgze/HBAGsf8VTW6fLhy?=
 =?us-ascii?Q?OPS4LzxKnRjDSZ1nkUXW9BkwjDpxoPqtLvMM9jKFTkUDJynznhILlzdlhZK7?=
 =?us-ascii?Q?FvwIcpq77Urhcc7I80jY3Uu++p9VJQH6WIrt/OBk11mXGODjl2BSuNWFere2?=
 =?us-ascii?Q?wVSZEmTbiA/J/mBY4aMCTIQMI+V3OhmoHX59V5nlW8ilLCkmJM4/k/ygKP1Z?=
 =?us-ascii?Q?4IAScra2hq1fEquN4lkbCWM5vM9MjREyxtDga9nVM4FbWku78TgHkkCrBcXS?=
 =?us-ascii?Q?BskcqaNuGQJfnefShA1+YneBFR9JySJ0kj1+h94Hju6zWTeGlwXfjo3xrQF9?=
 =?us-ascii?Q?BQVMnIbq/RuHJt8TcmaJoT67ik3Sq41n9WUVodrLGWAMhaJHUsVM9/Gpldq9?=
 =?us-ascii?Q?q+ZwO9CFC2hfKROQ1QFMQCZEaonBoYRiXYNNE8AQu+45MtTxYL9QOEOpeNZf?=
 =?us-ascii?Q?65vLiIEM/Z/+lSENJYhest9/vKx89otQ+LSpynMTgoEliW+zbmzgy+JlcqWo?=
 =?us-ascii?Q?BMg/197WHNSeZxtttmZgtsA3w8SrlunTvarv90X7p9VKo5mVb57prEc1UFD1?=
 =?us-ascii?Q?69YwGCL3kCVS8YRziXF/wgga0ruRf0z7OsQNsdwNIaoHlChQ/4INduWuj9hI?=
 =?us-ascii?Q?tdTiDuxBU+LehBKiQ7xnLotuR04sRxqK3nSAgwmjWVVh7BcutMnp3nW5nhcy?=
 =?us-ascii?Q?rIrfGpSafyMYfZOblBj0hRqrOmq412mS+1GylDkH3y88iVRq34E8BRSWKqtr?=
 =?us-ascii?Q?xlMY8vYEDy/oYuHlTklm5d4oZK+aN2/5G7JP0hK+rzNm2OpMJAablULBbZf+?=
 =?us-ascii?Q?AvAge28Q/4SVwZr45V+R1GjR3tBhms+OTbZwIoh/A63jF7qgIfr0yFcUruwS?=
 =?us-ascii?Q?He/oNJIVS/wbNlGDxURoYxEh+wFe+6+qinWvWPDSILsL34+1JM9/He/yP8wg?=
 =?us-ascii?Q?qMAuhnhJeSJRqAWesLdt9U+lZn8WwhKFuTKNBALaBhDfvrSPr57V8c2Hzu2/?=
 =?us-ascii?Q?R1WzRwq2/rueiiMnYgy06Rk8GN0RVff/yNSh5nEqU4rdvFzrgRICOkQrBQlp?=
 =?us-ascii?Q?/5bM8wlLSRlbNU7oi2p4Q5qcamF9OdXGZ0PDuqFGQkTsOUXJ8OqkOLGKCgQf?=
 =?us-ascii?Q?9lo/S+mf5oAIcb5OByQuKRoAE085kMG4n7WCtF7fEGFZoiSpL14cQV4xRq2M?=
 =?us-ascii?Q?ZLB3eMEo/uWoiNnGcJ2qDl4Oz9UkUoEfk6AG9Yt2zI5Ms1dqtdgq2AHgOZb5?=
 =?us-ascii?Q?iJyVIjaCPic4c+4HNG0sbgGaMRfDkcTmOSHMWbq3tZ0KvYmRJeWKn1yy1QJf?=
 =?us-ascii?Q?dx1VUTGdeePHpcz31+uCen7WxHnrCaZw+fsL2jTpsQp5tSbsg0tQtZqB7+Iw?=
 =?us-ascii?Q?uQR2G7ibFz+88sv5qPJObMd7h7U+0UrJGKqBpJsEcQxszMU/9m4/2gtteNqI?=
 =?us-ascii?Q?a2+4qo9YV384BfWI3gq96xWJTxf5W9qBs352gArlt1bhMO+zOrw2oR+Bl3gt?=
 =?us-ascii?Q?bsu+Kg3Ut4PmsnNYfvGdHQH2Ad6hwAAll9cHrTcFpuPPrcDT00c9Dy2VXm7c?=
 =?us-ascii?Q?EV1g4uSe/KkspHRDvgzieTZhLOk6IAb4q84Lu2qG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c494e9-dbc4-416b-547c-08dd1e7f58a6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:44:05.5094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rtqZ6fLD4vOMJiuYJFR5suf5jXoj0+qhTfU1J/P5hKFEwBaho7FZ7g0hp72YX+XF2W8r3TRqzokZsOSH88orA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9768

On Tue, Dec 17, 2024 at 10:29:05AM +0100, Francesco Dolcini wrote:
> On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
> > With edge irq support, the ALERT event may be missed currently. The reason
> > is that ALERT_MASK register is written before devm_request_threaded_irq().
> > If ALERT event happens in this time gap, it will be missed and ALERT line
> > will not recover to high level. However, we don't meet this issue with
> > level irq. To avoid the issue, this will set ALERT_MASK register after
> > devm_request_threaded_irq() return.
> > 
> > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v3:
> >  - remove set_alert_mask flag
> > Changes in v2:
> >  - new patch
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index db42f4bf3632..48762508cc86 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -700,7 +700,7 @@ static int tcpci_init(struct tcpc_dev *tcpc)
> >  
> >  	tcpci->alert_mask = reg;
> >  
> > -	return tcpci_write16(tcpci, TCPC_ALERT_MASK, reg);
> > +	return 0;
> 
> Should we set the alert mask to 0 at the beginning of tcpci_init() ?
> 
> Just wondering if some bind/unbind or module reload use case would need
> it.

Maybe not needed.

tcpci = devm_kzalloc(dev, sizeof(*tcpci), GFP_KERNEL);

tcpci will be reset to all 0 when allocate the memory. So alert_mask is 0
by default.

Thanks,
Xu Yang

