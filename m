Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA412D627E
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 17:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392169AbgLJQvH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 11:51:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392172AbgLJQvA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 11:51:00 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84248C061794
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=K1h4wgIJb7UWvmBP/m7qYbC/aIgqjIEy9eXvr+kiIwg=; b=tsg1g3zPtCMDoAw5khO9wnGlxN
        qZZ0cq5xEu9tQNarTY8D12xvrT4RE1Lvel1X4sjNpnYaUPHfQwLhPqOlY6B0L3yGoi8wU3gGDwFQ5
        iaGHPKV8Fxh9cMW0DCUmDo0hYHYIlHJV9P9cHg45SK+SCPlWchl8BkJITyfxlAe+eQuHN56dFm//F
        b5GsdiKZcObG4Fpw6mAmX70/lao4umWeDrkFQhv7pE3RdkKPMF6/Cfa6lU4sbakRNhHKIwJEYQsFE
        /M8DUF6vxiD/FacJu0NjcTst+flI9i4GHMgEn4Vy1Xo/e+DdQ+If6fKNx21MlD3EYzApXk1dgMk91
        lK6/qOlQ==;
Received: from [2601:1c0:6280:3f0::1494]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1knP8u-0003po-KQ; Thu, 10 Dec 2020 16:50:12 +0000
Subject: Re: [PATCH] usb: cdnsp: Fix for undefined reference to
 `usb_hcd_is_primary_hcd'
To:     Pawel Laszczak <pawell@cadence.com>, peter.chen@nxp.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        dan.carpenter@oracle.com, kurahul@cadence.com
References: <20201210162258.10289-1-pawell@cadence.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5f6b4593-6719-7618-0d62-905565484ec6@infradead.org>
Date:   Thu, 10 Dec 2020 08:50:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210162258.10289-1-pawell@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/10/20 8:22 AM, Pawel Laszczak wrote:
> Patch fixes the following compilation error:
> 
> ld: drivers/usb/cdns3/host.o: in function `xhci_cdns3_suspend_quirk':
> host.c:(.text+0x9): undefined reference to `usb_hcd_is_primary_hcd'
> 
> This reference to 'usb_hdc_is_primary_hcd' is from hcd_to_xhci(),
> which is being built as a loadable module:
> 
> int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> {
>         struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> 
> Issue occurrd for following kernel configuration:
> CONFIG_USB_GADGET=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=m
> 
> CONFIG_USB_CDNS_SUPPORT=y
> CONFIG_USB_CDNS_HOST=y
> CONFIG_USB_CDNS3=m
> CONFIG_USB_CDNS3_GADGET=y
> CONFIG_USB_CDNS3_HOST=y
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Works for me. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> ---
>  drivers/usb/cdns3/Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
> index 01a9a9620044..3f9b7fa8a594 100644
> --- a/drivers/usb/cdns3/Makefile
> +++ b/drivers/usb/cdns3/Makefile
> @@ -6,8 +6,13 @@ CFLAGS_cdnsp-trace.o				:= -I$(src)
>  cdns-usb-common-y				:= core.o drd.o
>  cdns3-y						:= cdns3-plat.o
>  
> -obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
> +ifeq ($(CONFIG_USB),m)
> +obj-m						+= cdns-usb-common.o
> +obj-m						+= cdns3.o
> +else
>  obj-$(CONFIG_USB_CDNS_SUPPORT)			+= cdns-usb-common.o
> +obj-$(CONFIG_USB_CDNS3)				+= cdns3.o
> +endif
>  
>  cdns-usb-common-$(CONFIG_USB_CDNS_HOST) 	+= host.o
>  cdns3-$(CONFIG_USB_CDNS3_GADGET)		+= cdns3-gadget.o cdns3-ep0.o
> 


-- 
~Randy
