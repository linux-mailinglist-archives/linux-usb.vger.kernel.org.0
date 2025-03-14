Return-Path: <linux-usb+bounces-21763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE92A60D2F
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 10:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2E6816615A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 09:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6131EDA0F;
	Fri, 14 Mar 2025 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nZXiTb8q"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19A1E5B73;
	Fri, 14 Mar 2025 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944321; cv=fail; b=eUn9Tj+Ti3+Bu5CiokoVOtsoDC6jlYTSlG9eujzMrs1ijWo3DgXhSYVusmszli/5iK9zKIvtCT3KUCI3Jwk1XvBwQVjx7CxvL3V+SIb2Bvt3e15LdU43NgF2s5a/3xfXk1MOCiqGMt7b0Kr5guXtVZ5oiKQIrNxwMCW1Cy4SqYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944321; c=relaxed/simple;
	bh=2Q3EzZfhrla1GdPZhH4mlo/0OeoHpB8ILDTw0cbjWS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fX6XJvQnNclPhaNiGerS2Xp8KmiGycIEsIgwi8vw3HnlR3fHWubM7UtAbv4yl8r6gNbLJNjXFUQ0QK+/tovjn3wpzkYGrGXtPg8asui23RnWbSq6wBIOgk1NC522az39Bwd+mREMlalYR8rkY8DNtdRUgBBgnhZpkye4kwEwsjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nZXiTb8q; arc=fail smtp.client-ip=40.107.21.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHtFu/FB8etfMWq/hRNOz4U0ByIjvc6qpmcrUptWHDxRpzDfGPhzDPZEpU2rH5NpFt11GflenIY/8UGnlGFQZHLmY3TdJsDsQeS0mOjZzeU7IhlgzZZeI8iLobv8mueXTsApu072qy5rB5sl7BpfsrXA1ruzpWQ9ugJZByflPF+YZRhgWVv/zzBx7oUNJaXqYDMNpkYtE5xwD+sl5ZjIefC0ug12bJzNpbtQUaL4Cs4G5IgY05vHU9JBg9WW0DP63IUX2T81adV6rawCoRHVBGuuL+izGLlw6QPdDzTu1RziUi8NSMOZZhyjPBbiNeS3NbXJ/GV5bA8jtGX5/YOIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1XOZPpvY7zBtP7QyPKu4HNK9o7FnNt+JhL2ySxm0nI=;
 b=eowAo6QOgGEgLgpZsjARUPdMVYtcSGrcHSjZI5j/mWG5mybmj4FsQ6Nl9DflR6lp9nOKbPRyXU8KvuKctign/w2tNBkSyA+z/qNqpjrxnZqGou1hGJhPUrhwXGpwgC7fouq0CsewoWB35Q8J51AlyLq5sjYzJjlw1UBTnE+X6uLJpDiszB4G9//MCriQo/bvWSqfnfZ6eKRoVxGFV38BvwElVDnsrFtYF9ONWQw16ZBjBaBR8XxGAFsypHO/grvJD8bJgc82URGKHJFFmfkpjgYn7sQbcd0K0yHVEDc+9Y3xKz+jR5C2ThTNoN//27KR3YPOwbOweVppjvorzmOZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1XOZPpvY7zBtP7QyPKu4HNK9o7FnNt+JhL2ySxm0nI=;
 b=nZXiTb8qQehWilJstpL44alB9gKl69S/wBbr1p34IczNw9ff+JH5axJs4+ae9OMdByIAbG4LL2vKLEvNFFpPK82W8IrsoMtn6P5UeX/eGcNBCb9YKuA4d9xqVfZ52OhQjbx6qHSqI4n7iwJBSM9CbnkmFV5Qnt5aC0YQukiw8uAB9lEajlispd+l/ZDF1pUOYYmHi6mDSCNVm8771qnPqPbKATcTfiz8eJJCfTZ8VzsptzoGu+mTYlCNgUqlq6GaS4AHK3PuNsfDNxGNqViVt+2hVWOO+wywMSAhxwn8L/Gb0PVmax4sYrwkSyLGXk2ER/iL4wdHKmuI42YyOxMsNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB9905.eurprd04.prod.outlook.com (2603:10a6:800:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 09:25:14 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%7]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 09:25:14 +0000
