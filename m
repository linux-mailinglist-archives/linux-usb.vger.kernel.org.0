Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8636967D7
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 16:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbjBNPT7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 10:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbjBNPT6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 10:19:58 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7127E279B7
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 07:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676387997; x=1707923997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r1FY3NELVfcfG1dIaPb6vBXhRxuHo1qn4hsPsgt6WNY=;
  b=SQLyERyXvQdYJ+E2aSGw2d6QmkRwcG6uxE03e8kHqoXXFLaIHPXSy+63
   A4SHv983d5QnT9xxTz4RRqENaiWS+B08jtJFjLdzkddZuXQlzNow4JB0p
   7DEDQKIn/Sv1QMyvFYtPv9dBHo+f07JCPdvumMYuHGoBwKwZWjn5EXfzt
   XcE39/nX5lC2fPLZmWJJVVUDljNj3dt42axq800dmuNRyTWcxohBVjocO
   ZY8u1nmZuWNZhMrf5TXRMMjJ5uaqVIYLxrowxzw1jAwHeT/eJTK3+Lt5N
   05fWhO1eUbtBbkBl+oTw9yZb5lp7/o7/38/ysG7lgku+eMHPBq0Jlsw/E
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="395797968"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="395797968"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 07:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812071031"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="812071031"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 14 Feb 2023 07:19:54 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 14 Feb 2023 17:19:53 +0200
Date:   Tue, 14 Feb 2023 17:19:53 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        rajaram.regupathy@intel.com
Subject: Re: [PATCH v3 2/2] usb: typec: pd: Add higher capability sysfs for
 sink PDO
Message-ID: <Y+ummeWDWzka55n1@kuha.fi.intel.com>
References: <20230214114543.205103-1-saranya.gopal@intel.com>
 <20230214114543.205103-2-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214114543.205103-2-saranya.gopal@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 14, 2023 at 05:15:43PM +0530, Saranya Gopal wrote:
> 28th bit of fixed supply sink PDO represents higher capability.
> When this bit is set, the sink device needs more than vsafe5V
> (eg: 12 V) to provide full functionality. This patch adds
> this higher capability sysfs interface for sink PDO.
> 28th bit of fixed supply source PDO represents usb_suspend_supported
> attribute. This usb_suspend_supported sysfs is already exposed for
> source PDOs. This patch adds 'source-capabilities' in
> usb_suspend_supported sysfs documentation for additional clarity.
> 
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes from v2:
>  - Patch was split into 2 and this one adds new sysfs for sink PDO
> Changes from v1:
>  - Wrapped the description within 80 characters
>  - Added valid values for the new sysfs
> 
>  .../ABI/testing/sysfs-class-usb_power_delivery        | 11 ++++++++++-
>  drivers/usb/typec/pd.c                                |  8 ++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
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
> index b5ab26422c34..59c537a5e600 100644
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
> @@ -161,6 +168,7 @@ static struct device_type source_fixed_supply_type = {
>  
>  static struct attribute *sink_fixed_supply_attrs[] = {
>  	&dev_attr_dual_role_power.attr,
> +	&dev_attr_higher_capability.attr,
>  	&dev_attr_unconstrained_power.attr,
>  	&dev_attr_usb_communication_capable.attr,
>  	&dev_attr_dual_role_data.attr,
> -- 
> 2.25.1

-- 
heikki
