Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA4240AB97
	for <lists+linux-usb@lfdr.de>; Tue, 14 Sep 2021 12:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhINKXG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Sep 2021 06:23:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59404 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230274AbhINKXF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Sep 2021 06:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631614908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a3/K72EH2i3eQqAABWvZtL9IFzpTOqC5lFDkzDQH+vM=;
        b=isDHvqtJ/ogGZH/GaPk368XdLOpf8jff7mHS/hQ8taA+lNQzHzUNHXUFcUFfJ+mfv9oVn4
        aKsaTWtri/Wv0MuloDwSQWc5xnyhlqtvj1BZS/64DhAmW3PLYqZEP4YcyXaDq7VzhzVOmd
        kimD9XxhgT991S2UmsEDu947pAHfI+M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-Va8zv1y_M9G4DtjB4Dx4qw-1; Tue, 14 Sep 2021 06:21:47 -0400
X-MC-Unique: Va8zv1y_M9G4DtjB4Dx4qw-1
Received: by mail-ed1-f71.google.com with SMTP id s12-20020a05640217cc00b003cde58450f1so6558590edy.9
        for <linux-usb@vger.kernel.org>; Tue, 14 Sep 2021 03:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a3/K72EH2i3eQqAABWvZtL9IFzpTOqC5lFDkzDQH+vM=;
        b=4gHwrCCr+Qbk45tMlcdBldHbghTC2LfRQadIkLafwa5CL2kltom/Kn4fky9SV2ssCB
         eO8Hyv/1oLGIQjyUiGBMKSslXaTEcHGzesECuYVPvWYuNCWWXQTRu4ESHuhKB+Bm59JD
         TnM2MqfG348xabav4GvmgCh4XasVxIFemHBAVYWGgCBSf50+ymXHHzQ9+6ERZqJ7fgiu
         kRJ7QG4ROwVMxY8aJ2CCGTUMDcfpmbbkNYAlDhZT/SrYU++uKlitawdkk/nfhRtkDpO6
         lZvyE6mlMZZYjJ69Tk3QSf8+6smuEddEhlex2foWGckGRer96wV9XYbzoJ3wnG1xzATt
         YBaw==
X-Gm-Message-State: AOAM533NwYQBJmUfyOS74TRQ/W8iRnL2QP+xG0X9LYqa9y3JEtXcUqR7
        s1LtpYi+DbcSR9iHkuaJznUyq+VYaAG1Iuow8BeNW21m9X3VC67wg/VD09GaBP/j7MmBeqyJDkO
        jul7ZCenxP9QWGe/MIeg/
X-Received: by 2002:a17:906:2691:: with SMTP id t17mr17633576ejc.522.1631614905765;
        Tue, 14 Sep 2021 03:21:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4r5O5J3l8hz0cNB/I51hOrk6uBaz1mecyH4C/0vGSwQXMQXdTtwrg8kcQrK3Co6VTO/j7fQ==
X-Received: by 2002:a17:906:2691:: with SMTP id t17mr17633564ejc.522.1631614905619;
        Tue, 14 Sep 2021 03:21:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y13sm3273065ejl.125.2021.09.14.03.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 03:21:45 -0700 (PDT)
Subject: Re: [PATCH] Re-enable UAS for LaCie Rugged USB3-FW with fk quirk
To:     Julian Sikorski <belegdol@gmail.com>, linux-usb@vger.kernel.org
Cc:     oneukum@suse.com, Julian Sikorski <belegdol+github@gmail.com>
References: <20210913181454.7365-1-belegdol+github@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0ee3da94-bbae-35d3-2d32-4ceef039a16d@redhat.com>
Date:   Tue, 14 Sep 2021 12:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913181454.7365-1-belegdol+github@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/13/21 8:14 PM, Julian Sikorski wrote:
> Further testing has revealed that LaCie Rugged USB3-FW does work with
> uas as long as US_FL_NO_REPORT_OPCODES and US_FL_NO_SAME are enabled.
> 
> Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Link: https://lore.kernel.org/linux-usb/2167ea48-e273-a336-a4e0-10a4e883e75e@redhat.com/

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/usb/storage/unusual_uas.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index c35a6db993f1..4051c8cd0cd8 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -50,7 +50,7 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
>  		"LaCie",
>  		"Rugged USB3-FW",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> -		US_FL_IGNORE_UAS),
> +		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
>  
>  /*
>   * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
> 

