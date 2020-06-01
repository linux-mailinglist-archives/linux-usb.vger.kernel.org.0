Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48DE1EA80D
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 18:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgFAQ5m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 12:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAQ5l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 12:57:41 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C680C05BD43
        for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2020 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=aT96XowyC/UX60uZqBhwbwi+/knOfjK1fSCOB6qkcow=; b=W96bbrSYl+RMLMdYiCsICw4g4y
        St1LVdIEapWBsQfUf/7htsFVxRrzt80cqQTSh1RiQ3Di5Zuzxqmf//Oaevwav+MtWzM1We4F6vX3K
        dCaFdyHRn6A5xScCQENNN8gLk+5U4iYsdvGCUTMFg0B0oNt7KI+ySr94NOAknacqBcR2a3/OWRnI9
        xz4T1BhXQ3q/eKhaft0l81fXvL9mKw9ENdLxDAxBvXbhLGMwLExROzMO3D83elPRPf33jr0XJbujP
        8ZCMA6Hvn2MFjPJP503pUniJfTA2viLiuHz3pxvXVXpEudqg+ebjicRyJZbaEeqzZYErhR3xDwMY7
        8YMeyxVQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:9607 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jfnkn-0001iR-Ei; Mon, 01 Jun 2020 18:57:37 +0200
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     dri-devel@lists.freedesktop.org, balbi@kernel.org,
        linux-usb@vger.kernel.org, sam@ravnborg.org
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
Date:   Mon, 1 Jun 2020 18:57:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529224531.22261.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

Den 30.05.2020 00.45, skrev Peter Stuge:
> Hi Noralf,
> 
> Noralf Trønnes wrote:
>> This adds a generic USB display driver with the intention that it can be
>> used with future USB interfaced low end displays/adapters.
> 
> Fun!
> 
> 
>> The Linux gadget device driver will serve as the canonical device
>> implementation.
> 
> That's a great goal, but as proposed it isn't as generic as I would like.
> 
> Several Linux/DRM internals have "leaked" into the USB protocol - this
> should be avoided if you want device implementations other than your
> gadget, because those internals can change within Linux in the future,
> while the protocol must not.
> 

That's intentional, I see no point in recreating uapi values that won't
change:

Linux errno: /include/uapi/asm-generic/errno{-base,}.h
Pixel formats: include/uapi/drm/drm_fourcc.h
Connector types and status: include/uapi/drm/drm_mode.h

> 
>> If the device transfer buffer can't fit an uncompressed framebuffer
>> update, the update is split up into parts that do fit.
> 
> Does "device transfer buffer" refer to something like display RAM on
> the device side? If so, its size is a device implementation detail
> which shouldn't be exposed over USB.
> 

The reason for exposing this is that the Linux gadget driver needs to
decompress the transfer into a buffer and the host needs to know how big
this is (the host can choose to lower this if it can't allocate a
continuous buffer of this size).

lz4 (in the kernel) is block compression and can't be used for
decompressing just a stream of bytes. There is a lz4 frame protocol
which looks like it could be useful, but it's not available in the
kernel. I hardly know anything about compression so I'm in no position
to add that to the kernel. Maybe someone will add it at a later time if
it is useful.

> It's true that the host drives USB communication but the device decides
> whether it will accept data or not. If not, it responds with a NAK
> handshake in the OUT transaction, and the host controller will then
> try to resend the data later, until the transfer timeout given by the
> host software expires. Retries are invisible to host software.
> 
> The point is: USB has native flow control on the lowest level; that's
> far more efficient than anything the application can construct, and
> flow control in the application protocol would be redundant.
> 
> When using gadgetfs IIRC device controllers NAK as long as the
> userspace process doesn't write new data to the ep?out-bulk fd.
> Have you tried/seen this?
> 
> 
>> The driver supports a one bit monochrome transfer format: R1. This is not
>> implemented in the gadget driver. It is added in preparation for future
>> monochrome e-ink displays.
> 
> The R1 idea is great!
> 

My plan was to remove R1 support from this version of the patchset, but
I forgot. The reason is that it's cumbersome to test when the gadget
driver doesn't support it. I had some code to test the implementation
when I made it, but it's removed now. It's very easy to add R1 back in
when there's a display that makes use of it giving it a thorough testing.

You mention further down that you have use cases for this, do you have a
timeplan for when you will make use of R1?

