Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982FDDBF63
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 10:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442161AbfJRIGZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 04:06:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40923 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2442159AbfJRIGZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 04:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571385983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AueYkt1KhewDQYWLSoW/pmDep2RIg04euyPWY35AI9w=;
        b=WMsD8L0M8WI+PA/WkCrX8nsg+X+INLOyX9JmfvwlsF4dZC1bHveFHGo2HpIPFcQQSJGSZe
        VOq8GaPqfGlIAbSTmYHCUxYn4vAFZszi6LVknKLeigu8vxiiicM0Xj/+afaSR/q3GzYa0y
        T0A0Gp+jt4xzPXL7aeJsfsu66RpQZlc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-2uEYAMOYOPeopd6b0evJvg-1; Fri, 18 Oct 2019 04:06:22 -0400
Received: by mail-wm1-f70.google.com with SMTP id l184so813429wmf.6
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 01:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VP1zhflDz8B0kkQ83/WshvBQYqQO+15WgGKLtiGwYF0=;
        b=scs2/4NJPvnM3ygh3/PTxsffuYTIPFXMiApS03pAds87cNSXmhgJ1uiX6YvOz4dPdN
         3brLvhrkb2iuzxOTCUS+7zLOFQswp9qTX3p73acmW6J3hRwFB+B396EfzloX8+9c4pw+
         khlBxdgSK8i9NlsQ81oIynyxaqSE44FDtoqv4zZGKAruojWZn3oK2q+cthuRaWpELj+S
         YUiFZi13bEfm3kkfO2RWzAXlzDi0OVJ2dh+1lP7aplYOQAwusToBHzae2D8LEQmWPAFL
         Havbf3/6AwlDDnjJu3cFqSgDrmaCcIlCC3oON5JBqWhjPAYgSk4hZI8ZzUEB9Wv6cxsV
         zAcQ==
X-Gm-Message-State: APjAAAVH1GaSzXW9jtt9gGdyontlyiKdmrGZHCZI/J1R9xIyRUvLfKTx
        eTBcTn6hdU/DJPv5YejdcJsmbZq6rcHALllf0+4maNF1M3lvAhP/Pg8eHHq/s1IU5eI4JRjC3ME
        VngrQtC5C13N8Ta7Zr2m4
X-Received: by 2002:a1c:55c4:: with SMTP id j187mr6447027wmb.155.1571385980980;
        Fri, 18 Oct 2019 01:06:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZVd1ccyO/Ym3el/1+WjQ1WmMCkhdIX12XtPQT7ZY+XQ7DuXpVt6/IuFyKiUT17eAeClDQkg==
X-Received: by 2002:a1c:55c4:: with SMTP id j187mr6446987wmb.155.1571385980715;
        Fri, 18 Oct 2019 01:06:20 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id h7sm4729423wrt.17.2019.10.18.01.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 01:06:20 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f2236442-111d-cd84-fc47-0737df71cf3a@redhat.com>
Date:   Fri, 18 Oct 2019 10:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CALAqxLWh0=GRod5ORpi+ENpWCkmY39mUw_=NV67sKY8qH_otZw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: 2uEYAMOYOPeopd6b0evJvg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 18-10-2019 07:55, John Stultz wrote:
> On Wed, Oct 16, 2019 at 12:27 AM Hans de Goede <hdegoede@redhat.com> wrot=
e:
>> On 10/15/19 7:39 AM, John Stultz wrote:
>>> On Thu, Oct 3, 2019 at 1:51 PM Hans de Goede <hdegoede@redhat.com> wrot=
e:
>>>> On 03-10-2019 22:37, John Stultz wrote:
>>>>> Fair point. I'm sort of taking a larger patchset and trying to break
>>>>> it up into more easily reviewable chunks, but I guess here I mis-cut.
>>>>>
>>>>> The user is the hikey960 gpio hub driver here:
>>>>>      https://git.linaro.org/people/john.stultz/android-dev.git/commit=
/?id=3Db06158a2d3eb00c914f12c76c93695e92d9af00f
>>>>
>>>> Hmm, that seems to tie the TypeC data-role to the power-role, which
>>>> is not going to work with role swapping.
>>>
>>> Thanks again for the feedback here. Sorry for the slow response. Been
>>> reworking some of the easier changes but am starting to look at how to
>>> address your feedback here.
>>>
>>>> What is controlling the usb-role-switch, and thus ultimately
>>>> causing the notifier you are suggesting to get called ?
>>>
>>> The tcpm_mux_set() call via tcpm_state_machine_work()
>>>
>>>> Things like TYPEC_VBUS_POWER_OFF and TYPEC_VBUS_POWER_ON
>>>> really beg to be modeled as a regulator and then the
>>>> Type-C controller (using e.g. the drivers/usb/typec/tcpm/tcpm.c
>>>> framework) can use that regulator to control things.
>>>> in case of the tcpm.c framework it can then use that
>>>> regulator to implement the set_vbus callback.
>>>
>>> So I'm looking at the bindings and I'm not sure exactly how to tie a
>>> regulator style driver into the tcpm for this?
>>> Looking at the driver I just see this commented out bit:
>>>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/drivers/usb/typec/tcpm/tcpm.c#n3075
>>>
>>> Do you happen to have a pointer to something closer to what you are des=
cribing?
>>
>> Look at the tcpm_set_vbus implementation in drivers/usb/typec/tcpm/fusb3=
02.c
>> you need to do something similar in your Type-C controller driver and
>> export the GPIO as as a gpio-controlled regulator and tie the regulator =
to
>> the connector.
>=20
> Thanks for the suggestion, I really appreciate it! One more question
> though, since I'm using the tcpci_rt1711h driver, which re-uses the
> somewhat sparse tcpci.c implementation, would you recommend trying to
> add generic regulator support to the tcpci code or trying to extend
> the implementation somehow allow the tcpci_rt1711h driver replace just
> the set_vbus function?

I have the feeling that this is more of a question for Heikki.

My first instinct is: if you are using tcpci can't you put all
the hacks you need for the usb connection shared between hub
and type-c in your firmware ?

Regards,

Hans

