Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A65276EE59
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 17:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235570AbjHCPku (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 11:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234994AbjHCPkt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 11:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB2810C1
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691077202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7MjFAiqKbDglL6akdiTVv7zchJ6NU5F4MtEgJgPDBUc=;
        b=hVWEcqUGEjY3OPtegE79rm+yP14tqW8HuWs+jnjU01ZAokmkRKRFnCuzKY4tEJBMnns9wr
        zu7nNR2mLRwqp16KUHwK9voNGwYhdeehf5J1R5muOWkBF9yf3GTUpompHFdzfo1CmCIrFm
        tK/6TQ2ozszXN7DJhXREkXxg+1upWT8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-UIrnk3S3PwuS9uDCcjkCtQ-1; Thu, 03 Aug 2023 11:40:01 -0400
X-MC-Unique: UIrnk3S3PwuS9uDCcjkCtQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a355c9028so112557066b.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Aug 2023 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691077200; x=1691682000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7MjFAiqKbDglL6akdiTVv7zchJ6NU5F4MtEgJgPDBUc=;
        b=HBvqkY0zCzgI/BW/0fEur5GOcgwxFmYA5zBfLPfiMDj8ODI2/CHbTdB/2zZuLcqZql
         AqTjJCn0Z5gmbh3DhHAjW7iugKkivkjrezU/FW+0/uaeRoHFou+x3pDoxbRCFa1OGS4D
         5y8JD/YG4S+WwWopspb/G8ABXJBJA5O5HFA9aVjxxkx1qI9A4qdlhL721/l7G2r0Z4Gd
         FiVx5KRW/wvssBmuuQ27uvQc3351OILjUqKS7tNDG4S6UG3DM4CMCDpyyU529ySGTCC0
         O4ySAhkQJylNM9T2hgo+glLLpIwhNQm4ENA5x0iDzguhdRVkCQdVTI41+Vs/kj78x9tK
         7Lrw==
X-Gm-Message-State: AOJu0YxnyUG79+8fFPel7HSQMtLnBLt3uTR/qjbwdjk63ysrlz4l0HqJ
        foMS9Wf63mfUH4Ih3okXIvC33YnYhAqrBqTKs/tGFvBSqFdOI7m20cu4VTFDciH/zhDG5Bx4kNt
        pGAxNzosgMoz4TY0XFl9g
X-Received: by 2002:a17:906:7696:b0:99c:7551:933e with SMTP id o22-20020a170906769600b0099c7551933emr1588274ejm.64.1691077200282;
        Thu, 03 Aug 2023 08:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGueAUbd/L+hZPNN8XPKjjKUPVWxcZvTxILlNSJZ+Rnc9aHH9B1BTl2vMyaDeea/XT56fULgw==
X-Received: by 2002:a17:906:7696:b0:99c:7551:933e with SMTP id o22-20020a170906769600b0099c7551933emr1588261ejm.64.1691077199965;
        Thu, 03 Aug 2023 08:39:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gy26-20020a170906f25a00b00993470682e5sm10639904ejb.32.2023.08.03.08.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 08:39:58 -0700 (PDT)
Message-ID: <a31ee75e-6a8e-fe7b-aadc-f118d9ab60f9@redhat.com>
Date:   Thu, 3 Aug 2023 17:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] USB: add usbfs ioctl to get specific superspeedplus rates
To:     Alan Stern <stern@rowland.harvard.edu>,
        Dingyan Li <18500469033@163.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Xiaofan Chen <xiaofanc@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Tormod Volden <lists.tormod@gmail.com>,
        sebastian.reichel@collabora.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <2023072105-lethargic-saddling-ad97@gregkh>
 <130b453c.5c8f.1897872ce54.Coremail.18500469033@163.com>
 <2023072159-carol-underfeed-43eb@gregkh>
 <781b3f95-96e7-af83-e089-887ec7f2d255@suse.com>
 <2023072546-denture-half-5ceb@gregkh>
 <CAGjSPUCQ892adFdYm7zCuMpWujwzwoQtYimvp3xXrnnCCyN47w@mail.gmail.com>
 <da536c80-7398-dae0-a22c-16e521be697a@suse.com>
 <CAGjSPUDtn-YMqmNrmku+hkyXCKys4XRue4wdzQwr+yGxe2cJSQ@mail.gmail.com>
 <2a82ba01-38dd-fad9-98b9-ac8591107921@redhat.com>
 <151a5748.3e99.189ba07b110.Coremail.18500469033@163.com>
 <51926ee6-ee81-4543-a1f7-338e65a26670@rowland.harvard.edu>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <51926ee6-ee81-4543-a1f7-338e65a26670@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/3/23 17:10, Alan Stern wrote:
