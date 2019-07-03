Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4F65DDEA
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 08:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfGCGMt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 02:12:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:10477 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbfGCGMt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 02:12:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Jul 2019 23:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="362926028"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2019 23:12:47 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Bin Liu <b-liu@ti.com>, Jack Pham <jackp@codeaurora.org>,
        linux-usb@vger.kernel.org
Subject: Re: configfs on dwc3: msc enum failed if three functions defined
In-Reply-To: <20190702182050.GB20724@uda0271908>
References: <20190422134357.GA2071@uda0271908> <20190425224456.GA27553@jackp-linux.qualcomm.com> <20190702144842.GA20724@uda0271908> <20190702165122.GA15112@jackp-linux.qualcomm.com> <20190702175013.GB2724@uda0271908> <20190702182050.GB20724@uda0271908>
Date:   Wed, 03 Jul 2019 09:12:41 +0300
Message-ID: <87muhvd4ti.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Bin Liu <b-liu@ti.com> writes:

> On Tue, Jul 02, 2019 at 12:50:13PM -0500, Bin Liu wrote:
>> On Tue, Jul 02, 2019 at 09:51:22AM -0700, Jack Pham wrote:
>> > Hi Bin,
>> > 
>> > On Tue, Jul 02, 2019 at 09:48:42AM -0500, Bin Liu wrote:
>> > > Hi,
>> > > 
>> > > Sorry for the delay getting back on this. I was offline for quite some
>> > > time.
>> > > 
>> > > On Thu, Apr 25, 2019 at 03:44:57PM -0700, Jack Pham wrote:
>> > > > Hi Bin,
>> > > > 
>> > > > On Mon, Apr 22, 2019 at 08:43:57AM -0500, Bin Liu wrote:
>> > > > > Hi Felipe,
>> > > > > 
>> > > > > I am having an issue with dwc3 on TI AM57x device, and would like to ask
>> > > > > for your comments.
>> > > > > 
>> > > > > I use configfs to create a multi-function gadget on dwc3, mass_storage
>> > > > > is the last function, it seems if I create 3 functions, the mass_storage
>> > > > > enumeration will fail on the host. It works fine if only create 2
>> > > > > functions.
>> > > > > 
>> > > > > The dwc3 tracepoints log shows after all the ep0 transfers for
>> > > > > mass_storage, the very first epXin transfer is not complete - dwc3
>> > > > > programmed the urb, but never generates RX completion event. This also
>> > > > > matches the bus analyzer trace - dwc3 NAKs the very first IN token for
>> > > > > ever.
>> > > > > 
>> > > > > I use the attached script to create the gadget, The macro FUNCS in the
>> > > > > beginning of the script defines the functions to be created.
>> > > > > 
>> > > > > Any comments are appreciated.
>> > > > 
>> > > > A stab in the dark here but what is the value of GTXFIFOSIZ(X)[15:0]
>> > > > for epXin on your device? Is it at least wMaxPacketSize? Depending on
>> > > > the default hardware values it might be deficient as compared to the
>> > > > working endpoint that gets assigned in your 2-function config.
>> > > 
>> > > Jack,
>> > > 
>> > > thanks for the pointer, it is indeed the issue on AM57x device.  The
>> > > reset value of GTXFIFOSIZ for ep1~4 have size of 0x184, but ep5~15 have
>> > > only size of 0x13 (which is 120 bytes), which is not enough for
>> > > high-speed bulk xfers. I manually adjusted the fifo memory allocation,
>> > > now my test case works.
>> > 
>> > Cool! I'm glad my suggestion was on the right track.
>> >  
>> > > Felipe,
>> > > 
>> > > Is there anything the dwc3 gadget driver can do to better handle this
>> > > kind of devices, which don't have enough fifo buffers for all TX eps?
>> > 
>> > A long time ago...
>> > 
>> > commit bc5081617faeb3b2f0c126dc37264b87af7da47f
>> > Author: Felipe Balbi <felipe.balbi@linux.intel.com>
>> > Date:   Thu Feb 4 14:18:01 2016 +0200
>> > 
>> >     usb: dwc3: drop FIFO resizing logic
>> > 
>> >     That FIFO resizing logic was added to support OMAP5
>> >     ES1.0 which had a bogus default FIFO size. I can't
>> >     remember the exact size of default FIFO, but it was
>> >     less than one bulk superspeed packet (<1024) which
>> >     would prevent USB3 from ever working on OMAP5 ES1.0.
>> > 
>> >     However, OMAP5 ES1.0 support has been dropped by
>> >     commit aa2f4b16f830 ("ARM: OMAP5: id: Remove ES1.0
>> >     support") which renders FIFO resizing unnecessary.
>> > 
>> >     Tested-by: Kishon Vijay Abraham I <kishon@ti.com>
>> >     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>> > 
>> > Prior to this there was a function dwc3_gadget_resize_tx_fifo(),
>> > enabled via DT flag, which enumerated all the endpoints and
>> > recalculated the TX FIFO sizes based on the transfer type of the
>> > EPs' configuration.
>> > 
>> > Unfortunately some Qualcomm SoCs are still plagued by having
>> > insufficient defaults, so we resort to carrying this function on our
>> > downstream kernels. It seems TI AM57x still has this problem too?

Why was I never told about this? We had ONE SoC that needed this feature
because of a known-bad silicon that was completely dropped from
mainline. Note that this commit was doing a "best-effort" at getting
something know-bad to work. There's no guarantee that we even have
enough FIFO space while configuring everything to 1024 bytes FIFO size.

If you to bring that back, please propose a patch, but it'll be
difficult to make it work reliably for everybody.

>> Yes, it appears to be the case.
>
> Wait, AM57x seems to be different. The issue mentioned in the commit
> above is about bogus FIFO size, but GTXFIFOSIZ on AM57x are correct. it
> is just that AM57x only has about total 13K+ FIFO memory, so only up to
> 4 TX endpoints which can have 3K FIFO, any use case which requires more
> than 4 TX endpoints will fail.

wait, your GTXFIFOSZ is configured for 3K? That's completely
unnecessary, even for high bandwidth highspeed isoc endpoints. Otherwise
we would use 16kiB FIFO size for bulk endpoints with burst enabled.

> So maybe the driver could have a sanity check on FIFO size when
> allocating endpoints?

We have a "sanity check". We read FIFO configuration from HW while
telling the framework what the endpoint can do. Now, if you during
coreConsultant the core was badly configured, then the driver doesn't do much.

static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
{
	struct dwc3 *dwc = dep->dwc;
	int mdwidth;
	int kbytes;
	int size;

	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
	/* MDWIDTH is represented in bits, we need it in bytes */
	mdwidth /= 8;

	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1));
	if (dwc3_is_usb31(dwc))
		size = DWC31_GTXFIFOSIZ_TXFDEF(size);
	else
		size = DWC3_GTXFIFOSIZ_TXFDEF(size);

	/* FIFO Depth is in MDWDITH bytes. Multiply */
	size *= mdwidth;

	kbytes = size / 1024;
	if (kbytes == 0)
		kbytes = 1;

	/*
	 * FIFO sizes account an extra MDWIDTH * (kbytes + 1) bytes for
	 * internal overhead. We don't really know how these are used,
	 * but documentation say it exists.
	 */
	size -= mdwidth * (kbytes + 1);
	size /= kbytes;

	usb_ep_set_maxpacket_limit(&dep->endpoint, size);

	dep->endpoint.max_streams = 15;
	dep->endpoint.ops = &dwc3_gadget_ep_ops;
	list_add_tail(&dep->endpoint.ep_list,
			&dwc->gadget.ep_list);
	dep->endpoint.caps.type_iso = true;
	dep->endpoint.caps.type_bulk = true;
	dep->endpoint.caps.type_int = true;

	return dwc3_alloc_trb_pool(dep);
}


-- 
balbi