> 
>> - Use donated Openmoko USB pid
> 
> If Linux will be the reference for this protocol then perhaps a PID
> under the Linux Foundation VID (1d6b) makes more sense?
> 

Do they hand out pid's? To me it's no big deal, it can be added later if
someones cares about it.

> But: A PID applies on device level, not to interfaces.
> 

Indeed. This is a USB interface driver though, so it only looks at
vendor class interfaces. Then it checks if there's a bulk out endpoint,
if not it returns -ENXIO and the device subsytem moves on to another
interface driver if any. Next it tries to fetch the display descriptor
and if not succesful it returns -ENODEV to give another driver a chance.

I have tried my best to let the driver tolerate other vendor class
interfaces on the device.

> Until this protocol becomes a USB-IF device class maybe it's better
> to create a probe for GUD interface(s) rather than binding to PID?
> 

Not sure what you mean here, this is an interface driver.

There exists a HID Display page:

Request #: HUTRR29
Title: Repurposing the Alphanumeric Display Page (0x14) as a generic
Auxiliary Display Page and adding bitmap and custom segment
capabilities
https://www.usb.org/sites/default/files/hutrr29b_0.pdf

I couldn't find anything that uses it. It could have been interesting if
there was a bulk endpoint here.

> Does the driver btw. already support a composite device with multiple GUD
> interfaces? Say a microcontroller with two independent panels. It seems no?
> 

I haven't tried, but it should work.

> If yes, would any of the control requests currently sent to the interface
> be better directed at the device? If so, then a PID might make sense again,
> but it's still not possible to create a composite device which uses this
> protocol, without risking collissions with other vendor specific requests
> on other (vendor specific) interfaces, that would be a real shame.
> 

I don't understand why PID should not be necessary, I'm using a vendor
class interface and the driver can't probe all of those, so it has to
look at specific vid:pid's.

> I can imagine a composite device wanting to implement HID and GUD,
> let's make sure that it's possible.
> 

I have tried together with a HID interface and that worked. I
specifically want HID to work so it's possible to make touch displays.
The Raspberry Pi images I've made available for testing has a console on
a USB ACM (serial) interface.

