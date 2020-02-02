Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA8014FECD
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2020 20:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgBBSwR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Feb 2020 13:52:17 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39526 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgBBSwR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Feb 2020 13:52:17 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so4930655plp.6
        for <linux-usb@vger.kernel.org>; Sun, 02 Feb 2020 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TNFPl0Gt5urN5k3aQVQKIP8diJ5nsrvgMbztJjoYZrc=;
        b=pChSVu1ds6vkAuvsLmrDI1Ta+AO/dCfldvYc0tVB5cREJACZnBkXeGyQANpjiwtExa
         hsYvPlftUBwPKfSQ60QMcNRAEb2HCTZBnFex/Gx1Dhju1rh8evnhQ805VukDOZpNExrT
         smOPQk4LtVTKSM00oa42jaMMjdpy40zSCvmKjERA3AglHU0KZ5vgWTxMGR3eD2M8xhSi
         lEltudDukdBZSkgIb56O50RuH/qQChnYDrrmuO4vaiS9u23S2yn4m1uifHxyNnLhg7FT
         5ipMjCaV1JbWclyQgwotoVwbVWsji0J2pkEsEMVq1MeMSv8rrf/xxgwcpkB01kMPGnHa
         GzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TNFPl0Gt5urN5k3aQVQKIP8diJ5nsrvgMbztJjoYZrc=;
        b=Z7rGbLARJ+QRIKRgJNiRoT1vTrAf20nA7zC0oDKEoBK0V80VlmsjpIrVjyH8yZoQsx
         UqD0PsxwQx31RvrzSAzORV/4d11Z2JaQ0zyZN2xMScYJA/MF9CKDDBe1VUwaC27YLrJC
         hwwHWHMTlrRvxSCWlZRzsQmOLFQr/1sN3k/LUlicFA/9p+H4cFDLj6qnrTXjTumkBZ9T
         PPubakf71Z2N1dsvHjcfeixB59hfcntxZKN3LLx59vJkmT/vu/nu1X8pP5tvDLjL/78Y
         Txg4DND4OL9NLpKlmNNNeptVmKifC1JL7VfYpwoEsFcTKJ9OhWnHH/QCqPA4c7J/msE2
         AU+A==
X-Gm-Message-State: APjAAAXgxezxA0uCkt7aVgb+v/fQIPxTOslzT+t+GLF6xXv0ZgfKfKAv
        lTwQiK4V1lkXmVmsHu5U0JQ=
X-Google-Smtp-Source: APXvYqxTkMHqK7jSF7DtI3gnEtTZqHPvKfoUUlcOf4FT3Dw7S4bMb6kVl/BU3M0awfss0xLmYMN1oA==
X-Received: by 2002:a17:902:7006:: with SMTP id y6mr20669643plk.84.1580669536553;
        Sun, 02 Feb 2020 10:52:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t66sm2722686pgb.91.2020.02.02.10.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2020 10:52:15 -0800 (PST)
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
References: <20191105032922.GA3041@tungsten>
 <20200131220925.GA26896@roeck-us.net> <20200202051520.GA971@tungsten>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <92d9e54d-205f-0f45-ada4-de1d48c72fcb@roeck-us.net>
Date:   Sun, 2 Feb 2020 10:52:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200202051520.GA971@tungsten>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Boris,

