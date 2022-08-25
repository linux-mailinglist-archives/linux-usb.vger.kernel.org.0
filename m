Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF1D75A0C44
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 11:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbiHYJPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 05:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiHYJPG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 05:15:06 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60108.outbound.protection.outlook.com [40.107.6.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2F715A25;
        Thu, 25 Aug 2022 02:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9SdsHfMN4BWZCdoSA9SJJf/iuTLs/yzbKqH9LGLvs4zYOFpXeEnc3JPLn76Ca71yGZVv41SPegfuZlT7S10G3LYJXXxwui5jsQQPdcZdxrojo9o1roi9MV/UZJLJ42GgLtGvYc3eN7hs8+cIGGx9/BZk1xgdGDC/KEiNcoeA00q3nYExVE9ut9Eo7vh06PSo2HF55+Q5Pe24WAOI7l69D99vzM/Ww3KxUsQQQowlitCKbj5blhcyPKXVlP34n7GrylG8XA6SnsCs6HsVcF74qTen7wx5isGA9o9lCb49V0v9PjWyhYn+yo+UXsFsTIALmqnwBBNg8IUGIPtDwT8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzdy1zBEdT2rqOwYJ+DMQ7FtazarwBhvcWvTHjjIMQE=;
 b=T6/2OmT8C47DwAJeBFwLRPvnuEuHfYo7ZB58EumHXYNTCeZjYn2lFjKToJXocxBTxBN7lSlCzm4m2iPC5Iv3hgPNUyGG9PicXw1jBBBeO7onP/aPJXr695k+/TTn1QsF80oHTlaoMuH0oY7cX7qBOsKcL+VNRztMhFxeeWN898mIEmpmRclq57fNP9uf2v2s7u3TwVjCOeS8s7fk8qasf0V9v8JTFLtV8KEDS6FzQ37F+GkrkNxXW3TF51Kk+iRdtGmvN0SVRA/BOXO1XYjAtugL1VJsTvT1wGzBhvsOpoNlV2z+pxe6P9LKD/6GP5VJ0h7rDcp4fVggvTE+E1FP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzdy1zBEdT2rqOwYJ+DMQ7FtazarwBhvcWvTHjjIMQE=;
 b=FDmZq86AlFZeoIU7+hfYVi8mYkZZyl/BTLjksFaQ+nGeq0csdw4iTBiXOBeTGi1wITT3rLVqwZj0/yReWpTQ5rq6pkZ3dRFNG5mIlwXG1rK3/U19KTIq0XC8KfyD1DIysy4TpDEpzeWB0n+C3pww8y8J/n6E/4PZlGerZ6MEnok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB9PR02MB7083.eurprd02.prod.outlook.com (2603:10a6:10:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 09:14:59 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 09:14:59 +0000
Message-ID: <65e4928c-79ec-5dd4-022d-364898c65ccb@axentia.se>
Date:   Thu, 25 Aug 2022 11:14:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/4] mux: convert to use fwnode interface
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com,
        robh+dt@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
 <20220823195429.1243516-3-xu.yang_2@nxp.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220823195429.1243516-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0119.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::15) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b21cdc89-c714-47f4-c20b-08da867a48bb
