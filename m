Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD243404CC
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 12:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhCRLjX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 07:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48520 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229908AbhCRLjQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 07:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616067555;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2YmpqDQt5KeCE/abss4w9k89C4ih1OjQ6xthHLSq/P4=;
        b=C6GAgBuOT1rgwXIyY+e7DN5SkTY49PED87Xxl5ZICNkjl6+xRjP9E4SW2ZDdhCi2ZBujF1
        kwiBwWGdo167rm1kWrjq63C8lqwGHCiULxRtEtaOlvySbSwb7tjXLGpdASsyZBoVLniowe
        C3HvPJvZDeMhuM3ASYQjQeyAhlACyKA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Co2_FAYOOg6jqCt7MkVOMQ-1; Thu, 18 Mar 2021 07:39:14 -0400
X-MC-Unique: Co2_FAYOOg6jqCt7MkVOMQ-1
Received: by mail-ej1-f69.google.com with SMTP id en21so16527152ejc.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 04:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2YmpqDQt5KeCE/abss4w9k89C4ih1OjQ6xthHLSq/P4=;
        b=eDjUWInMI6RB/3gHkjBfiEpvQVxoU7WWqAMumgSz5JuBP0bvvIg+unkRpIb1pmrVqw
         wPtT/Hdv6aWfwn2QzlTFa6/aJLwvbzSfHz90JV3VICmK07cAajfHtNxGoPxlP/MfOPin
         9R11PaODZG7RqAKDVcCTYHA+gSj8YBhrtllesD17/zRD+Zpu8tDErL1Ysgilsg3LmhXu
         EMOp0cd73mS3hqvsf+MBj+oyORPVer3tc5tHj5YETUPTeTYO0lr9dVnRfJdlqp1qn3H6
         YJA0VlvL2r6DCLg8oP2CwwYsinA4WIXKDvj+TSuDBhcE3bIXGcaLKquIZDZPn5biZu8t
         H+iQ==
X-Gm-Message-State: AOAM533dVNKiEZ8B52fxZv5ohdw4YTrlOm1k/xyaiPPMX0/gfVqB7noE
        ykAPWTvE95RD6C+7Jvd4uF2X8yDMjO4lIPrLTekWsWdM5EUyZq8QLDFNvxgn68UPQTgjOBZaGSa
        EXA0X714+pVeHbeG+EE4r
X-Received: by 2002:a05:6402:304b:: with SMTP id bu11mr2960182edb.157.1616067552811;
        Thu, 18 Mar 2021 04:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybMKF4rbf/+X7/pWroCKL+gFtxbHe6/AFe7+dyxh1OhuMTQk+jaN/YTSMlPj1Fg3SJ/588OQ==
X-Received: by 2002:a05:6402:304b:: with SMTP id bu11mr2960171edb.157.1616067552670;
        Thu, 18 Mar 2021 04:39:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g25sm1800026edp.95.2021.03.18.04.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 04:39:12 -0700 (PDT)
Subject: Re: [PATCH] usb-storage: Add quirk to defeat Kindle's automatic
 unload
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
Cc:     Matthias Schwarzott <zzam@gentoo.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
References: <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
 <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
 <20210317190654.GA497856@rowland.harvard.edu>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7ca46439-6b7c-ecf1-3e4f-a3a7da868a64@redhat.com>
