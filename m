Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E3D8734F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 09:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405842AbfHIHmq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 9 Aug 2019 03:42:46 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:49041 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405800AbfHIHmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 03:42:46 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Aug 2019 03:42:45 EDT
IronPort-SDR: Ht+FDyGTeS9JIGocTyR6KcuGfJd0YMywcC3GZ1/gVu63ezIbBRM/y4/2R3Lo+PXF6WC8fNd3oi
 qBxlCHcFWanaWSvdW/Z2SCOs2yIzLILEV7ebGaC254PJ+O/uJY5ONtt2BGuuPFEc3V6I+MYOs9
 7feGTcjWiwMzx/U2weHAu0p2K/dXf2jLkjsK15i7QE6re3AZLsk3NEWgibmUmlLh97n+kY41KL
 yS1bE0DDGFhAeXznYurHewl4m+OX9wmgIMBVWJJZxXr0D6+7DHS2HUx9gd61c66Jmtxr2liGwH
 prY=
X-IronPort-AV: E=Sophos;i="5.64,364,1559548800"; 
   d="scan'208";a="40317323"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 08 Aug 2019 23:35:38 -0800
IronPort-SDR: nFsss0wk9pPaOySz08B3CzMEQy3x13/RKZQnDxzOXLXXW3rK56YwD3akyGpZF+BNkl7S0P+Tmo
 B6jNcsaZv7mWwIlZl9GpHHgGcyj3zGkeB7hMBoqCsiM1hmnwCGbdWwRflAfJWs8UlgbM4Kojrt
 q1MA3UYUKUf1LVmFBF62VfaY/PTUz/+10bHYym3a+50tooyxzvZgDC7t13TUWYDtTQYfuGE2b/
 Y4zhMftlC8TxZYRoTUDvPjEJtMDJZANz8HlXijDGjoZLeSp+NweiMLhDR79IKoSA05qf4OM4ME
 Ui0=
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>
CC:     Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: AW: KASAN: use-after-free Read in usbhid_power
Thread-Topic: KASAN: use-after-free Read in usbhid_power
Thread-Index: AQHVQVT8kp3cH3z0AEy3rfqKg0QMQKbaMLqAgAAB/4CAANH5gIAAXcMAgBY/mwCAAAvuAIAA2G/Q
Date:   Fri, 9 Aug 2019 07:35:32 +0000
Message-ID: <caf422aebd314ab8a5dd96ac2d9bb198@SVR-IES-MBX-03.mgc.mentorg.com>
References: <CAAeHK+wb8=Z65_1CGcj0ShT6+NiQSDKhEkBVx+8vPe3kJF8+6g@mail.gmail.com>
 <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908081522290.1319-100000@iolanthe.rowland.org>
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

Hi all having use-after-free issues in USB shutdowns:
I hunted for a similar case in the intel_xhci_usb_sw driver.
What i have found and proposed is (from yesterday):
---
[PATCH] kernel/resource.c: invalidate parent when freed resource has childs

When a resource is freed and has children, the childrens are
left without any hint that their parent is no more valid.
This caused at least one use-after-free in the xhci-hcd using
ext-caps driver when platform code released platform devices.

Fix this by setting child's parent to zero and warn.

Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
---
Rationale:
When hunting for the root cause of a crash on a 4.14.86 kernel, i
have found the root cause and checked it being still present
upstream. Our case:
Having xhci-hcd and intel_xhci_usb_sw active we can see in
/proc/meminfo: (exceirpt)
  b3c00000-b3c0ffff : 0000:00:15.0
    b3c00000-b3c0ffff : xhci-hcd
      b3c08070-b3c0846f : intel_xhci_usb_sw
intel_xhci_usb_sw being a child of xhci-hcd.

Doing an unbind command
echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
leads to xhci-hcd being freed in __release_region.
The intel_xhci_usb_sw resource is accessed in platform code
in platform_device_del with
                for (i = 0; i < pdev->num_resources; i++) {
                        struct resource *r = &pdev->resource[i];
                        if (r->parent)
                                release_resource(r);
                }
as the resource's parent has not been updated, the release_resource
uses the parent:
        p = &old->parent->child;
which is now invalid.
Fix this by marking the parent invalid in the child and give a warning
in dmesg.
---
 kernel/resource.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/resource.c b/kernel/resource.c
