Return-Path: <linux-usb+bounces-4430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003E81A3AC
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 17:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59E14B265FA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 16:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F4E47F4A;
	Wed, 20 Dec 2023 16:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="P03vpEpk"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2070.outbound.protection.outlook.com [40.107.8.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDEA481B0
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oW12offl89wvLJTBK7WWNgo0CWB7hixAsL20Dkgh5MOSxWRZ7D8R/bBC8Fb1iMHD5Jy50Em9IZWAZFondFglMB05nam3v5N3PyH0EEtq21LH4NbDOQZxS0HK8d7fMY60nOUu4dXsG7NdGvnyeMhjQnWkuOQ+vc9QMLZVY5p0xYELeGsoCfszbj/tbJSFdeVIWJ2+8i3FWSB2bxu9Y4G3KTz+o8imXVHK8IiXZ7fR9QEb0D6AuRgSPge+9+4NPhzEBmcepCFHk1c5a7/bns1YOw9uhTknVfkElWAtvbutZy+szbztlvKlqOErYe2xKnk7/4ShAYBzUQx5/DFeJsXD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu6sLlSG7sx7Izjhe/Ixy3RttsgcaJBeJOVn3/sB/tM=;
 b=ScrQmNbnY3RaP+BqpmpfyLWy1nKdZc1oXMsIkt7YQjH22U/NOvs5FOcYgb8cvwjuFPdFloQzi3OFaM13Brw3gx5FEPV9pgrcAFSTNC7uUqex3cqLbU7QdY1IVJxesZjYKnMXKD7w66cqqqYg1NA/BANm6kDYeUrMqlA6SazKyhgj48xfLmJM/GMBlKRzD3JNZL5NlkbAWSNLLutgoq5p7zeB0vZrCdCX4U9NbZpDORTjI0zQxE5qYnJOp8dsm2BL+8XTVSAS6tjX1GMdlWC6/YaRtqemRPdD8RBE33jbdHydme/D2pfBZ/mS7KWlsUTNC++x9wNTnBvr21L3Dv1seQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zu6sLlSG7sx7Izjhe/Ixy3RttsgcaJBeJOVn3/sB/tM=;
 b=P03vpEpkvrehFN/3mBMSEsym8ctLRNE1uaTQnKZTdw2M1Po6RljrTXbod/NTAeW+GIwuXmmDatIlAeL7B8VkUufK9cBZgOhHEwLT0DYaPw/BfA6nnYmXd0n6kW/6+J+BBFbZObzNBnBP56/7GUudaairerXwU91orq0VtY7hG3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 16:02:28 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%7]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 16:02:28 +0000
Date: Wed, 20 Dec 2023 11:02:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: yuan linyu <cugyly@163.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/7] usb: gadget: f_uvc: change endpoint allocation in
 uvc_function_bind()
Message-ID: <ZYMQDVU+c+gEQjE9@lizhi-Precision-Tower-5810>
References: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
 <20230803091053.9714-4-quic_linyyuan@quicinc.com>
 <ZYHCESCO4EXPQbFY@lizhi-Precision-Tower-5810>
 <b793b44e-ce40-4f03-808a-8606970cb2e6@163.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b793b44e-ce40-4f03-808a-8606970cb2e6@163.com>
