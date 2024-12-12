Return-Path: <linux-usb+bounces-18415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE719EDE1C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 05:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E30AB167DC1
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 04:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC861154BE4;
	Thu, 12 Dec 2024 04:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AB+eOFJK"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2050.outbound.protection.outlook.com [40.107.104.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426E143759
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733976719; cv=fail; b=pHi/ELg4X463vcg2Gc0g1Ie3bIiCWuOZBj2+tRWNER49bsPdgIFHBDRG8g/9JNM59UAhgHOTS1JVQ2IOJ+qBbWQT8twpfumYC5zF/hdzoa0ZZOpMrXm5tXVQCIF2EiBV9LNtLcFfWnq8GYMRAbYIj0U+cpkgh8D+Q6xXHy7nLiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733976719; c=relaxed/simple;
	bh=ZvzuTIdfEZW/wPa4yOIwuGBr5pJxXQ7nWwWWvfJ6yok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nN9RpEAiPzt6UA7HR5psyogmF0hcjkzpK66ON2PoCtd+NHvau10FCWZodFzfCTDmeJYwJceQRQR16iHEuW9dI5Yswd4yqzRJH3Ixek3F4v6C5o8TOzKtKkFq/w9VyZAgNqJuPmuC0IGUKzUxDd3juD/ec7H5Z1IkLZUjugTejhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AB+eOFJK; arc=fail smtp.client-ip=40.107.104.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FV6RYtOFwN8VMZrVSccxou15b0Z+gSV65RLB8yHSB6bxe+Wn2oTH/BPXepOv4xnOhNJUMrhB3j4I0c+Q171Nz8QPRGE6t7IZH4KFa/gC5q+/iqS5NurPGX6ofcatytZ3XDFs0p7HixDBIDksl+ipPL7YnglT4z0PQz+ZXih7lxA8wy4Bi44Mdu+uyMvFRvPlQYKljPu9uuCJw//AuvXB6atgww/tAqxZKShGbHuJMuw/XLyEuU8RfYZjD4eeJmDFALzDwO/MzJah2vvWGZvpY7XBxPNGkH2hF3ca9g+cURQsPAGsLunAaoxg7ctJWzTQDontgkMIrVLjQ5lPfAoVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQZ6yQwzo/eg+BHeAucsJSy6Y2tzC5r1v7wHmCENGu4=;
 b=h5MWHA1A/wISpfwqAiN6O3cusvkm3vVNuuvI/na6IN7JY9jbKbJmiZgskUpUN5N+uhtXMGA5eYjVc1Jc8M8xKCnd9kavCAzPm+L61Ewc5x8en5Boj7mhUCLcvFsZ4s9FlHj5Qvfxvh7KPf6OHztVpVQgTWuXUW911uWJ0Fo5UG1YeS28rYFl2CcepTAGlisaXBtHEttpE+NlRlfTLYbBBBc9Haj/DRdz76/KEx6jbbcfBnpsAVDuFzPgYQm8OqNkmgmGWPW+5+4w71wcU14PfbW8zaUAASHOo2RohyIuZM+NPjEQb0kHhTCQwFjM5+75GaHu9bYajMTFADTg0K48Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQZ6yQwzo/eg+BHeAucsJSy6Y2tzC5r1v7wHmCENGu4=;
 b=AB+eOFJKHZLyQQU8V5i7EGN1dGmZcu59ZLf5WG4WaS/L35KucVEkQa0vNRPNUlRD0IZ3suHSM8KlJWJKsq0QFyDNyxMDWpU0Px6jmz3mMF76jnwvk9FDXzv5jcPf0Eh1Fklc7brmgks3fMFT52ZsQe5AYfR5SAKH3mgZR+eZXAbWvQ382c1YI17asnLuacS4SKfX9jnh2HcmtDZ4d+dyNvrM2Lcg0LCbcfZnomRgk0nPCURXaRbgCib7XvynpEF8XjSijf6Jwk/f5ejoY/0ngbeidRRrE7PJ/MaGMJrhtASCKS5tjkQdKy97Q+21uNkPex7cv9vWHxn6DTUuFzyk/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI2PR04MB10218.eurprd04.prod.outlook.com (2603:10a6:800:22b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 04:11:53 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 04:11:53 +0000
Date: Thu, 12 Dec 2024 12:09:07 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	andre.draszik@linaro.org, rdbabiera@google.com,
	m.felsch@pengutronix.de, dan.carpenter@linaro.org,
	emanuele.ghidoli@toradex.com, parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: fix NULL pointer issue on shared irq
 case
Message-ID: <20241212040907.cd7kabug72s5pf3f@hippo>
References: <20241211105953.1205343-1-xu.yang_2@nxp.com>
 <20241211110928.GA25492@francesco-nb>
 <20241211114006.ebrut7rvmixznc22@hippo>
 <Z1l8qiIu-169Gyxj@gaggiata.pivistrello.it>
 <20241211140550.ce3htcg6mhak2zvy@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211140550.ce3htcg6mhak2zvy@hippo>
X-ClientProxiedBy: AS4P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI2PR04MB10218:EE_
X-MS-Office365-Filtering-Correlation-Id: 579b3d9e-9cfa-410d-a655-08dd1a631bad
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?MT16ordH0ED/+T5oudcTKbi3a6L6BIfJOMFsvwQqJ/32YhqJHfY8ZvE00O6M?=
 =?us-ascii?Q?2tqs4grG3kZAtAPqADlgG0i5rJ5MG9irwdxTQMvjY3IDOwz1tAg1sSU2xmn+?=
 =?us-ascii?Q?vnk5PPe/v2dDHLrtl125thFfuU1WY50rhk+Pbmq8uEk6GU4b14kQ6Uj1H/MO?=
 =?us-ascii?Q?LOzsfaUg7iBLqnRNgvIXU2yuhQxFgPeDhWWKYenI+nue8aBR6Hs8YxliNwIL?=
 =?us-ascii?Q?qRKG7LNKiSP83qFw30W5w9fDlDJRWBii6Y1a0shhjdtTr314jeggykhXdV2A?=
 =?us-ascii?Q?0DHPxkqFao2HRxYAnFYsqP9eFojGPdC1oq0C4sgvT+9M/GgyTQ0WLNOAkNzL?=
 =?us-ascii?Q?PD38sBqP44mRIn4OPnZVu+CLQrVCyqSOeiJaW2s7j7PHKRF9n5kxM+Rk/6IB?=
 =?us-ascii?Q?0q9xoD4tHB8lRfztXe+JAYaarlIvgAMZIMx7jpsSwCdIt8CKt4KAW94ndjYO?=
 =?us-ascii?Q?h05sO0I6zJG/wh1oHCVEIXR1WU7NiQwbH1H8NyLaXJ3UjXrOW9kTQZipqdo5?=
 =?us-ascii?Q?VpfV0k8nPBaiMPYq+vC8Jgy0q5n4ZOVJh29xzFfSO35/qgFZFrfuxlnYqJDX?=
 =?us-ascii?Q?rwjjtjFRDIluXTdzpPqVqyqnLLlkjEyEFMPvsOTno1L05XiKp20phi+y2JS/?=
 =?us-ascii?Q?yyh1iikb3HSLO4nzUp7QMOHLporqEK68jSvw8mlIrxtkBquJaIjUaBL4Ze3q?=
 =?us-ascii?Q?D9z/ArhkpB1Our2rEn+EMRjKK5rfqEf5LBOx2+C3/X6H+B7FlOQYY/i+u6PD?=
 =?us-ascii?Q?HYjxJkU890SVV8Dg5xCi12XTXLi893RzIoarmWKcn87c9mlcjO+HU1kp4NKT?=
 =?us-ascii?Q?p8/5pgu6k94+S2zIY/xDUtxUNhM5liA0WRQTT3Rqf1zORUSroiYa3KqAleP7?=
 =?us-ascii?Q?ZOI1BHbaWJuvD/ckzlSDXi4esVvH6nlNFRR8ui58LgqW+4D+kYEEKzq0g1g0?=
 =?us-ascii?Q?s9+Vj2rzdsOxYGbCJ7lguKMWZtyNVda3bgH9fZq5a6W6zM4a0kkCTQdEapvO?=
 =?us-ascii?Q?BRg02IIIJBEvGD0PgPCv63xBMrRBSWlJwn7Q7tTiV/s/hwYFPeA4R7VnO5Nj?=
 =?us-ascii?Q?HqclWvgmcMF4JYRY+jYoDUvi4kC44Yd/30t157fRZdElGoVKWkl8+t//A1Z5?=
 =?us-ascii?Q?yAeKy/GnKU6UHewdHqws65GAmD+46RPJAlbXybZUuU6fOnLYVMEuo2Yv+u8F?=
 =?us-ascii?Q?cHfNkFTXF641PisNlVfhNOO+GvIcjURupc4RQGE4NtZXPrNg/Pje2GA1/NHF?=
 =?us-ascii?Q?GpfWMcrY7gWGOfey5e0vyw0VA7XQv7ElVIdQ9YKz2aABFM1I9HBgtl66wPQx?=
 =?us-ascii?Q?OcOX+gNABDIUxyt5UomJt5rwN+VZcYPl1exEzMMmpZ4vbZJjU7JhN2CgOXsR?=
 =?us-ascii?Q?2Cf2B1BU6xZao37Bru/2E/WF8SKYFmnoy0ml1UCaBnKaSgtWog=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?FXfdGwZsbVuZ/5k+opG5Zw0uFFkXkzx8Mqvgm1U75HILQ4AeNvU1hZ3Mxco4?=
 =?us-ascii?Q?WhVngbnaW2pl4JhblXrTptltOzH/DN5cPi6uZkwGD8SXq8buAeen2AHcVZnA?=
 =?us-ascii?Q?tbF8+GB+Ikrb9qrKtrP5EsKwQwEawqndf5DPpsNbUF0sj7pDKjof5Qy14wPe?=
 =?us-ascii?Q?CXMYSBfhiX8lKbteD0BuYUlApqn7XM3t37cCmqzlvpYxCqtN54pa51fBiFa1?=
 =?us-ascii?Q?ChNPVd4dnwG8it1pLUkdnUNWlEYPEhLX2GvOM8IrSr3uDbTfyGi9tb1lxk/r?=
 =?us-ascii?Q?OHyQK79mpHeoLA8nWsQXlAAKgwKF9sR5w/rt8mBNfHbDEYWJYSW1RRDHUAVK?=
 =?us-ascii?Q?wYECiu4HeNwvnHy6Rb6fFboiSaCeVh0CIcbdT7d9jeYrjY4o5GagAEYCtkVA?=
 =?us-ascii?Q?SmWKFBehOvYnPzu7RWpjchL6NnT9idjXCXd3ZepOnU9bAKit1LYOJBqtfOkB?=
 =?us-ascii?Q?oJxrJFJ94pxSoMQjj/iLFNcfe3puTcP+2/SeKPhrIib5glwXw6pKghHNpwUB?=
 =?us-ascii?Q?wM5guzddriBy9zoswArmDJ512V9RMLQUNtmbkyNnoTV7s/gQVvb2Pq8OziLG?=
 =?us-ascii?Q?lq4Y1otXPttEGH2q2rwF0bMsfCP3mreJPUQ/BPX7ttfBe47ZapW1iMTLO7mi?=
 =?us-ascii?Q?3Lfin92jJn+PlD5G2VZ41gnCxPZEfJlHkhNy3MLFK7Sp7oSYtr8WdoDIO1HJ?=
 =?us-ascii?Q?2JJJqMji1MbTHHh24puDdNfm2nUI3zQTpWmolIqDOOKgiwM433SXC6+bzPd5?=
 =?us-ascii?Q?Q+tbtcfPvdyZLv83vdfup6znlOLOkxpjbewi2hVsU+DXYmh31zvhFmQd0GmO?=
 =?us-ascii?Q?Idw4y6xpnddw87Hnre3YnH7clKgcGJe8mkR2a66GyRke/Ip+gcxLvlE2WR7L?=
 =?us-ascii?Q?UYScOD15rUrRO59C4SVxmVi5H1zwdJI2R298cs119CNIuU1/qenaVTfU2ZGf?=
 =?us-ascii?Q?ak+7g4kJHAMdCpjcyl/I8NMTGhNnlhGomP7H+7QYRKxgsLpWfSWAOKAtJpbI?=
 =?us-ascii?Q?ElGmAHrRfYBMJ8qb2MXvInrjphqeWOUu+X2ohaLl2OF78dVcGskj5/EKCav3?=
 =?us-ascii?Q?x/bL8R4UzoKyuO0S0TdEJ6HTvPUE35yRD48NATDVq7CJPfv1o/n/3YH7Fh2b?=
 =?us-ascii?Q?tZnAYzsl4Y5PIjqALcLkNhxvsxMobq3XAao6zWSp5YV8R8XuOvey24maSFRl?=
 =?us-ascii?Q?FgxvuS/Gd7wI3jW1zTK025eiDixnJnTDmf5oHgu+m75CWMgbgzgZPNiTCmmj?=
 =?us-ascii?Q?mbUa2XLEWZad1Omii8q7ncJwwR3zVWWtL9/0hhYArj5hFwJFrjc6k/HmVVI2?=
 =?us-ascii?Q?VeAdoPmlp4nhAJkGz9i+bCM+VM3ABQnOimWLNfVUxFsMPZFsyXRLmqrhk5EV?=
 =?us-ascii?Q?+QXKGSjHKQlnM2HH6BPcxnaIg8/bxTEnLhdM63eI9axU3lxE7x6Oe1UsSU2W?=
 =?us-ascii?Q?GzKR1lndjA2ZZ6B2sYfGfGBTPxKnnUhzYS9IRqvEaWiggfh6T1x2lf2qtaJJ?=
 =?us-ascii?Q?2utpOkACTtNxFKpNMg6T2yUowUW2pV7//u80zXvljm0UhPsXFMsIgEg8nycQ?=
 =?us-ascii?Q?MXOpzO3eRdGB0XRJyUiW8tKpYqmeR8WeDNx4JLlK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579b3d9e-9cfa-410d-a655-08dd1a631bad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 04:11:52.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0gYh45hkxsXLmQQXDUlkPj6+W2ZdRgy3NuoE4nDjQZnfh0F1rqvggyiD969SUxYL6gzEV765Q8C7zl1GNtQQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10218

On Wed, Dec 11, 2024 at 10:07:55PM +0800, Xu Yang wrote:
> On Wed, Dec 11, 2024 at 12:51:06PM +0100, Francesco Dolcini wrote:
> > On Wed, Dec 11, 2024 at 07:40:51PM +0800, Xu Yang wrote:
> > > On Wed, Dec 11, 2024 at 12:09:28PM +0100, Francesco Dolcini wrote:
> > > > Hello,
> > > > 
> > > > On Wed, Dec 11, 2024 at 06:59:53PM +0800, Xu Yang wrote:
> > > > > The tcpci_irq() may meet below NULL pointer dereference issue:
> > > > > 
> > > > > [    2.641851] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
> > > > > [    2.641951] status 0x1, 0x37f
> > > > > [    2.650659] Mem abort info:
> > > > > [    2.656490]   ESR = 0x0000000096000004
> > > > > [    2.660230]   EC = 0x25: DABT (current EL), IL = 32 bits
> 
> [...]
> 
> > > > 
> > > > I do not think this is the correct fix, what about using
> > > > IRQF_NO_AUTOEN ? Would it solve the issue? You need to adjust also the
> > > > disable/enable irq accordingly.
> > > 
> > > Not work. Probe failed directly.
> > > 
> > > [    2.646391] tcpci 2-0050: probe with driver tcpci failed with error -22
> > > [    2.680086] tcpci 2-0051: probe with driver tcpci failed with error -22
> > 
> > Ok, clear. The reason is the shared IRQ.
> > 
> > I think your change will break the support for edge IRQ, because we have
> > interrupt generated calling tcpci_register_port and they will just be lost if
> > the interrupt is not already requested.
> 
> Do you really meet issue where interrupts got lost?
> 
> I can't find the case because ALERT_MASK is set to 0 firstly, and
> ALERT_MASK is assigned some value in tcpci_init() which should be
> the last step of tcpm_register_port(). So the interrupts are masked
> before tcpci_register_port() completed. That's say, typec chip can't
> pull down ALERT line during this stage even though you don't call
> disable_irq(). This behavior is suit for both level and edge type
> interrupt.

Well, above assumption is based on commit 77e85107a771 ("usb: typec:
tcpci: support edge irq"). I think the irq may be missed with this
patch. A better way may be to lookup ALERT and handle event before
probe() finishes.

Thanks,
Xu Yang

