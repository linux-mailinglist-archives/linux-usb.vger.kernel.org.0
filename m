Return-Path: <linux-usb+bounces-17987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4239DF90A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 03:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BEF3281135
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2024 02:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34EBF29D05;
	Mon,  2 Dec 2024 02:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RmsrZ3SH"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22B26ADD;
	Mon,  2 Dec 2024 02:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733107823; cv=fail; b=UT/ls+3lIgnI59a34m16QloNA0iWPOVAwMj2LP/cDfSnjbvdjRSKdol8Bdq+csB5QhOqsCNZQ9+Rl36I8Rbdz/RtLEzRPTdfISrV6+nPIMewV1susGHlz30rj00ey+BZeuPlrovKWdHKfyTZnqU2WH2Nmv6/6I18OC7KbiIcFvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733107823; c=relaxed/simple;
	bh=NtUugw3jlT2uNPQFS1zFnRDAXe8MxCzoCM8IH86dlpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HvgMXdbaBkbT63pIZeKHOZjBZl47etH3opM/qx0sAwsSAvqa1qLiI/TrMmaZ/9LoyOZAziOB6HYMyKaWCgn3p1IaEtqKvFO16s39fDtLWDvoy4GUeI4STA+p7S8RhcjhWt+sB1wxyi/149y21+fxh5gbbNmweYR0Gl9DXKU41K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RmsrZ3SH; arc=fail smtp.client-ip=40.107.21.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lk6w+6wIw/u/e4t6nHSE9+GL8OG4yvDPLoGj5xk86iV5MoYyyi0bMwv0nU3vAgoFY0JcljVwVZPrdusebUiSxszffzmlVoodHXKsSG9AosWpY+ZCb8XmgMMld0oKvCSwWqq34bSXSQcoAO7WUs619W1y4Yb7giiaGua4PcwhU2YbtO2SXMghe8+ScFZR1r+uoIdTVzfG/HCD+gUBhnNcr/gTtYZyPGS2DCoC/bcMhdePEHXcwo7hWB4fsgm2HV/RgIoc2NYw+y5YWp1cTUEihzwVFYed7ruzuSU78UUYLhnDKPqvx1rxkV0bs0umkxdv++2pomHTdKS+5miXSpTg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ5SRDg2S3zdDhv3Ed6msj+o1gUG3SiKu15X0+meaI4=;
 b=PRunp6cJ5WZtvqQoa4vEsWXRMbIxPcIV67lPb4DSGvtU8yS6DHsbFE+ZsazpoFSalO0jztD1mLyNPemn6ZcqyeTHv6s7xBtb1L0HgeT/ysYikgTKGjDuoQuCmLq/0fcGoPEi46BQOaG59Pem+HDVO/fYAn1qtc/U2Ha18bK50gm3zgcDT/OV31mKCUjgbLQop82G/ucKt0xZnvAtKyXAw17b2Aq0Uxv+TBHli0P3Eydi30rczOzDYZAX4oKXMI9cqjU+BVDQUM8WyDHQo8e8qnD65Tt7ncZmhyDhOacDZnXCJzwIxwJaZ7O5VjN5whL/4jIsvdM3GFSqgucpZV5O8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ5SRDg2S3zdDhv3Ed6msj+o1gUG3SiKu15X0+meaI4=;
 b=RmsrZ3SHOUFgnQMterMgjVkhrLmQULbjNW8Ig/9yBQ3rTCuwkhSpwl5r5HH+WZhmtBxWgNXvm5PoPgoLcfUJcipFFMc6cbIxBFNXUGn95mCkEhL7Iws8ehGBRj1zAYcm5/B57aRGmknjyMEQTlSTCUHgrKvnV32TsOkbJjBV8veepl0j0R2NqFe4peQnPORwY5TjZEj46JFsOPKDQE8BooYj6Y3wIxuMAG9bHtj/5ygDHp0pzKorbfrf4LZMoaPDkZqWTUqcc6PD347zoxgkA9C+IZcdNw/o97sCrYb7Qz45odk6EP514EZ3WQIHo6Ul8wxFame0ai6KuWuFSguEVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI0PR04MB10685.eurprd04.prod.outlook.com (2603:10a6:800:264::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:50:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.014; Mon, 2 Dec 2024
 02:50:18 +0000
Date: Mon, 2 Dec 2024 10:47:52 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Amit Singh Tomar <amitsinght@marvell.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v10 1/3] phy: fsl-imx8mq-usb: add tca function driver for
 imx95
