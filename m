Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D05E57DB24
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 09:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbiGVHSB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jul 2022 03:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbiGVHRk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jul 2022 03:17:40 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2128.outbound.protection.outlook.com [40.107.244.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F010BF34;
        Fri, 22 Jul 2022 00:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWquJ+D2Yb/GOTNxYCDQgSL7cv7MBhWjwN0WfjhPobMl6zkmNYXBPtsY03YCrukKOluznVar2SFgEileBiUCq3Fr8E54maNgUVBRn1zJeMsMJgZ/9334cYj4r+MygLtXCyVT/0opXsgv5ta66cHb5k5R47nJRTYCdE4q+Y9CfO9smDMeg+E4II3HDFbLS6MeSn5n0ltonRkj1Ms7CqgQlXyEICUpXrBfq+eBtydSiikXUU9XaV7CVgJnEyw/sHVGe+tXf6dg4GBxzikf0CPa4Malv1HX7Wtlwuk4RypB73rZQX1kCiuBNZpCS3fkvArX1zHqMJkVpHCembJtprwfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIS6L9rDXb2A56WeE3MeZ5eo/1lrdzHf65iHFjcFZxA=;
 b=DxzoyjMO7nYr+mYh43B84HAu5BNuC8iXwRbYEVzcY3WGUjQonpBrPRjFPQcJh0wDphQRH+iXnhryW1XJSmSjFkgA17BeoUn0j7dsCDjHUAESdn2TqSB8lPFt5XpCTXQoOMMWiB3QyI0MxKHlSrxzZkC1XapSlHdTnI3+svLLKefPTtIxVAiHAaltWxGJpzIn/sXvBss1IRd2ahRe51GXF4kaPqNVlaU9SiOXj0aoKYwk8cf/Eg/AGa5rTbd0SuVJvWi0Q4Seuy980K4MaYnPVXD+4AfiCc7ijvpNL2Noybp3JS0Qx8p6PnDwzSKDgqHuUs8dHT3VbElCOq0LWQxQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIS6L9rDXb2A56WeE3MeZ5eo/1lrdzHf65iHFjcFZxA=;
 b=POGz4ax8nO5aw83Rq0+v9Yo1Z3VrB6hVGg2yKRd7zdacck0kiuD3ds0yc0/Ut5IwMvgzzzPVKBNS95Zr7f7nOVX2rggOlIGuSss4bMPwiczN7ldWISvr1CszbgfxikN8Xp/LfvQ09EKqhq/dYSDg3s6RSW8im2tWLtNlO9QjVpQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by MN2PR04MB6143.namprd04.prod.outlook.com (2603:10b6:208:e6::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Fri, 22 Jul
 2022 07:17:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::f02d:f2e:cba9:223b%6]) with mapi id 15.20.5458.018; Fri, 22 Jul 2022
 07:17:34 +0000
Date:   Fri, 22 Jul 2022 15:17:29 +0800
From:   Xin Ji <xji@analogixsemi.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 3/3] usb: typec: anx7411: use semi-colons instead of
 commas