X-MS-TrafficTypeDiagnostic: DB9PR02MB7083:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L0SlfsncUEEfcFissJXBJxEFvGayLWXi/OAhKjUs527h7zxx74cKJZSICj+ynczvbxxLjuoDuEcuWylXyxZfuANGitMbf2ACZ3gecn+DH/KZsPqvhITgXxi9iBPyF+7EI/A2L9Tmv/gxJacRW+IG2PXoASqc4v53D8GY2GbSZuycJwRomRsBsAcBWkcTZjC0l1NrsEdWT2r62YCnfifwZJMFl3066/9IL+QXKqtkcQJAkCAd4qrp5RPVXiaQ8fa7y0WHfQ+wMdT4oI0LwTMDE77Q9ZnF7OboOZE/MOnAjLiPy8X906et3B9P2AVDacPpjuOMaqI6rscsN9AmCxZlNMNRHk0p/Dc6xV2QmJDsyMIlSIE3u/spKKryBvz8UbrNHPtDDayVPSVg+edKdX8I7BQHyYaeQNbsaEI0oj2KhJN3NHHmEMu5oxzDH3soAYRVT8fm64g+FmxT1zU1h5iwDxhdWJg8fCikQqXWuMXtn6t4y80toWuCJbwdzyXqcc99pK0sX3/5vQnsE4FSzAXp0fNL6KYiSXhZf1l0fauW41SfQtul/sgrQaa239w3hdUxehEBSmAtRU8pxcN+GZ6dLJoI0BrRlBsMw3JBWf/Wl0rai0tm5iSjP9OlSOJ6hDaKSrKAWdBO15zmInEQRiere4HkuHccppP9Vk1T+PhlAMpY11EypBeoA9Vlm2TRe5QcZdYpEhgzVPL8VIdevygQhB7bCaz4EjEj+wbK1OihuDdARaRKY1PD4j2bTXAOc5Fp1cJbXQwB+P1cWC0yD4VOyBnWv4gI6P/mXep8ygTo818=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(376002)(346002)(39840400004)(7416002)(2906002)(26005)(36756003)(66556008)(31686004)(8676002)(5660300002)(66946007)(66476007)(4326008)(316002)(478600001)(6506007)(6486002)(6512007)(41300700001)(186003)(86362001)(2616005)(8936002)(31696002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUJoV2o3ZWFsOHg5dzIyeFlyWVY0Q2gwVnd5NW1rUG5RdXNFY2xUSWJNS0pN?=
 =?utf-8?B?YURSMzdKaDFoNGY0ZU91L3BUTDJYdFR4eEkxdHAxcHpoUUw5ako0MENRYmVN?=
 =?utf-8?B?b21wTGl1aFZXaVRrWThCLzlvaWtFTlBRVXFtL045SFVDM2hFdjd3TG9LTGZl?=
 =?utf-8?B?Q2dpdmxsQ2VzNjhsNkc1WGN6TmI3WmZ1di9yNlZDM0xZeFlzWDVqTDFiYnlm?=
 =?utf-8?B?NkQ1NFErcjgvQzhDVE1raVFwRHoxWXY4N3MvZ1h4WmM3VGlhRTdlc3g1UU9q?=
 =?utf-8?B?QmExSEZUR0JZUEhNV0RCem4zZTFPWVhJcjhFaUszdVFJcEZiKzlBbXp2ZVIy?=
 =?utf-8?B?ZFVRTFZxeHR6NHoyTkN4OFlDMXBpd2VnYkt2cllnbXZRbWVHcTRLSk4wSm81?=
 =?utf-8?B?dm5ma1FGbkdqdDdFeVRkalpCUkNzenBlakhERkdYYzhjbm5wWHdEY2txK1Fo?=
 =?utf-8?B?VTRpUERLSnpOT1BjLzdNTHoxc3FiVDRpMHlOazBubm14VDlxcHl0R1Ivb2dw?=
 =?utf-8?B?dHNEbnVpZTBINFF5NFIzdzlwUmd3aUYzUTRSYzUvcW52aGhUR3JDUklicXRy?=
 =?utf-8?B?eTdXZkk5bFJDdFRheFgxS0F0L1BmWGlYYk4vdTlZRFEyVk5JVHRQUmpnSzdy?=
 =?utf-8?B?WEkvbHA3eGhsKzBUNXd6c1hxWEloZm1TZ1dRQjBONTlMZ3EwNjZpSWEzUE51?=
 =?utf-8?B?bXFlbVNwbHRZVS8vMU95ZVBSS0o1OTFnV1Fjd0NCNkRCU0lNU0RwTzAyQ3po?=
 =?utf-8?B?MkEvdUkyZitJd0EwRlRIYmlpZFdDeFRkUjg4M0d4akNiN1dNMis3ODZIRDhh?=
 =?utf-8?B?c0NaMWNYWmZQK3dFSEtaOUhDRW1XejhMbjJIRHR6WHVzeHJBR2I3UmNWZDV0?=
 =?utf-8?B?SS9DUlYvNlIxSEFYSEF1NkZidE9vb3V6aWFuRHozTWJJMUsrNjMrdjRreGt1?=
 =?utf-8?B?L1UvcHRPejZMaSt1NHZMTmxVZm1CUWoxdFBzMUxIYUJiTDZhZ2R4SUF4RzlM?=
 =?utf-8?B?NEh4ZlNYcWl2RExiSWhidUVWbVFZUFNyTDV5QjBCalV1cGU5bGYvZFlmWDF1?=
 =?utf-8?B?dUQ5SzVrNnlMNjlUa3p6QUpybWhFY1RDMmdYY1o5alhxWENsZHRPekJyQXNi?=
 =?utf-8?B?RFFiZXUvS2RnSVdQTk9WeVpDMExOVzRwenRyTTFsRWkxOHN4NEFIQnA1R2xu?=
 =?utf-8?B?Q2RrMmpIR2IvNlltR3hvamN6cVVLbkFxY3U2QWF6aUdOQ2xRNytFdi9WZjJY?=
 =?utf-8?B?NUR0b1M5YmE1ZS8wVGdaOUZtMjRTZ3g0Z21iaTRJZ3JWUmdxbEVnSkgzcXFV?=
 =?utf-8?B?bVhXbVhwTWZDWlBsWGo5L09SeGhHdHAxTkRzNFdIcHI5N1VrV2ZBWW8zUzVB?=
 =?utf-8?B?VDU0N3IyMzBjN3krMlhoMHRnRTFrQXBucld5cXI1ZEM2Z3ZRbnB4TS9Hc1BS?=
 =?utf-8?B?UWR3MmFEQ3dsU2VkR2tkU011dHJBU3dlR1BROTYreVBVZTVES21zY1h0RGFG?=
 =?utf-8?B?N05KUHlJVXBoYy9hcEhZdWRhN0N2dVFSN1BpaUoyM2tGeDZWUCtIQTVTMWVu?=
 =?utf-8?B?THZEb1ViclFzUWtKTDI5Y1FLNW4yTUM0amJCTjRndVU5cVFsRFpackZIVkNh?=
 =?utf-8?B?bEJ2bUdFUWRPcFlTRlh5R3ZIR21DMFVwSjhXMG5nNDBmc2pZR2dLWlpKeXJ0?=
 =?utf-8?B?MXptZ2JkWjE0Tzg5c1NwWDRiQlVsWTh1Zk43bU5Na25ObVdFR1BLTjFObnlQ?=
 =?utf-8?B?RVFnem5XTEVOYUYyRzRnaUM5TG1DbmUzSDkvL1g0L1EwZ0VzU1h6Tmw3S1R5?=
 =?utf-8?B?Qkc4SWdKdEVnYWN0UzJPUEQyZzBwWUNNZENPTFlWSUsxZW1WZXpsU0xVY0Zp?=
 =?utf-8?B?UTBydHNWU3M1RWVpcG1pSXQ1bzhkZ01HTGtidDR4alZ2TEtnYXNGM29Kc3lC?=
 =?utf-8?B?S2tIMHNpSXhaNEd4UC9pcDhOa1laMzUraGZaanJXblJQdUliRVgzYXVUYk9j?=
 =?utf-8?B?RHp2Nlp5YzZrcVNZMEdJK1V6ek42S1VRWnJUZFhoYThDYk5GakJTdFlJQkFo?=
 =?utf-8?B?UFRnaEozSUZwb2dqQUpWKzRKTmVTalN2OThUcVYwakphbnhBYTVnR2tHdDZp?=
 =?utf-8?Q?Jy85aDWJN0o5VbvbYjTsu0FbF?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: b21cdc89-c714-47f4-c20b-08da867a48bb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 09:14:59.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1Sw8aCvu2tAckTDS5VvFcVyKkmSKoCjzyxJr/cRxXkn+0nR99qqLyMMAJeVDevr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7083
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

Much better, one small thing though...

2022-08-23 at 21:54, Xu Yang wrote:
> As firmware node is a more common abstract, this will convert the whole
> thing to fwnode interface.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes since v1:
> - convert to use fwnode interface
> 
>  drivers/mux/core.c | 65 +++++++++++++++++++++++-----------------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 49bedbe6316c..e30e859efd33 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -18,8 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/mux/consumer.h>
>  #include <linux/mux/driver.h>
> -#include <linux/of.h>
> -#include <linux/of_platform.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  /*
> @@ -510,11 +509,11 @@ int mux_state_deselect(struct mux_state *mstate)
>  EXPORT_SYMBOL_GPL(mux_state_deselect);
>  
>  /* Note this function returns a reference to the mux_chip dev. */
> -static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
> +static struct mux_chip *of_find_mux_chip_by_node(struct fwnode_handle *fwnode)

Please rename this function to mux_chip_find_by_fwnode()

Cheers,
Peter

>  {
>  	struct device *dev;
>  
> -	dev = class_find_device_by_of_node(&mux_class, np);
> +	dev = class_find_device_by_fwnode(&mux_class, fwnode);
>  
>  	return dev ? to_mux_chip(dev) : NULL;
>  }
> @@ -531,8 +530,8 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
>  static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  				   unsigned int *state)
>  {
> -	struct device_node *np = dev->of_node;
> -	struct of_phandle_args args;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct fwnode_reference_args args;
>  	struct mux_chip *mux_chip;
>  	unsigned int controller;
>  	int index = 0;
> @@ -540,11 +539,11 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  
>  	if (mux_name) {
>  		if (state)
> -			index = of_property_match_string(np, "mux-state-names",
> -							 mux_name);
> +			index = fwnode_property_match_string(fwnode,
> +					"mux-state-names", mux_name);
>  		else
> -			index = of_property_match_string(np, "mux-control-names",
> -							 mux_name);
> +			index = fwnode_property_match_string(fwnode,
> +					"mux-control-names", mux_name);
>  		if (index < 0) {
>  			dev_err(dev, "mux controller '%s' not found\n",
>  				mux_name);
> @@ -553,35 +552,37 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  	}
>  
>  	if (state)
> -		ret = of_parse_phandle_with_args(np,
> -						 "mux-states", "#mux-state-cells",
> -						 index, &args);
> +		ret = fwnode_property_get_reference_args(fwnode,
> +					"mux-states", "#mux-state-cells",
> +					0, index, &args);
>  	else
> -		ret = of_parse_phandle_with_args(np,
> -						 "mux-controls", "#mux-control-cells",
> -						 index, &args);
> +		ret = fwnode_property_get_reference_args(fwnode,
> +					"mux-controls", "#mux-control-cells",
> +					0, index, &args);
> +
>  	if (ret) {
> -		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> -			np, state ? "state" : "control", mux_name ?: "", index);
> +		dev_err(dev, "%pfw: failed to get mux-%s %s(%i)\n",
> +			fwnode, state ? "state" : "control", mux_name ?: "",
> +			index);
>  		return ERR_PTR(ret);
>  	}
>  
> -	mux_chip = of_find_mux_chip_by_node(args.np);
> -	of_node_put(args.np);
> +	mux_chip = of_find_mux_chip_by_node(args.fwnode);
> +	fwnode_handle_put(args.fwnode);
>  	if (!mux_chip)
>  		return ERR_PTR(-EPROBE_DEFER);
>  
>  	controller = 0;
>  	if (state) {
> -		if (args.args_count > 2 || args.args_count == 0 ||
> -		    (args.args_count < 2 && mux_chip->controllers > 1)) {
> -			dev_err(dev, "%pOF: wrong #mux-state-cells for %pOF\n",
> -				np, args.np);
> +		if (args.nargs > 2 || args.nargs == 0 ||
> +		    (args.nargs < 2 && mux_chip->controllers > 1)) {
> +			dev_err(dev, "%pfw: wrong #mux-state-cells for %pfw\n",
> +				fwnode, args.fwnode);
>  			put_device(&mux_chip->dev);
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		if (args.args_count == 2) {
> +		if (args.nargs == 2) {
>  			controller = args.args[0];
>  			*state = args.args[1];
>  		} else {
> @@ -589,21 +590,21 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  		}
>  
>  	} else {
> -		if (args.args_count > 1 ||
> -		    (!args.args_count && mux_chip->controllers > 1)) {
> -			dev_err(dev, "%pOF: wrong #mux-control-cells for %pOF\n",
> -				np, args.np);
> +		if (args.nargs > 1 ||
> +		    (!args.nargs && mux_chip->controllers > 1)) {
> +			dev_err(dev, "%pfw: wrong #mux-control-cells for %pfw\n",
> +				fwnode, args.fwnode);
>  			put_device(&mux_chip->dev);
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		if (args.args_count)
> +		if (args.nargs)
>  			controller = args.args[0];
>  	}
>  
>  	if (controller >= mux_chip->controllers) {
> -		dev_err(dev, "%pOF: bad mux controller %u specified in %pOF\n",
> -			np, controller, args.np);
> +		dev_err(dev, "%pfw: bad mux controller %u specified in %pfw\n",
> +			fwnode, controller, args.fwnode);
>  		put_device(&mux_chip->dev);
>  		return ERR_PTR(-EINVAL);
>  	}
