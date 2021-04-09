Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8AD35A03E
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhDINrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:47:00 -0400
Received: from mga04.intel.com ([192.55.52.120]:50225 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231946AbhDINq5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 09:46:57 -0400
IronPort-SDR: Zt96R8I7XwazC4ODghaHcUbyndCNmLciKwZaE1UmGwWB7fLXWYt26O7daH9IoMCvhSTLnVNB66
 S20lkcMW+NOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="191614902"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="191614902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 06:46:43 -0700
IronPort-SDR: TeSjZVDC2XR6n2xYd7Ltpou7u/bRcBEozYrck3Z+8S9e3cg6LPTAKFUAyLZXQt62QJOsu/t3yx
 D6vcYG+g8Z4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="520287340"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Apr 2021 06:46:41 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 09 Apr 2021 16:46:40 +0300
Date:   Fri, 9 Apr 2021 16:46:40 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86/intel_cht_int33fe: Add displayport
 altmode fwnode to the connector fwnode
Message-ID: <YHBawH0/de540J4A@kuha.fi.intel.com>
References: <20210409134033.105834-1-hdegoede@redhat.com>
 <20210409134033.105834-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409134033.105834-4-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 09, 2021 at 03:40:33PM +0200, Hans de Goede wrote:
> Add a displayport altmode fwnode to the usb-connector fwnode,
> devices which use this driver support display-port altmode through
> the PI3USB30532 USB switch, this enables support for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  .../platform/x86/intel_cht_int33fe_typec.c    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
> index 48638d1c56e5..b61bad9cc8d2 100644
> --- a/drivers/platform/x86/intel_cht_int33fe_typec.c
> +++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
> @@ -124,12 +124,31 @@ static const struct software_node usb_connector_node = {
>  	.properties = usb_connector_properties,
>  };
>  
> +static const struct software_node altmodes_node = {
> +	.name = "altmodes",
> +	.parent = &usb_connector_node,
> +};
> +
> +static const struct property_entry dp_altmode_properties[] = {
> +	PROPERTY_ENTRY_U32("svid", 0xff01),
> +	PROPERTY_ENTRY_U32("vdo", 0x0c0086),
> +	{ }
> +};
> +
> +static const struct software_node dp_altmode_node = {
> +	.name = "displayport-altmode",
> +	.parent = &altmodes_node,
> +	.properties = dp_altmode_properties,
> +};
> +
>  static const struct software_node *node_group[] = {
>  	&fusb302_node,
>  	&max17047_node,
>  	&pi3usb30532_node,
>  	&displayport_node,
>  	&usb_connector_node,
> +	&altmodes_node,
> +	&dp_altmode_node,
>  	NULL
>  };

thanks,

-- 
heikki
