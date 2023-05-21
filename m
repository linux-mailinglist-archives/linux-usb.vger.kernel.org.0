Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63B870AC2B
	for <lists+linux-usb@lfdr.de>; Sun, 21 May 2023 05:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjEUDbZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 May 2023 23:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjEUDbY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 May 2023 23:31:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A5711F
        for <linux-usb@vger.kernel.org>; Sat, 20 May 2023 20:31:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3ECF612EA
        for <linux-usb@vger.kernel.org>; Sun, 21 May 2023 03:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9890EC433EF;
        Sun, 21 May 2023 03:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684639882;
        bh=g4aBSOsg0zpyZtLZPGNENjyiOsbY6cyBDbiAUaozrVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r54CI3Kk9N2NT5EO5ZyE7aKdmycGuNKciqa4Q9aKRuxsIDtrIFmwe/cxxPUa9+QDY
         HFsiKFdCnNm9cmchk7yNFwIUizP6Nd1jUIbU9A9xuA8KJo0EHUJQyVbThz9JE8fcyj
         ITHzz8uFiTyMUbGOMXVBmbgMHUBCdOR9Ln89tk+ozDJlBbRTaCge1WCqwvpbzxYuto
         sMhwDK3xKot3ni3rl1vRHu9ULrJ5GZoi34lryqMYBvwU7znWWCsOLn3tpB/VqMWeYj
         iWNyt1UyZ+Lb1kWgr32PeIlZbpnxL39ZP4n7hT6ciDPgNVWMVFFtYWKuiAMgJGqdOW
         pBGHWPvZlh5kA==
Date:   Sat, 20 May 2023 22:31:19 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 90/97] usb: typec: mux: gpio-sbu: Convert to platform
 remove callback returning void
Message-ID: <2525ztzoikuxasp2rdekvumuv6w622ttmrotm7jnrx4mitjgln@asulrqj2e4si>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-91-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517230239.187727-91-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

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
> 
