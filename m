Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAE4694E08
	for <lists+linux-usb@lfdr.de>; Mon, 13 Feb 2023 18:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjBMRcW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Feb 2023 12:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjBMRcU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Feb 2023 12:32:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66584AD26
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 09:32:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F280061214
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 17:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142E6C433EF;
        Mon, 13 Feb 2023 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1676309538;
        bh=KJsDL7JpE3SEaRnmMsAmzBb4rH8sI2bLWncK3J88MCw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LTOW2kMJ70QfKCLOC+0VxOz5IRHA7RukCVdbz0iBGcx2hLas67q1RADFJCLeph5Zo
         uGY7vSbcqx+6EyI87Qn6eOGNMiDCM+1RKxpW8AETDlUNh9JaJr5W1eRO/mOez9aS6h
         AMqYbrIBUa2ymx7HEPJ38DObwfVCmtdgXX0kYpxI=
Date:   Mon, 13 Feb 2023 16:19:43 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: Re: [PATCH v2] usb: typec: pd: Add higher_capability sysfs for sink
 PDO
Message-ID: <Y+pVDx84luyrJJv0@kroah.com>
References: <20230213140522.171578-1-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213140522.171578-1-saranya.gopal@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 13, 2023 at 07:35:22PM +0530, Saranya Gopal wrote:
> As per USB PD specification, 28th bit of sink fixed power supply
> PDO represents higher capability. If this bit is set, it indicates
> that the sink needs more than vsafe5V to provide full functionality.
> This patch replaces usb_suspend_supported sysfs with higher_capability
> sysfs for sink PDO.
> 
> Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Type-C")
> Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> ---
> Changed from v1:
>  - Added the valid values for the sysfs
>  - Wrapped the description alone to 80 characters
> 
>  .../ABI/testing/sysfs-class-usb_power_delivery        | 11 ++++++++++-
>  drivers/usb/typec/pd.c                                |  9 ++++++++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> index ce2b1b563cb3..1bf9d1d7902c 100644
> --- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> +++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> @@ -69,7 +69,7 @@ Description:
>  		This file contains boolean value that tells does the device
>  		support both source and sink power roles.
>  
> -What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/usb_suspend_supported
> +What:		/sys/class/usb_power_delivery/.../source-capabilities/1:fixed_supply/usb_suspend_supported

How does this relate to this specific change?  You didn't mention it in
the changelog at all :(

>  Date:		May 2022
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
> @@ -78,6 +78,15 @@ Description:
>  		will follow the USB 2.0 and USB 3.2 rules for suspend and
>  		resume.
>  
> +What:		/sys/class/usb_power_delivery/.../sink-capabilities/1:fixed_supply/higher_capability
> +Date:		February 2023
> +Contact:	Saranya Gopal <saranya.gopal@linux.intel.com>
> +Description:
> +		This file shows the value of the Higher capability bit in
> +		vsafe5V Fixed Supply Object. If the bit is set, then the sink
> +		needs more than vsafe5V(eg. 12 V) to provide full functionality.
> +		Valid values: 0, 1
> +
>  What:		/sys/class/usb_power_delivery/.../<capability>/1:fixed_supply/unconstrained_power
>  Date:		May 2022
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index dc72005d68db..59c537a5e600 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -48,6 +48,13 @@ usb_suspend_supported_show(struct device *dev, struct device_attribute *attr, ch
>  }
>  static DEVICE_ATTR_RO(usb_suspend_supported);
>  
> +static ssize_t
> +higher_capability_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", !!(to_pdo(dev)->pdo & PDO_FIXED_HIGHER_CAP));
> +}
> +static DEVICE_ATTR_RO(higher_capability);
> +
>  static ssize_t
>  unconstrained_power_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> @@ -161,7 +168,7 @@ static struct device_type source_fixed_supply_type = {
>  
>  static struct attribute *sink_fixed_supply_attrs[] = {
>  	&dev_attr_dual_role_power.attr,
> -	&dev_attr_usb_suspend_supported.attr,
> +	&dev_attr_higher_capability.attr,

So you deleted an attribute from this device, ok, but again, I don't
understand how this is considered a "fix" other than perhaps the old
attribute does not relate to this device?

And if so, then make that a single patch, with a Fixes: tag, and we can
properly backport that one, and then have a second patch that adds the
new attribute.

Again, adding a new attribute is a "new feature" not a fix, right?

thanks,

greg k-h
