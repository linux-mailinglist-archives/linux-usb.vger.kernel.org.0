Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB048397DCF
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 02:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFBA5p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 20:57:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:34082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229718AbhFBA5o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 20:57:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81188613CA;
        Wed,  2 Jun 2021 00:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622595362;
        bh=lDefpu5GpWTrKSkY/HxQ9qy8JTZEZaC4aJwmlBwASUs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FdcC2PkYq4V3BdSW/dnKsq1thlMMK5LivlOUNJXjFyFO6YrGIi7sH3wo7olcMEDGz
         aeUlhRIUAhnxPuSFbzuyZQP/eJWoD43Hpm1wZO96dKAxwRyudU/hzYRPrMGhpPSyZy
         t4mHdicyhMQ2c1kr36YLzo3s3Z47sC1DWhdPVhU2SOfFCBW5/R1u0IQiZc7I2JVjp/
         Tv18Xa6yRRKUA3x/EaphAXKxIYvA5FzDLj7E9pHRp0Fl4i+nYJdW3TiU0KqTVwvd64
         YtPEyvsv4PyDwLZuGA74PBT7IO9tkJyeGxi5eV91dsYm4xYo8hYIOB6IairgVM6JcW
         g44psnhRhsRIw==
Date:   Wed, 2 Jun 2021 08:55:58 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: debugfs: Add and remove endpoint dirs
 dynamically
Message-ID: <20210602005558.GA26785@nchen>
References: <20210529192932.22912-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210529192932.22912-1-jackp@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-05-29 12:29:32, Jack Pham wrote:
> The DWC3 DebugFS directory and files are currently created once
> during probe.  This includes creation of subdirectories for each
> of the gadget's endpoints.  This works fine for peripheral-only
> controllers, as dwc3_core_init_mode() calls dwc3_gadget_init()
> just prior to calling dwc3_debugfs_init().
> 
> However, for dual-role controllers, dwc3_core_init_mode() will
> instead call dwc3_drd_init() which is problematic in a few ways.
> First, the initial state must be determined, then dwc3_set_mode()
> will have to schedule drd_work and by then dwc3_debugfs_init()
> could have already been invoked.  Even if the initial mode is
> peripheral, dwc3_gadget_init() happens after the DebugFS files
> are created, and worse so if the initial state is host and the
> controller switches to peripheral much later.  And secondly,
> even if the gadget endpoints' debug entries were successfully
> created, if the controller exits peripheral mode, its dwc3_eps
> are freed so the debug files would now hold stale references.
> 
> So it is best if the DebugFS endpoint entries are created and
> removed dynamically at the same time the underlying dwc3_eps are.
> Do this by calling dwc3_debugfs_create_endpoint_dir() as each
> endpoint is created, and conversely remove the DebugFS entry when
> the endpoint is freed.
> 
> Fixes: 41ce1456e1db ("usb: dwc3: core: make dwc3_set_mode() work properly")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Reviewed-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/dwc3/debug.h   |  3 +++
>  drivers/usb/dwc3/debugfs.c | 21 ++-------------------
>  drivers/usb/dwc3/gadget.c  |  3 +++
>  3 files changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
> index d0ac89c5b317..d223c54115f4 100644
> --- a/drivers/usb/dwc3/debug.h
> +++ b/drivers/usb/dwc3/debug.h
> @@ -413,9 +413,12 @@ static inline const char *dwc3_gadget_generic_cmd_status_string(int status)
>  
>  
>  #ifdef CONFIG_DEBUG_FS
> +extern void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep);
>  extern void dwc3_debugfs_init(struct dwc3 *d);
>  extern void dwc3_debugfs_exit(struct dwc3 *d);
>  #else
> +static inline void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep)
> +{  }
>  static inline void dwc3_debugfs_init(struct dwc3 *d)
>  {  }
>  static inline void dwc3_debugfs_exit(struct dwc3 *d)
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index 7146ee2ac057..5dbbe53269d3 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -886,30 +886,14 @@ static void dwc3_debugfs_create_endpoint_files(struct dwc3_ep *dep,
>  	}
>  }
>  
> -static void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep,
> -		struct dentry *parent)
> +void dwc3_debugfs_create_endpoint_dir(struct dwc3_ep *dep)
>  {
>  	struct dentry		*dir;
>  
> -	dir = debugfs_create_dir(dep->name, parent);
> +	dir = debugfs_create_dir(dep->name, dep->dwc->root);
>  	dwc3_debugfs_create_endpoint_files(dep, dir);
>  }
>  
> -static void dwc3_debugfs_create_endpoint_dirs(struct dwc3 *dwc,
> -		struct dentry *parent)
> -{
> -	int			i;
> -
> -	for (i = 0; i < dwc->num_eps; i++) {
> -		struct dwc3_ep	*dep = dwc->eps[i];
> -
> -		if (!dep)
> -			continue;
> -
> -		dwc3_debugfs_create_endpoint_dir(dep, parent);
> -	}
> -}
> -
>  void dwc3_debugfs_init(struct dwc3 *dwc)
>  {
>  	struct dentry		*root;
> @@ -940,7 +924,6 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
>  				&dwc3_testmode_fops);
>  		debugfs_create_file("link_state", 0644, root, dwc,
>  				    &dwc3_link_state_fops);
> -		dwc3_debugfs_create_endpoint_dirs(dwc, root);
>  	}
>  }
>  
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 65d9b7227752..dbba31d415d7 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2754,6 +2754,8 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
>  	INIT_LIST_HEAD(&dep->started_list);
>  	INIT_LIST_HEAD(&dep->cancelled_list);
>  
> +	dwc3_debugfs_create_endpoint_dir(dep);
> +
>  	return 0;
>  }
>  
> @@ -2797,6 +2799,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
>  			list_del(&dep->endpoint.ep_list);
>  		}
>  
> +		debugfs_remove_recursive(debugfs_lookup(dep->name, dwc->root));
>  		kfree(dep);
>  	}
>  }
> -- 
> 2.24.0
> 

-- 

Thanks,
Peter Chen

