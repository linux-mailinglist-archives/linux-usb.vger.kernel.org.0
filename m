Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B523A3D0B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 09:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhFKH1l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 03:27:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230233AbhFKH1k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 03:27:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 288E9613AE;
        Fri, 11 Jun 2021 07:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623396342;
        bh=nIPlKxHEO4UIHCR3fparQRIsA2k+XaED7PZ22o+1BkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yujwkmxWVgFXpK93N37PZX3GeLE9GLAJPPU9vmGIBSvncDfdVAquZXG0Er6UoOuVQ
         evSED6udHgdfBR9ZBRFpa51bBLrscJIqUJ0kQ6ki72Q+OcEfdxrl745Pnwc1oO9TBR
         w8GOvNBY+dfA0i0YjE/biSiVM8YX7NjSa2r8VTkQ=
Date:   Fri, 11 Jun 2021 09:25:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yuan Fang <fangyuanseu@gmail.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        Yuan Fang <yuan.fang@verisilicon.com>
Subject: Re: [PATCH] drivers/usb/dwc3: Set PHY ready after soft reset done
Message-ID: <YMMP9KuZs3RD3xzC@kroah.com>
References: <20210611071805.9169-1-yuan.fang@verisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611071805.9169-1-yuan.fang@verisilicon.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 11, 2021 at 03:18:05PM +0800, Yuan Fang wrote:
> It's more safe to set PHY ready after soft reset done
> 
> Let's consider a test case like this:
> I have a usb PHY which don't need SW initial before access
> it, But i have a wrong PHY clock default setting in PHY
> register which means PHY is not ready in fact.
> in dwc3_core_init, dwc3_core_get_phy will return 0 despite
> usb get PHYs with return -ENODEV, and set phys_ready=true
> but at this point, we can not say phys is ready or at least
> it not safe to do that.
> then, go on with dwc3_core_soft_reset,dwc3 reset core and
> PHY, as phy->init is NULL in this case, so, usb_phy_init
> do nothing and go on with a while loop which cost 1000*
> 20 ms, and return with -ETIMEDOUT
> check phys_ready is set to TRUE but actually not.
> Move phys_ready after soft reset done is more reasonable
> and don't see side-effect yet.
> 
> Signed-off-by: Yuan Fang <yuan.fang@verisilicon.com>

What commit does this "fix"?  Should it also be backported to older
kernels?  If so, how far back?

thanks,

greg k-h
