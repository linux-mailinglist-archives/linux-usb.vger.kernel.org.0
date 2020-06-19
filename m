Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCA1200755
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 12:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732523AbgFSKyG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 06:54:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27582 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732392AbgFSKyE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Jun 2020 06:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592564041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gdQ8Sg66vaxNDmevYTckcfDoJ9SswGIMhylYcGrksuc=;
        b=J9w0UgrAkx6Tvzxf0j6HnrEZVLe0lZLE7ARLIcnojYT2Ovc6JrsPHSm07aR0G5DsRFDrIe
        cNuAUdMKmBzXEJliT+peLbW9z9Af8Y0Kmbtb5rg25acJZpBUjaeyzlN2Ma1WS44OeRP+Mt
        VudbH8DVpPEnQra2sBINEZJbme2bSE0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-56SVIda2Om-3j-nIhlBztg-1; Fri, 19 Jun 2020 06:54:00 -0400
X-MC-Unique: 56SVIda2Om-3j-nIhlBztg-1
Received: by mail-ed1-f71.google.com with SMTP id w23so3495569edt.18
        for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2020 03:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdQ8Sg66vaxNDmevYTckcfDoJ9SswGIMhylYcGrksuc=;
        b=Ibg9ON4wfFZ21Q1/283tBJiNAlTa9WUzd/lImOb3iXbxeA6GuyRQHAdiFJX9BXKS4V
         kKsmMkCITYmJ51jFDBD6NSsqoHNvLbq3wOkVVUJ1X6VQN0caakPuSG+V0ygGb5IWqNLx
         32VmoekazNFCI7vUMexdvbJIIGnjaDcloGZZq+M2csarzY+IgRGRghcThr1AIrHkCCjQ
         Bj/wr1kgbOwFFhDkNSZaP1kQcCeuLfe0KL4GHFqf1PQR1hK+alYX2hYWKR5BIcMaWHgj
         f28jOwEblYYguYYMBTSn/AIFTzRvuZTgbClXI0AH7/IQ+vZ4HJwhu4JlL80aH5wVoew+
         AX9w==
X-Gm-Message-State: AOAM531fcWS65qwY3Xg5D7pI7H10q0cHHBIEgtgJ37QyONUkmhw0BEwm
        k/w6X8UBuOdvwy/VSPKDYymv88VMFJt8M6jxxC7pBf/THDy9KgQzesqN0ua47RQL7Sau/Wf048W
        J4/AZQwGjx/nmQf6pEjLK
X-Received: by 2002:a17:906:509:: with SMTP id j9mr2930023eja.341.1592564038940;
        Fri, 19 Jun 2020 03:53:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvYAp7naqhZIhEIjyBLPebsfBBXZOA4zXA8IgV3Ya3qCOmwBM8aXvA7YgD5Lwl876KuyvRWA==
X-Received: by 2002:a17:906:509:: with SMTP id j9mr2930007eja.341.1592564038692;
        Fri, 19 Jun 2020 03:53:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id o20sm4438607ejx.102.2020.06.19.03.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 03:53:58 -0700 (PDT)
Subject: Re: [PATCH 1/8] USB: rename USB quirk to USB_QUIRK_ENDPOINT_IGNORE
To:     Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Richard Dodd <richard.o.dodd@gmail.com>,
        Jonathan Cox <jonathan@jdcox.net>,
        =?UTF-8?Q?Thi=c3=a9baud_Weksteen?= <tweek@google.com>,
        Nishad Kamdar <nishadkamdar@gmail.com>
References: <20200618094300.1887727-1-gregkh@linuxfoundation.org>
 <20200618094300.1887727-2-gregkh@linuxfoundation.org>
 <484c84b62140f6536f841e7027ddd9ddcf179a72.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <62b8ddc4-8d26-1160-6934-fe6a68231938@redhat.com>
Date:   Fri, 19 Jun 2020 12:53:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <484c84b62140f6536f841e7027ddd9ddcf179a72.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bastien,

On 6/19/20 12:50 PM, Bastien Nocera wrote:
> On Thu, 2020-06-18 at 11:42 +0200, Greg Kroah-Hartman wrote:
>> The USB core has a quirk flag to ignore specific endpoints, so rename
>> it
>> to be more obvious what this quirk does.
>>
>> Cc: Johan Hovold <johan@kernel.org>
>> Cc: Alan Stern <stern@rowland.harvard.edu>
>> Cc: Richard Dodd <richard.o.dodd@gmail.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Jonathan Cox <jonathan@jdcox.net>
>> Cc: Bastien Nocera <hadess@hadess.net>
>> Cc: "Thiébaud Weksteen" <tweek@google.com>
>> Cc: Nishad Kamdar <nishadkamdar@gmail.com>
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> If the driver API change below is agreeable, you can add my:
> Reviewed-by: Bastien Nocera <hadess@hadess.net>

A note for future reference, not sure what you mean with driver
API here. If you mean the in kernel API, the kernel rules are
that we are always free to change that (Linux does not have a
stable driver API).

So if a header does not sit under include/uapi (indicating that
it is an userspace API) then a change like this is fine.

Regards,

Hans



> Good job.
> 
> <snip>
>> diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
>> index 22c1f579afe3..5e4c497f54d6 100644
>> --- a/include/linux/usb/quirks.h
>> +++ b/include/linux/usb/quirks.h
>> @@ -69,7 +69,7 @@
>>   /* Hub needs extra delay after resetting its port. */
>>   #define USB_QUIRK_HUB_SLOW_RESET		BIT(14)
>>   
>> -/* device has blacklisted endpoints */
>> -#define USB_QUIRK_ENDPOINT_BLACKLIST		BIT(15)
>> +/* device has endpoints that should be ignored */
>> +#define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
>>   
>>   #endif /* __LINUX_USB_QUIRKS_H */
> 
> 
> 

