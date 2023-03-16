Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FA16BCDE8
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 12:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbjCPLRx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 07:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjCPLRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 07:17:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFE0C5AC6
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 04:17:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ACBD0B8210B
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 11:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267BBC433D2;
        Thu, 16 Mar 2023 11:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678965440;
        bh=phyFTlXCcOX7OojwrbryX75Y75ifhllhGEs96cOlxIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AhvvPH14x7XejV95u5ZTdURt4wOJKpuWEjIcWR+N5NWS16aBUuIPZKQxglcp2CO/F
         KxygokbYXmbudGqqtpAXLvTJfHSmYCTfP4PQCFWcNxCZAyRectSZBTeUB4OKI8wq+3
         w7wOf2Ai7Z3GY9Y6XkOeXYc7L1Wm6YfAONn7LRWg=
Date:   Thu, 16 Mar 2023 12:17:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <ZBL6vT4OzdbfW+ZR@kroah.com>
References: <20230316065858.12687-1-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316065858.12687-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 16, 2023 at 12:28:58PM +0530, Udipto Goswami wrote:
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
> v3: Replace pr_err to dev_err.
> 
>  drivers/usb/dwc3/debugfs.c | 60 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index 850df0e6bcab..4a9d0994f3b4 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -544,6 +544,12 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>  	u32			reg;
>  	u8			speed;
>  
> +	if (pm_runtime_suspended(dwc->dev)) {
> +		dev_err(dwc->dev,
> +			"Invalid operation, DWC3 suspended!");
> +		return -EINVAL;
> +	}

What prevents the device from being suspened right after you check this?

thanks,

greg k-h
