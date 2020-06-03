Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F08B1ED695
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jun 2020 21:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgFCTRN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jun 2020 15:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFCTRM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 15:17:12 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4425CC08C5C0
        for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2020 12:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cBo2MlN9z1K4ZbltYmi8+QSe20QUgbDNTTepNJNpo9Y=; b=U95xd3fNir4TTh8DmgCNV5vgqL
        /qYTeNx7Ttv/4GOqYPTDqh0ENV9H/y79jb6HDI6lcLKh9AXJdPgSSt0viwUYZUXV1nxj2vCDU5lHF
        H6UWjPvqjelFhMMN+qjJNgH9u9r59A4oTBobNRtsUJftDesrc1VtUmh3ABzLfA769GlPHLpvI9GUY
        mN5Bh0k9CNu7+bfDM7vzPj4HY7Gcc/5RA1Tonfum5NfIdRgJPmqx1UoBp1eFlZLJlzcVb9m5dx7LR
        olpVVXca9rwbE+zGNJ0ExNLSNF9wd/hlCHr84nIuMkYOTy55pOHZY8jx0zZgmtzKkteH03+w+azC/
        BPkmMUTg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55108 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jgYst-0004HH-Vb; Wed, 03 Jun 2020 21:17:07 +0200
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <002c09da-5caf-319c-db2c-878cd00f6e3a@tronnes.org>
Date:   Wed, 3 Jun 2020 21:17:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602001207.17171.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 02.06.2020 02.12, skrev Peter Stuge:
> Hi Noralf,
> 
> Thanks a lot for going into more detail.
> 
> Noralf Trønnes wrote:
>>> Several Linux/DRM internals have "leaked" into the USB protocol - this
>>> should be avoided if you want device implementations other than your
>>> gadget, because those internals can change within Linux in the future,
>>> while the protocol must not.
>>>
>>
>> That's intentional, I see no point in recreating uapi values that won't
>> change:
>>
>> Linux errno: /include/uapi/asm-generic/errno{-base,}.h
>> Pixel formats: include/uapi/drm/drm_fourcc.h
>> Connector types and status: include/uapi/drm/drm_mode.h
> 
> I understand, and it's good that these are uapi values, but I will still
> disagree with using errno and DRM connector types in the USB protocol,
> which is a "namespace" of its own.
> 
> That is an important point here; GUD is three things: a Linux DRM driver,
> a Linux gadget driver and a USB protocol. USB protocols (good ones) are
> OS-agnostic.
> 

I need to be more clear here about the word 'Generic' that I've used.

This is not a OS-agnostic protocol. It's written for Linux. I have had
the BSD's in mind, hence the MIT license, FreeBSD for instance has a DRM
subsystem. Other OS'es might not support all DRM properties, but should
be able to use it as a basic display. They will ofc need to translate
the Linux DRM specifics into their own environment. But first and
foremost this is for Linux.

The host driver is written against the capabilities of the Linux gadget
framework and the DRM subsystem. This will add some peculiarities that a
microcontroller implementation won't face. The focal point of the
project is providing as good performance as possible for Full HD desktop
use.

The word 'Generic' means that it's (should be) possible to make a USB
display for use on Linux without having to write a graphics driver. This
includes all kinds of tiny/small displays that currently are SPI or I2C
interfaced. These will probably use a microcontroller instead of a Linux
SoC to keep cost low.

> 
>>>> If the device transfer buffer can't fit an uncompressed framebuffer
>>>> update, the update is split up into parts that do fit.
>>>
>>> Does "device transfer buffer" refer to something like display RAM on
>>> the device side? If so, its size is a device implementation detail
>>> which shouldn't be exposed over USB.
>>
>> The reason for exposing this is that the Linux gadget driver needs to
>> decompress the transfer into a buffer and the host needs to know how big
>> this is (the host can choose to lower this if it can't allocate a
>> continuous buffer of this size).
> 
> I understand; so it's only required for some compression types - then
> it should at least be completely optional, but in any case I find
> exposing/having to expose this to be awful USB protocol design and I
> hope we can find a better way.
> 
> Maybe it's premature anyway? How would you feel about skipping compression
> to begin with?
> 

