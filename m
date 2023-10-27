Return-Path: <linux-usb+bounces-2258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40BF7D9586
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 303E71C21012
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 10:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46451119D;
	Fri, 27 Oct 2023 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CDSQ5ljs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1068489;
	Fri, 27 Oct 2023 10:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1405CC433C8;
	Fri, 27 Oct 2023 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698403718;
	bh=pdqyUpjnJETQTTg6qumMQ/p4tHoLqFJ17ihizDcU5q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDSQ5ljsEcWX+HUq4rJfeBOytD0XpDlZRJ1xeD5gRtzx9dZO/vzijYCroJKiY7Kd6
	 twy4kIYSJWoczXhGWP7Xn/K2tKcxNJtJTdrCVuMdVFALdlbWYcgP1NZa0w7PlxyAlN
	 KLuSX4RSNL3ZK+ShiIE0u1N0dpOh34vDbRYorrlo=
Date: Fri, 27 Oct 2023 12:48:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-kselftest@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] kselftest: devices: Add board file for
 google,spherion
Message-ID: <2023102747-conclude-backside-a579@gregkh>
References: <20231024211818.365844-1-nfraprado@collabora.com>
 <20231024211818.365844-3-nfraprado@collabora.com>
 <2023102546-filled-onboard-3dfb@gregkh>
 <e49c63c4-2b24-4428-801c-1f854a98c593@notapiano>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e49c63c4-2b24-4428-801c-1f854a98c593@notapiano>

On Wed, Oct 25, 2023 at 08:32:42AM -0400, N�colas F. R. A. Prado wrote:
> On Wed, Oct 25, 2023 at 12:32:15PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 24, 2023 at 05:18:00PM -0400, N�colas F. R. A. Prado wrote:
> > > Add the list of devices expected to be probed from the USB and PCI
> > > busses on the google,spherion machine. The USB host controller at
> > > 11200000 is shared between two busses, for USB2 and USB3, so an
> > > additional match is used to select the USB2 bus.
> > > 
> > > Signed-off-by: N�colas F. R. A. Prado <nfraprado@collabora.com>
> > > ---
> > > 
> > >  tools/testing/selftests/devices/boards/google,spherion | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >  create mode 100644 tools/testing/selftests/devices/boards/google,spherion
> > > 
> > > diff --git a/tools/testing/selftests/devices/boards/google,spherion b/tools/testing/selftests/devices/boards/google,spherion
> > > new file mode 100644
> > > index 000000000000..ba86ffcfe43c
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/devices/boards/google,spherion
> > > @@ -0,0 +1,3 @@
> > > +usb camera 11200000,PRODUCT=.*/2/.* 1.4.1 1 0,1
> > > +usb bluetooth 11200000,PRODUCT=.*/2/.* 1.4.2 1 0,1
> > > +pci wifi 11230000 0.0/0.0
> > 
> > USB busses (and PCI ids) are not determinisitic and can, and will,
> > change values randomly.  So while it is nice to test "did the devices
> > show up properly", you can not do that based on bus ids at all, sorry.
> > 
> > Unless I'm reading these values wrong?  What are the fields
> > representing?  Perhaps a comment at the top to describe them so that we
> > know how to parse them?
> 
> Hi Greg,
> 
> I have described the fields in the commit message of patch 1. Here they are:
> 
> usb <test_name> <controller_address>[,<additional_match>] <ports_path> <configuration> <interfaces>
> 
> pci <test_name> <controller_address> <device-function_pairs_path>

That's not a good place to document them, we'll never find them, and I
obviously missed it as well.

Please put it in a comment at the top of this file _AND_ in a comment in
the script that parses these files.

> I'm aware that bus IDs are assigned at runtime, and that's exactly why I've
> avoided those in the test definitions, instead describing the hardware topology,
> which won't ever change.
> 
> And just to be extra clear, by hardware topology I mean:
> 
> For USB, we find the USB bus based on the address of its controller (and
> optionally its productID if two busses share the same controller for USB2 and
> USB3),

What exactly do you mean by "address" of a controller?  That will be
unique per bus-type that the controller lives on, right?

> and then find the device by following the ports at each hub. The
> configuration number and interfaces then describe what interfaces to check for
> presence and driver binding.

Ok, good, hub and port locations _should_ be stable, but note they have
changed at times so you will have to deal with that for the next 20+
years, are you ok with that?

> For PCI, we find the controller again based on its address, and follow the
> device-function pairs at each level in the topology until we arrive at the
> desired device.

"address"?  What exactly do you mean by this value?  For PCI, that will
change.

> We don't rely on the USB bus number, nor on the PCI domain and bus number, since
> these are all assigned at runtime.

You are relying on a specific sysfs tree as well, are you able to handle
it when new devices get added to the middle of a device path?  That
sometimes happens in sysfs too.

thanks,

greg k-h

