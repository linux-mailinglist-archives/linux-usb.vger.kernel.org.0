Return-Path: <linux-usb+bounces-15079-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51870977929
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 09:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B8791C2462F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 07:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EBE1AE845;
	Fri, 13 Sep 2024 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F/LnSpsJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013015.outbound.protection.outlook.com [52.101.67.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EAD623
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 07:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726211582; cv=fail; b=I43GJ0EhD652IJ+Fhi7iFzx5YrK2SvBOOHO1sU5Wof8sMBr7CSumU3W6fpbizr2JqwXAGrsuq9/DyX0btXkrA57Uu1xuLsrTA/ZnhKRPNc08NChpfsWbUQCpr6X2vEnLcwrp+hRwuXWie8Ic15xACXcWmHkPajGL6vZ0S3alhyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726211582; c=relaxed/simple;
	bh=ee3UrZ1UWkI9XcCMkZmUA7MXAEENwYUS2Aw1+ecD5Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QeOup1Q6+vS3xLNruzl3WpLkBO+3qNwculjWSBuMXXKys9UFKz+RHizGN6bk3MHhKDGxT1dmH3NXwmwYSS4g3KhbmNrHmARxIz9Cbh+ZgvPBPBYAOdBOMgjY4hLeyFw3Q1ohxmStATEpepsMOk3/ckwOJLvr27pr5IOmJwVIAxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F/LnSpsJ; arc=fail smtp.client-ip=52.101.67.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eR5EAPuwtYaHzcs8gZr/Px+NziN39ctQd7aWSYcEuyPNKfSyVqoTmwxtzqRjxg8mysmvhw87PTnJzmaSeSMVMy18Svu7xc/R9BnV2upEfK0LIJ9CTY+I1AIZQkhCKA2x+kKkcKookuHY2cbpJe5URBjbGktKDTxtUmuGW73JL6N9HP2yMUekBB4kZTdMZO+fyeteZJ5zJV1om1CsA6d1Dr4w1UVyMdHeBe++C8JATFD60FIkWXzFBAn66ZwzE/tdI/RjUt7bEqltvVvrdNQWmN8ktXKxZf5T0vmfA8iEVG9qG9H1yKFdznQReji8hM66yFNezPZPXPNl4Xv/n159pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NijWHsteBpHDeIxx3e+KIiXiVPMLIfSOVipHCKQBhP8=;
 b=OgvrBT+lgfTw0bK2vOSZ8x7kzD0Tyaw5oAcWhmmK1c0vq8Eqer8ANTZ24e5oMMdcxbqT2zqObHDaJnyluTUVI+ZItYX7FqITq+R29N+cB8/UnKLn0X3pajfIxk9iQVn/sp0R667ruawci7fUY80zieCQAaf5C6HCUg3ulfBAYdFHjda/OYkirJycOG1pqV12jR7kcaN94igYttHxKDPmC1SpvdNkY7vjbD1oJTmbTvlpDmB/PHteVDMjdKclvZJb8Emj9LiaGwDmXuZN/yaq2K+8T/+RWe+2QXSXVa7wGfZ9cTQYWMJR46cs9RiJkOD53zIrCJbU6lqa5P5MrKnu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NijWHsteBpHDeIxx3e+KIiXiVPMLIfSOVipHCKQBhP8=;
 b=F/LnSpsJzKQ9HuldmK+LseW/NZhuOXIPSu96H+QWU9c4ey9BwFmg2FoGi/h6+rtJIvUk1w/aaYClrc4jLP8raxbEjRkQb+3l5O4RfDQWwdRU2gBSVymPFydCeYJT8wb5wZ6p8nHGQh39eUQ49PD64WPR29Vg0hnrRLsT/kf8804SBazXmwcy4j/A8u3+aNxLP0ZKx+2YzdEBC+5VmzRMqHWyAhtAV60RBdjMEh6oY/iuXnrFAN4X87LqHFtcUjJGIjMYl0ti8F3euuzqbd4y/Wsu/x8RF8bynQFKptzzm5Vb9dJqNykpyAO/qhUzEkQ2bcdgqPt7DQz+EITa95PgCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8243.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 07:12:57 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 07:12:56 +0000
Date: Fri, 13 Sep 2024 15:11:33 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: chipidea: udc: limit usb request length to max
 16KB
Message-ID: <20240913071133.pstilja3z25yey2p@hippo>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
 <20240913012045.GA320526@nchen-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913012045.GA320526@nchen-desktop>
X-ClientProxiedBy: AM4PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:205:1::43) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: c13d02fd-e45d-4f30-d5bf-08dcd3c37e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f1tDIn3cRxOxr7M+josH2v0hKfABF0ZfeG0D/m7WWES2jpq4hEsQ8ZJXB9cl?=
 =?us-ascii?Q?fo43GWwFMQys0z3q1AoAaPCTjyOFWJRm47LdVqviY0OWI9olv1sR5hdZzOwV?=
 =?us-ascii?Q?ojmUg9t2ZlNN2nUMtNsBQ88Z2vr0OULfWuCdEDzCK9sHCEhG+WwWZ5+11dpM?=
 =?us-ascii?Q?bB5h0NCMJs4efMpLXI2KynPZcE5z2ri23F+VET7ZEc49RoirDpAYhSvXDVoD?=
 =?us-ascii?Q?IzVtuCflSKsWMhE+6hN1PSWUt5bt1W4+/gyKPFsTF10VlPFRbUBASzM7nOrP?=
 =?us-ascii?Q?mBzKPJDqw/RP3bN2mSTSy9z9AA/qrZDIE4144RCTHRC8/aZXjG0TrzLiE3mu?=
 =?us-ascii?Q?wXvO2W9tggeUUL2puTQLbNAEviEkfC/VqQrjOm5n3hl98Hi9tS0/D/KmB1eS?=
 =?us-ascii?Q?9Lc/LSW9CDONElOUGElBDsB6ZeE6EY24rqkoORmK4mj3XPbjfm573cErUc2O?=
 =?us-ascii?Q?JKMEVsHOPfEeV6d/xDtuVAB/v0BQUDd0yE8OFD2SjJlOF5IDdoE/riNf0K6T?=
 =?us-ascii?Q?hEokj5U+UxKejPwEvxeEVYyedMlfkxW3ciPkw9XpT070oqK1R1YlZm6Z221h?=
 =?us-ascii?Q?6XqFfxMv0PpPPofz14Wu0XlBdVhae7rj+oODLOmzkKsW0NcxGp1vyN0bevi7?=
 =?us-ascii?Q?lM+18Px7jJgLQ113pK6nEDMYnh6UzWv6B70nYcw5LvPInqVpqbp0ZrjVOluP?=
 =?us-ascii?Q?ar1Hqd4xQRM5isa43T1RWwoIuWTqptax7bt43q5Uz22FO70JSkhqykbhp135?=
 =?us-ascii?Q?4+XMBAACGSYvfI6s0vrtapmsA50EMIFP75ua1zPvLwFk0jQBDIX3i2lNmmEv?=
 =?us-ascii?Q?ktlAKWZy0mWzEvNdDo3pm/wteeAlPtC/XZrtcP7Xvy5SpF4mnxt0GtSpeGpz?=
 =?us-ascii?Q?QKyFEUhykQT+uN/EAsLJq25BIPG6vZllNGu+NJt8/kJYJwYGR2zB+RFAWogK?=
 =?us-ascii?Q?oJJhXCCXjgrrKX89XWIAlri85hSSuV6f13wMMFNX6ol8yOd8zr7cgP5v4rHa?=
 =?us-ascii?Q?FQdlmlOP4Gy9xEIiWBK8R5rA0shnogsb1H2TbRSkbotXzPKov3DyWxSRpkJr?=
 =?us-ascii?Q?6v2g/fhfzewW4+0IGkrvatFQ1VWSrfpuPZmbHY2/WIKK2qI79CpXfy1QpHMQ?=
 =?us-ascii?Q?AyqoJUv7UQvrf9FbBDltfDZb7Y7BWPNngwEq1Mqp8I4CVQY8ea/a4Th8uyHl?=
 =?us-ascii?Q?TaQ5SVw454X8epzUZYYN9UJvWjdjVVlZXGLJvoTU1L+1aDKQuyA/Ku5sNbE1?=
 =?us-ascii?Q?ltaflXr/StsziglJXMDQ3c26JCIdSWnCuwtgr0A0O6NeNUH2FQHsJjku0jbn?=
 =?us-ascii?Q?bmv5QR5cuMJhhoGy3VTbxLi01wpVLvht/Q0cRCHarU/A+8Iez0dpML8UUAfD?=
 =?us-ascii?Q?+k+LblEulMwzmFpG9grUCjZiPg14l+gv4YqtCMvdjpoveDYZ0A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l7deYcBHnwGMCaCNYY8azXJ1Y4pXHPBwODwLoX3IlucWBi62ix94dLuDrBFZ?=
 =?us-ascii?Q?FKEuVNqbPXFzer6J147iKnDHW9J0nOVbNleDSJleln2BST1eUoLZ4qis9Md0?=
 =?us-ascii?Q?7XGQOttTk3QG8gl2ybytYyLWXnVtUixk0ZyqAyu+2EBh+RMqI0y/Yg18nsX+?=
 =?us-ascii?Q?E+G1yOUnrCt2n/MkKLS4w4NRVlGBDj+8TnD/zgDS+q/mv2T0Wrrjb074E1Em?=
 =?us-ascii?Q?gdfUCTj1nnrGQ8wQWBat7Z5HEFGmmzCNNj/hvAAr9wAFbYIKHB2U0HpJ+Or2?=
 =?us-ascii?Q?XUcYxX6wSYZ3iPxyzMRnMX7EUNo847Ox7dPMou/XNmmXjLJXXeHNmf/JQxaL?=
 =?us-ascii?Q?OPX4pyzAEVMXg25XDQhOyo7NTs6xZXHk1LiwJtQwWVvXBJD17Pf7sCWerg1v?=
 =?us-ascii?Q?wqmPcQZjN7FAJUH5d2Aq9kIGIMCqq9PBp0d5MzbvGnQt4Rtpuq/oygddB8ch?=
 =?us-ascii?Q?qpuzo0uDS3iQ+YNPIKljUw6ypaKi30d1lKRvcd9mvFmWLv5d6NZSXkdD4uXt?=
 =?us-ascii?Q?K/nzG7FaAJH4LFwm+vuw9QUHx2zZyDzUkuUC5zJztRWuiW1lJt/tLxFXPxKi?=
 =?us-ascii?Q?Z7E0R7I80TYWQ3MsgCR9AnecmRX+MJ1tmD0SUY9J2gnldy1jMNzw+Gb7ThKc?=
 =?us-ascii?Q?W0JPemWo3xNpDJta33aZ9TNbhbOnaaK1ZaBcpJ7b6qvM30U0ED0LQwrCQUEt?=
 =?us-ascii?Q?eC4BITlsXu51/0FJMFZ1eIpSCXy0WZiiOZyxwrWNIfQOQN1RXYYSMjOIeyWv?=
 =?us-ascii?Q?C9PGE6A1ocXp1I+gC8/GGJlkziJzSiy6k7bBe1RsJ5pYYRpHu5kvIfP88OPC?=
 =?us-ascii?Q?lwnHvx4+KgfLbAw7aXmQaTa3/tzGTQRnCOXwxuO9YnoPI3WhlNEMdD9sYpLk?=
 =?us-ascii?Q?lDdmDQqHBDqLvurdw//Gaoveg/s2WkAjCMuh2DH7YOZ2y5h9veNkWGlzd2cE?=
 =?us-ascii?Q?wvzS43xHHb+nMJ7fu0+QtO7BNyW9IuuO50T24oimzefLglAcTNpWkJvgcwe0?=
 =?us-ascii?Q?+jWf0rWG9uP+U/L0cAxiOB4zvhFWw7qKg6G4Xsysz8Sm/kGD/G+W1blFonAA?=
 =?us-ascii?Q?Tv/3YElE24Fo7BNNa6JPBjwarffKlOfHh0JAi6EJ42rVSctkzOLNogsLIrI5?=
 =?us-ascii?Q?Cn5cOiS6Uj+fNFTxp+H16DG9GnPEhcb8gsT/ljVU0o8krQNpM8U0ynzXno+H?=
 =?us-ascii?Q?CEiybHpd/7ywTrqwTFJmqSHr0hnWHzLqjfZd5OalRJMZsaNYyFlcbVwyQa70?=
 =?us-ascii?Q?5wIPzMgkN4Bz2o40rHrri/hU/7MipXR2cUNgfvtnPlYg1FmHgpJNOrlQ192U?=
 =?us-ascii?Q?a3ZJAphzgVC2VhyF1LRpJwyR+962yPcTYRIPucz40hq8W+0+kNd2RAe//80U?=
 =?us-ascii?Q?phFcM8DcUqViAxZpl0lV6UM6TGkhqqBEQR5tEAjk4v5L8TKECLEmn8R13PHW?=
 =?us-ascii?Q?SqPcU4sdY3WzOxwKkr3tyefcU1X2y/AOZ4oDRojO0xuMsxNJ+QgLgCNkhQvX?=
 =?us-ascii?Q?CKaH3rhq9/8CsWG1GUX33jubz6e+OVfDUML1yXjAr/2XG3wUAqqwGTvCgr+C?=
 =?us-ascii?Q?7ZIY8rRKJo9qxNQ41QXR5VdI2l+kV0YBRpf/7MEq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13d02fd-e45d-4f30-d5bf-08dcd3c37e1a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 07:12:56.8781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYIQ6qNqnPn3tWz024d33yzyQB835IHTfJRWXYg8z7y9hRJ5b2tHP1SgGl1mkqXVkCdBmRkZcHGX3JZbpdObYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8243

