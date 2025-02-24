Return-Path: <linux-usb+bounces-20971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A36AEA41C27
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 12:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EC743AA659
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 11:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829202586FF;
	Mon, 24 Feb 2025 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iHYdAizV"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013044.outbound.protection.outlook.com [52.101.67.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA332586ED;
	Mon, 24 Feb 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395480; cv=fail; b=JNvSUgon3lBLFx9HJ44Xl7GMmsQjwxKnND7w2kmryOqSsZy4erqVuP4BkupBXy6gqjBhM2agvqYmjquG68GZfLdksA19/gpQfqGEzevNruuF3SVGsG2pWTpo51ISiOApJLeHvBepd0upiLvFQs4TqN1RgQ8McpuuItcNHLr8abA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395480; c=relaxed/simple;
	bh=tyM7oP76z0Tl1FxTEsRvr+XgHs7dU3iBKonpUZtiduA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dusi4miPAtLwyODTpVmm40HXwkzS0wOnrz1wgU5VaiNUAR4uij/f5/jIgFkBn5sGzpUEG4UeaBMGEh+EKD1sg89F8tBRMElMq2Q/DFvThWHdhtoUF16zpkrQgmz3pxuLu4ET6I/MNv6BPlcS6IJPKsFWEvKWANtLTY4QStDBk6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iHYdAizV; arc=fail smtp.client-ip=52.101.67.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yjc/NKCVfl53Q8NC6TtOcBe+04o5qpsghkIpnnNj0yo8DEEkm6aGGSIa5hDxoxeRNg3CzsYQ9bGzgSwWP6KxHn9BDBFnIVyI9IpVLJXh9m8OHdDqxgUXtNJRlTMehMOnECnfkmYxmxy76Wcg5BPOApkvgG0fmoorZ1n8Ox2RsLNfgNa72uvXlTDtkv8oc9/uIr9r7npxZZM85SDgwR2oef9uH/Rq9iuU1Nz330S5QrBBjIe5uPuPI4LLMUypgArLo5+xlvZ5Ln93XToBRkSJaQIxCVUEbDhe7nCF2yq/rz7RhfXSmr1TtSZ6J9eoaxTzZU7LgEx+C52jw0K87c4Fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVVEVsGB6zA92Y3v591g8HxBXB0akAI5243fq3KzmKk=;
 b=jZ6u92bwY1SmaD6kccH8g9uTqzb6f93WvElI2qH4AVXDnrMbVbTa9FqSY5WawTechjzbES9vd4Y8piWTNMXafDCYsBpJ6tgL+Mo12VE9MFsxegH1Haj9VldK4IUR5RZRFCte6O3VjH2GRn/BfDHLgNxr6azd4VvSUkCVDDZsw5AgKJcdLAeit9KVNQur+SC0n3TTsOuvHVFyeJ89Q4NaijUajDovK6CxC4mZdZcDK/3HPXNhAd4MUWYW/oWYgn5vbrZVN1rQpcQYLW+uezNV6IUV7OAAnZxM18OUcjdL+/sRaA4Tdpgd5CIzusQe0uoyo9unLmRGNYcCK3YUkvjCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVVEVsGB6zA92Y3v591g8HxBXB0akAI5243fq3KzmKk=;
 b=iHYdAizVEaPXsAddTpn9pXO5ZGse+InutNbq57wHgPdY8hGT8smfBel8vP57wwZrqUNn54s9JYcIxvC9q70hZt9ppx2EKDDIfgfnVmlvMOMGdQDL2D4NB4x+9yZ4EcLchJNsj+N4ApQx9UNRjARzLQK277vy5ljI9mfkIi141vpfG6PYO3oy0DMVLV8QC5ma6P+BF1pmUz5Munh0ageLBakT2n/XE2PBrD3+fl/UP2GkGR/DsSSUFyfZ/3MpT4atSzI85NwIP4h49XeG08l2sTezlgVQgup/jAGN6wCjl1oCF3Io0N8iylRLzpl+ZDceLgY36zcs37WzINnxDp53Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA3PR04MB11105.eurprd04.prod.outlook.com (2603:10a6:102:4aa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 24 Feb
 2025 11:11:14 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 11:11:14 +0000
Date: Mon, 24 Feb 2025 19:07:51 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/6] usb: chipidea: imx: add wakeup interrupt handling
Message-ID: <20250224110751.7666zcafbyakvfb2@hippo>
References: <20250219093104.2589449-1-xu.yang_2@nxp.com>
 <20250219093104.2589449-4-xu.yang_2@nxp.com>
 <Z7Y+gqu75xJyjy6n@lizhi-Precision-Tower-5810>
 <20250221032348.sncjhnldj6ecgeou@hippo>
 <Z7iabsMl4ilQqrXN@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7iabsMl4ilQqrXN@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P190CA0060.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA3PR04MB11105:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e692aa-a513-4c20-57f9-08dd54c3f35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NEr5/kM5I7b7F1OI+KWLKhQ2cXN5xNxZAICO4KQL+dc6/HmK5Af00q4/tvW5?=
 =?us-ascii?Q?HcvZ8T6/5EqMFQNdVtzvERfEkL+PIZMJGQwi3wJ4MfQ+GFadjDetFdmX+iSJ?=
 =?us-ascii?Q?kwK7UkvhSXpI34wuA7B5UmV4pED3UPFQHhr8XXbMUyiQuqwaVjPIUPii1J3x?=
 =?us-ascii?Q?6BqIM2qjCzsgZzli0LlUeNgD+f6BzffiTlfD9qUaeyMr5NyoEUfdvyT6PUbi?=
 =?us-ascii?Q?F9Nzp7AydHeR5KO2/Kiejfc9GZyh15BFqWA9Ejm1jPc9glZcgA+EBC9FBeiP?=
 =?us-ascii?Q?Xq3GNv7Hl8Xk/+uRm2aZCbt6r+T6ixW/z1e498pY26GDLk62o6pyswf/j/Rn?=
 =?us-ascii?Q?VT422/hnZs8U8FqN3aWogWna4J4iNu7MBSCmmU2PxwV4YcNSjxCDKj/jtocI?=
 =?us-ascii?Q?/JV6Am0ADgzhlGp/HLQvQ6mmRq23yJj+zB8mk680FsfEwSZIJCkare1aRy1T?=
 =?us-ascii?Q?0VzAEH8TA2fWT+GWG9ntapEAKRrD8KfE+3pw8QzEMUB83w/Wpf8q4ysBBmdb?=
 =?us-ascii?Q?Xih3T30Vzq4Y79xqGrv7OicHGo8gJOb2ds6RbcERtJR+Zxu8TRRkKNQDG2U/?=
 =?us-ascii?Q?nBqTccc0m8cv17Ueno6BFZgPy2khqRUuC/bdh4m5HtbWUPiJrJ1/3cUqivYB?=
 =?us-ascii?Q?fe+v6uqDM5I/xipUW4cq9Z7xNZXhxI18CHHNmyA7zOuY7yUNO4UhF747nfQx?=
 =?us-ascii?Q?rnvwFtRHIzNBcEgP/cpEdYoKV6rpEmNmdPR6Pr3dJhKT6HgV2Ic9MT2mFxtg?=
 =?us-ascii?Q?HnviB1pWjcGcO685gncaO/oPdPs1/YmaE/zLg5BlXQb3XXUjhVe1VNXsCRlv?=
 =?us-ascii?Q?Ty8LKMlYP06vy91/NE/k8dGLG0XiHNTmtyXAc999I71k5AUlwv4FlpyeXIlS?=
 =?us-ascii?Q?wQ8dv8jK3uQpHn91D11b3U3NY7DPU1BfbpcuWOBz47moedf7YvKMXkuu9pix?=
 =?us-ascii?Q?QmwUoxDSRbHYEE+UjClnb4F2qL115JvncIUAQq53ARZdYYCrFtBIn2uTtZHn?=
 =?us-ascii?Q?y1d1+WDfx81VeFmuQXFI2gBmU1vdJS3F53LqHx6mqPrqfhLU+eT4DoUFcidt?=
 =?us-ascii?Q?ZzGTu6tLgjJzymYJ/Whlmve0Gw+/2NyipzyV1sv5kSbDBSU/9Ho0IO8aI7HP?=
 =?us-ascii?Q?E+uupWQY/hkzkE19byROPwZL91+YByUEWi4ayuLrQt9W0Beq5beOsh1yAqoV?=
 =?us-ascii?Q?UkOnG9aFyjPxv4bi62M/DetFuI8wlZzz7SZ0ML0RBtiTkizsdv+ehc/QQyFj?=
 =?us-ascii?Q?wqtx0oPcLn7thq4PbtO9FoA5PGx+2YVgAj39HWSHN4TBBDHrbswNJQ9b8wrc?=
 =?us-ascii?Q?9YF+EeINfpHoYhGxxN5rFIscr5061ZuwoSGGaucYmtkopexF8oB5QasK/xwL?=
 =?us-ascii?Q?vepUu9/wQ2PnxPuMGU69vKGeea6IcCPXATdG4Er/jHmwkpg+Ebd8gcXVM8ki?=
 =?us-ascii?Q?s9Xtsp11jdiWYknaYlXWH3LoYTDFRisv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t5AwmMflcHxEE0xEyNToc6InimoA7vy5lT1ymXrEw5S9fIYPSs++l/pDjGlu?=
 =?us-ascii?Q?qKarrwO522h38HbjwJ3UOeTq8FGADr7dEfQNSExczos+pLB3QRA8EygfZA2F?=
 =?us-ascii?Q?Lk/ZbnpHVN2QVHm1S+JG4m9UbBXEgeMODC6+i3IKYUHtK51mj6hZ60FDZVfy?=
 =?us-ascii?Q?tUHodH/0tXD6eB7LhVe0npeOPEXSFwQAwLY/Cy9HmAI3bFk9ImFIDqVZvASH?=
 =?us-ascii?Q?WTsOIw6wofKQgkFp0txd3/wv9d9bH9DvLjGv/1kgjI9qAdiSXgMJD2vv3YAL?=
 =?us-ascii?Q?VASX5oU48+c2TBiEnHNDReXmjQrkhGOHmqscnTNR2m4dAGn+ez+kQ7uuy6Br?=
 =?us-ascii?Q?DMzptxHPSWqoMPLXD9FE7ui2unw2l/xv33gu9/i408nk5LALjIdhxDnyOXSr?=
 =?us-ascii?Q?fZ17eDXDhNCgh2RMkw7vqsSWdLGAq19pRX0vbC31wAGEc4Bo4uSu8GZjtHGz?=
 =?us-ascii?Q?9Z4PJoiOE1MO2fh8C3Vrg4COinGmsVGqQSGNAK0HVnoguVq3/wfQGDgOianm?=
 =?us-ascii?Q?s9+WtEeZlBjk5Yo2+DFnl7oWJtQFBAVxe8DaMAqcIC3YDXdlwcmUtzwHV4El?=
 =?us-ascii?Q?7ZFJz6o+ruxQShb2UiUv5K87CSHtb9wvomgP2sDJ3DM2r/du97Y8d3sa3kbs?=
 =?us-ascii?Q?AQlmGfwwew8jC84Jj7SCLS8uqBzo//uqKVVKITA6eUKFAWBoxdGSBcoDySUq?=
 =?us-ascii?Q?Y0ia6pxKfXrhhOaTKirqonqB3jFKKHkchCg1ST6eJW3lBb05ivm+KmUmZny6?=
 =?us-ascii?Q?x/yj2+g8T+qMlUZkKTd51gPZy/4md9hHfrYxKx8gz8hQtjLbKBLGlpVM7tCH?=
 =?us-ascii?Q?W2x0IhJSwGgtFfIaBmcLSgnh1CMjgdNo/C7ScVz6X/Z+CPlGcruu4pmCApmr?=
 =?us-ascii?Q?ZEtaHU14k5Vr1usw+08ho405frrW5BMBB/bgn6JGBwJy0o75v3wpOaltcPAv?=
 =?us-ascii?Q?6UN/2WCNHYGSqp8pB9UV7A1uQv1MumHdSFjgq7F3IiZkAHRnkvaQ7t69UF72?=
 =?us-ascii?Q?6W4Ux/BK5lvjg+HR7w0TIAVncGNGz2usjE0B0Ji5BQ+3MqdUKuDtrbD/Ofei?=
 =?us-ascii?Q?tRgLIlVJvkuC8MIFNIbzcbB6jlTYhWzfVicI98RFD22ennx4zqYa1W/m6a/9?=
 =?us-ascii?Q?LNqMvwSRymaLmp3U+LWAq8F4R2z7Skgtel+eXyqqWxJX8S22C7DAWKC+tQDI?=
 =?us-ascii?Q?CERMEMjX7+nUCeOTMeFm9rFoeV15fpxQ9MW7vOHiTJubTHNKL1kLXQAB67Rc?=
 =?us-ascii?Q?SGpyDfHPfMdtztMNO2WGVnz07Vzr/nYc0jefRhBAyXaRWi1pzYvccDRI3DFb?=
 =?us-ascii?Q?y6MNjPK8q8xVJ2VA2Jw5E4fmHfFEB2QjkdXBIdQz0I7LQA3UTtH2I/oEcF0w?=
 =?us-ascii?Q?5Ag4Yxmvjiqr14KdXaTdEajgHNuyrE1eZutnqdwxEns4D4wA+/VTIPHgh/8h?=
 =?us-ascii?Q?80EtqG7IJIG9Eq2jimEadL3PeBSArBtTlVuxOHFiQpyS+JJJcQ+6fPk0Ql5P?=
 =?us-ascii?Q?A85qEtYCSgAWUbVecrxfNYHswhXqHyMvTUlpiBULSmYGiaSOm8E/fN2SPtlI?=
 =?us-ascii?Q?NFzQgtLbvIoyEm0u94rw8HcB64XYDhNzuBgDkjtG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e692aa-a513-4c20-57f9-08dd54c3f35a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 11:11:14.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSaBOsU/0q+yo3LGwi0TCc/2pTFcCkoLbFmG4jb3dIXwZXeznfrQ9VuO8eFsjYE0VQU9cwG9H241XncSp/5LNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11105

