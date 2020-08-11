Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4801C241FC2
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 20:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgHKSe5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 14:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgHKSe4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 14:34:56 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60866C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 11:34:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id i19so7219882lfj.8
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 11:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ue43Bju3lnWaIfHCGV0uI/Pcf9+YCXf7zDQu5sXsK1w=;
        b=Fm54mDOy+15JTTSU8vB612I3gZg8QvsMRpN9mqFKpGPWGfAcRKaX+1hpIiFHtL+s5r
         Hj/b+5glEOiD0Hq58cLeehkLcQRPVk2g923DtjTjaKF6LYKmS8cR0Izet//tv+0FTr20
         xRL0DFwXGVj+jIAm0Jc55s8I/zDi+958s3LDH797FEKnb6908q50G7EE4zAOuSvIYBjw
         u/bPPT3BF+fsm4SuIdtiZXg01x1tN/WMZtpvpPBLuH70oFkRnMkBpVOidS1vVBOinK+K
         MI0uchfQReWY3nicTEJIb8xp5/qTCqQ5ETQ7qlqihl2W3h/f2zSKv+WfCtdz2VvW+XNI
         bn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ue43Bju3lnWaIfHCGV0uI/Pcf9+YCXf7zDQu5sXsK1w=;
        b=nQ1stxI219yCXg0L6IjQC4N6YP1LtAvhlR52Qx1CVenf3vsuldtYkW05zJf1TantdF
         Mlhrv2Mbc//lXIY29a5LSiPIZItEOvhV+OThjkS+S8F/zgO7KnyTw1eK+faPhjNP1Cgn
         aToUvONXZUxz+UHp0zTi2cGA7AlIpMcws5tLK9Nc1bMHFgO38f0zZ89u/skJj1hdTRcV
         767hCIx4xWhkGzJaFYQet6+YvG5AUC4FUchnAX50OSPRgVdZPpZTgXiSStsRhITQ9vS0
         NNktj2zbh40KaBc+452t399zBuhQq+INdHeDbTDmo7IAAPH6lnXBhc2+4n0fxIUvITrI
         Owxw==
X-Gm-Message-State: AOAM533RXGAV5+MRc9llnGYqq8Vqc0zWmJf2S2c81H9i9Pcq7I2X+oZR
        5E+0IcfZduSlKdwUKC0FijI=
X-Google-Smtp-Source: ABdhPJy5hjm9d2GlWW99IHoJs3LY6fdCy/Qf4C3nhc1K7mZ6gTennBBO8Vj0+X4vAlaGRVwstpZFAA==
X-Received: by 2002:ac2:4436:: with SMTP id w22mr3888853lfl.176.1597170894831;
        Tue, 11 Aug 2020 11:34:54 -0700 (PDT)
Received: from [10.10.0.8] ([185.213.154.162])
        by smtp.googlemail.com with ESMTPSA id h18sm10140103ljk.7.2020.08.11.11.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 11:34:54 -0700 (PDT)
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
From:   Patrik Nilsson <nipatriknilsson@gmail.com>
Message-ID: <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
Date:   Tue, 11 Aug 2020 20:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811175655.GB828356@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,
> Can you provide kernel logs?  Odds are the disk disconnects itself as it
> takes too much power or something.
udev-kernel logs can be found: 
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172

I have tested the usb to sata adapter directly connected to a computer 
and connected to a externally powered usb hub. The bug behavior is the same.

One time when I tested the whole usb hub disconnected. I have a usb to 
ethernet connected to it too. It vanished and appeared again. Doubt it 
is power. The externally powered hub can deliver 4A, but I hope the usb 
to sata only takes 2A.

> That's a really old kernel, any chance you can try 5.8?
I'm downloading from 
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git. Will 
test it soon.

Best regards,
Patrik

On 11/08/2020 19:56, Greg KH wrote:
> On Tue, Aug 11, 2020 at 07:19:00PM +0200, Patrik Nilsson wrote:
>> Hi!
>>
>> I have an issue with a usb to sata adapter when much high speed data is
>> sent. If I erase my 4Tb SSD disk connected to the usb to sata interface with
>> a "slower" /dev/urandom it works, but if I exchanges this to /dev/zero the
>> disk is after a while disconnected.
>>
>> For logs from udev and more debug attempts see:
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172
>>
>> Description:
>>
>> When the speed of data with a usb disk device is too high, the probes that
>> check if the disk still exists is missed. This makes the disk to be
>> unmounted and is remounted with an other drive letter (/dev/sdX). If this
>> disk is the root ("/"), the computer hangs.
>>
>> A usb SSD-disk (4 TB) connected to a USB port reproduce this bug easily.
>> This has never happened with a mechanical USB-drive.
>>
>> Symptoms and how to reproduce:
>>
>> 1) (Disk mounted as root) Computer hangs. Only way to get started again is a
>> hard reset.
>>
>> 2) (Erasing disk, not mounted as root) If you erase a disk with dd ("dd
>> if=/dev/zero of=/dev/sdX"), the disk disappears from the mounted list and
>> reappears as an other drive letter. In my case the data is redirected to
>> /dev/null and the fans speed up. The apparent data transfer speed is also
>> increased. Usually this happens after about 45 to 60 minutes.
> Can you provide kernel logs?  Odds are the disk disconnects itself as it
> takes too much power or something.
>
>> 3) Fill RAM with programs and make sure the swap to this disk is used.
>>
>> Bug found in:
>>
>> $ uname -a
>> Linux pb-189b1884 5.4.0-40-generic #44-Ubuntu SMP Tue Jun 23 00:01:04 UTC
>> 2020 x86_64 x86_64 x86_64 GNU/Linux
>>
>> $ cat /proc/version_signature
>> Ubuntu 5.4.0-40.44-generic 5.4.44
> That's a really old kernel, any chance you can try 5.8?
>
> thanks,
>
> greg k-h

-- 
PGP-key fingerprint: 1B30 7F61 AF9E 538A FCD6  2BE7 CED7 B0E4 3BF9 8D6C

