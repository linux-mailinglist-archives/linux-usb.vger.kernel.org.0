Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22381EB295
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 02:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbgFBAMR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 20:12:17 -0400
Received: from foo.stuge.se ([212.116.89.98]:46022 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726181AbgFBAMR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jun 2020 20:12:17 -0400
Received: (qmail 17172 invoked by uid 1000); 2 Jun 2020 00:12:07 -0000
Message-ID: <20200602001207.17171.qmail@stuge.se>
Date:   Tue, 2 Jun 2020 00:12:07 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf,

Thanks a lot for going into more detail.

Noralf Trønnes wrote:
> > Several Linux/DRM internals have "leaked" into the USB protocol - this
> > should be avoided if you want device implementations other than your
> > gadget, because those internals can change within Linux in the future,
> > while the protocol must not.
> > 
> 
> That's intentional, I see no point in recreating uapi values that won't
> change:
> 
> Linux errno: /include/uapi/asm-generic/errno{-base,}.h
> Pixel formats: include/uapi/drm/drm_fourcc.h
> Connector types and status: include/uapi/drm/drm_mode.h

I understand, and it's good that these are uapi values, but I will still
disagree with using errno and DRM connector types in the USB protocol,
which is a "namespace" of its own.

That is an important point here; GUD is three things: a Linux DRM driver,
a Linux gadget driver and a USB protocol. USB protocols (good ones) are
OS-agnostic.


> >> If the device transfer buffer can't fit an uncompressed framebuffer
> >> update, the update is split up into parts that do fit.
> > 
> > Does "device transfer buffer" refer to something like display RAM on
> > the device side? If so, its size is a device implementation detail
> > which shouldn't be exposed over USB.
> 
> The reason for exposing this is that the Linux gadget driver needs to
> decompress the transfer into a buffer and the host needs to know how big
> this is (the host can choose to lower this if it can't allocate a
> continuous buffer of this size).

I understand; so it's only required for some compression types - then
it should at least be completely optional, but in any case I find
exposing/having to expose this to be awful USB protocol design and I
hope we can find a better way.

Maybe it's premature anyway? How would you feel about skipping compression
to begin with?


> lz4 (in the kernel) is block compression and can't be used for
> decompressing just a stream of bytes. There is a lz4 frame protocol
> which looks like it could be useful, but it's not available in the
> kernel. I hardly know anything about compression so I'm in no position
> to add that to the kernel. Maybe someone will add it at a later time if
> it is useful.

Why did you choose to use lz4?

Whether compression comes now or later, maybe there is a more suitable
algorithm?


> > The R1 idea is great!
> 
> My plan was to remove R1 support from this version of the patchset, but
> I forgot. The reason is that it's cumbersome to test when the gadget
> driver doesn't support it.

Why not support R1 also in the gadget?


> You mention further down that you have use cases for this, do you have a
> timeplan for when you will make use of R1?

No strict plan, but if it helps I could make a demo device and -firmware
without much effort. You mentioned that you would like to have a
microcontroller device for testing?


> >> - Use donated Openmoko USB pid
> > 
> > If Linux will be the reference for this protocol then perhaps a PID
> > under the Linux Foundation VID (1d6b) makes more sense?
> 
> Do they hand out pid's?

I don't know. :) The root hub drivers each have one.


> To me it's no big deal, it can be added later if someones cares about it.

Okay, hopefully we can do without a PID anyway.


> > But: A PID applies on device level, not to interfaces.
> 
> Indeed. This is a USB interface driver though, so it only looks at
> vendor class interfaces. Then it checks if there's a bulk out endpoint,
> if not it returns -ENXIO and the device subsytem moves on to another
> interface driver if any. Next it tries to fetch the display descriptor
> and if not succesful it returns -ENODEV to give another driver a chance.

Thanks for clarifying this flow. It's nice not to require particular
endpoint addresses - that makes the protocol/driver much more generic.


> I have tried my best to let the driver tolerate other vendor class
> interfaces on the device.

Ack, this is clear now.


> I don't understand why PID should not be necessary, I'm using a vendor
> class interface and the driver can't probe all of those, so it has to
> look at specific vid:pid's.

Why can't the driver probe all vendor class interfaces?

To probe fewer interfaces, a criteria other than PID can still be defined,
and doing so would enable immediate plug-and-play for non-gadget and especially
composite devices, without requiring the addition of PIDs in the host driver.

I find this possibility especially attractive for composite devices, which
may already have some VID:PID and a non-GUD primary function/interface that
is handled by another driver, such that a GUD PID effectively can't be adopted
for that device.

One example of such a criteria would be to require that the iInterface
string descriptor contains the (sub)string "Generic USB Display".


> I have tried together with a HID interface and that worked.

Great. Thanks!


> >> +static int gud_get_vendor_descriptor(struct usb_interface *interface,
> >> +				     struct gud_drm_display_descriptor *desc)
> >> +{
> > ..
> >> +	ret = gud_drm_usb_control_msg(usb, ifnum, true, USB_REQ_GET_DESCRIPTOR,
> >> +				      GUD_DRM_USB_DT_DISPLAY << 8, buf, sizeof(*desc), false);
> > 
> > GUD_DRM_USB_DT_DISPLAY is defined as (USB_TYPE_VENDOR | 0x4),
> > but USB_TYPE_VENDOR only applies to bmRequestType[6:5] in control transfers,
> > nowhere else. I know of no standardized way to introduce vendor-specific
> > descriptors. Squatting is possible, but I think it would be nice to do
> > better here. It is easy enough.
> > 
> > It could be argued that the vendor specific interface gives flexibility here,
> > but actually it just means that the semantics of the standardized and
> > well-defined USB_REQ_GET_DESCRIPTOR have been duplicated by this protocol,
> > that is not very common - but if you want to go ahead then at least drop
> > USB_TYPE_VENDOR from the GUD_DRM_USB_DT_DISPLAY definition.
> 
> I liked that it is well defined and understood, so I didn't have to be clever.

I tried to explain that it is only well defined for the standardized
GET_DESCRIPTOR request with device recipient. The concept "descriptor"
isn't used anywhere else by other USB protocols that I know.

There are various class-specific descriptors, but they are all standardized
in USB-IF device class specs, and all of them are only ever retrieved by the
standardized GET_DESCRIPTOR request.

Because of that it's actually rather confusing to me to refer to the display
data structure as a descriptor and even use the standardized descriptor header
and naming convention when it is actually /not/ a descriptor, since it isn't
standardized and isn't retrievable with the standardized GET_DESCRIPTOR
request. Does that make sense?


> I like it and think I'll keep it, so I'll change the macro:
> 
> #define GUD_DRM_USB_DT_DISPLAY 0x44

Okay. The number is arbitrary, since a control request directed to a vendor
specific interface is vendor specific "by inheritance", thus also arbitrary.


> > Maybe it's good to think about the data exchange some more - anything not
> > transfered by standardized USB_REQ_GET_DESCRIPTOR (bmRequestType 10000000B;
> > Device-to-host data, Standard type, Device recipient) isn't actually
> > a descriptor, it's vendor-specific, free-format data. Does that enable
> > any simplifications?
> 
> Actually it is:
> 
> 	u8 requesttype = USB_TYPE_VENDOR | USB_RECIP_INTERFACE;

Right; it's a Vendor-Specific type, Interface recipient request, thus not
the standardized USB_REQ_GET_DESCRIPTOR, and thus the data is not actually
a descriptor, hence why calling it one is confusing to me.


> see gud_drm_usb_control_msg(). I could add
> GUD_DRM_USB_REQ_GET_DESCRIPTOR instead of using USB_REQ_GET_DESCRIPTOR
> if that makes it any clearer.

That would be an improvement, but I would really wish for different
terminology all together.


> >> +static int gud_usb_get_status(struct usb_device *usb, u8 ifnum)
> >> +{
> >> +	struct gud_drm_req_get_status *status;
> >> +	int ret, status_retries = 2000 / 5; /* maximum wait ~2 seconds */
> >> +	unsigned long delay = 500;
> >> +
> >> +	status = kmalloc(sizeof(*status), GFP_KERNEL);
> >> +	if (!status)
> >> +		return -ENOMEM;
> >> +
> >> +	/*
> >> +	 * Poll due to lack of data/status stage control on the gadget side.
> > 
> > I hope we can find something better here.
> > 
> > Doesn't gadgetfs allow userspace to (indirectly) control the status stage,
> > as I wrote above?
> 
> For read requests the device is stalling in case of error and the host
> issues a status request.

Sorry, I can't quite understand this.

Does read mean IN or OUT?

And what does "the host issues a status request" mean? Status is the final
stage in each (control request) transaction. I'm a bit confused here.


> For write requests the only thing I've found is a way to delay the
> status stage, but only for requests without payload:
..
> drivers/usb/gadget/composite.c: composite_setup():

The way I read composite_setup() after try_fun_setup: it calls f->setup()
when available, and that can return < 0 to stall.

I expect that composite_setup() and thus f->setup() run when the
SETUP packet has arrived, thus before the data packet arrives, and if
composite_setup() stalls then the device/function should never see the
data packet.

For an OUT transaction I think the host controller might still send
the DATA packet, but the device controllers that I know don't make it
visible to the application in that case.


> And I can't stall, only continue:
..
> If I could control the status stage and stall after data was received,
> then I wouldn't need my own status stage.

It looks to me like the function can stall.

In any case I think the delayed thing+continue is the wrong path.


> >> +	 * If we did not use polling and gave up here after waiting 2 seconds,
> >> +	 * the worker in the gadget would finally get to queuing up the status
> >> +	 * respons, but by that time the host has moved on. The gadget side
> >> +	 * (at least dwc2) would now be left in a non-recoverable state.
> > 
> > Independently of the above, how does the gadget become non-recoverable?
> 
> It stops responding to requests.
> 
> > If a transfer times out on the host without other error then the device
> > has replied with NAK in the data stage transactions sent by the host
> > until the host stopped trying. The device controller then sees no
> > further data stage transactions and shouldn't be in a weird state?
> 
> I don't know why it doesn't respond, it could be a controller driver
> (dwc2) bug, but I'm no expert here.

It would be useful to investigate this in more detail. 

And I think it would be useful to have another, independent, device
implementation. I could help with that.


> Actually this is the first work I've ever done with USB.

I think it's a very ambitious first USB project, but it is a fun idea! :)

I would like it if we can iterate to something really generic that takes
advantage of all that USB offers.


> > If this get_status thing is in fact really really required then how about
> > adding an interrupt IN endpoint for it? I think that would be cleaner and
> > it costs less bus time with arguably lower latency. See e.g. usblp.
> 
> I couldn't find interrupt ep used in drivers/usb/class/usblp.c, but I've
> seen examples of this used for status.

Sorry, yes, in usblp it is a bulk endpoint, it was more about the pattern
of a status endpoint.


> I'm a bit wary of using more endpoints since I suspect that
> microcontrollers don't have that many.

It was true for some early microcontrollers with USB, but I haven't
seen one in many years with less than six endpoints, and usually they
have more. Some really old 8-bit ones even allowed using all 32 possible
endpoints, more than many modern IP blocks.


To me it is critical to remove this status polling, because as I wrote,
the lowest level protocol already implements very good flow control,
the application protocol just needs to use it, not invent its own.


> I also realise now that I don't need the PENDING flag, I can just keep
> stalling the status request until the device is done.

That's heading in the right direction, but the transaction should be
NAKed rather than STALLed.

Think of NAK as EAGAIN and STALL more like EPIPE. The former is "not yet"
while the latter signals that there was an actual error.

It looks like composite_setup() might indeed not support NAK, that would
be a bug/missing feature in the gadget code, but I may also just be reading
it wrong. Either way it doesn't justify polling in the application protocol.

In addition to being redundant, such polling generates constant application-
level noise on the bus, causes unneccessary wakeups and is very annoying when
looking at packet captures e.g. from usbmon. We should avoid that.


> >> +	shmem->map_cached = true;
> > 
> > Can you explain what this does exactly?
> 
> Not excatly, but I can try rather vaguely :-) The memory subsystem is a
> black box to me. It has to do with the memory page attribute that
> controls how memory access is handled by the CPU cache. The default for
> shmem is WriteCombined which makes for slow read access on ARM, but on
> x86 there doesn't seem to be any penalty judging by my brief testing.

Hmm. ARM often (always?) can't do byte-aligned access, only 32-bit access.
Do you know if and how the buffer is aligned? Maybe this can make a difference?


> >> +static int gud_drm_probe(struct usb_interface *interface,
> >> +			 const struct usb_device_id *id)
> >> +{
..
> >> +		/* Check if the device can support us */
> >> +		*version = 1;
> >> +		ret = gud_drm_usb_control_msg(usb, ifnum, false, GUD_DRM_USB_REQ_SET_VERSION,
> >> +					      0, version, sizeof(*version), true);

A more USB:y way would btw. be to report the highest supported protocol
version to the host in some data structure.

This too could be the iInterface string descriptor.


> > Could't this work without _get_status()? What does usb_control_msg()
> > return for a STALL handshake in the data stage?
> 
> It returns -EPIPE, but as mentioned above, I can't stall a control write
> request with payload.

Please check this? It looks to me like it would be possible.


> > And would it make sense to expose the protocol (names, structures) in uapi?
> 
> No, since it's not for userspace.

Okay.


> > Or at least in Documentation/ ?
> 
> Ideally I would have written a spec and made the implementation against it.
> However since I suck at writing, I even struggle with getting the compiler
> to understand me, so it won't happen. It would have taken me forever.

I have a template for USB protocols that I could use, perhaps we can make
that spec a reality. I think it would be quite valuable, to help folks
outside Linux who may also want to create a generic usb display.


> >> +static size_t gud_drm_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format,
> >> +				       void *src, struct drm_framebuffer *fb,
> >> +				       struct drm_rect *rect)
> >> +{
> > ..
> >> +	buf = kmalloc(width * height, GFP_KERNEL);
> >> +	if (!buf)
> >> +		return len; /* To keep logic simple, just transmit garbage */
> > 
> > Ouch! Shouldn't this bubble up somehow? If there is memory pressure
> > then I really think something above should fail.

No comment on this?



> >> +static int gud_drm_fb_flush(struct gud_drm_device *gdrm, struct drm_framebuffer *fb,
> >> +			    const struct drm_format_info *format, struct drm_rect *rect)
> >> +{
> > 
> > This is in the hot path, right?
> 
> Indeed, the most important one. All the other paths can take "as long"
> as they want, but this one "shows up" on the display.
> 
> > 
> >> +	ret = gud_drm_usb_set(gdrm, GUD_DRM_USB_REQ_SET_BUFFER, 0, &req, sizeof(req));
> >> +	if (ret)
> >> +		goto vunmap;
> >> +
> >> +	ret = usb_bulk_msg(gdrm->usb, gdrm->bulk_pipe, gdrm->bulk_buf, trlen,
> >> +			   &actual_length, msecs_to_jiffies(3000));
> > 
> > I would definitely change this pattern so that the hot path has only bulk
> > transactions, ideally a single transfer. The control transfer wastes
> > precious bus time in the hot path.
> > 
> > Maybe it's insignificant with FHD data but then again, the more data
> > the less overhead we want, and in any case for small R1 data the
> > control transfer is easily more expensive than the data itself!
> > 
> > A control transfer somehow compares to an ioctl() from userspace with
> > much context switching, while a bulk transfer is more like mmaped kernel
> > memory or aio.
> > 
> > Why not just add the values in struct gud_drm_req_set_buffer as a header
> > before the data instead?
> > 
> > That would mean two bulk transfers, but they could be asynchronous, at least
> > the first, but making both async would also fit more data onto the bus.
> > Maybe later.
> 
> GUD_DRM_USB_REQ_SET_BUFFER serves one purpose in addition to sending the
> header, as mentioned in the comment preceeding it, it waits for any
> ongoing decompression/copying on the device from the previous fb flush.

So even more application-level flow control. Please let's make sure that
the protocol will simply rely on the low-level flow control here as well.


> lz4 decompression is much faster than compression, but the host will be
> much more powerful than the device, so the host will almost always have
> to wait for the device when flushing continously.

One design objective for USB is indeed strong host+weak device and the
low-level flow control applies particularly well in this case. The device
explicitly informs the host that it is not ready for data using NAK.


> Yes you're right, the overhead is insignificant for FHD, 4-500 usec for
> the actual control messages (including status message) vs. 50-100ms for
> the total operation (depending on how well it compresses).
> 
> But why should this overhead be of concern for a display that has a
> framebuffer transfer of 4-8kB? It will be more than fast enough.

Mm, insignificant there as well, but in both cases it's not optimal,
and that without good reason.

Besides that, it also causes unneccessary synchronization/bus scheduling
complexity and wastes bandwidth. Control transfers and bulk transfers are
scheduled to wire time according to different rules, with control requests
taking priority over bulk in case of contention.

A control request occupies more bus time than a NAKed bulk data transaction.

Finally, besides application level flow control simply being wrong it's doubly
wrong to use the control pipe to implement flow control for a bulk pipe; those
two pipes are completely independent bus channels, and shouldn't be interlocked
without an exceptionally good reason and flow control isn't it.


> >> + * struct gud_drm_req_get_connector - Connector descriptor
> >> + * @connector_type: Connector type (DRM_MODE_CONNECTOR_*)
> >> + * @flags: Flags
> >> + * @num_properties: Number of supported properties
> >> + */
> >> +struct gud_drm_req_get_connector {
> >> +	__u8 connector_type;
> > 
> > This is intended for the (Generic) USB Display to report the connector type
> > used for its panel, right? It should not use Linux/DRM-internal values such
> > as DRM_MODE_CONNECTOR_SPI to do so, if it wants to be generic and stable
> > over time.
> 
> DRM_MODE_CONNECTOR_SPI is uabi from include/uapi/drm/drm_mode.h

Sorry - that wasn't clear to me, and that's better than internal values,
but it's still not great to declare that this USB protocol value is
locked to anything else.

It would be better to define these values independently. As long as it is
possible they can of course use the same values as the uapi, but I will
argue that they should be able to diverge, because this USB protocol idea
doesn't inherently have anything to do with Linux.


> > Why does the host software need to know anything about the connector
> > inside the device, anyway? With a microcontroller that could be anything,
> > especially with actual R1 displays.
> > 
> > Would it make sense to introduce DRM_MODE_CONNECTOR_USB on the host, and
> > keep this implementation detail in the device?
> 
> For display adapters it makes sense especially when it has more than one
> connector like the Raspberry Pi which has an hdmi and a sdtv connector.

Right, a GUD device could have multiple connectors, I guess with one USB
interface per connector, but again, what does the host really need to know
about the connector beyond the supported pixel format(s)?

Thanks for mentioning SDTV - I wasn't sure about the rationale for those
TV parts in the patch. Can you elaborate on that?

If the idea is in fact to create "Linux DRM over USB" then by all means
go for it, but in that case please don't call it generic.


> For display panels the connector is USB yes, but there's no type for
> this yet. There's a discussion going on if we should stop adding
> connector types for panels and just add a DRM_MODE_CONNECTOR_PANEL type.
> Not sure if there has been a conclusion on this.

Ack. That does sound like it could be useful for the DRM GUD driver.


> > Make the protocol application specific and avoid implementation specifics.
> > 
> > 
> >> + * struct gud_drm_req_get_connector_status - Connector status
> > 
> > How does this work if and when the status on the device changes?
> 
> If that status can change, the device has to set
> gud_drm_gadget_connector.flags |= GUD_DRM_CONNECTOR_FLAGS_POLL.
> Now the host will poll the status every 10 seconds.

I understand - this is another place where the application requirements call
for an interrupt status endpoint. I think it should be one and the same
endpoint for all status changes.


> >> +/*
> >> + * Internal monochrome transfer format presented to userspace as XRGB8888.
> >> + * Pixel lines are byte aligned.
> >> + */
> >> +#define GUD_DRM_FORMAT_R1	fourcc_code('R', '1', ' ', ' ')
> > 
> > This is also a data format over USB, right? Then it's not really internal,
> > because it also exists on the device. I have several uses for this, but
> > none will be using Linux gadgets, rather microcontrollers.
> 
> I can drop the word internal if it confuses,

I think that would be a big improvement.


> but any non-Linux implementation will have to copy this header file
> and resolve the dependencies. Like I did for my uC hack:
> https://github.com/notro/gud/tree/master/STM32F769I-DISCO/USB_Device/MSC_Standalone/Inc

I think it would be better to document the value instead.


> > I hope this helps.
> 
> Indeed it I does, it helps me revisit the decisions I've made and look
> at them in a new light. I have looked at the code for so long that I
> hardly see it anymore.

I know the feeling and I'm glad to help, but only if the goal is indeed
to create a generic USB:y protocol, mostly if not completely free of Linux
details.

If you're actually after something more closely tied to Linux/DRM then
that's also a fun idea, but much less relevant for me.



Thanks and kind regards

//Peter
