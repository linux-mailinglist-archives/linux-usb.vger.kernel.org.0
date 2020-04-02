Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2A719BE25
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 10:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387901AbgDBIx2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 04:53:28 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45410 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387875AbgDBIx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 04:53:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0328rL9N112216;
        Thu, 2 Apr 2020 03:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585817601;
        bh=8RipU1hJD6lh0TWgPa8V+A7cj+Mra4O9mtmScMPMXhA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=i3L4ipV058kdgpfYIps7iT5Tq27LWXXAqRsfKtcRPv3zvwx3lBDRsaUWj1j2LO46W
         OC5I8RvdLhRZAADjimMmG5GO83jMrlpLJBuMg/VgR0CuWIvy9a+L3DNc/3jfu1tmhf
         4ZdCsLUlH8N03MpIHyO921VZ44/ZtRjaFZxzZTEo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0328rLxc052491
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Apr 2020 03:53:21 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 03:53:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 03:53:19 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0328rHFa053965;
        Thu, 2 Apr 2020 03:53:18 -0500
Subject: Re: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
To:     Peter Chen <peter.chen@nxp.com>, <balbi@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <linux-imx@nxp.com>,
        <pawell@cadence.com>, <gregkh@linuxfoundation.org>,
        <jun.li@nxp.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <bc2c6e57-accd-ccc9-caec-527773056744@ti.com>
Date:   Thu, 2 Apr 2020 11:53:17 +0300
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

Hi Peter,

On 31/03/2020 11:10, Peter Chen wrote:
> After that, the role switch device (eg, Type-C device) could call
> cdns3_role_set to finish the role switch.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

This does not apply on v5.6. What branch did you test this on?

cheers,
-roger

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
