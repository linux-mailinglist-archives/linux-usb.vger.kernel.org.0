Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAE6C33C2
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 14:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387560AbfJAMEb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 08:04:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:16422 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387477AbfJAMEb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 08:04:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 05:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="205051376"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 05:04:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Oct 2019 15:04:20 +0300
Date:   Tue, 1 Oct 2019 15:04:20 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: usb: typec: tcpm: Fix a signedness
 bug in tcpm_fw_get_caps()
Message-ID: <20191001120420.GA26399@kuha.fi.intel.com>
References: <20190926125310.GA9967@roeck-us.net>
 <20191001120117.GA23528@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001120117.GA23528@mwanda>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 03:01:17PM +0300, Dan Carpenter wrote:
> The "port->typec_caps.data" and "port->typec_caps.type" variables are
> enums and in this context GCC will treat them as an unsigned int so they
> can never be less than zero.
> 
> Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks OK to me.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: preserve the error code
> 
>  drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 96562744101c..5f61d9977a15 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4409,18 +4409,20 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  	/* USB data support is optional */
>  	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
>  	if (ret == 0) {
> -		port->typec_caps.data = typec_find_port_data_role(cap_str);
> -		if (port->typec_caps.data < 0)
> -			return -EINVAL;
> +		ret = typec_find_port_data_role(cap_str);
> +		if (ret < 0)
> +			return ret;
> +		port->typec_caps.data = ret;
>  	}
>  
>  	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
>  	if (ret < 0)
>  		return ret;
>  
> -	port->typec_caps.type = typec_find_port_power_role(cap_str);
> -	if (port->typec_caps.type < 0)
> -		return -EINVAL;
> +	ret = typec_find_port_power_role(cap_str);
> +	if (ret < 0)
> +		return ret;
> +	port->typec_caps.type = ret;
>  	port->port_type = port->typec_caps.type;
>  
>  	if (port->port_type == TYPEC_PORT_SNK)
> -- 
> 2.20.1

thanks,

-- 
heikki