Message-ID: <20241202024752.bmvjn3lzz2wjkfvp@hippo>
References: <20241115093312.3407815-1-xu.yang_2@nxp.com>
 <2ae369bc-9cf3-49d8-92dc-ad19ddb48efe@marvell.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ae369bc-9cf3-49d8-92dc-ad19ddb48efe@marvell.com>
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI0PR04MB10685:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f48748-a104-4935-b3d0-08dd127c0dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FUGmZSbHcYBsFfEf2uTQ/PskZ4rIAUAujK3dAA7udnkpwhv7DtKm9NpWbUFc?=
 =?us-ascii?Q?tuf7QiOgrKe5TLhs8n1awZm1vOuJ17lQRWo2lofSomuDIC5ADXD0yTJXnZQp?=
 =?us-ascii?Q?RrQteXGzI501R67bvdUVWLWhizvqsKREPdjmwVMMu8+TNUbd3xHQ3aqE3Euc?=
 =?us-ascii?Q?rjJCxaSTBR/NHlJ0KPU9ivgxfMe/CffoK8YOQGatTZnBY35QLM9w0Lgca4xO?=
 =?us-ascii?Q?15jh2qLc9bpxEi8UpOTAr0Ksx58zKoASiENdobZAVMCxPFj0YAX16wHInz0i?=
 =?us-ascii?Q?efpBOl3Gf9VWB+sD1nO/KIIfOvGClL3P87mhUDomd8Kp6qLb+OuFwG3FYQwd?=
 =?us-ascii?Q?/7HhndaAkz4TeySG3NmEuwvlF6fUQpZfJo4padO+3uuLfyoKPYTqxSHiKgTc?=
 =?us-ascii?Q?3tWfRqYrD8BSwmnggnEDig14P+RP1f36GJo7YnIkmW42F7Sg80WcLte3q3s9?=
 =?us-ascii?Q?zgzbmkqfos0o6vOdAssP8YwYy/5JvGx00VmP6u0a4Ln9LIE+BK3Jdf493ucF?=
 =?us-ascii?Q?E1/jkrpRcbEMhCev3eXtDrw04QSDqr3CokLljLZGB7aXPe4mTvQKvH315yqO?=
 =?us-ascii?Q?1Nno0e5o8EyOBJbNnYs/ePGYNx3+XRgSqQBfApce5skbUOw4F9uvKaaiEha0?=
 =?us-ascii?Q?2UvvME6i7bun1YE/rv5ga6xvLC5n9HPJxGogyj0bHs3fH2KNvDr3/0D495BS?=
 =?us-ascii?Q?6NL6+st7br1Yl6BXC2s4DQ2xGC6OiqRXSvoh2oP8lPlxpbklCmUA334x3iRz?=
 =?us-ascii?Q?PSe13xmwtMtJ13Tc19o5wynHmTbwPZzqcW2YXF1mNgIrtb7BEx8IT3tN6DsT?=
 =?us-ascii?Q?HGJ+VThRPtwC02CMeLRoPp3zD1fKu9hOnvCDo6yP7mRlTAcKz89T2N/iab//?=
 =?us-ascii?Q?HP+/DHkNS0M+iFHj+epNfrAi/fjTJRiBobW5MHQmtf46BMAUfPHgU80sC5ld?=
 =?us-ascii?Q?pCHSLqUBJEDQr4EdHWzxUVi3eKFDsX2GwcG9/+L75+SbKm1NA9LTX1eLGmE4?=
 =?us-ascii?Q?k+xAwymxzhOcgvlUVETzfhLzuhQvtMFVhVCCgYYcJeR2sB76jmYlA0IQbAtv?=
 =?us-ascii?Q?+fUcpjsfjKacIzJL8HxyGmXfzNVSAcFG2mXeqWavC2pWolXYFOHV7q9uJ0yV?=
 =?us-ascii?Q?OCnWDh8/Hu+Vch1/TEL+/awL0TPooccI2+ai8p+FgJSYiDe3K/qDPehhDUZ2?=
 =?us-ascii?Q?3d87bs5a98UX9EZTNqWhidwcuy1yvaxaC9PfavbBjc8iCeS7VG2FfHrGFmJr?=
 =?us-ascii?Q?cjC0GKCnK2x7u6Pn+1nnR7pSQ0IQ8co7MyCHzF/SZPB3YTqR+8uMc7kvNfrl?=
 =?us-ascii?Q?+6uqpKtmyx21VmbDdGrWuvaeiD4DUQWo+Hp4FxtqLOY9vLhnvooOlNc1ZQGt?=
 =?us-ascii?Q?Bgo3bbrZWYRMzqzqESVYkZ3b61/NzNy70d51k9RDjP7OscXcnA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3VZhw9RogQdebCUvuq6ZjvncpKsMmjeIcOUdSVNOtSQzHUIfwysZ3KnrRwsj?=
 =?us-ascii?Q?BuTQ86pLHxiJqy4SSSaTJVVGS9rrp/2DclouZyQ2n/s1Mnwi/rUJ8tXc48WU?=
 =?us-ascii?Q?y3V8+UXAM7Nb5YHQnyU7dNGeqB5HsxY08xdzQg2pbhJU1zEEKCcAljNT6xF7?=
 =?us-ascii?Q?FPRMmr66vTRjihkb4jbRAC62GlySisvRMaOyHA8I6ZAvSq3lqUEok+LOgivk?=
 =?us-ascii?Q?mq4/TOylVZRGXk+MUvbsea331P9dFzX1NOFNgjz4vuUPvMN4zrgljna2YBEd?=
 =?us-ascii?Q?FZOTxNhyHXexLzrUI/kqej5xF1hG4ljPQyBk2buy6/rT34/dvZU4wVC839Tu?=
 =?us-ascii?Q?+5csYoOvNHsus2ibQeGlGZW7wniGyx7YoaBSDGKc1FTmlzl6ZvVnNfEdWWyT?=
 =?us-ascii?Q?0D6ISKfcKvvGdnscrbPjCsqlH2T5U2rKnxQRc6AgtmI76Xs1OA3+c15yE7ty?=
 =?us-ascii?Q?8k7B/mXLR1dgRgrbTR4QsRIlmEAEqjT3v6W6vh3Cennp/ciifhgGt9u+7Bzz?=
 =?us-ascii?Q?4jSUd+ojGHMyBnA5k3LrEb0jy5LuALZG796iR1zNrW+K2rqWE7Bccxr67L71?=
 =?us-ascii?Q?nRKMKl4GmgqZA1pa0fsTP02/Bx66/BEE5VO1dsn+o2gjjs6gDBWAxZkvm1CY?=
 =?us-ascii?Q?9Id+9nCSkBDS5pozbhuOHufxmHQOrWVEEJw0/OXKsHqJXnMxGFV4xv2te6m/?=
 =?us-ascii?Q?Q2C15Y8gaELnc1XluXNhvdmCJWVE2hWrDCdLpHeE6BaGN+UPAlbNxR92wyGK?=
 =?us-ascii?Q?ciILaS/GAVH45hwY8LH0WnBTHL005Ag1ua5qaABfq8K0hPYchjszZn5R3TS+?=
 =?us-ascii?Q?gOQQOQ1J2S46esQ7XIXR62/P3QaQEAgPsrfRqgIp9t8xBVM3lwCTre/bRS28?=
 =?us-ascii?Q?p9ONVj8Kxa0P4vQi4LOhFjDv6Brcp8cW263QogxrBT56CsrEwu4lTRk5D62O?=
 =?us-ascii?Q?r1tpZ3Ed0uWLtLQuC13YTZ05wjO0yefJ0kNPYs4bOp0OHvd1y37UcQWGY9xk?=
 =?us-ascii?Q?mSvuDzbVCxZ5+oFSEy05LTRL9a7/+eoYIdhCCKgKRR9kedenSKFuq4Ww+t1I?=
 =?us-ascii?Q?h7oen1Ao0V4V/H2TL0bLKWRqlthi5nx8AbnGLynQhl73dApy9CwDnFfxzbWF?=
 =?us-ascii?Q?iHsIwCfES271p6WTG4Q+s5SQ5gRM50DiU6+PWnlKUq2YLhPHeU8wtrbtROmp?=
 =?us-ascii?Q?ykoSqFubBqyO4IsvU8j1CJi6Dz83VfbcWOJZbBM9qD4Rtdy6XlkQbp/AMmso?=
 =?us-ascii?Q?06GQshwa2/RuFb1pKjaLOuaecqvPpXwIOq/fAV10NBz8a4gRwaEfZ59Kxklo?=
 =?us-ascii?Q?ir55qXd01f+2hocIFq54WOe3XQ8bZsZv9Pfr68+iAUv+g61TiNeB2nwMV73e?=
 =?us-ascii?Q?AU/kLbqJZAgwO2X+SFq9xrleqxFc+EMmqeDsGYNafvC1v5ZeRPFHidw//D2g?=
 =?us-ascii?Q?xcZNtsza61EmX7hJAZwZfLMmt1Pfq2aurJS3jgNPnpbGioSqErIJOAGuxy/H?=
 =?us-ascii?Q?BnG3DkuYXVYQlT/2drzIrKMX38XC8qaCKK9zSYL5+FiVtriUd4b/ePa/jd8c?=
 =?us-ascii?Q?Y3FoAdZP7isoQQmyq66Z7U3CdYFr363njiY48Y07?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f48748-a104-4935-b3d0-08dd127c0dfb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:50:17.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ledxmpXxVUdmSgP3xvVNfcjxikmCPk5OXgLCFcT0bgCfBjV2gznzYcw7i7LFsDx1FH2QIMnBuYd/nJ6X71ssiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10685

