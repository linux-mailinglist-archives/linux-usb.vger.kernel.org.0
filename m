Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFEE31548D3
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 17:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgBFQJ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 11:09:58 -0500
Received: from cable.insite.cz ([84.242.75.189]:51796 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727060AbgBFQJ6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Feb 2020 11:09:58 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 88DB8A1A40B01;
        Thu,  6 Feb 2020 17:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581005395; bh=0OELw5uAGMTL63yFXSy7Y8s8J3u+QJTs+GFZVCvfpdU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AJl30V3rvJ/nBn4YDgvTFOoeGQRIorWbdSb4vWNoPW5mYvloPKtgMu11BpG/XCp0q
         HyeXy24hE/iu5/h/9QKm8YBMuTf1WrOWBBXlJoEGp+uuK0xGroKPU1z0CJ3DodOMV2
         dyhfVT8uH+pcUiZxH5TFlF47OWQvtm6cZofcgUmU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KM3vsQkjtZ3b; Thu,  6 Feb 2020 17:09:50 +0100 (CET)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C5C4EA1A40B02;
        Thu,  6 Feb 2020 17:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1581005389; bh=0OELw5uAGMTL63yFXSy7Y8s8J3u+QJTs+GFZVCvfpdU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=k0fqtTtbktfDxyRpa0FMQiy9C8HnxzjMsqm7dH4CMDoO4NTCQ0vJ05QGGMo7rSFA6
         LFVBHrucZ0zl1IdtjblvShKthYyZMQeSMd4ZP4a25oBW4vXcKtGKG1ORFmBxKg2oGZ
         grpSINvUKmwsSHcopiUiTN56vY2SlGgYA6t2vBX4=
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
 <20200206154125.GA3752902@kroah.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <d17089e1-31fa-b0ab-0e00-e868691faf2a@ivitera.com>
Date:   Thu, 6 Feb 2020 17:09:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206154125.GA3752902@kroah.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 06. 02. 20 v 16:41 Greg KH napsal(a):
> On Thu, Feb 06, 2020 at 02:22:47PM +0100, Pavel Hofman wrote:
>> Hi,
>>
>> The existing UAC2 implementation presents itself as asynchronous
>> USB_ENDPOINT_SYNC_ASYNC https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L276
>> + https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L285
>> .
>>
>> However:
>> 1) The function does not define any feedback endpoint
>>
>> 2) IMO in reality it is adaptive - the g_audio capture device accepts any
>> data passed by the USB host, the USB host is the one which defines the data
>> pace.
>>
>> While Linux and reportedly OSX accept the async EP OUT without explicit
>> feedback EP IN, Windows does not.
>>
>> Simply changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE for
>> the FS and HS output endpoints fixes the windows problem and IMO corrects
>> the config to reflect real function.
>>
>> There are multiple projects underway adding the async feedback EP, but in
>> the meantime I think the .bmAttributes information should be changed as
>> above, making the device usable in Windows for everyone.
>>
>> Thanks a lot for considering.
> 
> Patches work best, can you create them and test and then submit?
> 

No problem, I have tested for a few months. I just did not know if you 
would accept such change. I will send the patch then :-)

Thanks,

Pavel.