On Fri, Sep 13, 2024 at 09:20:45AM +0800, Peter Chen wrote:
> On 24-09-12 12:51:49, Xu Yang wrote:
> > Currently, the deivice controller has below limitations:
> > 1. can't generate short packet interrupt if IOC not set in dTD. So if one
> >    request span more than one dTDs and only the last dTD set IOC, the usb
> >    request will pending there if no more data comes.
> > 2. the controller can't accurately deliver data to differtent usb requests
> >    in some cases due to short packet. For example: one usb request span 3
> >    dTDs, then if the controller received a short packet the next packet
> >    will go to 2nd dTD of current request rather than the first dTD of next
> >    request.
> > 
> 
> Are there any IP errata for it?

No. It's decided by hw IP design. This old design may not suit current
requirements.

> 
> > To let the device controller work properly, one usb request should only
> > correspond to one dTD. Then every dTD will set IOC. In theory, each dTD
> > support up to 20KB data transfer if the offset is 0. Due to we cannot
> > predetermine the offset, this will limit the usb request length to max
> > 16KB. This should be fine since most of the user transfer data based on
> > this size policy.
> > 
> > Although these limitations found on OUT eps, we can put the request to IN
> > eps too, this will benefit the following patches.
> 
> Since IN endpoints have not found the problem, please limit the changes
> only for OUT endpoints.

