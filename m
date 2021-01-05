Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A252EA8B8
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 11:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbhAEKaY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 05:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56585 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729128AbhAEKaY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 05:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609842537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H30d+AlR8ieFQgPqpprypshZD37jO8PgTCkCJgLRnb0=;
        b=Z+M1LLzQNuarqRIC7fJ/R/CZJ8r+f1BiGHdtNnS9OsGEXFwbjQ6X6IjxsGqeQSJL1hGDbv
        E3fCk2FhRB2sbH2iQjy8BBrvaw5t9RbcJaQPkk3PJVAK/NVoizSBbm7r/8EOW3jeq7pU2W
        YcQx3fB/uXepP0RxnuL3+rMI1AeJiCs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-GWFzKbrtMBK2CkA9Jik1DA-1; Tue, 05 Jan 2021 05:28:56 -0500
X-MC-Unique: GWFzKbrtMBK2CkA9Jik1DA-1
Received: by mail-ed1-f71.google.com with SMTP id i15so13882555edx.9
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 02:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H30d+AlR8ieFQgPqpprypshZD37jO8PgTCkCJgLRnb0=;
        b=BiGtwVohjYR3/Zw2qt4CsrpWhsTGKHkS5nHa8S7FggiWkVP6iKWuhuT6T4GcKQgRxG
         a4TIlb578P4qH820ExLqkEDZ9AiJOZfL+SQ2IsczyKZsyk9XIdOynmn4KV8+IBkJrmjR
         QwcQVbDcI9wiXU/rQxxfV7OGJK2GRhogi0Qxg9cFRq5hy38Z4zkapUrNkGAtsgndOZc8
         GuW0d5RMWscuOVRbX7t4+vx4MpKK68AN4+ctxHEH5K4Sehz4tc0Pz8viRCzTNSXPPJyf
         9rC3/Rg9nUuRqNoegi/+Ossj7yVcSBT7hN6QYNhrcPjk6W4ZdS3keDKUQRlZmmSbH8cN
         ifjw==
X-Gm-Message-State: AOAM531eJFYPMoLwgqwu5F9hKAkyKWdTggh1UefjCdynAxIiHeYSTCdQ
        0djwz53NJ8IFMAlvXw5vaAhKsmTQ3L2tIAmctQgJSwc+nz1j8jwwNABfywCkguA4qbhJIxRWOSY
        N9/6hOe4Xic9B6WQOlrEaBm3TTR9/v790pKySUiRq5uhCTQy50wpuFEbM7T4EHR0X/92UosHm
X-Received: by 2002:a05:6402:404:: with SMTP id q4mr76806670edv.295.1609842535102;
        Tue, 05 Jan 2021 02:28:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCJTTQIgJsc5JrHCkbND3KztYMvX8DlFCDLt4b/1HEBPbRvYfaH6P9hUf9sKM5fx9Zi/grmA==
X-Received: by 2002:a05:6402:404:: with SMTP id q4mr76806650edv.295.1609842534887;
        Tue, 05 Jan 2021 02:28:54 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id oq7sm24754910ejb.63.2021.01.05.02.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jan 2021 02:28:54 -0800 (PST)
Subject: Re: [PATCH] usb: uas: Add PNY USB Portable SSD to unusual_uas
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        usb-storage@lists.one-eyed-alien.net
Cc:     stable@vger.kernel.org, linux-usb@vger.kernel.org
References: <2edc7af892d0913bf06f5b35e49ec463f03d5ed8.1609819418.git.Thinh.Nguyen@synopsys.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e0a6cb75-1000-5889-6dfa-dc236d4ed4fa@redhat.com>
Date:   Tue, 5 Jan 2021 11:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2edc7af892d0913bf06f5b35e49ec463f03d5ed8.1609819418.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 1/5/21 5:07 AM, Thinh Nguyen wrote:
> Here's another variant PNY Pro Elite USB 3.1 Gen 2 portable SSD that
> hangs and doesn't respond to ATA_1x pass-through commands. If it doesn't
> support these commands, it should respond properly to the host. Add it
> to the unusual uas list to be able to move forward with other
> operations.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 870e9cf3d5dc..f9677a5ec31b 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -90,6 +90,13 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BROKEN_FUA),
>  
> +/* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
> +UNUSUAL_DEV(0x154b, 0xf00b, 0x0000, 0x9999,
> +		"PNY",
> +		"Pro Elite SSD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_ATA_1X),
> +
>  /* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
>  UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
>  		"PNY",
> 
> base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
> 

