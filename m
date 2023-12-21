Return-Path: <linux-usb+bounces-4497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3668881BA02
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 15:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2E82288B4C
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 14:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8D738DC9;
	Thu, 21 Dec 2023 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KzGn9J1W"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2045.outbound.protection.outlook.com [40.107.247.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E248036085
	for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1ewz9HMoGz6P1Gdaj7LCip4fVJ8HlL065vdmYkD/2fL04dIAIQ9mMnaFuPDvbkrefu6gzrlODZVczBtnCkQZR0PlByadhxfwLFKbHHArnG+EZKfvDRc3RxNfYWfdnrHdtrwcqx/DS9Oq+7QW7KSrpwK/t992Y8SawN0/niWv/ZCcneHWBBwOAKaHuVinjSrgnUbs/nCKJqoIwL96GFoykJhLS2XGDjzhmcAcfDNb6t/Qd3r05HDAloHxRWIi4vb3MYd5oiaB12/H4oA6lFhR4otytyUfU/4s7/CgOY1aNF3eRn8olgymOwTw/GzvQ0PaFQHnuUkWJ30UV5FZHLWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcojp3NYTtwhksVIxx11IY8TBISXmzqKrHmkpqKU0Qg=;
 b=kELIC3zCrvwg5vh32iZjukFQldNalDs/nxpM6jVa9befxBxgbhuWi8uxL1c9n+8S1el98HOOzDtO8bdTH8J8mDmJ3qaXHBFIaVZ1pU4KBYl5yYhFw/xVEZl6htwZdEyHLGZYG7CF6aedrzSPfdbD5R0n/NjMS9//TsZWwMFhCxCerlavzqgE4juiXElcQD20tD4zxxliNqq17PMzcWKNPbVmI4EKyp+p6La/LMij3v7DXkvzQ3DJ2TZ/Y+aNTAWJI+9YHtAnAIq1aShTW0DpIzYoP9GL9kxOgO69E+8EDMkVaGaI2l+rmvS3uOQkvPtQFWFBz5YTMPPqOFfUmrA9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcojp3NYTtwhksVIxx11IY8TBISXmzqKrHmkpqKU0Qg=;
 b=KzGn9J1WP+a6ZTNxZ7qJy+k3aoeTd3Q4f57UtXWULYjvM8r1R9j8GMu3S+3rqKP9gRaGQ1CQ7qM63n+U/z04l05ryNxSNMKkUu13QmWBioTTdKBhSfAoBWZF9o5BsypHRR3mVOWOwI+CNTRJpZPiy3SUv9GKX/7tLKCH4kTYOhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 14:57:38 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%7]) with mapi id 15.20.7113.019; Thu, 21 Dec 2023
 14:57:38 +0000
Date: Thu, 21 Dec 2023 09:57:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: yuan linyu <cugyly@163.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/7] usb: gadget: f_uvc: change endpoint allocation in
 uvc_function_bind()
