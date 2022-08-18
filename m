Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4825990B0
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 00:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344275AbiHRWnU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 18:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344608AbiHRWnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 18:43:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EACDE2F
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 15:43:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D1A8CB82472
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 22:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76698C433D6;
        Thu, 18 Aug 2022 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660862595;
        bh=fAMr+GM4VHTV8rOiLFAu2fjRR0btpLuK3K1u1gAn01w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BgcDVMfV5pTWwy9rt21pMgNxCUrXWlrwWhAgw3UAmLtypJAGt41fu+VytLtEJwi9w
         wtnYmnBQP6AmFAFaY5jLCF1k9DKDsjpqi0a1nOhSJFEnNXtd5iDkMwL9+p8eig5vxm
         RU4MYQbHPOdjb8UCrM4oP9My+OqmvKjE5JHeCQ5d2YmJvqUf04Y0cHyCj68MVRHZyU
         D3kFjqcG9PT9EJ1u8mvr+962fztymTSzwDAVwJKAMs2CkViuKKLvoMW7TQvOyPjNaF
         ahu7eiAXeWShcas3UU9c3olkazyuL/91Xi+lqy/JAHmZEjy2D4ccGZX6uqRN+jP7iG
         vBMuGAtq40+qw==
Date:   Fri, 19 Aug 2022 06:43:10 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: core: complement wakeup support for usb
 role switch
Message-ID: <20220818224310.GA237083@Peter>
References: <20220812105719.143556-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812105719.143556-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-08-12 18:57:19, Xu Yang wrote:
> In current design, ci_usb_role_switch_set() will call pm_runtime_get_sync()
> firstly, then handle role switch events. But pm_runtime_get_sync() may fail
> to resume controller sometimes. This may happen when doing system suspend
> and enabled typec wakeup source as below:
>   1. starting system suspend, controller is suspended by runtime pm before.
>   2. somehow controller get resumed by runtime pm.
>   3. ci_suspend() is called. runtime_status = RPM_ACTIVE now.
>   4. ci_usb_role_switch_set() is called due to role switch events.
>   5. pm_runtime_get_sync() return 1.
> 
> This is because pm.runtime_status is still RPM_ACTIVE after ci_suspend().
> Then the driver execute wakeup operations in ci_irq(). So there is a need
> to call ci_irq() again like extcon do.

You mean role switch happens after ci_lpm is 1, you need to execute
ci_irq twice? I have not run chipidea platform these years, could @Jun
Li help review this patch first?

> 
> Fixes: 876d4e1e8298 ("usb: chipidea: core: add wakeup support for extcon")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 6330fa911792..886b68e45826 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1305,12 +1305,14 @@ static void ci_extcon_wakeup_int(struct ci_hdrc *ci)
>  	cable_id = &ci->platdata->id_extcon;
>  	cable_vbus = &ci->platdata->vbus_extcon;
>  
> -	if (!IS_ERR(cable_id->edev) && ci->is_otg &&
> -		(otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS))
> +	if ((!IS_ERR(cable_id->edev) || !IS_ERR(ci->role_switch))
> +		&& ci->is_otg && (otgsc & OTGSC_IDIE)
> +		&& (otgsc & OTGSC_IDIS))
>  		ci_irq(ci);
>  
> -	if (!IS_ERR(cable_vbus->edev) && ci->is_otg &&
> -		(otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS))
> +	if ((!IS_ERR(cable_vbus->edev) || !IS_ERR(ci->role_switch))
> +		&& ci->is_otg && (otgsc & OTGSC_BSVIE)
> +		&& (otgsc & OTGSC_BSVIS))
>  		ci_irq(ci);
>  }

With your change, ci_irq needs to execute every time at role-switch case
every time, please confirm it is expected

-- 

Thanks,
Peter Chen