Performance is not good without compression so I need to keep that.

> 
>> lz4 (in the kernel) is block compression and can't be used for
>> decompressing just a stream of bytes. There is a lz4 frame protocol
>> which looks like it could be useful, but it's not available in the
>> kernel. I hardly know anything about compression so I'm in no position
>> to add that to the kernel. Maybe someone will add it at a later time if
>> it is useful.
> 
> Why did you choose to use lz4?
> 

The kernel supports it and in actually performs quite well.
Decompression is much faster than compression which fits nicely with not
so powerful USB devices. Low resolution displays might not need
compression at all.

> Whether compression comes now or later, maybe there is a more suitable
> algorithm?
> 

Could be, it's possible to support other compression methods. I'll leave
that to the professionals that need it for their display.

> 
>>> The R1 idea is great!
>>
>> My plan was to remove R1 support from this version of the patchset, but
>> I forgot. The reason is that it's cumbersome to test when the gadget
>> driver doesn't support it.
> 
> Why not support R1 also in the gadget?
> 

The DRM subsystem doesn't have support for it so the gadget wouldn't
know when to use it. Monochrome DRM drivers advertise a XRGB8888 format
and converts this into monochrome. The reason for using this format is
because all userspace supports it. AFAIK no DRM userspace support
monochrome.

> 
>> You mention further down that you have use cases for this, do you have a
>> timeplan for when you will make use of R1?
> 
> No strict plan, but if it helps I could make a demo device and -firmware
> without much effort. You mentioned that you would like to have a
> microcontroller device for testing?
> 

I have done a microcontroller implementation, so I have tried it. It's
quite a different environment to work in than Linux for sure :-) It
might have been a more pleasant experience if I'd spent money on a
professional compiler/IDE I guess.

> 
>>>> - Use donated Openmoko USB pid
>>>
>>> If Linux will be the reference for this protocol then perhaps a PID
>>> under the Linux Foundation VID (1d6b) makes more sense?
>>
>> Do they hand out pid's?
> 
> I don't know. :) The root hub drivers each have one.
> 
> 
>> To me it's no big deal, it can be added later if someones cares about it.
> 
> Okay, hopefully we can do without a PID anyway.
> 

That can't happen AFAIK. This would require the driver to probe all USB
devices with a vendor interface. Who knows what kind a havoc this might
cause on the device in question.

> 
>>> But: A PID applies on device level, not to interfaces.
>>
>> Indeed. This is a USB interface driver though, so it only looks at
>> vendor class interfaces. Then it checks if there's a bulk out endpoint,
>> if not it returns -ENXIO and the device subsytem moves on to another
>> interface driver if any. Next it tries to fetch the display descriptor
>> and if not succesful it returns -ENODEV to give another driver a chance.
> 
> Thanks for clarifying this flow. It's nice not to require particular
> endpoint addresses - that makes the protocol/driver much more generic.
> 
> 
>> I have tried my best to let the driver tolerate other vendor class
>> interfaces on the device.
> 
> Ack, this is clear now.
> 
> 
>> I don't understand why PID should not be necessary, I'm using a vendor
>> class interface and the driver can't probe all of those, so it has to
>> look at specific vid:pid's.
> 
> Why can't the driver probe all vendor class interfaces?
> 
> To probe fewer interfaces, a criteria other than PID can still be defined,
> and doing so would enable immediate plug-and-play for non-gadget and especially
> composite devices, without requiring the addition of PIDs in the host driver.
> 
> I find this possibility especially attractive for composite devices, which
> may already have some VID:PID and a non-GUD primary function/interface that
> is handled by another driver, such that a GUD PID effectively can't be adopted
> for that device.
> 
> One example of such a criteria would be to require that the iInterface
> string descriptor contains the (sub)string "Generic USB Display".
> 

I can consider a driver that looks at all vendor interfaces if you can
find a driver in the kernel that does this.

