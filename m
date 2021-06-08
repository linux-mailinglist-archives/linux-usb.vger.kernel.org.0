Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698C439F712
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 14:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbhFHMtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 08:49:04 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:37813 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232339AbhFHMtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 08:49:04 -0400
Received: by mail-lf1-f42.google.com with SMTP id f11so31732234lfq.4;
        Tue, 08 Jun 2021 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ea4fwkzCscgRVxwz+ttDu0ZWlCRxPg3hpkrwHQuS35Y=;
        b=oGS5p4AhGFi3SZLx3vt78ncDuACNxm8OyLHgrU6DrUOTANdpgtp2hx2Kej0+Sp2kxa
         pM7B7hedjYLvsmJfRiuueK1zu+PpTaKRzw/Gwa4SCHyzgLhFfvm5p/rRSZXvW/MXfI7J
         MaCeHq8n3g4Ur7aFszdvh3ziLwRNlXlCNJsmUbqqSyY4r1amOFH0xuaDC4fnBnytGHTt
         LYMJXxONmTVK/Ko6baeWz2QVkkz8qKU4XDc80t5Bf9+sThlqfu97AR5lW9bnPZDSmar2
         gOEZHg7UA1lisMT16F4DL7uPXqA/0IwNcMGoEQilHKwPuw1dw6oDDsdDRww+8L4KDgI/
         v7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ea4fwkzCscgRVxwz+ttDu0ZWlCRxPg3hpkrwHQuS35Y=;
        b=QsVWTwqM8IqLgHMvlHEV/y1LO9MVCSZpWsk0kxwAgKivXBCYVoArarKl5NnOs32T2u
         Fhr+vZJFchznYgVDIl5vh6JKfJ6exqV6GJ7flmAF04MXwsVs21wwoEhIRsZrWh+1k+Ud
         62gEXjl29wsybz+E2Kq2bv2vRtpl6Sr6TYuXrvjc5YJEDr5VkJzKCgmuxWhJWG7B3IBJ
         WohPWIMGHWubzwCn1FNdp+GxovfX01dlc4eirVDpaGl7w3HB3sVlFoXPgvy0Xa++Skj1
         0bHid2xU3Q2FVovsgBwzTkMsK0s0k+KplPamC4pINq5GDc7fKi+qJXdE9isIlLlvNQqm
         ZZjg==
X-Gm-Message-State: AOAM533Xj+rDg9imTQRQL93Zdn2YudPRiQahMNyZjyl4n9LdFedRNzXj
        +ZellGyu4YEvC0mHtCh+Cm/vKBXoe2BHAVMD9z0=
X-Google-Smtp-Source: ABdhPJwaqX487JFDktM8Tf0hj/g/mTVe1LSbL0yr8Sr00IirfZo569XmptY2K2GsDwJKJxSJxT795XHblpojf+XlkLI=
X-Received: by 2002:a19:7604:: with SMTP id c4mr10970752lff.398.1623156369353;
 Tue, 08 Jun 2021 05:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <YL9RDBUsk23LvHV9@kroah.com> <CAHhAz+gkm3EHE71PM4xzekC7Vsv3gksBd-M9_5iFe5AcNZbLOQ@mail.gmail.com>
 <YL9jKqLtWUgJL9ys@kroah.com>
In-Reply-To: <YL9jKqLtWUgJL9ys@kroah.com>
From:   Muni Sekhar <munisekharrms@gmail.com>
Date:   Tue, 8 Jun 2021 18:15:57 +0530
Message-ID: <CAHhAz+gPjcnL9-RV7gzTi1iFHK1pj6moySwOHVE3q_wVtmkyFg@mail.gmail.com>
Subject: Re: USB sound card issues
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     alsa-devel <alsa-devel@alsa-project.org>,
        linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
        kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 8, 2021 at 6:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 08, 2021 at 05:44:42PM +0530, Muni Sekhar wrote:
> > On Tue, Jun 8, 2021 at 4:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jun 08, 2021 at 04:20:07PM +0530, Muni Sekhar wrote:
> > > > Hi all,
> > > >
> > > > I am using a USB sound card(snd-usb-audio), and it fails while doing
> > > > the audio recording "arecord: pcm_read:2032: read error: Input/output
> > > > error".
> > > >
> > > > What could be the problem? and is there a workaround for this?
> > > >
> > > > $ arecord -l
> > > > **** List of CAPTURE Hardware Devices ****
> > > > card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
> > > >   Subdevices: 1/1
> > > >   Subdevice #0: subdevice #0
> > > >
> > > >
> > > > $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz
> > x.wav
> > > > Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz,
> > Mono
> > > > arecord: pcm_read:2032: read error: Input/output error
> > >
> > > What kernel version is this, and what other kernel messages are printed
> > > when you plug your device in?
>
>
> What kernel version is this?
4.15.0-54-generic

>
> > [12932.016672] usb 2-1: USB disconnect, device number 5
> > [12932.016683] usb 2-1.1: USB disconnect, device number 6
> > [12962.085766] usb 2-1: new full-speed USB device number 7 using xhci_hcd
> > [12962.275849] usb 2-1: New USB device found, idVendor=0a12, idProduct=4010
> > [12962.275861] usb 2-1: New USB device strings: Mfr=0, Product=0,
> > SerialNumber=0
> > [12962.276538] usb 2-1: ep 0x81 - rounding interval to 1024 microframes, ep
> > desc says 2040 microframes
> > [12962.279699] hub 2-1:1.0: USB hub found
> > [12962.280663] hub 2-1:1.0: 4 ports detected
> > [12962.875024] usb 2-1.1: new full-speed USB device number 8 using xhci_hcd
> > [12962.980977] usb 2-1.1: New USB device found, idVendor=0a12,
> > idProduct=4007
> > [12962.980991] usb 2-1.1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=5
> > [12962.981000] usb 2-1.1: Product: BT_002
> > [12962.981008] usb 2-1.1: Manufacturer: Qualcomm
> > [12962.981015] usb 2-1.1: SerialNumber: ABC4C25B
> > [12962.992667] input: Qualcomm BT_002 as
> > /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1/2-1.1:1.0/0003:0A12:4007.0003/input/input6
> > [12963.048083] hid-generic 0003:0A12:4007.0003: input,hiddev0,hidraw0: USB
> > HID v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input0
> > [12963.066910] hid-generic 0003:0A12:4007.0004: hiddev0,hidraw1: USB HID
> > v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input1
> >
> > Same error (arecord: pcm_read:2032: read error: Input/output error)
> > observed on 4.4, 4.15 and 5.4 kernel version.
>
> What exact versions of these are you using?
4.4.0-66-generic
4.15.0-54-generic
Ubuntu 20.04

>
> And what about the latest 5.12.y release?
I don't have this test setup.



>
> thanks,
>
> greg k-h



-- 
Thanks,
Sekhar
