Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA561DB89A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 17:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgETPns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 11:43:48 -0400
Received: from mga01.intel.com ([192.55.52.88]:33285 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgETPns (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 11:43:48 -0400
IronPort-SDR: d4XVXRvARZTTc5tjmBNslgNIY7lzPUGrVIlDdX8FRDSK254EI3ISzSt9hrb8OuvFEj3osn3tWa
 G2MIC1njQYXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 08:43:47 -0700
IronPort-SDR: m8I4I48/3lz7A90KqUPZ98vkys5usD4jl1B3Hjky/ZGP4areV/4WUoJmzTcJ3eD6crvKhyRBrF
 GlWpTGXfiEow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="374116363"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2020 08:43:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 20 May 2020 18:43:44 +0300
Date:   Wed, 20 May 2020 18:43:44 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        shawn.guo@linaro.org
Subject: Re: [PATCH v3] usb: typec: Ensure USB_ROLE_SWITCH is set as a
 dependency for tps6598x
Message-ID: <20200520154344.GD1910854@kuha.fi.intel.com>
References: <20200520153617.610909-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520153617.610909-1-bryan.odonoghue@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 04:36:17PM +0100, Bryan O'Donoghue wrote:
> When I switched on USB role switching for the tps6598x I completely forgot
> to add the Kconfig dependency.
> 
> Ensure USB_ROLE_SWITCH is selected to prevent the typs6598x driver being
> compiled in but the role-switch driver being compiled as a module, leading
> to link error.
> 
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index b4f2aac7ae8a..559dd06117e7 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -64,7 +64,8 @@ config TYPEC_HD3SS3220
>  config TYPEC_TPS6598X
>  	tristate "TI TPS6598x USB Power Delivery controller driver"
>  	depends on I2C
> -	select REGMAP_I2C
> +	depends on REGMAP_I2C
> +	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
>  	help
>  	  Say Y or M here if your system has TI TPS65982 or TPS65983 USB Power
>  	  Delivery controller.
> -- 
> 2.25.1

thanks,

-- 
heikki
