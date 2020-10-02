Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06EF281CAF
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 22:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgJBUMj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 16:12:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54922 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725710AbgJBUMj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 16:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601669558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jRa1+8lfB4BuoCObGMuIPS2fPCb4q3gKE+JOmoAd5bs=;
        b=VlKBZIj7RKBOIb1wNqbzhFmZfH4B9ZMXYRMfY27UF0yzUwLuD84gRhq74uR1YnTUnyJVHE
        QE7Cxdy5+TZaVAUNcHv6dtjHiO3p5ZErtj4X354C738Wm1tWWmkC2HdgAvyVCSoEC13ChW
        oIgA0QTdZ1MJ1Xc7qvy/r5WMlCiaocc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-WUyLpgZdOWKRo9NBf4F7lg-1; Fri, 02 Oct 2020 16:12:36 -0400
X-MC-Unique: WUyLpgZdOWKRo9NBf4F7lg-1
Received: by mail-ed1-f70.google.com with SMTP id 63so1165366edy.9
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2020 13:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jRa1+8lfB4BuoCObGMuIPS2fPCb4q3gKE+JOmoAd5bs=;
        b=Fe+Zn+XZ1PkJDosWSencIpr4FsQhZnOxO0//0+R1+8VPMwB7iLQeViWIbj9Egimhy3
         s9iVTaYRay2P170bHFELu3pntmv7eWGsuuXqHFhEhWd9rZ1pUSf1WOlc74UKJVRM4yo8
         EqWpgvBbgZhaMLWcSbSAiwdxCj/ckI4oN8pQ9sHCUtDpVxiUjEgHRTvcaJjQXWtzl9fj
         I8S1mZsdrto1Q1mAeUyKIQyfTN98A4PrMPDR00k94aQ4XU6mgpg7BF3x0gMeB7VRUAvA
         ACf5V+FC1qOAcf85OT+9b6bNFZZJH5x7aLi5o+KZr4Ot7VbmyGZ5OAf0gqu3a4B/YktX
         V6NA==
X-Gm-Message-State: AOAM532pgVDYIpX/1G0cMv25VwhHnTBKOIjOUMrgttnpH7yit7qz80Kl
        Pnommm17u+f0F/jb1rWCGa71xnXR4dh0iAgApEH8aqJ0yH/nojb+rWjW0ZVXdsQ4zrCeFrvj2L5
        JJE7M5o9ZfRCfzBpwhoXg
X-Received: by 2002:a17:906:3e0c:: with SMTP id k12mr3882242eji.189.1601669554846;
        Fri, 02 Oct 2020 13:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHHrdZA9ZSknm8pTdOskKdqjK/uUdm/ZxG+Hv7p9tCh4rSIA0aMAQyikPaaCqtfvF1547tgQ==
X-Received: by 2002:a17:906:3e0c:: with SMTP id k12mr3882232eji.189.1601669554696;
        Fri, 02 Oct 2020 13:12:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t25sm1948777edt.24.2020.10.02.13.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 13:12:33 -0700 (PDT)
Subject: Re: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
From:   Hans de Goede <hdegoede@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
 <20200906022229.GA729107@rowland.harvard.edu>
 <28948e6c-b67b-5b5c-daeb-070a1dadf9c8@redhat.com>
 <20200910154109.GC849569@rowland.harvard.edu>
 <495851d0-0ae0-e01b-bbd0-7c41c7e3f620@redhat.com>
 <20200917200949.GC1099735@rowland.harvard.edu>
 <db64c49e-6e1a-c12d-7340-e88edb06c30e@redhat.com>
Message-ID: <c021bb2b-47d9-c3b2-807b-342bdb71064c@redhat.com>
Date:   Fri, 2 Oct 2020 22:12:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <db64c49e-6e1a-c12d-7340-e88edb06c30e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/2/20 10:10 PM, Hans de Goede wrote:

<snip>

>>> Still a bit slower then the old probe method, but much better then the
>>> new probe method with the default initial_descriptor_timeout.
>>
>> Yeah, okay, it's good to see that the patch helps.  But I'm doubtful
>> that the change it makes will become part of the standard (i.e., not
>> for embedded systems) kernel.
>>
>> I still think the udev approach will be best.  That will require adding
>> various *_uevent_* calls in usb_hub_create_port_device, and adding a
>> .uevent member to usb_port_device_type.
> 
> So I tried this and it does not work, the problem is that
> dev_uevent_filter() from drivers/base/core.c
> filters out uevents for anything which is not either a device
> on a bus or a class device:
> 
> static int dev_uevent_filter(struct kset *kset, struct kobject *kobj)
> {
>          struct kobj_type *ktype = get_ktype(kobj);
> 
>          if (ktype == &device_ktype) {
>                  struct device *dev = kobj_to_dev(kobj);
>                  if (dev->bus)
>                          return 1;
>                  if (dev->class)
>                          return 1;
>          }
>          return 0;
> }

p.s.

I guess that this means that it is best to just learn to live
with the somewhat long enumeration time with the new scheme in
this somewhat specific case, that is fine with me.

Regards,

Hans

