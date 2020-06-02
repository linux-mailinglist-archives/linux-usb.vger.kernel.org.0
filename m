Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285411EBDA4
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 16:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFBOHh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 10:07:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:58078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbgFBOHh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jun 2020 10:07:37 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 28E89206E2;
        Tue,  2 Jun 2020 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591106856;
        bh=Kxe02sh4uppUE31Aerod5G4HmiuIPTja5YVHA5eXzzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sIUxCfcowyXfBzBqMHUnWYWO6ZXLJsZ2F7Tj/qVTZ8jMRrg8wNORpXiayfRe6X660
         Dap27RuRFuyxA6KQH7EloNw30e7f6nVxqery8iN8PgdU9YOFl07DKJNjixL4yxT/kK
         Z0m/4Tx+LX7qkP2lH2e9rSgtgzhiI5xevdCYQFFs=
Date:   Tue, 2 Jun 2020 16:07:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Longfang Liu <liulongfang@huawei.com>
Cc:     linux-usb@vger.kernel.org, kong.kongxinwei@hisilicon.com,
        huangdaode@huawei.com, yisen.zhuang@huawei.com
Subject: Re: [PATCH] USB: ehci: reopen solution for Synopsys HC bug
Message-ID: <20200602140734.GA3284664@kroah.com>
References: <1591096489-9586-1-git-send-email-liulongfang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591096489-9586-1-git-send-email-liulongfang@huawei.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 02, 2020 at 07:14:49PM +0800, Longfang Liu wrote:
> A Synopsys USB2.0 core used in Huawei Kunpeng920 SoC has a bug which
> might cause the host controller not issuing ping.
> 
> The detailed description and solution:
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=2f7ac6c199978d0a0e407a12534201aa675a6482

That just points to an existing patch in the tree.  Why link to it here
in another patch?  And that patch is from 2011?

If you want to refer to an id already in the tree, you can do it like:
2f7ac6c19997 ("USB: ehci: add workaround for Synopsys HC bug")

> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
> Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/usb/host/ehci-pci.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> index 1a48ab1..7ff2cbd 100644
> --- a/drivers/usb/host/ehci-pci.c
> +++ b/drivers/usb/host/ehci-pci.c
> @@ -216,6 +216,13 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>  		ehci_info(ehci, "applying MosChip frame-index workaround\n");
>  		ehci->frame_index_bug = 1;
>  		break;
> +	case PCI_VENDOR_ID_HUAWEI:
> +		/* Synopsys HC bug */
> +		if (pdev->device == 0xa239) {
> +			ehci_info(ehci, "applying Synopsys HC workaround\n");
> +			ehci->has_synopsys_hc_bug = 1;
> +		}
> +		break;

Ah, you are adding another "broken" device to the tree, that makes more
sense.  Can you reword the above description a bit?

thanks,

greg k-h
