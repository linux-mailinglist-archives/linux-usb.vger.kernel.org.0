Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6451CDD0F
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 16:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgEKOZi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 10:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgEKOZh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 10:25:37 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C916C061A0C
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=An8LtgnEqiNOPgIdTVkv8RFxQwgfnBQgv2USdPep6KQ=; b=apWibMHddm3jKXAGXyU7Pa0ot3
        /Zw+Z4tPRnT1SICxl0OqC/ix4nM1NA5QKKVW+V6jOWd8MBrGY5irVbycoLlUWb+h4+jFyglSxzFtI
        9hJ5y8czfODhiv9ltYiHAsiz3LgbND50LL0KZyFa6lL5FZ6xKdiREOCIdY0bnvinmriRDArHr6POc
        FqhiiCCqMV/+V1z3dZxVpo7AVZrbUfMe2avfEWZ6LGcgmprpKvpGdm8dl7etXA2evT3QlYwa8SpHr
        N6n7YX/6UAxUd8LAS1PqhbEV/MJH18pt8Vz7o4usybKOQAI2mRoR/JZXuLmPK9S3WE6AAm4cPp3Xu
        cE4TvL4A==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jY9N7-00009F-FM; Mon, 11 May 2020 14:25:33 +0000
Subject: Re: [PATCH RFC] drivers: most: add USB adapter driver
To:     Christian Gromm <christian.gromm@microchip.com>,
        gregkh@linuxfoundation.org
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
References: <1589190675-21145-1-git-send-email-christian.gromm@microchip.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <85800dd5-952b-8a34-8907-57485d280f6f@infradead.org>
Date:   Mon, 11 May 2020 07:25:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589190675-21145-1-git-send-email-christian.gromm@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/11/20 2:51 AM, Christian Gromm wrote:
> diff --git a/drivers/most/usb/Kconfig b/drivers/most/usb/Kconfig
> new file mode 100644
> index 0000000..a86f1f6
> --- /dev/null
> +++ b/drivers/most/usb/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# MOST USB configuration
> +#
> +
> +config MOST_USB
> +	tristate "USB"
> +	depends on USB && NET
> +	help
> +	  Say Y here if you want to connect via USB to network tranceiver.

	                                                       transceiver.


> +	  This device driver depends on the networking AIM.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called most_usb.


-- 
~Randy

