Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D3F339E5E
	for <lists+linux-usb@lfdr.de>; Sat, 13 Mar 2021 14:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhCMN4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Mar 2021 08:56:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:34818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229615AbhCMNzt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 13 Mar 2021 08:55:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38BF064ECC;
        Sat, 13 Mar 2021 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615643749;
        bh=HZDFAaAc+30zj26a6rHFHmvPP4XFn4P7Za6e7XITPq8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lO7JHPo4f6/WB/Xv9sDqVR82RDOtiY1K/UipRnUEWaBbNnn/32huTsonbccHO/v8F
         dyuoeOT1YDjIHNXJzF4Ftwl66ZaNA+zOKBgxgK0ycWfgF8VElW5PBsrum7eK/Bo66m
         MJt1qTOHHQKTcUOE+7y7R7gLZcG3QS91Vm2huCVPJ7GaW7IfHmrrO+79lXROiSdpYS
         zVvvCwEKEgRtMKIH7DB5eOmLlyzXdpzSk9apm4WVRMLxte/lb8qHWlSoQjbBbYGUmr
         zISH2LavPJzv8itmB5+gmJsWhR/jK38gTkgwO3NqpmsmynmdyI9KKfAR1vi776uM05
         0VJ908SgjsETw==
Date:   Sat, 13 Mar 2021 21:55:40 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Frank Li <lznuaa@gmail.com>
Cc:     pawell@cadence.com, a-govindraju@ti.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dan.carpenter@oracle.com
Subject: Re: [PATCH 1/1] usb: cdns3: fix static checker warning.
Message-ID: <20210313135540.GA11729@b29397-desktop>
References: <20210310160125.810157-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310160125.810157-1-Frank.Li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-03-10 10:01:25, Frank Li wrote:
> The patch c450e48eb570: "usb: cdns3: add power lost support for
> system resume" from Feb 18, 2021, leads to the following static
> checker warning:
> 
>         drivers/usb/cdns3/core.c:551 cdns_resume()
>         error: uninitialized symbol 'ret'.
> 
> drivers/usb/cdns3/core.c
> 544
> 545     if (!role_changed) {
> 546            if (cdns->role == USB_ROLE_HOST)
> 547                  ret = cdns_drd_host_on(cdns);
> 548     else if (cdns->role == USB_ROLE_DEVICE)
> 549            ret = cdns_drd_gadget_on(cdns);
> 
> "ret" is uninitialized at else branch.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/usb/cdns3/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 5d486c8a9d99..bb739d88179f 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -527,7 +527,7 @@ int cdns_resume(struct cdns *cdns, u8 set_active)
>  	struct device *dev = cdns->dev;
>  	enum usb_role real_role;
>  	bool role_changed = false;
> -	int ret;
> +	int ret = 0;
>  
>  	if (cdns_power_is_lost(cdns)) {
>  		if (cdns->role_sw) {
> -- 
> 2.25.1
> 

Hi Frank,

If this issue is reported by Dan, you may add his reported-by tag.
Besides, please keep your signed-of-by tag as the same with your patch
author. I fixed both, you do not need to re-send.

-- 

Thanks,
Peter Chen

