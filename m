Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBA3C100426
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 12:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbfKRLai (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 06:30:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:42606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfKRLai (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 06:30:38 -0500
Received: from localhost (unknown [89.205.134.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 010B32067D;
        Mon, 18 Nov 2019 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574076637;
        bh=H3i+gHw8E0S3hgkR052bIbfInTjMeL3lLEtWgGswTJY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BeskiS2+wbvC30svjRjA09BJCC5UY49TsjtkH3qtA1mGB57nFLtn0vl0u8pkDDrpX
         098BjahemcRJ9hsZrNasjSyBMiFKx9lJT+PrCzxtl5Vi4fpe73uc0mAteVd5f6s6Ck
         Y1H4hFLgFbHAGybYDQVGdrfDgCSLgo5FPeq/FtFA=
Date:   Mon, 18 Nov 2019 12:30:34 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        linux-usb@vger.kernel.org, Jui Chang Kuo <jckuo@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] usb: host: xhci-tegra: Correct phy enable sequence
Message-ID: <20191118113034.GF156486@kroah.com>
References: <1572859470-7823-1-git-send-email-nkristam@nvidia.com>
 <20191107153231.GC2580600@ulmo>
 <e36b8dad-768b-bc2e-6aba-1ee96fd9deeb@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36b8dad-768b-bc2e-6aba-1ee96fd9deeb@nvidia.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 09:49:52AM +0000, Jon Hunter wrote:
> Hi Greg,
> 
> On 07/11/2019 15:32, Thierry Reding wrote:
> > On Mon, Nov 04, 2019 at 02:54:30PM +0530, Nagarjuna Kristam wrote:
> >> XUSB phy needs to be enabled before un-powergating the power partitions.
> >> However in the current sequence, it happens opposite. Correct the phy
> >> enable and powergating partition sequence to avoid any boot hangs.
> >>
> >> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> >> Signed-off-by: Jui Chang Kuo <jckuo@nvidia.com>
> >> ---
> >>  drivers/usb/host/xhci-tegra.c | 25 +++++++++++++------------
> >>  1 file changed, 13 insertions(+), 12 deletions(-)
> > 
> > Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Let me know if you can pick this one up? This is fixing a boot
> regression on Tegra210.
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Will do so now, sorry for the delay.

greg k-h
