Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1484191F5
	for <lists+linux-usb@lfdr.de>; Mon, 27 Sep 2021 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhI0KIO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Sep 2021 06:08:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:55551 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233703AbhI0KIL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Sep 2021 06:08:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="246934961"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; 
   d="scan'208";a="246934961"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2021 03:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; 
   d="scan'208";a="615717554"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 27 Sep 2021 03:06:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 27 Sep 2021 13:06:29 +0300
Date:   Mon, 27 Sep 2021 13:06:29 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH 1/1] usb: typec: tcpci: don't handle vSafe0V event if
 it's not enabled
Message-ID: <YVGXpWH1qqppJpNv@kuha.fi.intel.com>
References: <20210926101415.3775058-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926101415.3775058-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 26, 2021 at 06:14:15PM +0800, Xu Yang wrote:
> USB TCPCI Spec, 4.4.3 Mask Registers:
> "A masked register will still indicate in the ALERT register, but shall
> not set the Alert# pin low."
> 
> Thus, the Extended Status will still indicate in ALERT register if vSafe0V
> is detected by TCPC even though being masked. In current code, howerer,
> this event will not be handled in detection time. Rather it will be
> handled when next ALERT event coming(CC evnet, PD event, etc).
> 
> Tcpm might transition to a wrong state in this situation. Thus, the vSafe0V
> event should not be handled when it's masked.
> 
> Fixes: 766c485b86ef ("usb: typec: tcpci: Add support to report vSafe0V")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 9858716698df..c15eec9cc460 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -696,7 +696,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		tcpm_pd_receive(tcpci->port, &msg);
>  	}
>  
> -	if (status & TCPC_ALERT_EXTENDED_STATUS) {
> +	if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_STATUS)) {
>  		ret = regmap_read(tcpci->regmap, TCPC_EXTENDED_STATUS, &raw);
>  		if (!ret && (raw & TCPC_EXTENDED_STATUS_VSAFE0V))
>  			tcpm_vbus_change(tcpci->port);
> -- 
> 2.25.1

-- 
heikki
