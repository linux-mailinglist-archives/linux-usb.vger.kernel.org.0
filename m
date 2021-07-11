Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3663C3BF5
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jul 2021 13:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhGKLot (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jul 2021 07:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhGKLot (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Jul 2021 07:44:49 -0400
X-Greylist: delayed 476 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jul 2021 04:42:02 PDT
Received: from mail.turbocat.net (turbocat.net [IPv6:2a01:4f8:c17:6c4b::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E23C0613DD
        for <linux-usb@vger.kernel.org>; Sun, 11 Jul 2021 04:42:02 -0700 (PDT)
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id 6A4AA26011E;
        Sun, 11 Jul 2021 13:34:04 +0200 (CEST)
Subject: Re: "Chipmunk audio" on Logitech USB webcams
To:     Greg KH <gregkh@linuxfoundation.org>,
        Tristan Miller <psychonaut@nothingisreal.com>
Cc:     linux-usb@vger.kernel.org
References: <20210711102503.179b154b.psychonaut@nothingisreal.com>
 <YOrKFIlEHopiVKJT@kroah.com>
From:   Hans Petter Selasky <hps@selasky.org>
Message-ID: <47b11919-afca-8421-a19d-8a7db030bcaf@selasky.org>
Date:   Sun, 11 Jul 2021 13:33:56 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YOrKFIlEHopiVKJT@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/11/21 12:38 PM, Greg KH wrote:
> On Sun, Jul 11, 2021 at 10:25:03AM +0200, Tristan Miller wrote:
>> Greetings.
>>
>> Many models of Logitech USB webcams malfunction under Linux by producing
>> audio that sounds distorted, garbled, or high-pitched. For most users,
>> the problem happens randomly, and can usually be worked around by
>> restarting the audio application or by unplugging the webcam and then
>> plugging it back in again.
>>
>> The problem is described in a kernel.org bug at
>> <https://bugzilla.kernel.org/show_bug.cgi?id=44281>. Despite eight
>> years' worth of comments and duplicate bugs indicating that that the
>> problem is still occurring, this report has remained closed as
>> "resolved" since 2013. It's unclear whether any of the right developers
>> have even seen these comments; certainly none of them have ever
>> responded, even just to reopen the bug. A comment on one of the
>> duplicate bugs <https://bugzilla.kernel.org/show_bug.cgi?id=203763#c1>
>> suggests that this may be because the bug was misfiled in the
>> v4l-dvb/webcam product, whereas it should instead have been posted to
>> this mailing list.
>>
>> I'd appreciate it if one of the USB for Linux developers could take a
>> quick look at the bug report to confirm whether it's been filed in the
>> right place.  If not, please let us know (either here or in Bugzilla)
>> where the bug should be reported instead, and if it is indeed here on
>> linux-usb, let us know if any further diagnostic information is
>> required.
> 
> Please report the information directly here, to this list, and to the
> sound developers at alsa-devel@alsa-project.org and we can all work to
> resolve this.
> 
> First off it would be great to test if this happens in 5.13, does it?
> And how can you reproduce it and with what specific device?
> 

Hi,

I just recently bought a very expensive USB 3.0 Logitech BRIO 4K USB 
webcam. These webcams provide a standard USB audio compliant interface, 
and thanks for that! I've noticed that when doing a looptest, I.E. 
playing the recorded audio back through a set a of headphones, then 
after some 30 minutes, the audio starts corrupting. This does not happen 
on MacOSX. I've dumped the audio data using both Ellisys USB2.0 and 
usbdump on FreeBSD, and verified that it is not a host software problem. 
The data stream from the device really carries the bad audio. Now just 
recently someone reported to me a problem with a "Scarlett Solo 3rd" 
under FreeBSD with XHCI, and I started looking into the code and found 
some bugs* regarding the start frame for isochronous packets. After that 
was fixed it seems to work fine again, but I don't know for how long.

I suspect these Logitech devices have received very little so-called 
negative testing. I was in contact with Logitech support, but the people 
there know basically nothing, and it ended they offered me a warranty 
refund - how funny!

So yes, there are some software problems in these devices the vendor is 
not willing to acknowledge, and they can suddenly trigger.

I know that FreeBSD is not Linux, but I thought that sharing my 
experiences here might help moving forward with this issue!

--HPS

*)

https://cgit.freebsd.org/src/commit/?id=d038463bd269031fa8f13c0951b223bcae02bbca

https://cgit.freebsd.org/src/commit/?id=8fc2a3c41791b205a107dc2bec16ac7514a57958

--HPS
