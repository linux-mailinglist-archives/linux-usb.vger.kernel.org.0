Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273D91DB4C8
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgETNRn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:17:43 -0400
Received: from mga18.intel.com ([134.134.136.126]:65461 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgETNRm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 09:17:42 -0400
IronPort-SDR: MKmqH0TJUGm1RshiChG9nfkQFDCVCG9BdGEgFajYjSMS82uGB5eIGlZ8flQac0PHw4RFFaTguU
 ZjzOH+4Ggf5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 06:17:31 -0700
IronPort-SDR: I5yj2hkf7F5rl6tT198MLvxKQo9DmwZjIwTNch/Zd+0Ji/70eyEl48zU5O9gvk4yTb8VzWdKPu
 KwCnu3iMv2SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="374074335"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2020 06:17:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 20 May 2020 16:17:28 +0300
Date:   Wed, 20 May 2020 16:17:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] usb: typec: Ensure USB_ROLE_SWITCH is selected
 for tps6598x
Message-ID: <20200520131728.GJ1298122@kuha.fi.intel.com>
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
 <20200520123312.320281-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200520123312.320281-2-bryan.odonoghue@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 01:33:11PM +0100, Bryan O'Donoghue wrote:
> When I switched on USB role switching for the tps6598x I completely forgot
> to add the Kconfig dependency.
> 
> Ensure USB_ROLE_SWITCH is selected to prevent the typs6598x driver being
> compiled in but the role-switch driver being compiled as a module, leading
> to link error.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/typec/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index b4f2aac7ae8a..a6cdf4ec0be6 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -64,6 +64,7 @@ config TYPEC_HD3SS3220
>  config TYPEC_TPS6598X
>  	tristate "TI TPS6598x USB Power Delivery controller driver"
>  	depends on I2C
> +	select USB_ROLE_SWITCH
>  	select REGMAP_I2C
>  	help
>  	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power

The same here. You can depend on the class, but you do not select it.
Note that we need to be able to handle this situation:

CONFIG_TYPEC_TPS6598X=y
CONFIG_USB_ROLE_SWITCH=m

and this covers that case:

        depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH

thanks,

-- 
heikki
