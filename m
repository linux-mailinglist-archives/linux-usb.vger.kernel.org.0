Return-Path: <linux-usb+bounces-15072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EEF97774F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 05:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DBAE1F2569B
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 03:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDFC1B6532;
	Fri, 13 Sep 2024 03:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lWSAXLht"
X-Original-To: linux-usb@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA62A1D2
	for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2024 03:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726197770; cv=fail; b=lP/hrZJU9oaMyJu+Hk4jpf6cIymh5zHjrzN3CDwMes/7UJZCROGDCUFkfD87cNrqVjR8RFNnEM0xadXw4CGGYtzeeKtgKRgWjNlVmJP3JBWwN2i31y/tbfbbD0z4UJgw7ObNPJno5sjPMDZ1eFsLqeZ6BFZ/7VVrC5vxE1On2Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726197770; c=relaxed/simple;
	bh=XrvfE4Grz7q3YVfREQHc+azMFqdeXvLJd9ueM7EBFtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OwxkuPBfMbWNcBSzwq3MWJTgzza9U5GpBpa3vCSf10IHP1IuKgAACn8+3LBnngh6fT/bEPfDZ6Kmt4UFmOfDfJUgQxhGOPPCyC4tJ/+1dA5EqvPXIcsix/mcsGMPyWKDNe6BvaVhCXHhALxCVvQrSph8dwFAQgKTvQVvep93rDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lWSAXLht; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLKaI0KDdzXbfYpsZnckKeCZC+yjv5vdMRt5oh61Co/3BZYMB1rwivec8vye5+zsAsZx9EKxSqDB0PYzunznKN+nW+I2CO6159HhG07hxLAC/9nxpbzMjySV3vHXlwoDkIxr6QwqjYJcIsK154wbtvIh4nyEeyt5Hl8UZAXCE21BHkiScsna5bD+Mn1OXATqlCciA/S+6YcK3Wxw3zpiHK/Jb7HtbBk4poPwD9Wz86/CkpDireSEIvw1P2s3qjvCp1odpYA4tSTDQ3xSQxrX6UQqZlqh43oVmPC3XJed0ms+KDiTtVN3rj61PvGJg1+rDOi41/lDDpmwifyntBPIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek6l9N1nncy9s09c3EzUXb4YtgLzyc+rHuXVg3hR3FU=;
 b=MYKyVHcpgc4kfef2f16vXDFQFl+rVXeASiJPs500TYe6cgzlvW+3HP5zZYPm93V/p3mBks5rLcJ/xnfBqs7YZuPT8uykWwxIH8+5V4GK/axPP9kH0MnG06HSAynQ75oAbxCXPc9kV6e1wBabiBrC5P4XiXjI5cma7laX8V3Vy/zZ6OAqLjioHx+1rfUp2H4Y9KzAsMK7Ogf1Y27m6FZo497V1D5p6mGEHxpMNdE4zzeiHmF8Dnu1mMNgdyevboNTu79F6/PFepQgvk2F6aAdx8hmsy1ivxEVnLo7JQM1hHx9a0bQqXortrhtwoBokZ2Z0tB9xGNu5xOGWxR6/HrgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek6l9N1nncy9s09c3EzUXb4YtgLzyc+rHuXVg3hR3FU=;
 b=lWSAXLhtVomuapgTav2bi2VMCZAcxGZG95W6TI+6PHbujOVdgf1ElQBZpo1G5H6f97dGD9vMHu1u9reWSMCngGUbfgFTbcHF3nAI0HqlnDjq0K1wyi+EXPaxyQSpM5DujTdkk1CkrR4yr/VN/gc2cl7YlfieSSLyiyYx2rCXGk5bgd46vxJqG4kiL1J41HncZI9roWWFTgbVpj1It2UXXPiAMpmSMBjOWGOL3dF8zNN+Op+i4X1Ffk/uB3vV/Y/9fy1a9R5w3Drwy5zalo5doxVgYlAcDNFgg5xrqNAz49MOnyBVlXvdJxINRWVQos6DH1hM5bUejSEseKpZVFZACA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8315.eurprd04.prod.outlook.com (2603:10a6:10:25c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 03:22:44 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Fri, 13 Sep 2024
 03:22:38 +0000
Date: Fri, 13 Sep 2024 11:21:14 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/3] usb: chipidea: udc: handle USB Error Interrupt if
 IOC not set