> On Thu, Aug 03, 2023 at 02:13:33PM +0800, Dingyan Li wrote:
>>
>> At 2023-07-26 22:39:32, "Hans de Goede" <hdegoede@redhat.com> wrote:
> 
>>> Right, so the reason why IOCTL USBDEVFS_GET_SPEED was added is so 
>>> that a confined qemu process which gets just a fd for a /dev/bus/usb/ 
>>> device passed by a more privileged process can still get the speed 
>>> despite it not having sysfs access. This is necessary for correct 
>>> pass-through of USB devices.
>>>
>>> Since USBDEVFS_GET_SPEED now no longer tells the full story I believe 
>>> that the proposed USBDEVFS_GET_SSP_RATE ioctl makes sense.
>>>
>>> The current patch however misses moving the enum usb_ssp_rate 
>>> declaration from include/linux/usb/ch9.h to 
>>> include/uapi/linux/usb/ch9.h so that needs to be fixed in a version 
>>> 2. Assuming that with the above explanation of why this is necessary 
>>> Greg and Alan are ok with adding the ioctl.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>
>> Hi Greg and Alan,
>>
>> Could you please share your opinions about Hans' justification?
> 
> Instead of adding a new ioctl or modifying an existing one, how about 
> increasing the set of constants in enum usb_device_speed?  Then the 
> existing ioctls could return the newly defined values when appropriate, 
> with no other changes necessary.

Right, I was thinking along the same lines but I was not entirely
sure this would work because I looked at the wrong bits of
include/uapi/linux/usb/ch9.h while writing my first email on this.

Looking again I see we already have a straight forward
enum usb_device_speed for this which can easily be extended.

> (This doesn't mean just moving the definition of usb_ssp_rate from one 
> header file to the other.  The usb_device_speed enumeration should be 
> extended with the new members.  Perhaps omitting USB_SSP_GEN_UNKNOWN 
> since we already have USB_SPEED_SUPER_PLUS, or setting the first equal 
> to the second.)
> 
> I don't think there was ever a requirement in the API that the set of 
> values in usb_device_speed could never increase (and in fact it has 
> increased in the past).  Such a requirement wouldn't make any sense, 
> given how the USB-IF keeps defining newer and faster USB bus 
> implementations.
> 
> Hans, would that play well with libusb?

It should, this is how libusb uses the USBDEVFS_GET_SPEED ioctl:

static enum libusb_speed usbfs_get_speed(struct libusb_context *ctx, int fd)
{
	int r;

	r = ioctl(fd, IOCTL_USBFS_GET_SPEED, NULL);
	switch (r) {
	case USBFS_SPEED_UNKNOWN:	return LIBUSB_SPEED_UNKNOWN;
	case USBFS_SPEED_LOW:		return LIBUSB_SPEED_LOW;
	case USBFS_SPEED_FULL:		return LIBUSB_SPEED_FULL;
	case USBFS_SPEED_HIGH:		return LIBUSB_SPEED_HIGH;
	case USBFS_SPEED_WIRELESS:	return LIBUSB_SPEED_HIGH;
	case USBFS_SPEED_SUPER:		return LIBUSB_SPEED_SUPER;
	case USBFS_SPEED_SUPER_PLUS:	return LIBUSB_SPEED_SUPER_PLUS;
	default:
		usbi_warn(ctx, "Error getting device speed: %d", r);
	}

	return LIBUSB_SPEED_UNKNOWN;
}

I think that GEN_2x1 should probably be mapped to
USBFS_SPEED_SUPER_PLUS so as to not break this most common case
and to keep apps reporting either Super Speed Plus or 10Gbps
(more common) for this.

GEN_1x2 + GEN_2x2 can then be mapped to new values, which will
cause libusb to log a warning + return LIBUSB_SPEED_UNKNOWN
until libusb is updated which seems harmless enough.

Regards,

Hans


