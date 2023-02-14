Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80256964BB
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 14:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbjBNNbB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 08:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjBNNbB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 08:31:01 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB132449E
        for <linux-usb@vger.kernel.org>; Tue, 14 Feb 2023 05:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676381460; x=1707917460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aTHjb128JXz1Ez9XCLLld2te+sMXdqP6IUSjgty5HRM=;
  b=fM1qWT9jQQy42jbI+TMpOTjomdRajZ/CofV/b6O/GLzakHEY/ytNt0uN
   w5CzLwbZry9XVMvuOmliCp+fKrQNSzfPUS+ln6jkB2gvDIdjRdPb/7Hqo
   gsIhQwHZUvK2fOJIN21/MP52v2757jxKqFKjTNz8j/Yk5c7Q+mr7lazMZ
   Na8xSzm5yQbYVq++kJj2cKK4k+V6Yk4iU+cf03VGtIKw4gLinBTInAm+T
   UDNkjrtWwVeD4fSkmBjSw9Lb175g17veIMfjEfC8J9Dr37yUQQZNJryPN
   TBJhV23U8gq6+2SUURqIWuJdbks7/qIpZIJqZXIunaUmZDcGZK0aardJv
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395773411"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="395773411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 05:30:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="812027056"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="812027056"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 14 Feb 2023 05:30:57 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 14 Feb 2023 15:30:56 +0200
Date:   Tue, 14 Feb 2023 15:30:56 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        rajaram.regupathy@intel.com
Subject: Re: [PATCH v3 1/2] usb: typec: pd: Remove usb_suspend_supported
 sysfs from sink PDO
Message-ID: <Y+uNEM7cUB6/yCWb@kuha.fi.intel.com>
References: <20230214114543.205103-1-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214114543.205103-1-saranya.gopal@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 14, 2023 at 05:15:42PM +0530, Saranya Gopal wrote:
> As per USB PD specification, 28th bit of fixed supply sink PDO
> represents "higher capability" attribute and not "usb suspend
> supported" attribute. So, this patch removes the usb_suspend_supported
> attribute from sink PDO.
> 
> Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Type-C")
> Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes from v2:
>  - Patch was split into 2
>  - This patch only removes usb_suspend_supported attribute for sink PDOs
> 
>  drivers/usb/typec/pd.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index dc72005d68db..b5ab26422c34 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -161,7 +161,6 @@ static struct device_type source_fixed_supply_type = {
>  
>  static struct attribute *sink_fixed_supply_attrs[] = {
>  	&dev_attr_dual_role_power.attr,
> -	&dev_attr_usb_suspend_supported.attr,
>  	&dev_attr_unconstrained_power.attr,
>  	&dev_attr_usb_communication_capable.attr,
>  	&dev_attr_dual_role_data.attr,
> -- 
> 2.25.1

-- 
heikki
