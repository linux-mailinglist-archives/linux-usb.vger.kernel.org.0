Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA5E3C970C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 05:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbfJCDvg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 23:51:36 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35355 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJCDvg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 23:51:36 -0400
Received: by mail-pl1-f193.google.com with SMTP id y10so844314plp.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 20:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zcfr6gh+YYS9Ofe5zzxO00WWlSEbQSQbHSvUKydprX0=;
        b=qcyLerwbn2yfOS02Xl8YbuxpAG8SsG1YHki1dPFC9wi9T0m52j3Gln5mRblhZGw1Ps
         X5SC9PTEnKMLuESwQOZxQM2JRI7gteqfNWJc3i7dNEJJTtlBowHkHAVnsxwz6vjTta2W
         efY0ZoZfhrTBR8E8lw4oJ2TRMLJNyP7bn2xZjxmssIGHCYbA722cFsD0rSzzaRJmWP45
         P/Ak8GnYCAruaN4PLRAsyRWk6uS5BbxpdUVLYpKJSOsQ9i8aVue/rFG5Wi6S04cVGUvS
         oDVebjsBSxojks5fdK/E/88886nxw2zcs8HPtIBrZzYA47c8MfRKIvTMU0IhMnuaaNxt
         ouTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zcfr6gh+YYS9Ofe5zzxO00WWlSEbQSQbHSvUKydprX0=;
        b=YxhiSGNVx7MmIOjTOz0/bW3sRTzurdGs5ZEu0y7iWWMc4KZADsZn58beqhQxzsnClp
         KJFwodia3L6bBuH0ew7EWwW+ddAMH6UQl/fKucdJEf96vxxWUqrx4mUAYeB/y/gLhVfJ
         VERjFU97o3Z9qWkNOSfqJifbsZQvcJNd/WxuVYFC/ohZaKQU1FsT/2DNmfy5sWW1spY8
         YCRYEF3PR1QTGocPquuX9o+H6paee9m+iZQNZ0YRj2pw62x8dt84KejSIPXPGqgfmnId
         BuZfKA7uuc30AA3APZDia37d+Hk+KU3Fbf9s4Snyp9xgVs8wvvyHi5K/gAMhpF3xSeYv
         h/3Q==
X-Gm-Message-State: APjAAAXk72kymSPL8VGHjGEceycupB3EfNnhAFuMF8C84zFQ+yLdTlaU
        +mdlTkPqk2LKZUq4GECxQUqK/rGy
X-Google-Smtp-Source: APXvYqxmgzjTxBNJMTgrlJsx96vTDyG63rqQ69syc0zIk5NzB4pO77swO0O74PpZjeTE/gdz6aEKRw==
X-Received: by 2002:a17:902:6a82:: with SMTP id n2mr7396349plk.174.1570074693870;
        Wed, 02 Oct 2019 20:51:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m22sm800169pgj.29.2019.10.02.20.51.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 20:51:32 -0700 (PDT)
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
 <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
 <20191002160652.GB19836@kuha.fi.intel.com>
 <20191002191659.GA30108@kuha.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <58ec0c7e-10b5-2a73-0629-abb2bddba469@roeck-us.net>
Date:   Wed, 2 Oct 2019 20:51:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002191659.GA30108@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/2/19 12:16 PM, Heikki Krogerus wrote:
> On Wed, Oct 02, 2019 at 07:06:55PM +0300, Heikki Krogerus wrote:
>> This is a bit off topic, but that attribute file is really horrible.
>> Right now there is no way to know the actual capability of the
>> port in user space. If something changes a DRP port into sink or
>> source, there is no way to know after that that the port is actually
>> DRP capable.
> 
> That statement is not correct. I'm sorry. I don't know why did I put
> it that way.
> 
> I wanted to say that now the userpsace is forced to keep track of a
> specific sysfs file in order to be sure of the currently supported
> role, That alone is wrong, but there is no way to guarantee that
> one day we would not need to support another capability in a similar
> fashion, and that would mean another sysfs file, and we just forced
> the userspace to be modified. The capabilities of the port really need
> to be static.
> 

I assume you refer to port_type. If I remember correctly, this is actually
used by Android userspace code to specifically select if a port can be
source, sink, or drp. I am not sure if it is a good idea to enforce
port removal and re-registration in conjunction with this - the port
can, after all, be connected to some storage device or to a monitor.
I am not sure how we could "sell" to users the idea that if they change
the port type, their screen will go dark for a few seconds.

Am I missing something ?

Thanks,
Guenter

> We can handle the capability changes like I propose below without
> affecting the userspace.
> 
>> So that ABI is "buggy", but even without the problem, I still really
>> think that allowing the capabilities to be changed like that in
>> general is completely wrong. I don't have a problem with changing the
>> capabilities, but IMO it should be handled at one level higher, at the
>> controller device level. If the capabilities of a port need to be
>> changed, the old port should be removed, and a new with the new
>> capabilities registered. That is the only way to handle it without
>> making things unnecessarily difficult for the user space.
>>
>> I'm pretty sure that that was my counter proposal already at the time
>> when the attribute file was introduced, but I don't remember why
>> wasn't it accepted at the time? My protest against adding that
>> attribute file was in any case ignored :-(. In any case, my plan was
>> to later propose a new sysfs group that we offer to the parent
>> controller devices instead assigning it to the port devices, and that
>> group is meant to allow port capability changes the way I explained
>> above. Unless of course you are against it?
>>
>> thanks,
>>
>> -- 
>> heikki
> 

