Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452AC33349C
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 05:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhCJE4I convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 9 Mar 2021 23:56:08 -0500
Received: from foo.stuge.se ([212.116.89.98]:38048 "EHLO foo.stuge.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232400AbhCJEzu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 23:55:50 -0500
Received: (qmail 28962 invoked by uid 1000); 10 Mar 2021 04:55:44 -0000
Message-ID: <20210310045544.28961.qmail@stuge.se>
Date:   Wed, 10 Mar 2021 04:55:44 +0000
From:   Peter Stuge <peter@stuge.se>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     hudson@trmm.net, markus@raatikainen.cc,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        th020394@gmail.com, lkundrak@v3.sk, pontus.fuchs@gmail.com,
        sam@ravnborg.org
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <330c580d-de8f-7362-211b-eaf80b166421@tronnes.org>
 <59bf10c7-91aa-ba09-7128-91e87272e29e@tronnes.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Noralf Trønnes wrote:
> > The u16 index parameter to gud_usb_transfer() and at least also 
> > gud_usb_{get,set,get_u8,set_u8}() is eventually passed in u16 value
> > in the call to gud_usb_control_msg(), which had me confused for a bit.
> > 
> > What do you think about renaming all of those parameters to wValue,
> 
> Only connector requests use this value and in that case it's the
> connector index. I need to get this driver applied now, and can't
> spend more time polishing it, so I'll just keep it as-is.

Okay.


> > I found this because I can't get my device to send 0 bytes IN when
> > the host requests more, if I provide no data the request STALLs. This
> > is for sure a bug in my device
..
> > What do you think about formalizing this, adding an actual dummy property?
> 
> I want to avoid that.

Ack. I too prefer not adding workarounds, this needs to be fixed in
my device, but I wanted to bring it up.


> I'd rather add a descriptor flag GUD_DISPLAY_FLAG_CANT_RETURN_ZERO or
> something for such devices.
> Also this property warning is just a debug message so not a very big
> problem.

I'd rather not squat a currently-unused property that may be allocated
later.


> Worse is EDID if you don't want to support that since it prints
> an error in that case.

I'll fix my device. If that proves impossible I can still add EDID bytes.


> > Or maybe adding flags to the display descriptor for "I have properties",
> > "I have connector properties" and "I have EDID" ?
> 
> Then I might as well go back to the previous version and have count in
> the structs won't I ;)

That's true. Forget the workarounds.


> gud_xrgb8888_to_color() handles that, although broken in this version
> for partial updates. Here's the fix:
> https://gist.github.com/notro/a94d381cf98b7e15fcddbc90e4af0a21

Thanks.


> I've chosen to only print probe errors, flush errors and devices
> returning incorrect reply lengths. I hate drivers that fill the logs
> with errors, but I might have gone to far on the silent side, I don't
> know. But one nice thing about DRM is that debug is always builtin and
> can be enabled.

I think you've struck a good balance. The error messages I've seen were
all unique and immediately led me to the right place in the driver.
That's really helpful.


> > Finally, here's the drm debug output when I connect my device:
..
> > It looks good, I think? However, neither GUD_REQ_SET_CONTROLLER_ENABLE
> > nor GUD_REQ_SET_DISPLAY_ENABLE is ever called, and there is no bulk
> > output if I write to /dev/fb0.
> > 
> > Can you tell what's missing?
> 
> IIRC you need ioctl FBIOPUT_VSCREENINFO to enable the pipeline. You can
> use 'con2fbmap' to put a console on the fbdev or use 'fbi' to show an
> image. They will do the necessary ioctls.

Thanks for the hints! I've used fbi, but remembered writing directly
to /dev/fb0 without ioctl:s. I think that must have been after the
console had already been moved to the framebuffer and thus activated
the pipe. I dug up a version of fbset which calls that ioctl.


> I use modetest for simple testing:
> https://github.com/notro/tinydrm/wiki/Development#modetest

Ack, libdrm just has an inconveniently long dependency tail for my
test environment. But fbset + dd works.


> I have made tool that employs usbmon to show what happens just outside
> the wire (runs on the host):
> https://github.com/notro/gud/blob/master/tools/monitor.py
> I haven't got a proper USB analyser, so this was second best.

Nice idea! I've been using usbmon as well during development, it's great.
I find a hardware analyzer is only really neccessary for lowlevel problems
like my no-0-bytes bug.


> Depending on how long it takes for the DMA mask dependency patch to show
> up in drm-misc-next, I will either publish a new version or apply the
> current and provide patches with the necessary fixes.

I look forward to it landing.


> This is one of those things that would never have happened if I knew
> how long it would take :)

Thanks again for working on this great idea! I'm happy that I can help.


Noralf Trønnes wrote:
> > Depending on how long it takes for the DMA mask dependency patch to show
> > up in drm-misc-next, I will either publish a new version or apply the
> > current and provide patches with the necessary fixes. 
> 
> In case I apply this version, are you happy enough with it that you want
> to give an ack or r-b?

I've now tested R1 and RGB111 and I think I've found two more things:

I didn't receive the expected bits/bytes for RGB111 on the bulk endpoint,
I think because of how components were extracted in gud_xrgb8888_to_color().

Changing to the following gets me the expected (X R1 G1 B1 X R2 G2 B2) bytes:

			r = (*pix32 >> 8) & 0xff;
			g = (*pix32 >> 16) & 0xff;
			b = (*pix32++ >> 24) & 0xff;


Then, gud_xrgb8888_to_color() and maybe even gud_xrgb8888_to_r124() seem
to be host endian dependent, at least because of that pix32, but maybe more?
I don't know whether drm guarantees "native" XRGB byte sequence in memory,
then I guess the pix32 is okay? Please take a look?


Finally my very last ask: Please consider renaming GUD_PIXEL_FORMAT_RGB111
to GUD_PIXEL_FORMAT_XRGB1111?

Someone may want to add the bit fiddling to output actual RGB111 data
later, then that name would be occupied, and XRGB1111 would describe
the current data format more accurately.


With the two ret=0 fixes, your gist and the three things above addressed
I'm happy to say:

Reviewed-By: Peter Stuge <peter@stuge.se>


R1 and RGB111 are: (if v8 perhaps for a separate RGB commit)

Tested-By: Peter Stuge <peter@stuge.se>



Later I think there's good potential for performance optimization. I
noticed that the drm pipe flush submits the frame as 64 byte bulk
transfers, which becomes slow. The USB stack can take at least 16kb
if not far more and will split as needed. The split into single
64-byte bulk packets is even done by the host controller hardware
if it is given the chance. Some numbers:

usbmon during drm flush of 400x240 RGB111 (48000 byte) shows 750ms
from first submit to last complete:

c1b883c0 0.503674 S Bo:4:022:1 - 64 =
4f7f2900 1.254213 C Bo:4:022:1 0 64 >

A simple userspace program with one libusb_bulk_transfer() call needs
just 300ms for the same data (libusb splits it into 3x16kb transfers):

$ time ./bo < test266.xrgb1111
will output 48000 bytes

real    0m0.298s
user    0m0.002s
sys     0m0.008s

$ 

The display is slow, but the difference is noticeable. Something for later.


Kind regards

//Peter
