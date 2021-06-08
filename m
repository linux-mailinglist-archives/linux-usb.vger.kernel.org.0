Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040F139F6C9
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 14:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhFHMeP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 08:34:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:38718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232679AbhFHMeO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Jun 2021 08:34:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A14106128A;
        Tue,  8 Jun 2021 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623155541;
        bh=QTsuc9MvTGcOk+b+W86bPjlTAz15gPPAPBL0O6/d68g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TwjBrnDbBVqqpPMt1UwkvaAvGv+VrsYi/uIqxe7/0J0RuTXKhGM3Gh8cT/gARg6CW
         dgf6vQFaLzsNEc7oXqU/R2rc5m66PQ8Sli74lbe2iBAI6wy+jvI2hBxJE4vG13mKUD
         siCqpe1GOkK0BaXCtKa3gvPOalfi3vtQB+9FK08o=
Date:   Tue, 8 Jun 2021 14:31:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Muni Sekhar <munisekharrms@gmail.com>
Cc:     alsa-devel <alsa-devel@alsa-project.org>,
        linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: USB sound card issues
Message-ID: <YL9jKqLtWUgJL9ys@kroah.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <YL9RDBUsk23LvHV9@kroah.com>
 <CAHhAz+gkm3EHE71PM4xzekC7Vsv3gksBd-M9_5iFe5AcNZbLOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+gkm3EHE71PM4xzekC7Vsv3gksBd-M9_5iFe5AcNZbLOQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 05:44:42PM +0530, Muni Sekhar wrote:
> On Tue, Jun 8, 2021 at 4:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jun 08, 2021 at 04:20:07PM +0530, Muni Sekhar wrote:
> > > Hi all,
> > >
> > > I am using a USB sound card(snd-usb-audio), and it fails while doing
> > > the audio recording "arecord: pcm_read:2032: read error: Input/output
> > > error".
> > >
> > > What could be the problem? and is there a workaround for this?
> > >
> > > $ arecord -l
> > > **** List of CAPTURE Hardware Devices ****
> > > card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
> > >   Subdevices: 1/1
> > >   Subdevice #0: subdevice #0
> > >
> > >
> > > $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz
> x.wav
> > > Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz,
> Mono
> > > arecord: pcm_read:2032: read error: Input/output error
> >
> > What kernel version is this, and what other kernel messages are printed
> > when you plug your device in?


What kernel version is this?

> [12932.016672] usb 2-1: USB disconnect, device number 5
> [12932.016683] usb 2-1.1: USB disconnect, device number 6
> [12962.085766] usb 2-1: new full-speed USB device number 7 using xhci_hcd
> [12962.275849] usb 2-1: New USB device found, idVendor=0a12, idProduct=4010
> [12962.275861] usb 2-1: New USB device strings: Mfr=0, Product=0,
> SerialNumber=0
> [12962.276538] usb 2-1: ep 0x81 - rounding interval to 1024 microframes, ep
> desc says 2040 microframes
> [12962.279699] hub 2-1:1.0: USB hub found
> [12962.280663] hub 2-1:1.0: 4 ports detected
> [12962.875024] usb 2-1.1: new full-speed USB device number 8 using xhci_hcd
> [12962.980977] usb 2-1.1: New USB device found, idVendor=0a12,
> idProduct=4007
> [12962.980991] usb 2-1.1: New USB device strings: Mfr=1, Product=2,
> SerialNumber=5
> [12962.981000] usb 2-1.1: Product: BT_002
> [12962.981008] usb 2-1.1: Manufacturer: Qualcomm
> [12962.981015] usb 2-1.1: SerialNumber: ABC4C25B
> [12962.992667] input: Qualcomm BT_002 as
> /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1/2-1.1:1.0/0003:0A12:4007.0003/input/input6
> [12963.048083] hid-generic 0003:0A12:4007.0003: input,hiddev0,hidraw0: USB
> HID v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input0
> [12963.066910] hid-generic 0003:0A12:4007.0004: hiddev0,hidraw1: USB HID
> v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input1
> 
> Same error (arecord: pcm_read:2032: read error: Input/output error)
> observed on 4.4, 4.15 and 5.4 kernel version.

What exact versions of these are you using?

And what about the latest 5.12.y release?

thanks,

greg k-h