X-ClientProxiedBy: PH0PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:510:5::31) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DB8PR04MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 7802353a-22c8-4810-b64c-08dc01751070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ce6+W+yunf6rZtMUWOPRuxL/30dXHZrwpsmTFhRhMD+JQhgqs9ZPWimCnXYIMyKEtAvxX+0xhWzKzqOwlPyO0Bz3a6qwXfIr7eJO9IhuZtXlcrXmDou2mFGdFrxlsTu77/K7eW9kvr0MTrImN1f6SpNC76Po5/yKiBKOjqrKdufJwRbHcJPxIwIu/KK1LFJz580Mxq8V946Clyd6xl7VMX5dJNmhg13d4A6Z+WwSUyBLtTq1hEFp0eJXmLHyJ5V0O2TFO9OyWs0Xvy/wHphVmOhMSDq2iLb08E2Qpxte8NZlxBufuVcF/zebOs7K16M8nH6Zow5YAygTYXiJQXeX/DS+qq907xU2vbX+pL8BiFmUUxwiS5fVjFYfvvdnj7PwZ3xEqMvJCFhI5okR+pVootWmypFjy9quSWv6IZU2gN8psfufk47dwPxtXcf3/TSgRk8TT9hgufkUV6WqQWNfu4SSilC67r4ERn1ae8MaslSHCRe/ZZZGF+tI9yw9DeZpIGAalnAXUOCK9Go0rF7rW8NpAM1ulQKs1kEnSZJkPmxhaPMqrWwCJTF/+TdtJVA8ktOaPCGnC9hZZL4lAmriYEWCnHU5PYYJq4cdcAFaE+UsOx/Gtpx1cwyoTqzyIUf1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8936002)(8676002)(4326008)(2906002)(53546011)(6666004)(9686003)(6506007)(6512007)(478600001)(66476007)(66556008)(66946007)(5660300002)(52116002)(316002)(6916009)(66899024)(33716001)(6486002)(41300700001)(38100700002)(86362001)(38350700005)(26005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9RdCKHkMlePJ+PGTuVqBmoQYaKsLAQeYuR68WNKMx6UpP8ZZtBK4Lp4pY3?=
 =?iso-8859-1?Q?4eHFiilJl4nVkKY+x5tCHq/hwGbawDR5KRCFALink0ME0bQk+0cItQPXia?=
 =?iso-8859-1?Q?EqdzygNinBdWM1cJ8zHncDofGDi+0/sZ7ABKrM3dJ4/ohLrymTajrMIhMD?=
 =?iso-8859-1?Q?LbVQN/EEWUgYyELAmjhMdKga1GDeDncLZV6EjrSeR8Fml4jNaWcBXdAHuB?=
 =?iso-8859-1?Q?fblIGvNumzgaRB6xuqLWJarZ+/s8ZWDxpDNdmNxaaP6+qVbuYAON3cKocV?=
 =?iso-8859-1?Q?HkILRC2Kigg8upA0rDBIltph37fSgCV0VTUrW7FrTMV2mzDp/lZGpWTZ7d?=
 =?iso-8859-1?Q?8T2UbGc73m6buCYg69lBIvH90jZuD68hBj7KDBey1ubcN+h2rbhcc6kjC8?=
 =?iso-8859-1?Q?5k4YVpER3pVn1Yi2Ya7dkzAQ0h4WjCpXuJckrAg6vcYNHbiwScTk2JHuod?=
 =?iso-8859-1?Q?FItwpN7qPYprREkPyi5TQ2IABHHW7lKLAMJAIxJihiDH6JUI7AALWO6vqD?=
 =?iso-8859-1?Q?QQO/l0vynSWR/eD1GzKjebDL4JdIFSU7sJKmOjknetjZORYOFbZFLH2lzg?=
 =?iso-8859-1?Q?a35zPkDioI9vUN4s9IOWJuSzd9BEl+R23iPX7aBeB/+3kFero0LmXm5LfO?=
 =?iso-8859-1?Q?mtmmc+7RpVoTpETOMo0lnAZU1ELBTpm5dyAuHvDDM6MGfQYiDOSo2Idwo7?=
 =?iso-8859-1?Q?TASEfqfkfrNGpjpEJc2URAh0F5KMg0fJ8vfztD0ilQOeMZ8zDvnJJceJjC?=
 =?iso-8859-1?Q?21F0+Q9gWOVWS7/rJ4R2u7Xs7N3C4UAB+flcRYSZYZBBmVcKSunv3ATuqp?=
 =?iso-8859-1?Q?uhCtAnJHkihEa3bnOM7xNKeYKCdrQjLfsUhhyfcPnrBG+jBTvQ9t9ycoLI?=
 =?iso-8859-1?Q?8Zqflei/4P/OgiwZYY7orO/ocIn6tMyyq9GuTWMqZ8zyJEMjSSTO9Gm3YH?=
 =?iso-8859-1?Q?Cz4Bfss/rYdTq3TGs0CbknrxOiy76v0w9EjUzC3th+N3E/qSGGVQQJyBQf?=
 =?iso-8859-1?Q?xYQNiGIySzT2QgawKQJfxxeafCoqKU1iPL+kvjAd6dNzA6cB9omhcqLMH8?=
 =?iso-8859-1?Q?y7Ky5gGN5ZlDNSAs92Nf2FUgC5PfEkpfqqHqHFG3gAYRvb2m5lHXGDJH/U?=
 =?iso-8859-1?Q?55McrvVbrO5MV+83RLr5Xq+P8OowJVIGp2+cGqHSWiRVdTq2wEl8pwSsjK?=
 =?iso-8859-1?Q?QBLKxnihoEdZBEVSdF5GXDeB9BDnPTJevw8aW3TAKHJ3ZQMGuX2E6lfAqR?=
 =?iso-8859-1?Q?cezy2OdEugEvoT+E0PW5n8g3nFK74fyL3Y5Gro/pXgkU75rhXPNKHnhI9N?=
 =?iso-8859-1?Q?fu4NVcTZX/rakw3ybvHU1PFZc6yoY85vhxkHQCuS70G/rIwz2hbHx637c3?=
 =?iso-8859-1?Q?AAsFYY211BqBpAfGG5RSg8rSOhEHmH74Fa5dgKIW1HrwACsiH+jqQaIFQG?=
 =?iso-8859-1?Q?AolcwvrT0InY46KJ3Gi5e+fIXNd+AvExBwiomxy2FEYOBXvYMZZK1PSM5y?=
 =?iso-8859-1?Q?3sc/LNPCJu5tGJiCsR89BzlETynXqTfy49KFZRPO2lmAF1WBfkP2sF8Lfi?=
 =?iso-8859-1?Q?6M1ZLHWdJfDcdn0eMawL8kgMq7p5m2F3Xv11+JgCrn7dG3cf/W8z2tAzeT?=
 =?iso-8859-1?Q?+Qrh1rDq/PUQo=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7802353a-22c8-4810-b64c-08dc01751070
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:02:28.0316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cGmPkc/DEhI4gIpifNe24ueiUfsZrsQdsSXizdbTPqTu6yOc6WIak8FBnNSuMLO1u48whL3EsgQAOf4OfEPrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7162

On Wed, Dec 20, 2023 at 10:33:17PM +0800, yuan linyu wrote:
> 
> On 2023/12/20 00:17, Frank Li wrote:
> > On Thu, Aug 03, 2023 at 05:10:49PM +0800, Linyu Yuan wrote:
> >> when call uvc_function_bind(), gadget still have no connection speed,
> >> just follow other gadget function, use fs endpoint descriptor to allocate
> >> a video endpoint, remove gadget_is_{super|dual}speed() API call.
> >>
> >> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> >> ---
> >> v2: no change
> >>
> >>  drivers/usb/gadget/function/f_uvc.c | 10 +---------
> >>  1 file changed, 1 insertion(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> >> index 5e919fb65833..c8e149f8315f 100644
> >> --- a/drivers/usb/gadget/function/f_uvc.c
> >> +++ b/drivers/usb/gadget/function/f_uvc.c
> >> @@ -719,21 +719,13 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
> >>  	}
> >>  	uvc->enable_interrupt_ep = opts->enable_interrupt_ep;
> >>  
> >> -	if (gadget_is_superspeed(c->cdev->gadget))
> >> -		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
> >> -					  &uvc_ss_streaming_comp);
> >> -	else if (gadget_is_dualspeed(cdev->gadget))
> >> -		ep = usb_ep_autoconfig(cdev->gadget, &uvc_hs_streaming_ep);
> >> -	else
> >> -		ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
> >> -
> >> +	ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
> > Some UDC driver use gadget_check_config() and match_ep() to allocate EP
> > internal fifo memory resource, if only pass download full speed EP.
> Could you share  the detail of problem ? do you mean find another different endpoint compared

