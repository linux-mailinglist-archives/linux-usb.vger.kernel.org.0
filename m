Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753A51DB04D
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 12:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgETKfp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 06:35:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:8766 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgETKfp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 06:35:45 -0400
IronPort-SDR: OgHCUId0pRjRis7Wibz+2FCjjjsWS4gSk3YwIN//oMBUNMxbMjD2ZLu3gK8V+yv/dFOqmXUXh/
 w6x/FnTtL/2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 03:35:45 -0700
IronPort-SDR: aVdlaxlU0j9UuIIFNF2GXnOoWYenkjE1whX8bIVd89jEh4EAWrvLNnl9bBGiRo+beJmnYeSf7O
 nubXdYvTbvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; 
   d="scan'208";a="374037477"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2020 03:35:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 20 May 2020 13:35:42 +0300
Date:   Wed, 20 May 2020 13:35:42 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for
 tps6598x
Message-ID: <20200520103542.GF1298122@kuha.fi.intel.com>
References: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 11:05:26AM +0100, Bryan O'Donoghue wrote:
> When I switched on USB role switching for the tps6598x I completely forgot
> to add the Kconfig dependency.
> 
> This patch ensures the dependency is there to prevent compilation error
> when role-switching is off.

There are stubs for the those functions, so there should not be any
compilation errors.

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/typec/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index b4f2aac7ae8a..4ea18301b15e 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -64,6 +64,7 @@ config TYPEC_HD3SS3220
>  config TYPEC_TPS6598X
>  	tristate "TI TPS6598x USB Power Delivery controller driver"
>  	depends on I2C
> +	depends on USB_ROLE_SWITCH

How about this:

	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH

We then would have an option to use this driver even without that when
its not needed.


thanks,

-- 
heikki
