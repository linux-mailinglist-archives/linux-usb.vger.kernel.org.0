Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9D024E7CA
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 16:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgHVOPg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 10:15:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60149 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728019AbgHVOPf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 10:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598105733;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JV/kqhMMNVm2hgOeYtw9b34lpsa9RQ6l73NIRdxZMHk=;
        b=dDaz0+rE+Non0xBWJVEyWj2g61t2aohqzr1kNaRPENdAnTnUcPD+GRqRueEnFM5SpXUkam
        CFxoE+xFvWGYUJFW8xfYKVyVfgeiOUBnRvifg3EB5QqvbooKGJGTFzZMiALyzcVryIAaEj
        nqMdXOx9cm9vmnA1qLoNgKhY+z2MeBE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-iFXoun0RNrG14WbStPSZDg-1; Sat, 22 Aug 2020 10:15:31 -0400
X-MC-Unique: iFXoun0RNrG14WbStPSZDg-1
Received: by mail-ed1-f72.google.com with SMTP id g20so1684558edj.15
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 07:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JV/kqhMMNVm2hgOeYtw9b34lpsa9RQ6l73NIRdxZMHk=;
        b=cLmOj9igf9KCk4Ngw9ARH5mWWjfFaHDNYkf9DRNx6SJIg/hrYBVUvijXJ6U2569hhW
         L6QE4zASbg+opnKJrOwTqO04+FtiaJBij1qjqUX5jwq+fP+Rx3v+i01piGOCUt5Qk36Z
         PBuZjLmOo7UPOUYwHzEWOrVkr+INaYYk1Uy1teVbJq54OqRDpT+oY8o0Nt/7Xvgn9PXn
         ajbWHiX2lKWPbDRNgwabTia2clh7tPmdSpRb6A7FC0XfdMJXVPezZdUzuvKxTafHLTkX
         u7YTzwF3lhDvZwJQvhCBx6R07nDXvN0N+YpjzSJgDxhJ6FTXdRpq32w/J7ECi7chfjKY
         IGqg==
X-Gm-Message-State: AOAM5332EnUn3o+sxd09T8dEwe0DQWaWZbIjE38dqy3hw503sJYQfmkR
        QDGrI43XpzX/gZSiSowkJj5QGqgwWUA/LbXj1VRln6uDZF1EFwuuF8//i4KBqOgRx71gXW2ck39
        kxG4/zkphQZZEpkhlzd6i
X-Received: by 2002:aa7:ca44:: with SMTP id j4mr450927edt.222.1598105727275;
        Sat, 22 Aug 2020 07:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy6FUBOovEB6JgNBdRn/icmteGQLQvsCKyhx9maPg5hX8hsOVYy8L4FaocVbaAtY29UA6BUQ==
X-Received: by 2002:aa7:ca44:: with SMTP id j4mr450916edt.222.1598105727092;
        Sat, 22 Aug 2020 07:15:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a11sm3312202ejt.107.2020.08.22.07.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2020 07:15:26 -0700 (PDT)
Subject: Re: [PATCH] usb: uas: Add quirk for PNY Pro Elite
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        usb-storage@lists.one-eyed-alien.net
Cc:     stable@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
References: <2b0585228b003eedcc82db84697b31477df152e0.1597803605.git.thinhn@synopsys.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4a8bdf55-2111-af21-4b44-ed718d965ebc@redhat.com>
Date:   Sat, 22 Aug 2020 16:15:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2b0585228b003eedcc82db84697b31477df152e0.1597803605.git.thinhn@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/19/20 4:27 AM, Thinh Nguyen wrote:
> PNY Pro Elite USB 3.1 Gen 2 device (SSD) doesn't respond to ATA_12
> pass-through command (i.e. it just hangs). If it doesn't support this
> command, it should respond properly to the host. Let's just add a quirk
> to be able to move forward with other operations.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/usb/storage/unusual_uas.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 162b09d69f62..971f8a4354c8 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -80,6 +80,13 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>   		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>   		US_FL_BROKEN_FUA),
>   
> +/* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
> +UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
> +		"PNY",
> +		"Pro Elite SSD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_NO_ATA_1X),
> +
>   /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
>   UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
>   		"VIA",
> 
> base-commit: d5643d2249b279077427b2c2b2ffae9b70c95b0b
> 

