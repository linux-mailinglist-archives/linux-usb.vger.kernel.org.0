Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B851388CA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 00:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387464AbgALXjh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jan 2020 18:39:37 -0500
Received: from vimdzmsp-sfwd05.bluewin.ch ([195.186.120.133]:49954 "EHLO
        vimdzmsp-sfwd05.bluewin.ch" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727323AbgALXjh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jan 2020 18:39:37 -0500
X-Greylist: delayed 360 seconds by postgrey-1.27 at vger.kernel.org; Sun, 12 Jan 2020 18:39:34 EST
Received: from mail-ua1-f54.google.com ([209.85.222.54])
        by vimdzmsp-sfwd05.bluewin.ch Swisscom AG with SMTP
        id qmjbioCJ6f1buqmjcigeIi; Mon, 13 Jan 2020 00:33:32 +0100
X-Bluewin-Spam-Analysis: v=2.1 cv=PY8y/nVd c=1 sm=1 tr=0
 a=+oUN4BlkYWoM1I+hJDrd0A==:117 a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10
 a=s5jvgZ67dGcA:10 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=Jdjhy38mL1oA:10 a=LSy1col6AAAA:20 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=b8udyDiBAAAA:20 a=VwQbUJbxAAAA:8 a=CrrslrKaOM62Hk8giIEA:9 a=QEXdDO2ut3YA:10
 a=x8gzFH9gYPwA:10 a=AjGcO6oz07-iQ99wixmX:22
X-Bluewin-Spam-Score: 0.00
X-FXIT-IP: IPv4[209.85.222.54] Epoch[1578872012]
X-Bluewin-AuthAs: samuel.sadok@bluewin.ch
Received: by mail-ua1-f54.google.com with SMTP id o42so2667742uad.10
        for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2020 15:33:32 -0800 (PST)
X-Gm-Message-State: APjAAAUcyx5ipESiFJk493XjwxNCu1W5CK4fpuS+2PdxNJsnmP7Gr9vW
        /SzeCv6iIwQr8eKy9WICswGWFuUb9vpbKwJDxbk=
X-Google-Smtp-Source: APXvYqzKdO4AL3o/IWe67NjcdVjDs3JdotVyRj7jLqt3YhM3xjEeH+Y4eKAJoHb6/wve5/7v8XNCeS2Y3Ue5smm5nAM=
X-Received: by 2002:ab0:e07:: with SMTP id g7mr5539813uak.59.1578872011225;
 Sun, 12 Jan 2020 15:33:31 -0800 (PST)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1801251043430.1531-100000@iolanthe.rowland.org>
 <396c2337-d9de-01fe-47f8-03d7a12d1b93@linux.intel.com> <fb8553cb-0fce-2359-1266-c794c6fef7dc@linux.intel.com>
 <CAJ4e7SVgU5cUrR=aRbQJntOXZs8na3A5jiLFQ6ZVagkTsuw5OA@mail.gmail.com>
 <05b9ea64-fd85-b003-d764-cf610a0138c9@intel.com> <b0681e13-92a3-a485-31d8-ab93c347c189@linux.intel.com>
 <CAJ4e7SU0KUVGHGZCmarLmn8GUXUchFtQ9h_NVbW-ubWYKtCNZw@mail.gmail.com> <3b197634-c51c-8cac-b786-42a36791b5b5@linux.intel.com>
In-Reply-To: <3b197634-c51c-8cac-b786-42a36791b5b5@linux.intel.com>
From:   Samuel Sadok <samuel.sadok@bluewin.ch>
Date:   Mon, 13 Jan 2020 00:33:20 +0100
X-Gmail-Original-Message-ID: <CAJ4e7SX=vJXx1=AQ+f9ajJK_BBgzV-u_vr9V+uLffyv4+vO+ug@mail.gmail.com>
Message-ID: <CAJ4e7SX=vJXx1=AQ+f9ajJK_BBgzV-u_vr9V+uLffyv4+vO+ug@mail.gmail.com>
Subject: Re: [BUG] SD card reader disappears after suspend
To:     USB list <linux-usb@vger.kernel.org>
Cc:     Samuel Sadok <samuel.sadok@bluewin.ch>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>, yu.c.chen@intel.com,
        mironov.ivan@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CMAE-Envelope: MS4wfE8ePxx8hbEB8ND13tZTY2bncVmdxf41VOR0zUC/aJiXtEf1gHBldakmq5YHjiEnyW3MQ3k9HUzIP85vluHaFPfJ99oV3xFx8+fXfE4SY2HNuMoeLVei
 LRSbw8uDZHyMKI6JW9X+u/gHbP6WKGbDy8annsbyJOa1mFZBnS39KZQYoeMtHtWkVFSMs1yO0WmjXwKey5bwDGYSZe6TrUSr9Dw=
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

It's been a while that there was any discussion on this bug so here's
a brief context: There's a bug on some MacBook Pro's where the
built-in SD card reader would be missing after a suspend/resume cycle.

After looking at the schematics for my laptop I noticed that
`OC6*/GPIO10` of the Intel PCH is connected to a net called
`SD_PWR_EN`. So I tried to set this pin to 0 and then to 1 again in
order to completely power cycle the card reader. Turns out this
finally makes the card reader appear after a suspend/resume cycle.

For the record, here's the user space workaround:
https://gist.github.com/samuelsadok/6d7b3e3015d3370a92ed4702e4d3c4b5#gistcomment-3134437

Are there other buggy devices for which the kernel already implements
such a power cycle? Otherwise, where would be the right place to add
this?

Additional observations:
 - by default (after boot), GPIO10 is configured as input and shows
the state "high". In the schematics there's a pull-up resistor. and I
assume it goes to a mosfet (off-sheet). So the problem is not that the
card reader has no power after suspend. It just needs a power cycle.
 - the card reader is connected to the PCH via the four USB3 data
lines, but the two USB2 data lines are not connected. Is this a legal
configuration? Might this prevent the card reader from receiving power
state commands?

Best,
Samuel



Am Do., 15. Feb. 2018 um 16:36 Uhr schrieb Mathias Nyman
<mathias.nyman@linux.intel.com>:
>
> On 14.02.2018 15:06, Samuel Sadok wrote:
> > Thanks for the patches.
> >
> > However no luck yet, the usb device still doesn't reinitialize.
> >
> > Logs:
> > https://gist.github.com/90ccb390c5777b9e2d5dc595f44d50da
> >
> > Can I somehow check if it is at all possible to bring back this
> > particular device after hub power loss?
> > For instance would you expect reloading all USB modules to bring back
> > the device? I tried that and it didn't help:
>
> I'm starting to run out if ideas, maybe powering port off and on again
> in the logical disconnect could be worth a shot, or maybe trying
> to disable->re-enable port a bit earlier, before the disconnect
>
> -Mathias
>
> >
> > #!/bin/bash
> > echo "Unload modules..."
> > echo 1 > /sys/bus/pci/devices/0000\:00\:14.0/remove
> > rmmod xhci_pci
> > rmmod xhci_hcd
> > rmmod usbhid
> > rmmod bcm5974
> > rmmod btusb
> > rmmod uas
> > rmmod usb_storage
> > rmmod usbcore
> > rmmod usb_common
> > echo "wait"
> > sleep 2
> > echo "Reload modules..."
> > modprobe usb_common
> > modprobe usbcore
> > modprobe usb_storage
> > modprobe uas
> > modprobe btusb
> > modprobe bcm5974
> > modprobe usbhid
> > modprobe xhci_hcd
> > modprobe xhci_pci
> > echo 1 > /sys/bus/pci/rescan
> >
> >
> >
> > 2018-02-13 17:07 GMT+01:00 Mathias Nyman <mathias.nyman@linux.intel.com>:
> >> On 12.02.2018 16:03, Mathias Nyman wrote:
> >>>
> >>> On 10.02.2018 02:01, Samuel Sadok wrote:
> >>>>
> >>>> Thanks Mathias for looking into this.
> >>>>
> >>>> 2018-02-06 18:32 GMT+01:00 Mathias Nyman <mathias.nyman@linux.intel.com>:
> >>>>>
> >>>>>
> >>>>> Does reverting
> >>>>> 37be6676 usb: hub: Fix auto-remount of safely removed or ejected USB-3
> >>>>> devices
> >>>>> help?
> >>>>
> >>>>
> >>>> Unfortunately not, the card reader is still missing after resume.
> >>>>
> >>>> Here's the dmesg and usbmon (as previously, doing one suspend-resume
> >>>> cycle):
> >>>> https://gist.github.com/anonymous/5aea8eddf97e1b964bffd75ed88793fd
> >>>>
> >>>> For this log I also increased the usbmon buffer size as suggested by
> >>>> Alan (to about 2MB). This (seemingly) resolved the issue with the log
> >>>> gaps.
> >>>>
> >>> Ok, one reason reverting didn't help is that it we still don't really
> >>> disable and re-enable:
> >>>
> >>> [  100.771564] usb usb2-port4: logical disconnect
> >>> ...
> >>> [ 100.771586] usb usb2-port4: Not disabling port; link state is RxDetect
> >>>
> >>>> The reset resume of device "usb 2-4" (the device in question) happens
> >>>> around [100.77].
> >>>> In the usbmon log there is no activity at that exact time, only ~50ms
> >>>> before and after. Can we infer from this that the issue is independent
> >>>> from the actual device and must stem from some faulty state in the
> >>>> kernel or USB controller?
> >>>>
> >>>> Btw I also added/modified some debug lines for my own understanding,
> >>>> those are tagged with "[CUSTOM LOG]".
> >>>>
> >>>>> * check that root cause for failing USB3 device reset after resume is
> >>>>> not
> >>>>> that several
> >>>>>     xhci slots are in Default state at the same time. xHC can't handle
> >>>>> this.
> >>>>>     In normal device enumeration usb core has a mutex protecting it, not
> >>>>> sure
> >>>>> it works here,
> >>>>>     maybe usb core and xhci are out of sync after xHC reset?
> >>>>
> >>>>
> >>>> I find this line in particular interesting:
> >>>> [ 100.771536] xhci_hcd 0000:00:14.0: [CUSTOM LOG] xHCI
> >>>> xhci_urb_enqueue called with unaddressed device, slot_id = 1
> >>>> This comes from xhci_check_args(). Since udev->slot_id == 1 is
> >>>> non-zero this implies that xhci->devs[udev->slot_id] must be NULL for
> >>>> this particular device (usb 2-4), which I guess is not good. So to me
> >>>> this does indeed look like the usb core and xhci are out of sync.
> >>>>
> >>>> However I'm not familiar with the code (for instance what is slot_id
> >>>> is for, who uses it, should it always be 0 on resume?) but based on
> >>>> the log and what you wrote I guess this sounds like a good point:
> >>>
> >>>
> >>> xhci uses slot_id to identify different usb devices connected to it.
> >>> xHC hw gives each enabled attached usb device a slot_id.
> >>> When usb core asks xhci host to do something to a device xhci driver knows
> >>> which device based on udev->slot_id
> >>>
> >>> when xhci controller is reset, all xhci slots are disabled and freed, but
> >>> usb core still has udev->slot_id pointers set.
> >>>
> >>> In normal resume case the xHC controller is not reset, but if something
> >>> goes wrong,
> >>> or power is cut from xHC during suspend then we recover by resetting xHC
> >>> at resume.
> >>>
> >>> I'll try to write some quick testpatches that:
> >>> - removes LPM and LTM disabling from usb_reset_and_verify_device
> >>> - zeroes udev->slot_id when slot is disabled and freed in xhci
> >>> - forces a disable/enable port after port reset failed a few times.
> >>>
> >>
> >> A series for testing can be found at:
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
> >> port-disable-test
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=port-disable-test
> >>
> >> Based on 4.15
> >> Can you try it out?
> >>
> >>
> >> -Mathias
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
