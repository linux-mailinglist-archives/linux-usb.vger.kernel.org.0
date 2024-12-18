Return-Path: <linux-usb+bounces-18616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE849F5E5B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 06:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC69916BA33
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 05:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564CE154BFF;
	Wed, 18 Dec 2024 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UbWG8mKD"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760E1531F2
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734500919; cv=fail; b=p6bm9CWwCnTSC9daHw8O4keql/2CAmqOXEdFPr+htbRLIxiZ9IoWm3kJ3zxUl2h5nD5GuecMoXaWrWIv9ZEP/ABU2n4J9FaG4IayTKe2urozykxZPVAwk6uKkSJOBuIUOsFyRqp8BUjdhNd6QviQIrmXVhjjeLZSsnNF6KGE2e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734500919; c=relaxed/simple;
	bh=gMsDPlbu3KEAlVWFvHEd/krq+fIcY7922cLWoGScRYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FlixnN/s7GPlI0cM2EFg4TrsVZ1aLfJd7hpSZ2KRsgStAwfwWChelHg68vjJLjrujogWxPjzubDv6RZ4plgyolzpFY/MgawjhpVe5cjZO44tlNXvMAmcLjwsz0USn+IbhWkBjt0LQYkCxmP9wbhL5b53c3uuLSUD/gmObyHjuBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UbWG8mKD; arc=fail smtp.client-ip=40.107.20.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9P10P6pk9MfGznbILdar8EZTIP0FtPZcaFkvv78snmIgxBWqI/6VWjEnVtNNUJZ105URtNtlT17aQWeZO+052PkrsSh6HdnU1KtI2q+RXNeF8Ozk3ILkfdtXHaiSBgmwE7kQChqMxEP0PhDBwMpcWY6vwZVPjXwDDLqKFM1tQqeERMZat+0F+qFnWcbPNvubYw74hbBVSHyeNvuebnrG4nz2pCwxzvG9nguFcb0lmmlJR5gzDFR3drACWJOE0dR7YIJ3Ch/2Ekq5r6xUcCsClfklx0bGDmow3nJzdHcQc1LA8sdS0Uia63CrYJy4khgXkItfDyLyuhALUevR+wVOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMPL2WDGa1qq2+p2eiQEiqYYm8DOE8Ey127gcqCPaMs=;
 b=Uljl89JUuXkU2DdIM9/Q610zIkreNY8P8iMRJn2bxmtaOYIERXhXlcpYn4YZjr+T0zdpYyNq2x/JcyrPtqhCriGojai82IhRqpCY0g8JiXgbHUw6p5HzA7fBfhl+ifm9c/BKlp3bycpidh8Q0S1vXpnzzpCrdLlrGvCJ/Cvp6el9SCwDSRobil2DgdrnunCrK0L8pREPWGxalLMIJnmcQft+1CK+zleXFyViiD0+KndcNoDZKrRw86p/HsmzB+HFuacm2QmCS0y9wSz8Z9WUaiz1yiBnBBLlEs3ekg3AE3j0acXvzWu1LtxUhpgYnp312KR+K0c8dKqMKzXWmT6L9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMPL2WDGa1qq2+p2eiQEiqYYm8DOE8Ey127gcqCPaMs=;
 b=UbWG8mKD1wwGA2S2mYCtnc2kpH0gLGuaSsoKs2QAun5HPxIrZh0mgVEI+BscafL3qS5+l4lWZNl4zTCTQQB2JoHtBuUiXsIqPtct6ju9vju8iBZsyq0zvHoDVlFRi4ci8iqHZuIcA3l5WprBO+fGsNrCSrzqi2cgBAB0hv0LBwqXMaNbO/HgGYlO9q+e1CzIgCHwCDXHOHDydlyRmTm0EvECayq5jMzVUtD2Ew0yH+/dT4GsdPJ8LJt23tBjcqrqoq99+3+k++icYtwqq75PIZSGwDqJto7OrRZXQLuoBHq9Vtq1rJcHRDXvMqsoSVK9Kx6CYi/P6ATOiPPrIO0TNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9151.eurprd04.prod.outlook.com (2603:10a6:150:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 05:48:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 05:48:34 +0000
Date: Wed, 18 Dec 2024 13:45:47 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, emanuele.ghidoli@toradex.com,
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
	u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v3 1/2] usb: typec: tcpci: fix NULL pointer issue on
 shared irq case
