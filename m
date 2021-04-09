Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152C0359EF2
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 14:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhDIMlu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 08:41:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36069 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231370AbhDIMlt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 08:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617972096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L733xFprgRiiYMQded2WwSU7E+0tuZIA/5iY+3T9eSc=;
        b=D8esXdxgjJCNde6r/+cYLx6uxoPTINprriARK+U2mQ9p3WjLLtUlGZcRcBkHELWFLXtdcK
        ekU+D9KEGm4rQImQvOADiV7k8xdZ2VH3akjTcFi3qXYlX/Yf8dABqzE/voPpGKxCUfWV09
        zk0IhBGvio8I8HVbEHHjYlsGso2BGjk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-0xYTnVggO2WntdlqJrgB7w-1; Fri, 09 Apr 2021 08:41:35 -0400
X-MC-Unique: 0xYTnVggO2WntdlqJrgB7w-1
Received: by mail-ej1-f69.google.com with SMTP id yk6so2109973ejb.21
        for <linux-usb@vger.kernel.org>; Fri, 09 Apr 2021 05:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L733xFprgRiiYMQded2WwSU7E+0tuZIA/5iY+3T9eSc=;
        b=CoV9rpzGGJ3g1axvHnt5ppohFye/Cl0JdFFZ7IsCmnHiAfVrEOgmxuKugEpM4XdJxj
         U3rLbMvifl8mfc2xMEqP9WLgxqYCoYAldK6dN4Q1aB1ti5KXO+pF+X8bjExypL7KN43d
         9oxN6hX23+e5F3LHd8Je1N+2xN4zh2pM9y8UnwX5gby19kV8iXI4AV3/tZLAf2+2qQKb
         u0CL0xwQmpIqTO6czDg3CVIS5kLDs5aA9sW/3pJr53BsvVwjS2fIkOF8uvTDnyHOAwbr
         0LbTO8witvRTXK7zwl15HlghStKCqGbWwVBYXuiqkxqgYTB2z/K5HBx5ABnMPNx0XhPw
         H6Lw==
X-Gm-Message-State: AOAM5337frDpv55kuYDDLzZdmlcn4OhSKTDtvIJ54hLqPCYxSeTBCekt
        7yPFQ1TKkNCPIIWjM7u3lzXGTeA/dCpg5XJgrCFlArdlul9QQld7lvygiwW2PDPA0HUWR2k2bJt
        llPDP0sgF0pRJSqhfy3Cz9BpSzhacMTK3ZS7FU/6gY86obFdcWqyD09Ud5SzLhda7FOkc2hPi
X-Received: by 2002:a17:906:4cd9:: with SMTP id q25mr16016590ejt.187.1617972093506;
        Fri, 09 Apr 2021 05:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLmwzbDEunH2O6hXOxRBVafIAGlBkRUo/xcq64OPLO3BlzKKBBg82FcsiHxKaqubWs4HWusQ==
X-Received: by 2002:a17:906:4cd9:: with SMTP id q25mr16016573ejt.187.1617972093291;
        Fri, 09 Apr 2021 05:41:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k12sm1390852edo.50.2021.04.09.05.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 05:41:32 -0700 (PDT)
Subject: Re: [PATCH] usb: roles: Cakk try_module_get() from
 usb_role_switch_find_by_fwnode()
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20210408203611.544005-1-hdegoede@redhat.com>
 <20210408230904.GA87058@roeck-us.net> <YHAez16ixJitMVtN@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <39c3ac59-7b55-e77c-b481-b5d6308a41a5@redhat.com>
Date:   Fri, 9 Apr 2021 14:41:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YHAez16ixJitMVtN@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/9/21 11:30 AM, Heikki Krogerus wrote:
> On Thu, Apr 08, 2021 at 04:09:04PM -0700, Guenter Roeck wrote:
>> On Thu, Apr 08, 2021 at 10:36:11PM +0200, Hans de Goede wrote:
>>> usb_role_switch_find_by_fwnode() returns a reference to the role-switch
>>> which must be put by calling usb_role_switch_put().
>>>
>>> usb_role_switch_put() calls module_put(sw->dev.parent->driver->owner),
>>> add a matching try_module_get() to usb_role_switch_find_by_fwnode(),
>>> making it behave the same as the other usb_role_switch functions
>>> which return a reference.
>>>
>>> This avoids a WARN_ON being hit at kernel/module.c:1158 due to the
>>> module-refcount going below 0.
>>>
>>
>> Took me a while to figure out what the subject line is supposed
>> to mean.
>>
>> s/Cakk/Call/
>>
>> Otherwise
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> It might be useful though to explain the difference between
>> fwnode_usb_role_switch_get() and usb_role_switch_find_by_fwnode(),
>> and why two different functions are needed, both passing fwnode
>> as parameter and returning a pointer to usb_role_switch.

Sorry about thetypo, I completely missed that while preparing the patch,
fixed for v2.

> Yes, the function names are confusing indeed. My proposal is to rename
> usb_role_switch_find_by_fwnode() to fwnode_to_usb_role_switch().
> 
> I can prepare a patch for that if you guys are OK with it, or Hans,
> would you prefer to send that together with this one?

If you can send a patch to apply on top of my v2 of this patch then
that would be great.

> Actually, shouldn't this be marked as a fix?

That is a good point I've added a fixes tag for v2.

Regards,

Hans

