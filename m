Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5EF2946E2
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 05:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406398AbgJUDRY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 23:17:24 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39859 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406353AbgJUDRY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 23:17:24 -0400
Received: by mail-io1-f67.google.com with SMTP id q9so1192928iow.6
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 20:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w/LxdK/NaucqVJsYsOzw9rnbT5Epww9H8oV27v56zZ4=;
        b=JTgAq8nPAJZG/A+ua1QPKeIb79LVCCzku1F/M2OYhyOMDiuqJpthoYJeufkVy5xMCw
         7ZyZodZ3Z4WobzlllSknm5La8NOfUpLxzP9i9UGOJfnd4vFXkm4om9IIDGWSHPQDHuCv
         5LbGdcRuMVYdcwkEU3zoxAYci5F2m6D2n1qBlnRohufWP8oq7DTePPh24lCPkBcWhwfE
         1rMC3kXvzoWqtJK48yYxUZVvFBKyWgvRa7+GP6SJYVbRP3htG8uWp5LMoN+MNAkBW0bz
         dQiZ8Au3SY6FCpno7GePhR0peTqBhemIBA2A6u3Bly7vvSemrnqAGVEW8ZExnADDNHiu
         aG2w==
X-Gm-Message-State: AOAM532UH4D3jSInrYZe0Zug1lPc+NWGTeJJBUdl82CHjNE0YIsNHKBB
        iqbM1EcaGQGxkzzfk17crVIbiFXO4GZQPFHr
X-Google-Smtp-Source: ABdhPJy6SM2qyF3KSKwaYL584R7Z//ZgSDgOLR9gVpyIUNtEzqz3icz66W7RhItmgSu2f1aJl6SbRg==
X-Received: by 2002:a05:6602:2d85:: with SMTP id k5mr1058669iow.165.1603250242441;
        Tue, 20 Oct 2020 20:17:22 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id a6sm408587ili.11.2020.10.20.20.17.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 20:17:22 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id l16so939547ilj.9
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 20:17:22 -0700 (PDT)
X-Received: by 2002:a92:9e94:: with SMTP id s20mr896629ilk.102.1603250241718;
 Tue, 20 Oct 2020 20:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu> <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu> <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
In-Reply-To: <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
From:   Pany <pany@fedoraproject.org>
Date:   Wed, 21 Oct 2020 03:17:10 +0000
X-Gmail-Original-Message-ID: <CAE3RAxuX6SBKx22q6XZ7wTVYQNzJqZ=2Vsc4jOqK3V2-mgYOqQ@mail.gmail.com>
Message-ID: <CAE3RAxuX6SBKx22q6XZ7wTVYQNzJqZ=2Vsc4jOqK3V2-mgYOqQ@mail.gmail.com>
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you so much for guiding me!