Message-ID: <20241218054547.bbbpvqledrul343f@hippo>
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <5260fafb-0b1f-43d5-83af-a61b3b179a1c@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5260fafb-0b1f-43d5-83af-a61b3b179a1c@stanley.mountain>
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 521ce2ab-a928-4ff9-9ccb-08dd1f279be1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?VIVP4Djs0F1E6Eya+IaDOWFgNU+1mko6KTHs2gQGPUYkk897gRGhBv4PA/A1?=
 =?us-ascii?Q?6EgZcV4V+9AcTs0b3lJFkP1owNOj6Td+BNt6ZpFmV9jEUZor0y6awAmLoTi/?=
 =?us-ascii?Q?pzJQGQXMuc+0uOBgZuOdX9pdAZGX99FL+O1ZN4zi2OJfvCx1kMIZoydf8rKK?=
 =?us-ascii?Q?vIXN26+yDt/O5d4Li56Ec2EPsSbgrlziCyOMqFs+x/c3aelDF2fjJkUFEvAb?=
 =?us-ascii?Q?gpewFBd3YNO44xwZhA1rgPGJSdr9pdxdt2zGDjNtYoi83MeFN0VIeajYLtMe?=
 =?us-ascii?Q?quBYeYaZpaYxOB/smgHNg/56Ub4Ol1j6+yn2nxNAr/E/mj7KmXQz7HOiHmsj?=
 =?us-ascii?Q?uGBuxGPKUg1s5nhdDQ0B0qtfW3oxQgPQNWOxyJmGMIvlRE9qeDzaq8LE2AED?=
 =?us-ascii?Q?ZoBMlqzT0V/ZfD0lByvtzCcHqtG2fyMtNLHWbr7N2FqbOclfWV6Jy4k5KYDf?=
 =?us-ascii?Q?swAjdhMuIJ0f7V+ViptSFmRrtdAzgVsqSFJWVp7hhKOool10JPO4W1iszOWc?=
 =?us-ascii?Q?cvdHd0965yUcPbJiqc6Bd61PBZxLwfYMy8+t1PR62xJlwczYXMS4QskGGl32?=
 =?us-ascii?Q?QDOCDI5kXuQ2NYq2dXSoEdkA0ZEMm9ix7BhYhJP8lRajTRFHaMKU8K8sGSaz?=
 =?us-ascii?Q?JHjtG+IQeOVP46UUA5tVlyPFs630Kr21LfWiJUC1DAB8dEHZ2rE/SHKloYrZ?=
 =?us-ascii?Q?LymrW1XaAUHFedl4PU1y40le4m9Lz7bffP9T+QJyR+hByiWlPk1cGNImbdX5?=
 =?us-ascii?Q?trs+UsIU10sQN8I+jk2fC1S+VlfVOolexHopqCneLq5aw4U8Dr7Bo1htncJz?=
 =?us-ascii?Q?1TGOQljmAz1mUWP+818Dxyy541m/oGJCSJeeFBPVXA8ll2oUWEJc41b3CiHP?=
 =?us-ascii?Q?F1xNqFgydAzuf5Rq62P7Vui86G+5Bnm4493S+7Gnq9B8Q03j1WabNioSJMfm?=
 =?us-ascii?Q?s0LAkIJ7b2zT2Ar7yNZbVy4QXlGRG5EBDdiW9IQXqUMzwuMBd0r1AuB+N/U/?=
 =?us-ascii?Q?lHs6D65f4wuQVcvX8E91DBnS4ch3MfxYpzpdeP0CREMN5NploJjcbpoLf93F?=
 =?us-ascii?Q?HeedS/N7Q58OTxROAiwBCTmHQQPerSfWGLUwhLWeZVE0mKj7gloB6taHkuXX?=
 =?us-ascii?Q?kiCa6qBtfbv+Btw29G5i8oC1cS+4U8CqGS/SI0EKX+Ed/HDwo8YW4KEDVdSR?=
 =?us-ascii?Q?YhIVczkb+jaTiGmKIO+slGzEtCd3mx0EQ30F6jl6ZAbRqzSTIsLBgzo4kF35?=
 =?us-ascii?Q?goBTXQ8aATLDD3mQFuj4X7iZtZ5RiOBvi4JhlydPn8U4B0Ex4T/iLEPsUWb8?=
 =?us-ascii?Q?EmPeuCdBm67IbZyx0She2awPLlrLWxCOE1HkSmZL3UrUN955l192z8NqD83o?=
 =?us-ascii?Q?rPjV+w9SOXHmydGjdKKmHBIA1GSg4S/aCAvxdG24FXmuRPGhF4kLPC1Grhhn?=
 =?us-ascii?Q?lGs0t+v6Gvaa5zzfsSIVWzlRDRh619cl?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kxkaSDPn5ia2qkK/FIt7mZD2Yu8dqTz/R9YIPnQ/FkGXsjy/Wxxncx+DCmsI?=
 =?us-ascii?Q?AB1iJEb7MXN/sktCwsHhAS1H4+WN+4p5d3Abo9VpdNouJ4yvsnp5wQ72LX0U?=
 =?us-ascii?Q?GZPZFUhAkkQwAjmoeHhCb1iesHsXjAcre9Vmkt+s3/ulzoAfyG3aM34Hik9z?=
 =?us-ascii?Q?ULBtXiLEK4vi0hivnskef7CNQI7WG4PMMrvE64Q/m7SscTrvusPxdZmreXG2?=
 =?us-ascii?Q?zAr25AGeWHx4AfuJd8Tb3mikFQSXe4kUe3I/Vn8wKHY31yQijkLc/1c0N1Ys?=
 =?us-ascii?Q?E5YMfnqDJPAjq2Vqak+VYSya2zFiNOf9d9D9yIBgx/8OYOtUoQKZSbQremNc?=
 =?us-ascii?Q?G9HXALB3ADVqPFFwaEphHDjKjB117MnwQnyyDPpmebw7o9rx41Cn+qbopJ1Z?=
 =?us-ascii?Q?MNlqgBJy3PurXfuGIb+sajYSldOmbdEEUv/gDHrWQneSAJPwphwPEK3FX4Vg?=
 =?us-ascii?Q?Ex/L0Dq/jNIvjqK68FwRaWCtHwpHfNLmCJagw/JNh/TFtv9eG6Zc5utS7yBN?=
 =?us-ascii?Q?CoQgPG5FYiGBPP8YwJ7Zev+L7JLYraNgsDslzNxcv6x+QB32ObL8RVp8kw9X?=
 =?us-ascii?Q?P4GEK44WaQq6XFh8FjtW9+0DXsxALS81P1EBRyO5ikOi7VOR2Se0IkMWMQl0?=
 =?us-ascii?Q?CercD5zFl0uiKt/BKgPdVGEXpf93v+auJE5QbZj5ao0FVqLYoJl2uIJt5NPh?=
 =?us-ascii?Q?t+0w3jI4ijhnrfSglTWfmyjM/JnePZBhmG4YFungzc2M3LlJgHKXYUryBr9E?=
 =?us-ascii?Q?ldqWitxM3f9u85PPKbjFp9VhQlESHQ4P0fAHQd8W804cyOO+Ojt2zQo4aDNt?=
 =?us-ascii?Q?kVy0RJN+nHEhtJOU91aEJ/6Fwx9TTlLYY9bwEcyc18y2/iBYiF80YPvskWOw?=
 =?us-ascii?Q?tk62olVI8n8B9bkkuMLR32QZzrDa72khakZNwvtr5oMAC7YYNBFrHW1dk3/9?=
 =?us-ascii?Q?P+IkCeG1ZzPEN+8gB3MiQDPFPdIKop0u0395cXy7oL8ITks13j1vsmVkc9J5?=
 =?us-ascii?Q?I0NE7M+ypOojr73Sjf70EMUThB7vkEL/rRYz/fTYavjr76VvmQ5SoHmk/sxD?=
 =?us-ascii?Q?UZAEH1ZsukdLiFA2GyR5ki1mAE3H2UVJlHi8Dw05RbFpRgCoyObjiE+oPGKO?=
 =?us-ascii?Q?wyHvA9p6L5K7R8OYgAUoBz0eQ1hZo5zcHc6XHRuTQ8bn4ck5HTqb3bzJwlks?=
 =?us-ascii?Q?FOFa7t0CW2Xuf2hwI6SSabQN+trGsfnfM8IL4MJoIMRCm+AqCVgPmO2/TM1u?=
 =?us-ascii?Q?bGrqVpH7qAxWiKKe+8PzNK056PcOojqGIZMqnT+1qtbArxsoUsWEh8/fMAhP?=
 =?us-ascii?Q?ORWp9JTcqv5UcCwQKZ9nH6sLV284C6UHtGP0+oipUnDZx4Vc36AVnrKAeODX?=
 =?us-ascii?Q?dkQcxKZunlCwGgMmiso3BxN5jEzrgZUD1nurgLnU7h6vQ5QZ/8r0loGy4xsL?=
 =?us-ascii?Q?ZqWMk56b3rNuo9sAx8wnTl6xomwLVbsWMnWphIL0uIn6tgFY6oPTgpMztsNP?=
 =?us-ascii?Q?dgsh2MUb3/YRGAsm5ehFAkudxCN0ABPXQComa9dRTX3078z+sWYg/9OxEr8Z?=
 =?us-ascii?Q?ob9ZuFjUHx+oYoZJhnoyHxKiLEIlI7/WkTnEZpAk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521ce2ab-a928-4ff9-9ccb-08dd1f279be1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:48:34.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TzQLB2Jr2g6Cxst5Iqwdfp3l5KvIO0KyTlb3hH+wZPv8GgmQzcad6pl8exPS0ilx7ZL2e5GjoqcPr8by54Qfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9151

