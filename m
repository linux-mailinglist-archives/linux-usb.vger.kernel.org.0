Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4527B1393F0
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 15:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgAMOsp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 09:48:45 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34012 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgAMOsp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 09:48:45 -0500
Received: by mail-pl1-f194.google.com with SMTP id g9so1701109plq.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 06:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H1A495sCKQ0huQ85fZvxF5wxClbZCD3QIFsR+gV0r68=;
        b=gST9nzOBIcFNhRjPHau2B13tSuVz06hPQWvqjcLnUTRyFOec/63x6+uQIX4hEy/mqL
         hwC75kJjXN8s3Rhlu89SwdZUloJLpQycMk3/CBZbs9c4+Fovfgco+DdG0q6rcCQjaxf2
         ZmBggszci4n4+yYldIS0zAD2n4Y+Os3Dj/JU0DyKba5QIjQu4E52RMMtRWgjMJ9nHoTG
         xyysbNseXi6FAv1vTKyKRw4w2IOzmKPTThRA64ZABuJULUulrxuCM919hw64Nz5veB37
         Pbn4ZEDElWVZDNOEL4tSN0dUZ+3tFwmc8jfQKPYCopZ8HKw59XQdsKc2AjUje/ixoimf
         6Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H1A495sCKQ0huQ85fZvxF5wxClbZCD3QIFsR+gV0r68=;
        b=D0zrWz1EC68N+CVI5suXMBkJGYFlNiIwtMIw4EpzDVNPcqs+XsknJPJvtMBoMTooX8
         C6VZBoIsxisBIWh9ueQtYoRoKicfLi6QqM0xKwCjpLuCP5ukDHgGfKrY3VTd1BtuoXya
         ExvAEE7KUa1qn2YLW5ZhAJae+osODUW/8tvFTRMSAIiFZPlqCvoOtEzI+vteCcyuFuVG
         U18ub4lVgTVBzSDiUPJMBnbbEsRVNy5ZYrbIhrnknbicB87yuU+aQ/zeHVbugLQWLkqY
         II7AQKpnMfIxn3U+HTylExJO8EEDFwhqT/zsPB4JyY7St9QAGopQp+h3oimw/73NyaXD
         l6wQ==
X-Gm-Message-State: APjAAAW13xT0Tik4vffslQw1ZBp6szEqEx9Jcrs7dVga23Nh+iedkJY8
        gw4XmPlcsCgS0hW94OU0WG7msTCv2VYsVx64TdyYypoiky8=
X-Google-Smtp-Source: APXvYqwD1WdUXbjQHYT4rfI1xCOCFxcr5E0KSZYB7KbV7DPa26sn6zuQB8dDsa9K2XszqM9pxMnT8dc+6vYmzGag18g=
X-Received: by 2002:a17:90a:1a0d:: with SMTP id 13mr22691845pjk.129.1578926924247;
 Mon, 13 Jan 2020 06:48:44 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911151038480.1527-100000@iolanthe.rowland.org>
 <CAAeHK+z6m8mXEH-L+W+8FxjasrMX6BGMEdTq_hgUYerp+_0kjA@mail.gmail.com>
 <20191116084854.GA384892@kroah.com> <CAAeHK+xjUhR077goAHv=re78C6pzzSEBQxU+LZcOs0iCu2ZStg@mail.gmail.com>
 <20191118163958.GA595190@kroah.com> <CAAeHK+zWYAMJ5FQeTYNpCVH8Cnbyh11=0fqSh=oaEJLxNaXusQ@mail.gmail.com>
 <20191118175718.GA603730@kroah.com>
