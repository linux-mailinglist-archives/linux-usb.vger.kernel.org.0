Return-Path: <linux-usb+bounces-4355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8983818C05
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 17:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802AB287B15
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 16:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D520C1D522;
	Tue, 19 Dec 2023 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VfAinVDw"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ECE208B0
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr2olx8Zkps2ouQktbW30A/ZLl61dXHDY9ge1hr9YEpbqYCF2pnonYsya5CGfw5G2qv+lvnZC2o68CoxmhpLgUyZ/f+/u78N/MSzUJJ2sZd6iNjv55qTQC0v+zSGXPOVFQZ6PdgNtM2v5qiHF5C2rtUIyyZiAYQ7aZa+FKKGWxe0o4JTqG/dBLDOZBSPcKWLsbZ6YvxtG6QxuoAsaJvHELsUrAibU9y7LlL6o5+jD38CWQBm+JKbBGprQ2lbIuOGDloqBYhtjYmNV3FOTNvkTmypaMyp5are3kKsyw4cifxU8++P1lIokWBdvS8tV2eDRa03LZ+ZUAoTSnzuBN3Hfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsmW7ls7E6FxqoFLHPGQAgqDzviM50FoY8CkbCKFoHE=;
 b=O/J2H0gMcaePmd5V7Vve+aKscrXst9MEGzdPiRddqLA/xQAnVV5hjVGa4ifSR1cQCDLpHtLGfC0Xu9ZBNnVokg5TW5eEhsK5jsBJZVG6jnMgrkDbAem5Arn2M2SQ1EbsDP6tRW7uJ+Nn8RpuMsy84bB8IbRwa9BgaV+U6G0SwMc+rjmN/m0geRx6p843bT8UdsKUc6EIIV6pPgC5zNS/NqavFCR5ZrRNKk87b7qxZsyAaUWn+qWDenMSKTuCIep8qagn9QlRbHyErw6EOL5GJREJs/iHlCZFB0OcozIZfsBn4C76PhjFqFzwkUF5ghG0s9PmuzSCldSk4C6fv+6UTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsmW7ls7E6FxqoFLHPGQAgqDzviM50FoY8CkbCKFoHE=;
 b=VfAinVDwMfiK3w/6IdfgyLCMZOyxJoW5hx4LCXHV5I2ID2CWT+Wk0iCGblxq1yxZJFGRXWzCNGvdJCcloCq2NZ66NNgHOBpaUVshbLHooObthLRIbWQUbDxTfKB3wJkAN9ELCqtTJ0KXOaMfNG4EVpGaWfNNqqm49mRIp+Xh94c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 16:17:28 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 16:17:28 +0000
Date: Tue, 19 Dec 2023 11:17:21 -0500
From: Frank Li <Frank.li@nxp.com>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/7] usb: gadget: f_uvc: change endpoint allocation in
 uvc_function_bind()