The problem is little bit complex. I try to use simple words.

The background:

Generally, UDC have some EP<0..15> and have some internal memory as FIFO.
for example 16K.  You can simple assign EP<n> to 1K memory, which can hold
whole package.

But for UVC, some controller required internal FIFO hold whole frame data

(mult+1) * (MaxBurst +1) * wPackageSize.

For most case,  not every gadget use all 16 EPs. So you can assgin more
memory into one EP, so it will reduce bus 'ping' package number and reduce
NACK to improve transfer speed.

The problem:
pass fs_stream to udc driver, udc driver's check_config function will see
mult and maxburst is 0. so only reserve 1K for ISO EP, but when try to 
enable EP,  mult is 2, so there are not enough internal memory for it
because more memory already assign to other EPs.

Ideally, when gadget frame work can call check_config again when know
usb speed, but it is not easy to fix it.

Simple method use ss_stream_ep here and other function drviers. Super
speed's package size is bigger than high/full speed. If resource can
support super speed, it can support high/full speed.


/**
 * gadget_is_superspeed() - return true if the hardware handles superspeed
 * @g: controller that might support superspeed
 */

@max_speed: Highest speed the driver handles

And according to gadget_is_superspeed() define, it indicate if udc
controller support supersped, not link speed. 

Orignial code is correct. If UDC support superspeed, then use ss_stream_ep.

becasue superspeed is worse case compared as high and full speed.

So I think original is correct.

Frank.

> 
> with change before?
> 
> 
> >From my understanding, according to configfs gadget driver design, when find a endpoint, there is no
> 
> working speed, this means each hardware endpoint should support all possible speeds.
> >
> > UDC will allocate too much internal memory to each EP. It may failure when
> > use ss config. Generally, ss config have bigger max package size.
> is there another way to solve your issue in your driver ?


> >
> > Frank
> >
> >>  	if (!ep) {
> >>  		uvcg_info(f, "Unable to allocate streaming EP\n");
> >>  		goto error;
> >>  	}
> >>  	uvc->video.ep = ep;
> >>  
> >> -	uvc_fs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
> >>  	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
> >>  	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
> >>  
> >> -- 
> >> 2.17.1
> >>
> 