On Fri, Feb 21, 2025 at 10:23:26AM -0500, Frank Li wrote:
> On Fri, Feb 21, 2025 at 11:23:48AM +0800, Xu Yang wrote:
> > On Wed, Feb 19, 2025 at 03:26:42PM -0500, Frank Li wrote:
> > > On Wed, Feb 19, 2025 at 05:31:01PM +0800, Xu Yang wrote:
> > > > In previous imx platform, normal USB controller interrupt and wakeup
> > > > interrupt are bound to one irq line. However, it changes on latest
> > > > i.MX95 platform since it has a dedicated irq line for wakeup interrupt.
> > > > This will add wakup interrupt handling for i.MX95 to support various
> > > > wakeup events.
> > > >
> > > > Reviewed-by: Jun Li <jun.li@nxp.com>
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  drivers/usb/chipidea/ci_hdrc_imx.c | 42 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 42 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > index 1a7fc638213e..5779568ebcf6 100644
> > > > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > > > @@ -98,9 +98,12 @@ struct ci_hdrc_imx_data {
> > > >  	struct clk *clk;
> > > >  	struct clk *clk_wakeup;
> > > >  	struct imx_usbmisc_data *usbmisc_data;
> > > > +	/* wakeup interrupt*/
> > > > +	int irq;
> > >
> > > use "wakeup_irq" to avoid confuse with normal controller irq?
> >
> > It doesn't matter. It can't be confused since the driver is different. The
> > controller driver is core.c. This glue driver is ci_hdrc_imx.c.
> >
> > >
> > > >  	bool supports_runtime_pm;
> > > >  	bool override_phy_control;
> > > >  	bool in_lpm;
> > > > +	bool wakeup_pending;
> > > >  	struct pinctrl *pinctrl;
> > > >  	struct pinctrl_state *pinctrl_hsic_active;
> > > >  	struct regulator *hsic_pad_regulator;
> > > > @@ -336,6 +339,24 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
> > > >  	return ret;
> > > >  }
> > > >
> > > > +static irqreturn_t ci_wakeup_irq_handler(int irq, void *data)
> > > > +{
> > > > +	struct ci_hdrc_imx_data *imx_data = data;
> > > > +
> > > > +	if (imx_data->in_lpm) {
> > > > +		if (imx_data->wakeup_pending)
> > > > +			return IRQ_HANDLED;
> > > > +
> > > > +		disable_irq_nosync(irq);
> > > > +		imx_data->wakeup_pending = true;
> > > > +		pm_runtime_resume(&imx_data->ci_pdev->dev);
> > >
> > > Not sure why need pm_runtime_resume here? There are not access register
> > > here.
> >
> > It's needed for runtime resume case.
> > When wakeup event happens, wakeup irq will be triggered. To let controller
> > resume back, we need enable USB controller clock to trigger controller
> > irq. So we call pm_runtime_resume() to resume controller's parent back
> > and the parent device will enable clocks.
> 
> Please add comment here. why need in_lpm if we can make sure irq only
> enable during suspend/resume pharse?

I have checked again, in_lpm checking is not needed. I will remove the
if condition later.

> 
> >
> > >
> > > > +
> > > > +		return IRQ_HANDLED;
> > > > +	}
> > > > +
> > > > +	return IRQ_NONE;
> > > > +}
> > > > +
> > > >  static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct ci_hdrc_imx_data *data;
> > > > @@ -476,6 +497,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> > > >  	if (pdata.flags & CI_HDRC_SUPPORTS_RUNTIME_PM)
> > > >  		data->supports_runtime_pm = true;
> > > >
> > > > +	data->irq = platform_get_irq_optional(pdev, 1);
> > > > +	if (data->irq > 0) {
> > > > +		ret = devm_request_threaded_irq(dev, data->irq,
> > > > +				NULL, ci_wakeup_irq_handler,
> > > > +				IRQF_ONESHOT, pdata.name, data);
> > > > +		if (ret)
> > > > +			goto err_clk;
> > > > +	}
> > > > +
> > > >  	ret = imx_usbmisc_init(data->usbmisc_data);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "usbmisc init failed, ret=%d\n", ret);
> > > > @@ -621,6 +651,11 @@ static int imx_controller_resume(struct device *dev,
> > > >  		goto clk_disable;
> > > >  	}
> > > >
> > > > +	if (data->wakeup_pending) {
> > > > +		data->wakeup_pending = false;
> > > > +		enable_irq(data->irq);
> > > > +	}
> > > > +
> > > >  	return 0;
> > > >
> > > >  clk_disable:
> > > > @@ -643,6 +678,10 @@ static int ci_hdrc_imx_suspend(struct device *dev)
> > > >  		return ret;
> > > >
> > > >  	pinctrl_pm_select_sleep_state(dev);
> > > > +
> > > > +	if (device_may_wakeup(dev))
> > > > +		enable_irq_wake(data->irq);
> > > > +
> > > >  	return ret;
> > > >  }
> > > >
> > > > @@ -651,6 +690,9 @@ static int ci_hdrc_imx_resume(struct device *dev)
> > > >  	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
> > > >  	int ret;
> > > >
> > > > +	if (device_may_wakeup(dev))
> > > > +		disable_irq_wake(data->irq);
> > > > +
> > >
> > > Look like only want enable wakeup irq between suspend and resume. There are
> > > some questions to understand hehavor.
> > >
> > > 1 driver probe --> 2. hdrc suspend -->3 hdrc resume --> 4 controller resume
> > >
> > > 1--2,  look like wakeup irq is enabled. maybe controller have some bit to
> > > disable issue wakeup irq, otherwise flood irq will happen because you check
> > > lpm in irq handler.
> >
> > It's not true.
> >
> > We has a bit WAKE_ENABLE to enable/disable wakeup irq. This bit will only be
> > enabled when do suspend() and disabled when do resume(). So before suspend()
> > called, the wakeup irq can't be triggered. No flood irq too.
> >
> > >
> > > after 2. wakeup irq enable,  if wakeup irq happen, system resume.
> > > ci_hdrc_imx_resume() only clear a flags, not any sync problem.
> > >
> > > But sequence imx_controller_resume() and ci_wakeup_irq_handler() may not
> > > guaranteed.
> > >
> > > If ci_wakeup_irq_handler() call first, ci_wakeup_irq_handler() disable
> > > itself. imx_controller_resume() will enable wakeup irq, which will be same
> > > state 1--2. but if imx_controller_resume() run firstly,
> >
> > It's not true too. Because WAKE_ENABLE is disabled after resume().
> >
> > > ci_wakeup_irq_handler() will disable wakeup irq, which difference state
> > > with 1--2.
> > >
> > > If there are a bit(WAKEUP_EN) in controller can control wakeup irq
> > > enable/disable,
> >
> > Yes, WAKE_ENABLE bit. It's already used:
> >
> > ci_hdrc_imx_suspend()
> >   imx_controller_suspend() -> enable WAKE_ENABLE
> >
> > ci_hdrc_imx_resume()
> >   imx_controller_resume() -> disable WAKE_ENABLE
> 
> Okay,
> 
> I think wakeup_pending is not neccesary. ci_wakeup_irq_handler() can
> simple disable WAKE_ENABLE.

Right, wakeup_pending can be removed. However, it's not that simple to
control WAKE_ENABLE in ci_hdrc_imx.c due to imx_controller_susepnd/resume()
do more things expect enable/disable WAKE_ENABLE bit. And usbmisc.c doesn't
export a function to directly control WAKE_ENABLE. Therefore, I still need
to use enable/disable_irq() for simplicity.

Due to this wakeup irq is only used in suspend case, I would like to add
IRQF_NO_AUTOEN flag to request_threaded_irq(), then enable irq in
ci_hdrc_imx_suspend() and disable irq in ci_hdrc_imx_resume(). 

For example:

ci_wakeup_irq_handler()
{
	disable_irq_nosync(data->irq);
	...
}

ci_hdrc_imx_suspend()
{
	...
	enable_irq(data->irq);	
}

ci_hdrc_imx_resume()
{
	if (irq disabled)
		disable_irq_nosync(data->irq);
	...
}

Do you think if it's feasible and better than current patch?

Thanks,
Xu Yang

