Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B199125BF1A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 12:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgICKdE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 06:33:04 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50484 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726543AbgICKc7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 06:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599129177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2EBz+XNEZDprNAc71MY7Cc8HkN8faZ2EKOlhwmah+a0=;
        b=JaJS1dsSeNg3BdZb2vO9xPVzGO3xQj8hdZ8sPiMdLxi3z7FrkGGckbrP0/k081KhDZiOrC
        dW/Oro0pv7MGTK1omJUNe0i5tAUB8cBqUjUrmDUj9Tw6OuqYQML3r6l+ofhZmzbbyodIWO
        akibsWLgBozUYT4GdDgDbxVoZtnLJwA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-uQgcQqUdN8KM2Gk32XREOQ-1; Thu, 03 Sep 2020 06:32:54 -0400
X-MC-Unique: uQgcQqUdN8KM2Gk32XREOQ-1
Received: by mail-ed1-f69.google.com with SMTP id c25so1097271edx.11
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 03:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2EBz+XNEZDprNAc71MY7Cc8HkN8faZ2EKOlhwmah+a0=;
        b=T1ZL3/SRppZvjMdzWNMViSJ1T1a4lc/A4rGTt/agw82TeVmXaAB32ePHceuGyHV23a
         wxuvybIrL0mXf/SiscK8zLsl3UnRPVLyk8rRMRj5FI5Lv8ye34Ez1LcAEwYJC1rCPSi/
         u36tIka4NspNM/S9+7p4pCGa5Dk9ChAelRsBvj6d+kYfMwqts2mUkV3NUKi41LMxM7a0
         NqgxnWe3vfqtsKWb2UMn/t7SGPdO7kB3jZ5V+e4XeeEawy7PB/fOGuhYuCY6lo4cabBN
         OIzJQe9RTaDsKRHELc+1pn2ezUEnROUYiuOuKTru4/tyq2gttIl42NFkFdB/1wOv9XJN
         t+Kw==
X-Gm-Message-State: AOAM5300chwLs0TcLYFB4dJ7M3b511MMmf6hbjl1IbfkS3YskZyvfQ0y
        BrUj9fUibc0EEMSOFgLHqG7CM8QinFt/qF9M72EL7bCp3+vBt+l0Dunx7iFruLkXRT+K7er/i2f
        /k4zuXbPNSShlta58/4KN
X-Received: by 2002:a17:906:4d4d:: with SMTP id b13mr1343026ejv.221.1599129172879;
        Thu, 03 Sep 2020 03:32:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKOOQit71KDUj1vlagmzzxdVBIYpRE6M2EIk+DSgSKDROQ5nL1jX9o7MvYH4+PhPmTGlii7Q==
X-Received: by 2002:a17:906:4d4d:: with SMTP id b13mr1343004ejv.221.1599129172669;
        Thu, 03 Sep 2020 03:32:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id re10sm2899834ejb.68.2020.09.03.03.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 03:32:52 -0700 (PDT)
Subject: Re: [PATCH] HID: quirks: Add USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for
 BYD zhaoxin notebook
To:     Penghao <penghao@uniontech.com>, gregkh@linuxfoundation.org
Cc:     johan@kernel.org, dlaz@chromium.org, stern@rowland.harvard.edu,
        kerneldev@karsmulder.nl, jonathan@jdcox.net, tomasz@meresinski.eu,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200903100326.5327-1-penghao@uniontech.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e9b10ea4-1f7d-4edc-daa6-32af833fea67@redhat.com>
Date:   Thu, 3 Sep 2020 12:32:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903100326.5327-1-penghao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/3/20 12:03 PM, Penghao wrote:
> Add a USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk for the BYD zhaoxin notebook.
> This notebook come with usb touchpad. And we would like to disable touchpad
> wakeup on this notebook by default.

2 questions:

1. Why do you want to enable remote wakeup by default ?
2. Is this a HID multi-touch touchpad?

Regards,

Hans


> 
> Signed-off-by: Penghao <penghao@uniontech.com>
> ---
>   drivers/usb/core/quirks.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 7c1198f80c23..5fa3f2416967 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -387,6 +387,10 @@ static const struct usb_device_id usb_quirk_list[] = {
>   	{ USB_DEVICE(0x0b05, 0x17e0), .driver_info =
>   			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
>   
> +	/* SONiX USB DEVICE Touchpad */
> +	{ USB_DEVICE(0x0c45, 0x7056), .driver_info =
> +			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
> +
>   	/* Realtek hub in Dell WD19 (Type-C) */
>   	{ USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
>   
> 

