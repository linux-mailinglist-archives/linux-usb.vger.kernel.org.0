Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F6C26D477
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 09:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbgIQHSd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 03:18:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgIQHSc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 03:18:32 -0400
Received: from coco.lan (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 002B12072E;
        Thu, 17 Sep 2020 07:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600327106;
        bh=3I60/8uee5JdTC1wzIM0oifYi5h2PnGd3DovxMRXkrk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0cLAmgIV0JzEar4JMGHLpAWNNqQa3GziotUuRM9TmL33nbyi3WRIyIwK7hiI4pYfN
         fno0GuzDnQ4yZEqD1mp2yXnfhnQMmGBCzZXy06jR5wtrv6r5SOj/0fbl+9X4zgek9o
         Z5qjIPFeBOxCvZwrXCN5Ey3DGGIgqzdHZ8THSmPs=
Date:   Thu, 17 Sep 2020 09:18:21 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>, Felipe Balbi <balbi@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: document a new quirk for dwc3
Message-ID: <20200917091821.0de18caa@coco.lan>
In-Reply-To: <20200915163814.GA2084568@bogus>
References: <cover.1599549364.git.mchehab+huawei@kernel.org>
        <cb821a8b5ef2d44ce32c8ce1d01c34b7afb70eb2.1599549364.git.mchehab+huawei@kernel.org>
        <20200915163814.GA2084568@bogus>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Em Tue, 15 Sep 2020 10:38:14 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Tue, Sep 08, 2020 at 09:20:57AM +0200, Mauro Carvalho Chehab wrote:
> > At Hikey 970, setting the SPLIT disable at the General
> > User Register 3 is required.
> > 
> > Without that, the URBs generated by the usbhid driver
> > return -EPROTO errors. That causes the code at
> > hid-core.c to call hid_io_error(), which schedules
> > a reset_work, causing a call to hid_reset().
> > 
> > In turn, the code there will call:
> > 
> > 	usb_queue_reset_device(usbhid->intf);
> > 
> > The net result is that the input devices won't work, and
> > will be reset on every 0.5 seconds:
> > 
> > 	[   33.122384] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0002
> > 	[   33.378220] usb 1-1.1: reset low-speed USB device number 3 using xhci-hcd
> > 	[   33.698394] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0000
> > 	[   34.882365] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0002
> > 	[   35.138217] usb 1-1.1: reset low-speed USB device number 3 using xhci-hcd
> > 	[   35.458617] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0000
> > 	[   36.642392] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0002
> > 	[   36.898207] usb 1-1.1: reset low-speed USB device number 3 using xhci-hcd
> > 	[   37.218598] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0000
> > 	[   38.402368] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0002
> > 	[   38.658174] usb 1-1.1: reset low-speed USB device number 3 using xhci-hcd
> > 	[   38.978594] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0000
> > 	[   40.162361] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 0002
> > 	[   40.418148] usb 1-1.1: reset low-speed USB device number 3 using xhci-hcd
> > 	...
> > 	[  397.698132] usb 1-1.1: reset low-speed USB device number 3 using xhci-hcd
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> > index d03edf9d3935..1aae2b6160c1 100644
> > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > @@ -78,6 +78,9 @@ Optional properties:
> >  			park mode are disabled.
> >   - snps,dis_metastability_quirk: when set, disable metastability workaround.
> >  			CAUTION: use only if you are absolutely sure of it.
> > + - snps,dis-split-quirk: when set, change the way URBs are handled by the
> > +			 driver. Needed to avoid -EPROTO errors with usbhid
> > +			 on some devices (Hikey 970).  
> 
> Can't this be implied by the compatible string? Yes we have quirk 
> properties already, but the problem with them is you can't address them 
> without a DT change.

Short answer:

While technically doable, I don't think that this would be a good idea.

-

Long answer:

The first thing is related to the compatible namespace: should such
quirk be added at SoC level or at board level?

I don't know if the need to disable split mode came from a different
dwc3 variant used by the Kirin 970 SoC, or if this is due to the way
USB is wired at the Hikey 970 board.

Right now, I'm assuming the latter, but Felipe suggested that this
might be due to a different version of the IP. Currently, we have
no means to check.

So, I'm placing all Hikey 970 specific quirks under the board-specific
part, e. g., at:

	arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts

This sounds more flexible, as, if some different hardware based on
the same chipset reaches upstream, it could use a different set of
quirks, if needed.

However, if we decide to bind quirks with compatible strings,
we need to know if we would create a board-specific compatible
or just SoC-specific ones.

-

Another possibility would be to add generic compatible bindings
for each quirk featureset. Right now the dwc3 core driver accepts
only two compatible strings:

       .compatible = "snps,dwc3"
       .compatible = "synopsys,dwc3"

And both are equivalent. No quirks are added there via compatible
strings.

Ok, we might start adding different compatible strings for different
sets of quirks, like:

	.compatible = "snps,dwc3-splitdisable"

but, this sounds really ugly, specially when multiple quirks
would be required.

We might also deprecate the usage of "snps,dwc3"/"synopsys,dwc3",
in favor of SoC-specific and board-specific compatible strings, 
but that would add a long list of boards there, with lots of code
to set quirks. IMHO, it is a lot nicer to rely on DT to enable
or disable those SoC and board-specific optional features of the
Designware IP.

-

In the specific case of Hikey 970, there are two other
alternatives:

1) we ended needing to create a new compatible for the Kirin 970
SoC, for it to be probed via this driver:

	drivers/usb/dwc3/dwc3-of-simple.c

as, otherwise an async ARM error happens, making the SoC to
crash. All dwc3-of-simple driver does is to use a different 
code for initializing the clocks.

However, dwc3-of-simple driver is completely independent from
dwc3: it doesn't pass platform data to the main dwc3 driver. 
So, it doesn't propagate any quirk to the main driver. 

One possible hack would be to make dwc3 driver to also
accept platform data, using it as an interface for the
dwc3-of-simple to pass quirks.

If we go on that direction, we could also remove all other
quirks from Kirin 970 dwc3, coding them inside the driver,
instead of using DT, e. g. the driver would do something like:

	if (of_device_is_compatible(np,
				   "hisilicon,hi3670-dwc3")) {
		cfg->dis_split_quirk = true;
		cfg->foo = true;
		cfg->bar = true;
		...

	}

such change would require a re-design at the logic around
dwc3_get_properties(), as the driver should start accepting
quirks either from platform_data or from DT (or both?).

2) Because this specific device uses the dwc3-of-simple driver, 
the actual DT binding is:

	usb3: hisi_dwc3 {
		compatible = "hisilicon,hi3670-dwc3";
	...
		dwc3: dwc3@ff100000 {
			compatible = "snps,dwc3";
	...
		};
	};


For boards that use dwc3-of-simple drivers, we could add a hack
at the dwc3 core that would seek for the parent's device's 
compatible string with something like (not tested):

	if (of_device_is_compatible(pdev->parent->dev.of_node,
				   "hisilicon,hi3670-dwc3"))
		dwc->dis_split_quirk = true;

It should be noticed that both platform_data and pdev->parent
alternatives will only work for boards using dwc3-of-simple driver.
This could limit this quirk usage on future devices.

-

IMO, adding a new quirk is cleaner, and adopts the same solution
that it is currently used by other drivers with Designware IP.

Thanks,
Mauro