>>>> +static int gud_get_vendor_descriptor(struct usb_interface *interface,
>>>> +				     struct gud_drm_display_descriptor *desc)
>>>> +{
>>> ..
>>>> +	ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_DESCRIPTOR,
>>>> +				      GUD_DRM_USB_DT_DISPLAY << 8, buf, sizeof(*desc), false);
>>>
>>> GUD_DRM_USB_DT_DISPLAY is defined as (USB_TYPE_VENDOR | 0x4),
>>> but USB_TYPE_VENDOR only applies to bmRequestType[6:5] in control transfers,
>>> nowhere else. I know of no standardized way to introduce vendor-specific
>>> descriptors. Squatting is possible, but I think it would be nice to do
>>> better here. It is easy enough.
>>>
>>> It could be argued that the vendor specific interface gives flexibility here,
>>> but actually it just means that the semantics of the standardized and
>>> well-defined USB_REQ_GET_DESCRIPTOR have been duplicated by this protocol,
>>> that is not very common - but if you want to go ahead then at least drop
>>> USB_TYPE_VENDOR from the GUD_DRM_USB_DT_DISPLAY definition.
>>
>> I liked that it is well defined and understood, so I didn't have to be clever.
> 
> I tried to explain that it is only well defined for the standardized
> GET_DESCRIPTOR request with device recipient. The concept "descriptor"
> isn't used anywhere else by other USB protocols that I know.
> 
> There are various class-specific descriptors, but they are all standardized
> in USB-IF device class specs, and all of them are only ever retrieved by the
> standardized GET_DESCRIPTOR request.
> 
> Because of that it's actually rather confusing to me to refer to the display
> data structure as a descriptor and even use the standardized descriptor header
> and naming convention when it is actually /not/ a descriptor, since it isn't
> standardized and isn't retrievable with the standardized GET_DESCRIPTOR
> request. Does that make sense?
> 
> 
>> I like it and think I'll keep it, so I'll change the macro:
>>
>> #define GUD_DRM_USB_DT_DISPLAY 0x44
> 
> Okay. The number is arbitrary, since a control request directed to a vendor
> specific interface is vendor specific "by inheritance", thus also arbitrary.
> 
> 
>>> Maybe it's good to think about the data exchange some more - anything not
>>> transfered by standardized USB_REQ_GET_DESCRIPTOR (bmRequestType 10000000B;
>>> Device-to-host data, Standard type, Device recipient) isn't actually
>>> a descriptor, it's vendor-specific, free-format data. Does that enable
>>> any simplifications?
>>
>> Actually it is:
>>
>> 	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
> 
> Right; it's a Vendor-Specific type, Interface recipient request, thus not
> the standardized USB_REQ_GET_DESCRIPTOR, and thus the data is not actually
> a descriptor, hence why calling it one is confusing to me.
> 
> 
>> see gud_drm_usb_control_msg(). I could add
>> GUD_DRM_USB_REQ_GET_DESCRIPTOR instead of using USB_REQ_GET_DESCRIPTOR
>> if that makes it any clearer.
> 
> That would be an improvement, but I would really wish for different
> terminology all together.
> 
> 

Ok, if this is really confusing I need to fix it and I couldn't find a
driver to support my case in the kernel either.

>>>> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum)

I'm skipping the status poll discussion since I've discovered a bug in
my previous code that broke on timeouts. I will to try and fix that
first and see how it turns out.

>>>> +	shmem->map_cached = true;
>>>
>>> Can you explain what this does exactly?
>>
>> Not excatly, but I can try rather vaguely :-) The memory subsystem is a
>> black box to me. It has to do with the memory page attribute that
>> controls how memory access is handled by the CPU cache. The default for
>> shmem is WriteCombined which makes for slow read access on ARM, but on
>> x86 there doesn't seem to be any penalty judging by my brief testing.
> 
> Hmm. ARM often (always?) can't do byte-aligned access, only 32-bit access.
> Do you know if and how the buffer is aligned? Maybe this can make a difference?
> 
> 