Hi Amit,

On Fri, Nov 29, 2024 at 11:04:33PM +0530, Amit Singh Tomar wrote:
> Hi,
> 
> > The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> > two functional blocks (XBar assist and VBus assist) and one system
> > access interface using APB.
> > 
> > The primary functionality of XBar assist is:
> >    - switching lane for flip
> >    - moving unused lanes into lower power states.
> > 
> > This info can be get from:
> > i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> > 
> > This will add support for TCA block to achieve lane switching and tca
> > lower power functionality.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > 
> > ---
> > Changes in v2:
> >    - return the value of imx95_usb_phy_get_tca()
> > Changes in v3:
> >    - no changes
> > Changes in v4:
> >    - remove compatible check for imx95
> >    - check whether tca register region exist or not, yes means has tca,
> >      otherwise skip tca setup
> > Changes in v5:
> >    - no changes
> > Changes in v6:
> >    - no changes
> > Changes in v7:
> >    - fix sparse warnings in imx95_usb_phy_get_tca()
> > Changes in v8:
> >    - #define TCA_INFO 0xFC -> 0xfc
> > Changes in v9:
> >    - no changes
> > Changes in v10:
> >    - no changes
> > ---
> >    drivers/phy/freescale/Kconfig              |   1 +
> >    drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 243 +++++++++++++++++++++
> >    2 files changed, 244 insertions(+)
> > 
> > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > index dcd9acff6d01..81f53564ee15 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
> >    config PHY_FSL_IMX8MQ_USB
> >    	tristate "Freescale i.MX8M USB3 PHY"
> >    	depends on OF && HAS_IOMEM
> > +	depends on TYPEC || TYPEC=n
> >    	select GENERIC_PHY
> >    	default ARCH_MXC && ARM64
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index adc6394626ce..f2b2da8cedc3 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -10,6 +10,7 @@
> >    #include <linux/phy/phy.h>
> >    #include <linux/platform_device.h>
> >    #include <linux/regulator/consumer.h>
> > +#include <linux/usb/typec_mux.h>
> >    #define PHY_CTRL0			0x0
> >    #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> > @@ -50,11 +51,66 @@
> >    #define PHY_TUNE_DEFAULT		0xffffffff
> > +#define TCA_CLK_RST			0x00
> > +#define TCA_CLK_RST_SW			BIT(9)
> > +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> > +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> > +
> > +#define TCA_INTR_EN			0x04
> > +#define TCA_INTR_STS			0x08
> > +
> > +#define TCA_GCFG			0x10
> > +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> > +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> > +#define TCA_GCFG_OP_MODE_SYSMODE	0
> > +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> > +
> > +#define TCA_TCPC			0x14
> > +#define TCA_TCPC_VALID			BIT(4)
> > +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> > +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> > +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> > +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> > +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> > +
> > +#define TCA_SYSMODE_CFG			0x18
> > +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> > +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> > +
> > +#define TCA_CTRLSYNCMODE_CFG0		0x20
> > +#define TCA_CTRLSYNCMODE_CFG1           0x20
> > +
> > +#define TCA_PSTATE			0x30
> > +#define TCA_PSTATE_CM_STS		BIT(4)
> > +#define TCA_PSTATE_TX_STS		BIT(3)
> > +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> > +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> > +
> > +#define TCA_GEN_STATUS			0x34
> > +#define TCA_GEN_DEV_POR			BIT(12)
> > +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> > +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> > +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> > +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> > +
> > +#define TCA_VBUS_CTRL			0x40
> > +#define TCA_VBUS_STATUS			0x44
> > +
> > +#define TCA_INFO			0xfc
> > +
> > +struct tca_blk {
> > +	struct typec_switch_dev *sw;
> > +	void __iomem *base;
> > +	struct mutex mutex;
> > +	enum typec_orientation orientation;
> > +};
> > +
> >    struct imx8mq_usb_phy {
> >    	struct phy *phy;
> >    	struct clk *clk;
> >    	void __iomem *base;
> >    	struct regulator *vbus;
> > +	struct tca_blk *tca;
> >    	u32 pcs_tx_swing_full;
> >    	u32 pcs_tx_deemph_3p5db;
> >    	u32 tx_vref_tune;
> > @@ -64,6 +120,175 @@ struct imx8mq_usb_phy {
> >    	u32 comp_dis_tune;
> >    };
> > +
> > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > +				enum typec_orientation orientation);
> > +
> > +#ifdef CONFIG_TYPEC
> > +
> > +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> > +				enum typec_orientation orientation)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> > +	struct tca_blk *tca = imx_phy->tca;
> > +	int ret;
> > +
> > +	if (tca->orientation == orientation)
> > +		return 0;
> > +
> > +	ret = clk_prepare_enable(imx_phy->clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	tca_blk_orientation_set(tca, orientation);
> > +	clk_disable_unprepare(imx_phy->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > +					struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct typec_switch_dev *sw;
> > +	struct typec_switch_desc sw_desc = { };
> > +
> > +	sw_desc.drvdata = imx_phy;
> > +	sw_desc.fwnode = dev->fwnode;
> > +	sw_desc.set = tca_blk_typec_switch_set;
> > +	sw_desc.name = NULL;
> > +
> > +	sw = typec_switch_register(dev, &sw_desc);
> > +	if (IS_ERR(sw)) {
> > +		dev_err(dev, "Error register tca orientation switch: %ld",
> > +				PTR_ERR(sw));
> > +		return NULL;
> > +	}
> > +
> > +	return sw;
> > +}
> > +
> > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> > +{
> > +	typec_switch_unregister(sw);
> > +}
> > +
> > +#else
> > +
> > +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> > +			struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> > +
> > +#endif /* CONFIG_TYPEC */
> > +
> > +static void tca_blk_orientation_set(struct tca_blk *tca,
> > +				enum typec_orientation orientation)
> > +{
> > +	u32 val;
> > +
> > +	mutex_lock(&tca->mutex);
> > +
> > +	if (orientation == TYPEC_ORIENTATION_NONE) {
> > +		/*
> > +		 * use Controller Synced Mode for TCA low power enable and
> > +		 * put PHY to USB safe state.
> > +		 */
> > +		val = readl(tca->base + TCA_GCFG);
> > +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> > +		writel(val, tca->base + TCA_GCFG);
> If the register is intended to be completely overwritten, the readl is
> unnecessary. Otherwise, ensure a proper read-modify-write sequence.

Yes, the readl can be removed. I will improve it in next version.
Thanks for your comments.

Thanks,
Xu Yang

> > +
> > +		val = readl(tca->base + TCA_TCPC);
> > +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> > +		writel(val, tca->base + TCA_TCPC);
> > +
> > +		goto out;
> > +	}
> > +
> > +	/* use System Configuration Mode for TCA mux control. */
> > +	val = readl(tca->base + TCA_GCFG);
> > +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> > +	writel(val, tca->base + TCA_GCFG);
> > +
> > +	/* Disable TCA module */
> > +	val = readl(tca->base + TCA_SYSMODE_CFG);
> > +	val |= TCA_SYSMODE_TCPC_DISABLE;
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> > +		val |= TCA_SYSMODE_TCPC_FLIP;
> > +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> > +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> > +
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +	/* Enable TCA module */
> > +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> > +	writel(val, tca->base + TCA_SYSMODE_CFG);
> > +
> > +out:
> > +	tca->orientation = orientation;
> > +	mutex_unlock(&tca->mutex);
> > +}
> > +
> > +static void tca_blk_init(struct tca_blk *tca)
> > +{
> > +	u32 val;
> > +
> > +	/* reset XBar block */
> > +	val = readl(tca->base + TCA_CLK_RST);
> > +	val &= ~TCA_CLK_RST_SW;
> > +	writel(val, tca->base + TCA_CLK_RST);
> > +
> > +	udelay(100);
> > +
> > +	/* clear reset */
> > +	val |= TCA_CLK_RST_SW;
> > +	writel(val, tca->base + TCA_CLK_RST);
> > +
> > +	tca_blk_orientation_set(tca, tca->orientation);
> > +}
> > +
> > +static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
> > +				struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	struct tca_blk *tca;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +	if (!res)
> > +		return NULL;
> > +
> > +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> > +	if (!tca)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	tca->base = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(tca->base))
> > +		return ERR_CAST(tca->base);
> > +
> > +	mutex_init(&tca->mutex);
> > +
> > +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> > +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> > +
> > +	return tca;
> > +}
> > +
> > +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> > +{
> > +	struct tca_blk *tca = imx_phy->tca;
> > +
> > +	if (!tca)
> > +		return;
> > +
> > +	tca_blk_put_typec_switch(tca->sw);
> > +}
> > +
> >    static u32 phy_tx_vref_tune_from_property(u32 percent)
> >    {
> >    	percent = clamp(percent, 94U, 124U);
> > @@ -315,6 +540,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
> >    	imx8m_phy_tune(imx_phy);
> > +	if (imx_phy->tca)
> > +		tca_blk_init(imx_phy->tca);
> > +
> >    	return 0;
> >    }
> > @@ -359,6 +587,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> >    	 .data = &imx8mq_usb_phy_ops,},
> >    	{.compatible = "fsl,imx8mp-usb-phy",
> >    	 .data = &imx8mp_usb_phy_ops,},
> > +	{.compatible = "fsl,imx95-usb-phy",
> > +	 .data = &imx8mp_usb_phy_ops,},
> >    	{ }
> >    };
> >    MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> > @@ -398,6 +628,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >    	phy_set_drvdata(imx_phy->phy, imx_phy);
> > +	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> > +	if (IS_ERR(imx_phy->tca))
> > +		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> > +					"failed to get tca\n");
> > +
> >    	imx8m_get_phy_tuning_data(imx_phy);
> >    	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > @@ -405,8 +640,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >    	return PTR_ERR_OR_ZERO(phy_provider);
> >    }
> > +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> > +
> > +	imx95_usb_phy_put_tca(imx_phy);
> > +}
> > +
> >    static struct platform_driver imx8mq_usb_phy_driver = {
> >    	.probe	= imx8mq_usb_phy_probe,
> > +	.remove = imx8mq_usb_phy_remove,
> >    	.driver = {
> >    		.name	= "imx8mq-usb-phy",
> >    		.of_match_table	= imx8mq_usb_phy_of_match,
> > -- 
> > 2.34.1
> > 
> > 
> 