On Tue, Oct 20, 2020 at 12:04 PM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
>
> On 19/10/2020 13.40, Alan Stern wrote:
> > On Mon, Oct 19, 2020 at 09:36:00AM +0000, Pany wrote:
> >> On Sat, Oct 17, 2020 at 8:02 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >>>
> >>> On Sat, Oct 17, 2020 at 04:07:11PM +0000, Pany wrote:
> >>>> Hi,
> >>>>
> >>>> I installed fedora 32 into an SD card, with which I booted my Macbook.
> >>>> It had worked well before, until I upgraded the kernel from 5.8.5 to
> >>>> 5.8.6 [1].
> >>>>
> >>>> With kernel-5.8.6-200.fc32.x86_64.rpm [2] installed, the boot process
> >>>> would be stuck at "A start job is running for
> >>>> /dev/mapper/fedora_localhost_--live-home (<time> / no limit)" (See the
> >>>> photo of screen [3]).
> >>>>
> >>>> By appending "systemd.debug-shell=1" to the kernel cmdline, I saved
> >>>> the journal [4].
> >>>>
> >>>> This issue has been bisected to commit
> >>>> 53965c79c2dbdc898ffc7fdbab37e920594f5e14 ("USB: Fix device driver
> >>>> race")
> >>>>
> >>>> If I revert this commit, the kernel 5.8.6 would boot successfully.
> >>>
> >>> This should have been fixed in 5.8.14 or 5.8.15 (5.8.14 was released on
> >>> the same day that the fix was installed; I'm not sure which came first).
> >>> At any rate it certainly should work with the most recent 5.8.y kernel.
> >>>
> >>> Alan Stern
> >>
> >> I tried, but neither 5.8.14 nor 5.8.15 worked for me.
> >
> > Hmmm.  Looking at the system log you captured, it appears that the
> > problem the SD card reader's driver getting reprobed incorrectly.  The
> > details aren't clear, but the log shows the device getting probed twice,
> > once as sdb and once as sdc.  If the system tried to mount one of the
> > sdb partitions as the root, and then sdb disappeared, that could explain
> > what you see.
> >
> > I don't know why this is happening.  But you can try adding some
> > debugging messages of your own.  In drivers/usb/core/driver.c, the
> > routine __usb_bus_reprobe_drivers() should never reach the line that
> > calls device_reprobe() unless the USBIP or apple-mfi-fastcharge driver
> > is installed -- and neither of those should be involved with the card
> > reader device.  You can add a line saying:
> >
> >       dev_info(dev, "new driver %s\n", new_udriver->name);
> >
> > at that point and see what it produces in the log.

I added a line and made a patch[1], but I had no idea whether
dev_info() had been inserted to the right place (I'm not good at C
language).

Then I compiled the kernel with build id `usbdebug` on copr[2] (a
build system provided by Fedora), here is the build log[3].
With following kernel cmdline, I captured the journal for
kernel-5.8.15-201.usbdebug.fc32 [4]:

kernel: Command line:
BOOT_IMAGE=(hd5,gpt3)/vmlinuz-5.8.15-201.usbdebug.fc32.x86_64
root=/dev/mapper/fedora_localhost--live-root ro
resume=/dev/mapper/fedora_localhost--live-swap
rd.lvm.lv=fedora_localhost-live/root
rd.luks.uuid=luks-65d9ed28-ea08-4ea5-a1dd-7b2b086f5e09
rd.lvm.lv=fedora_localhost-live/swap
module-blacklist=apple-mfi-fastcharge systemd.debug-shell=1

>
> Hello all,
>
> Sorry for my lateness!
>
> I reviewed Pany's logs, and the issue appears to be related to the
> automatic loading of the apple-mfi-fastcharge USB driver, which triggers
> a re-probe of the SD card reader, as pointed out earlier.
>
> This happens because the id_table of the aforementioned USB driver
> (mfi_fc_id_table) matches all USB products manufactured by Apple:
>
>   35 static const struct usb_device_id mfi_fc_id_table[] = {
>   36         { .idVendor = APPLE_VENDOR_ID,
>   37           .match_flags = USB_DEVICE_ID_MATCH_VENDOR },
>   38         {},
>   39 };
>   ...
> 218 static struct usb_device_driver mfi_fc_driver = {
> 219         .name =         "apple-mfi-fastcharge",
> 220         .probe =        mfi_fc_probe,
> 221         .disconnect =   mfi_fc_disconnect,
> 222         .id_table =     mfi_fc_id_table,
> 223         .generic_subclass = 1,
> 224 };
>
>
> ... and Pany's system has multiple USB devices manufactured by Apple
> (including the SD card reader), with the vendor code 0x05ac, which is
> the value included by the id_table of the apple-mfi-fastcharge driver:
>
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device found, idVendor=05ac, idProduct=8406, bcdDevice= 8.20
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: New USB device strings: Mfr=3, Product=4, SerialNumber=5
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: Product: Card Reader
> Sep 29 15:22:48 fedora.local kernel: usb 2-3: Manufacturer: Apple
> ...
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: new full-speed USB device number 3 using xhci_hcd
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device found, idVendor=05ac, idProduct=0273, bcdDevice= 6.22
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: Product: Apple Internal Keyboard / Trackpad
> Sep 29 15:22:48 fedora.local kernel: usb 1-5: Manufacturer: Apple Inc.
> ...
>
> One way to fix this issue would be to implement a match function in the
> apple-mfi-fastcharge driver, possibly instead of an id_table, so that it
> does not match devices that it cannot bind to. This may require other
> changes in the USB core that I cannot fathom at the moment.
>
> Pany, in the mean-time, could you add the following string to your kernel's
> command line (i.e., via GRUB, or the actual boot-loader that you use) and
> let us know whether it helps to *work around* this issue with the latest
> versions of 5.8.y kernels?
>
>         module_blacklist=apple-mfi-fastcharge

And I also installed the official built kernel-5.8.15-201.fc32.x86_64.rpm [5].

Adding module_blacklist=apple-mfi-fastcharge to the GRUB entry did not
succeed in the kernel booting.

With following kernel cmdline, I captured the journal [6]:

kernel: Command line:
BOOT_IMAGE=(hd5,gpt3)/vmlinuz-5.8.15-201.fc32.x86_64
root=/dev/mapper/fedora_localhost--live-root ro
resume=/dev/mapper/fedora_localhost--live-swap
rd.lvm.lv=fedora_localhost-live/root
rd.luks.uuid=luks-65d9ed28-ea08-4ea5-a1dd-7b2b086f5e09
rd.lvm.lv=fedora_localhost-live/swap
module_blacklist=apple-mfi-fastcharge systemd.debug-shell=1

>
> To emphasize, I am only suggesting this as a work-around, not as an actual
> solution.
>
> My time is a bit limited due to having restarted full-time employment,
> but I can work on this issue during the weekend.
>
> Thanks!
>
> Vefa

[1] https://pany.fedorapeople.org/0001-usb-driver-debug.patch
[2] https://copr.fedorainfracloud.org/coprs/pany/kernel-macbook/build/1713250/
[3] https://download.copr.fedorainfracloud.org/results/pany/kernel-macbook/fedora-32-x86_64/01713250-kernel/builder-live.log.gz
[4] https://pany.fedorapeople.org/kernel-5.8.15-module_blacklist=apple-mfi-fastcharge-dev_info.txt
[5] https://koji.fedoraproject.org/koji/buildinfo?buildID=1625939
[6] https://pany.fedorapeople.org/kernel-5.8.15-module_blacklist=apple-mfi-fastcharge.txt
