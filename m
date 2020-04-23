Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D95F1B66B1
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 00:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgDWWUt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 18:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDWWUt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 18:20:49 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F385C09B042
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 15:20:47 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x4so8348096wmj.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2020 15:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=iZJstUGA8qL5bMJc9utsvlq+grMCWtBoxMXU5F9FZA4=;
        b=AnIGVChAVpyJG6TAOhM6gpZMvR3w5mcPALbQYxxM6AOdcdXr3uhpGn5WzbY2JhE/DO
         CpptBY/zVdeRvesFB90xK/l78I/45/eWb4rrq3rypq3tG0BmD51LHhIOK0fcGcL29WMP
         dnuzEb2Ez7mJ6ZWN1PYg51dNCt2SItvutPuvDLcPdHFlbzGHn6rpYaiAHL6SLXyeDSTg
         1pyEQqB8MsE8G9KHNKJiJ2LQlRcfwrhplqLNoAnl92HIGRVaZPCGAfA90Er4kh8nq7yf
         c9/NoM20Vt2qjOBrTI/ND6ThqfSyMOuZnBdW/nz3aGHFiXbEfwcQqdcuqRdBZLCJVk3X
         WvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iZJstUGA8qL5bMJc9utsvlq+grMCWtBoxMXU5F9FZA4=;
        b=sTnpazNBwgCMX2nVnMzl+AhFXkfPVytwekt2UMpnBQruBn0NcZdhYs6ymmqieO5+6n
         JYtQ9SZOHExAlyZEP/h1mf8ATkTLlvBWEjmqsYiD9sTd639GdVi3WvfgrVqpU84MpFLb
         4e1WeLVzzPmact34bxheBzj5HPqM8nCyeX8KDgou19ndruTO6ANs5QHOH5+wDRw/AIbj
         6sYv1z/Nz6cJMjl5Y0+KseQaaQ8LvrscSUxm4txsDY7mjdGsqovMQonFZ7cwyN2LP6/u
         aJPA9zKsXofoNcPelRo7lrGUgCoSHHzmbzihIPYyHwk0cFzJFWB/ixRT593ksC7mLvve
         aolA==
X-Gm-Message-State: AGi0PuYtND1D6OZFAYW6skzDF1ulDdLnYvXg2JenzGWpDa5ddZxOc5IQ
        LucShHR4x8Kg/0tLTPZb6I9PR+Zrxkc=
X-Google-Smtp-Source: APiQypLLJnfppeVbLBIw4iaxodPezttzMoIbBnAtaM99RapzxEZsO0QRVkRiUUSbWPcO4S4j7o//Fg==
X-Received: by 2002:a1c:a794:: with SMTP id q142mr6428836wme.4.1587680445948;
        Thu, 23 Apr 2020 15:20:45 -0700 (PDT)
Received: from [192.168.1.103] ([149.200.161.180])
        by smtp.gmail.com with ESMTPSA id w18sm5566154wrn.55.2020.04.23.15.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 15:20:45 -0700 (PDT)
Subject: Re: USB BUG on BCM6318
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <590879e3-f9ea-0a59-3262-41192ca4cf46@gmail.com>
 <1587632815.23108.1.camel@suse.com>
From:   xchetah <xchetah@gmail.com>
Message-ID: <cfe3c792-33ff-b4f8-635b-d4e60b632c8e@gmail.com>
Date:   Fri, 24 Apr 2020 01:20:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1587632815.23108.1.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/23/20 12:06 PM, Oliver Neukum wrote:
> Am Mittwoch, den 22.04.2020, 19:45 +0300 schrieb xchetah:
>
> Hi,
>
> which kernel version?
>
>> the problem is that there’s no connectivity at all , I can connect to
>> the AP (only without encryption ) and the ssid doesn’t always show on my
>> mobile phone.
>> the usb port is working fine , I tried mounting a usb flash drive with
>> no problem.
>> also the adapter is working , I tried it on Orange pi , Raspberrypi ,
>> bcm6328 , all with openwrt installed on them and didn’t have any problem .
>> I guess it is something related to bcm6318 or its architecture code .
>> the onboard broadcom pci wifi is working .
>> I suspected that its a power problem so I added an external usb power ,
>> but with same issues.
>> also I tried openwrt 19 ,18 ,17 with same problem.
>> I’m also using two bcm6328 routers as point to point wifi 5ghz link with
>> Ralink RT5572 chipset ( rt2800usb driver ) withouyt any problem.
>> dmesg is filled with :
>>
>> [ 1269.191198] rt2800usb_tx_sta_fifo_read_completed: 13054 callbacks
>> suppressed
>> [ 1269.191239] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed:
>> Warning - TX status read failed -32
> -EPIPE. Something is stalled. The cause is unknown. What is the very
> first error during the enumeration process?
>
> 	Regards
> 		Oliver
>
kernel version : 4.14.171 , also tried testing kernel 5.4 with the same
results.

there's no error during enumeration , errors occur as soon as I activate
the device in AP mode or client mode , if the device is doing nothing I
get no errors.

usb works fine with usb storage , I tried another adapter with rt2800 
driver and got the same exact problem.

Regards

Eyad


