Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD804205B2
	for <lists+linux-usb@lfdr.de>; Mon,  4 Oct 2021 08:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhJDGKk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 02:10:40 -0400
Received: from mga04.intel.com ([192.55.52.120]:63978 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231935AbhJDGKk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Oct 2021 02:10:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="224060982"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; 
   d="scan'208";a="224060982"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2021 23:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; 
   d="scan'208";a="621606233"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 03 Oct 2021 23:08:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 04 Oct 2021 09:08:48 +0300
Date:   Mon, 4 Oct 2021 09:08:48 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: handle SRC_STARTUP state if cc changes
Message-ID: <YVqacFgq4fZzCawv@kuha.fi.intel.com>
References: <20210928111639.3854174-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928111639.3854174-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 28, 2021 at 07:16:39PM +0800, Xu Yang wrote:
> TCPM for DRP should do the same action as SRC_ATTACHED when cc changes in
> SRC_STARTUP state. Otherwise, TCPM will transition to SRC_UNATTACHED state
> which is not satisfied with the Type-C spec.
> 
> Per Type-C spec:
> DRP port should move to Unattached.SNK instead of Unattached.SRC if sink
> removed.
> 
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a4d37205df54..7f2f3ff1b391 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4876,6 +4876,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
>  		break;
>  	case SRC_ATTACHED:
> +	case SRC_STARTUP:
>  	case SRC_SEND_CAPABILITIES:
>  	case SRC_READY:
>  		if (tcpm_port_is_disconnected(port) ||
> -- 
> 2.25.1

-- 
heikki
