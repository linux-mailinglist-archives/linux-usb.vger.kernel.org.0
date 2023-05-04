Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822156F6733
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 10:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjEDIXy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 04:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjEDIXP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 04:23:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9231146AB
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 01:17:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F13360909
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 08:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DBAC4339B;
        Thu,  4 May 2023 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683188195;
        bh=xIvK3I999peRWhSE7is2bSZntDlruIp/jXoDfPB0MNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EnTkzw1z9cmx4wUIoJX38qyQiRzdnwBE4vkYNGLJkXh3RAHFydSlho5fdhfqzVn+4
         JdZyIYhk/Rq+WWy7OK5TA+f3MT6czYNLWnB3mtxJKS6q4AWf//Bs2zZYK+T2n5C/gN
         U9pN9OxPGf9jWqBg1p6YaKOV2UCFT8wOmt8dug5jNDaFuGGxb3RWp1rjnILLw6uR76
         x8dEz6tqeZVelHKzOf3v8GU/imFw5bXmwMfC8n7xQOKlb2kWagnNZxMxkQRs+7N2qd
         8/yi1+QcyNfDBSyUsjlsFKvLcLBaMvmRm3zra0HOzXog6CLmbKBfTsl9FYNgX5kZIP
         OqYzYi4ahTW8g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1puU8o-0005J4-Uo; Thu, 04 May 2023 10:16:43 +0200
Date:   Thu, 4 May 2023 10:16:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <ZFNp6mzcvUyX-eon@hovoldconsulting.com>
References: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please use a more succinct Subject. The current one is over 80 chars
which generally too long. Please also check the grammar (e.g. "devices
is") and make sure that the subject reflects what your patch does (and
not what it did in v1).

On Thu, May 04, 2023 at 10:20:52AM +0530, Udipto Goswami wrote:
> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, make sure to resume
> dwc3 then allow the function to proceed.

As this fixes a crash/hang you should also add a Fixes and CC-stable
tag.

> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v8: Replace pm_runtime_get_sync with pm_runtime_resume_and get.
> v7: Replaced pm_runtime_put with pm_runtime_put_sync & returned proper values.
> v6: Added changes to handle get_dync failure appropriately.
> v5: Reworked the patch to resume dwc3 while accessing the registers.
> v4: Introduced pm_runtime_get_if_in_use in order to make sure dwc3 isn't
> 	suspended while accessing the registers.
> v3: Replace pr_err to dev_err. 
> v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.
> 
>  drivers/usb/dwc3/debugfs.c | 99 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index e4a2560b9dc0..a996e3580150 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -332,6 +332,11 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
>  	unsigned int		current_mode;
>  	unsigned long		flags;
>  	u32			reg;
> +	int			ret;
> +
> +	ret = pm_runtime_resume_and_get(dwc->dev);
> +	if (ret < 0)
> +		return ret;
>  
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
> @@ -349,6 +354,7 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
>  		break;
>  	}
>  	spin_unlock_irqrestore(&dwc->lock, flags);

Add a newline here for symmetry.

> +	pm_runtime_put_sync(dwc->dev);
>  
>  	return 0;
>  }
> @@ -395,6 +401,11 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
>  	struct dwc3		*dwc = s->private;
>  	unsigned long		flags;
>  	u32			reg;
> +	int			ret;
> +
> +	ret = pm_runtime_resume_and_get(dwc->dev);
> +	if (ret < 0)
> +		return ret;
>  
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> @@ -414,6 +425,7 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
>  		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
>  	}
>  
> +	pm_runtime_put_sync(dwc->dev);

For consistency and readability, add a newline here before the return
statement. Same below.

>  	return 0;
>  }
>  
 
> @@ -584,6 +615,7 @@ static ssize_t dwc3_link_state_write(struct file *file,
>  	char			buf[32];
>  	u32			reg;
>  	u8			speed;
> +	int			ret;
>  
>  	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
>  		return -EFAULT;
> @@ -603,11 +635,16 @@ static ssize_t dwc3_link_state_write(struct file *file,
>  	else
>  		return -EINVAL;
>  
> +	ret = pm_runtime_resume_and_get(dwc->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
>  	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
>  		spin_unlock_irqrestore(&dwc->lock, flags);
> -		return -EINVAL;
> +		pm_runtime_put_sync(dwc->dev);
> +		return ret;

Why are you changing the return value here? That's simply wrong.

>  	}
>  
>  	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
> @@ -616,12 +653,14 @@ static ssize_t dwc3_link_state_write(struct file *file,
>  	if (speed < DWC3_DSTS_SUPERSPEED &&
>  	    state != DWC3_LINK_STATE_RECOV) {
>  		spin_unlock_irqrestore(&dwc->lock, flags);
> -		return -EINVAL;
> +		pm_runtime_put_sync(dwc->dev);
> +		return ret;

Same here.

>  	}
>  
>  	dwc3_gadget_set_link_state(dwc, state);
>  	spin_unlock_irqrestore(&dwc->lock, flags);
>  
> +	pm_runtime_put_sync(dwc->dev);
>  	return count;
>  }
>  
 
> @@ -667,6 +712,12 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
>  	unsigned long		flags;
>  	u32			mdwidth;
>  	u32			val;
> +	int			ret;
> +
> +	ret = pm_runtime_resume_and_get(dwc->dev);
> +	if (ret < 0)
> +		pm_runtime_put_sync(dwc->dev);
> +		return ret;

As the build bot reported, you forgot to remove pm_runtime_put_sync()
here which means that you just broke this function which now always
returns some random stack data.

>  
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
> @@ -679,6 +730,7 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
>  	seq_printf(s, "%u\n", val);
>  	spin_unlock_irqrestore(&dwc->lock, flags);
>  
> +	pm_runtime_put_sync(dwc->dev);
>  	return 0;
>  }

Johan
