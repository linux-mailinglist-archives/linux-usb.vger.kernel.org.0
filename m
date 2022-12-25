Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD93F655E35
	for <lists+linux-usb@lfdr.de>; Sun, 25 Dec 2022 21:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiLYUMz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Dec 2022 15:12:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiLYUMy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Dec 2022 15:12:54 -0500
X-Greylist: delayed 4694 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 25 Dec 2022 12:12:52 PST
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDFF242
        for <linux-usb@vger.kernel.org>; Sun, 25 Dec 2022 12:12:51 -0800 (PST)
Received: from relay19.mail.ox.ac.uk ([129.67.1.170])
        by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
        (envelope-from <mike@cs.ox.ac.uk>)
        id 1p9W8r-0001RV-IA
        for linux-usb@vger.kernel.org; Sun, 25 Dec 2022 18:54:37 +0000
Received: from smtp8.mail.ox.ac.uk ([163.1.2.204])
        by relay19.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mike@cs.ox.ac.uk>)
        id 1p9W8o-0003oO-Bq; Sun, 25 Dec 2022 18:54:34 +0000
Received: from [213.31.71.29] (port=53136 helo=[192.168.1.75])
        by smtp8.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <mike@cs.ox.ac.uk>)
        id 1p9W8n-0004Jz-RV; Sun, 25 Dec 2022 18:54:34 +0000
Message-ID: <3482c592-ff59-612b-881a-b638e77911a2@cs.ox.ac.uk>
Date:   Sun, 25 Dec 2022 18:52:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Content-Language: en-US
To:     dima.pasechnik@cs.ox.ac.uk, Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <Y6B8jd7dHsa85Wny@kroah.com> <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert> <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert> <Y6D1j+AVp8YTJjCd@rowland.harvard.edu>
 <Y6Gz6wWb6bpz0rRb@hilbert> <Y6XAMmx7LjDn1J6R@kroah.com>
 <Y6Y/FB1IS6BrKsCW@hilbert> <Y6aiAtZUd56VfS8i@kroah.com>
 <Y6gvKlalZQGnIiuB@hilbert>
From:   Mike Spivey <mike@cs.ox.ac.uk>
In-Reply-To: <Y6gvKlalZQGnIiuB@hilbert>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Oxford-Username: spivey
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Not seeing all of the discussion, I'm not sure what the underlying 
problem might be.  So just a few remarks that might be helpful, given 
what I can recall during Christmas in deepest Yorkshire.

-- Mike

(i) I'm sure the identical USB id's are deliberate; the intention is 
that higher-level tools will assemble version-independent binaries that 
can be uploaded to either device in the same way. Dima and I are 
preparing lower-level programs that will only work on one board or the 
other -- actually, if things go according to plan, we will use only the 
V1 board this year.  You could get in touch with the micro:bit 
foundation, but they won't change this.

(ii) I don't believe I've had any difficulty communicating with either 
board using recent versions of PyOCD, given an appropriate udev rule -- 
the same rule for both devices.  I think PyOCD probes for the processor 
it is talking to -- nRF51 or nRF52 -- or you can tell it on the comand line.

(iii) The micro:bit is what I call a two-chip eval board, with the 
target processor running arbitrary code on the bare metal, and a 
separate serial/programming/debugging chip that runs firmware that is 
usually not changed.  That's in contrast to the kind of one-chip board 
where the target processor has some kind of USB-based bootloader on it.  
The separate chip on the micro:bit is a Freescale KL25, I believe, and a 
bit more powerful than the nRF51 target chip on the V1.  I believe the 
firmware is open source and can be replaced through some kind of 
bootstrap ritual -- perhaps involving pressing the reset button while 
plugging in the device.

On 25/12/2022 11:08, dima.pasechnik@cs.ox.ac.uk wrote:
> On Sat, Dec 24, 2022 at 07:53:54AM +0100, Greg KH wrote:
>> On Fri, Dec 23, 2022 at 11:51:48PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
>>> On Fri, Dec 23, 2022 at 03:50:26PM +0100, Greg KH wrote:
>>>> On Tue, Dec 20, 2022 at 01:08:59PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
>>>>> On Mon, Dec 19, 2022 at 06:36:47PM -0500, Alan Stern wrote:
>>>>>> It might help if you post the output of "lsusb -v" for this device.
>>>>> Please see attached; I also attached the output for an older version of
>>>>> this board (V1). The one we talk about is V2. Both versions have the
>>>>> same VID, and, weirdly, the same PID (internally they aren't binary
>>>>> compatible, even)
>>>> That's horrible, someone should talk to the vendor here and get them to
>>>> at least bump the device id.
>>> The vendor is ARM (https://www.arm.com/) - I guess Linux Foundation is a good "someone"
>>> to talk to the vendor in this case.
>> I do not understand here, are you asking me to talk to someone?  If so,
>> great, who?  If not, who are you asking?
>>
>>> Can PID be bumped up by a firmware update?
>> Depends on how the hardware was designed.  Most can, some can not.  Is
>> the hardware design and firmware source available anywhere?
> As far I know, firmware comes from
> https://tech.microbit.org/software/runtime/
>
> As to why these V1 and V2 happened to get the same product ID, perhaps
> my colleague Mike, in CC, who teaches a course using this board,  knows more.
>
> Cheers
> Dima
