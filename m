Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7CE2FE409
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 08:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbhAUHee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 02:34:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:21972 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727718AbhAUHdg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Jan 2021 02:33:36 -0500
IronPort-SDR: buafFQ62VEW5UJen3JTWquNkR1q4qsqW8X0+3L09KTsYHWpmjbuq8MPJz1Z+Ub7T9letiDfrZ9
 LX9KR9OSeuvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197965961"
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="197965961"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 23:31:44 -0800
IronPort-SDR: IwLJLE7bnqAyAbUodJ2eBOVv8dYmqDgm2/n14j37EBpAiB8x/8vb8DPTQ5XU3O8rNkIfJM/r42
 Ub4jXW6tOnvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,363,1602572400"; 
   d="scan'208";a="467368199"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 Jan 2021 23:31:41 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 21 Jan 2021 09:31:39 +0200
Date:   Thu, 21 Jan 2021 09:31:39 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] usb: typec: tcpci_maxim: Drop GPIO includes
Message-ID: <20210121073139.GB423216@kuha.fi.intel.com>
References: <20210120225045.173556-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120225045.173556-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 20, 2021 at 11:50:45PM +0100, Linus Walleij wrote:
> This driver includes the legacy GPIO header <linux/gpio.h>,
> the new GPIO header <linux/gpio/consumer.h> and
> the deprecated OF GPIO header <linux/of_gpio.h> yet
> fail to use symbols from any of them, so drop these
> includes.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index 319266329b42..0e2bb1235ab5 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -5,13 +5,10 @@
>   * MAXIM TCPCI based TCPC driver
>   */
>  
> -#include <linux/gpio.h>
> -#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <linux/usb/pd.h>
>  #include <linux/usb/tcpm.h>
> -- 
> 2.29.2

thanks,

-- 
heikki
