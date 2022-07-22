Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9605657DB14
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 09:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbiGVHRn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 03:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbiGVHRb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 03:17:31 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20724.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::724])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20432972CA;
        Fri, 22 Jul 2022 00:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTxbmR++8frqPyrQAkvWAvFe1EFlN6s/n3wwJ6EeIp4snIa9W5yAG5Mv+/d7E5t8Cv75/S2vQb9fNQw8TQH77Miyog1Du4LwaUN6e27+VQxVqxeRDxLxrohGtxDGY8d3BfbKNEFTiVm640rawwaYtdT7gJAkhirfXdWcx7TiD2ILi+y7e/+/KQtsDOzdTsJoU1shLf+ThYz32sNyXhBTzv46ZZO/RNRLeragtPWNSXdfoEgxckWAMvF6Tckec//RYofuycYYi0DaiMb0ThAJDCdnorg/hTeFcyZa/PK/p2fMFmLqai+jc+Yexbv/VpIwmK7O4A2gJbKMvzz+0fBBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUhvJj1VIfL0h/FY5Qrrl5Ke88lYdeRdJ7RRjogOuLo=;
 b=KwCPyRDJJiIZci+hXJtnZBFoMOKwlcJgtC5W2DVJhs5r9NIN3hccojzdeWKBMMYHAplXe1hFTYccIT6QqN4MGM6Dv1adXYwGHJimsmR14rdP6vzE3QZkWtla4ZuKL/KB0SVcIHjKWehl8lotD7MUpRTHFcZ09bJuykwjPGtSFyTPDR5dfgMRERqIo5/KsdVHO4lpX6yMEVKkfd4S9U+ZAau+gWtzuGXk95/DxsqqIy87LtHEmOD3/KqI95mhpd7FaQEwSHXj7+wWA4OouNKVtkk54c62nr8eWfSsshwcbBJN5zXtQb8tMzv2um7s222irf26Zh+VEQSY8iwKGeI1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUhvJj1VIfL0h/FY5Qrrl5Ke88lYdeRdJ7RRjogOuLo=;
 b=xCDG+LU6zdeKQTute3gyeyVKTFzeZoUX2m46W/cs6XEec9oEBOlnbh76P75nJAUD/XcGvimXK73o+IH4sLlsq1+mk8+y29XakML7o5o5m0/qY3sNdv5r4zgQuXNbs/dTSkoyxpbs1i1G4BPzhSJVn5jkLK+/ls3IpKriopKcnS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by DM5PR04MB0218.namprd04.prod.outlook.com (2603:10b6:3:77::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Fri, 22 Jul 2022 07:16:27 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b%6]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 07:16:27 +0000
Date:   Fri, 22 Jul 2022 15:16:22 +0800
From:   Xin Ji <xji@analogixsemi.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: anx7411: fix error checking in
 anx7411_get_gpio_irq()
Message-ID: <20220722071622.GB2853704@anxtwsw-Precision-3640-Tower>
References: <YtpC5s4/AD8vFz+X@kili>
 <YtpDs8VsWIbl/Smd@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtpDs8VsWIbl/Smd@kili>
