Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A0D2D724A
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 09:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392876AbgLKIwp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 03:52:45 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39588 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392913AbgLKIwh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 03:52:37 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BB8pf58107052;
        Fri, 11 Dec 2020 02:51:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607676701;
        bh=Apc8MIv6y8Rj3lHu+hHJZNjasdcG6VdFZzn208AiN28=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Tf/yF7LYCV/XOGnvzy2lUxSOYaq75pYAnYLjNA4b1DDnhhMjsuxJR2pkZ3wUoAw4n
         NWp4hBfOTwrS5uTOwp3cXo6IUrr4sw0HmO5S5cYlAfcWfOJB+MmrDY843wO5U5Z9Br
         VKxgjrdHvPiMWi8aaY8yUT5kK6ILU1CVPN4DAnEE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BB8pfGm101028
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Dec 2020 02:51:41 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 02:51:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 02:51:40 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BB8pdum027440;
        Fri, 11 Dec 2020 02:51:39 -0600
Subject: Re: [PATCH] usb: cdns3: Removes xhci_cdns3_suspend_quirk from
 host-export.h
To:     Pawel Laszczak <pawell@cadence.com>, <peter.chen@nxp.com>
CC:     <linux-usb@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <kurahul@cadence.com>, <a-govindraju@ti.com>
References: <20201211050954.14616-1-pawell@cadence.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <835fe013-e070-76ec-d102-5c9e3a5d8fa3@ti.com>
Date:   Fri, 11 Dec 2020 10:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211050954.14616-1-pawell@cadence.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 11/12/2020 07:09, Pawel Laszczak wrote:
> Function xhci_cdns3_suspend_quirk is used only in host.c file.
> We can make it as static and removes it from host-export.h.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger

> ---
>   drivers/usb/cdns3/host-export.h | 7 -------
>   drivers/usb/cdns3/host.c        | 4 +++-
>   2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/host-export.h b/drivers/usb/cdns3/host-export.h
> index fb8541b8adbc..cf92173ecf00 100644
> --- a/drivers/usb/cdns3/host-export.h
> +++ b/drivers/usb/cdns3/host-export.h
> @@ -9,12 +9,9 @@
>   #ifndef __LINUX_CDNS3_HOST_EXPORT
>   #define __LINUX_CDNS3_HOST_EXPORT
>   
> -struct usb_hcd;
> -
>   #if IS_ENABLED(CONFIG_USB_CDNS_HOST)
>   
>   int cdns_host_init(struct cdns *cdns);
> -int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd);
>   
>   #else
>   
> @@ -24,10 +21,6 @@ static inline int cdns_host_init(struct cdns *cdns)
>   }
>   
>   static inline void cdns_host_exit(struct cdns *cdns) { }
> -static inline int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> -{
> -	return 0;
> -}
>   
>   #endif /* USB_CDNS_HOST */
>   
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index 3ff19182b0c0..84dadfa726aa 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -23,6 +23,8 @@
>   #define CFG_RXDET_P3_EN		BIT(15)
>   #define LPM_2_STB_SWITCH_EN	BIT(25)
>   
> +static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd);
> +
>   static const struct xhci_plat_priv xhci_plat_cdns3_xhci = {
>   	.quirks = XHCI_SKIP_PHY_INIT | XHCI_AVOID_BEI,
>   	.suspend_quirk = xhci_cdns3_suspend_quirk,
> @@ -87,7 +89,7 @@ static int __cdns_host_init(struct cdns *cdns)
>   	return ret;
>   }
>   
> -int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> +static int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
>   {
>   	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
>   	u32 value;
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
