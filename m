Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECB761001B8
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 10:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfKRJvH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 04:51:07 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37676 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRJvG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 04:51:06 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAI9p5lK047156;
        Mon, 18 Nov 2019 03:51:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574070665;
        bh=ZRA14zKsMBPKPoXjjk2LHwYlnsLRb3HaFwb760q05Nk=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=dI+8SuTAtY1AUcQSZii9oyoccgljGo5QO/RtYHvDZCYTf5lHwdyAYXLq9qQH2VUfr
         Sy61bYqZyfvjH+Rdd9nsBWYReIrJnf8RUwy9Q/Kf8N1rD9+BKQlY7DPJzxDxPA0hsg
         j8DiGhXD2mU4On5WFrn7CDMFt6x53wJ1V5KELN4o=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAI9p52N027540
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Nov 2019 03:51:05 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 18
 Nov 2019 03:51:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 18 Nov 2019 03:51:03 -0600
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAI9p2Ae000535;
        Mon, 18 Nov 2019 03:51:02 -0600
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
To:     Felipe Balbi <balbi@kernel.org>, Bin Liu <b-liu@ti.com>,
        <linux-usb@vger.kernel.org>
References: <20191113141521.1696-1-b-liu@ti.com> <87blt9psrd.fsf@gmail.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <f12d3637-ad95-b5f5-f331-df791e85ab3a@ti.com>
Date:   Mon, 18 Nov 2019 11:51:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87blt9psrd.fsf@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 18/11/2019 09:07, Felipe Balbi wrote:
> Hi,
> 
> Bin Liu <b-liu@ti.com> writes:
> 
>> VBUS should be turned off when leaving the host mode.
>> Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
>> turn off VBUS power.
>>
>> Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization to its own function")
>> Signed-off-by: Bin Liu <b-liu@ti.com>
>> ---
>>   drivers/usb/dwc3/core.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 97d6ae3c4df2..76ac9cd54e64 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
>>   		break;
>>   	case USB_DR_MODE_HOST:
>>   		dwc3_host_exit(dwc);
>> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
> 
> seems like this should be done as part of dwc3_host_exit()
> 

That wouldn't work well with OTG case as dwc3_host_exit(dwc) is
called when switching roles and we don't want PRTCAP
to change from DWC3_GCTL_PRTCAP_OTG.

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
