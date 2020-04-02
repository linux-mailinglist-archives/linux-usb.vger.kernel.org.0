Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3066819BED6
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 11:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387749AbgDBJpX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 05:45:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40122 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387730AbgDBJpX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 05:45:23 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0329jEjB055094;
        Thu, 2 Apr 2020 04:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585820714;
        bh=l9UNd1d46Dv+g92yMEPQnHkoROHoFkW1BPQq0D/UEzo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vSRlf+Qw06OdqK4ZzmR8bfbUrX+Ru5e0AFcX/LTvG7MURjqRCA+8bL6cZYbCssXsI
         ap26WnBGam17LByDeFqr82gDj6YIywd4YuXU9kGDPsjgIxlUAuY3Ro2ROFqCcxdJix
         Qun8gYjDbIZfiauKVoc56ShYn2CYOx4QPFRtNiLk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0329jEv8048453
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 2 Apr 2020 04:45:14 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 2 Apr
 2020 04:45:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 2 Apr 2020 04:45:12 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0329jA8H103855;
        Thu, 2 Apr 2020 04:45:11 -0500
Subject: Re: [PATCH 1/4] usb: cdns3: core: get role switch node from firmware
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
References: <20200331081005.32752-1-peter.chen@nxp.com>
 <bc2c6e57-accd-ccc9-caec-527773056744@ti.com>
 <AM7PR04MB7157C5ECA0597F2BBB3C29EC8BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <1b745ded-b0b2-1c4b-3052-41aaccad8a9c@ti.com>
 <AM7PR04MB7157ABD50D68ACEB669FF2C08BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <c1491c59-7567-9b50-cd0e-e925abe35eff@ti.com>
Date:   Thu, 2 Apr 2020 12:45:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <AM7PR04MB7157ABD50D68ACEB669FF2C08BC60@AM7PR04MB7157.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 02/04/2020 12:37, Peter Chen wrote:
>>>>
>>>
>>> Hi Roger,
>>>
>>> I use 5.6-rc4.  Which conflict you have met? Do you have below patch?
>>>
>>> 8708a9fa2938 usb: roles: Provide the switch drivers handle to the
>>> switch in the API
>>
>> Applying: usb: cdns3: core: get role switch node from firmware
>> error: patch failed: drivers/usb/cdns3/core.c:528
>> error: drivers/usb/cdns3/core.c: patch does not apply Patch failed at 0001 usb:
>> cdns3: core: get role switch node from firmware Use 'git am --show-current-patch'
>> to see the failed patch When you have resolved this problem, run "git am --
>> continue".
>> If you prefer to skip this patch, run "git am --skip" instead.
>> To restore the original branch and stop patching, run "git am --abort".
>>
>   
> I just tried the latest Greg's usb-next, it could apply. Do you have the patch I mentioned?
> What's the conflict in source file?
> 

OK, it applies on usb-next. Thanks.

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
