Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F69D21EDA8
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 12:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgGNKIq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 06:08:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45291 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgGNKIp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 06:08:45 -0400
Received: by mail-lf1-f66.google.com with SMTP id s16so10980417lfp.12
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 03:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uTqnpqO1p2H9crnsGm8zXTh+L5Y76JLGHyWteZINito=;
        b=ZvHSm5EUWcpcYfIBgYpTmStxfz76ypOLbopXrwG28qVwy9l3A5dCtYXHtzzQQlEHBZ
         GxbidMpk2XF7ARcPDdx5KSleaBg12QF7lByj0xce1JLVGbmxejaWrRHSAPkBdykQZMDb
         yfu/we5okHP7vXVTzl5OK+LRV06XyLbiMvRiXAId0GdhRnq/GJcJ+PmQOzDRU5tWuSIG
         dQQovxrTbZ+TynPjx8vrRQeTjNEkhtkVXJ1NU3w5K+l5rjbVTi6XxnHJtL1PFiDBIX4V
         T0SGrYa5mlaiSapxl1+VL2JrWpqFky7YSHYF2f+/sKmaldUDL6/hxpzVJdcehMW5+wS2
         XaoA==
X-Gm-Message-State: AOAM531AHA257oidglg4sky8u5qgYHIVIkw52MgWXXNNghmHFqXlmwWh
        /Ce++zLondgQiqUwbdjCCS1nTjQ0jmE=
X-Google-Smtp-Source: ABdhPJw7uolcvtB9a20Z6oOY3DZc9RJmUbi62pN8Q778NR89jnSQUmMgMadJqgnC3Fjim1tBZjJwvw==
X-Received: by 2002:a19:7407:: with SMTP id v7mr1752075lfe.4.1594721323738;
        Tue, 14 Jul 2020 03:08:43 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v11sm4576919ljh.119.2020.07.14.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 03:08:40 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jvHrn-0006Yb-10; Tue, 14 Jul 2020 12:08:51 +0200
Date:   Tue, 14 Jul 2020 12:08:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Angelo Dureghello <angelo.dureghello@timesys.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] USB: serial: add support for MaxLinear XR21V1412
Message-ID: <20200714100851.GB3453@localhost>
References: <20200709222126.5055-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709222126.5055-1-angelo.dureghello@timesys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 10, 2020 at 12:21:26AM +0200, Angelo Dureghello wrote:
> From some researches, this driver is available from the IC
> constructor site, but for older kernel versions. From there, decided
> to add a much simplier mainline version, written from scratch.

Do you have a pointer to the vendor sources for reference?

> This initial simple version is implemented without any flow control,
> tested mainly at 115200, but all standard baud rates are supported
> and applied as per serial terminal settings.
> 
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> Reported-by: kernel test robot <lkp@intel.com>

No need for a reported-by if the robot catches issues during review.
Just mention it in the changelog as you already did below.

> ---
> Changes for v2:
> - fix test robot warning, PARITY_ defines renamed
> ---
>  drivers/usb/serial/Kconfig     |   9 +
>  drivers/usb/serial/Makefile    |   1 +
>  drivers/usb/serial/xr21v1412.c | 361 +++++++++++++++++++++++++++++++++
>  3 files changed, 371 insertions(+)
>  create mode 100644 drivers/usb/serial/xr21v1412.c

Thanks for the submitting this.

There was another driver for this device posted recently, and which
appears to have more features:

	https://lore.kernel.org/r/20200607162350.21297-2-mani@kernel.org

Would you mind taking a look and see if that one would work for you?

I had some comments on the latest version that needs to be addressed,
but I'm assuming Manivannan is working on a v5?

Johan
