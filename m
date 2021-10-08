Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB89C4265A0
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 10:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhJHILp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 04:11:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:47848 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229670AbhJHILo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Oct 2021 04:11:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287341622"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="287341622"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 01:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="624660408"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 08 Oct 2021 01:09:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 08 Oct 2021 11:09:35 +0300
Date:   Fri, 8 Oct 2021 11:09:35 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     lindsey.stanpoor@gmail.com
Cc:     intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, gregkh@linuxfoundation.org, cnemo@tutanota.com
Subject: Re: [PATCH 1/1] usb: typec: altmodes/displayport: reorder
 dp_altmode_configured()
Message-ID: <YV/8v2FFcfamJoOI@kuha.fi.intel.com>
References: <20211006043257.23242-1-lindsey.stanpoor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006043257.23242-1-lindsey.stanpoor@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 05, 2021 at 09:32:57PM -0700, lindsey.stanpoor@gmail.com wrote:
> From: Cameron Nemo <cnemo@tutanota.com>
> 
> A recent commit [1] introduced an unintended behavioral change by
> reordering certain function calls. The sysfs_notify call for
> pin_assignment should only be invoked when the dp_altmode_notify call
> returns 0, and in the dp->data.conf == 0 case.
> 
> [1] https://lore.kernel.org/r/20210817215201.795062-8-hdegoede@redhat.com

You should refer the commit, not the mail. I think you could also use
the Fixes tag in this case, but then I guess Hans should pick this:

Fixes: fc27e04630e9 ("usb: typec: altmodes/displayport: Make dp_altmode_notify() more generic")

Either way, this is OK by me, so once you have cleaned the commit
message, please feel free to include my:
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> Signed-off-by: Cameron Nemo <cnemo@tutanota.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index c1d8c23baa39..a15ae78066e3 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -154,10 +154,17 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  
>  static int dp_altmode_configured(struct dp_altmode *dp)
>  {
> +	int ret;
> +
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
> +
> +	ret = dp_altmode_notify(dp);
> +	if (ret || !dp->data.conf)
> +		return ret;
> +
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
>  
> -	return dp_altmode_notify(dp);
> +	return 0;
>  }
>  
>  static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
> -- 
> 2.33.0

-- 
heikki
