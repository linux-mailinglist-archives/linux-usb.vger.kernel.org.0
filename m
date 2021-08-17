Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD97F3EF605
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 01:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234866AbhHQXR2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 19:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhHQXR2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 19:17:28 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658DCC0613C1
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 16:16:54 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id a21so262006ioq.6
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 16:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KPiGFxgVvYUbWABlVl43nzVqjuIo6MdwTPCZgQTNlrY=;
        b=diWvOr0feVT+pBD+17kbknG8z4+nNaij0fI9QAcAJfayqyHUARSwxacULzfqTEmhyY
         /3y/xTXMiX/1zCwAUBH8IgkY8HMQE+GGdlxSFTubMUKo+pFrvWssUolP5i7LCZVaSBLo
         dhvpU8LgwVbyXgu7dmlPcUhubapa+1EloFapo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KPiGFxgVvYUbWABlVl43nzVqjuIo6MdwTPCZgQTNlrY=;
        b=ocPUqAj0QhWCz3f7doZxvqb6AoqsAWTTATspUCHk98rDoWpyhlMULdF4yNtHxk05ch
         I1oQIWuW10r5yqHGM5mfqi9tndVWvbRMf4zCbXamveHhuKvVhQ6xvNvOAcXNhbglH7un
         tmEcyMJkxyHOLE3SHTLswMFM1BPlVt2VOyN+sMFdql6NB3Ottl5x6TS+NZfmCkF+50Y0
         kX2rDA3Rwm9pjNBksF0dzHzLMa/jYj9zi+DSHdgJmmQqdHAj1CFqk++VMAfi3tKt9qEB
         ys1lU3Df9s1UeFJBFrLcnP5jOIGdR8badngESpgvOBR6F+mIBzdT1UeY1GedF8/zFFo3
         EfiA==
X-Gm-Message-State: AOAM533JHOurZgDqZ4CwaMCAsIZKBUeiimE2P8Vt/X9H6wB558Xd0wPb
        4reBsZynYHWL9O+HCREBvJC28g==
X-Google-Smtp-Source: ABdhPJyUfXRVJnTRnqD4Y9708QJyzwk5eLnG8hTD687kbELpgq67QJZ7eQ21IosoiZshZ4q43y/QAg==
X-Received: by 2002:a5d:928c:: with SMTP id s12mr4727597iom.151.1629242213221;
        Tue, 17 Aug 2021 16:16:53 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id k7sm1845089iok.22.2021.08.17.16.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 16:16:52 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] usbip: give back URBs for unsent unlink requests
 during cleanup
To:     Anirudh Rayabharam <mail@anirudhrb.com>,
        valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org
Cc:     syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210813182508.28127-1-mail@anirudhrb.com>
 <20210813182508.28127-2-mail@anirudhrb.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <13450a85-bbfe-09c5-d614-1a944c2600c2@linuxfoundation.org>
Date:   Tue, 17 Aug 2021 17:16:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210813182508.28127-2-mail@anirudhrb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/13/21 12:25 PM, Anirudh Rayabharam wrote:
> In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
> not given back. This sometimes causes usb_kill_urb to wait indefinitely
> for that urb to be given back. syzbot has reported a hung task issue [1]
> for this.
> 
> To fix this, give back the urbs corresponding to unsent unlink requests
> (unlink_tx list) similar to how urbs corresponding to unanswered unlink
> requests (unlink_rx list) are given back.
> 
> [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
> 
> Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>   drivers/usb/usbip/vhci_hcd.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 4ba6bcdaa8e9..6f3f374d4bbc 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -957,8 +957,34 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>   	spin_lock(&vdev->priv_lock);
>   
>   	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
> +		struct urb *urb;
> +
> +		/* give back URB of unsent unlink request */
>   		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);

I know this is an exiting one.
Let's make this pr_debug or remove it all together.

> +
> +		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
> +		if (!urb) {
> +			pr_info("the urb (seqnum %lu) was already given back\n",
> +				unlink->unlink_seqnum);

Let's make this pr_debug or remove it all together.

> +			list_del(&unlink->list);
> +			kfree(unlink);
> +			continue;
> +		}
> +
> +		urb->status = -ENODEV;
> +
> +		usb_hcd_unlink_urb_from_ep(hcd, urb);
> +
>   		list_del(&unlink->list);
> +
> +		spin_unlock(&vdev->priv_lock);
> +		spin_unlock_irqrestore(&vhci->lock, flags);
> +
> +		usb_hcd_giveback_urb(hcd, urb, urb->status);
> +
> +		spin_lock_irqsave(&vhci->lock, flags);
> +		spin_lock(&vdev->priv_lock);
> +
>   		kfree(unlink);
>   	}
>   
> 

thanks,
-- Shuah
