Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8263E32099A
	for <lists+linux-usb@lfdr.de>; Sun, 21 Feb 2021 11:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhBUKWW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Feb 2021 05:22:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43769 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229886AbhBUKWS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Feb 2021 05:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613902851;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4VO+/iNYTAnZcz7BcHpLmT75qtFMiJcZS7rQo40GCK4=;
        b=D4nsdWJWIbpasMwJhmDKE/fFLq0TM5Mon0SDayJRfDQaU+uJRBhrWX1s6yDdr8+ej6rv/W
        T1sA104zBDbfqSU/ZgukOXoA2wXUaIhzWkyhUfq1e2MOtuF434TFj4LiBRNO7OhPUpPHk7
        3BGfSFz5dHjMeixI54lKjGO8u/SSVuI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-DBRLGQgHPtK142R7RrjsNw-1; Sun, 21 Feb 2021 05:20:49 -0500
X-MC-Unique: DBRLGQgHPtK142R7RrjsNw-1
Received: by mail-ed1-f70.google.com with SMTP id q2so5339774edt.16
        for <linux-usb@vger.kernel.org>; Sun, 21 Feb 2021 02:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4VO+/iNYTAnZcz7BcHpLmT75qtFMiJcZS7rQo40GCK4=;
        b=baY/kYlcNTmMEY0yOy7QAPhV1VEaMKchhKwBCdz8y1Fy40Z5AsRellVjRr7N4TU1Mo
         4Q5qyhwHtmcMwvy5wwlDjg4lmrPakHoyKINmRciVjAg9YOVSXlu+bQcYaLIkf/SfxEOl
         TDFtZRhWC/0jayrPFqmcVQxwAEff/InqfJsZoglPriMT3jb8arQ7/eALtWbpZp27b3dJ
         eF3+0yh9QqmqD10dyf3FWfVZ2yuAJvRJVYK/e5Z+bzSZGyaEz1wUg+nvP4E5Q4X51w9g
         J6i8ZisxEb/RYvEBN8un/5fXl+l6DIXoAztQN3GpEgP8mbW70VOyoGKlHwVpBOtugq7e
         cpEA==
X-Gm-Message-State: AOAM5319K3vda8l7Iee2fMSo6S4jpCVEM92K+xkN/hidd6VM/RukB/2M
        ke/fgIsdRgzVLPbel+ycfe8M4WK5qocXbhX49aNBD/K/qx54DmGMN6MrtuTvQTcT2xzuUumFYYb
        vHmJcqAx3HJu95I/SS1bA
X-Received: by 2002:a17:906:2bce:: with SMTP id n14mr15719628ejg.171.1613902848111;
        Sun, 21 Feb 2021 02:20:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWvoyQ9GAeWSpF4dgi0gcQP74N5Uze6kDqL7liOMbZf60qrkDyTISaRSmHllev/reePN2Olg==
X-Received: by 2002:a17:906:2bce:: with SMTP id n14mr15719619ejg.171.1613902847970;
        Sun, 21 Feb 2021 02:20:47 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id m7sm8007250ejk.52.2021.02.21.02.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Feb 2021 02:20:47 -0800 (PST)
Subject: Re: [PATCH] USB: UAS: don't unbind and rebind the driver during
 usb_reset_device
To:     Hui Wang <hui.wang@canonical.com>, linux-usb@vger.kernel.org,
        oneukum@suse.com, gregkh@linuxfoundation.org
References: <20210221085100.4297-1-hui.wang@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
Date:   Sun, 21 Feb 2021 11:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221085100.4297-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 2/21/21 9:51 AM, Hui Wang wrote:
> Once pre_reset() or post_reset() returns non-zero, the disconnect()
> and probe() of the usb_driver will be called. In the disconnect(),
> the scsi_host will be removed and be freed after scsi_host_put(), in
> the probe(), the new scsi_host and uas_dev_info will be created.
> 
> If the usb_reset_device() is triggered by eh_device_reset_handler(),
> and pre_reset()/post_reset() returns non-zero, the disconnect() and
> probe() will be called, then returns to the eh_device_reset_handler(),
> it still accesses old scsi related variables and uas_dev_info, and so
> do its caller functions.
> 
> Here change the pre_reset() and post_reset() to let them only return
> 0, after this change, the usb_reset_device() will only reset this
> usb devcie from its hub port, will not execute unbind and rebind
> usb_driver during reset.

We only return non 0 from the pre/post reset handles if we failed
to ensure the device is in a known state.

E.g. in uas_post_reset() we only fail if we failed to switch the
device from the good old usb-storage protocol back to the UAS mode
which it was in before.

Continuing with the UAS driver bound, as if everything is fine,
while the device is actually in longer in UAS mode is a bad idea.

Summarizing this patch is wrong: NACK.

###

I assume that you wrote this patch because of some bug report ?

In such a case please always include a link to the bug (or forum
discussion) in the commit message.

UAS problems typically are caused by people shoving a 2.5 inch
or m2 SSD in an USB enclosure which is powered from the USB bus
only. SSD-s can cause pretty hefty power-consumption peaks when
high queue depts are used; and these bus powered devices typically
cannot handle these peaks. Either because the port they are
plugged in does not deliver enough current; and/or because they
don't have enough buffering (capacitors) on the enclosure's PCB
to deal with short but quite large consumption peaks.

Regards,

Hans








> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  drivers/usb/storage/uas.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index bef89c6bd1d7..c66287448e34 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -1121,7 +1121,6 @@ static int uas_pre_reset(struct usb_interface *intf)
>  	if (uas_wait_for_pending_cmnds(devinfo) != 0) {
>  		shost_printk(KERN_ERR, shost, "%s: timed out\n", __func__);
>  		scsi_unblock_requests(shost);
> -		return 1;
>  	}
>  
>  	uas_free_streams(devinfo);
> @@ -1152,7 +1151,7 @@ static int uas_post_reset(struct usb_interface *intf)
>  
>  	scsi_unblock_requests(shost);
>  
> -	return err ? 1 : 0;
> +	return 0;
>  }
>  
>  static int uas_suspend(struct usb_interface *intf, pm_message_t message)
> 