X-ClientProxiedBy: TY2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:404:a6::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 177574b8-5fa6-4c95-0f15-08da6bb217c5
X-MS-TrafficTypeDiagnostic: DM5PR04MB0218:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s3XWNQUf4ssBwRAm8xsmtyYVmQPjq1NOull8nvDO3EUBNWeeEtTR+7jMGwg1vs2ItBQvWZQCY+9gPDWUu53M7OcSdpDdelbfiDg7eAaqpOlS/HcZf90dcLNCn6EoNhYFDE3lCQ7QEZZrDN/eKrdsOMl4E+sQ5pS7k0aYKods3pxX3MbqOj+a6H10/q+FtBaODEtGQvaKYTvcRA2dnwiruoVztnWr8YlmOXs5XMV8PfYgPPjh4aBsSIAbWv9IWeIe2F9wYF12G29FfFIf3w+4JqKzdFDsCOnG/orJhSiUBPM68da4BD6VyT85ZDpvDcVrXcWTtvS8GN790MOR2sdyzp/8lZDudPFxaC85nK/MljnRJGcp0OPPmrjmufGU3kcFdR2c0gCgPs2ICqhieIm2G99obdanq6WexeffcKfKMIF0J7F9x7O5MmkROeGvy7DIRAy+0dCKDQDpR0DTAYIk7fy63rRx+YT9gl8Zh78+Zo6/mEpbeh+QRLYrNhyDr2qumnGGZUsnkg6vKb2IgclseBjxiCxlYot6GTEM6WEw6SdBeJv+6JXEyi2JlDj/WSkgVqS0DNCZ82kAelkamySKwByRBsqPKX5NX4ggHOivcyhZ+NARXYJonvUe8AILBBiBmFzd3l0T5EJibJPkiZYCSRfmeQTO6u5Da34ecf5Ze3pB0KsoWP2DQv+RuNb06Rxi+347nl1CeH+VJ0LX9QIvtLIJUiuTvdsBuT2JR+wO8ujJVRcGhLN6LVhlimr8gZbf1xhiuXvBsvJ9MmwNPHeIvko/wsUL8BaNUWxaqgc9J9xqa4FysQSQgKB77eOARUsv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6739.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(346002)(376002)(136003)(39850400004)(366004)(84040400005)(33656002)(6666004)(6916009)(5660300002)(8936002)(316002)(86362001)(66476007)(2906002)(38350700002)(38100700002)(41300700001)(33716001)(8676002)(6512007)(478600001)(66946007)(6486002)(9686003)(4326008)(6506007)(52116002)(186003)(54906003)(83380400001)(26005)(1076003)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hmIWvvX1O2hihe+XBLugZwpb9028XuGtV6KOQmrPOGMXdP7I4aTAZ0doV8Mw?=
 =?us-ascii?Q?jbwNXVNL/gM3sNB5znGbdLyaPJAATrzbwLSX2dn1Cu/hXtnnQDYIM/3iofO9?=
 =?us-ascii?Q?xavl4E/K0yaYnrMX2KABgQ0bfvLkBKGw9SZERBUu2kLSr1p7z4dei2b8UVpZ?=
 =?us-ascii?Q?6V+mA4Yx5MCKgwcJb2cSVPRT3wOzirqqZ3xXxGclEUT/y1uZwrJRPj5fDo1z?=
 =?us-ascii?Q?IK4C7/k9HIvBS1Avg75JMWgpjTxwO1A7b0bNyvyODy0UeOINAUyUE3jJlm39?=
 =?us-ascii?Q?yBcEH7EN9wm5KyNA6xTZHGxgwuBXO/i1GfAOwSHvgnUZwLRvU+yvnBTkuJRe?=
 =?us-ascii?Q?PLPWJDFXSKVHKmc5+mUfbs+IWNSsdmpvaKPx3XFHQPwWz+8WgDWK8Idzg261?=
 =?us-ascii?Q?dDHdu5ZSRre4wjfYEyVl+ubM425eVrb3xaP6K1LsWPi94nU1/djeiyPcLm6j?=
 =?us-ascii?Q?TN2rX9168B+Zke/VmBOmVrqLBj+BDFzrjUo/daT9y0wMhy3ernG0GZgV/cSn?=
 =?us-ascii?Q?hR26aP9FCM6R6B3NmL0lOnidKYVZignJcapWIA7pWqRqzWQK1TqzAk1Zj41m?=
 =?us-ascii?Q?36ZFntCXDOGQtdD2IM1CcdzWNebqIoND6tw7FZlU1+b8yCBve03VebZhdDcg?=
 =?us-ascii?Q?xWAenM0x/TWJ5DJU58QROVPTmujguKDKQNNZfRRU6Q6SkH6lo4o3T9a6lerG?=
 =?us-ascii?Q?xEomx8xfY4715hCKhdMWBlNN75WEToDT5glFGZbNoqKiwwzGvDrdRxjNsfkw?=
 =?us-ascii?Q?/p0sFWfsLMX5NvBq/LKV01yFOH6EdpvEDbhF7w1YCStCtB082ZgJ/P86QIxX?=
 =?us-ascii?Q?7OgsIWdjXvwdoOVnKgEf+DDvxF2aIDxqWcS868t9syAb1TZy232zelj3Sv0s?=
 =?us-ascii?Q?qiFj9HpokEia87ZkZcit1VM8vYVZZw9ecH0QygkCXDnB8QGo79uY1kPv3LVB?=
 =?us-ascii?Q?skdXbh3nbyJtv/47O6K0oGE0hprnxAtijygIMq4b+xo5/pJAini00TWqn12U?=
 =?us-ascii?Q?kmcdkT8R6XfLKXA4awH4+TUQfnj1qbO8bG/Mp3afavEs4daEOuQI9NOmqfkb?=
 =?us-ascii?Q?c47i8g1ngr3lV4MzjYOSwNbF0OvAby/IUNeyFcw/EbQzlCmsa3W6AZTYopzv?=
 =?us-ascii?Q?G3CPrfESSM2PA2f+zqSxxqAmeDXAMStIsmpJiaWtliQ/H0luCiVZnwXWw9dd?=
 =?us-ascii?Q?QxRnhi3kOIQmE4bfxgojnJThLbHFxIS5Psx8K8/O4mDYFGEo/7aGDdc8Wgon?=
 =?us-ascii?Q?kG5JwdX4ErBmaBgzEIZ338GmzSscX+9RDnQpLEXh5SWdDQW+ljMBO+80uLBF?=
 =?us-ascii?Q?dHX33qoKgp1hSwAtFA7pgoiWoIN9GSXzTyz9HLkoLgiWm/03TaliL3qctgjL?=
 =?us-ascii?Q?/liHcWHA0OvxsIHPxZydJji48wiWHtdMe0BYGgYG4aSxreJZGFwXR8RUCp2w?=
 =?us-ascii?Q?RkzShIQazvmwnI7u8hdsPDAtPWJVpxoI30oH7wjKxhw+aXrOLe8jEmACJSUN?=
 =?us-ascii?Q?2R159Zd0flEa7/xT12giBfg8BfkD2sAr88RL3FlH+g4nFYcHcW8luCaz3E33?=
 =?us-ascii?Q?sFlGZuFL8eZHPmI7oTrnlHwKGTI7JUk2K2HcMvMB?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 177574b8-5fa6-4c95-0f15-08da6bb217c5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 07:16:27.4894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maWnzlK1LsgnYd7ZNhnGaWrdIwgeK1Ff76uhixbtE2fjpLn7NchoXwJX7qWQBIrH95zVOBUgomf5SJ22cS9eMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0218
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 22, 2022 at 09:29:07AM +0300, Dan Carpenter wrote:
> This is a minor bug which means that certain error messages are not
> printed.
> 
> The devm_gpiod_get_optional() function can return either error pointers
> or NULL.  It returns error pointers if there is an allocation failure,
> or a similar issue.  It returns NULL if no GPIO was assigned to the
> requested function.  Print an error in either case.
> 
> The gpiod_to_irq() function never returns zero.  It either returns
> a positive IRQ number or a negative error code.
Hi Dan Carpenter, thanks for your patch.

Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin

> 
> Fixes: fe6d8a9c8e64 ("usb: typec: anx7411: Add Analogix PD ANX7411 support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/anx7411.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 4f7a5cc968d0..311b56aaea9f 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1326,13 +1326,13 @@ static void anx7411_get_gpio_irq(struct anx7411_data *ctx)
>  	struct device *dev = &ctx->tcpc_client->dev;
>  
>  	ctx->intp_gpiod = devm_gpiod_get_optional(dev, "interrupt", GPIOD_IN);
> -	if (!ctx->intp_gpiod) {
> +	if (IS_ERR_OR_NULL(ctx->intp_gpiod)) {
>  		dev_err(dev, "no interrupt gpio property\n");
>  		return;
>  	}
>  
>  	ctx->intp_irq = gpiod_to_irq(ctx->intp_gpiod);
> -	if (!ctx->intp_irq)
> +	if (ctx->intp_irq < 0)
>  		dev_err(dev, "failed to get GPIO IRQ\n");
>  }
>  
> -- 
> 2.35.1
