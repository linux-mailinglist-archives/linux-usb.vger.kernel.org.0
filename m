Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F328FC1D4
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 09:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKNIsl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 03:48:41 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46380 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfKNIsk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Nov 2019 03:48:40 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE8mdKU130137;
        Thu, 14 Nov 2019 02:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573721319;
        bh=vi2XWfQ9s/uIa8g2RKXYhy7aLp0Qn+f3n5HtWAewU/M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=novPSIfaOitL+fSEwLupjJXCBZxbrZEh+j6DpjPY9QtQy3TDtZl8/8IF+otGQaH7N
         gx2ICWxQUtdgnVSQKhhtpdz644Rg1ecFdRO0YXuZc4XcA/iNLcvAFwj2b+Q28pHCWB
         sOXjgoHhhB4/Kna1gSVH1dw6J+tz5Di8G6p5jZLQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE8mdl3042259;
        Thu, 14 Nov 2019 02:48:39 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 02:48:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 02:48:38 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE8mbMb064367;
        Thu, 14 Nov 2019 02:48:37 -0600
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
To:     Bin Liu <b-liu@ti.com>, <linux-usb@vger.kernel.org>
CC:     Felipe Balbi <balbi@kernel.org>
References: <20191113141521.1696-1-b-liu@ti.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <b354e1bf-6824-ccb1-9b8b-7b54b0e8fc2b@ti.com>
Date:   Thu, 14 Nov 2019 10:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113141521.1696-1-b-liu@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bin,

On 13/11/2019 16:15, Bin Liu wrote:
> VBUS should be turned off when leaving the host mode.
> Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
> turn off VBUS power.

Doesn't DRVVBUS pin de-assert when root hub driver turns off port power?
Which should happen when XHCI host driver is unregistered as part of
dwc3_host_exit()?

cheers,
-roger

> 
> Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization to its own function")
> Signed-off-by: Bin Liu <b-liu@ti.com>
> ---
>   drivers/usb/dwc3/core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 97d6ae3c4df2..76ac9cd54e64 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
>   		break;
>   	case USB_DR_MODE_HOST:
>   		dwc3_host_exit(dwc);
> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
>   		break;
>   	case USB_DR_MODE_OTG:
>   		dwc3_drd_exit(dwc);
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
