Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E7A22F333
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 16:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbgG0O7O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 10:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgG0O7N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 10:59:13 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B68C061794
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 07:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=42wu5vJ4HqsdpVpb8ocOuHtna+9P01FRJGqSJgZWXYs=; b=WQmQbm0LY9WgoL2I3BEUv2P/Sv
        t43p8gRRN7MUL0esOlDRKvQKGzrf6ExDTSwmYT7ikmwhIhxquFmd998tjWi/wJ+qgkYxr1L1oUltj
        Xl7sFwRERwYsFMKS1VgbQuE9VGcAXUMuXxYIp6UUlH6Fz2HbK+r1tF1Fy+iVb86K91itggYekb3mG
        Rf2seDNSlmbd7l64p8BXGySn+P8KNZAL3UMRgbrNPy9bOQ0zXd9q2WESAAvCKiyvaMgZ/Qd8dpVcX
        esN1HNrjvwmBIOf7L4TqGsehx+RdkLCBIV/JMDQCLuWUibb93GjxZQsrEY6BZxaNK5/RUHqYHXaWu
        3sMmGPfg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k04as-0007go-Rf; Mon, 27 Jul 2020 14:59:11 +0000
Subject: Re: [RESEND PATCH v5] drivers: most: add USB adapter driver
To:     Christian Gromm <christian.gromm@microchip.com>,
        gregkh@linuxfoundation.org
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
References: <1595838646-12674-1-git-send-email-christian.gromm@microchip.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <616b53fb-3d51-2728-6bf1-a5d5dd0c5b4d@infradead.org>
Date:   Mon, 27 Jul 2020 07:59:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595838646-12674-1-git-send-email-christian.gromm@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi--

On 7/27/20 1:30 AM, Christian Gromm wrote:
> This patch adds the usb driver source file most_usb.c and
> modifies the Makefile and Kconfig accordingly.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> ---
> 
>  drivers/most/Kconfig    |   12 +
>  drivers/most/Makefile   |    2 +
>  drivers/most/most_usb.c | 1170 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1184 insertions(+)
>  create mode 100644 drivers/most/most_usb.c
> 
> diff --git a/drivers/most/Kconfig b/drivers/most/Kconfig
> index 58d7999..7b65320 100644
> --- a/drivers/most/Kconfig
> +++ b/drivers/most/Kconfig
> @@ -13,3 +13,15 @@ menuconfig MOST
>  	  module will be called most_core.
>  
>  	  If in doubt, say N here.
> +
> +if MOST
> +config MOST_USB_HDM
> +	tristate "USB"
> +	depends on USB && NET
> +	help
> +	  Say Y here if you want to connect via USB to network transceiver.
> +	  This device driver depends on the networking AIM.

What does that last sentence above mean?

> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called most_usb.
> +endif

thanks.
-- 
~Randy