Date: Fri, 14 Mar 2025 17:21:37 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peter.chen@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 0/6] add USB2.0 support for i.MX95-19x19 EVK board
Message-ID: <20250314092137.6m3gmj4irxqwpy22@hippo>
References: <20250312082700.260260-1-xu.yang_2@nxp.com>
 <2025031443-rounding-subject-1f60@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025031443-rounding-subject-1f60@gregkh>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: c566d402-fd0e-4104-1ae6-08dd62da202c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f7DI4o/i+94sj9DgQvOF10L8kBblTqPqJYA140LKc3H1KZQn3BJ/zVUicOMP?=
 =?us-ascii?Q?a2zXj0i3hiEh22nukLcQh1IKY+4Vr7WH4rZWQtJQPhB47jb39/mYqmLOnJI3?=
 =?us-ascii?Q?XNQkgtG7Ek2rPKyzugK1y/q4GxyK4/pULBm2sV+rk/tGEibFHub2LqVYtrJz?=
 =?us-ascii?Q?DDdutV14AnhrpKRyhfb4B0ULFdVErvFBa+ZJUmxLU5Sxr9SBLfeRmVS77tAz?=
 =?us-ascii?Q?7t42rNYYaf8ACXzW33D6cSXfBdS3fdqz7lxNf10Ec8SUAhDaiyLgVrzCoHI4?=
 =?us-ascii?Q?V582xuiM2aOba1+JKPh7YeWX3TSND2BgCekkYwJ+sa5KTM/wToO+ETeO4/rY?=
 =?us-ascii?Q?Zl/kLk3hZna506BP/K1J3vjdnMvHLHrEXJvhzqzwfw/erks0r/vfvZVvPFzT?=
 =?us-ascii?Q?BPRoAj1lGG+bJJ43rHdPrdRh7udVzKDWs/T8XBnuQ4+Wx5MHTxX8J9vkWHJS?=
 =?us-ascii?Q?stV/kz/CLUkL0KhOF0I9TSGEqWwkjpNV6dJAxE/oDHnWKtfPvLHXtyiqYAJZ?=
 =?us-ascii?Q?K1sofFLs/JEoGF07JuvaNPn0ucDRuXJDWRt5wWCalRdF4hHLz2eXWykhdupy?=
 =?us-ascii?Q?4ddFVw7adRt7MyE9PaNmLpun16xYZ1vlTroVy5XCGuMkmi3xTTF6eL5RaNDf?=
 =?us-ascii?Q?5VN3+IhhFhb2Ea0GvPZcToBMDbrw9yRASnqckkvsixr+mU0HZqC9KT55hgtU?=
 =?us-ascii?Q?0QV3Chif60CQYWYfvgylxvqZRQGPFYqy2tBK9HVAvWN83K3VRt3AmF3l96Xg?=
 =?us-ascii?Q?BEUE5pVqFfvxv5lCaScZGks7QmUppjAwYq0wfXzSDUK6kT35jfndIvacPnMm?=
 =?us-ascii?Q?PYEws45PfZl5yZh3+J+wv5ZOo9TIF5S3QtuvzMCXe9bWDNy2raDn7a1JeX4Y?=
 =?us-ascii?Q?5U6sD0y7sOLrM/OmPgAa0tc64r0BCpKrgDbq93aCOvfTqvwiLtK6FVWOTdjk?=
 =?us-ascii?Q?NCp9R0xgGgrGyJsPZZS2149qUc89bWSD2dEb5pUrw1xVVfXbq3UyLb50aghZ?=
 =?us-ascii?Q?0dpZ8vbPCm9YfIamqPM2Ew+tJ4uinGFc3IHAfVIlvksrB/l/Cu+71+yycHlR?=
 =?us-ascii?Q?GUzmo14D3wrcdTQ2Uty3dqNGZ7Pl8t+4NGG+AQdroxgL9N3gX8sRnUf4uPuN?=
 =?us-ascii?Q?OBtTBbHI8tM/LJ3ur0BngMgSj3Y+GOq/VPLdSO9sSzcl5i9X9LH09QZZzsKl?=
 =?us-ascii?Q?uoKCWMMJ5LHXBnkUsBNmjXmMFAanyW9gspcWten6U+TARmsw9TWbNOK77kQm?=
 =?us-ascii?Q?I2fBZ98oEYirq+BA1nHazVCsWVaWXrpkolkGnJQvOvJUC5xD2hys1tZ/rt9p?=
 =?us-ascii?Q?bJwu6ogmZ9hleEKhU25A1jnH8Fgx0+oskV0i1ntqM28IBsUyBeG6Lqy5fUtc?=
 =?us-ascii?Q?0ZhIZn8T/KMJtfOVauQKv732f6jWv2urZ8FaT7cZ53cnLsIoKtoEtxLZZ6xa?=
 =?us-ascii?Q?f2cEuhFffPtPFl98YGnK4hXWnbxM9oRs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BrtE98M1x2FoXW7Sj+D2mskis5b9I8pmRrdD+BIHZpvBCLUXlfcy7MiI+WPY?=
 =?us-ascii?Q?+0e86h7bEt5HavejjeWdvZD0qtjicqZhTPFiMqtQlOL4tNpzjcVjwlTw7Uzb?=
 =?us-ascii?Q?0fPLX/c+jOpRETk25YLc+kk4zTdJqxpxjNRLVp/VEecofJBgWK/gHqULqGCn?=
 =?us-ascii?Q?dMMO50ndZtdhy8GR2uTfRviLjs2CfHlhXfBx9HgcTaU9Wjudm6FonT+eeLBr?=
 =?us-ascii?Q?POnXWt3i4UhiWpIsL11pflTGwRU85eOntcq1F4xQGwmwLVgCEudiBETN0yG8?=
 =?us-ascii?Q?kWityAZ957E4SO4U0Xal5lH1hVuc2OfAV5+BTIip1Y5RiyGshvyg6ML2Gpwc?=
 =?us-ascii?Q?6A6DFm5sYxsj6F+oBY00KnAZ84SMG9hnPRtz9JDs3TxQCvyl9CV/v+bTjX5o?=
 =?us-ascii?Q?K5W9IZbZwU2EjD7NWTDFgnrmXZI5qISaeWtAWAlbCvoBpbb1hZYI5uDnbQhw?=
 =?us-ascii?Q?n3Tk7En8HMXZdCNk+iI3shbJLEMvGpibJhIEn7VS38tP6MaxnrxRVGsQ3TlC?=
 =?us-ascii?Q?R2sB3TaKbh+y2aiY3LGnaqtWsybqiAK5qnKV+RQFajnGp2tBBAEac86a3fq8?=
 =?us-ascii?Q?ijeJeZFVkGHgw0/904XQFxfRB167S/cuqrC4SzGKQmExuD/NTbrnm9JZauJ4?=
 =?us-ascii?Q?xZF2wLEDO2bOvW+ylyfKOwEGPnpTg1zNf4FvUzP+n2ZcdcNjAUf71Ates6IR?=
 =?us-ascii?Q?SYBAjBVNgphTqpgW2Nc4+aJfLYlM/jBo84Vu5k59LmfSsTk+3vOtroqDkCO0?=
 =?us-ascii?Q?ZtU+x0rXOX4kdH3F3zebM7IMUWgCA3eT2I3TwHkMR2hmRFrgPwBWof/9DGUA?=
 =?us-ascii?Q?gcphafo7FRdo1OOpYOWMEko+mUtrDodSFN3bd3MzNNG2kPu49IQHN7vPNwKr?=
 =?us-ascii?Q?14X0/YTBY44xDx7/LlukYL0Ju2iHe/7V5/Wry9OJh97U65NByq2mCxnuFDRU?=
 =?us-ascii?Q?LCmuZB3DWQvOxUfn6BR5kJAjY4CoO6o7JvfnNwL2IA/5W+knob64sfLvJu5r?=
 =?us-ascii?Q?GBXu94FZCw4YnZ+4MtLCnLZDszCnl+2r9t9e6zvOBydYSWUCiLDZGNXI8F3k?=
 =?us-ascii?Q?WfolzuSY6rBjpnep6rnmIMOizy79cgMOQOz2oJ0REF7KgT9TCuhNP78RqPnS?=
 =?us-ascii?Q?6utQv81qDs1EHrgoA/f+PngsBPe806nEEeO01ydYOy0ktmeaqiNuUkkZScUy?=
 =?us-ascii?Q?cuipwokkGGSLFMEKWrTDhuiXVfsPemJB25RmCPvjgFIdvLt/4x77scRZoFkV?=
 =?us-ascii?Q?sKJ/wxd+NaoFlYjwSE+87M1jF1jAqB7rk4V1vOB/j4H8pIAlA5fQCAwEFrq3?=
 =?us-ascii?Q?VYLm5EwUxgSqUA+Mhj/Fp4Zis3BhsaZRt1lyvs/T9v8nCNr6a3b1QOtTIsSR?=
 =?us-ascii?Q?7fIHvVZZhviTLqeRSEI36ftDsQGWPaSqBsWK5i2X2hW408DxfZtsb4KT3OdF?=
 =?us-ascii?Q?IB+B0TW3O5ULUWKtCuPu133z+De9ui89iZFoxaGYre49VYzadxt2r3MW8uV1?=
 =?us-ascii?Q?KF8dN7trmE5F6MvOP2NEcxoYBPJ6Z2V/clV09n/nu3pVl7+3eY6gltqZZOXH?=
 =?us-ascii?Q?qJyC5vLwg8QxLoBfNf21BwDhQIVvmwmvSMkEi02d?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c566d402-fd0e-4104-1ae6-08dd62da202c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 09:25:14.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FeE7v8l5yz1Zhm6MpiGQimSCnltg4ANXGaXNIRlcwC079UXAE8WUOgK9GR9j9VqmQLVih6/EJxTc+eC+y9WMdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9905

Hi Greg,

On Fri, Mar 14, 2025 at 09:18:51AM +0100, Greg KH wrote:
> On Wed, Mar 12, 2025 at 04:26:54PM +0800, Xu Yang wrote:
> > The i.MX95-19x19 EVK board features a USB 2.0 Type-A port, with this
> > series primarily introducing USB 2.0 support. In the i.MX95 architecture,
> > the USB wake-up handling mechanism is integrated within the HSIO block
> > control module, utilizing a dedicated wake-up interrupt. Therefore, we
> > also implemented corresponding wake-up logic code to properly manage this
> > functionality.
> > 
> > For detailed changes can refer to patch commit log.
> 
> Does not apply to my tree :(

It'd due to below dts patch #2,3 not in usb tree. However, linux-next already
have them. I see Shawn just send pull request for 6.15. To make it easy,
let me ping you when usb tree have them, is it ok?

https://lore.kernel.org/linux-usb/20241204050907.1081781-1-xu.yang_2@nxp.com/#t

Thanks,
Xu Yang


