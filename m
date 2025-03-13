Return-Path: <linux-usb+bounces-21734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F19A60170
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 20:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D11A3BDE16
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 19:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5040C1F37DA;
	Thu, 13 Mar 2025 19:41:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C41F1927
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 19:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741894873; cv=none; b=FprmGWNj4PNWI/wBA54peOnzGQDKjGS9DGjXQj0zNtWDDOsECpXMzMTEYluHna2kMSsiki3RDoTiaiFmeH5mv0Z0ZsnCK1wLX762wN3mwLQFRwDhRaKPf6RFkKPuAbesK64t0QXK5bWqglAMpyp9RVsQROFtGpcyYmrhLgVtQag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741894873; c=relaxed/simple;
	bh=w81oytOJ52LUX+gcGHeVMyaViS4IklZp3npw04X3rQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEqu6853JpKXAxGkFJ9BHqlBlKNQTGXBgxgXcQuxyqQvos08IA30IOqWRNFmWahp+AK5nCinNyL7A2xPgDA7TI9QI0k+XO0eCvohketayxbKmWYhH78nAmb+C4Hx+X6pV4a1dZcskvNXBMT2fHKqSublgZFxC5BJjTSOs27TRNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tsoQ9-0002QO-AO; Thu, 13 Mar 2025 20:40:45 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tsoQ9-005aKi-0I;
	Thu, 13 Mar 2025 20:40:45 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tsoQ8-00BQoh-39;
	Thu, 13 Mar 2025 20:40:44 +0100
Date: Thu, 13 Mar 2025 20:40:44 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Johan Hovold <johan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] USB-Serial serdev support
Message-ID: <20250313194044.t2t3c7j6ktvshjhs@pengutronix.de>
References: <20240807-v6-10-topic-usb-serial-serdev-v1-0-ed2cc5da591f@pengutronix.de>
 <Zt7kCxawoszunWq3@hovoldconsulting.com>
 <20240917044948.i2eog4ondf7vna7q@pengutronix.de>
 <Z8_wcASfJ8SeAQ8l@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8_wcASfJ8SeAQ8l@hovoldconsulting.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On 25-03-11, Johan Hovold wrote:
> On Tue, Sep 17, 2024 at 06:49:48AM +0200, Marco Felsch wrote:
> > On 24-09-09, Johan Hovold wrote:
> > > On Wed, Aug 07, 2024 at 04:08:47PM +0200, Marco Felsch wrote:
> > > > this patchset is based on Johan's patches [1] but dropped the need of
> > > > the special 'serial' of-node [2].
> > > 
> > > That's great that you found and referenced my proof-of-concept patches,
> > > but it doesn't seem like you tried to understand why this hasn't been
> > > merged yet.
> 
> > > First, as the commit message you refer to below explain, we need some
> > > way to describe multiport controllers. Just dropping the 'serial' node
> > > does not make that issue go away.
> > 
> > Sorry for asking but isn't the current OF abstraction [1] enough? As far
> > as I understood we can describe the whole USB tree within OF. I used [1]
> > and the this patchset to describe the following hierarchy:
> > 
> >  usb-root -> usb-hub port-1 -> usb-serial interface-0 -> serial
> >                                                          bt-module
> > 
> > [1] Documentation/devicetree/bindings/usb/usb-device.yaml
> 
> Again, you still need to consider devices with multiple serial ports
> (and they do not always map neatly to one port per interface either).

We use a dual-port FTDI and our USB tree looks as followed:

/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 0424:2514 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
        |__ Port 001: Dev 003, If 0, Class=Vendor Specific Class, Driver=ftdi_sio, 480M
            ID 0403:6010 Future Technology Devices International, Ltd FT2232C/D/H Dual UART/FIFO IC
        |__ Port 001: Dev 003, If 1, Class=Vendor Specific Class, Driver=ftdi_sio, 480M
            ID 0403:6010 Future Technology Devices International, Ltd FT2232C/D/H Dual UART/FIFO IC

interface-0 is used for the bt-module which is served by the serdev
driver.

interface-1 is used by an userspace driver which makes use of the
/dev/ttyUSB1 port.

So we do have the multiple serial ports use-case already. Can you please
explain what I miss?

> > > Second, and more importantly, you do not address the main obstacle for
> > > enabling serdev for USB serial which is that the serdev cannot handle
> > > hotplugging.
> > 
> > Hotplugging is a good point but out-of-scope IMHO (at least for now)
> > since the current serdev implementation rely on additional firmware
> > information e.g OF node to be present. E.g. if the above mentioned setup
> > would connect the "serial bt-module" directly to the UART port you still
> > need an OF node to bind the serdev driver. If the node isn't present
> > user-space would need to do the hci handling.
> 
> There's nothing preventing you from adding a devicetree node for a USB
> device that can be unplugged.

