Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA4A272A93
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 17:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbgIUPpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 11:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727174AbgIUPpO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 11:45:14 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B473C061755;
        Mon, 21 Sep 2020 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=4YJsh+/JMJiEcRz2N7elI20o3ohDyLzBBt3UWLvYKAc=; b=RPZ4BuPJshcqBkKw0jQ4zUZomt
        50RRZpvsMeVUMUBYc+Mz1JOG4MW3jkpnNZ9slvRv0ft9uK1Ud7y2+Ot/9kEuIiOyHaQ1cVMDAV1zh
        /Rz2UrxtRfoZNrAVfhHsQ4CszIFQ/nHpNTaDeSxJoKSsQLgW5Bjk1jGfLhnfax8pTTJI7vGjPuPCW
        VYpP9tkHFTPO8OD7wY+ic1zfCPf8JYJC90FoTJro96WKbSm84r5nw1I5csQJApIJOvxQ4b7BsFzc9
        0ZM2a8vO6o1hki5+Iu5/cb/oDVYzyCNBDK6qb4a31WLWVVGrz/MPvKSw9r+NKwhxnpPznBKW8Vilp
        BbzOlftw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKO01-0003GP-5T; Mon, 21 Sep 2020 15:45:05 +0000
Subject: Re: [PATCH -next] phy: fix USB_LGM_PHY warning & build errors
From:   Randy Dunlap <rdunlap@infradead.org>
To:     LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Li Yin <yin1.li@intel.com>,
        Vadivel Murugan R <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <d1dd0ddd-3143-5777-1c63-195e1a32f237@infradead.org>
Message-ID: <cb3b277e-109d-82c5-9dec-153b4e035c2a@infradead.org>
Date:   Mon, 21 Sep 2020 08:45:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d1dd0ddd-3143-5777-1c63-195e1a32f237@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ping.  Still seeing this in linux-next.

On 9/17/20 10:51 AM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix a Kconfig warning that is causing lots of build errors
> when USB_SUPPORT is not set.
> 
> USB_PHY depends on USB_SUPPORT but "select" doesn't care about
> dependencies, so this driver should also depend on USB_SUPPORT.
> It should not select USB_SUPPORT.
> 
> WARNING: unmet direct dependencies detected for USB_PHY
>   Depends on [n]: USB_SUPPORT [=n]
>   Selected by [m]:
>   - USB_LGM_PHY [=m]
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Li Yin <yin1.li@intel.com>
> Cc: Vadivel Murugan R <vadivel.muruganx.ramuthevar@linux.intel.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20200917.orig/drivers/phy/Kconfig
> +++ linux-next-20200917/drivers/phy/Kconfig
> @@ -51,6 +51,7 @@ config PHY_XGENE
>  
>  config USB_LGM_PHY
>  	tristate "INTEL Lightning Mountain USB PHY Driver"
> +	depends on USB_SUPPORT
>  	select USB_PHY
>  	select REGULATOR
>  	select REGULATOR_FIXED_VOLTAGE
> 


-- 
~Randy

