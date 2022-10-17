Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5523560049E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 02:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbiJQA5r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Oct 2022 20:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiJQA5p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Oct 2022 20:57:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3599C3EA68
        for <linux-usb@vger.kernel.org>; Sun, 16 Oct 2022 17:57:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5F4760E9C
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 00:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE0EC433C1;
        Mon, 17 Oct 2022 00:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665968264;
        bh=Qd28aYp9fjVP4Fk9ulGXZzAbHUNkGMiyA3L40SjGO+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Np1lXAWM8aXcuWzeKsc6l7MvmbL2F9QonffcBvzb9Ky32PvNWSpsp4hx8r4LbbO2j
         t+JO0kD4zf54ztkkCbRWqdDpYZdC5fPA/6v633r+qQHM1a5Gn1Dk1A4RdR5KdDBdo6
         cQYT2yQIT0QE4fDHG/3Lq7Wt6xV2CFhmTpu6bjAwhEt29fXvoyZQyItYWmnxL3Hifp
         ddxwcPfCshaOt8z0PQml1ae6x6sQAxwVGN6Wbj2IcbvjJvZAWshP0D6u1rxCLiqgWt
         F6Tx42LOx1giO1H4n2u7BBWfUINVvZ88m1zqVKiTIxmOLz0UCbT3SjOvMYIsx4z36/
         MpCO4VzsW1xYA==
Date:   Mon, 17 Oct 2022 08:57:39 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     jun.li@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 2/8] usb: chipidea: core: handle suspend/resume for
 each role
Message-ID: <20221017005739.GE12701@nchen-desktop>
References: <20221013151442.3262951-1-xu.yang_2@nxp.com>
 <20221013151442.3262951-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151442.3262951-3-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-10-13 23:14:36, Xu Yang wrote:
> There may be a need to handle suspend/resume per role. This patch
> will add this support.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> Changes since v1:
> - No changes.
> ---
>  drivers/usb/chipidea/ci.h   | 4 ++++
>  drivers/usb/chipidea/core.c | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index a4a3be049910..005c67cb3afb 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -127,12 +127,16 @@ enum ci_revision {
>   * struct ci_role_driver - host/gadget role driver
>   * @start: start this role
>   * @stop: stop this role
> + * @suspend: system suspend handler for this role
> + * @resume: system resume handler for this role
>   * @irq: irq handler for this role
>   * @name: role name string (host/gadget)
>   */
>  struct ci_role_driver {
>  	int		(*start)(struct ci_hdrc *);
>  	void		(*stop)(struct ci_hdrc *);
> +	void		(*suspend)(struct ci_hdrc *ci);
> +	void		(*resume)(struct ci_hdrc *ci, bool power_lost);
>  	irqreturn_t	(*irq)(struct ci_hdrc *);
>  	const char	*name;
>  };
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 80267b973c26..2b170b434d01 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1383,6 +1383,10 @@ static int ci_suspend(struct device *dev)
>  		return 0;
>  	}
>  
> +	/* Extra routine per role before system suspend */
> +	if (ci->role != CI_ROLE_END && ci_role(ci)->suspend)
> +		ci_role(ci)->suspend(ci);
> +
>  	if (device_may_wakeup(dev)) {
>  		if (ci_otg_is_fsm_mode(ci))
>  			ci_otg_fsm_suspend_for_srp(ci);
> @@ -1422,6 +1426,10 @@ static int ci_resume(struct device *dev)
>  		ci_usb_phy_init(ci);
>  	}
>  
> +	/* Extra routine per role after system resume */
> +	if (ci->role != CI_ROLE_END && ci_role(ci)->resume)
> +		ci_role(ci)->resume(ci, power_lost);
> +
>  	if (power_lost)
>  		ci_handle_power_lost(ci);
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
