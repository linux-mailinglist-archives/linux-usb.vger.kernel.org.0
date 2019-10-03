Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBC4CB08E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 22:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730376AbfJCU4e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 16:56:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39428 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729440AbfJCU4d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 16:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570136192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VC/LlBcR/5mNVDb/D015rZ9V1BXd6w3MDPPfMofQMc0=;
        b=LEOD/T4wI7dybJE125JajOD0h/gBZDAJe0RPs5vn4jNPu6yCxm6DMIxEsptg8O1Rw8sSD4
        w7eed8SNADTwVb2Z4/OwoUQuLfhXh7HE94CpMDnPg3u3VFctM01Djo79MjmdRJRd52w/xQ
        FhvIjDxBVkhvy6YMKMlFU68wwITFAPk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242--MWfBPm2P3ig30VunEuIsw-1; Thu, 03 Oct 2019 16:56:28 -0400
Received: by mail-wm1-f72.google.com with SMTP id k9so1640481wmb.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 13:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A5kOIo5QkieVFmBFAtLwxKf3nxk646ajjZrARZPXdLI=;
        b=UY5UVVjXnbfZBvWiXy9sg/y37Bt+lxDf0hC9rKkclHALuZInNbYszCP0a6YkEwEeF5
         JBbYktp78Pa3Z+y05JF/+GIH8kv9Ooib7DbM3GumTIWU4Zi/tzXB6w9e9LyMEMTobIZ+
         z4Vm2DHAV/yOZVowChdkX3Qp/pw4PcG9lWeEXmjax3QP3kEbhyj41Jn95pOGoVCiqxdf
         R54/ymu5kqqOmh9zZmXOVsorFxkO76tKc7oaZgtXrfq8V2fx4HfZ1tM/7pq2yzK6GCH9
         r5cYtxF7t4MJDATg+UtUYzN3sGQWnKL2V+tAKQmadhkXUdSzCeY/DhwFXB+JFXpgJEG7
         EFjg==
X-Gm-Message-State: APjAAAXp/fKvBHnbsiUFzOKqS3tDUGpUgiGG5KmoOmCKM2wqQvljqcT4
        OtlwxDNvT3o6dU8Enla3sdwtokLLh7sgTOBLckXHOIo8yBloYx/x8b/DU8qY40INYh7Of6WaYMX
        bqiwMPqgBzKUQuyKBKYnm
X-Received: by 2002:a1c:1aca:: with SMTP id a193mr8470571wma.120.1570136186725;
        Thu, 03 Oct 2019 13:56:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTDfMkHtgwnWS6hHN107FbUrB3SZTNQ+JCS+Zycf70DOxLyHXyYisZjPmgWq6URjChzPNdOQ==
X-Received: by 2002:a1c:1aca:: with SMTP id a193mr8470560wma.120.1570136186423;
        Thu, 03 Oct 2019 13:56:26 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id l9sm4075992wme.45.2019.10.03.13.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 13:56:25 -0700 (PDT)
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
To:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
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
 <20191003112618.GA2420393@kroah.com>
 <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9cfccb6a-fba1-61a3-3eb6-3009c2f5e747@redhat.com>
Date:   Thu, 3 Oct 2019 22:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: -MWfBPm2P3ig30VunEuIsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 03-10-2019 22:45, John Stultz wrote:
> On Thu, Oct 3, 2019 at 4:26 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Wed, Oct 02, 2019 at 11:16:16PM +0000, John Stultz wrote:
>>> From: Yu Chen <chenyu56@huawei.com>
>>>
>>> This patch adds notifier for drivers want to be informed of the usb rol=
e
>>> switch.
>>
>> Ick, I hate notifiers, they always come back to cause problems.
>>
>> What's just wrong with a "real" call to who ever needs to know this?
>> And who does need to know this anyway?  Like Hans said, if we don't have
>> a user for it, we should not add it.
>=20
> So in this case, its used for interactions between the dwc3 driver and
> the hikey960 integrated USB hub, which is controlled via gpio (which I
> didn't submit here as I was trying to keep things short and
> reviewable, but likely misjudged).
>=20
> The HiKey960 has only one USB controller, but in order to support both
> USB-C gadget/OTG and USB-A (host only) ports. When the USB-C
> connection is attached, it powers down and disconnects the hub. When
> the USB-C connection is detached, it powers the hub on and connects
> the controller to the hub.

When you say one controller, do you mean 1 host and 1 gadget controller,
or is this one of these lovely devices where a gadget controller gets
abused as / confused with a proper host controller?

And since you are doing a usb-role-switch driver, I guess that the
role-switch is integrated inside the SoC, so you only get one pair
of USB datalines to the outside ?

This does seem rather special, it might help if you can provide a diagram
with both the relevant bits inside the SoC as well as what lives outside
the Soc. even if it is in ASCII art...

Regards,

Hans

