Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E6B2F2E86
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 12:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731625AbhALL7A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 06:59:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27175 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731607AbhALL67 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jan 2021 06:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610452653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DC7rR7ULlVE2IO8fZp2tkCjKsJ3W2x6CKkTH1E9AjlQ=;
        b=Rsp5tE8HbumTSX6l28PPCZ8+j2KkPBlUlpQV5Rx8WH2fkwXbd/3bKgTMBIULRvx1pARveX
        qw32+lMSjgXL3r1QEK/X0bfNDTueNDYAfA484GPnxV8Q4nz5K7FE3MGNZahR7xa8U7/Aao
        WpurPXoAFYcjrYbhcps9pkmvmQRvN9E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-wpxC6-QoM7G1u_4MF3_MvQ-1; Tue, 12 Jan 2021 06:57:31 -0500
X-MC-Unique: wpxC6-QoM7G1u_4MF3_MvQ-1
Received: by mail-ed1-f69.google.com with SMTP id f19so879302edq.20
        for <linux-usb@vger.kernel.org>; Tue, 12 Jan 2021 03:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DC7rR7ULlVE2IO8fZp2tkCjKsJ3W2x6CKkTH1E9AjlQ=;
        b=OUMlXNWyd1D/DOzIGzeYYoZZtfL/vIxnEpUbN7xM55xkKXTA742zp5mP4hAovfr1vz
         ig7T4L3oIQUl/QQZqQe9eL9BnyhJ6Ky57Mo2P5sB+rFus4PY9NRsQ14Ha5Bofhq2wSpL
         qbEzOQiN9pHh3FTgWoa+c+i4iyJBfk7UcekMn7CWK3viMKVVvHpH8lmTIW8Me/FWc6DE
         RNkNVbITiem4dNliBnQDRFC7MJdgns5HMmj+nAxJSvBh34JBPyMfxJoRuXCuIlPrYDK/
         NIQ47zYu9uQIiNGA8s25Jeyhx3KsU7cWn+ilhE87MRutf8TgEHXnZ9urZRYqSGxv/EX5
         j9tg==
X-Gm-Message-State: AOAM531SzRILHk/VwVzEpr7Gln4VsJoK1IgNwB49W11htQXnRM5cTGkm
        XCuF9dzkS0qcynwTj1Ou1b2723qNIGl5CZj9hE/+xFjjM3k/tSl7v93ztKl22qmGbnkwKfHC/NB
        /1pxdaAi2NGxDo1eT5DVi
X-Received: by 2002:a50:d604:: with SMTP id x4mr3153354edi.64.1610452649906;
        Tue, 12 Jan 2021 03:57:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/vv5m6LzNOBm0g6qucAIqUBD0DMvj0NuDY0CmxfuDDkCQIB0LUg0uBMpJV4FbvioJyBF2tw==
X-Received: by 2002:a50:d604:: with SMTP id x4mr3153340edi.64.1610452649764;
        Tue, 12 Jan 2021 03:57:29 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id d18sm1357725edz.14.2021.01.12.03.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 03:57:29 -0800 (PST)
Subject: Re: [PATCH v5 0/3] AMS, Collision Avoidance, and Protocol Error
To:     Greg KH <gregkh@linuxfoundation.org>, Kyle Tso <kyletso@google.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210105163927.1376770-1-kyletso@google.com>
 <X/2N1LAgNRCSkWrw@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bfb36421-ec4a-9ea6-585c-798f626e069b@redhat.com>
Date:   Tue, 12 Jan 2021 12:57:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X/2N1LAgNRCSkWrw@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 1/12/21 12:53 PM, Greg KH wrote:
> On Wed, Jan 06, 2021 at 12:39:24AM +0800, Kyle Tso wrote:
>> This series include previous patch "[v4] AMS and Collision Avoidance"
>> https://lore.kernel.org/r/20201217030632.903718-1-kyletso@google.com
>> and two more patches "Protocol Error handling" and "Respond Wait if...".
>>
>> The patch "AMS and Collision Avoidance" in [v5] is the same as the one
>> in [v4] (only rebased to ToT).
>>
>> The patch "Protocol Error handling" is based on PD3 6.8.1 to fix the
>> wrong handling.
>>
>> The patch "Respond Wait if..." is to fix a conflict when 
>> DR/PR/VCONN_SWAP occurs just after the state machine enters Ready State.
>>
>> Kyle Tso (3):
>>   usb: typec: tcpm: AMS and Collision Avoidance
>>   usb: typec: tcpm: Protocol Error handling
>>   usb: typec: tcpm: Respond Wait if VDM state machine is running
>>
>>  drivers/usb/typec/tcpm/tcpm.c | 925 +++++++++++++++++++++++++++++-----
>>  include/linux/usb/pd.h        |   2 +
>>  include/linux/usb/tcpm.h      |   4 +
>>  3 files changed, 792 insertions(+), 139 deletions(-)
> 
> Heikki, any thoughts about this series?

Note I plan to test this series on a device with a fusb302 Type-C
controller, where it broke role-swappings in a previous version of
this series. This is supposed to be fixed now but I would like to
confirm this.

I've had this on my todo list for a while now. I've
now put this in my calendar as a task for tomorrow. So please wait
till you hear back from me (hopefully with a Tested-by) with
merging this, thanks.

Regards,

Hans

