Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B234415E71
	for <lists+linux-usb@lfdr.de>; Thu, 23 Sep 2021 14:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240793AbhIWMey (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Sep 2021 08:34:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:56473 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232201AbhIWMey (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Sep 2021 08:34:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203328869"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
   d="scan'208";a="203328869"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2021 05:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
   d="scan'208";a="613931973"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 23 Sep 2021 05:33:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Sep 2021 15:33:19 +0300
Date:   Thu, 23 Sep 2021 15:33:19 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: Fix spelling mistake "resolbed" ->
 "resolved"
Message-ID: <YUx0D+rQet+OSWMd@kuha.fi.intel.com>
References: <20210922060152.2892027-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922060152.2892027-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 22, 2021 at 02:01:52PM +0800, Xu Yang wrote:
> There is a spelling mistake in a comment. Fix it.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 9858716698df..864049631fbe 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -258,7 +258,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
>  	 * When port has drp toggling enabled, ROLE_CONTROL would only have the initial
>  	 * terminations for the toggling and does not indicate the final cc
>  	 * terminations when ConnectionResult is 0 i.e. drp toggling stops and
> -	 * the connection is resolbed. Infer port role from TCPC_CC_STATUS based on the
> +	 * the connection is resolved. Infer port role from TCPC_CC_STATUS based on the
>  	 * terminations seen. The port role is then used to set the cc terminations.
>  	 */
>  	if (reg & TCPC_ROLE_CTRL_DRP) {
> -- 
> 2.25.1

-- 
heikki