Message-ID: <20220722071729.GC2853704@anxtwsw-Precision-3640-Tower>
References: <YtpC5s4/AD8vFz+X@kili>
 <YtpD4MKBa43higNc@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtpD4MKBa43higNc@kili>
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7534adc7-def9-48fc-d4a7-08da6bb23f84
X-MS-TrafficTypeDiagnostic: MN2PR04MB6143:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NmkGCr+vVAJsbnNZBNZgBYGqQ428AmwCMlQZEs2hG2aT2z8iW+eZ4xSyk1TGA1PPC2F6Z98kEkroqSjEGTCJK9nIPPhhgeU4axksYxFBWkYNZpzDAzF+fguzXlyklKAe7PglDbTsx37KbAKKLB5h5MHrZwzmEWRsqkt9LhedQI8xNTS98KxQ4nyYhHd3LRAM/xJkzfGWtLPwZ9c5Tueg/HmttOxj+YxqP89ZesBmx4RQgDY70SGuiP9VrEzXZZVfd6Ab3fD6pViWnPl1kf6lII7KbC/Svbn8kc4fKoEsGdPpxR73rj1qhc48xIg0ZYIdfUaD0QSu8JbaF6SqQZR8K8IiP2+yP37ODgTKWb6qMnvu3iBJ0HxTrp7GRhKjxIZDUn4lZlR+0iNDjYV7v+q21+DzIzoVKO4KUlXyHSNyJXIFSdCXrybw057iv197oSwBF/SkVNY+R6XIyejCu1OqE+NtcE9aTM6hb37Q6M+3PPKfavPzcpLiiriA6pvhDBTmgqa+JayceFpH6nPzN0i1LIoI8X7iWm4FWe2Tl7rkhlPy5ywGRVSr4KjXX6K897wRZVka4nfgUwFL7ZqxNAHn/Drl0Y5/zTdW1RRvkdQFZcD4hsNgbTf4b0vVdKfHVLT4TQyQW51TgEjvtFg7NyMZwiy3i0xyqVy7W8BQADvzYKMlqrUMimMHLW8ZAtaNKWmmNSber+DQ0fuUHNmaSyCybfbdKYgNU5uRbzWS3mWcJuXI+PvI21xhV7Quur9QlalSA/e2dZdDVbxReoQB5fMXFZd4bozuJjSPDqlnjE2JVJZ6o/KDda7QHjAuY354OXWz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6739.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(396003)(136003)(376002)(346002)(39850400004)(52116002)(38100700002)(6486002)(38350700002)(5660300002)(86362001)(6506007)(1076003)(186003)(33716001)(54906003)(316002)(6916009)(2906002)(33656002)(83380400001)(66556008)(8676002)(66476007)(4326008)(8936002)(478600001)(26005)(9686003)(6512007)(66946007)(41300700001)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tloRGhc/hVa/bRJ24CXVsqh0gGLfDPuBD/0l4aq91aO3lzJUORz+LRvl2wVh?=
 =?us-ascii?Q?HJwtld84nrmrI7lJQZj+gFH/8QgWVjBis8hCFZrL/rOnF+PqPxpGEPU0kHur?=
 =?us-ascii?Q?BX50acq/yjcwNxSICZpMo2AV3+iZd+COeOJwMILDZ2PfNmu9Rej31loQu+tw?=
 =?us-ascii?Q?AqlnLgDDWDuiRx/caokUaLGW5oaxyoInyUuFnV84s/irM4GvFrRbegfy4TYi?=
 =?us-ascii?Q?r1snUwtdlnA8NU7sTGPy+RkFS9yy0IZ476cZ8ijtXIv+wWuVWJDnUXVXfGh6?=
 =?us-ascii?Q?MIsd+Nu5LPRoMiLet789asiUBTz/0gtEu6Wjikvw8Me9XRbsduIMrTi4kVkK?=
 =?us-ascii?Q?aqn1qVx72GwFnMrKl5nwHmOt/auH3BrQ3fZP+AlRG+TT6dyMjHglhvyjuPyc?=
 =?us-ascii?Q?C1ODMTfdYkSCWqy26sKvYRAgey/qPt73cKT+XAt2guf92Sa3NNXB0Mkl3236?=
 =?us-ascii?Q?rO0hqG++NZqaeiUC1e9zap4Y0mr/LEGRqgEfSsEN6WxJ2GtuiucbsgT/v4Rs?=
 =?us-ascii?Q?Oi9DKhAF/3smVvzI3J44Fw1nFWLX5hIMbcQ6ukKvluzN4HtP/hlgsGdHqy5r?=
 =?us-ascii?Q?ODOEsZSjOAyWFL6VB9Dl/WgyQyz3h/vznusW1/tW+bmNOzGhkSJG1lqQ2fO7?=
 =?us-ascii?Q?QpmbS/W8ZKytbHI33111Tlu3wIZQqg4m4sydWMFKSEPSCCflFesbGSVVeYSp?=
 =?us-ascii?Q?2eClUNdjx67pBwKSg2a3XBH287i+YgkjOpth8FJdqnPMh4RK84SAIAuNkzHk?=
 =?us-ascii?Q?KPOZIoMlLp0BUzklR0MWbaQI39SyePrTg/tMX1oyyBwbLTjPrKcBL9fKpwC7?=
 =?us-ascii?Q?5C0nLV1MFly33j1Ge8ApvL7Q1mnl6MW2gSStRmh4N1t46omi78gtWilZRFXT?=
 =?us-ascii?Q?pXkly2Cg0TCq9znWO0DynpvlZ3MbJnUBwYix2pceXdHbsmWcqWWngVH7KfNo?=
 =?us-ascii?Q?XUQ+OCREV1K0oiaSKqfllVGWWXOQ47NdxxC5t24Iitd55slT+2icMe3w7h1g?=
 =?us-ascii?Q?T97hKvONSCmQYAa7YfMZedZPWAdeH7lOyDBEDZpVGHoAw+1Myp6dRDOCilJN?=
 =?us-ascii?Q?mel6i6q/KF2cuh12OPDA8VvkPELY//rwl1E9oY7GQoa1AwN6OjzdLdnnfyw1?=
 =?us-ascii?Q?JQWDeu2nJOfUJVZBAvmyTsX3QnpLf4oEK10A26ZpNFsgkAHd6vd02RRso9KK?=
 =?us-ascii?Q?3SKl/8kw0ZRtzhSz4GaqEjqoNOGLJB2ORoRmfPHPezDLKtHCkwsL5xD3M6bZ?=
 =?us-ascii?Q?9Xj7riiPU5GxkvSXyyjQq/h51J9W5pFNVERuhswwKoq0cAwVLtjgFfTxs/Kk?=
 =?us-ascii?Q?HySwJACopmeofYgLxe8zgjkUA8Zl7vyaYScBHUusMXDk49cCYvcmSdoi84xw?=
 =?us-ascii?Q?CwPDHPvG/CWuSihJ0w57NVzNUTlxQDTaBZDQ9bRQ36eqYwqnR65CEN1r6mSl?=
 =?us-ascii?Q?L9JiceZxoOA2KJR8ClcnmZtydG19tnrBzW/NGRYrOncDvl9QmVpkmtbFprem?=
 =?us-ascii?Q?E5XSOjbNjMKNmGM3B0x4F2l+qZexCi0M/aQUPre2CSf2VJOlodoRD5EQ40gF?=
 =?us-ascii?Q?XEM/lC7so8K5i54nUke+WDAs3HL1VBvcOLsyVCXY?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7534adc7-def9-48fc-d4a7-08da6bb23f84
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 07:17:34.2241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3x0b+5vCapOdDmrANhDaEFkV38JAYcxgFG32tmFlh4YKTvTlScz+SoS/qzLB8kzvHCxVezi6xUzFzdu1tI+zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6143
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 22, 2022 at 09:29:52AM +0300, Dan Carpenter wrote:
> Semi colons and commas are equivalent in this context but semi-colons
> are better style.
Hi Dan Carpenter, thanks for your patch.