Message-ID: <ZYHCESCO4EXPQbFY@lizhi-Precision-Tower-5810>
References: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
 <20230803091053.9714-4-quic_linyyuan@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803091053.9714-4-quic_linyyuan@quicinc.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: 492307c5-421f-4e49-fc69-08dc00adfe42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IkD6VPg6ylVexr93rWJcs3aqxcplIqeYr5KH2AEN3es6Nw176fZ2Eonvi8jpyTTOFg7nuwR3gwZGjHqAQOrhXMXKxWlWXMkIbQLQGeaKSQD0zs2NelyvtGSoOn2fLi9rvm4bDe2fIWzS29uoWANhpBu56eXw12pA8qlnF3LUk4diGtRZs6h//G4zN3a9pzhaSTCNjvSSGypmd0wcZTqwHoF5FIQctodMLDZpOzKmjHBZRwhYWO0grevd+VCJ83hO0O9A6ZFpyCt1Wmgn64Fw7ynLiQxPaJGhjjqIqKlRs5XCzyw2RB3CrMDkf2DpvDGnHyJNMW79+lYPaLPE4poJOBC4ji09siT3ALyHCeYvhWiZS97SDn1dl4FOAObsHjMLQNaC3FEn5lLu8aDA//oiD8agMWdbMD4Nxg8gkBMv/9HV7rVBflxgpg9JUvSHOu//Dz++mIaLohnbFaDDvtvF6WOD9ysuw/eHF9+tjgz6ln63HKHP/lQCxDLcqNfzzl7h8BOBAvfsGkrJeAqsdnhPXa0eS4IHxg8MtZxf6a6DdveX6qEzoox9HSrDSALRCYrdGkbI8Fo/TRgaGp4FbPA+IfcdpqMI0V/1DsG2cUmqQgtL+G0fyrYC3lCu7kVD4nNJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(8936002)(8676002)(4326008)(6512007)(9686003)(6666004)(6506007)(52116002)(6916009)(83380400001)(316002)(5660300002)(66556008)(66946007)(66476007)(33716001)(38100700002)(478600001)(6486002)(26005)(41300700001)(86362001)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oB9/23l+G9/KQpaGBJcT84O0qZmTwzKGnSm5A9RvNOBT6K1vj0eL5qSs4pz1?=
 =?us-ascii?Q?PbMqcdm9v9zgUVUjO1dp9nXbSb7nJD1IP92+CdUpeAI9ah1P8XLjMxFJ3g/e?=
 =?us-ascii?Q?XauuR0Brk+gge/mQxlqqoKw7eOZIthGXbnKq41HQNSj+8Ogw6Zc1zAeaqvWy?=
 =?us-ascii?Q?Gr84pKb3bsoaFR10fsENGU8CPKZnJxPFRB2+ZZeG/vfqjHSaS9AwsD3Jyisa?=
 =?us-ascii?Q?b9zcK36Cw348qe24T7yzKzKf58kzPfqMIWx0uNyK4E2fD7Cqqd4QGXER3hnm?=
 =?us-ascii?Q?IcmjSawBK6F1yL5TspnGu5q6oaQ+s+mm0n9rYIl7WKhlwpAYOcR0eUXLMxw5?=
 =?us-ascii?Q?Qn1ovLOqeFGzelBPgiiOc0fcZeRp6FIf0Qzl+T8qf7xZRE7zzHYhphE0mNRS?=
 =?us-ascii?Q?6DC/1p7EQT5eDuhJYPdeNPOPcLeRtKQtqCvF8EXJfvEL/xLcIr35OsmffO7E?=
 =?us-ascii?Q?/MAI/1m/KTvU5wtfzukpQ3tFwBrk1bZR0WCjg3MP28ojqkuvDv7DU2wcew6g?=
 =?us-ascii?Q?Ff4TywQ2Pxq9faUkbSq6SvTbn1LnOXDLidHRqKKcK6OsWjr5iygtlfWBtftl?=
 =?us-ascii?Q?qcIorWRSCIC7RuIkaPgkEksuk9GTgc4dTgiCOG0XwVZx2rb6EKOlTZgpm7os?=
 =?us-ascii?Q?LT/472ISBeZ8hC7cxDfKw/EYI/XkW3/hqnyfC94e8APov5Ue36nNsifWIvwK?=
 =?us-ascii?Q?RRqj5uc/c0WImgeBskzrpbrcmRNY9zGJyXuO5t390AFFZvbaW2rrDUn6ehiM?=
 =?us-ascii?Q?lmm+cEpdSmTMYT1XBFDytqwxT1gsPQbhGT5BuvBFIF4l87lmPCU5VoQfkKzX?=
 =?us-ascii?Q?5qmoDy3Vf3ywpQwm2jAeFQqyvZWmAH3Uv/VRWCloQJUBvZVG0FGFxR7Ke8pk?=
 =?us-ascii?Q?PU6FQzhJh94uBi9o9AiR8HDz8bxBB/dv8gkZpdAcP4oLkPxo8YHbApGCq2PS?=
 =?us-ascii?Q?MacAQdIvscbi5kJeBiW27b34oGtu7TYPpyoJturrTKJ/LmntZVXBrm31DM5/?=
 =?us-ascii?Q?gQX8XChzOlYSMqmMurwk8WYzfBZkG19uUeLGqlTcrpOGKj+6n9dTFM5tt2en?=
 =?us-ascii?Q?IGEIELElUAfufhus5y6G8asfN5ot9VHso1TwyDMKEtQ0B0i4ok/yn6Y0xzv1?=
 =?us-ascii?Q?tzmTsImXjtwKSnYy2zyk2eeYgIDDadSV23VODrH95JVFz1m81KiiAmLs00XE?=
 =?us-ascii?Q?FdsCHWgG9cFXA7jgssXMCUWswePMLvJlA8Rmy2wpTnduVdsF4aV8AzglwflT?=
 =?us-ascii?Q?FvogvDWGzLTXX+zN8V/8E5vSfd5+8hhtvB+l07RsLEmuBBDvf+zyHDZF6VIK?=
 =?us-ascii?Q?4veXftF30sWMKy3tl0YbxdeSlijIfyyrZIUoFWeY7Y/TAy74qnQ69aFT0VYq?=
 =?us-ascii?Q?bSPxBRF3ycTqLFUWIvC+rLfquvNrBf/GQK6h85l2EAu/4VRfyABsG0zuqoGV?=
 =?us-ascii?Q?b46bP/FbONQXIK+9C7jliatdtdmrYjFBn93vYUEyv+qiDXnF9mAD56x1W4mP?=
 =?us-ascii?Q?iXa+iKYskUguscYa1FZkM014aGAoHYh31oOfJH+8nZ1JxQoyrnveqwthE+oO?=
 =?us-ascii?Q?couej0IEOJzSSzBuaupKaAFyzB52NPMulLCNEUYA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492307c5-421f-4e49-fc69-08dc00adfe42
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:17:28.1003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2srdTfSlJzyZ+28//Kuzjx8XddIvsGlxtv9KpScdbC6R81zJepbfbGhpRJf5pHS2XnYcyyiSwRZNXd1i35slw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On Thu, Aug 03, 2023 at 05:10:49PM +0800, Linyu Yuan wrote:
> when call uvc_function_bind(), gadget still have no connection speed,
> just follow other gadget function, use fs endpoint descriptor to allocate
> a video endpoint, remove gadget_is_{super|dual}speed() API call.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: no change
> 
>  drivers/usb/gadget/function/f_uvc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 5e919fb65833..c8e149f8315f 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -719,21 +719,13 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>  	}
>  	uvc->enable_interrupt_ep = opts->enable_interrupt_ep;
>  
> -	if (gadget_is_superspeed(c->cdev->gadget))
> -		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
> -					  &uvc_ss_streaming_comp);
> -	else if (gadget_is_dualspeed(cdev->gadget))
> -		ep = usb_ep_autoconfig(cdev->gadget, &uvc_hs_streaming_ep);
> -	else
> -		ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
> -
> +	ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);

Some UDC driver use gadget_check_config() and match_ep() to allocate EP
internal fifo memory resource, if only pass download full speed EP.

UDC will allocate too much internal memory to each EP. It may failure when
use ss config. Generally, ss config have bigger max package size.

Frank

>  	if (!ep) {
>  		uvcg_info(f, "Unable to allocate streaming EP\n");
>  		goto error;
>  	}
>  	uvc->video.ep = ep;
>  
> -	uvc_fs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>  	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>  	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>  
> -- 
> 2.17.1
> 

