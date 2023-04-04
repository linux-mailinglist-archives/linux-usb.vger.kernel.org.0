Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E916D5E9D
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 13:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234754AbjDDLHD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 07:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbjDDLGt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 07:06:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724865BB4
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 04:05:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3C83A631E8
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 11:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B084C433D2;
        Tue,  4 Apr 2023 11:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680606301;
        bh=+SFqQvvB28r2ZYMZvxNnAPe6CaqFmc07V+6nNBdD7s8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bma96j8suKF0mBd5dULMCq9LYwYzfEumPujg4EXLrHmBw7xfD2+MjDTAsG5/t1mH4
         GPS8qgDA4nqIOS5lh+UXgrkWM7uTHfFyOwqyQCX0peM8yhiB2CktEQ1cpYC45hF+oR
         x/yTd4u0T0R66M+0YKV1LjJNHBzWZDyx8aJvzdxKqhngszSMk/KJWLt3sgvS8YJjd0
         DOQ0O+hdMho9oLqasnQF5NJJwn5SwiVjOqzgUYNeg1rfi2HSVpiIRmV37KjUQeR+ps
         QaLRbMgh2H9FHCmQcPeunTnvyL512EX/gLDTjjZaIDatRojHCtwJzDUvcE9GOeUWke
         4IjKxCmMdJ1hw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pjeTg-0006RH-SW; Tue, 04 Apr 2023 13:05:28 +0200
Date:   Tue, 4 Apr 2023 13:05:28 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 03:30:55PM +0530, Udipto Goswami wrote:
> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, bail out of debugfs
> function is dwc3 is suspended.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
> v4: Introduced pm_runtime_get_if_in_use in order to make sure dwc3 isn't
> suspended while accessing the registers.
> 
>  drivers/usb/dwc3/debugfs.c | 191 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 169 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index 850df0e6bcab..e57cafb7da4b 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -543,13 +543,25 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>  	enum dwc3_link_state	state;
>  	u32			reg;
>  	u8			speed;
> +	int			ret = 0;
> +
> +	ret = pm_runtime_get_if_in_use(dwc->dev);
> +	/* check if pm runtime get fails, bail out early */
> +	if (ret < 0)
> +		goto err_nolock;
> +
> +	if (!ret) {
> +		ret = -EINVAL;
> +		dev_err(dwc->dev,
> +				"Invalid operation, DWC3 suspended!");
> +		goto err_nolock;
> +	}

This is backwards. If you need the device to be active to access these
registers then you should resume it unconditionally instead of failing.

Johan
