Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CBA6937F8
	for <lists+linux-usb@lfdr.de>; Sun, 12 Feb 2023 16:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjBLPer (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Feb 2023 10:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBLPeq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Feb 2023 10:34:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A583A9A
        for <linux-usb@vger.kernel.org>; Sun, 12 Feb 2023 07:34:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E9A02B80D1C
        for <linux-usb@vger.kernel.org>; Sun, 12 Feb 2023 15:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37964C433D2;
        Sun, 12 Feb 2023 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1676216082;
        bh=PRIrZP1tRRqDI1tUXiLAdbQJySThuWIoGrZhmr0YPCY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aYfcusrsZsUtp1XqsQqYZJM4mmmL4vMuuB+zna83yuUTX8XkAmru/4/QvuKMoFBvG
         zZCL4jVJaZRmRTT6mskPz/p6/9fm+EpLIsu+hS/IL2CydxOzZU/j8KwiEMr/q4YYD+
         IntILv5Q0GHd1WqcGYZDn3sJPMzkYBl7GvVZaX1Q=
Date:   Sun, 12 Feb 2023 16:34:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: pd: Add higher_capability sysfs for sink PDO
Message-ID: <Y+kHDxDaHnXMPdfL@kroah.com>
References: <20230212144838.128595-1-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212144838.128595-1-saranya.gopal@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 12, 2023 at 08:18:38PM +0530, Saranya Gopal wrote:
> As per USB PD specification, 28th bit of sink fixed power supply
> PDO represents higher capability. If this bit is set, it indicates
> that the sink needs more than vsafe5V to provide full functionality.
> This patch replaces usb_suspend_supported sysfs with higher_capability
> sysfs for sink PDO.
> 
> Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Type-C")
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Where was this reviewed?  I don't see that on the list, am I missing it?

> Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> ---
>  .../ABI/testing/sysfs-class-usb_power_delivery         | 10 +++++++++-
>  drivers/usb/typec/pd.c                                 |  9 ++++++++-
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> index ce2b1b563cb3..59757118b6a3 100644
> --- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> +++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> @@ -69,7 +69,7 @@ Description:
>  		This file contains boolean value that tells does the device
>  		support both source and sink power roles.
>  
> -What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/usb_suspend_supported
> +What:		/sys/class/usb_power_delivery/.../source-capabilities/1:fixed_supply/usb_suspend_supported
>  Date:		May 2022
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
> @@ -78,6 +78,14 @@ Description:
>  		will follow the USB 2.0 and USB 3.2 rules for suspend and
>  		resume.
>  
> +What:		/sys/class/usb_power_delivery/.../sink-capabilities/1:fixed_supply/higher_capability
> +Date:		February 2023
> +Contact:	Saranya Gopal <saranya.gopal@linux.intel.com>
> +Description:
> +		This file shows the value of the Higher capability bit in vsafe5V Fixed Supply Object.
> +		If the bit is set, then the sink needs more than vsafe5V(eg. 12 V) to provide
> +		full functionality.

You don't explain what this file will show.  0/1? Y/N?  J/N?

Also, properly wrap your lines at 80 columns for documentation please.

And adding a new sysfs entry does not "Fix" anything, why is this tagged
as such?

thanks,

greg k-h
