Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20771D8C9D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 11:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404246AbfJPJgk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 05:36:40 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47856 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404215AbfJPJgj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Oct 2019 05:36:39 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9G9aYxa052626;
        Wed, 16 Oct 2019 04:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571218594;
        bh=U++0/I2AVYFSkRx9VR8ZBrTMp6YwAbroPyLf2BM36E0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HZwhGk8UrjgluNFosU55NMBWFQI5FusXZ2B6ODjd7rj3ZVs6l1jo/9X4xtmYulPJQ
         z91dqw+OHhASibo9W50lijJ3PvkCqbXeSyyR7ZCXsecwY93LdlF7ajsaabcSAFuGN5
         vqGApoSVndKQvQ69QBHPOf+Wf5FsOrrWuWKiv4YE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9G9aYnp047018
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 04:36:34 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 04:36:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 04:36:33 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9G9aV6x035164;
        Wed, 16 Oct 2019 04:36:32 -0500
Subject: Re: how to test g_webcam
To:     "Gopal, Saranya" <saranya.gopal@intel.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu [EP]" <b-liu@ti.com>
CC:     "Nori, Sekhar" <nsekhar@ti.com>
References: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com>
 <8736fzv3c5.fsf@gmail.com> <a23554e6-4dd7-b252-eda3-4d986d4a80be@ti.com>
 <8736fvh58n.fsf@gmail.com> <922b2947-2d47-19c4-9116-73c5f281de15@ti.com>
 <871rvf8l09.fsf@gmail.com> <75438b39-2233-8865-860a-661cf09bea4b@ti.com>
 <C672AA6DAAC36042A98BAD0B0B25BDA94CD14A54@BGSMSX104.gar.corp.intel.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <f6f10c8a-71cd-19a4-f515-2985dc3bf3d2@ti.com>
Date:   Wed, 16 Oct 2019 12:36:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <C672AA6DAAC36042A98BAD0B0B25BDA94CD14A54@BGSMSX104.gar.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 15/10/2019 18:26, Gopal, Saranya wrote:
> Hi Quadros,
> 
>> I used the a different uvc-gadget application from this location [1] and it seems
>> to
>> work quite fine with builtin video pattern and jpg image but not with V4L2
>> capture source.
>>
>> So something is broken in uvc-gadget at [2]
>>
>> [1] https://github.com/wlhe/uvc-gadget
>> [2] http://git.ideasonboard.org/uvc-gadget.git
> 
> I think support for pattern and JPG image was intentionally removed from uvc-gadget with this commit:
> http://git.ideasonboard.org/uvc-gadget.git/commitdiff/00b892305694ea796728c1f97831bc3c59a8e3da?hp=53b139a22810e00aa0ce872853b45107c4edee98

Thanks. It would be nice to know what was the intention.
It does cripple uvc-gadget testing on platforms that don't have a V4L2 capture source.

cheers,
-roger

> Thanks,
> Saranya
>>
>> cheers,
>> -roger
>> --
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
