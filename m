Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237B81939AE
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 08:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgCZHen (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 03:34:43 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36292 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgCZHen (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 03:34:43 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2so1823986plo.3;
        Thu, 26 Mar 2020 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=gD9n36NZuXyx2RhUiN6cZDSK6trev/p202dOJYJeUlA=;
        b=bs66KNFEduu3kCDKnv1qSqty+U4sYSq3GQziWfwUuT7cizjcjJ84UmX+VUF9wcNGwy
         qK9WVfrX7ISSyJsU7NyZoQS2HAowVIjXJJTCPGr+DpHNIXnj+97ynarFwaQh/ks2zxF6
         jOeiy+nQ+2W7tB2IB6o2G8dtLvwaSp9UlWFij2OXjlo5lDYCCmQlgzzERhWX7qxHC/EQ
         7cq2zx1lqTf3kd3zY8EZN2SLVPlWdgCIpEyBylyzEV5g8VGVGDQMibPj6GgboACjnQj3
         3Ipa+PdLSPzL2DU6f+SqWXQ/pTTUyqWiw4hLaY8L7JEkMxlIy64Tiz6v1SF7W0DJegFc
         f9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gD9n36NZuXyx2RhUiN6cZDSK6trev/p202dOJYJeUlA=;
        b=uj+YvBo4k929z/J02SmJt2SDzW/5lwIVBSlYE14VmzzuP0qhnLQu6cJk71En132wxP
         X+GIPh/m2YToHa+o5A8Fi1AUXpwwyN1i8k3+3zCfw6T+Z9H/KPIDfumQlu/bbEHWvtRs
         tB3N2DRGGSOpGmM8pJlzzANTqpsw9NXNSXB+hojvjPL4QmgWSrK33DIHNL7bGU2wKqlp
         mSO/0tpkznBzEfp4fGI4eOkHHo2uLSMya6VPU59tU8Wg/iLhhmbnMLtmD9Gi8ZBa+w7/
         v0FK3vEFwUohgtCnxySzH6iXRykTioPTF7sa+ee8SzwPhWcIaYnjIGJUQhz1fpgHfoOW
         ETnQ==
X-Gm-Message-State: ANhLgQ0ZAIGZ9QnStDAOB0GsdeRKsKQaw1Q8nWqActh5ui1VxfiBiiqe
        VgOO5HyG0W+84v3vQii30w/JMPdI9c4=
X-Google-Smtp-Source: ADFU+vugVmGNKkDsaMlpsdubcMT99a9w3IHMAb2B44NYN+FlIcCXhPAnsUC35ytn2NlWjRWvg9PoaQ==
X-Received: by 2002:a17:90a:26e1:: with SMTP id m88mr1698998pje.60.1585208081318;
        Thu, 26 Mar 2020 00:34:41 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id e4sm971166pgc.60.2020.03.26.00.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 00:34:40 -0700 (PDT)
Message-ID: <5e7c5b10.1c69fb81.eb1b6.4979@mx.google.com>
X-Google-Original-Message-ID: <20200326073436.GC3915@rohitsarkar5398@gmail.com>
Date:   Thu, 26 Mar 2020 13:04:36 +0530
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
Content-Type: text/plain; charset=iso-8859-1
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
> 
> Just run
> $ cd <top of kernel source tree>
> $ make all
> $ sudo make install
Further, on my system it takes a significant amount of time to run "make
all" for some reason. (30 minutes) even though I have previously
built the kernel and not pulled any update.
AFAIK, make is only supposed to build the files that have
changed. Idk why it is also compiling other files. Most of the time is
taken by make running modpost.

That is the reason I tried to build and install only the hid folder
> 
> 
> -- 
> ~Randy
> 