index 158f04ec1d4f..95340cb0b1c2 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -1200,6 +1200,15 @@ void __release_region(struct resource *parent, resource_size_t start,
                        write_unlock(&resource_lock);
                        if (res->flags & IORESOURCE_MUXED)
                                wake_up(&muxed_resource_wait);
+
+                       write_lock(&resource_lock);
+                       if (res->child) {
+                               printk(KERN_WARNING "__release_region: %s has child %s,"
+                                               "invalidating childs parent\n",
+                                               res->name, res->child->name);
+                               res->child->parent = NULL;
+                       }
+                       write_unlock(&resource_lock);
                        free_resource(res);
                        return;
                }
--
2.17.1

> -----Ursprüngliche Nachricht-----
> Von: linux-usb-owner@vger.kernel.org [mailto:linux-usb-
> owner@vger.kernel.org] Im Auftrag von Alan Stern
> Gesendet: Donnerstag, 8. August 2019 21:37
> An: Andrey Konovalov <andreyknvl@google.com>
> Cc: Oliver Neukum <oneukum@suse.com>; syzkaller-bugs <syzkaller-
> bugs@googlegroups.com>; syzbot
> <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>; USB list
> <linux-usb@vger.kernel.org>; Hillf Danton <hdanton@sina.com>
> Betreff: Re: KASAN: use-after-free Read in usbhid_power
> 
> On Thu, 8 Aug 2019, Andrey Konovalov wrote:
> 
> > On Thu, Jul 25, 2019 at 5:09 PM Alan Stern <stern@rowland.harvard.edu>
> wrote:
> > >
> > > On Thu, 25 Jul 2019, Oliver Neukum wrote:
> > >
> > > > Am Mittwoch, den 24.07.2019, 17:02 -0400 schrieb Alan Stern:
> > > > > On Wed, 24 Jul 2019, Oliver Neukum wrote:
> > > > >
> > > > > >  drivers/hid/usbhid/hid-core.c | 13 +++++++++++++
> > > > > >  1 file changed, 13 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-
> core.c
> > > > > > index c7bc9db5b192..98b996ecf4d3 100644
> > > > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > > > @@ -1229,6 +1229,17 @@ static int usbhid_power(struct hid_device
> *hid, int lvl)
> > > > > >   struct usbhid_device *usbhid = hid->driver_data;
> > > > > >   int r = 0;
> > > > > >
> > > > > > + spin_lock_irq(&usbhid->lock);
> > > > > > + if (test_bit(HID_DISCONNECTED, &usbhid->iofl)) {
> > > > > > +         r = -ENODEV;
> > > > > > +         spin_unlock_irq(&usbhid->lock);
> > > > > > +         goto bail_out;
> > > > > > + } else {
> > > > > > +         /* protect against disconnect */
> > > > > > +         usb_get_dev(interface_to_usbdev(usbhid->intf));
> > > > > > +         spin_unlock_irq(&usbhid->lock);
> > > > > > + }
> > > > > > +
> > > > > >   switch (lvl) {
> > > > > >   case PM_HINT_FULLON:
> > > > > >           r = usb_autopm_get_interface(usbhid->intf);
> > > > > > @@ -1238,7 +1249,9 @@ static int usbhid_power(struct hid_device
> *hid, int lvl)
> > > > > >           usb_autopm_put_interface(usbhid->intf);
> > > > > >           break;
> > > > > >   }
> > > > > > + usb_put_dev(interface_to_usbdev(usbhid->intf));
> > > > > >
> > > > > > +bail_out:
> > > > > >   return r;
> > > > > >  }
> 
> > This report looks like very similar to these two:
> >
> > https://syzkaller.appspot.com/bug?extid=b156665cf4d1b5e00c76
> > https://syzkaller.appspot.com/bug?extid=3cbe5cd105d2ad56a1df
> 
> It also seems to resemble extids a7a6b9c609b9457c62c6,
> 62a1e04fd3ec2abf099e, and 75e6910bf03e266a277f, although this may be an
> illusion.
> 
> > Maybe we should mark those two as duplicates.
> >
> > Hillf suggested a fix on one of them, but it looks different from what
> > you propose:
> >
> > https://groups.google.com/d/msg/syzkaller-
> bugs/xW7LvKfpyn0/SpKbs5ZLEAAJ
> 
> Go ahead and try it out on all of them.  I don't have a clear feeling
> about it, not having worked on usbhid in quite a while.
> 
> Alan Stern

