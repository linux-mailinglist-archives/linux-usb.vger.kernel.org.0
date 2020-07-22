Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652D1229A65
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 16:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732756AbgGVOlQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 10:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgGVOlO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 10:41:14 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893F3C0619DC
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 07:41:13 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id j18so2153690wmi.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidgf-net.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XQdhVYuh0rrnARY1dz05Oj8Hrj1fYZqSJNihHLS35Jg=;
        b=MybNHHBUl41+Znj3hOIfSlYf7HGBEBSqV5HP4RyJ+vH1cq4XRTWPmoz8bRKZUTEOSx
         VpjCBllMpOO1uxGJUj7u0D0r5vZoMLeIyePbgB9d0gsyWWBeIgTY4IaW58NUWG8EaF7r
         kkaxe5BheqiAnWCUBDP0pwLSPSHUtleC2r3vrXg75ZjO2TXnhR4sgh9z7hx95T9Ja98k
         VxbNfDdcnpulgxQdADoI9KpZUaMDsyut+0+533x9uI0BaPZ1upNwPnAN0P9aHOok0dhX
         ULJPt8a7p2tY6+6pdWVK2jTmii23H2FPlInjUfcBwhx7iI0iciTYUnBiJA9atjURiLu3
         6zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XQdhVYuh0rrnARY1dz05Oj8Hrj1fYZqSJNihHLS35Jg=;
        b=C2/xxW1TUSOZBRUa0sa/aAPoXceIJ9am8/CoPHUQt8lVw4EjZVS7oRT/zAASSrZZ3a
         gG5GUk53y2FXfd9op+ZY5qGemQyD184VUjN0Crh8yoyRqCEqIBrk9lrpxFma6WjJgaSM
         N2ENU+Mdto8SMxd8N6mLgNxNiyNRbOevJQzoR5ZKwv/rpCcZ2wWI7igFMbmX+FhaSyr8
         NUh1Il58ZyojIjQbVrm+mvhFUVBCGmI7XaNAWzPh8shK3hfkV3/MGkfl+6grtHQbkbU8
         0WFQljbn/cOWdeAF4wPrYAkS0cX/M/jNX7jKUUsrEa05geIUZk7UrL3+YOyOSYR35I83
         5cFA==
X-Gm-Message-State: AOAM532FtomBJYobmGZ4R//slurfmVoaqUV41lOW5mZXR7EsRGaNrcXI
        tVkn0m0S371fxWMLdlFUXy1v
X-Google-Smtp-Source: ABdhPJy/FP/6zmsNQzHB3WXBrG7vgmnjyfIOFWltg+2RWrDCNNE4oWtFrbgteMyw/iLpa1+Ok7eJUA==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr41452wmc.2.1595428871923;
        Wed, 22 Jul 2020 07:41:11 -0700 (PDT)
Received: from debian.fritz.box (85-195-242-113.fiber7.init7.net. [85.195.242.113])
        by smtp.gmail.com with ESMTPSA id f12sm145348wrj.48.2020.07.22.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 07:41:10 -0700 (PDT)
Message-ID: <fbdb1c8735a6bf55851b9dc3eda18ba51600cfdf.camel@davidgf.net>
Subject: Re: System crash/lockup after plugging CDC ACM device
From:   David Guillen Fandos <david@davidgf.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Dan Williams <dcbw@redhat.com>, linux-usb@vger.kernel.org,
        dnlplm@gmail.com
Date:   Wed, 22 Jul 2020 16:41:10 +0200
In-Reply-To: <20200721082642.GA1659990@kroah.com>
References: <20200715105034.GB2880893@kroah.com>
         <956ec3169eec6b121339ed6c1aedd0f7ca08db43.camel@davidgf.net>
         <20200715111210.GA2892661@kroah.com>
         <ed743fe1e0ede6d37bc4a62ba704f51c54c2f5bf.camel@davidgf.net>
         <20200715122403.GC2937397@kroah.com>
         <8ebe3fb975db65531e71fdf8a298e3b3f68ae3ca.camel@davidgf.net>
         <5725602de85c43497e326ff745db01ba36caeac1.camel@davidgf.net>
         <ae6813ea0d4144a624a7e98cbba87070d3ae6f30.camel@davidgf.net>
         <2017952c728bd0bb5d0e0c9df266de984f293df2.camel@redhat.com>
         <a02ae97554de9ddea29b770bda0f34eb738dda34.camel@davidgf.net>
         <20200721082642.GA1659990@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2020-07-21 at 10:26 +0200, Greg KH wrote:
