Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067F335A03D
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhDINqM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:46:12 -0400
Received: from mga03.intel.com ([134.134.136.65]:37209 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231946AbhDINqL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 09:46:11 -0400
IronPort-SDR: uU1lmLc0tAhWpi8jphJgV0xXI9maOYHR/OmgHr2lwnnpxylmqmNoLJ+0AEZVekmAJvwEruFiJm
 Mcxf3ni4qrMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="193802993"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="193802993"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 06:45:58 -0700
IronPort-SDR: fK/py1X7RbqSt7svUIjgm5SiZ1U3f46Grzo6DxG7btP7MMYelBptpw2Q4GlyIG9gFup0pgsOG3
 8D4WAEw9nkhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="520287220"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 09 Apr 2021 06:45:55 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 09 Apr 2021 16:45:54 +0300
Date:   Fri, 9 Apr 2021 16:45:54 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: tcpm: Add support for altmodes
Message-ID: <YHBakgeGd1f69HyL@kuha.fi.intel.com>
References: <20210409134033.105834-1-hdegoede@redhat.com>
 <20210409134033.105834-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409134033.105834-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 09, 2021 at 03:40:32PM +0200, Hans de Goede wrote:
> Add support for altmodes described in the usb-connector fwnode
> associated with the Type-C controller by calling the new
> typec_port_register_altmodes_from_fwnode() helper for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index ce7af398c7c1..70a5d6ca0053 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6072,6 +6072,10 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  		goto out_role_sw_put;
>  	}
>  
> +	typec_port_register_altmodes(port->typec_port,
> +				     &tcpm_altmode_ops, port,
> +				     port->port_altmode, ALTMODE_DISCOVERY_MAX);
> +
>  	mutex_lock(&port->lock);
>  	tcpm_init(port);
>  	mutex_unlock(&port->lock);
> -- 
> 2.30.2

-- 
heikki