On Tue, Dec 17, 2024 at 12:56:03PM +0300, Dan Carpenter wrote:
> On Tue, Dec 17, 2024 at 05:12:07PM +0800, Xu Yang wrote:
> > The tcpci_irq() may meet below NULL pointer dereference issue:
> > 
> > [    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> > [    2.641951] status 0x1, 0x37f
> > [    2.650659] Mem abort info:
> > [    2.656490]   ESR = 0x0000000096000004
> > [    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    2.665532]   SET = 0, FnV = 0
> > [    2.668579]   EA = 0, S1PTW = 0
> > [    2.671715]   FSC = 0x04: level 0 translation fault
> > [    2.676584] Data abort info:
> > [    2.679459]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > [    2.684936]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [    2.689980]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [    2.695284] [0000000000000010] user address but active_mm is swapper
> > [    2.701632] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > [    2.707883] Modules linked in:
> > [    2.710936] CPU: 1 UID: 0 PID: 87 Comm: irq/111-2-0051 Not tainted 6.12.0-rc6-06316-g7f63786ad3d1-dirty #4
> > [    2.720570] Hardware name: NXP i.MX93 11X11 EVK board (DT)
> > [    2.726040] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    2.732989] pc : tcpci_irq+0x38/0x318
> > [    2.736647] lr : _tcpci_irq+0x14/0x20
> > [    2.740295] sp : ffff80008324bd30
> > [    2.743597] x29: ffff80008324bd70 x28: ffff800080107894 x27: ffff800082198f70
> > [    2.750721] x26: ffff0000050e6680 x25: ffff000004d172ac x24: ffff0000050f0000
> > [    2.757845] x23: ffff000004d17200 x22: 0000000000000001 x21: ffff0000050f0000
> > [    2.764969] x20: ffff000004d17200 x19: 0000000000000000 x18: 0000000000000001
> > [    2.772093] x17: 0000000000000000 x16: ffff80008183d8a0 x15: ffff00007fbab040
> > [    2.779217] x14: ffff00007fb918c0 x13: 0000000000000000 x12: 000000000000017a
> > [    2.786341] x11: 0000000000000001 x10: 0000000000000a90 x9 : ffff80008324bd00
> > [    2.793465] x8 : ffff0000050f0af0 x7 : ffff00007fbaa840 x6 : 0000000000000031
> > [    2.800589] x5 : 000000000000017a x4 : 0000000000000002 x3 : 0000000000000002
> > [    2.807713] x2 : ffff80008324bd3a x1 : 0000000000000010 x0 : 0000000000000000
> > [    2.814838] Call trace:
> > [    2.817273]  tcpci_irq+0x38/0x318
> > [    2.820583]  _tcpci_irq+0x14/0x20
> > [    2.823885]  irq_thread_fn+0x2c/0xa8
> > [    2.827456]  irq_thread+0x16c/0x2f4
> > [    2.830940]  kthread+0x110/0x114
> > [    2.834164]  ret_from_fork+0x10/0x20
> > [    2.837738] Code: f9426420 f9001fe0 d2800000 52800201 (f9400a60)
> > 
> > This may happen on shared irq case. Such as two Type-C ports share one
> > irq. After the first port finished tcpci_register_port(), it may trigger
> > interrupt. However, if the interrupt comes by chance the 2nd port finishes
> > devm_request_threaded_irq(), the 2nd port interrupt handler may be run at
> > first. Then the above issue may happen.
> > 
> >   devm_request_threaded_irq()
> > 				<-- port1 irq comes
> >   disable_irq(client->irq);
> >   tcpci_register_port()
> > 
> > This will restore the logic to the state before commit (77e85107a771 "usb:
> > typec: tcpci: support edge irq").
> > 
> > Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> 
> This commit message was not super clear to me.  It didn't mention that
> it's tcpci->regmap which is the NULL pointer.  (Obviously there are a
> lot of other NULL pointers, but that's the one which will crash).

Ahh, actually tcpci itself is the NULL pointer and kernel will crash when
get regmap. Because if tcpci is a valid pointer, all of its members will
be valid too. Anyway, I will add such info to commit message.

> 
> Here is something you could add to the commit message:
> 
>    We cannot register the IRQ handler until after
>    tcpci_register_port() is called.  Otherwise tcpci->regmap and
>    so many other tcpci pointers are not set up and it leads to
>    a NULL dereference in tcpci_irq().

Thanks,
Xu Yang

