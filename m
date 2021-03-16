Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B7933D9B9
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 17:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238906AbhCPQoJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 12:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23611 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238895AbhCPQnm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 12:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615913019;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UrdHJs7L6b/Q0U+QgknNULaiIskOvwSN+cs2j2q2uE8=;
        b=E/0m6Ccs2dtA9NAMxg8Z4PEuE9OPzuahutc4K1KmzlFgFCb1pNhyVJGcTGBZ7wIBYGrvBO
        yIWKEv/dskGT6cj4DN0XGScN0rBSkLsB6GWnWk6DnqwTrgFXslqDJwMBZuEhwjfCNVTJMS
        CeMBaPCVfDhaYLcD/wK+LxBqkuzWYQg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-CVEf_0D-MDu2UEY-qHaj8w-1; Tue, 16 Mar 2021 12:43:36 -0400
X-MC-Unique: CVEf_0D-MDu2UEY-qHaj8w-1
Received: by mail-ed1-f72.google.com with SMTP id a2so17901528edx.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 09:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UrdHJs7L6b/Q0U+QgknNULaiIskOvwSN+cs2j2q2uE8=;
        b=EceVm3jBMU0pVuOwNbFugFj21gYB4DdD/u6AOjlBx8fd5eTWKsA0YVmV1d9g5MFwhi
         iIgj2dfJDVke8/dvAnuTbrJoKY+Su01a9pe3O51QV6kq+0FH2nifh8zHHMfjK59UVUb8
         WPpMYYqf2Wj44utg3dwJ49HRRATdUAPmJrB0BxCG7YfEXhpSGFgHcEP6dEs2+/6S2L9l
         80kb3MGreNdtjOelQ/AHAvPJxLjb0Cxx+k5lWxiQII88n46rvitY4sE1P+DFlRk4m9tb
         SBBNk0JZGhY2DhzJnBpanMxZzwxkfjSfnxcRJLV8m32XAa4qCkmKaogFD7gC1cmq+HYa
         CiVg==
X-Gm-Message-State: AOAM530pOzSptkMoNAWDO83flaDw6e37J7iNaluczFRmuN3w6v++fJoh
        4y55/Z3UPxEBEHJ87zVartSg8eKPSN7Q9iyU61ZiC50cRF8i9oR95P3mErK2yfO38DoYhZFUCs3
        oEl8fNXD+/Yf4RmvdrgPA
X-Received: by 2002:a05:6402:17d5:: with SMTP id s21mr37121062edy.65.1615913015360;
        Tue, 16 Mar 2021 09:43:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTXPGWUd8McNm5AlbaTHir9+FKY6oE8QF7FMaOLrMFvWrUU5LlUrg/ONXpR2yZTiL86GN4jg==
X-Received: by 2002:a05:6402:17d5:: with SMTP id s21mr37121044edy.65.1615913015203;
        Tue, 16 Mar 2021 09:43:35 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h8sm5030987ede.25.2021.03.16.09.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 09:43:34 -0700 (PDT)
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
To:     Alan Stern <stern@rowland.harvard.edu>,
        Matthias Schwarzott <zzam@gentoo.org>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
References: <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
 <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
Date:   Tue, 16 Mar 2021 17:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316162650.GB448722@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 3/16/21 5:26 PM, Alan Stern wrote:
> On Tue, Mar 16, 2021 at 06:26:30AM +0100, Matthias Schwarzott wrote:
>> I implemented solution 3b. This is the pullrequest for udev (systemd
>> repository):
>>
>> 	https://github.com/systemd/systemd/pull/19002
>>
>> Now Lennart asks if udev is the best place for such hacks/work-arounds?
>>
>> Well, I implemented it as suggested by Alan (see above). This was the
>> simplest of the considered alternatives. Different quirks in kernel has been
>> considered, but are more effort to be implemented.
> 
> Lennart probably isn't aware how the usb-storage driver works.  It does 
> not create commands on its own; it merely sends the commands that it 
> gets from higher SCSI layers.
> 
> It may be possible to modify the SCSI core, to make it send a TEST UNIT 
> READY command immediately following any SYNCHRONIZE CACHE to a Kindle.
> 
> However, there may be an easier solution.  usb-storage does indeed send 
> a command of its own, REQUEST SENSE, to get error data when a command 
> fails.  The patch below will make it do the same thing whenever it sends 
> a SYNCHRONIZE CACHE to a Kindle, failure or not.
> 
> The only question is whether the Kindle will regard REQUEST SENSE as a 
> sufficient indication that it shouldn't do an eject.  The only way to 
> find out is by testing the patch.
> 
> Alan Stern

Thank you for this patch, yes if this works it would IMHO be
a much better solution then the udev rule.

One question though, if this works to fix the undesired ejects,
will an actual eject (using e.g. the eject utility as say
"sudo eject /dev/sda") still be seen as an eject by the kindle
after this ?

Because that is actually kind of important for everyone using their
Kindle with Calibre, breaking that would not be good.

Regards,

Hans




> 
> 
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
> +	if (us->fflags & US_FL_CHECK_AFTER_SYNC &&
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
> + * media unless it receives another command within one second.
> + */
> +UNUSUAL_DEV( 0x1949, 0x0004, 0x0000, 0x9999,
> +		"Amazon",
> +		"Kindle",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_CHECK_AFTER_SYNC ),
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
> +	US_FLAG(CHECK_AFTER_SYNC, 0x80000000)			\
> +		/* Check sense after SYNCHRONIZE_CACHE */	\
>  
>  #define US_FLAG(name, value)	US_FL_##name = value ,
>  enum { US_DO_ALL_FLAGS };
> _______________________________________________
> systemd-devel mailing list
> systemd-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/systemd-devel
> 

