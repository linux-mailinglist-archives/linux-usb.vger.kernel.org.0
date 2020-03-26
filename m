Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F26D1937D3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 06:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgCZFbz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 01:31:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38564 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgCZFbz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 01:31:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id x7so2320137pgh.5;
        Wed, 25 Mar 2020 22:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dtHQfTeVGMnReZL/T/uV658AQAe5fDiF1XY59hCeE0g=;
        b=szNu41du8CIT6DgmLePCRnNK4WP2kzvK5SS/BVeTcqLS3R/gb4f9u5KrWDnsboczjA
         OuHH/AT2r3UAeqNCAmqxfhmotGKrsUEFtUcDTWFf3CCaJ6x/G1nygdV/ClPOhsK0+N7H
         QSrJyo87mDpi0DVI0YGOn1D6xTgw3cTZifxiyjD8id4kA0hZmMug1T16vzK2mY84ArF0
         e5MK1l1qMOzbeXk6Va7Ks6nDgmt2yvxknmnJIb7GaamVwYznmflREVhuTltAyk1iSmHC
         4Zm2TnbTenXs9/egOWiJX4wslLNZ6O9zlfG1zdGconYY7uv6SjQPmjTA9F7Fw08z0H0I
         50fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dtHQfTeVGMnReZL/T/uV658AQAe5fDiF1XY59hCeE0g=;
        b=SsCmUE7lZLPbRM7HDJviG1/bcmNKPyVkOLzZDRtZCcB0TPWvErnvsW4SXzGd5WkXhR
         0dVZD0/6+x6t84e/DolON+ZVYyHoQxLrW6yDiHo1TZGoPH6Eqcsb0EG0BFHtLSuOaGwE
         FwDAmWXTqpmcLbaw7iJj6swnT5NSlh45CGjv0b4/JEn2bWnMV6GSd6lRiXb2Rqz3yjsc
         7/5DpUnFHgL+HN+TNSh9IayBWW4vdie+3PJCcaTvCtSbFI2rNAr9NOqhTtCXJq9PdXmn
         3Y0B0TTg/Qv7D/scaJvurwBSVUC6Rax2m+tAhReQ6yf3z1BSK4CpCr3DhqtMhw6lDvgd
         GYMA==
X-Gm-Message-State: ANhLgQ15L3/Z6osuRYDGs3I65Su/02+lPcAl08ZeUo9odn1jLBmJxmtC
        Nm8XYL1ARyktLVVg+3LDQ2qI9OBrw4g=
X-Google-Smtp-Source: ADFU+vsxlxW9ksGaTV9CP4Hurem1YJZEJiWUj2mC24aFHB8yetpQ8Yrttv1BcwJOVPDT5IHpPGijyw==
X-Received: by 2002:a65:4cc5:: with SMTP id n5mr6685425pgt.309.1585200712949;
        Wed, 25 Mar 2020 22:31:52 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id i187sm700945pfg.33.2020.03.25.22.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 22:31:52 -0700 (PDT)
Message-ID: <5e7c3e48.1c69fb81.7da14.34ab@mx.google.com>
X-Google-Original-Message-ID: <20200326053149.GA3915@rohitsarkar5398@gmail.com>
Date:   Thu, 26 Mar 2020 11:01:49 +0530
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfda560c-ad5f-5e71-ab22-d8639688722b@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 25, 2020 at 02:40:27PM -0700, Randy Dunlap wrote:
> On 3/25/20 10:13 AM, Rohit Sarkar wrote:
> > On Wed, Mar 25, 2020 at 04:41:38PM +0100, Hubert CHAUMETTE wrote:
> >> Le 25/03/2020 15:47, Rohit Sarkar a écrit :
> >>> I was trying to mess around with the driver that drives my mouse. I
> >>> found out that it is usbhid. I then added a printk statement to the init
> >>> and exit function of usbhid.
> >>> I then compiled and installed the usbhid drivers. Post that I ran
> >>> `sudo modprobe -r usbhid` and `sudo modprobe usbhid` but couldnt observe
> >>> any logs in dmesg.
> >>>
> >>> I am certain I am missing something fundamental. Could someone help me
> >>> with this.
> >>
> >> Hi,
> >>
> >> Did you check whether your module was effectively loaded with lsmod?
> >> What log level did you use in your printk statement? Depending on your
> >> system default loglevel your logs might not be printed. A quick fix
> >> would be to use one of the lowest levels (pr_emerg, but pr_err might
> >> suffice).
> >> Regards,
> > 
> > Hey,
> > I did check that module was loaded. And one of the signs was that my
> > mouse started working after insmod :).
Hi,
> Hi,
> I'm not convinced that your modified usbhid module was loaded.
Hmm, here's my dmesg logs if that helps:
"
[  382.132319] usbcore: deregistering interface driver usbhid
[  391.077410] input: MOSART Semi. 2.4G Wireless Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:3938:1031.0002/input/input26
[  391.136724] input: MOSART Semi. 2.4G Wireless Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:3938:1031.0002/input/input27
[  391.137285] hid-generic 0003:3938:1031.0002: input,hiddev0,hidraw0: USB HID v1.10 Mouse [MOSART Semi. 2.4G Wireless Mouse] on usb-0000:00:14.0-2/input0
[  391.137480] usbcore: registered new interface driver usbhid
[  391.137483] usbhid: USB HID core driver
"
> Could an older (original) usbhid module be reloaded so that the mouse
> started working again?  That would also explain the lack of (new) messages.
I think so too. But how do I verify if this is the case?

> What kernel version are you using?  Is it a distro kernel?
I am currently running a bleeding edge kernel that I built. ie 5.6-rc7. 
> Are you trying to replace the usbhid module in a distro kernel or are
> you building the entire kernel?
I am building the entire kernel
> > I used printk(KERN_ALERT "some message") for logging. I also tried with
> > KERN_ERR but no luck. 
> > 
> > The command I used for building was "make -C /home/rohit/LINUX/kernels/staging  M=$(pwd)"
> > and for installing the modules: "sudo make -C /home/rohit/LINUX/kernels/staging  M=$(pwd) modules_install"
> > both were executed from the usbhid directory.
> 
> why those commands?  seems unusual.
My Linux kernel source is in the directory mentioned in the commands. So
it is same as running "make M=drivers/hid/usbhid/" from the linux kernel
source root.
> -- 
> ~Randy
> 

Thanks,
Rohit
