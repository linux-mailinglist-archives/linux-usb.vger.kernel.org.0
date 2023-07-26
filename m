Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3627A763962
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 16:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbjGZOk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 10:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjGZOk1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 10:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEF51BE4
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690382378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bj7/3LKbfvXqQQQnY/rPeKZo1En4aIhYAnG+ACzNkaQ=;
        b=YvdGWYEgSr5Lt2cQd4hm2F0zbG8wi/k4ymSDY530xQNML3msXESSlIwNAAX8Qz/60w0Kwc
        yRwNGsqT8WMpvYHRc95g5DW8h1vZnj2mk/NP40fQ3vyNDRoNBxIUOp/UEaVvd8BYy4J5Ok
        MpQU2+9kS6Om+X3RuJLBEz6Mwo5Gjyc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-W2qVDQmOPCGJON4mk9zRwA-1; Wed, 26 Jul 2023 10:39:35 -0400
X-MC-Unique: W2qVDQmOPCGJON4mk9zRwA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a355c9028so485426466b.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 07:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690382374; x=1690987174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bj7/3LKbfvXqQQQnY/rPeKZo1En4aIhYAnG+ACzNkaQ=;
        b=JHvOUFZCtfKvaj51J58fADj3cxBeABEzz7Yav1d+jJ9kvmzXRAnM3J47uH/vWs9yZT
         DCQ46t9Ci0SZD4gtbgytmhANyEBddbpaN1R6f57Oa+nKrtY77mSpC4RHA4hYHRtPMZ64
         QX6pl7LKj9DJyh84bHV3TRNQ2fKgZehJAjZKG4CEQ6zShjVN0+lCADvMm83TyCAeYeUS
         dn8YK+3wogtRclaukoVGOL91LfQk3fwo4OxCRLndIfWsejIFqrNtYwNclXZrTv4/U06h
         hGgbuedsZMrmXMCBE94yhmVeBc/X2j58tpk39/619u0A8hHVdtNkt1r4PwScwHUY59vF
         fnlw==
X-Gm-Message-State: ABy/qLZaaiuSlRFRWVKdcl4Kl+Z8OVtw9d7JW806MHQPUnFzgkSGnZND
        u5rOAKWvjZOk9/vOK3/6FSsTooX/9zUDRRaOWMBwpquLQDAccXXgzFtIFoq/kExOJgyW5ZJj7l2
        8kxnhNLuf4NMUVecZ7cDs
X-Received: by 2002:a17:906:7a4d:b0:99b:d1cb:5aca with SMTP id i13-20020a1709067a4d00b0099bd1cb5acamr173789ejo.44.1690382373997;
        Wed, 26 Jul 2023 07:39:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEsMcLoq8Q4QpL7yVRtkoTimcKPygn4fyYdMALFyIOiceJQm+bGP5alsojCNmabVBA4F14MMA==
X-Received: by 2002:a17:906:7a4d:b0:99b:d1cb:5aca with SMTP id i13-20020a1709067a4d00b0099bd1cb5acamr173776ejo.44.1690382373712;
        Wed, 26 Jul 2023 07:39:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s23-20020a170906455700b00997c1d125fasm9723629ejq.170.2023.07.26.07.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 07:39:33 -0700 (PDT)
Message-ID: <2a82ba01-38dd-fad9-98b9-ac8591107921@redhat.com>
Date:   Wed, 26 Jul 2023 16:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] USB: add usbfs ioctl to get specific superspeedplus rates
Content-Language: en-US, nl
To:     Xiaofan Chen <xiaofanc@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Tormod Volden <lists.tormod@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Dingyan Li <18500469033@163.com>, stern@rowland.harvard.edu,
        sebastian.reichel@collabora.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230721084039.9728-1-18500469033@163.com>
 <2023072105-lethargic-saddling-ad97@gregkh>
 <130b453c.5c8f.1897872ce54.Coremail.18500469033@163.com>
 <2023072159-carol-underfeed-43eb@gregkh>
 <781b3f95-96e7-af83-e089-887ec7f2d255@suse.com>
 <2023072546-denture-half-5ceb@gregkh>
 <CAGjSPUCQ892adFdYm7zCuMpWujwzwoQtYimvp3xXrnnCCyN47w@mail.gmail.com>
 <da536c80-7398-dae0-a22c-16e521be697a@suse.com>
 <CAGjSPUDtn-YMqmNrmku+hkyXCKys4XRue4wdzQwr+yGxe2cJSQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGjSPUDtn-YMqmNrmku+hkyXCKys4XRue4wdzQwr+yGxe2cJSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

