Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E099EADCD
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 11:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbfJaKrz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 06:47:55 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39382 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfJaKry (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Oct 2019 06:47:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9VAlXUO073310;
        Thu, 31 Oct 2019 05:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572518853;
        bh=Y7g5cO1JpgQhJU0Vvpnwp50l9it+HuKgyXUVUG7xS/0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=LQYyCf++acmMZckkTouHKMTQLp2/3dn5o2Jw36l4lQM1raVAzaLt5ugDdp92RHfK+
         mHGWGpSSQ93Vi3dRq/A7ByOawhBRCBsz8dNwcZSWVJEi0ldmo97aw9S/nqmT9JHnFr
         bZ7db1I6GubXIRGDiK/NEfyKw+z4QaNDUOi/OaAs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9VAlXNw058210
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Oct 2019 05:47:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 31
 Oct 2019 05:47:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 31 Oct 2019 05:47:32 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9VAlVGS047295;
        Thu, 31 Oct 2019 05:47:31 -0500
Subject: Re: [PATCH] usb: dwc3: gadget: fix race when disabling ep with
 cancelled xfers
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC:     Linux USB <linux-usb@vger.kernel.org>
References: <20191031090713.1452818-1-felipe.balbi@linux.intel.com>
 <3cd8a46e-8c1a-84c1-eb82-27713cf16a87@ivitera.com> <87k18le0a9.fsf@gmail.com>
 <aa8001ac-bdb7-d1ff-78a4-56cbedba6791@ivitera.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <2aa1f9cd-f8ea-f19d-66d4-13beb789e787@ti.com>
Date:   Thu, 31 Oct 2019 12:47:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <aa8001ac-bdb7-d1ff-78a4-56cbedba6791@ivitera.com>
Content-Type: text/plain; charset="iso-8859-2"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 31/10/2019 12:11, Pavel Hofman wrote:
> Dne 31. 10. 19 v 10:23 Felipe Balbi napsal(a):
>>
>>>>
>>>
>>> Please is this problem (and its solution) also applicable to dwc2 (i.e.
>>> e.g. RPi4)?
>>
>> different driver, so no.
> 
> Yes the driver is different, but I was wondering if such situation can occur in dwc2 too and (if so) whether it is already taken care of. Disconnecting the USB device is a standard operation.

I discovered this problem on dwc3 while using g_audio gadget. see here:
https://www.spinics.net/lists/linux-usb/msg187244.html

You might want to do a similar test with dwc2?

> 
> Thanks a lot. Regards,
> 
> Pavel.

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
