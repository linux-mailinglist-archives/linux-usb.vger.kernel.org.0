Return-Path: <linux-usb+bounces-1620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB27C9447
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 12:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC8DC1C20A2F
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 10:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652B3F51C;
	Sat, 14 Oct 2023 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="axAGG+XO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7245A5396
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 10:58:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F36AD
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 03:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697281091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7K8u/F/T7vd5Qb0NUDHtY09uDfh7jAIHafbl7k57Yug=;
	b=axAGG+XOnTuegyal3NHIDnoT8m3q0+oLDWgkhc+vVW2Uqbc+lfwIdbXowqsVGvcgNXcrYh
	PIBnm2EygyJ2ciFZSvW6c1z7alV7MJV3w2oYSBNAKMBPpuIkR1VQ63ByY9AHv+yNMbg88b
	kyI75UuHXjX3pZc6k0u2xEXFPJtBtes=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Xq2c-h1WOead9Nz8lS5Vbg-1; Sat, 14 Oct 2023 06:58:09 -0400
X-MC-Unique: Xq2c-h1WOead9Nz8lS5Vbg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae0601d689so187555666b.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 03:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697281088; x=1697885888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K8u/F/T7vd5Qb0NUDHtY09uDfh7jAIHafbl7k57Yug=;
        b=Kq3G5D41o+uT+JxjzglwR43fdFidPkXpO9Wknfvt0H08+c2ePVOyR2RrovXWULxiKq
         5TLcDK8+U5Ybhnkz+9wdomCJdLf1bIFyAgt1DDlzPnkTMiWKTWNOHznP8H3wrHHraa4x
         vJo2KCPXQ6y4ChP0bJFLsKS72bBcgPJISbpw+I2kC4IerNnE1IfNTVNOXQDIaZNmlwEx
         UTjjIbGUT4ejj7W3WtrRewbuJHMC2FS56F+/qhLpOFrFs0VoJJ9EHIjl7RVFX9krhu3H
         pWJOjtGJMXHxU7UFLor4ahdKPeeX8ZFFYOzhT/pjrVH5NEQd6hvMo8P1Ugz2UDMqL3rq
         F+Bw==
X-Gm-Message-State: AOJu0YzsSSn8+f87b4u5Pjxq8wOVRQUU/2qt72SdA1V0xOHlfYK9XOLX
	hcHArCryJWcyeOrEtWrvrZgd2mBVPx6fOG27H+vU5RfTWuIXbg/GjZwo3VX7Qc1/eAYT79VLKhb
	+D744h+EQaYesHGtHGz6C
X-Received: by 2002:a17:907:9306:b0:9bd:a2a9:a722 with SMTP id bu6-20020a170907930600b009bda2a9a722mr4380732ejc.45.1697281088720;
        Sat, 14 Oct 2023 03:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERPMfjIBAe6gPMoCmGJsf/nvUED0pBuGMeWmFvEJzgs1jrgiD92PRib0Pl5uaiKzqcHeO+Jg==
X-Received: by 2002:a17:907:9306:b0:9bd:a2a9:a722 with SMTP id bu6-20020a170907930600b009bda2a9a722mr4380709ejc.45.1697281088270;
        Sat, 14 Oct 2023 03:58:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vl9-20020a170907b60900b0099bccb03eadsm755833ejc.205.2023.10.14.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Oct 2023 03:58:07 -0700 (PDT)
Message-ID: <9a080d06-586d-686f-997e-674cb8d16099@redhat.com>
Date: Sat, 14 Oct 2023 12:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v20 1/4] usb: Add support for Intel LJCA device
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "Wu, Wentong" <wentong.wu@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "oneukum@suse.com" <oneukum@suse.com>, "wsa@kernel.org" <wsa@kernel.org>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "Wang, Zhifeng" <zhifeng.wang@intel.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-2-git-send-email-wentong.wu@intel.com>
 <ZSZ3IPgLk7uC5UGI@smile.fi.intel.com>
 <6a87b43a-0648-28d4-6c69-e0f684e44eb6@redhat.com>
 <DM6PR11MB4316BE44F53E276384FF06C88DCCA@DM6PR11MB4316.namprd11.prod.outlook.com>
 <5d2e9eba-a941-ea9a-161a-5b97d09d5d35@redhat.com>
 <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZSmjEKfYzFuAHXW+@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Andy,

On 10/13/23 22:05, Shevchenko, Andriy wrote:
> On Thu, Oct 12, 2023 at 01:14:23PM +0200, Hans de Goede wrote:

<snip>

>> Ah ok, I see. So the code:
>>
>> 1. First tries to find the matching child acpi_device for the auxdev by ADR
>>
>> 2. If 1. fails then falls back to HID + UID matching
>>
>> And there are DSDTs which use either:
>>
>> 1. Only use _ADR to identify which child device is which, like the example
>>    DSDT snippet from the commit msg.
>>
>> 2. Only use _HID + _UID like the 2 example DSDT snippets from me email
>>
>> But there never is a case where both _ADR and _HID are used at
>> the same time (which would be an ACPI spec violation as Andy said).
>>
>> So AFAICT there is no issue here since  _ADR and _HID are never
>> user at the same time and the commit message correctly describes
>> scenario 1. from above, so the commit message is fine too.
>>
>> So I believe that we can continue with this patch series in
>> its current v20 form, which has already been staged for
>> going into -next by Greg.
>>
>> Andy can you confirm that moving ahead with the current
>> version is ok ?
> 
> Yes as we have a few weeks to fix corner cases.
> 
> What I'm worrying is that opening door for _ADR that seems never used is kinda
> an overkill here (resolving non-existing problem).

I assume that there actually some DSDTs using the _ADR approach
and that this support is not there just for fun.

Wentong, can you confirm that the _ADR using codepaths are
actually used on some hardware / with some DSDTs out there ?

> Looking at the design of the
> driver I'm not sure why ACPI HIDs are collected somewhere else than in the
> respective drivers. And looking at the ID lists themselves I am not sure why
> the firmware of the respective hardware platforms are not using _CID.

This is a USB device which has 4 functions:

1. GPIO controller
2. I2C controller 1
3. I2C controller 2
4. SPI controller

The driver for the main USB interface uses
the new auxbus to create 4 child devices. The _ADR
or if that fails _HID + _UID matching is done to
find the correct acpi_device child of the acpi_device
which is the ACPI-companion of the main USB device.

After looking up the correct acpi_device child
this is then set as the fwnode / ACPI-companion
of the auxbus device created for that function.

Having the correct fwnode is important because other
parts of the DSDT reference this fwnode to specify
GPIO / I2C / SPI resources and if the fwnode of
the aux-device is not set correctly then the resources
for other devices referencing it (typically a camera
sensor) can not be found.

As for why the driver for the auxbus devices / children
do not use HID matching, AFAIK the auxbus has no support
for using ACPI (or DT) matching for aux-devices and these
drivers need to be auxiliary_driver's and bind to the
auxbus device and not to a platform_device instantiated for
the acpi_device since they need the auxbus device to access
the USB device.

Regards,

Hans



