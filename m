Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F269C41F661
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 22:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355315AbhJAUiu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 1 Oct 2021 16:38:50 -0400
Received: from smtp1.math.uni-bielefeld.de ([129.70.45.10]:52974 "EHLO
        smtp1.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229975AbhJAUiu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Oct 2021 16:38:50 -0400
Received: from [192.168.0.100] (dslb-088-068-075-088.088.068.pools.vodafone-ip.de [88.68.75.88])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id 161B960335;
        Fri,  1 Oct 2021 22:37:04 +0200 (CEST)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Tobias Jakobi <cubic2k@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20210921101752.4679-1-tjakobi@math.uni-bielefeld.de>
 <20210921151323.GA170347@rowland.harvard.edu>
 <cfb2d4e4-0e6a-69d5-01ac-dc1ab4d9d319@math.uni-bielefeld.de>
 <20210921164221.GA172450@rowland.harvard.edu>
 <609b10d0-7a20-ffa2-b283-67e0e91c7909@math.uni-bielefeld.de>
 <20210927150400.GA361082@rowland.harvard.edu>
From:   Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] usb: storage: add quirks for VIA VL817 USB3-SATA bridge
Message-ID: <c4d2ed9c-0aea-e0f5-7f9a-d603ffd26df5@math.uni-bielefeld.de>
Date:   Fri, 1 Oct 2021 22:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927150400.GA361082@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/27/21 5:04 PM, Alan Stern wrote:

> On Sun, Sep 26, 2021 at 08:14:46PM +0200, Tobias Jakobi wrote:
>> Hello Alan,
>>
>> On 9/21/21 6:42 PM, Alan Stern wrote:
>>> On Tue, Sep 21, 2021 at 06:06:45PM +0200, Tobias Jakobi wrote:
>>>> Hi Alan,
>>>>
>>>> sorry but your analysis of the log is wrong. Nothing was disconnected or
>>>> unplugged when the device behaves this way. The enclosure is connected to
>>>> the power the entire time, and the same applies to the physical USB
>>>> connection to my system.
>>> That may be so, but if it is then the log extract you included with the
>>> patch is very misleading.  For instance, you didn't include any part of
>>> the log before and leading up to the line saying "usb 2-1.2: USB
>>> disconnect, device number 4".  Thus there is no way for the reader to
>>> tell what caused this event, whether it was a physical unplug or not.
>> I included the part of the kernel log which shows how the issue manifests
>> itself. Do you think I'm so stupid as to believe I could prevent a physical
>> unplug of the enclosure by blacklisting UAS? Really, this is getting
>> ridiculous...
> No, I don't believe that.  However, I do believe you are so stupid as
> to post a patch with a description that does not justify it and
> includes a lot of irrelevant details.  (Hey, you brought up the issue
> of how stupid you are!  :-)
>
>>>> To make things very clear: This happens in under five minutes after having
>>>> powered up the enclosure and starting a file transfer to the installed RAID.
>>>> After blacklisting UASP the enclosure works perfectly fine for hours. I hope
>>>> this clears things up.
>>> You didn't answer my question about using NO_ATA_1X instead of
>>> IGNORE_UAS.  This is a perfect example of one of the dangers of
>>> top-posting -- it makes it far too easy for people to miss important
>>> points in the email they are replying to.  (Hint: Don't top-post!)
>> I did not answer this question, because I didn't have the answer to it yet.
>> I have tested your suggestion today, but sadly I'm running into the same
>> type of problem with NO_ATA_1X. You can find the complete kernel log here:
>> https://www.math.uni-bielefeld.de/~tjakobi/archive/dmesg_VL817.log
> Good, thank you.  Unfortunately the log doesn't include any smoking
> guns pointing to an underlying cause.

I'm open to suggestions regarding identifying the cause. As you might 
guess, I'm also not happy that I had to disable UAS for the enclosure -- 
in particular since I selected this particular product because it was 
advertised with having support.


>
>> The RAID1 is broken after such an event.
>>
>> With best wishes,
>> Tobias
>>
>>
>>> Alan Stern
>>>
>>>> With best wishes,
>>>> Tobias
>>>>
>>>> On 9/21/21 5:13 PM, Alan Stern wrote:
>>>>> On Tue, Sep 21, 2021 at 12:17:52PM +0200, Tobias Jakobi wrote:
>>>>>> The VL817 is used in the RaidSonic Icy Box IB-3740-C31 enclosure. The enclosure
>>>>>> is advertised as having UASP support, but appears to have problems with 4Kn
>>>>>> drives (test was done with two Seagate Exos X, 12TB).
>>>>>>
>>>>>> Disable UAS for the VL817 as it behaves highly unstable:
> I still have to wonder if the enclosure works okay with other types of
> disk drive.  And if it doesn't, why don't these errors show up on
> Windows systems?  Or on other VIA enclosures?

I only experienced this after installing the two 4Kn drives, never with 
the two 512e drives that were installed first. My guess is that 4Kn 
drives are still rare and if they're used, then natively attached to a 
SATA port. I don't have any Windows system here to test this, and even 
if, I wouldn't know how to assemble the RAID1 there anyway.


> That's why I'm cautious about accepting this patch.  I don't want to
> slow down unnecessarily a bunch of USB disks that could work just fine
> at the higher UAS transfer rates.

I understand. If that's the case, I'm just going to continue to keep the 
patch in my local kernel tree.


>
> By the way, does the enclosure have its own power source, or does it
> rely entirely on power provided over the USB cable?  Note that UAS can
> use more power than the older mass-storage protocols, because it queues
> more operations in rapid succession (which is also why it runs faster).

This is the enclosure:
https://icybox.de/product.php?id=155

It has a external power supply (quite a bulky one) and it does not work 
without it. So it doesn't draw anything (significant) from the USB 
cable. I first also suspected this to be a power supply related problem, 
but I discarded that idea since the whole thing works as MSC. I can't 
imagine the power draw to be so much different for UAS, but maybe I'm 
just naive there.

With best wishes,
Tobias


>
> Alan Stern