Message-ID: <20240913031844.y6eik336qjy5wn6x@hippo>
References: <20240912033551.910337-1-xu.yang_2@nxp.com>
 <ZuJ7dMdQ2TydDAmI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuJ7dMdQ2TydDAmI@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P191CA0003.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 5661d5d2-ec57-4e6d-a783-08dcd3a351d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dg5F9egJ36dgYb0vCzE13Q3cKjQGifEw98Fq/WKRqxTJS0rD+JTHlfIX+0b9?=
 =?us-ascii?Q?SeMfYMGOWn7T4K4YkcSXGxbpLEIXy4j4vBxbJok+XFCizKoiyOszCPcp0YiR?=
 =?us-ascii?Q?3VYZVeItnhYR59rwhHS3Ri0cdWqexgi+ax/yJ/y+ROR4G6iINDEUWvMrS+tD?=
 =?us-ascii?Q?+KcUDbaniehx8DTrt6ZtTI196RBujOnzMYzcny85of29eq1DigWJ8LFxq9H+?=
 =?us-ascii?Q?Tge3dUyEUHLoP371xL48iOog267cCnhDoXdvDDoRtk+7fArmQMvbJE5Ji1qh?=
 =?us-ascii?Q?Ell2B8OsJt+sLt29rjovaR3BV75fz5TFVEyP4V2cHSt6qMxNcx5wX+zoSU4y?=
 =?us-ascii?Q?CibcCnPb8ZFF8fZVwXFocY7AoU71L6u3W3+LdR1EYqqk0nXPIkoXuT3/F320?=
 =?us-ascii?Q?AMlZ8UUZ9pNbeizTStelGcbXf8ad1xmV7UsJ/1V6LGF2+19o/4Z3f9aDK6aj?=
 =?us-ascii?Q?j/WvSZhkyL+k3PEYe8G1wmHH7zuPllq/9vz45LBdbCIrgOriKdsP757H+n1z?=
 =?us-ascii?Q?cJDEDt4PRNq2tCkpzKmWKd7LFt6PLe6n9xrh+nAj5Yh/6CEZENDd2/oMjV5E?=
 =?us-ascii?Q?jB+riJ4R/uITCmawUVejrayYVucFrbfsEEacQ/BpRreq4addRDHxicF0Gz3k?=
 =?us-ascii?Q?t4yBk5V53I/Ts8p+6BnlkP3/GU8hSnhj9paJT5YgdRfDzOn5qsWS3h6Y7+LR?=
 =?us-ascii?Q?1bkvhQ2YuHKI/o9z5gzj39ovTnFQg6z7J6c1ppmhEZankcmuVAoNKzhTy1iD?=
 =?us-ascii?Q?K8kwBuSTqiH2fbdmA1JriuHL8M3kPIbWf4ePNr03kPa5SfUn6SGLztWeub7S?=
 =?us-ascii?Q?GD762D/P5B72JSPQzkoyAGXhgOYvpBZqjlZ6DHW8vp23Skfdir4xOrK9JjpR?=
 =?us-ascii?Q?kJ52qHe3uRfY88ClfHhE6GlwRfaTIlaNIjVHyiSacsuZJuVN3sAdzSanIbdN?=
 =?us-ascii?Q?SBQalgCF77Ax6Ys/wmLqJosmnTJgu2g4oNjN7n4305I8kUQ8nEBxPE/ciQLs?=
 =?us-ascii?Q?Aj2LdQGSIcwI3vfZhhcu14oc0fpN4BCBp1FdPpuOlK8qfZgGt0uyBzc3b2Yl?=
 =?us-ascii?Q?fCPmYgOt99MR7U/JwSC327xkLBDAMJv5l0+lrLqduQq3RInt1dBDF0BOvyD4?=
 =?us-ascii?Q?VjdODDXNiFunJmQo84jhg7tcWVZtT4BXfeklwzKYBNLe13bvvqs6Obl7SIQj?=
 =?us-ascii?Q?HODq85qcEYL5BGdaJcWsvfxUozGuTbQWyZ0P5n4ZV4bxxKjyTjotNCjMU3Fo?=
 =?us-ascii?Q?AM16ggpcqIku47zyBtIRcyEvW03DAhiaNXya0X6pMtSD3KHGpRHnNjKKXkW8?=
 =?us-ascii?Q?CNmK36DPWR2Qifue1NjCRQd2nryh9aFSgur0zvRDDEsxyWeX60fmAXJLDgVf?=
 =?us-ascii?Q?8BVc7/FgWAz2Xavx6E1UTJsNnv48sRmFPeNGyVAKWcdvWGW5vw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QxG6Im1Dxv0NucYjuwdONy6C98ndGwenrxO0Ze+UBv/vt0pH6W2EBzt8x8pN?=
 =?us-ascii?Q?ehh28O9CVt+f8+uIdz+1qwc5bLliSIYBJxKyMuhejjVE+FsctwZlMuhgkFmY?=
 =?us-ascii?Q?kpjO80m82oYLhGhhS/7Pv/DakTTUO8H7WEq6UczBZ7rpUkK8LN0tQDuoGIhj?=
 =?us-ascii?Q?rkXdzcoX2COkkuuJsHnQGRtVs852kyLpx/CEq3yOtoBtVYvCF653JbefRvEw?=
 =?us-ascii?Q?EIFWI/YcJfySkOLrj27P+nEQlLtJRp+WeAX9g1WfPktV2JJz6leOobEdG2yP?=
 =?us-ascii?Q?NoUAfbgR0HYWzee4FNBLMt8YHbOEscDU1eLrgs8pWPXFp8l5eOiUyhuAVHjm?=
 =?us-ascii?Q?TBvGklUJqhzigBsLyuEXWQo1+3RxBL/M7HaNwqwN/KViEo+riwreK5W7lHZ0?=
 =?us-ascii?Q?I901BF9+JMA/Ht5mJ8CgNhrZ8ZaBS33cjyiOwnif04HApg/OafVJMI9auOAw?=
 =?us-ascii?Q?FTsdfyIuZerfcr6oLeMx0oIHQMxQpdOHFknKE8JV0HWiukDSoaPN3cigKKoA?=
 =?us-ascii?Q?RhCG5djIjz28nt0UuUPIijVhdu33n0OD6TdOKgWEf1BUV2Q8sY/MPkOoiISr?=
 =?us-ascii?Q?c+iCCAKMeYz9xgy1zSTJDH2yRsqHbVsDGPYqCOm4n/WwffZ7snfdUfuvj+o0?=
 =?us-ascii?Q?TZiMoebWdgvONKtQlqcGbAeyaIhRzA/+5YBxBTqa60weNkI7pQog4xSATYoM?=
 =?us-ascii?Q?X2PfjYz99a1Y3gTA6s/1Y7Df8G+CuWzEl5tFrzC0NVOuRor1uOVC4PQTkkw2?=
 =?us-ascii?Q?o8ICacIHiIlyXAbZrbW/6i4batPlSPXeCaFTY0Zw/a/dBCfkIwLwRCqUSbnc?=
 =?us-ascii?Q?8bK+lTzaQvvftdwR6W23esyJTUgFP1w4NZSfeYQyjG7O1igYgCDxi/56jpTa?=
 =?us-ascii?Q?kgS7KS3SgqD4nZ7nz9iG9tnhFHLhyCqCgOi8WKJU78NIER1cj4KdnExxAI/c?=
 =?us-ascii?Q?iGcPPpfaPOBrp+RzBFqE4ki9wy+4q5tv5uGwVMQYoB6Ge9M5zqICXK69aJCm?=
 =?us-ascii?Q?uJXEpQdlMGlXopv9tKsTGeaagKSKXHVpyytH90IKA8TlQ6s/u0lXRvFRlzOM?=
 =?us-ascii?Q?JaY7eaYyv3PN5sNM+m8pH5iYYaOuTXgHSTtUHlUSBY7Hm/xbpbycAjajDOkh?=
 =?us-ascii?Q?s5+xUeVxFKAyetSmYauqei/lxERpJLaJy5t3gXtZo+aOozjKRmIT+CXh18u8?=
 =?us-ascii?Q?HRIMMMwXx50vxzTDpm6Fwzse+4azzIjd38MTp+VTY2aa1P4sgCW1Lr2P9Lyt?=
 =?us-ascii?Q?0NU+xDeYzCqz13WHwwKBtEMYQgiCvl8tSXBV7guN625LYfQDCUZV3EHwp6i8?=
 =?us-ascii?Q?qah2MzIpSFuburJXi6zDqzrqk137Nw2MFtX6kiSPMk+0CNA/LBVmfpTQwi2w?=
 =?us-ascii?Q?mWE6zAmBKbgWVthkUobDxzyXV/LP+ou9CGicq9OIjFE8bqeUDSSklefSddk3?=
 =?us-ascii?Q?+NHCbIrMGOZK0ubHSqHaPjA7cKxqq6FQ06wIZTzDxDGp0Nm7o7zKa6k6tCBG?=
 =?us-ascii?Q?TVZcWBxnEbsnhAqjIGV/Z8ggMzRqUpmnfyAHmuzN1mumobhACk1poi62AN9k?=
 =?us-ascii?Q?CEYoiErOuQNEtFCq/F+JQvJP4z4nStetXt9lY2r8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5661d5d2-ec57-4e6d-a783-08dcd3a351d7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 03:22:38.6887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IpJCKJAW+QlYFRXxMFbtvvQyEftMbhyzztLV+BNi2NAZFbYcgIFa3eA3WPs/AdRcAcbfURUyWlC0VldEGbT8Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8315