In-Reply-To: <20191118175718.GA603730@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 13 Jan 2020 15:48:33 +0100
Message-ID: <CAAeHK+xfOEMeBxxOsqXa3Jdmv3a5MXEcKbLOsS_RYBRzB7X+qQ@mail.gmail.com>
Subject: Re: Exporting USB device ids from the kernel
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 6:57 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Nov 18, 2019 at 06:42:25PM +0100, Andrey Konovalov wrote:
> > On Mon, Nov 18, 2019 at 5:40 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Nov 18, 2019 at 05:12:34PM +0100, Andrey Konovalov wrote:
> > > > On Sat, Nov 16, 2019 at 9:49 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Nov 15, 2019 at 05:10:26PM +0100, Andrey Konovalov wrote:
> > > > > > On Fri, Nov 15, 2019 at 4:44 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > > >
> > > > > > > On Fri, 15 Nov 2019, Andrey Konovalov wrote:
> > > > > > >
> > > > > > > > Hi Greg and Alan,
> > > > > > > >
> > > > > > > > For USB fuzzing it would be nice to be able to export usb_device_id
> > > > > > > > structs from the kernel to facilitate the fuzzer with generating USB
> > > > > > > > descriptors that match to actual drivers. The same is required for
> > > > > > > > hid_device_id structs, since those are matched separately by the
> > > > > > > > usbhid driver (are there other cases like this?).
> > > > > > > >
> > > > > > > > Currently I have a hacky patch [1] that walks all drivers for USB and
> > > > > > > > HID buses and then prints all device ids for those drivers into the
> > > > > > > > kernel log. Those are manually parsed and built into the fuzzer [2]
> > > > > > > > and then used to generate USB descriptors [3].
> > > > > > >
> > > > > > > There are so many different flags for those id structures, parsing and
> > > > > > > understanding them must be quite difficult.
> > > > > > >
> > > > > > > > I'm thinking of making a proper patch that will add a debugfs entry
> > > > > > > > like usb/drivers (and usb/hid_drivers?), that can be read to get
> > > > > > > > USB/HID device ids for all loaded drivers. Would that be acceptable?
> > > > > > > > Or should I use some other interface to do that?
> > > > > > >
> > > > > > > I can't think of a better way to get the information from a running
> > > > > > > kernel.
> > > > > > >
> > > > > > > There is another possibility, though.  If the drivers are built as
> > > > > > > modules, the information is already available to userspace tools via
> > > > > > > depmod.  You could get it from the modules.dep.bin file.  This has the
> > > > > > > advantage that it will work even for drivers that aren't currently
> > > > > > > loaded.
> > > > > >
> > > > > > This is the same thing Greg mentions above, right?
> > > > >
> > > > > Yes.
> > > > >
> > > > > > Would this work for drivers that are built into the kernel (as =y)?
> > > > >
> > > > > No, sorry.  There has not been any need to export that information to
> > > > > userspace as nothing has ever needed that.
> > > > >
> > > > > The only reason we exported that at all was to allow modules to
> > > > > auto-load to handle the device.
> > > >
> > > > OK, I see. Ideally we would want to support both builtin drivers and
> > > > modules. I'll then implement the approach with exporting the ids
> > > > through debugfs. I'll send a patch once I have it.
> > >
> > > Note, this is part of the build/link process (see what
> > > MODULE_DEVICE_TABLE() does), so I don't know if you will be able to do
> > > it in debugfs very easily.
> >
> > Take a look at the patch I've linked [1]. It iterates all drivers on
> > the USB bus via bus_for_each_drv and then iterates both builtin ids
> > (in usb_device_id_dump_static) and the ones that come from modules (in
> > usb_device_id_dump_dynamic) (at least that's how I understand the code
> > that I've written :). The patch just does that in a weird place and
> > prints ids to kernel log. It seems it should be easy to change it to
> > do the same in a read() handler of a debugfs entry.
> >
> > [1] https://github.com/google/syzkaller/blob/master/tools/syz-usbgen/usb_ids.patch
>
> Iterating over all of that is a mess, why not stick with the stuff we
> already are generating for modules to use?
>
> > > Why not put it in /sys/module/MODULE_NAME/ ?
> >
> > I can look into this, if that's what you prefer. In this case we'll
> > need to iterate over all dirs in /sys/module to find the ones that
> > export some USB ids. Seems less convenient than a single debugfs file
> > approach, but would also work AFAIU.
>
> It could be done at build time, like the MODULE_DEVICE_TABLE() logic
> works, and that way you get it for all bus types, not just USB.  And
> this is a module issue really, right?  Yes, the mapping from module name
> to driver name is not always the same, but it should be close.
>
> Otherwise, something in the driver core would be good to do, again, that
> way you get this for all busses/drivers.

OK, I've looked at this more and what I currently have is a PoC patch
below (gmail-corrupted, sorry).

The issue with having multiple variables with the same name is
resolved by appending the line number to each variable name (as well
as the device table name). I've initially tried to use KBUILD_MODNAME
as a part of variable names, but it doesn't work, since KBUILD_MODNAME
is a string. Since exposing KBUILD_MODNAME is desirable, I've used the
same approach with structs that MODULE_VERSION() uses.

Still, with this approach I get a few section mismatch warnings like:

WARNING: vmlinux.o(.data+0x26210): Section mismatch in reference from
the variable __mod_dt_rh
The variable __mod_dt_rapl_model_match_747 references
the variable __initconst rapl_model_match
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

since rapl_model_match is declared as __initconst.

I'm not yet sure how to work around that.

Greg, does this look like something that you had in mind?

Patch:

diff --git a/include/linux/module.h b/include/linux/module.h
index bd165ba68617..d78c6f63d2ba 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -72,6 +72,12 @@ extern ssize_t __modver_version_show(struct
module_attribute *,

 extern struct module_attribute module_uevent;

+struct module_device_table_info {
+       const char *module_name;
+       const char *type;
+       const void *addr;
+} __attribute__ ((__aligned__(sizeof(void *))));
+
 /* These are either module local, or the kernel's dummy ones. */
 extern int init_module(void);
 extern void cleanup_module(void);
@@ -229,8 +235,26 @@ extern void cleanup_module(void);
 #define MODULE_DEVICE_TABLE(type, name)
         \
 extern typeof(name) __mod_##type##__##name##_device_table              \
   __attribute__ ((unused, alias(__stringify(name))))
+
 #else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
+
+/* TODO: This goes under CONFIG_MODULE_SOMETHING: */
+
+#define MODULE_DEVICE_TABLE_II(t, n, l)
         \
+       static struct module_device_table_info __mod_dt_##n##_##l = {   \
+               .module_name    = KBUILD_MODNAME,                       \
+               .type           = #t,                                   \
+               .addr           = (const void *)&(n),                   \
+       };                                                              \
+       static const struct module_device_table_info                    \
+       __used __attribute__ ((__section__ ("__moddt")))                \
+       * __moduleparam_const __mod_dt_ptr_##n##_##l = &__mod_dt_##n##_##l
+
+#define MODULE_DEVICE_TABLE_I(type, name, line)
         \
+       MODULE_DEVICE_TABLE_II(type, name, line)
+#define MODULE_DEVICE_TABLE(type, name)
         \
+       MODULE_DEVICE_TABLE_I(type, name, __LINE__)                     \
+
 #endif