The start of the buffer is word aligned to match the arch, the memory
subsystem takes care of that, otherwise we would have all kinds of trouble.

>>>> +static int gud_drm_probe(struct usb_interface *interface,
>>>> +			 const struct usb_device_id *id)
>>>> +{
> ..
>>>> +		/* Check if the device can support us */
>>>> +		*version = 1;
>>>> +		ret = gud_drm_usb_control_msg(usb, ifnum, false, GUD_DRM_USB_REQ_SET_VERSION,
>>>> +					      0, version, sizeof(*version), true);
> 
> A more USB:y way would btw. be to report the highest supported protocol
> version to the host in some data structure.
> 
> This too could be the iInterface string descriptor.
> 
> 
>>> Could't this work without _get_status()? What does usb_control_msg()
>>> return for a STALL handshake in the data stage?
>>
>> It returns -EPIPE, but as mentioned above, I can't stall a control write
>> request with payload.
> 
> Please check this? It looks to me like it would be possible.
> 

Alan confirmed what I read in the kernel source in his reply.

>>> Or at least in Documentation/ ?
>>
>> Ideally I would have written a spec and made the implementation against it.
>> However since I suck at writing, I even struggle with getting the compiler
>> to understand me, so it won't happen. It would have taken me forever.
> 
> I have a template for USB protocols that I could use, perhaps we can make
> that spec a reality. I think it would be quite valuable, to help folks
> outside Linux who may also want to create a generic usb display.
> 

I'm sorry but that's outside of the scope of the project and the effort
I can put into it.

> 
>>>> +static size_t gud_drm_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format,
>>>> +				       void *src, struct drm_framebuffer *fb,
>>>> +				       struct drm_rect *rect)
>>>> +{
>>> ..
>>>> +	buf = kmalloc(width * height, GFP_KERNEL);
>>>> +	if (!buf)
>>>> +		return len; /* To keep logic simple, just transmit garbage */
>>>
>>> Ouch! Shouldn't this bubble up somehow? If there is memory pressure
>>> then I really think something above should fail.
> 
> No comment on this?
> 

I wanted to see if you were going to use R1 in the near future,
otherwise I will remove this in the next version. I guess I'll fix this
if it stays.

>>>> +static int gud_drm_fb_flush(struct gud_drm_device *gdrm, struct drm_framebuffer *fb,

I need to delay commenting on the flow control issues for now. I'll pick
it up later after some more study.

>>> Why does the host software need to know anything about the connector
>>> inside the device, anyway? With a microcontroller that could be anything,
>>> especially with actual R1 displays.
>>>
>>> Would it make sense to introduce DRM_MODE_CONNECTOR_USB on the host, and
>>> keep this implementation detail in the device?
>>
>> For display adapters it makes sense especially when it has more than one
>> connector like the Raspberry Pi which has an hdmi and a sdtv connector.
> 
> Right, a GUD device could have multiple connectors, I guess with one USB
> interface per connector, but again, what does the host really need to know
> about the connector beyond the supported pixel format(s)?
> 
> Thanks for mentioning SDTV - I wasn't sure about the rationale for those
> TV parts in the patch. Can you elaborate on that?
> 

Those are properties exposed by the DRM subsystem for use on TV
connectors. I actually don't know much details, I've just exposed them
and tested that I can set margins.

> If the idea is in fact to create "Linux DRM over USB" then by all means
> go for it, but in that case please don't call it generic.
> 
I disagree, I believe this is generic, within the Linux world.

>>> I hope this helps.
>>
>> Indeed it I does, it helps me revisit the decisions I've made and look
>> at them in a new light. I have looked at the code for so long that I
>> hardly see it anymore.
> 
> I know the feeling and I'm glad to help, but only if the goal is indeed
> to create a generic USB:y protocol, mostly if not completely free of Linux
> details.
> 
> If you're actually after something more closely tied to Linux/DRM then
> that's also a fun idea, but much less relevant for me.
> 

I'm sorry, but this is Linux first and foremost.

Noralf.

> 
> 
> Thanks and kind regards
> 
> //Peter
> 
