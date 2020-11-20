Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7BA2BB0E9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 17:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730096AbgKTQrg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 11:47:36 -0500
Received: from smtp4-g21.free.fr ([212.27.42.4]:34802 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729265AbgKTQrg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Nov 2020 11:47:36 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:5b0:6190:59c4:df84:50f2:d889])
        (Authenticated sender: manchette)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 06E9819F5D8
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2020 17:47:32 +0100 (CET)
Subject: Fwd: Webcam not working , HD Web Camera (18d1:0002)
References: <e8a0bce4-3703-7490-2972-953b1dc76eee@free.fr>
To:     linux-usb@vger.kernel.org
From:   manchette <manchette@free.fr>
X-Forwarded-Message-Id: <e8a0bce4-3703-7490-2972-953b1dc76eee@free.fr>
Message-ID: <54663f41-3add-5be5-298a-7c07522bb8a4@free.fr>
Date:   Fri, 20 Nov 2020 17:47:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <e8a0bce4-3703-7490-2972-953b1dc76eee@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hello,

Mama mia, will i ever learn good practises ?

Fabrice

-------- Message transféré --------
Sujet : Re: Webcam not working , HD Web Camera (18d1:0002)
Date : Fri, 20 Nov 2020 17:25:50 +0100
De : manchette <manchette@free.fr>
Pour : Greg KH <gregkh@linuxfoundation.org>

Le 20/11/2020 à 16:27, Greg KH a écrit :
> On Fri, Nov 20, 2020 at 02:43:41PM +0100, manchette wrote:
>> Hello,
>>
>> A webcam is not working here :
>> here is what i know of it :
>>
>> System:    Host: linux-815u Kernel: 5.3.18-lp152.47-default x86_64 bits: 64
>> Desktop: KDE Plasma 5.18.5
>>             Distro: openSUSE Leap 15.2
> 
> That is a very old kernel version, you should at least upgrade to a
> modern one.
> 
>> [19563.481204] usb 1-7: Product: HD Web Camera
>> [19563.481207] usb 1-7: Manufacturer: Ingenic Semiconductor CO., LTD.
>> [19563.481210] usb 1-7: SerialNumber: Ucamera001
>> [19563.488049] uvcvideo: Found UVC 1.00 device HD Web Camera (18d1:0002)
> 
> Looks like the driver is bound properly to the device, are you sure this
> device follows the correct UVC specification?
> 
> Try updating to a 5.9 kernel version, and if that doesn't work, send
> your log message to the linux-media developers, they can help you out
> better than we can.
> 
> good luck!
> 
> greg k-h
> 


Hello,

Thank you for your answer.


Some details for the context :
i'm trying to help a french user that i don't know from here 
https://www.alionet.org/index.php?topic=700.new#info_5476  .
This is the opensuse french speaking forum (I'm an opensuse user since 
version 9.3 https://en.opensuse.org/Archive:SUSE_Linux_9.3).

Since opensuse 15.2 it's now needed to sign everything that is 3rd party 
related to be able to upgrade properly.
This is pretty technical and is not something i would recommend for a 
simple end user. I think this is good practise but I guess we need 
something that adds goodies : security _and_ confort for the end user.

I asked at github linux-media ( here if i'm correct 
https://github.com/hvaibhav ) to see whom should be contacted in case a 
new kernel is not enough.

Thank you.


-- 
Fabrice

-- 
Fabrice
