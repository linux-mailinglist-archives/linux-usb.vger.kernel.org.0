Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44CE70918A
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 10:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjESISQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 May 2023 04:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjESISE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 04:18:04 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A59610D
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484278; x=1716020278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vBZkpKqYlXoC+Y5AkFuRQ+fNIc23nZEgKDw7oKvMbZE=;
  b=IFX3pPur0i0TWqH0zHO9jtoOvxJUoC95yCAuYIpduu0OIhtnYlzpzylH
   +ah3FtvE438FMURuzY1jySRlQKRyqToDZ1x/B1rmEzgAobs6jrBcHd8v0
   ZBrTpY8YOR24+ZAIXC81fCJPBVEmOHnvTagKoZYiWmbIS7zqKsnmWlgVA
   k1fuQr3Al2/77I94bvznOwLNvdc1304IRQJiOgb+/u1539Bdc2hMVvv7A
   AgXhV0TajZE+IC1oK4gjhI94gBwZzlQa4y+QO0+Ux/7m+UQ/O2GzRfuDs
   YO+jUUksJkpsUk6zg3ZDSNCLrPLyyo3978jqS8yqL1mVGStytnLbIgPHe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341749495"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341749495"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846812260"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846812260"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:17:55 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:17:54 +0300
Date:   Fri, 19 May 2023 11:17:54 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 95/97] usb: typec: wcove: Convert to platform remove
 callback returning void
Message-ID: <ZGcwsnVVAH9QbTrx@kuha.fi.intel.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-96-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-96-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 18, 2023 at 01:02:37AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/wcove.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
> index 20917d85d6f4..87d4abde0ea2 100644
> --- a/drivers/usb/typec/tcpm/wcove.c
> +++ b/drivers/usb/typec/tcpm/wcove.c
> @@ -671,7 +671,7 @@ static int wcove_typec_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int wcove_typec_remove(struct platform_device *pdev)
> +static void wcove_typec_remove(struct platform_device *pdev)
>  {
>  	struct wcove_typec *wcove = platform_get_drvdata(pdev);
>  	unsigned int val;
> @@ -684,8 +684,6 @@ static int wcove_typec_remove(struct platform_device *pdev)
>  
>  	tcpm_unregister_port(wcove->tcpm);
>  	fwnode_remove_software_node(wcove->tcpc.fwnode);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver wcove_typec_driver = {
> @@ -693,7 +691,7 @@ static struct platform_driver wcove_typec_driver = {
>  		.name		= "bxt_wcove_usbc",
>  	},
>  	.probe			= wcove_typec_probe,
> -	.remove			= wcove_typec_remove,
> +	.remove_new		= wcove_typec_remove,
>  };
>  
>  module_platform_driver(wcove_typec_driver);
> -- 
> 2.39.2

-- 
heikki