This 1st patch is mainly used to serve the 2nd patch which may impact
both IN and OUT eps. Because it's hard to judge whether a request is
suit for transfer if it spans more dTDs. So it's needed for both eps.
I've looked through all function drivers, all of them use 16KB as max
request size. If one future function driver does use a larger request
size, they can adjust it according to this error log too.

> 
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci.h  | 1 +
> >  drivers/usb/chipidea/udc.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> > index 2a38e1eb6546..f8deccfc8713 100644
> > --- a/drivers/usb/chipidea/ci.h
> > +++ b/drivers/usb/chipidea/ci.h
> > @@ -25,6 +25,7 @@
> >  #define TD_PAGE_COUNT      5
> >  #define CI_HDRC_PAGE_SIZE  4096ul /* page size for TD's */
> >  #define ENDPT_MAX          32
> > +#define CI_MAX_REQ_SIZE	(4 * CI_HDRC_PAGE_SIZE)
> >  #define CI_MAX_BUF_SIZE	(TD_PAGE_COUNT * CI_HDRC_PAGE_SIZE)
> >  
> >  /******************************************************************************
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index b1a1be6439b6..5d9369d01065 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -969,6 +969,11 @@ static int _ep_queue(struct usb_ep *ep, struct usb_request *req,
> >  		return -EMSGSIZE;
> >  	}
> >  
> > +	if (hwreq->req.length > CI_MAX_REQ_SIZE) {
> > +		dev_err(hwep->ci->dev, "request length too big (max 16KB)\n");
> > +		return -EMSGSIZE;
> > +	}
> > +
> 
> Since this IP is used by many vendors, it may fix by others.
> I prefer add flag like CI_HDRC_SHORT_PACKET_NOT_SUPPORT, 
> and set in imx platform file.

Okay, I can limit the impact to only imx platform.

Thanks,
Xu Yang 