Message-ID: <ZYRSXAccojxlOcz7@lizhi-Precision-Tower-5810>
References: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
 <20230803091053.9714-4-quic_linyyuan@quicinc.com>
 <ZYHCESCO4EXPQbFY@lizhi-Precision-Tower-5810>
 <b793b44e-ce40-4f03-808a-8606970cb2e6@163.com>
 <ZYMQDVU+c+gEQjE9@lizhi-Precision-Tower-5810>
 <74e0092a-f084-4e87-8d83-df27fb5a0290@163.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74e0092a-f084-4e87-8d83-df27fb5a0290@163.com>
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM8PR04MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7ad774-d175-4043-5f16-08dc02352c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cndoEc0NCZBN+ubXFlAcZ4YEOq+lDZu0BtW+5Z5Ri4+PfrlGNSbgZTyeGIA1FbTwrxisyYBH1QpswkzXhNlDkxAdP2QJg08+XbGm2EW4oT47zHlrOQPMm2ZqHGHoE4rQt+owx50rmtIuXVYvv8ywQzgTmtjptmLI1KqFkZQBj2nJp9CvL1obrTEviXwpCI4ycQCYXrT+9CPQ3rjGYRf9xulXU1VFpWgNUNSdprxakxNBBCRHBVO6qPYlrxxv1eI3mVNNVROE4ZvTWn1q40pSiZzqA5WCkn94IdzhD3XOwWsm30tWNliNRISzg3tfZhHiB1xipN9MPvRq3csdPS24/9VW4cYVK3OYWqVsENpmKwlwvSWfqxWfE8Fra1Ky7a6NKiev2/LMDk9yKYrVTaeoSJD7LsYkuRXPTu6BAsPYelz3wunSb0YQ9cM2f86/Bj4RXWAljWrwrAlp/nsecfl4+vCSyaxy+vvifo/CV3ng9BMcc7WKub+qXlQTPVNpc0Ad0l/+n4ZOk0f1RCVhcwwHm1Jha+h/Vslw+CuKCjLrWL19dwtKPy7e5FQlR6AYqij0nhh2w1gqK5WNSfdLvaG1lgznIOi5WzL5l32c0f9pajqqgvg/I4Ro56kB9aoZ/lAY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(136003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38100700002)(83380400001)(26005)(6506007)(6512007)(9686003)(53546011)(52116002)(33716001)(4326008)(2906002)(5660300002)(8936002)(8676002)(6486002)(478600001)(6666004)(316002)(41300700001)(6916009)(66556008)(66946007)(66476007)(86362001)(38350700005)(66899024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?yfcGJW0gHyppCyrYK0S8WLSXMvu2FyrQ8jl8b+jM1QT0rh/fiNAHpr53NO?=
 =?iso-8859-1?Q?xBdwx+VoJ/aW7PgmzlrKjQfpmgb8Qp77e2Y4J9oPFjlZpr/dkQeQuIxfhu?=
 =?iso-8859-1?Q?1e2WjIf6TRirMCtglBNQhx+hOeAXYO9hZ+m1dceCp3ZR6ybQuQzZK3eYW3?=
 =?iso-8859-1?Q?igs/K17sYgjZ69ZwfYpMNA88wyMs9UNuQfQ+Y/8qumkEDY366Pp2Ti5Ax5?=
 =?iso-8859-1?Q?SeVqasMF3w7vIXJ3rXoBdmzqm/mqTVfkb+/Vdht/FiZtg3NyDvEkvED9DS?=
 =?iso-8859-1?Q?NLkj3KlWxRuupUSl9zTWkBOJxny1DcEkROthozY3fLSH1CYZRSmKZqP1y9?=
 =?iso-8859-1?Q?RMH6qMcZXNzTF3muyN6qK2M1tlxEzO0mznviLpYKeyjEfpa+u6xWruWuji?=
 =?iso-8859-1?Q?f+t2XD98YRd3d22akWCWZflU1By2SOnwK8fhlnVEu1O/e66lmxW8vHavRz?=
 =?iso-8859-1?Q?4SlPIlDkBv92yRRmgpZRgjxkXXOoFuHYO+JQHtjIjRUjv3ch7PWOerzXw6?=
 =?iso-8859-1?Q?7E/phhGMa29SLC9WqebMnfcLt+WXHdX+UcQHa+ni4+mNHmDL7QNJLl1Ruy?=
 =?iso-8859-1?Q?KEemvM8TqsWHPotiLLbgdbAMdqORZQFDX77+zLOvn7n5jftSU9G/N6iN7T?=
 =?iso-8859-1?Q?+OMNBcJFdKum6lJFyduN+KzbsIErg7wh3L1FZacEnQIvQdAfBho4CRKtgu?=
 =?iso-8859-1?Q?6o3HEDJXYxta3LX4C3n9OWdDdteGxPf2fxOr3Vwf+G5G+44tkwRBXk+trc?=
 =?iso-8859-1?Q?qX9stYA/D92lPvyZuWJ0PDxbpWF6ztfUM+GkCAe1CdDQBIezIZ/WGVE0eu?=
 =?iso-8859-1?Q?9oqM5b+oqoCaWlKob63ZeirCkmIQhcav7gTlWy3a6J2kjQhUpIdV5VVrjg?=
 =?iso-8859-1?Q?XltFN1GBU5vC3/XYcLIFPWMws5Hme28wY9OPE1nky0sPYPmJMI26qc5fID?=
 =?iso-8859-1?Q?8j5bNGz171T8fe3NmIW94PcteslIi6QU1J8mKmfh+QO9xZZB13Zmj6/a9/?=
 =?iso-8859-1?Q?BYKHXyLlbOWW/iw5zbcRrUzJCf5PCy24oW4wWLNoriSEx7/bf8PNW8v9Sr?=
 =?iso-8859-1?Q?ie6R/y3laKyt4q06C44GBw9LWUKr4rSo9Yqw7PsqNdSC90oKZJge1IseW3?=
 =?iso-8859-1?Q?q70VAhK1oEm/XDLH/uvsbZgBDph9/bW6MzqBckoJDXgFvfwuzopda/ZgbO?=
 =?iso-8859-1?Q?Q/HPZPCSAvAW2a0cK34Sdh1UdUypigDVUYp5nZuqyv9akWDq50PELw+TW9?=
 =?iso-8859-1?Q?HKWo5VrV8hpp0XMloytKJLNKx18zmpS13IZDaEyjkl/es8ZJ1VYHAM/OVj?=
 =?iso-8859-1?Q?uKygdTjI8YAHX4IU8Rg087Jp1VkeTb9l0toseUING7uPx3kdUDA39IKs34?=
 =?iso-8859-1?Q?n8xxyTwx8x5ccgXKBlNtCe9lxhP3QazAH3oXeHhXPc+JSvkm3AvUv5Z6N3?=
 =?iso-8859-1?Q?SUpTZpQR1BiQCJ0jN0r64vWDADlQZvpW3iUYkAaiYGEShxLcMZGaYX/UZ3?=
 =?iso-8859-1?Q?QkxtisHGvJA4LWcRiTwQoKZl7DcdwT1hQ0Nv0v6FhAgD5UF/UXvbSDBXwE?=
 =?iso-8859-1?Q?EgXhDkpY54rUjnvpS85JowuCIVjfLni06Epyuvy8iEvxQBJgTMG+QQgPiu?=
 =?iso-8859-1?Q?v97xH4EzNqcife/kXbtuXKv54VvBhQ1o9A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7ad774-d175-4043-5f16-08dc02352c46
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 14:57:38.0381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5CPGdMpgGXHH2az64yHUJfpST6FYR4amk1t6pjdTgq2Zc2vaibGAtPoxNmaiNmAa+8e8joAMYA06XYZ6aW3xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7874

On Thu, Dec 21, 2023 at 10:14:16PM +0800, yuan linyu wrote:
> 
> On 2023/12/21 00:02, Frank Li wrote:
> >>> Some UDC driver use gadget_check_config() and match_ep() to allocate EP
> >>> internal fifo memory resource, if only pass download full speed EP.
> >> Could you share  the detail of problem ? do you mean find another different endpoint compared
> > The problem is little bit complex. I try to use simple words.
> >
> > The background:
> >
> > Generally, UDC have some EP<0..15> and have some internal memory as FIFO.
> > for example 16K.  You can simple assign EP<n> to 1K memory, which can hold
> > whole package.
> >
> > But for UVC, some controller required internal FIFO hold whole frame data
> >
> > (mult+1) * (MaxBurst +1) * wPackageSize.
> >
> > For most case,  not every gadget use all 16 EPs. So you can assgin more
> > memory into one EP, so it will reduce bus 'ping' package number and reduce
> > NACK to improve transfer speed.
> >
> > The problem:
> > pass fs_stream to udc driver, udc driver's check_config function will see
> > mult and maxburst is 0. so only reserve 1K for ISO EP, but when try to 
> > enable EP,  mult is 2, so there are not enough internal memory for it
> > because more memory already assign to other EPs.
> >
> > Ideally, when gadget frame work can call check_config again when know
> > usb speed, but it is not easy to fix it.
> >
> > Simple method use ss_stream_ep here and other function drviers. Super
> > speed's package size is bigger than high/full speed. If resource can
> > support super speed, it can support high/full speed.
> 
> 
> I don't find any difference of uvc_ss_streaming_ep, uvc_hs_streaming_ep, uvc_fs_streaming_ep
> 
> descriptors. how difference happen in UDC ?

	uvc_hs_streaming_ep.wMaxPacketSize =                                                        
                cpu_to_le16(max_packet_size | ((max_packet_mult - 1) << 11));

Hight speed will use bit [12:11] as mult

	uvc_ss_streaming_comp.bmAttributes = max_packet_mult - 1;                                   
        uvc_ss_streaming_comp.bMaxBurst = opts->streaming_maxburst;

ss will pass down uvc_ss_streaming_comp descriptor, which have bMaxBurst
and mult information.


Frank

> 
> 
> >
> >
> > /**
> >  * gadget_is_superspeed() - return true if the hardware handles superspeed
> >  * @g: controller that might support superspeed
> >  */
> >
> > @max_speed: Highest speed the driver handles
> >
> > And according to gadget_is_superspeed() define, it indicate if udc
> > controller support supersped, not link speed. 
> >
> > Orignial code is correct. If UDC support superspeed, then use ss_stream_ep.
> >
> > becasue superspeed is worse case compared as high and full speed.
> >
> > So I think original is correct.
> >
> > Frank.
> >
> >
> 

