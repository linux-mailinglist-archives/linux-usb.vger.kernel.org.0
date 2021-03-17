Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B92B33F024
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 13:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhCQMWM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 08:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54736 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229460AbhCQMV6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 08:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615983717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vjJrQMCZhf6lIYOOx7mQT2HaccqBnUsbGqx4m7WSX14=;
        b=afZmNyve1BO68VK0bEFz/o3alGJ6ti/5HHQEgYs6AevQSO3kM4D5ERUBJ/kjb50Tm6j4RO
        NtNRAUBjoZ0kwwaV5ZRh3ydr6LoTOlYEmBS0HQ3SrKbvb9FnnaHnWVu7q3p0jtBsIWu4qI
        ziMm/d44e6Ank4fiOGJIkTOBduGdgIA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-SSdgxQCwPoes27-X_Y_E5A-1; Wed, 17 Mar 2021 08:21:54 -0400
X-MC-Unique: SSdgxQCwPoes27-X_Y_E5A-1
Received: by mail-ej1-f69.google.com with SMTP id e13so15032312ejd.21
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 05:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vjJrQMCZhf6lIYOOx7mQT2HaccqBnUsbGqx4m7WSX14=;
        b=JtVshMbl1etJ0lx+kdO3zDEnG7labjpcAVAWIYnCAsMoNhxSzj4rAzPWHDC4PnNfyA
         o4qY2T3WfXk9pBT6Emz6u/wlxT70ayUblc5PXrX7ddq82Cbq9QaZGphTb5AgS8kL23Dz
         w5yqxeUKyzDj4M0G5gEWPsRsuWofklN0OlI4B3BvnJ15UTesDY3aY1EVCxMrzyn/6orP
         A0jA22HERn2mC3uUVX4Dl4DBFnNffrsylXA1+2jnzZhsk8ZQP8otYFkKhELyLvpcFoi3
         jlz1yME0wwbpg3HkSvdU16ATacnnjC1l0tLUJbCKEBNPIb+sjvv/VynqRulyVlG4r2nQ
         +emQ==
X-Gm-Message-State: AOAM5308JVbYihdSb36hv8H8qnfKx/CUonLjXHpj8YwlekVhn7/7uZ9P
        lHCtOrAAXEq6wYdvhrR2+9Xuq2FjS+YjuA5rZ+BYaDXyVP+7BsXTYjnmOA97BIfaF6VF33jeeqq
        DmygVXlBaPIs5HDy3ly0Y
X-Received: by 2002:a17:906:78d:: with SMTP id l13mr34141184ejc.97.1615983711855;
        Wed, 17 Mar 2021 05:21:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0qIcfkYFQUM1PEnKd1RsxDtLazaJBPseFZMExc+5JCAkfpUW7AOUjHAP5GaUHlYEJc5Y7Sg==
X-Received: by 2002:a17:906:78d:: with SMTP id l13mr34141171ejc.97.1615983711729;
        Wed, 17 Mar 2021 05:21:51 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g20sm12244786edb.7.2021.03.17.05.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 05:21:51 -0700 (PDT)
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Matthias Schwarzott <zzam@gentoo.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
References: <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
Date:   Wed, 17 Mar 2021 13:21:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316170433.GD448722@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 3/16/21 6:04 PM, Alan Stern wrote:
> On Tue, Mar 16, 2021 at 05:43:34PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/16/21 5:26 PM, Alan Stern wrote:
>>> On Tue, Mar 16, 2021 at 06:26:30AM +0100, Matthias Schwarzott wrote:
>>>> I implemented solution 3b. This is the pullrequest for udev (systemd
>>>> repository):
>>>>
>>>> 	https://github.com/systemd/systemd/pull/19002
>>>>
>>>> Now Lennart asks if udev is the best place for such hacks/work-arounds?
>>>>
>>>> Well, I implemented it as suggested by Alan (see above). This was the
>>>> simplest of the considered alternatives. Different quirks in kernel has been
>>>> considered, but are more effort to be implemented.
>>>
>>> Lennart probably isn't aware how the usb-storage driver works.  It does 
>>> not create commands on its own; it merely sends the commands that it 
>>> gets from higher SCSI layers.
>>>
>>> It may be possible to modify the SCSI core, to make it send a TEST UNIT 
>>> READY command immediately following any SYNCHRONIZE CACHE to a Kindle.
>>>
>>> However, there may be an easier solution.  usb-storage does indeed send 
>>> a command of its own, REQUEST SENSE, to get error data when a command 
>>> fails.  The patch below will make it do the same thing whenever it sends 
>>> a SYNCHRONIZE CACHE to a Kindle, failure or not.
>>>
>>> The only question is whether the Kindle will regard REQUEST SENSE as a 
>>> sufficient indication that it shouldn't do an eject.  The only way to 
>>> find out is by testing the patch.
>>>
>>> Alan Stern
>>
>> Thank you for this patch, yes if this works it would IMHO be
>> a much better solution then the udev rule.
> 
> I think it would be mildly better, but not a whole lot.  Since the 
> Kindle describes itself as having removable media, the kernel normally 
> probes it periodically to make sure the media remains present.  The 
> default probing interval is 2 seconds.  Reducing it to 0.9 seconds 
> doesn't represent an exorbitant additional load IMO -- especially since 
> Kindles don't tend to spend huge amounts of time connected to computers.

Ah, I did not know that the default polling interval was that low(ish),
given that the default indeed is already that low, then changing it to
0.8 seconds would not be a big change.  And we probably have a lot of
lower hanging fruit for unnecessary wakeups then that.

Regards,

Hans