Date:   Thu, 18 Mar 2021 12:39:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317190654.GA497856@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 3/17/21 8:06 PM, Alan Stern wrote:
> Matthias reports that the Amazon Kindle automatically removes its
> emulated media if it doesn't receive another SCSI command within about
> one second after a SYNCHRONIZE CACHE.  It does so even when the host
> has sent a PREVENT MEDIUM REMOVAL command.  The reason for this
> behavior isn't clear, although it's not hard to make some guesses.
> 
> At any rate, the results can be unexpected for anyone who tries to
> access the Kindle in an unusual fashion, and in theory they can lead
> to data loss (for example, if one file is closed and synchronized
> while other files are still in the middle of being written).
> 
> To avoid such problems, this patch creates a new usb-storage quirks
> flag telling the driver always to issue a REQUEST SENSE following a
> SYNCHRONIZE CACHE command, and adds an unusual_devs entry for the
> Kindle with the flag set.  This is sufficient to prevent the Kindle
> from doing its automatic unload, without interfering with proper
> operation.
> 
> Another possible way to deal with this would be to increase the
> frequency of TEST UNIT READY polling that the kernel normally carries
> out for removable-media storage devices.  However that would increase
> the overall load on the system and it is not as reliable, because the
> user can override the polling interval.  Changing the driver's
> behavior is safer and has minimal overhead.
> 
> Reported-and-tested-by: Matthias Schwarzott <zzam@gentoo.org>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> 
> ---
> 
> 
> [as1953]
> 
> 
>  drivers/usb/storage/transport.c    |    7 +++++++
>  drivers/usb/storage/unusual_devs.h |   12 ++++++++++++
>  include/linux/usb_usual.h          |    2 ++
>  3 files changed, 21 insertions(+)
> 
> Index: usb-devel/drivers/usb/storage/transport.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/storage/transport.c
> +++ usb-devel/drivers/usb/storage/transport.c
> @@ -656,6 +656,13 @@ void usb_stor_invoke_transport(struct sc
>  		need_auto_sense = 1;
>  	}
>  
> +	/* Some devices (Kindle) require another command after SYNC CACHE */
> +	if ((us->fflags & US_FL_SENSE_AFTER_SYNC) &&
> +			srb->cmnd[0] == SYNCHRONIZE_CACHE) {
> +		usb_stor_dbg(us, "-- sense after SYNC CACHE\n");
> +		need_auto_sense = 1;
> +	}
> +
>  	/*
>  	 * If we have a failure, we're going to do a REQUEST_SENSE 
>  	 * automatically.  Note that we differentiate between a command
> Index: usb-devel/drivers/usb/storage/unusual_devs.h
> ===================================================================
> --- usb-devel.orig/drivers/usb/storage/unusual_devs.h
> +++ usb-devel/drivers/usb/storage/unusual_devs.h
> @@ -2212,6 +2212,18 @@ UNUSUAL_DEV( 0x1908, 0x3335, 0x0200, 0x0
>  		US_FL_NO_READ_DISC_INFO ),
>  
>  /*
> + * Reported by Matthias Schwarzott <zzam@gentoo.org>
> + * The Amazon Kindle treats SYNCHRONIZE CACHE as an indication that
> + * the host may be finished with it, and automatically ejects its
> + * emulated media unless it receives another command within one second.
> + */
> +UNUSUAL_DEV( 0x1949, 0x0004, 0x0000, 0x9999,
> +		"Amazon",
> +		"Kindle",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_SENSE_AFTER_SYNC ),
> +
> +/*
>   * Reported by Oliver Neukum <oneukum@suse.com>
>   * This device morphes spontaneously into another device if the access
>   * pattern of Windows isn't followed. Thus writable media would be dirty
> Index: usb-devel/include/linux/usb_usual.h
> ===================================================================
> --- usb-devel.orig/include/linux/usb_usual.h
> +++ usb-devel/include/linux/usb_usual.h
> @@ -86,6 +86,8 @@
>  		/* lies about caching, so always sync */	\
>  	US_FLAG(NO_SAME, 0x40000000)				\
>  		/* Cannot handle WRITE_SAME */			\
> +	US_FLAG(SENSE_AFTER_SYNC, 0x80000000)			\
> +		/* Do REQUEST_SENSE after SYNCHRONIZE_CACHE */	\
>  
>  #define US_FLAG(name, value)	US_FL_##name = value ,
>  enum { US_DO_ALL_FLAGS };
> 

