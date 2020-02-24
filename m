Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 726F816A7BA
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 14:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgBXNzy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 08:55:54 -0500
Received: from mga05.intel.com ([192.55.52.43]:49731 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgBXNzy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Feb 2020 08:55:54 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 05:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="349921950"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 24 Feb 2020 05:55:51 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 24 Feb 2020 15:55:51 +0200
Date:   Mon, 24 Feb 2020 15:55:51 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     jun.li@nxp.com
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: move to SNK_UNATTACHED if sink removed
 for DRP
Message-ID: <20200224135551.GA30452@kuha.fi.intel.com>
References: <1582128343-22438-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582128343-22438-1-git-send-email-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 20, 2020 at 12:05:43AM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Per typec spec:
> Figure 4-15 Connection State Diagram: DRP
> Figure 4-16 Connection State Diagram: DRP with Accessory and Try.SRC
> 	    Support
> Figure 4-17 Connection State Diagram: DRP with Accessory and Try.SNK
> 	    Support
> DRP port should move to Unattached.SNK instead of Unattached.SRC if
> sink removed.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 78077c2..3174180 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3680,8 +3680,12 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  	case SRC_SEND_CAPABILITIES:
>  	case SRC_READY:
>  		if (tcpm_port_is_disconnected(port) ||
> -		    !tcpm_port_is_source(port))
> -			tcpm_set_state(port, SRC_UNATTACHED, 0);
> +		    !tcpm_port_is_source(port)) {
> +			if (port->port_type == TYPEC_PORT_SRC)
> +				tcpm_set_state(port, SRC_UNATTACHED, 0);
> +			else
> +				tcpm_set_state(port, SNK_UNATTACHED, 0);
> +		}
>  		break;
>  	case SNK_UNATTACHED:
>  		if (tcpm_port_is_sink(port))
> -- 
> 2.7.4

thanks,

-- 
heikki
