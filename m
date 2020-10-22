Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937B029588A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 08:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440698AbgJVGsU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 02:48:20 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39782 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439712AbgJVGsU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 02:48:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09M6mCZc096285;
        Thu, 22 Oct 2020 01:48:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1603349292;
        bh=ImUa0bBNCXwKjWXUfmUPNeV+bh24MQT7Z8B6vfNQNLU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LmdgwX8SQ6zgV6RziQtNMYRojXvfn0930ergmZ60aBB2xBcsc4KRndenRBVqU7h5M
         wH6wtZHWot4UEDD2XaCd2MiwNYVYMxxCZqcxISqVtqk0t/6hQcR1D3SqYWzlv43nmE
         WQGeGKXmEBdHRyHZKRNZTOh/UknoMfMf6sBxSFLY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09M6mCcU027356
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 22 Oct 2020 01:48:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 22
 Oct 2020 01:48:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 22 Oct 2020 01:48:12 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09M6m9e0056016;
        Thu, 22 Oct 2020 01:48:10 -0500
Subject: Re: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
To:     Peter Chen <peter.chen@nxp.com>, <mathias.nyman@intel.com>
CC:     <linux-usb@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-imx@nxp.com>, <jun.li@nxp.com>,
        Pawel Laszczak <pawell@cadence.com>
References: <20201022030133.19528-1-peter.chen@nxp.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <fb21b4ca-9c56-a555-8716-13cd9d2e69b7@ti.com>
Date:   Thu, 22 Oct 2020 09:48:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022030133.19528-1-peter.chen@nxp.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On 22/10/2020 06:01, Peter Chen wrote:
> The Cadence xHCI host has the same issue with Intel's,

s/with/as

> it is triggered by reboot stress test.

Can you please provide some more details about the test so I can try at my end. Thanks.

cheers,
-roger
> 
> Cc: Pawel Laszczak <pawell@cadence.com>
> Cc: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>   drivers/usb/host/xhci.c | 2 +-
>   drivers/usb/host/xhci.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 482fe8c5e3b4..fc72a03dc27f 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -193,7 +193,7 @@ int xhci_reset(struct xhci_hcd *xhci)
>   	 * Without this delay, the subsequent HC register access,
>   	 * may result in a system hang very rarely.
>   	 */
> -	if (xhci->quirks & XHCI_INTEL_HOST)
> +	if (xhci->quirks & (XHCI_INTEL_HOST | XHCI_CDNS_HOST))
>   		udelay(1000);
>   
>   	ret = xhci_handshake(&xhci->op_regs->command,
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 8be88379c0fb..4b7275c73ea5 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1877,6 +1877,7 @@ struct xhci_hcd {
>   #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
>   #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
>   #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
> +#define XHCI_CDNS_HOST		BIT_ULL(38)
>   
>   	unsigned int		num_active_eps;
>   	unsigned int		limit_active_eps;
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