On 2/1/20 9:15 PM, Boris ARZUR wrote:
> Hello Guenter,
> 
> 
>> good find, and good analysis. We stated to see this problem as well in the
>> latest ChromeOS kernel.
> I'm glad you find my report helpful.
> 
> 
>> be able to reproduce the problem. Maybe you can help me. How do you tether
>> your phone through USB ?
> You mention thethering, so I think you have read my follow-up:
> https://www.spinics.net/lists/linux-usb/msg187497.html
> 
> 
> My setup is as follows:
> - 'kenzo' phone (https://wiki.lineageos.org/devices/kenzo) on AICP 12.1
>    (android 7.1.2 linux 3.10.105);
> - 'veyron speedy' chromebook (https://wiki.gentoo.org/wiki/Asus_Chromebook_C201)
>    on Arch Linux ARM, vanilla linux 5.2.14;
> 
> 
> Here are my repro steps, sorry if tedious, I'm not sure of the level of
> details you want, so I will go verbose squared :) :
> 
> 0. plug in phone to chromebook, with a USB2 micro b cable;
> 
> 1. activate usb tethering in phone settings:
>     settings> more> tethering & portable hotspot> USB tethering
>     click and confirm "tethered";
> 
> 2. chromebook sees phone as:
> [ 2128.080551] rndis_host 2-1:1.0 usb0: register 'rndis_host' at usb-ff580000.usb-1, RNDIS device, 4a:5e:0c:89:ec:09
> 
> 3. chromebook$ sudo dhcpcd --noarp usb0
> usb0: adding default route via 192.168.42.129
> 
> 4. on phone, start termux (https://f-droid.org/en/packages/com.termux/)
> 
> 5. phone$ dd if=/dev/urandom of=blob count=50 bs=1M
> 
> 6. phone$ sha512sum blob
> b9e...14d blob
> 
> 7. phone$ pkg install netcat
> 
> 8. phone$ while true; do <blob netcat -l -p 9999; done
> 
> 9. chromebook$ sudo pacman -Syu extra/gnu-netcat community/pigz
> 
> 10. chromebook$ dd if=/dev/urandom of=job count=10 bs=1M
> 
> 11. chromebook terminal 0$ while true; do <job pigz -11 -i -p 1024 >/dev/null; done
> 
> 12. chromebook terminal 1$ cat /proc/loadavg
> 28.18 8.76 3.74 54/521 8826
>   
> 13. chromebook terminal 1$ while true; do netcat 192.168.42.129 9999 | sha512sum; done
> b9e...14d -
> 
> 13. chromebook will panic soon (I see repros in tens of seconds);
> 
Thanks a lot for the information. I'll see if I can reproduce the problem using
this (or a similar) approach. Tethering an Android phone isn't really difficult,
but the traffic pattern seems to play a role as well.

> I managed to track the issue to:
>> The kernel will write to 0 at line 2494 below in file drivers/usb/dwc2/hcd.c
>> 2474 static void dwc2_free_dma_aligned_buffer(struct urb *urb)
>> 2494 		memcpy(stored_xfer_buffer, urb->transfer_buffer, length);
> 
> 
> I discussed the below patch with hminas@synopsys.com, who expressed doubts about its
> correctness.
> 
> I tested it a while back and it seemed solid (no crash & correct hashes), but while
> writing this mail I see that sometimes the output of sha512sum on the
> chromebook is wrong... also, I'm thinking that the fix below may be a memory
> leak.
> 
> 
> In conclusion, do not commit, the fix needs more work :)
> 
Yes, I suspect that your patch is not a real fix but rather a bandage; that is why I
want to reproduce the problem and spend some time trying to figure out what is
going on. In a nutshell, even if the current code doesn't handle the situation well,
it should not result in the observed problem (which looks like a memory overwrite).

> I hope to restart experimenting in a short while, when I get a bit more free
> time.
> 
> 
> I am waiting for any question you may have, thank you for your time.
> Boris.
> 
Thanks!

Guenter

> Guenter Roeck wrote:
>> Hi Boris,
>>
>> On Tue, Nov 05, 2019 at 12:29:22PM +0900, Boris ARZUR wrote:
>>> Channel halt can happen with BULK endpoints when the
>>> cpu is under high load. Treating it as an error leads
>>> to a null-pointer dereference in dwc2_free_dma_aligned_buffer().
>>>
>>
>> good find, and good analysis. We stated to see this problem as well in the
>> latest ChromeOS kernel.
>>
>> I am still trying understand what exactly happens. To do that, I'll need to
>> be able to reproduce the problem. Maybe you can help me. How do you tether
>> your phone through USB ?
>>
>> Thanks,
>> Guenter
>>
>>> Signed-off-by: Boris Arzur <boris@konbu.org>
>>> ---
>>>   drivers/usb/dwc2/hcd_intr.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>>                                   * A periodic transfer halted with no other
>>> --
>>> 2.23.0
>>>
>>> diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
>>> index a052d39b4375..697fed530aeb 100644
>>> --- a/drivers/usb/dwc2/hcd_intr.c
>>> +++ b/drivers/usb/dwc2/hcd_intr.c
>>> @@ -1944,7 +1944,8 @@ static void dwc2_hc_chhltd_intr_dma(struct dwc2_hsotg
>>> *hsotg,
>>>                           */
>>>                          dwc2_hc_ack_intr(hsotg, chan, chnum, qtd);
>>>                  } else {
>>> -                       if (chan->ep_type == USB_ENDPOINT_XFER_INT ||
>>> +                       if (chan->ep_type == USB_ENDPOINT_XFER_BULK ||
>>> +                           chan->ep_type == USB_ENDPOINT_XFER_INT ||
>>>                              chan->ep_type == USB_ENDPOINT_XFER_ISOC) {
>>>                                  /*

