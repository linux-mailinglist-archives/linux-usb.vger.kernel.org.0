Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BC71DB4B3
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgETNNp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:13:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:15623 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgETNNo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 09:13:44 -0400
IronPort-SDR: G2TIw4fFoddqkWAQcQWFS4pF7Jz8ptataprMf+ZpiSx8uLh38epSVFvOmbUpfgABVuKrSOPmdu
 vfh/KJLYz9dQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 06:13:29 -0700
IronPort-SDR: peFcPbaXbVvAhaVVOlLycAmgZ/jBhSVFQIcNvo8vhBf3lkF1J8JtxUSc3v9uHm+0GjU/hef69Z
 qsMnjsYK68dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="374073200"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 May 2020 06:13:28 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 20 May 2020 16:13:27 +0300
Date:   Wed, 20 May 2020 16:13:27 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] usb: typec: Ensure USB_ROLE_SWITCH is selected
 for hd3ss3220
Message-ID: <20200520131327.GI1298122@kuha.fi.intel.com>
References: <20200520123312.320281-1-bryan.odonoghue@linaro.org>
 <20200520123312.320281-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520123312.320281-3-bryan.odonoghue@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 01:33:12PM +0100, Bryan O'Donoghue wrote:
> kbuild found a compile error with recent additions to the tps6598x to add
> role-switch notification support. Digging into that error it turns out we
> needed to add "select USB_ROLE_SWITCH" to Kconfig.
> 
> Adding "depends on USB_ROLE_SWITCH" as had previously been done for this
> driver could still result in a link-time failure.
> 
> This patch propagates the tps6598x fix to hd3ss3220.
> 
> Fixes: da4b5d18dd94 ("usb: typec: add dependency for TYPEC_HD3SS3220")
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

NAK.

This is a switch consumer not supplier. The switch may not be needed
on every platform with this driver.

> ---
>  drivers/usb/typec/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index a6cdf4ec0be6..8f84304802f4 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -53,7 +53,7 @@ source "drivers/usb/typec/ucsi/Kconfig"
>  config TYPEC_HD3SS3220
>  	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
>  	depends on I2C
> -	depends on USB_ROLE_SWITCH
> +	select USB_ROLE_SWITCH
>  	help
>  	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
>  	  controller driver.

thanks,

-- 
heikki