I see and I have to admit that I didn't test this :/ But since you
pointed it out I tested it now!

So as explained, our USB tree looks as above and our DTS looks like the
one in the cover letter. Of course I run on an embedded system but the
USB FTDI based module is powered by the VBUS of the hub. Therefore I
ran the test by disabling the downstream port which in turn disabled the
VBUS supply. This should come very close to a physical unplug event.

8<----------------------------------------------------------------

## The test system before the "unplug"

root@test:~# ls -al /sys/class/bluetooth/
total 0
drwxr-xr-x  2 root root 0 Jan  8 18:31 .
drwxr-xr-x 62 root root 0 Jan  8 18:31 ..
lrwxrwxrwx  1 root root 0 Jan  8 18:31 hci0 -> ../../devices/platform/soc@0/32f10108.usb/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.1/1-1.1:1.0/ttyUSB0/serial0/serial0-0/bluetooth/hci0

root@test:~# ls -al /sys/bus/serial/devices/
total 0
drwxr-xr-x 2 root root 0 Jan  8 18:31 .
drwxr-xr-x 4 root root 0 Jan  8 18:28 ..
lrwxrwxrwx 1 root root 0 Jan  8 18:31 serial0 -> ../../../devices/platform/soc@0/32f10108.usb/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.1/1-1.1:1.0/ttyUSB0/serial0
lrwxrwxrwx 1 root root 0 Jan  8 18:31 serial0-0 -> ../../../devices/platform/soc@0/32f10108.usb/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.1/1-1.1:1.0/ttyUSB0/serial0/serial0-0

## The "unplug" event and the system after the event

root@test:~# echo 1 > /sys/bus/usb/devices/usb1/1-1/1-1\:1.0/1-1-port1/disable

root@test:~# ls -al /sys/class/bluetooth/
total 0
drwxr-xr-x  2 root root 0 Jan  8 18:40 .
drwxr-xr-x 62 root root 0 Jan  8 18:31 ..

root@test:~# ls -al /sys/bus/serial/devices/
total 0
drwxr-xr-x 2 root root 0 Jan  8 18:40 .
drwxr-xr-x 4 root root 0 Jan  8 18:28 ..

## The "plug" event and the system after the event

root@test:~# echo 0 > /sys/bus/usb/devices/usb1/1-1/1-1\:1.0/1-1-port1/disable
root@test:~# [ 1121.297918] btnxpuart serial0-0: supply vcc not found, using dummy regulator

root@test:~# ls -al /sys/class/bluetooth/
total 0
drwxr-xr-x  2 root root 0 Jan  8 18:41 .
drwxr-xr-x 62 root root 0 Jan  8 18:31 ..
lrwxrwxrwx  1 root root 0 Jan  8 18:41 hci0 -> ../../devices/platform/soc@0/32f10108.usb/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.1/1-1.1:1.0/ttyUSB0/serial0/serial0-0/bluetooth/hci0

root@test:~# ls -al /sys/bus/serial/devices/
total 0
drwxr-xr-x 2 root root 0 Jan  8 18:41 .
drwxr-xr-x 4 root root 0 Jan  8 18:28 ..
lrwxrwxrwx 1 root root 0 Jan  8 18:41 serial0 -> ../../../devices/platform/soc@0/32f10108.usb/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.1/1-1.1:1.0/ttyUSB0/serial0
lrwxrwxrwx 1 root root 0 Jan  8 18:41 serial0-0 -> ../../../devices/platform/soc@0/32f10108.usb/38200000.usb/xhci-hcd.1.auto/usb1/1-1/1-1.1/1-1.1:1.0/ttyUSB0/serial0/serial0-0

8<----------------------------------------------------------------

> > So from my POV the serdev abstraction is for manufacturers which make
> > use of "onboard" usb-devices which are always present at the same USB
> > tree location. Serdev is not made for general purpose USB ports (yet)
> > where a user can plug-in all types of USB devices.
> 
> Right, but someone need to make sure that serdev can handle devices
> going away first as nothing is currently preventing that from happening.

Can you please check my above tests? Maybe I do miss something but for
me it looks like it's working. Looking forwards for your input.

Regards,
  Marco


> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/log/?h=usb-serial-of
> > > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-serial-of&id=b19239022c92567a6a9ed40e8522e84972b0997f
> 
> Johan
> 

