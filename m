Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5B02DE7A7
	for <lists+linux-usb@lfdr.de>; Fri, 18 Dec 2020 17:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgLRQw7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Dec 2020 11:52:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:50640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725949AbgLRQw7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Dec 2020 11:52:59 -0500
Date:   Fri, 18 Dec 2020 17:53:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1608310338;
        bh=b0vCw3niKG+nHXwajThDo87Llk+WhfIiqYClPnLOG74=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=VNaayOs79C3fwx5CrP27Ys48QZCEXXHMfSUrn1zGypbwTSDzKfXorV7LXeX9SHJeN
         G8MyKqUuzcZtBvd53H1iA6aQG0emeax/180DUtZtZlYH16HRdSIQu2NiPZOsLNaQsm
         H0DoS2WcsS88DBMSfv7I3pkV+hkskPBeH/+xqK4M=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     mathias.nyman@linux.intel.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh@kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH] xhci: tegra: Delay for disabling LFPS detector
Message-ID: <X9zelLu26bcQd7bs@kroah.com>
References: <20201218164234.128762-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218164234.128762-1-jckuo@nvidia.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 19, 2020 at 12:42:34AM +0800, JC Kuo wrote:
> Occasionally, we are seeing some SuperSpeed devices resumes right after
> being directed to U3. This commits add 500us delay to ensure LFPS
> detector is disabled before sending ACK to firmware.
> 
> [   16.099363] tegra-xusb 70090000.usb: entering ELPG
> [   16.104343] tegra-xusb 70090000.usb: 2-1 isn't suspended: 0x0c001203
> [   16.114576] tegra-xusb 70090000.usb: not all ports suspended: -16
> [   16.120789] tegra-xusb 70090000.usb: entering ELPG failed
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 934be1686352..20cdc11f7dc6 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -623,6 +623,12 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
>  								     enable);
>  			if (err < 0)
>  				break;
> +
> +			/*
> +			 * wait 500us for LFPS detector to be disabled before sending ACK
> +			 */
> +			if (!enable)
> +				usleep_range(500, 1000);

Where does the magic 500us come from?  How can we "know" this is long
enough?

thanks,

greg k-h