> 
> On to the code.
> 
> 
>> +static int gud_drm_usb_control_msg(struct usb_device *usb, u8 ifnum, bool in,
>> +				   u8 request, u16 value, void *buf, size_t len,
>> +				   bool check_len)
>> +{
>> +	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;
> 
> This takes struct usb_device rather than struct usb_interface - again,
> would this actually work with a composite device? The driver doesn't
> ever claim the interface so I guess no?
> 

usb_interface has a pointer to usb_device and that's what's used to send
usb messages, so instead of dereferencing each time I just use it directly.

> 
>> +static int gud_get_vendor_descriptor(struct usb_interface *interface,
>> +				     struct gud_drm_display_descriptor *desc)
>> +{
> ..
>> +	ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_DESCRIPTOR,
>> +				      GUD_DRM_USB_DT_DISPLAY << 8, buf, sizeof(*desc), false);
> 
> GUD_DRM_USB_DT_DISPLAY is defined as (USB_TYPE_VENDOR | 0x4),
> but USB_TYPE_VENDOR only applies to bmRequestType[6:5] in control transfers,
> nowhere else. I know of no standardized way to introduce vendor-specific
> descriptors. Squatting is possible, but I think it would be nice to do
> better here. It is easy enough.
> 
> It could be argued that the vendor specific interface gives flexibility here,
> but actually it just means that the semantics of the standardized and
> well-defined USB_REQ_GET_DESCRIPTOR have been duplicated by this protocol,
> that is not very common - but if you want to go ahead then at least drop
> USB_TYPE_VENDOR from the GUD_DRM_USB_DT_DISPLAY definition.
> 

I liked that it is well defined and understood, so I didn't have to be
clever. It's nice that the size is embedded for future versions of the
protocol that migh expand the descriptor. Well not so important now that
I have the version number in there.

I like it and think I'll keep it, so I'll change the macro:

#define GUD_DRM_USB_DT_DISPLAY 0x44

> Maybe it's good to think about the data exchange some more - anything not
> transfered by standardized USB_REQ_GET_DESCRIPTOR (bmRequestType 10000000B;
> Device-to-host data, Standard type, Device recipient) isn't actually
> a descriptor, it's vendor-specific, free-format data. Does that enable
> any simplifications?
> 

Actually it is:

	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;

see gud_drm_usb_control_msg(). I could add
GUD_DRM_USB_REQ_GET_DESCRIPTOR instead of using USB_REQ_GET_DESCRIPTOR
if that makes it any clearer.

> 
>> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum)
>> +{
>> +	struct gud_drm_req_get_status *status;
>> +	int ret, status_retries = 2000 / 5; /* maximum wait ~2 seconds */
>> +	unsigned long delay = 500;
>> +
>> +	status = kmalloc(sizeof(*status), GFP_KERNEL);
>> +	if (!status)
>> +		return -ENOMEM;
>> +
>> +	/*
>> +	 * Poll due to lack of data/status stage control on the gadget side.
> 
> I hope we can find something better here.
> 
> Doesn't gadgetfs allow userspace to (indirectly) control the status stage,
> as I wrote above?
> 

For read requests the device is stalling in case of error and the host
issues a status request.

For write requests the only thing I've found is a way to delay the
status stage, but only for requests without payload:

drivers/usb/gadget/composite.c: composite_setup():

} else if (value == USB_GADGET_DELAYED_STATUS && w_length != 0) {
	WARN(cdev,
		"%s: Delayed status not supported for w_length != 0",
		__func__);
}

And I can't stall, only continue:

/**
 * usb_composite_setup_continue() - Continue with the control transfer
 * @cdev: the composite device who's control transfer was kept waiting
 *
 * This function must be called by the USB function driver to continue
 * with the control transfer's data/status stage in case it had requested to
 * delay the data/status stages. A USB function's setup handler (e.g.
set_alt())
 * can request the composite framework to delay the setup request's
data/status
 * stages by returning USB_GADGET_DELAYED_STATUS.
 */
void usb_composite_setup_continue(struct usb_composite_dev *cdev)

If I could control the status stage and stall after data was received,
then I wouldn't need my own status stage.

> 
>> +	 * If we did not use polling and gave up here after waiting 2 seconds,
>> +	 * the worker in the gadget would finally get to queuing up the status
>> +	 * respons, but by that time the host has moved on. The gadget side
>> +	 * (at least dwc2) would now be left in a non-recoverable state.
> 
> Independently of the above, how does the gadget become non-recoverable?
> 

It stops responding to requests.

> If a transfer times out on the host without other error then the device
> has replied with NAK in the data stage transactions sent by the host
> until the host stopped trying. The device controller then sees no
> further data stage transactions and shouldn't be in a weird state?
> 

I don't know why it doesn't respond, it could be a controller driver
(dwc2) bug, but I'm no expert here. Actually this is the first work I've
ever done with USB.

> 
>> +	 * Worst case commit timeout in DRM can be tens of seconds (wait for
>> +	 * various _done completions).
>> +	 */
>> +	while (status_retries--) {
>> +		ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_STATUS, 0,
>> +					      status, sizeof(*status), true);
> 
> Instead of this loop a single request with 2000 ms timeout would
> avoid software overhead on the host. The header file says that
> 0 == PENDING is the only exit condition for the loop besides timeout,
> as long as there are no other conditions it's better to just wait for
> the timeout.
> 
> 
>> +		if (!(status->flags & GUD_DRM_STATUS_PENDING)) {
>> +			ret = -status->errno;
> 
> So this exposes errno (an implementation detail) in the bus protocol,
> at an absolute minimum it needs some le_to_cpu() adjustment, but I
> think it would be cleaner to define the specific errors that are
> application relevant.
> 
> 
> If this get_status thing is in fact really really required then how about
> adding an interrupt IN endpoint for it? I think that would be cleaner and
> it costs less bus time with arguably lower latency. See e.g. usblp.
> 

I couldn't find interrupt ep used in drivers/usb/class/usblp.c, but I've
seen examples of this used for status.
I'm a bit wary of using more endpoints since I suspect that
microcontrollers don't have that many.

I did a test setting delay to fixed 500-1500 usec in the polling loop
instead of the 4500-5500 that will be used when running a movie.
Actual frames per second for a 30 sec movie clip changed from 8.8 to
9.0, so latency isn't a big issue at least.

I also realise now that I don't need the PENDING flag, I can just keep
stalling the status request until the device is done.

> 
>> +static struct drm_gem_object *
>> +gud_drm_driver_gem_create_object(struct drm_device *dev, size_t size)
>> +{
>> +	struct drm_gem_shmem_object *shmem;
> ..
>> +	/*
>> +	 * This doesn't make a difference on x86, but on ARM (pi4) it was
>> +	 * necessary to avoid black lines all over and it made it possible to
>> +	 * compress directly from the framebuffer without performance drop.
>> +	 */
>> +	shmem->map_cached = true;
> 
> Can you explain what this does exactly?
> 

Not excatly, but I can try rather vaguely :-) The memory subsystem is a
black box to me. It has to do with the memory page attribute that
controls how memory access is handled by the CPU cache. The default for
shmem is WriteCombined which makes for slow read access on ARM, but on
x86 there doesn't seem to be any penalty judging by my brief testing.
The black lines are probably cache lines that haven't been
flushed/invalidated or whatever the black box does.

> 
>> +static int gud_drm_probe(struct usb_interface *interface,
>> +			 const struct usb_device_id *id)
>> +{
> ..
>> +	struct gud_drm_display_descriptor desc;
> ..
>> +		/* Check if the device can support us */
>> +		*version = 1;
>> +		ret = gud_drm_usb_control_msg(usb, ifnum, false, GUD_DRM_USB_REQ_SET_VERSION,
>> +					      0, version, sizeof(*version), true);
>> +		if (!ret)
>> +			ret = gud_usb_get_status(usb, ifnum);
>> +		kfree(version);
>> +		if (ret) {
>> +			dev_err(dev, "Protocol version %u is not supported\n", desc.bVersion);
>> +			return -EPROTONOSUPPORT;
> 
> Could't this work without _get_status()? What does usb_control_msg()
> return for a STALL handshake in the data stage?
> 

It returns -EPIPE, but as mentioned above, I can't stall a control write
request with payload. So I need my own status stage.

> Anyway, usb_get_status() (which I guess inspired gud_usb_get_status()) is
> usually for administrative device status rather than application status.
> Ideally the application status can be deduced by host software based on
> device responses.
> 
> 
> ..
>> +	gdrm->compression = desc.bCompression & GUD_DRM_COMPRESSION_LZ4;
> 
> This is a perfect example of doing things right! :)
> 
> GUD_DRM_COMPRESSION_LZ4 is specific for this protocol, not DRM/Linux.
> 
> What do you think about s,GUD_DRM_,GUD_, for such names?
> 
> And would it make sense to expose the protocol (names, structures) in uapi?
> 

No, since it's not for userspace.

> Or at least in Documentation/ ?
> 

Ideally I would have written a spec and made the implementation against
it. However since I suck at writing, I even struggle with getting the
compiler to understand me, so it won't happen. It would have taken me
forever.

> 
>> +static size_t gud_drm_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format,
>> +				       void *src, struct drm_framebuffer *fb,
>> +				       struct drm_rect *rect)
>> +{
> ..
>> +	buf = kmalloc(width * height, GFP_KERNEL);
>> +	if (!buf)
>> +		return len; /* To keep logic simple, just transmit garbage */
> 
> Ouch! Shouldn't this bubble up somehow? If there is memory pressure
> then I really think something above should fail.
> 
> 
>> +static int gud_drm_fb_flush(struct gud_drm_device *gdrm, struct drm_framebuffer *fb,
>> +			    const struct drm_format_info *format, struct drm_rect *rect)
>> +{
> 
> This is in the hot path, right?
> 

Indeed, the most important one. All the other paths can take "as long"
as they want, but this one "shows up" on the display.

> 
>> +	ret = gud_drm_usb_set(gdrm, GUD_DRM_USB_REQ_SET_BUFFER, 0, &req, sizeof(req));
>> +	if (ret)
>> +		goto vunmap;
>> +
>> +	ret = usb_bulk_msg(gdrm->usb, gdrm->bulk_pipe, gdrm->bulk_buf, trlen,
>> +			   &actual_length, msecs_to_jiffies(3000));
> 
> I would definitely change this pattern so that the hot path has only bulk
> transactions, ideally a single transfer. The control transfer wastes
> precious bus time in the hot path.
> 
> Maybe it's insignificant with FHD data but then again, the more data
> the less overhead we want, and in any case for small R1 data the
> control transfer is easily more expensive than the data itself!
> 
> A control transfer somehow compares to an ioctl() from userspace with
> much context switching, while a bulk transfer is more like mmaped kernel
> memory or aio.
> 
> Why not just add the values in struct gud_drm_req_set_buffer as a header
> before the data instead?
> 
> That would mean two bulk transfers, but they could be asynchronous, at least
> the first, but making both async would also fit more data onto the bus.
> Maybe later.
> 

GUD_DRM_USB_REQ_SET_BUFFER serves one purpose in addition to sending the
header, as mentioned in the comment preceeding it, it waits for any
ongoing decompression/copying on the device from the previous fb flush.
lz4 decompression is much faster than compression, but the host will be
much more powerful than the device, so the host will almost always have
to wait for the device when flushing continously.

Yes you're right, the overhead is insignificant for FHD, 4-500 usec for
the actual control messages (including status message) vs. 50-100ms for
the total operation (depending on how well it compresses).

But why should this overhead be of concern for a display that has a
framebuffer transfer of 4-8kB? It will be more than fast enough.

> 
>> + * struct gud_drm_req_get_connector - Connector descriptor
>> + * @connector_type: Connector type (DRM_MODE_CONNECTOR_*)
>> + * @flags: Flags
>> + * @num_properties: Number of supported properties
>> + */
>> +struct gud_drm_req_get_connector {
>> +	__u8 connector_type;
> 
> This is intended for the (Generic) USB Display to report the connector type
> used for its panel, right? It should not use Linux/DRM-internal values such
> as DRM_MODE_CONNECTOR_SPI to do so, if it wants to be generic and stable
> over time.
> 

DRM_MODE_CONNECTOR_SPI is uabi from include/uapi/drm/drm_mode.h

> Why does the host software need to know anything about the connector
> inside the device, anyway? With a microcontroller that could be anything,
> especially with actual R1 displays.
> 
> Would it make sense to introduce DRM_MODE_CONNECTOR_USB on the host, and
> keep this implementation detail in the device?
> 

For display adapters it makes sense especially when it has more than one
connector like the Raspberry Pi which has an hdmi and a sdtv connector.
For display panels the connector is USB yes, but there's no type for
this yet. There's a discussion going on if we should stop adding
connector types for panels and just add a DRM_MODE_CONNECTOR_PANEL type.
Not sure if there has been a conclusion on this.

> Make the protocol application specific and avoid implementation specifics.
> 
> 
>> + * struct gud_drm_req_get_connector_status - Connector status
> 
> How does this work if and when the status on the device changes?
> 

If that status can change, the device has to set
gud_drm_gadget_connector.flags |= GUD_DRM_CONNECTOR_FLAGS_POLL.
Now the host will poll the status every 10 seconds. Userspace is
notified about change in status.

> 
>> +/*
>> + * Internal monochrome transfer format presented to userspace as XRGB8888.
>> + * Pixel lines are byte aligned.
>> + */
>> +#define GUD_DRM_FORMAT_R1	fourcc_code('R', '1', ' ', ' ')
> 
> This is also a data format over USB, right? Then it's not really internal,
> because it also exists on the device. I have several uses for this, but
> none will be using Linux gadgets, rather microcontrollers.
> 

I can drop the word internal if it confuses, but any non-Linux
implementation will have to copy this header file and resolve the
dependencies. Like I did for my uC hack:
https://github.com/notro/gud/tree/master/STM32F769I-DISCO/USB_Device/MSC_Standalone/Inc

> 
>> +/* USB Control requests: */
>> +
>> +/*
>> + * If the host driver doesn't support the device protocol version it will send
>> + * the versions it supports starting with the latest. If the device isn't
>> + * backwards compatible or doesn't support the version the host suggests, it
>> + * shall return EPROTONOSUPPORT.
>> + */
>> +#define GUD_DRM_USB_REQ_SET_VERSION			0x30
> 
> USB devices report errors to a control requests with a STALL handshake,
> which is passed all the way back to the host software. Please use that?
> 
> How/where would the EPROTONOSUPPORT value be returned? It's another
> implementation specific, that should be used on the bus.
> 
> 
>> +/* Get supported pixel formats as an array of fourcc codes. See include/uapi/drm/drm_fourcc.h */
>> +#define GUD_DRM_USB_REQ_GET_FORMATS			0x40
> 
> Plus R1, right? I can understand if you don't want to add R1 to uapi, but
> then at least document that the array can contain both uapi codes and R1.
> 
> 
>> +/* Apply the prevoius _STATE_CHECK configuration */
>> +#define GUD_DRM_USB_REQ_SET_STATE_COMMIT		0x62
> 
> Typo -> previous
> 
> 
> 
> I hope this helps.
> 

Indeed it I does, it helps me revisit the decisions I've made and look
at them in a new light. I have looked at the code for so long that I
hardly see it anymore.

Noralf.
