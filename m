Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654C070917B
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 10:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjESIPy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 May 2023 04:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjESIPx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 04:15:53 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EF710D
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484152; x=1716020152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0+bdW95e39r78b3qsg79Gg72EIYWiu6Cof+GiUXFSGQ=;
  b=OeECl6Yu2X2uaOmMfMA+LWyBf6cov9ANl+yLF87Z1kA3QRQfif3TW0Q6
   OKNxNZqewoNUSBcuh/FwyQUKHloceMXigifmRProVIC/HD29uTo1lVU8R
   lCRb+l71N1BivC7ShHs5sK92ha9inrekG5hE57N9f+2vJKl9K5C0RgRDG
   5tuaoNzySIp45Q8fuuWOZEgCyQdmuh50sq8nyZQFuIs48FWLYMskh+mzy
   xCTITNW2KT722aw9mY2A5eSu1ZX9nRVXVZ/nsSlauoIp9OrPjaAgx0YuL
   Vu2T1IE8QUj0DtS4L/ICjs/aPrWY7IezVVrzRyOgIM9K8QwAMZ4brf7qy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341749049"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341749049"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846810975"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846810975"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:15:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:15:43 +0300
Date:   Fri, 19 May 2023 11:15:43 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 91/97] usb: typec: intel_pmc_mux: Convert to platform
 remove callback returning void
Message-ID: <ZGcwLwd7psKK/k8/@kuha.fi.intel.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-92-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-92-u.kleine-koenig@pengutronix.de>
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

On Thu, May 18, 2023 at 01:02:33AM +0200, Uwe Kleine-König wrote:
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
>  drivers/usb/typec/mux/intel_pmc_mux.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 34e4188a40ff..e049eadb591e 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -706,7 +706,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int pmc_usb_remove(struct platform_device *pdev)
> +static void pmc_usb_remove(struct platform_device *pdev)
>  {
>  	struct pmc_usb *pmc = platform_get_drvdata(pdev);
>  	int i;
> @@ -718,8 +718,6 @@ static int pmc_usb_remove(struct platform_device *pdev)
>  	}
>  
>  	acpi_dev_put(pmc->iom_adev);
> -
> -	return 0;
>  }
>  
>  static const struct acpi_device_id pmc_usb_acpi_ids[] = {
> @@ -734,7 +732,7 @@ static struct platform_driver pmc_usb_driver = {
>  		.acpi_match_table = ACPI_PTR(pmc_usb_acpi_ids),
>  	},
>  	.probe = pmc_usb_probe,
> -	.remove = pmc_usb_remove,
> +	.remove_new = pmc_usb_remove,
>  };
>  
>  module_platform_driver(pmc_usb_driver);
> -- 
> 2.39.2

-- 
heikki
