Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E14BE6F6E93
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 17:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjEDPEz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 11:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbjEDPEw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 11:04:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8B1210E;
        Thu,  4 May 2023 08:04:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6703634EE;
        Thu,  4 May 2023 15:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B28AC433D2;
        Thu,  4 May 2023 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683212690;
        bh=qgVhzXeBrXXxYrudAytWCdo5IXVFfCHhp9zTfJzqWNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q0MtN9LWQpmkXlwMKNkan5lg8BEDVRZQmkh8zwKkZwWnj1xljOa7Gxw6Az+sJAm0B
         HOb2nSVrjI7p/uWeD01zZpeqc9jBa8FdHC1Zw26GvB3fbyPKgsMln5Lr6kv3Tkf2VZ
         QMau1RN3hnzyL05tvi6CxhTjOgQ5j1CkPRr3FFO2x7tuGRuu7q+OYf9WQS6K5FtW89
         h50lmXpwIHx8/Q6Wmg+9boYxHQQaPiD2pfGj1ipUzj5RxjnVeL6J16bgBKmnuw8Clw
         h0t6a2UfIW5jvJ2gyZTJE2OUOKEcoCromPKF2PHGJ9Ka47Slbkc++fcPAih/pcFNBb
         KemU+2IdtcqjQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1puaVv-0006mc-29; Thu, 04 May 2023 17:04:59 +0200
Date:   Thu, 4 May 2023 17:04:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: fix a test for error in dwc3_core_init()
Message-ID: <ZFPJm3iJDFiG1DAS@hovoldconsulting.com>
References: <d0c5a04f-deee-4ebe-9b0b-dc5492564519@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0c5a04f-deee-4ebe-9b0b-dc5492564519@kili.mountain>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 04, 2023 at 05:59:24PM +0300, Dan Carpenter wrote:
> This was refactored recently and the "ret = " was accidentally deleted
> so the errors aren't checked.
> 
> Fixes: 1d72fab47656 ("USB: dwc3: refactor phy handling")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for catching this!

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

> ---
>  drivers/usb/dwc3/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 0beaab932e7d..7b2ce013cc5b 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1137,7 +1137,7 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  
>  	dwc3_set_incr_burst_type(dwc);
>  
> -	dwc3_phy_power_on(dwc);
> +	ret = dwc3_phy_power_on(dwc);
>  	if (ret)
>  		goto err_exit_phy;

Johan
