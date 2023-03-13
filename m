Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D84A6B731F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 10:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCMJtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 05:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231207AbjCMJtL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 05:49:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C13126F5
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 02:49:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3864E61084
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 09:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48472C433EF;
        Mon, 13 Mar 2023 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678700946;
        bh=+V5vKZ2MkDLO7oYb9+VYVEFaLBPe5csRiNOtQLr9YPI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V2ncOUQnKfPhw8zL1jAxXBkCk22/f0dli3MnHczSNLaBAe0tMWUxmitOI4xW9j6az
         s7KMyyNLlcmvnXPrgWzv1OUiMdJaGFCfaS65+M6KGjwrzfkON615/2z76NfRL+Hfy4
         6hayq06rXsJKmyNRiK991WDAfG6rOnMr+vtFC2mo=
Date:   Mon, 13 Mar 2023 10:49:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <ZA7xkLTJ0dE4DQFE@kroah.com>
References: <20230313091837.19806-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313091837.19806-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 13, 2023 at 02:48:37PM +0530, Udipto Goswami wrote:
> When the dwc3 device is runtime suspended, various required clocks would
> get disabled and it is not guaranteed that access to any registers would
> work. Depending on the SoC glue, a register read could be as benign as
> returning 0 or be fatal enough to hang the system.
> 
> In order to prevent such scenarios of fatal errors, bail out of debugfs
> function is dwc3 is suspended.
> 
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
>  drivers/usb/dwc3/debugfs.c | 50 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index 850df0e6bcab..f921d4911ffc 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -544,6 +544,11 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>  	u32			reg;
>  	u8			speed;
>  
> +	if (pm_runtime_suspended(dwc->dev)) {
> +		seq_puts(s, "Invalid operation, DWC3 suspended!");
> +		return 0;

Why are you returning success if an error happened?

Same thing for all other responses.

thanks,

greg k-h