On Thu, Sep 12, 2024 at 01:26:12AM -0400, Frank Li wrote:
> On Thu, Sep 12, 2024 at 11:35:49AM +0800, Xu Yang wrote:
> > As per USBSTS register description about UEI:
> >
> >   When completion of a USB transaction results in an error condition, this
> >   bit is set by the Host/Device Controller. This bit is set along with the
> >   USBINT bit, if the TD on which the error interrupt occurred also had its
> >   interrupt on complete (IOC) bit set.
> >
> > Currently, device controller will do nothing when endpoints met transfer
> > error if IOC didn't set on that error dTD since UI didn't assert too. This
> > will also handle UEI event as same as USBSTS.UI for such cases.
> 
> UI is set only when IOC set. Add checking UEI to fix miss call
> isr_tr_complete_handler() when IOC have not set and transfer error happen.

Okay.

> 
> If it is user visiable issue, add fix tag and cc stable.

Okay.

> 
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/udc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 69ef3cd8d4f8..b9ccf62e0a50 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -2063,7 +2063,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
> >  			}
> >  		}
> >
> > -		if (USBi_UI  & intr)
> > +		if ((USBi_UI | USBi_UEI) & intr)
> 
> Does it work if check UEI only?

Not work, we will lost normal USB transaction complete event.

Thanks,
Xu Yang

> 
> Frank
> 
> >  			isr_tr_complete_handler(ci);
> >
> >  		if ((USBi_SLI & intr) && !(ci->suspended)) {
> > --
> > 2.34.1
> >