Reviewed-by: Xin Ji <xji@analogixsemi.com>

Thanks,
Xin
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/usb/typec/anx7411.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 311b56aaea9f..18a6a6a8b9eb 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1421,12 +1421,12 @@ static int anx7411_psy_register(struct anx7411_data *ctx)
>  	psy_desc->type = POWER_SUPPLY_TYPE_USB;
>  	psy_desc->usb_types = anx7411_psy_usb_types;
>  	psy_desc->num_usb_types = ARRAY_SIZE(anx7411_psy_usb_types);
> -	psy_desc->properties = anx7411_psy_props,
> -	psy_desc->num_properties = ARRAY_SIZE(anx7411_psy_props),
> +	psy_desc->properties = anx7411_psy_props;
> +	psy_desc->num_properties = ARRAY_SIZE(anx7411_psy_props);
>  
> -	psy_desc->get_property = anx7411_psy_get_prop,
> -	psy_desc->set_property = anx7411_psy_set_prop,
> -	psy_desc->property_is_writeable = anx7411_psy_prop_writeable,
> +	psy_desc->get_property = anx7411_psy_get_prop;
> +	psy_desc->set_property = anx7411_psy_set_prop;
> +	psy_desc->property_is_writeable = anx7411_psy_prop_writeable;
>  
>  	ctx->usb_type = POWER_SUPPLY_USB_TYPE_C;
>  	ctx->psy = devm_power_supply_register(ctx->dev, psy_desc, &psy_cfg);
> -- 
> 2.35.1
