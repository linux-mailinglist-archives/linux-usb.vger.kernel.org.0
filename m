Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405873F0B23
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 20:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhHRSgz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 14:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbhHRSgt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 14:36:49 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED35AC0613CF
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 11:36:13 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id r5so4684066oiw.7
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 11:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B0HrW3j8Fnyw72AqWx3TFUtOK4uhUpvaY9gIMxzxuIU=;
        b=hfBxFw/TnfJ8Q74TdotNtucJRO5iThq4zbBYJNQvrSt9UJbNIvSi7KPr3ZLBoVcvTf
         Ja2MQggiRk+lmcrQjPrvC/gqgcGl2hziLZToc5mYMndIs0TWkfxteNRYponSEg3o/4Qj
         U3x1CN3O0z+4mO/ehfurr3u2f17gcc6uAVMQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B0HrW3j8Fnyw72AqWx3TFUtOK4uhUpvaY9gIMxzxuIU=;
        b=NXauAL3QNnMeg9EHLvqxxJJesNXZcYpmAJAcp5oEX/lNSf2l3FwNu/Fevj5JwF2M9y
         5KHJcewdgUgqGu5E0GhATiO3L9UQBUH2LOx8otADfG3sSZPJxMYSkuvG+3kdmznGZdgp
         iy5YLYI63Fpo/GzYYWmBzuQXgouRWwOnjbQDxFkKqoMuXmZQQhe9yyIV2q6PHApyMbXw
         xawDijw7k0z0MqnXs13B579x9d/KDgSX1ptF8ghk9bD/1GzhjAHG9A3sWgyGyvSJDN/N
         2beFMcpe/iU5JVUshwgkd/QZwmqzbWaZNlthBfKzU1+V/pQw1j1B9oUaYsZrkgOgGfJy
         3imQ==
X-Gm-Message-State: AOAM530iMJShVqZYfGvvA+1pFlAFHkhGN7r5T4xrz0WJrRtv7v9/w963
        D7ZE6XK1iP2wgwIvrP/+npkghA==
X-Google-Smtp-Source: ABdhPJzv/vbVL6GJH4+87n+W0NlAqUCmVyKVjAYZEem9rXkxFaZSyPC2dgpiXaHDSbcM9qFY7BsluQ==
X-Received: by 2002:aca:1703:: with SMTP id j3mr8277516oii.116.1629311773372;
        Wed, 18 Aug 2021 11:36:13 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j6sm113586ooj.11.2021.08.18.11.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 11:36:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] usbip: give back URBs for unsent unlink requests
 during cleanup
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Anirudh Rayabharam <mail@anirudhrb.com>,
        valentina.manea.m@gmail.com, shuah@kernel.org,
        syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210813182508.28127-1-mail@anirudhrb.com>
 <20210813182508.28127-2-mail@anirudhrb.com>
 <13450a85-bbfe-09c5-d614-1a944c2600c2@linuxfoundation.org>
 <YRydGRdPmOaiMWaY@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <cb36604b-37f1-c12e-3ebb-cdafd7798dc1@linuxfoundation.org>
Date:   Wed, 18 Aug 2021 12:36:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YRydGRdPmOaiMWaY@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/17/21 11:39 PM, Greg KH wrote:
> On Tue, Aug 17, 2021 at 05:16:51PM -0600, Shuah Khan wrote:
>> On 8/13/21 12:25 PM, Anirudh Rayabharam wrote:
>>> In vhci_device_unlink_cleanup(), the URBs for unsent unlink requests are
>>> not given back. This sometimes causes usb_kill_urb to wait indefinitely
>>> for that urb to be given back. syzbot has reported a hung task issue [1]
>>> for this.
>>>
>>> To fix this, give back the urbs corresponding to unsent unlink requests
>>> (unlink_tx list) similar to how urbs corresponding to unanswered unlink
>>> requests (unlink_rx list) are given back.
>>>
>>> [1]: https://syzkaller.appspot.com/bug?id=08f12df95ae7da69814e64eb5515d5a85ed06b76
>>>
>>> Reported-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>> Tested-by: syzbot+74d6ef051d3d2eacf428@syzkaller.appspotmail.com
>>> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
>>> ---
>>>    drivers/usb/usbip/vhci_hcd.c | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>>> index 4ba6bcdaa8e9..6f3f374d4bbc 100644
>>> --- a/drivers/usb/usbip/vhci_hcd.c
>>> +++ b/drivers/usb/usbip/vhci_hcd.c
>>> @@ -957,8 +957,34 @@ static void vhci_device_unlink_cleanup(struct vhci_device *vdev)
>>>    	spin_lock(&vdev->priv_lock);
>>>    	list_for_each_entry_safe(unlink, tmp, &vdev->unlink_tx, list) {
>>> +		struct urb *urb;
>>> +
>>> +		/* give back URB of unsent unlink request */
>>>    		pr_info("unlink cleanup tx %lu\n", unlink->unlink_seqnum);
>>
>> I know this is an exiting one.
>> Let's make this pr_debug or remove it all together.
>>
>>> +
>>> +		urb = pickup_urb_and_free_priv(vdev, unlink->unlink_seqnum);
>>> +		if (!urb) {
>>> +			pr_info("the urb (seqnum %lu) was already given back\n",
>>> +				unlink->unlink_seqnum);
>>
>> Let's make this pr_debug or remove it all together.
> 
> As you have a struct device for all of these, please use dev_dbg() and
> friends, not pr_*(), for all of these.
> 

Yes. Makes perfect sense.

thanks,
-- Shuah
