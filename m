Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E887DCFE9
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 22:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443416AbfJRUVj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 16:21:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36054 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728665AbfJRUVg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 16:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571430094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XSbdbj+wXGSv6Xtgci7agv/N2COPVch8KltnfFcM01A=;
        b=DdRm8FkxjGvCSCCFns3h3IE0f05kCJbM10g/Nncl9+ZZWq/UzToVCY/9/6dEv9lEVop/VY
        b6IVmcKLKGdpl2oKLFknltIk3Hzjtw3Q5CdhGQ3JgeNEdVn0BNqsHu6kmyWAYc6D9ASG3j
        hIfjAO5HIrOt5W0onFaf2Wisp/iSw8U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-oEB-QC5tN-mjfHddiIUVWA-1; Fri, 18 Oct 2019 16:21:31 -0400
Received: by mail-wr1-f70.google.com with SMTP id e14so3191149wrm.21
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 13:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6u6vJO+zIbtOKQSr5a8/ZaiKiRenOVbT3zCNikSDSSg=;
        b=XsxUWUSltycOaaN+xxDTntOsQrBRzE9isIwg26VthAg7WRyoxQxmVZDthCh5pQmxP6
         SdFmjwNO3jwAnHcfFMQhp8LFI3tgHD2+Feljr0CUo0307di2hooJ0TP2rMLAup/jlhP4
         N8d2NZm0/b4rEZuorb5aytpdrXOl08PqtpMMTOmpUqqXbqcIGAnUHAdXrAOZTuGMgrtZ
         UTbOSe1p3XNbH2+OlIKXkQQ0J5Y7pbhB/XRE2leo8icJqMNYC8qUhRYu6olUCg/1Dpsj
         BYXlg1gRTJjm5rlRZwEj61qSxo5F4VkUFW5HiHG0bfWn7q8k50vJ3h4XfzxFdMfFRgv4
         eEkg==
X-Gm-Message-State: APjAAAUbPUekSKiTSXllcqB1JLr8iE6746wCF89PJFbXsHDM3D8wHKNL
        99rwczvLwTMhWLAtRQB/BY99FYSkJPcyfO5VtD9rP0hrrRnC/sxJggfYNT/d4TnVSGMdBdGYOSW
        ARPyW4IhWXra0wwjPx0eo
X-Received: by 2002:a05:600c:490:: with SMTP id d16mr9074959wme.131.1571430090124;
        Fri, 18 Oct 2019 13:21:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCCcieYMEnaT1Hycj8RUPMk9oRpKyXHixT+kFXUt3/2glO8P/PUCAbl0452Azbls+mfm+5Sw==
X-Received: by 2002:a05:600c:490:: with SMTP id d16mr9074940wme.131.1571430089848;
        Fri, 18 Oct 2019 13:21:29 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id t13sm7910568wra.70.2019.10.18.13.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 13:21:29 -0700 (PDT)
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20191002231617.3670-1-john.stultz@linaro.org>
 <20191002231617.3670-3-john.stultz@linaro.org>
 <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
 <CALAqxLVcQ7yZuJCUEqGmvqcz5u0Gd=xJzqLbmiXKR+LJrOhvMQ@mail.gmail.com>
 <b8695418-9d3a-96a6-9587-c9a790f49740@redhat.com>
 <CALAqxLVh6GbiKmuK60e6f+_dWh-TS2ZLrwx0WsSo5bKp-F3iLA@mail.gmail.com>
 <648e2943-42f5-e07d-5bb4-f6fd8b38b726@redhat.com>
 <CALAqxLWh0=GRod5ORpi+ENpWCkmY39mUw_=NV67sKY8qH_otZw@mail.gmail.com>
 <f2236442-111d-cd84-fc47-0737df71cf3a@redhat.com>
 <CALAqxLWHbhst5KXAGCswKVp7ztzFHxdb6nskfze+Jk+xWo2Ssw@mail.gmail.com>
 <7877d69b-b17c-d4a4-9806-3dca98fc9e26@redhat.com>
 <CALAqxLWE-8YkYmrKoP6-+2xherwsGZ8-CeUyOFe9YPQj6EuSpg@mail.gmail.com>
 <7ea7824f-abc2-4cf6-720a-3668b6286781@redhat.com>
 <CALAqxLVrEYT5RbL_R0tx_3jHzt7ZuWHDPuEwt1r2iXgPwR+Czw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f5c9f5a3-97b8-389b-47ee-cfa5ddb9afa7@redhat.com>
