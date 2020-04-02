Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991A919C06E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 13:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387985AbgDBLt1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 07:49:27 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60334 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387722AbgDBLt1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 07:49:27 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 032BnIVY054299;
        Thu, 2 Apr 2020 06:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585828158;
        bh=pIJ3q+6FjXt4bCVez97Gn+sLqYP8+odcCAB1mdapmF4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vxLa0sTagxQZmXLn4cpJ+J3ZqAWTUw5BB+N3QtHRLpMw+5LwJP8dri9f9ddlEUvT2
         U/1W7UaACCQX5nsbKJWPmPsIoITBdPN5Nax/eQ5Ztbd3dPQ5rRSE9JLpUmSmcMLzKv
         0S+pQ8uQg6Z0tMoNd6UppgUVI8W3P0I5eHAOFXDc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 032BnIlJ089793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Apr 2020 06:49:18 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 06:49:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 06:49:18 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 032BnGK2089240;
        Thu, 2 Apr 2020 06:49:16 -0500
Subject: Re: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
To:     Peter Chen <peter.chen@nxp.com>, <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-imx@nxp.com>,
        <pawell@cadence.com>, <gregkh@linuxfoundation.org>,
        <jun.li@nxp.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <7ed54cd3-c9e4-ee50-9e40-563dd4592613@ti.com>
Date:   Thu, 2 Apr 2020 14:49:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200331081005.32752-1-peter.chen@nxp.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 31/03/2020 11:10, Peter Chen wrote:
> After that, the role switch device (eg, Type-C device) could call
> cdns3_role_set to finish the role switch.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

For this patch and all in the series

Reviewed-by: Roger Quadros <rogerq@ti.com>

> ---
>   drivers/usb/cdns3/core.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 4aafba20f450..704c679a0c5d 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -528,6 +528,8 @@ static int cdns3_probe(struct platform_device *pdev)
>   	sw_desc.get = cdns3_role_get;
>   	sw_desc.allow_userspace_control = true;
>   	sw_desc.driver_data = cdns;
> +	if (device_property_read_bool(dev, "usb-role-switch"))
> +		sw_desc.fwnode = dev->fwnode;
>   
>   	cdns->role_sw = usb_role_switch_register(dev, &sw_desc);
>   	if (IS_ERR(cdns->role_sw)) {
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