> On Mon, Jul 20, 2020 at 10:39:40PM +0200, David Guillen Fandos wrote:
> > On Mon, 2020-07-20 at 11:55 -0500, Dan Williams wrote:
> > > On Mon, 2020-07-20 at 01:36 +0200, David Guillen Fandos wrote:
> > > > On Thu, 2020-07-16 at 16:30 +0200, David Guillen Fandos wrote:
> > > > > On Wed, 2020-07-15 at 19:03 +0200, David Guillen Fandos
> > > > > wrote:
> > > > > > On Wed, 2020-07-15 at 14:24 +0200, Greg KH wrote:
> > > > > > > On Wed, Jul 15, 2020 at 01:20:54PM +0200, David Guillen
> > > > > > > Fandos
> > > > > > > wrote:
> > > > > > > > On Wed, 2020-07-15 at 13:12 +0200, Greg KH wrote:
> > > > > > > > > On Wed, Jul 15, 2020 at 12:57:14PM +0200, David
> > > > > > > > > Guillen
> > > > > > > > > Fandos
> > > > > > > > > wrote:
> > > > > > > > > > On Wed, 2020-07-15 at 12:50 +0200, Greg KH wrote:
> > > > > > > > > > > On Wed, Jul 15, 2020 at 12:31:42PM +0200, David
> > > > > > > > > > > Guillen
> > > > > > > > > > > Fandos
> > > > > > > > > > > wrote:
> > > > > > > > > > > > On Wed, 2020-07-15 at 11:30 +0200, Greg KH
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > On Wed, Jul 15, 2020 at 10:58:03AM +0200,
> > > > > > > > > > > > > David
> > > > > > > > > > > > > Guillen
> > > > > > > > > > > > > Fandos
> > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > Hello linux-usb,
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I think I might have found a kernel bug
> > > > > > > > > > > > > > related
> > > > > > > > > > > > > > to
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > USB
> > > > > > > > > > > > > > subsystem
> > > > > > > > > > > > > > (cdc_acm perhaps).
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Context: I was playing around with a device
> > > > > > > > > > > > > > I'm
> > > > > > > > > > > > > > creating,
> > > > > > > > > > > > > > essentially a
> > > > > > > > > > > > > > USB quad modem device that exposes four
> > > > > > > > > > > > > > modems
> > > > > > > > > > > > > > to
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > host
> > > > > > > > > > > > > > system.
> > > > > > > > > > > > > > This
> > > > > > > > > > > > > > device is still a prototype so there's a
> > > > > > > > > > > > > > few
> > > > > > > > > > > > > > bugs
> > > > > > > > > > > > > > here
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > there,
> > > > > > > > > > > > > > most
> > > > > > > > > > > > > > likely in the USB descriptors and control
> > > > > > > > > > > > > > requests.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > What happens: After plugging the device the
> > > > > > > > > > > > > > system
> > > > > > > > > > > > > > starts
> > > > > > > > > > > > > > spitting
> > > > > > > > > > > > > > warnings and BUGs and it locks up. Most of
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > time
> > > > > > > > > > > > > > some
> > > > > > > > > > > > > > CPUs
> > > > > > > > > > > > > > get
> > > > > > > > > > > > > > into
> > > > > > > > > > > > > > some spinloop and never comes back (you can
> > > > > > > > > > > > > > see
> > > > > > > > > > > > > > it
> > > > > > > > > > > > > > being
> > > > > > > > > > > > > > detected
> > > > > > > > > > > > > > by
> > > > > > > > > > > > > > the watchdog after a few seconds).
> > > > > > > > > > > > > > Generally
> > > > > > > > > > > > > > after
> > > > > > > > > > > > > > that
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > USB
> > > > > > > > > > > > > > devices
> > > > > > > > > > > > > > stop working completely and at some point
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > machine
> > > > > > > > > > > > > > freezes
> > > > > > > > > > > > > > completely. In a couple of ocasions I
> > > > > > > > > > > > > > managed
> > > > > > > > > > > > > > to
> > > > > > > > > > > > > > see
> > > > > > > > > > > > > > a
> > > > > > > > > > > > > > bug
> > > > > > > > > > > > > > in
> > > > > > > > > > > > > > dmesg
> > > > > > > > > > > > > > saying "unable to handle page fault for
> > > > > > > > > > > > > > address
> > > > > > > > > > > > > > XXX"
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > "Supervisor
> > > > > > > > > > > > > > read access in kernel mode" "error code
> > > > > > > > > > > > > > (0x0000)
> > > > > > > > > > > > > > not
> > > > > > > > > > > > > > present
> > > > > > > > > > > > > > page".
> > > > > > > > > > > > > > I
> > > > > > > > > > > > > > could not get a trace for that one since
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > kernel
> > > > > > > > > > > > > > died
> > > > > > > > > > > > > > completely
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > my log files were truncated/lost.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Since it is happening to my two machines
> > > > > > > > > > > > > > (both
> > > > > > > > > > > > > > Intel
> > > > > > > > > > > > > > but
> > > > > > > > > > > > > > rather
> > > > > > > > > > > > > > different controllers, Sunrise Point-LP USB
> > > > > > > > > > > > > > 3.0
> > > > > > > > > > > > > > vs
> > > > > > > > > > > > > > 8
> > > > > > > > > > > > > > Series/C220)
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > with different kernel versions I suspect
> > > > > > > > > > > > > > this
> > > > > > > > > > > > > > might
> > > > > > > > > > > > > > be
> > > > > > > > > > > > > > a
> > > > > > > > > > > > > > bug in
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > kernel.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > I have 4 logs that I collected, they are
> > > > > > > > > > > > > > sort
> > > > > > > > > > > > > > of
> > > > > > > > > > > > > > long-
> > > > > > > > > > > > > > ish,
> > > > > > > > > > > > > > not
> > > > > > > > > > > > > > sure
> > > > > > > > > > > > > > how
> > > > > > > > > > > > > > to best send them to the list.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Send the crashes with the callback list, that
> > > > > > > > > > > > > should
> > > > > > > > > > > > > be
> > > > > > > > > > > > > quite
> > > > > > > > > > > > > small,
> > > > > > > > > > > > > right?  We don't need the full log.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The first crash is the most important, the
> > > > > > > > > > > > > others
> > > > > > > > > > > > > can
> > > > > > > > > > > > > be
> > > > > > > > > > > > > from
> > > > > > > > > > > > > the
> > > > > > > > > > > > > first
> > > > > > > > > > > > > one and are not reliable.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > thanks,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > greg k-h
> > > > > > > > > > > > 
> > > > > > > > > > > > Ok then, here comes one of the logs, I selected
> > > > > > > > > > > > some
> > > > > > > > > > > > bits
> > > > > > > > > > > > only
> > > > > > > > > > > > 
> > > > > > > > > > > > [  147.302016] WARNING: CPU: 3 PID: 134 at
> > > > > > > > > > > > kernel/workqueue.c:1473
> > > > > > > > > > > > __queue_work+0x364/0x410
> > > > > > > > > > > > [...]
> > > > > > > > > > > > [  147.302322] Call Trace:
> > > > > > > > > > > > [  147.302329]  <IRQ>
> > > > > > > > > > > > [  147.302342]  queue_work_on+0x36/0x40
> > > > > > > > > > > > [  147.302353]  __usb_hcd_giveback_urb+0x9c/0x1
> > > > > > > > > > > > 10
> > > > > > > > > > > > [  147.302362]  usb_giveback_urb_bh+0xa0/0xf0
> > > > > > > > > > > > [  147.302372]  tasklet_action_common.constprop
> > > > > > > > > > > > .0+0
> > > > > > > > > > > > x6
> > > > > > > > > > > > 6/
> > > > > > > > > > > > 0x
> > > > > > > > > > > > 10
> > > > > > > > > > > > 0
> > > > > > > > > > > > [  147.302382]  __do_softirq+0xe9/0x2dc
> > > > > > > > > > > > [  147.302391]  irq_exit+0xcf/0x110
> > > > > > > > > > > > [  147.302397]  do_IRQ+0x55/0xe0
> > > > > > > > > > > > [  147.302408]  common_interrupt+0xf/0xf
> > > > > > > > > > > > [  147.302413]  </IRQ>
> > > > > > > > > > > > [...]
> > > > > > > > > > > > [  184.771172] watchdog: BUG: soft lockup -
> > > > > > > > > > > > CPU#3
> > > > > > > > > > > > stuck
> > > > > > > > > > > > for
> > > > > > > > > > > > 23s!
> > > > > > > > > > > > [kworker/3:2:134]
> > > > > > > > > > > 
> > > > > > > > > > > That was the first message?
> > > > > > > > > > > 
> > > > > > > > > > > Ok, we need some more logs, how about the 30
> > > > > > > > > > > lines
> > > > > > > > > > > right
> > > > > > > > > > > before
> > > > > > > > > > > the
> > > > > > > > > > > above?
> > > > > > > > > > > 
> > > > > > > > > > > And what kernel version are you using?
> > > > > > > > > > > 
> > > > > > > > > > > thanks,
> > > > > > > > > > > 
> > > > > > > > > > > greg k-h
> > > > > > > > > > 
> > > > > > > > > > Heh I assumed you would find the 3rd stack more
> > > > > > > > > > interesting
> > > > > > > > > > since
> > > > > > > > > > it
> > > > > > > > > > involves more subsystems but anyway, here we got,
> > > > > > > > > > the
> > > > > > > > > > first
> > > > > > > > > > one
> > > > > > > > > > with
> > > > > > > > > > more context. The trigger as you can see is me
> > > > > > > > > > connecting
> > > > > > > > > > the
> > > > > > > > > > USB
> > > > > > > > > > device:
> > > > > > > > > > 
> > > > > > > > > > [  141.445367] usb 1-1: new full-speed USB device
> > > > > > > > > > number
> > > > > > > > > > 5
> > > > > > > > > > using
> > > > > > > > > > xhci_hcd
> > > > > > > > > > [  141.573592] usb 1-1: New USB device found,
> > > > > > > > > > idVendor=0483,
> > > > > > > > > > idProduct=5740, bcdDevice= 2.00
> > > > > > > > > > [  141.573597] usb 1-1: New USB device strings:
> > > > > > > > > > Mfr=1,
> > > > > > > > > > Product=2,
> > > > > > > > > > SerialNumber=3
> > > > > > > > > > [  141.573601] usb 1-1: Product: Quad-UART serial
> > > > > > > > > > USB
> > > > > > > > > > device
> > > > > > > > > > [  141.573603] usb 1-1: Manufacturer: davidgf.net
> > > > > > > > > > [  141.573605] usb 1-1: SerialNumber: serialno
> > > > > > > > > > [  142.375007] cdc_acm 1-1:1.0: ttyACM0: USB ACM
> > > > > > > > > > device
> > > > > > > > > > [  142.376623] cdc_acm 1-1:1.2: ttyACM1: USB ACM
> > > > > > > > > > device
> > > > > > > > > > [  142.378350] cdc_acm 1-1:1.4: ttyACM2: USB ACM
> > > > > > > > > > device
> > > > > > > > > > [  142.379637] cdc_acm 1-1:1.6: ttyACM3: USB ACM
> > > > > > > > > > device
> > > > > > > > > > [  142.382473] usbcore: registered new interface
> > > > > > > > > > driver
> > > > > > > > > > cdc_acm
> > > > > > > > > > [  142.382476] cdc_acm: USB Abstract Control Model
> > > > > > > > > > driver
> > > > > > > > > > for
> > > > > > > > > > USB
> > > > > > > > > > modems and ISDN adapters
> > > > > > > > > > [  147.301997] ------------[ cut here ]------------
> > > > > > > > > > [  147.302016] WARNING: CPU: 3 PID: 134 at
> > > > > > > > > > kernel/workqueue.c:1473
> > > > > > > > > > __queue_work+0x364/0x410
> > > > > > > > > > [  147.302019] Modules linked in: cdc_acm rfcomm
> > > > > > > > > > ccm
> > > > > > > > > > wireguard
> > > > > > > > > > curve25519_x86_64 libchacha20poly1305 chacha_x86_64
> > > > > > > > > > poly1305_x86_64
> > > > > > > > > > libblake2s blake2s_x86_64 ip6_udp_tunnel udp_tunnel
> > > > > > > > > > libcurve25519_generic libchacha libblake2s_generic
> > > > > > > > > > nft_fib_inet
> > > > > > > > > > nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
> > > > > > > > > > nf_reject_ipv4
> > > > > > > > > > nf_reject_ipv6 nft_reject nft_ct nft_chain_nat
> > > > > > > > > > ip6table_nat
> > > > > > > > > > ip6table_mangle ip6table_raw ip6table_security
> > > > > > > > > > iptable_nat
> > > > > > > > > > nf_nat
> > > > > > > > > > nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> > > > > > > > > > libcrc32c
> > > > > > > > > > iptable_mangle
> > > > > > > > > > iptable_raw iptable_security ip_set nf_tables
> > > > > > > > > > nfnetlink
> > > > > > > > > > ip6table_filter
> > > > > > > > > > ip6_tables iptable_filter cmac vboxnetadp(OE)
> > > > > > > > > > vboxnetflt(OE)
> > > > > > > > > > bnep
> > > > > > > > > > vboxdrv(OE) sunrpc vfat fat uvcvideo
> > > > > > > > > > videobuf2_vmalloc
> > > > > > > > > > videobuf2_memops
> > > > > > > > > > videobuf2_v4l2 videobuf2_common videodev btusb
> > > > > > > > > > btrtl
> > > > > > > > > > btbcm
> > > > > > > > > > btintel
> > > > > > > > > > mc
> > > > > > > > > > bluetooth ecdh_generic ecc iTCO_wdt
> > > > > > > > > > iTCO_vendor_support
> > > > > > > > > > mei_hdcp
> > > > > > > > > > intel_rapl_msr dell_laptop x86_pkg_temp_thermal
> > > > > > > > > > intel_powerclamp
> > > > > > > > > > coretemp kvm_intel kvm irqbypass intel_cstate
> > > > > > > > > > intel_uncore
> > > > > > > > > > intel_rapl_perf iwlmvm
> > > > > > > > > > [  147.302121]  snd_hda_codec_hdmi mac80211
> > > > > > > > > > snd_soc_skl
> > > > > > > > > > snd_soc_sst_ipc
> > > > > > > > > > snd_soc_sst_dsp dell_wmi snd_hda_ext_core
> > > > > > > > > > dell_smbios
> > > > > > > > > > snd_hda_codec_realtek dcdbas libarc4 wmi_bmof
> > > > > > > > > > dell_wmi_descriptor
> > > > > > > > > > snd_soc_acpi_intel_match snd_soc_acpi
> > > > > > > > > > intel_wmi_thunderbolt
> > > > > > > > > > snd_hda_codec_generic snd_soc_core ledtrig_audio
> > > > > > > > > > iwlwifi
> > > > > > > > > > pcspkr
> > > > > > > > > > snd_compress ac97_bus snd_pcm_dmaengine
> > > > > > > > > > snd_hda_intel
> > > > > > > > > > snd_intel_dspcfg
> > > > > > > > > > snd_hda_codec cfg80211 snd_hda_core snd_hwdep
> > > > > > > > > > snd_seq
> > > > > > > > > > snd_seq_device
> > > > > > > > > > joydev snd_pcm rfkill snd_timer snd i2c_i801
> > > > > > > > > > soundcore
> > > > > > > > > > idma64
> > > > > > > > > > int3403_thermal intel_hid int3400_thermal
> > > > > > > > > > sparse_keymap
> > > > > > > > > > acpi_thermal_rel mei_me intel_xhci_usb_role_switch
> > > > > > > > > > acpi_pad
> > > > > > > > > > roles
> > > > > > > > > > mei
> > > > > > > > > > intel_pch_thermal processor_thermal_device
> > > > > > > > > > intel_rapl_common
> > > > > > > > > > int340x_thermal_zone intel_soc_dts_iosf binfmt_misc
> > > > > > > > > > ip_tables
> > > > > > > > > > dm_crypt
> > > > > > > > > > i915 rtsx_pci_sdmmc mmc_core crct10dif_pclmul
> > > > > > > > > > crc32_pclmul
> > > > > > > > > > i2c_algo_bit
> > > > > > > > > > cec crc32c_intel drm_kms_helper nvme
> > > > > > > > > > ghash_clmulni_intel
> > > > > > > > > > drm
> > > > > > > > > > nvme_core
> > > > > > > > > > serio_raw rtsx_pci hid_multitouch wmi i2c_hid video
> > > > > > > > > > pinctrl_sunrisepoint pinctrl_intel
> > > > > > > > > > [  147.302218]  fuse
> > > > > > > > > > [  147.302230] CPU: 3 PID: 134 Comm: kworker/3:2
> > > > > > > > > > Tainted:
> > > > > > > > > > G          IOE     5.7.7-200.fc32.x86_64 #1
> > > > > > > > > > [  147.302233] Hardware name: Dell Inc. XPS 13
> > > > > > > > > > 9350/0PWNCR,
> > > > > > > > > > BIOS
> > > > > > > > > > 1.12.2
> > > > > > > > > > 12/15/2019
> > > > > > > > > > [  147.302260] Workqueue:  0x0 (mm_percpu_wq)
> > > > > > > > > > [  147.302275] RIP: 0010:__queue_work+0x364/0x410
> > > > > > > > > > [  147.302282] Code: e0 f1 69 a9 00 01 1f 00 75 0f
> > > > > > > > > > 65
> > > > > > > > > > 48
> > > > > > > > > > 8b
> > > > > > > > > > 3c
> > > > > > > > > > 25
> > > > > > > > > > c0 8b
> > > > > > > > > > 01 00 f6 47 24 20 75 25 0f 0b 48 83 c4 10 5b 5d 41
> > > > > > > > > > 5c
> > > > > > > > > > 41
> > > > > > > > > > 5d
> > > > > > > > > > 41
> > > > > > > > > > 5e
> > > > > > > > > > 41 5f
> > > > > > > > > > c3 <0f> 0b e9 78 fe ff ff 41 83 cc 02 49 8d 57 60
> > > > > > > > > > e9 5d
> > > > > > > > > > fe
> > > > > > > > > > ff
> > > > > > > > > > ff e8
> > > > > > > > > > 53
> > > > > > > > > > [  147.302286] RSP: 0018:ffffbab980154e68 EFLAGS:
> > > > > > > > > > 00010002
> > > > > > > > > > [  147.302292] RAX: ffff8f551b333790 RBX:
> > > > > > > > > > 0000000000000048
> > > > > > > > > > RCX:
> > > > > > > > > > 0000000000000000
> > > > > > > > > > [  147.302295] RDX: ffff8f551b333798 RSI:
> > > > > > > > > > ffff8f5575803718
> > > > > > > > > > RDI:
> > > > > > > > > > ffff8f5576daa840
> > > > > > > > > > [  147.302299] RBP: ffff8f551b333790 R08:
> > > > > > > > > > ffffffff97856cb0
> > > > > > > > > > R09:
> > > > > > > > > > 0000000000000000
> > > > > > > > > > [  147.302302] R10: 0000000000000000 R11:
> > > > > > > > > > ffffffff97856cb8
> > > > > > > > > > R12:
> > > > > > > > > > 0000000000000003
> > > > > > > > > > [  147.302306] R13: 0000000000002000 R14:
> > > > > > > > > > ffff8f5575c14e00
> > > > > > > > > > R15:
> > > > > > > > > > ffff8f5576db0700
> > > > > > > > > > [  147.302311] FS:  0000000000000000(0000)
> > > > > > > > > > GS:ffff8f5576d80000(0000)
> > > > > > > > > > knlGS:0000000000000000
> > > > > > > > > > [  147.302315] CS:  0010 DS: 0000 ES: 0000 CR0:
> > > > > > > > > > 0000000080050033
> > > > > > > > > > [  147.302319] CR2: 00000000000000b0 CR3:
> > > > > > > > > > 0000000267774004
> > > > > > > > > > CR4:
> > > > > > > > > > 00000000003606e0
> > > > > > > > > > [  147.302322] Call Trace:
> > > > > > > > > > [  147.302329]  <IRQ>
> > > > > > > > > > [  147.302342]  queue_work_on+0x36/0x40
> > > > > > > > > > [  147.302353]  __usb_hcd_giveback_urb+0x9c/0x110
> > > > > > > > > > [  147.302362]  usb_giveback_urb_bh+0xa0/0xf0
> > > > > > > > > 
> > > > > > > > > Are you sure your device is working properly and
> > > > > > > > > talking
> > > > > > > > > USB
> > > > > > > > > correctly
> > > > > > > > > to the host?  It looks like you are just timing out
> > > > > > > > > for
> > > > > > > > > some
> > > > > > > > > reason.
> > > > > > > > > 
> > > > > > > > > But, that warning is showing that something is odd in
> > > > > > > > > the
> > > > > > > > > usb
> > > > > > > > > workqueue,
> > > > > > > > > which is strange.
> > > > > > > > > 
> > > > > > > > > What type of host controller is this talking to?  And
> > > > > > > > > does
> > > > > > > > > your
> > > > > > > > > device
> > > > > > > > > actually answer the urbs being sent to it correctly?
> > > > > > > > > 
> > > > > > > > > Using usbmon on this might be the best way to watch
> > > > > > > > > the
> > > > > > > > > USB
> > > > > > > > > traffic,
> > > > > > > > > if
> > > > > > > > > you don't have a hardware protocol sniffer, which
> > > > > > > > > could
> > > > > > > > > provide
> > > > > > > > > some
> > > > > > > > > clues as to what is going wrong.
> > > > > > > > > 
> > > > > > > > > thanks,
> > > > > > > > > 
> > > > > > > > > greg k-h
> > > > > > > > 
> > > > > > > > As I mentioned the device is likely buggy, since I'm
> > > > > > > > developing
> > > > > > > > and
> > > > > > > > debugging it.
> > > > > > > > However my ability to debug and fix any issue is
> > > > > > > > limited by
> > > > > > > > the
> > > > > > > > fact
> > > > > > > > that the kernel decides to stop working as usual,
> > > > > > > > making my
> > > > > > > > USB
> > > > > > > > keyboard and mouse useless, if not crashing later due
> > > > > > > > to
> > > > > > > > soft
> > > > > > > > lockups.
> > > > > > > > 
> > > > > > > > Shouldn't the kernel be resilient to such devices?
> > > > > > > 
> > > > > > > Yes it should, we should not crash.
> > > > > > > 
> > > > > > > 
> > > > > > > > I've developed quite
> > > > > > > > a few USB devices in the past and I've never ran into
> > > > > > > > things
> > > > > > > > like
> > > > > > > > this
> > > > > > > > on Linux (Windows is another story, rather 'easy' to
> > > > > > > > crash,
> > > > > > > > hang
> > > > > > > > or
> > > > > > > > bluescreen). In any case since I do not have access to
> > > > > > > > a
> > > > > > > > hardware
> > > > > > > > debugger and the machine goes bananas (preventing me
> > > > > > > > from
> > > > > > > > using
> > > > > > > > Wireshark) I do not think I can further debug this
> > > > > > > > issue. I
> > > > > > > > could
> > > > > > > > try
> > > > > > > > to find a kernel version where this does not crash the
> > > > > > > > machine
> > > > > > > > (only
> > > > > > > > tested 5.6.X and 5.7.X so far). Or perhaps use
> > > > > > > > VirtualBox,
> > > > > > > > but
> > > > > > > > I'd
> > > > > > > > need
> > > > > > > > to convice the host OS to ignore the USB device and
> > > > > > > > just
> > > > > > > > forward
> > > > > > > > it
> > > > > > > > to
> > > > > > > > the guest.
> > > > > > > 
> > > > > > > Trying to trace down what part of the setup is failing,
> > > > > > > by
> > > > > > > using
> > > > > > > usbmon,
> > > > > > > will be good to try to figure out what the problem is
> > > > > > > here,
> > > > > > > if
> > > > > > > you
> > > > > > > can
> > > > > > > do that.
> > > > > > > 
> > > > > > > > The firmware for this device can be easily tweaked to
> > > > > > > > expose
> > > > > > > > an
> > > > > > > > arbitrary number (up to 7 I think) of CDC ACM
> > > > > > > > interfaces.
> > > > > > > > When
> > > > > > > > I
> > > > > > > > use
> > > > > > > > one or two there's no issues, three has had some issues
> > > > > > > > (but
> > > > > > > > did
> > > > > > > > not
> > > > > > > > investigate further). Going to four is what
> > > > > > > > consistently
> > > > > > > > triggers
> > > > > > > > kernel issues.
> > > > > > > 
> > > > > > > Hm, that might be a clue, what does the output of 'lsusb
> > > > > > > -v'
> > > > > > > for
> > > > > > > that
> > > > > > > device when you have 3 and then 4 interfaces?
> > > > > > > 
> > > > > > > thanks,
> > > > > > > 
> > > > > > > greg k-h
> > > > > > 
> > > > > > Hello,
> > > > > > 
> > > > > > I will try to see how I can debug further, perhaps I can
> > > > > > locate
> > > > > > a
> > > > > > machine or kernel that does not crash. Another option can
> > > > > > be to
> > > > > > disable
> > > > > > the firmware down to the minimum so that it does not
> > > > > > response
> > > > > > to
> > > > > > the
> > > > > > bulk endpoints (just to the enumeration and some basic
> > > > > > things),
> > > > > > to
> > > > > > rule
> > > > > > out a bad behaviour.
> > > > > > 
> > > > > > The USB descriptor is what you could imagine, just
> > > > > > replicate
> > > > > > the
> > > > > > two
> > > > > > ACM interfaces (control & data) and add more endpoints.
> > > > > > Here
> > > > > > goes
> > > > > > the
> > > > > > one with three ports. Note this one seems to make the
> > > > > > kernel
> > > > > > crash
> > > > > > just
> > > > > > like the one with four. The only ones that work well are 1
> > > > > > and
> > > > > > 2
> > > > > > ports.
> > > > > > Since I'm not aware of any other commercial solutions
> > > > > > (apart
> > > > > > from
> > > > > > FTDI)
> > > > > > that use more than 2 ACM ports, could that be the issue?
> > > > > > Meaning
> > > > > > there's a bug somewhere and no commercial hardware that can
> > > > > > trigger
> > > > > > it.
> > > > > > 
> > > > > > For reference the diff between two and three ports (in
> > > > > > lsusb)
> > > > > > is
> > > > > > that
> > > > > > it's missing the last two interaces (with the 3 EPs
> > > > > > described).
> > > > > > Of
> > > > > > course the bNumInterfaces is 4 instead of 6, and
> > > > > > wTotalLength
> > > > > > has
> > > > > > a
> > > > > > different value.
> > > > > > 
> > > > > > Hope this can help somehow.
> > > > > > Thanks
> > > > > > David
> > > > > > 
> > > > > > Bus 003 Device 012: ID 0483:5740 STMicroelectronics Virtual
> > > > > > COM
> > > > > > Port
> > > > > 
> > > > > Hey again,
> > > > > 
> > > > > I was not aware about the modems Daniele, thanks!
> > > > > 
> > > > > So I did some testing on my old BeagleBone black, which has a
> > > > > very
> > > > > old
> > > > > kernel (3.8.13-bone47). In this device the kernel is happy
> > > > > and I
> > > > > was
> > > > > able to do some testing, it seems to work well. The UARTs
> > > > > seem to
> > > > > work
> > > > > well in both directions, no weird shenanigans, no error/warn
> > > > > messages...
> > > > > 
> > > > > I'm a bit at loss on how I can debug this further, I will try
> > > > > to
> > > > > use
> > > > > a
> > > > > RPi with a newer kernel and see what happens. I could try to
> > > > > boot
> > > > > a
> > > > > Live USB with older kernels (in my Intel machines) to try to
> > > > > locate
> > > > > a
> > > > > version where it works. Since I'm no kernel expert: any way I
> > > > > can
> > > > > provide more info? The computer becomes unusable shortly
> > > > > after
> > > > > plugging
> > > > > the device so I can't really do any meaningful stuff on it.
> > > > > 
> > > > > Thanks again,
> > > > > David
> > > > > 
> > > > 
> > > > Hey there again!
> > > > 
> > > > I managed to get a PCAP capture for this. Note that
> > > > NetworkManager
> > > > was
> > > > running and actively probing the ttyACM* devices for a modem,
> > > > hence
> > > > why
> > > > you can see "AT\n" commands being sent to the four devices.
> > > 
> > > Do you mean ModemManager? NM moved the probing to ModemManager
> > > about
> > > 6
> > > or 7 years ago. In any case, ModemManager has both a "don't
> > > probe"
> > > list, a greylist, and build-time options to only probe things it
> > > knows
> > > are modems.
> > > 
> > > Of course the build-time policy depends on your distro; upstream
> > > ModemManager now defaults to "strict" mode (only probe known
> > > modems/drivers/USB IDs).
> > > 
> > > Dan
> > > 
> > > > As you can also probably see is that the device currently
> > > > ignores
> > > > any
> > > > control requests (like Set Line Coding).
> > > > 
> > > > Hope it can help your debugging.
> > > > 
> > > > David
> > > > 
> > > > 
> > 
> > Yeah ModemManager. I disabled it to better debug.
> > 
> > So I came to the bottom of the issue (device side). This device
> > does
> > not support more than 3 IN and 3 OUT endpoints. Whenever you
> > specify
> > more they start behaving very weirdly and Linux/Wireshark shows the
> > EPROTO errors. In almost all cases that correlates with a kernel
> > crash.
> 
> Ah, that makes more sense, so the device itself is just not
> responding
> to USB commands properly.
> 
> > I've seen some EPROTO errors at the begining of a trace on working
> > devices, I'm assuming it'd what happens during the period the
> > device is
> > plugged and probed and before it gets full ready (all EPs are setup
> > and
> > able to respond).
> > 
> > Now coming around the restriction I've been able to use 3 UARTs
> > without
> > a problem, also on another device from the same family. That
> > explains
> > why it did not work, does not explain why the kernel gets a CPU
> > stuck
> > in some busy loop/interrupt loop though.
> 
> I agree, it's not good that we can hang with a broken device like
> this,
> but if the hardware is the thing that is locking up, it might be hard
> for us to do anything about this.  Timing out and causing errors like
> you see might be the only thing that we can do.
> 
> > From my side there's not much more I can do. I could try to get
> > this
> > setup in a simpler device and ship it someone willing to debug it.
> > I'm
> > totally convinced this is a bug in the USB stack given it crashes
> > several computers with relateively different hardware.
> 
> I would be interested to see what happens when you plug it into other
> operating systems.  Do they also lock up, or can they handle devices
> like this?
> 
> thanks,
> 
> greg k-h

Hey there,

So I actually tested some Live media on the same computer and it is
interesting to see how other distros did not fail at all with the same
kernel version as Fedora's :/ (I tested CloneZilla 5.7.0 kernel)

So I dug a bit more and realized that the kernel wont go bananas if
ModemManager is not running. I'm assuming this means the kernel only
has issues whenever some software is poking the device (which sort of
makes sense, but at the same time should mean that the enumeration and
config bits are 'ok').

Also running ModemManager after plugging the device results sometimes
in different behaviour. In some occasions I didnt get it to crash (or
at least not as reliably) but it would print:

[12515.209323] xhci_hcd 0000:00:14.0: WARN Cannot submit Set TR Deq Ptr
[12515.209324] xhci_hcd 0000:00:14.0: A Set TR Deq Ptr command is
pending.

I'm not sure whether this is helpful or not. I haven't tried Windows
since I do not have any computer (and using VMs doesnt really seem to
work well).

Thanks!
David


