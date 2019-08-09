Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5743487641
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 11:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406159AbfHIJeg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 9 Aug 2019 05:34:36 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:60730 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406114AbfHIJef (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 05:34:35 -0400
IronPort-SDR: IPIng5a+kCJ+7RZ2/Qg/886byMbxs41+Ktqi22Ak771P8295ZtG2gGWnQHhHzbvKpmontg+RIm
 rwebzOGIWozgo2aT0Cbp4/PocciFLLfDzmrPJJzfP7bek0R0bIkqOVeARxvxFatH91CRnLbp0t
 L9W/Lx8X40B9S+Hj1vm9K4g/n8xY1gngb4C389/pS1oxpY8ONYbnYKsrmdNo8wZHx3IstXQhnE
 j1Kw8YfHJ8/hrShHsKNyvTK8h1JqrUn6aey49+WdKhzH1HAQj7bW57apA3s59Wq9/037aHi7wu
 Lsw=
X-IronPort-AV: E=Sophos;i="5.64,364,1559548800"; 
   d="scan'208";a="40319986"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 09 Aug 2019 01:34:34 -0800
IronPort-SDR: U4/33JcPOGCms/uEcYr55voB7/srxhwYimyT44gCssMXcgqUdiWWR1CUKP2sTagJc3QFuEVf5e
 itXDbelpAu8XVx7NGjXpdaFBoKLQcYTWsoU0mCtl4g3zSMd8wmW7IUgGL6RKQPtSZLu7a8ZNM2
 Ga8zne9DCdPdU2fOlYSv+VOww1YQUMLWzIAeRDU8XOEAfnwGRd1jTqcbtzvNOoYpdmrCTFVMbZ
 65evsv1tdXvJdzrZyO3Im4BO25yggOoxLooMN3qotWDoTRswhsxsnIoNAnlKq3Au694YQgO8G4
 zgM=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: AW: KASAN: use-after-free Read in usbhid_power
Thread-Topic: KASAN: use-after-free Read in usbhid_power
Thread-Index: AQHVQVT8kp3cH3z0AEy3rfqKg0QMQKbaMLqAgAAB/4CAANH5gIAAXcMAgBY/mwCAAAvuAIAA2G/Q///144CAAChbQA==
Date:   Fri, 9 Aug 2019 09:34:29 +0000
Message-ID: <8e43085507b849e49e858e5388f3e13c@SVR-IES-MBX-03.mgc.mentorg.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
 <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190809075555.GA20409@kroah.com>
In-Reply-To: <20190809075555.GA20409@kroah.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> -----Ursprüngliche Nachricht-----
> Von: Greg KH [mailto:gregkh@linuxfoundation.org]
> Gesendet: Freitag, 9. August 2019 09:56
> An: Schmid, Carsten <Carsten_Schmid@mentor.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>; Andrey Konovalov
> <andreyknvl@google.com>; Oliver Neukum <oneukum@suse.com>;
> syzkaller-bugs <syzkaller-bugs@googlegroups.com>; syzbot
> <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>; USB list
> <linux-usb@vger.kernel.org>; Hillf Danton <hdanton@sina.com>
> Betreff: Re: KASAN: use-after-free Read in usbhid_power
> 
> On Fri, Aug 09, 2019 at 07:35:32AM +0000, Schmid, Carsten wrote:
> > Hi all having use-after-free issues in USB shutdowns:
> > I hunted for a similar case in the intel_xhci_usb_sw driver.
> > What i have found and proposed is (from yesterday):
> > ---
> > [PATCH] kernel/resource.c: invalidate parent when freed resource has
> childs
> >
> > When a resource is freed and has children, the childrens are
> > left without any hint that their parent is no more valid.
> > This caused at least one use-after-free in the xhci-hcd using
> > ext-caps driver when platform code released platform devices.
> >
> > Fix this by setting child's parent to zero and warn.
> >
> > Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
> > ---
> > Rationale:
> > When hunting for the root cause of a crash on a 4.14.86 kernel, i
> > have found the root cause and checked it being still present
> > upstream. Our case:
> > Having xhci-hcd and intel_xhci_usb_sw active we can see in
> > /proc/meminfo: (exceirpt)
> >   b3c00000-b3c0ffff : 0000:00:15.0
> >     b3c00000-b3c0ffff : xhci-hcd
> >       b3c08070-b3c0846f : intel_xhci_usb_sw
> > intel_xhci_usb_sw being a child of xhci-hcd.
> >
> > Doing an unbind command
> > echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
> > leads to xhci-hcd being freed in __release_region.
> > The intel_xhci_usb_sw resource is accessed in platform code
> > in platform_device_del with
> >                 for (i = 0; i < pdev->num_resources; i++) {
> >                         struct resource *r = &pdev->resource[i];
> >                         if (r->parent)
> >                                 release_resource(r);
> >                 }
> > as the resource's parent has not been updated, the release_resource
> > uses the parent:
> >         p = &old->parent->child;
> > which is now invalid.
> > Fix this by marking the parent invalid in the child and give a warning
> > in dmesg.
> > ---
> >  kernel/resource.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/kernel/resource.c b/kernel/resource.c
> > index 158f04ec1d4f..95340cb0b1c2 100644
> > --- a/kernel/resource.c
> > +++ b/kernel/resource.c
> > @@ -1200,6 +1200,15 @@ void __release_region(struct resource *parent,
> resource_size_t start,
> >                         write_unlock(&resource_lock);
> >                         if (res->flags & IORESOURCE_MUXED)
> >                                 wake_up(&muxed_resource_wait);
> > +
> > +                       write_lock(&resource_lock);
> 
> Nit, should't this be written so that you only drop/get the lock if the
> above if statement is true?
> 
What if some other async part invalidates the child while accessing it?
I wanted to make sure that the res->child is valid through the time it is accessed.

> > +                       if (res->child) {
> > +                               printk(KERN_WARNING "__release_region: %s has child
> %s,"
> > +                                               "invalidating childs parent\n",
> > +                                               res->name, res->child->name);
> 
> What can userspace/anyone do about this if it triggers?
> 
At least a platform driver developer can see he did something wrong.
I had a look at the code of Hans and did not see anything weird.
(platform driver is in drivers/usb/host/xhci-ext-caps.c)
The issue is very racy - what happens when the platform code accesses the
resource mainly depends on if the freed resource memory already has been
reused by someone.

It was hard to find that, and only a single core dump enabled me to find it.
A first attempt was to set resource count to 0 in Hans' driver in the unregister
pdev before calling platform_device_unregister. That worked.
But this is a dirty hack in my eyes. The framework should detect such issues,
so i decided to find the best place where to insert the check - and
found it is the place where the resource is freed and still has childrens.

> Can't we fix the root problem in the xhci driver to properly order how
> it tears things down?  If it has intel_xhci_usb_driver as a "child"
> shouldn't that be unbound/freed before the parent is?
> 
Hans, any idea?

> thanks,
> 
> greg k-h
