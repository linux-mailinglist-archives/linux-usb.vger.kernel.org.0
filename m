Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0A447CFC0
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 11:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244092AbhLVKLR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 05:11:17 -0500
Received: from cable.insite.cz ([84.242.75.189]:35239 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244086AbhLVKLQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 05:11:16 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E2D4DA1A3D402;
        Wed, 22 Dec 2021 11:11:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640167874; bh=gKPxFfneFyY1BynvmoHR2rkJIRDoBA1rXZGpHuAzSEQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lVj9OecQsE/YqIWaa2kUmo/axICzY7M0lCvYk1eLqH5/lzje6/hLMeBei6f66Zrih
         mRiJ6GGgdbITZwUirNJwtxxXpWZq3crTnBUcBu+OpE6ISJzImHtF2CLiC9xslZIBHc
         28tIfBmhjE2J8HlJtsEU02wdreZNOOjiwqjlW+wY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RnS90Q8fO3R7; Wed, 22 Dec 2021 11:11:09 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 70348A1A3D400;
        Wed, 22 Dec 2021 11:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640167869; bh=gKPxFfneFyY1BynvmoHR2rkJIRDoBA1rXZGpHuAzSEQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=rUP/i3HB7R5nGdTVqeRhQ/UXJ3M7WwinGn4X1m9gCG4bQoL7G6kdmDCFxK9pQiP3h
         R0oDcLAubxCIsD2vMdZk9I5pIrpDNUTNITcKW3Uslm5a2lSowu8LbJcgq+jkBpwNIo
         dmsL4rOjvu0tdEnaTDoH92u9T2Aiksb8z3OIU/y4=
Subject: Re: [PATCH v2 05/11] usb: gadget: f_uac2: Renaming Clock Sources to
 fixed names
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-6-pavel.hofman@ivitera.com> <YcHCZFXrYlzBeS2E@donbot>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <d7c96be5-dd98-4d8a-b770-9f5d8e47ceef@ivitera.com>
Date:   Wed, 22 Dec 2021 11:11:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcHCZFXrYlzBeS2E@donbot>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 21. 12. 21 v 13:02 John Keeping napsal(a):
> The subject should be "Rename ...".

OK

> 
> On Mon, Dec 20, 2021 at 10:11:24PM +0100, Pavel Hofman wrote:
>> From: Julian Scheel <julian@jusst.de>
>>
>> The gadget no longer supports only one frequency. Therefore USB strings
>> corresponding to the clock sources are renamed from specific Hz value to
>> general names Input clock/Output clock.
>>
>> Signed-off-by: Julian Scheel <julian@jusst.de>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
>>   drivers/usb/gadget/function/f_uac2.c | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
>> index 74e32bb146c7..ef8e39e80523 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -105,14 +105,11 @@ enum {
>>   	STR_AS_IN_ALT1,
>>   };
>>   
>> -static char clksrc_in[8];
>> -static char clksrc_out[8];
>> -
>>   static struct usb_string strings_fn[] = {
>>   	[STR_ASSOC].s = "Source/Sink",
>>   	[STR_IF_CTRL].s = "Topology Control",
>> -	[STR_CLKSRC_IN].s = clksrc_in,
>> -	[STR_CLKSRC_OUT].s = clksrc_out,
>> +	[STR_CLKSRC_IN].s = "Input clock",
>> +	[STR_CLKSRC_OUT].s = "Output clock",
> 
> Other values here use title case, so "Input Clock", "Output Clock".
> 

OK
