Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A0970918E
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 10:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjESISy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 May 2023 04:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjESISq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 04:18:46 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558C4E4D
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 01:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484325; x=1716020325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h7Q6Jcgp0rcSZPlyVctS5xerllkR7CHu5zG0mrTD0wo=;
  b=S+h8p70fqj5J2P79cv5NocHvY64XCLG2SV/rytvcxxi3OlgOEbIY+IIJ
   VZu0L0sVlggkMF+FycsECqvK7GqwTU+b3kYmDAbvdcUBDqws1IFD1nLmj
   6bQfimUmV4RMNZxDznLJcE2WFM2uuQxnQU24+t5fwyPCgEa9n4fSl7YYy
   Y76ql1q4sZwT9xrquPKTID6N8qFqWKBR2Gp1E8GnQaJFL2A2whRgksGTF
   CH4n+sltGomCUYiEDVGeNCdKRfaqvBCMLrAvymRClJWcNTkIS04YwnG7/
   DY3nSGFo2YgreNWkGU5vKBLisVDeSKw3/q2NPrAw+URWM64ExtB7KzOng
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341749623"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341749623"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846812631"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846812631"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:18:28 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:18:27 +0300
Date:   Fri, 19 May 2023 11:18:27 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 96/97] usb: typec: ucsi: acpi: Convert to platform remove
 callback returning void
Message-ID: <ZGcw0zy67IOv0xjN@kuha.fi.intel.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-97-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-97-u.kleine-koenig@pengutronix.de>
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

On Thu, May 18, 2023 at 01:02:38AM +0200, Uwe Kleine-König wrote:
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
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index 217355f1f9b9..6bbf490ac401 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -212,7 +212,7 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int ucsi_acpi_remove(struct platform_device *pdev)
> +static void ucsi_acpi_remove(struct platform_device *pdev)
>  {
>  	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
>  
> @@ -221,8 +221,6 @@ static int ucsi_acpi_remove(struct platform_device *pdev)
>  
>  	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
>  				   ucsi_acpi_notify);
> -
> -	return 0;
>  }
>  
>  static int ucsi_acpi_resume(struct device *dev)
> @@ -247,7 +245,7 @@ static struct platform_driver ucsi_acpi_platform_driver = {
>  		.acpi_match_table = ACPI_PTR(ucsi_acpi_match),
>  	},
>  	.probe = ucsi_acpi_probe,
> -	.remove = ucsi_acpi_remove,
> +	.remove_new = ucsi_acpi_remove,
>  };
>  
>  module_platform_driver(ucsi_acpi_platform_driver);
> -- 
> 2.39.2

-- 
heikki
