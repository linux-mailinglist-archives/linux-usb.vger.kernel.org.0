Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAC170917A
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 10:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjESIOT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 May 2023 04:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjESIOS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 04:14:18 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03BC10D
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684484057; x=1716020057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ivRKUx9VpmU1yiWXxKpv8ZEJriyXyv+9xpHgNXJeMVg=;
  b=mOny//P1pFk3l5Ph+iy/OBSN/b+TLfOuUufXnFXMTSVuEMTZqcp5F2rs
   8Yh6c+s9h5RXNdW4teMucVI5YepY9ekja7HiMsqlU2zGp9z5zUzEx9Rir
   r8/+ntB6376XYlVH1kK0kXxJaGMxhKvWr8qT6RqdoQObb53gBJZqRKMsa
   pwLhKqQaue61H7k2xXP+QaJ7v9WJ2MeQpb8TSnrzTGn31UG9yZlrvHRXb
   2QKtuSAnfsI474WP1FTVhbGoajWxw33e2jwLRXTGeqWCnEVoetJeeO+3N
   pp29Gz/6JZs9CNUxLtKlU8EH3QyilxtRjfmvlIML32P7WuHRQcbXg/5qH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="341748785"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="341748785"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 01:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846810292"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="846810292"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 19 May 2023 01:14:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 19 May 2023 11:14:13 +0300
Date:   Fri, 19 May 2023 11:14:13 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 90/97] usb: typec: mux: gpio-sbu: Convert to platform
 remove callback returning void
Message-ID: <ZGcv1VgMbcK/+UO7@kuha.fi.intel.com>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-91-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-91-u.kleine-koenig@pengutronix.de>
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

On Thu, May 18, 2023 at 01:02:32AM +0200, Uwe Kleine-König wrote:
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
>  drivers/usb/typec/mux/gpio-sbu-mux.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
> index f62516dafe8f..94c5bc0f467d 100644
> --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
> @@ -140,7 +140,7 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int gpio_sbu_mux_remove(struct platform_device *pdev)
> +static void gpio_sbu_mux_remove(struct platform_device *pdev)
>  {
>  	struct gpio_sbu_mux *sbu_mux = platform_get_drvdata(pdev);
>  
> @@ -148,8 +148,6 @@ static int gpio_sbu_mux_remove(struct platform_device *pdev)
>  
>  	typec_mux_unregister(sbu_mux->mux);
>  	typec_switch_unregister(sbu_mux->sw);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id gpio_sbu_mux_match[] = {
> @@ -160,7 +158,7 @@ MODULE_DEVICE_TABLE(of, gpio_sbu_mux_match);
>  
>  static struct platform_driver gpio_sbu_mux_driver = {
>  	.probe = gpio_sbu_mux_probe,
> -	.remove = gpio_sbu_mux_remove,
> +	.remove_new = gpio_sbu_mux_remove,
>  	.driver = {
>  		.name = "gpio_sbu_mux",
>  		.of_match_table = gpio_sbu_mux_match,
> -- 
> 2.39.2

-- 
heikki