Date:   Fri, 18 Oct 2019 22:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CALAqxLVrEYT5RbL_R0tx_3jHzt7ZuWHDPuEwt1r2iXgPwR+Czw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: oEB-QC5tN-mjfHddiIUVWA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 18-10-2019 22:12, John Stultz wrote:
> On Fri, Oct 18, 2019 at 12:59 PM Hans de Goede <hdegoede@redhat.com> wrot=
e:
>> On 18-10-2019 21:53, John Stultz wrote:
>>> On Fri, Oct 18, 2019 at 12:30 PM Hans de Goede <hdegoede@redhat.com> wr=
ote:
>>>> Looking at drivers/usb/typec/tcpm/tcpci.c: tcpci_set_vconn I see that
>>>> there is a data struct with vendor specific callbacks and that the
>>>> drivers/usb/typec/tcpm/tcpci_rt1711h.c implements that.
>>>>
>>>> So you may want something similar here. But things are tricky here,
>>>> because when nothing is connected you want to provide Vbus for
>>>> the USB-A ports, which means that if someone then connects a
>>>> USB-A to C cable to connect the board to a PC (switching the port
>>>> to device mode) there will be a time when both sides are supplying
>>>> 5V if I remember the schedule correctly.
>>>
>>> Ok. Thanks for the pointer, I'll take a look at that to see if I can
>>> get it to work.
>>>
>>>> I think that the original hack might not be that bad, the whole hw
>>>> design seems so, erm, broken, that you probably cannot do proper
>>>> roleswapping anyways.  So just tying Vbus to host mode might be
>>>> fine, the question then becomes again how can some other piece
>>>> of code listen to the role-switch events...
>>>
>>> So, at least in the current approach (see the v3 series), I've
>>> basically set the hub driver as an role-switch intermediary, sitting
>>> between the calls from the tcpm to the dwc3 driver. It actually works
>>> better then the earlier notifier method (which had some issues with
>>> reliably establishing the initial state on boot).  Does that approach
>>> work for you?
>>
>> That sounds like it might be a nice solution. But I have not seen the
>> code, I think I was not Cc-ed on v3. Do you have a patchwork or
>> lore.kernel.org link for me?
>=20
> Oh! I think I had you on CC, maybe it got caught in your spam folder?

More likely I just deleted mail to aggressively, sorry.

> My apologies either way! The thread is here:
>    https://lore.kernel.org/lkml/20191016033340.1288-1-john.stultz@linaro.=
org/
>=20
> And the hub/role-switch-intermediary driver is here:
>    https://lore.kernel.org/lkml/20191016033340.1288-12-john.stultz@linaro=
.org/

Hm, this looks very nice actually, much much better then the notifier stuff=
!

As for your:

"NOTE: It was noted that controlling the TYPEC_VBUS_POWER_OFF and
TYPEC_VBUS_POWER_ON values here is not reccomended. I'm looking
for a way to remove that bit from the logic here, but wanted to
still get feedback on this approach."

Comment in the commit message, normally a type-c port would turn external V=
bus
off until a sink is connected, IIRC the same Vbus is also used for the Tupe=
A ports
on the hub, so that would mean those are unusable when nothing is connected=
 to
the TypeC port, which is not what you want.

So I think that given the special case / hack-ish hw you have, that just se=
tting
Vbus based on the role is ok(ish).

Regards,

Hans




