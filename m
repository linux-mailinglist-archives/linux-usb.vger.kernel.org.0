Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED262FA7BF
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 18:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436623AbhARRm7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 12:42:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:44058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407233AbhARRmu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 12:42:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1932223E8;
        Mon, 18 Jan 2021 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610991729;
        bh=BKmkZsywkiXf9Rw/WMG3OG8Ur+PYlPCLSolbSvxVsys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L0VE8HRjzsSK2Sj3qVozvCbA3X1j7uXgeRPez9qdWF3buCQ0trmpvedRrr3/qzram
         m1LflRjeeyepTfeYFsN+8ggt0Zv5r0CqKhw6rscEhR0k2Me7p2L7NV6rNYZrPxdYLU
         9ImGDPD/LHQa1EG9yyCIlaBlDjOIhcnc5NL8bj0s=
Date:   Mon, 18 Jan 2021 18:42:07 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@nxp.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Dejin Zheng <zhengdejin5@gmail.com>, Bin Liu <b-liu@ti.com>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 00/11] usb: Support USB 3.2 multi-lanes
Message-ID: <YAXIb2ABpnRR5PCc@kroah.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 13, 2021 at 06:52:37PM -0800, Thinh Nguyen wrote:
> A USB SuperSpeed Plus device may operate at different speed and lane count
> (i.e. gen2x2, gen1x2, or gen2x1). The DWC_usb32 IP supports SuperSpeed Plus
> gen2x2. To support this, this series update a few things to the USB gadget
> stack and dwc3 driver:
> 
> * Accept and parse new maximum_speed devicetree property strings
> * Introduce enum usb_ssp_rate to describe the speed in SuperSpeed Plus genXxY
> * Capture the connected and max supported usb_ssp_rate
> * Report the device sublink speeds base on the usb_ssp_rate in the BOS
>   descriptor
> * Introduce gadget ops to select SuperSpeed Plus various transfer rate and lane
>   count
> * Update dwc3 driver to support the above changes

I've taken the first 5 patches now, I'll wait for the DT maintainers and
dwc3 maintainers to review the rest before I can take them.  Feel free
to rebase and resend the smaller set of patches if that makes it easier
for them to review.

thanks,

greg k-h