On 7/26/23 05:20, Xiaofan Chen wrote:
> On Wed, Jul 26, 2023 at 5:38 PM Oliver Neukum <oneukum@suse.com> wrote:
>>
>> On 26.07.23 03:37, Xiaofan Chen wrote:
>>> On Tue, Jul 25, 2023 at 10:23 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> Hi,
>>
>>>> So unless there is some actual need from userspace tools like libusb (or
>>>> anything else?) that requires this new ioctl, let's not add it otherwise
>>>> we are signing ourselves up to support it for forever.
>>>
>>> Interestingly there is PR in libusb now, which uses sysfs for 20Gbps.
>>
>> True. Now would you write a patch for libusb?
>> This looks to be turning into a chicken and egg problem.
>>
>>> Maybe this new usbfs IOCTL is indeed good to have if we can not extend
>>
>> Looking at the code of libusb you can see that libusb has two modes
>> of operation. Either it finds sysfs, then it uses it, if not it
>> goes for the ioctl.
>>
>> Now, how well shall it work without sysfs? That is a design decision
>> and we should not be having this discussion again and again.
>>
>> BTW, that is not aimed at anybody personally, we are just trying to
>> avoid a basic decision and it will come back.
>>
>>> the existing IOCTL USBDEVFS_GET_SPEED (but why not?).
>>
>> It does not include the lane count.
>> And sort of fudging this into speed is a bad idea in the long
>> run because we are likely to have collisions in the future.
>>
>> We have a basic issue here. Do we require libusb to use sysfs or not?
> 
> Adding Hans de Goede and Tormod Volder (libusb admins) here in the discussions
> as I am more into the testing and support side of libusb and not a
> real developer.
> 
> libusb does work with or without sysfs and there are multiple commits related
> to sysfs vs usbfs.
> 
> An example commit from Hans in Sept 202 which is related to this discussion.
> https://github.com/libusb/libusb/commit/f6068e83c4f5e5fba16b23b6a87f1f6d7ab7200a
> ++++++++++++++++
> linux: Fix libusb_get_device_speed() not working on wrapped devices
> 
> We don't have a sysfs_dir for wrapped devices, so we cannot read the speed
> from sysfs.
> 
> The Linux kernel has supported a new ioctl to get the speed directly from
> the fd for a while now, use that when we don't have sysfs access.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1871818
> Reported-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> +++++++++++++++++
> 
> To Hans and Tormod:
> Discussion thread for reference:
> https://lore.kernel.org/linux-usb/da536c80-7398-dae0-a22c-16e521be697a@suse.com/T/#t

Right, so the reason why IOCTL USBDEVFS_GET_SPEED was added is so that a confined qemu process which gets just a fd for a /dev/bus/usb/ device passed by a more privileged process can still get the speed despite it not having sysfs access. This is necessary for correct pass-through of USB devices.

Since USBDEVFS_GET_SPEED now no longer tells the full story I believe that the proposed USBDEVFS_GET_SSP_RATE ioctl makes sense.

The current patch however misses moving the enum usb_ssp_rate declaration from include/linux/usb/ch9.h to include/uapi/linux/usb/ch9.h so that needs to be fixed in a version 2. Assuming that with the above explanation of why this is necessary Greg and Alan are ok with adding the ioctl.

Regards,

Hans



