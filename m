Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87935193905
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 07:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgCZGyF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 02:54:05 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37590 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgCZGyE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 02:54:04 -0400
Received: by mail-pg1-f195.google.com with SMTP id a32so2411108pga.4;
        Wed, 25 Mar 2020 23:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=irHhJ4FW1FooG54OXFIdqp5Kwi3iVj6Axe06f7CYwF4=;
        b=CaJn9Wm7E+8H8py7nPUHiPEz6dqWW5/BB9GHPn6ly/gBVoCn6o3R7GVyB5LuKJjdZ1
         20FseggxMy02OBxhGIXad/VLrjcvFGwoLpWJY3OsoCZfdW9oq1gF+5kpAIAS3TmCsGx+
         50O4ttqI4iu2bA4mMtLxIZ//OVeCJY6Hq8sHlDRK0wXW6ftbmLnmB97SpJ/VJkw0Rt68
         yWcnXgjPdSLpGcHX1ViVBlJJkRZcQgJtrDhdhLHYAcgkJkaoxvrHJT4TZnH24nh1pUBw
         Ku8eWveTG8Fh/CEIMTapz+EfLye9Oclrwam5zDf14kSpCjrKuAHDXtkFB45kGeFK87Fj
         7dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=irHhJ4FW1FooG54OXFIdqp5Kwi3iVj6Axe06f7CYwF4=;
        b=WWEEKs5HaqoPvz2e7ACF2kc/QLRcoNS2suUtKbeULdVEnTkcb9PobILCe+rcz9fOPG
         ggM5ZLKMBVi2mpqNbEHS/WrYhF2gsVQ3FwZyf3Rf53qtoTIB+yDVAsRf0+mbmDf/O0yH
         6qqE6VXJQXja5v2QvfLwW9lYImrNRQUErFQZgNrgxPVHTRtRXML0MoQCqu6k4dqfmzxt
         i5B4V6a8a8k9IR4k99OxigczFWkAQM2k2nxv6CvBCnt+sMn0laYmYp7GMJsb+zZ/9heE
         zvtlmEqHrYXRP0ow0VYeccPI+Not+RouQqubhXbglDY4A36D/F6HHEPvAuM9i0NMN0tq
         3WYw==
X-Gm-Message-State: ANhLgQ19FwyUkPOiBH5x2PIwNxj1xKmNCVUoqaUkTIpD20NZzSdXbD07
        vgOflyIqzcC4LXHlfsbmdAye41VTIL4=
X-Google-Smtp-Source: ADFU+vsWK7wRkoIw8PZkvL1J8srMKuzkUJPdNMChw04bxgvq50IqMICgChJSMmQ427lEiII/l9u5LQ==
X-Received: by 2002:a63:7508:: with SMTP id q8mr6224712pgc.300.1585205641128;
        Wed, 25 Mar 2020 23:54:01 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id e126sm873595pfa.122.2020.03.25.23.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 23:54:00 -0700 (PDT)
Message-ID: <5e7c5188.1c69fb81.16130.41e1@mx.google.com>
X-Google-Original-Message-ID: <20200326065357.GB3915@rohitsarkar5398@gmail.com>
Date:   Thu, 26 Mar 2020 12:23:57 +0530
From:   Rohit Sarkar <rohitsarkar5398@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Hubert CHAUMETTE <hubert.chaumette@kolabnow.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-newbie@vger.kernel.org
Subject: Re: Beginner query regarding usbhid
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
 <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
 <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
 <5e7b9127.1c69fb81.f2f8b.582c@mx.google.com>
 <cfda560c-ad5f-5e71-ab22-d8639688722b@infradead.org>
 <5e7c3e48.1c69fb81.7da14.34ab@mx.google.com>
 <fdc818d7-842c-cfef-3654-0478e74bfa73@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdc818d7-842c-cfef-3654-0478e74bfa73@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 25, 2020 at 11:07:55PM -0700, Randy Dunlap wrote:
> On 3/25/20 10:31 PM, Rohit Sarkar wrote:
> > On Wed, Mar 25, 2020 at 02:40:27PM -0700, Randy Dunlap wrote:
> >> On 3/25/20 10:13 AM, Rohit Sarkar wrote:
> >>> On Wed, Mar 25, 2020 at 04:41:38PM +0100, Hubert CHAUMETTE wrote:
> >>>> Le 25/03/2020 15:47, Rohit Sarkar a écrit :
> >>>>> I was trying to mess around with the driver that drives my mouse. I
> >>>>> found out that it is usbhid. I then added a printk statement to the init
> >>>>> and exit function of usbhid.
> >>>>> I then compiled and installed the usbhid drivers. Post that I ran
> >>>>> `sudo modprobe -r usbhid` and `sudo modprobe usbhid` but couldnt observe
> >>>>> any logs in dmesg.
> >>>>>
> >>>>> I am certain I am missing something fundamental. Could someone help me
> >>>>> with this.
> >>>>
> >>>> Hi,
> >>>>
> >>>> Did you check whether your module was effectively loaded with lsmod?
> >>>> What log level did you use in your printk statement? Depending on your
> >>>> system default loglevel your logs might not be printed. A quick fix
> >>>> would be to use one of the lowest levels (pr_emerg, but pr_err might
> >>>> suffice).
> >>>> Regards,
> >>>
> >>> Hey,
> >>> I did check that module was loaded. And one of the signs was that my
> >>> mouse started working after insmod :).
> > Hi,
> >> Hi,
> >> I'm not convinced that your modified usbhid module was loaded.
> > Hmm, here's my dmesg logs if that helps:
> > "
> > [  382.132319] usbcore: deregistering interface driver usbhid
> > [  391.077410] input: MOSART Semi. 2.4G Wireless Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:3938:1031.0002/input/input26
> > [  391.136724] input: MOSART Semi. 2.4G Wireless Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:3938:1031.0002/input/input27
> > [  391.137285] hid-generic 0003:3938:1031.0002: input,hiddev0,hidraw0: USB HID v1.10 Mouse [MOSART Semi. 2.4G Wireless Mouse] on usb-0000:00:14.0-2/input0
> > [  391.137480] usbcore: registered new interface driver usbhid
> > [  391.137483] usbhid: USB HID core driver
> > "
> 
> I can't tell that helps any.
> 
> >> Could an older (original) usbhid module be reloaded so that the mouse
> >> started working again?  That would also explain the lack of (new) messages.
> > I think so too. But how do I verify if this is the case?
> > 
> >> What kernel version are you using?  Is it a distro kernel?
> > I am currently running a bleeding edge kernel that I built. ie 5.6-rc7. 
> >> Are you trying to replace the usbhid module in a distro kernel or are
> >> you building the entire kernel?
> > I am building the entire kernel
> >>> I used printk(KERN_ALERT "some message") for logging. I also tried with
> >>> KERN_ERR but no luck. 
> >>>
> >>> The command I used for building was "make -C /home/rohit/LINUX/kernels/staging  M=$(pwd)"
> >>> and for installing the modules: "sudo make -C /home/rohit/LINUX/kernels/staging  M=$(pwd) modules_install"
> >>> both were executed from the usbhid directory.
> >>
> >> why those commands?  seems unusual.
> > My Linux kernel source is in the directory mentioned in the commands. So
> > it is same as running "make M=drivers/hid/usbhid/" from the linux kernel
> > source root.
> 
> So /home/rohit/kernels/staging is the top-level kernel source directory?
> 
> "M=dir" is for external modules to be built.  AFAICT you are not building any
> external modules.
Oh, I think M=dir options just makes the Makefile build the folder
specified. I see such an output when I run the make command which makes
me feel that the make command I am using is actually building the
modules:
"
drivers/hid/usbhid❯ make -C /home/rohit/LINUX/kernels/staging  M=$(pwd)                                            staging/git/master !
make: Entering directory '/home/rohit/LINUX/kernels/staging'
  AR      /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/built-in.a
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/hid-core.o
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/hiddev.o
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/hid-pidff.o
  LD [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbhid.o
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbkbd.o
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbmouse.o
  MODPOST 3 modules
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbhid.mod.o
  LD [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbhid.ko
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbkbd.mod.o
  LD [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbkbd.ko
  CC [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbmouse.mod.o
  LD [M]  /home/rohit/LINUX/kernels/staging/drivers/hid/usbhid/usbmouse.ko
make: Leaving directory '/home/rohit/LINUX/kernels/staging'
"

> Just run
> $ cd <top of kernel source tree>
> $ make all
> $ sudo make install
> 
> 
> -- 
> ~Randy
> 
Thanks,
Rohit
