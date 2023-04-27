Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54A86F0747
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 16:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243630AbjD0O0O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 10:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243211AbjD0O0N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 10:26:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7062293
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 07:26:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12A7F63D5E
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 14:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5B4C433EF;
        Thu, 27 Apr 2023 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1682605571;
        bh=Bbmdl759Hh9cA7UEcFJPlccjkjpV/98+oif+Jl2ij0I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GwFV2JsVFpoWvtxk0VWm67yKRG+EO5z1heH4lK7b8k7yv/IhYebqPe7ZG6lV2DGtu
         ktmrQ3KA2boLnC+9oaldMbDuJxgUkRq/ddqsbqM/lOeR1QrVcocISgIITFO9S0GiUY
         GbA801Hbt7IHPLFoHZQmgpn+i29e5w2+ANVhXVmA=
Date:   Thu, 27 Apr 2023 16:26:08 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <2023042719-upstairs-shout-80b1@gregkh>
References: <20230427091056.18716-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427091056.18716-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 27, 2023 at 02:40:56PM +0530, Udipto Goswami wrote:
> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, make sure to resume
> dwc3 then allow the function to proceed.
> 
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v7: Replaced pm_runtime_put with pm_runtime_put_sync & returned proper values.
> v6: Added changes to handle get_dync failure appropriately.
> v5: Reworked the patch to resume dwc3 while accessing the registers.
> v4: Introduced pm_runtime_get_if_in_use in order to make sure dwc3 isn't
> 	suspended while accessing the registers.
> v3: Replace pr_err to dev_err. 
> v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.
> 
>  drivers/usb/dwc3/debugfs.c | 128 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 126 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index e4a2560b9dc0..859184de37b6 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -332,6 +332,13 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
>  	unsigned int		current_mode;
>  	unsigned long		flags;
>  	u32			reg;
> +	int			ret;
> +
> +	ret = pm_runtime_get_sync(dwc->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_sync(dwc->dev);
> +		return ret;
> +	}

If you use this, shouldn't you really be calling
pm_runtime_resume_and_get() instead?  That's what the documentation says
to do...

thanks,

greg k-h
