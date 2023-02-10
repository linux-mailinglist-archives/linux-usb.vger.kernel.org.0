Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DED0F691A76
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 09:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjBJI5b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 03:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbjBJI5a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 03:57:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A833453E7D
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 00:57:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC46861D01
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 08:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5847C433EF;
        Fri, 10 Feb 2023 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676019446;
        bh=psQfpRGQVp8py7/RiY/iNLXyQgAqeEQWNv41SlTFx1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fmcx2Vj2VmMCwqAdf7Yxsv03Yo7w0NAftXVPl6uYoexbSxlBaskbz0wZsW9MeWjbs
         pvz4Ol6zTcERmQwjeCOgXgGkItYsJsnkcoR814La6AxzcEp9agRJKAXNradR35jfYy
         X8c4ExNn4yYybDwTmSBS7p15m3IeuY74CAW8WodVYvBUGzG0GUC9E/qQoUCimdLVek
         TVffELSEHAx75bs5+cWi8zeraY7gWNY2j8fO8J9W0kYHiLHUa6iLZ0DKECyNEcGY95
         J+joXRGdozF/LtJa5ooQgQFGFZJtt92nrVeMSGU0OJV6KyoOmoTmwkzaSWQwWbwJPg
         VnjRB0/YxsDAw==
Date:   Fri, 10 Feb 2023 16:57:15 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] usb: chipidea: core: fix possible concurrent when
 switch role
Message-ID: <20230210085715.GD1991028@nchen-desktop>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20221130081231.3127369-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130081231.3127369-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-11-30 16:12:30, Xu Yang wrote:
> The user may call role_store() when driver is handling
> ci_handle_id_switch() which is triggerred by otg event or power lost
> event. Unfortunately, the controller may go into chaos in this case.
> Fix this by protecting it with mutex lock.
> 
> Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> changes since v1:
> - modify description for mutex member
> - wrap role variable in ci_handle_id_switch() too
> ---
>  drivers/usb/chipidea/ci.h   | 2 ++
>  drivers/usb/chipidea/core.c | 8 +++++++-
>  drivers/usb/chipidea/otg.c  | 5 ++++-
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 005c67cb3afb..f210b7489fd5 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -208,6 +208,7 @@ struct hw_bank {
>   * @in_lpm: if the core in low power mode
>   * @wakeup_int: if wakeup interrupt occur
>   * @rev: The revision number for controller
> + * @mutex: protect code from concorrent running when doing role switch
>   */
>  struct ci_hdrc {
>  	struct device			*dev;
> @@ -260,6 +261,7 @@ struct ci_hdrc {
>  	bool				in_lpm;
>  	bool				wakeup_int;
>  	enum ci_revision		rev;
> +	struct mutex                    mutex;
>  };
>  
>  static inline struct ci_role_driver *ci_role(struct ci_hdrc *ci)
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index fcb175b22188..d7efde30d59f 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -987,8 +987,12 @@ static ssize_t role_store(struct device *dev,
>  	if (role == CI_ROLE_END)
>  		return -EINVAL;
>  
> -	if (role == ci->role)
> +	mutex_lock(&ci->mutex);
> +
> +	if (role == ci->role) {
> +		mutex_unlock(&ci->mutex);
>  		return n;
> +	}
>  
>  	pm_runtime_get_sync(dev);
>  	disable_irq(ci->irq);
> @@ -998,6 +1002,7 @@ static ssize_t role_store(struct device *dev,
>  		ci_handle_vbus_change(ci);
>  	enable_irq(ci->irq);
>  	pm_runtime_put_sync(dev);
> +	mutex_unlock(&ci->mutex);
>  
>  	return (ret == 0) ? n : ret;
>  }
> @@ -1033,6 +1038,7 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	spin_lock_init(&ci->lock);
> +	mutex_init(&ci->mutex);
>  	ci->dev = dev;
>  	ci->platdata = dev_get_platdata(dev);
>  	ci->imx28_write_fix = !!(ci->platdata->flags &
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 622c3b68aa1e..f5490f2a5b6b 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -167,8 +167,10 @@ static int hw_wait_vbus_lower_bsv(struct ci_hdrc *ci)
>  
>  void ci_handle_id_switch(struct ci_hdrc *ci)
>  {
> -	enum ci_role role = ci_otg_role(ci);
> +	enum ci_role role;
>  
> +	mutex_lock(&ci->mutex);
> +	role = ci_otg_role(ci);
>  	if (role != ci->role) {
>  		dev_dbg(ci->dev, "switching from %s to %s\n",
>  			ci_role(ci)->name, ci->roles[role]->name);
> @@ -198,6 +200,7 @@ void ci_handle_id_switch(struct ci_hdrc *ci)
>  		if (role == CI_ROLE_GADGET)
>  			ci_handle_vbus_change(ci);
>  	}
> +	mutex_unlock(&ci->mutex);
>  }
>  /**
>   * ci_otg_work - perform otg (vbus/id) event handle
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
