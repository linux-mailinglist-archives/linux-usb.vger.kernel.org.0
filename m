Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34151B01A2
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2020 08:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgDTGh3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 02:37:29 -0400
Received: from mga12.intel.com ([192.55.52.136]:15950 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgDTGh2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Apr 2020 02:37:28 -0400
IronPort-SDR: AaM9Due6kpl0q49vaiyZ2AQMIt2jDgBbbVBzWMWx9J/t9QJ77f4VqipvrTCEWSV7oqXH5Xfr6h
 V4ejCAx0/AeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2020 23:37:25 -0700
IronPort-SDR: TlFsRm2L0OHLpqW/BgXEzaPaTlmjK2y39+9ft9sLWVOcSXT545i+8t4H0CCFwUk3coYZuH+h2w
 F2wnLAi4bthw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="364912155"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 19 Apr 2020 23:37:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 20 Apr 2020 09:37:19 +0300
Date:   Mon, 20 Apr 2020 09:37:19 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Joe Perches <joe@perches.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: typec: Use the correct style for SPDX License
 Identifier
Message-ID: <20200420063719.GA3768833@kuha.fi.intel.com>
References: <20200419133051.GA7154@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200419133051.GA7154@nishad>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 19, 2020 at 07:00:55PM +0530, Nishad Kamdar wrote:
> This patch corrects the SPDX License Identifier style in
> header file related to USB Type-C support.
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used).
> 
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Reviewed-by Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302_reg.h b/drivers/usb/typec/tcpm/fusb302_reg.h
> index 00b39d365478..edc0e4b0f1e6 100644
> --- a/drivers/usb/typec/tcpm/fusb302_reg.h
> +++ b/drivers/usb/typec/tcpm/fusb302_reg.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * Copyright 2016-2017 Google, Inc
>   *
> -- 
> 2.17.1

thanks,

-- 
heikki
