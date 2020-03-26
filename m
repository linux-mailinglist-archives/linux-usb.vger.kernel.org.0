Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD0E0194418
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 17:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgCZQPB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 12:15:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34634 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbgCZQPB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 12:15:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id d37so2601878pgl.1;
        Thu, 26 Mar 2020 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XULQL5FV7W4B1r/nzvlMku3Duca6UDapabrUq90elB4=;
        b=CrT9YrLb895mloHxi2niVZT6SVG5N8/mPQG+lRcpr5Ry2WkSzhbojaWYh51krwQWns
         KYs10gHF5SIDarnb4CpMj5ZhwgXEUB5bPz6d4sRj1TpfFYneb0OD7hNSZSH4hFUlWS0Q
         +TXLJsEyjf0yUFPDaZX7mIgpFQaaFJXNxBS3mlmNkrRQXkiqmrItbrtVNxq/SLD8J8Yi
         QqAWByBOt8+MlfKSP1Wk/yXs5UwzeLprASFVYKmMbak4hwJZyg/RmPEnpDgb9Sq3J18E
         ZpgXT3l8uN3TCKzPny1+MD35qFAvCB1f7WBuWOrMbpb8qq/0bzIZmiM89gnRLavDr4sE
         mrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XULQL5FV7W4B1r/nzvlMku3Duca6UDapabrUq90elB4=;
        b=HBGMM0d7lTK7JDXdC9Se4fMwCPVTW1g/6hBelP8irxdKp7JwPdQy6YesdXY8UXp6Y2
         chqnuLsT7S4QlpVQKoorb0YycJNI/00TvxLjpoepRnfb0NszUZtaSRBUHJtKTUu4wdlU
         Xn6WbbF9w/GIk/qG2qX8R1U8jTtDi8zBsjfIPl/bySQLPFEdpvDOfThpSrhNMMM7O15h
         nZjdutJxgFC0C3jAJxNQNijS7j1qrfiD07rWA3r6D2LmWTsW0CL6+V45IEHitnHIZK9x
         8daIkBgUjk+6V+ipodjato/oOdezMx4guDAyudwI75L6lWJWCLLQPj+Dwwu/r9LuXg6c
         EJQg==
X-Gm-Message-State: ANhLgQ35t8L1tBdWAaB8qOINEHl7aGZS7r6f7Rz3xT6KoYS7NFXWWbUZ
        en0tfOyeATOJDkFWXTZxds1ujNZnFjQ=
X-Google-Smtp-Source: ADFU+vtYFO8585ajes2HbN3L0Xf+P5SngI3J3SWwB8vsDsOIdnSv9MErxadJ2PEmv6SQCuU1MxotMw==
X-Received: by 2002:a63:f54d:: with SMTP id e13mr8948802pgk.157.1585239299431;
        Thu, 26 Mar 2020 09:14:59 -0700 (PDT)
Received: from SARKAR ([106.51.108.92])
        by smtp.gmail.com with ESMTPSA id q185sm1985471pfb.154.2020.03.26.09.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 09:14:58 -0700 (PDT)
Message-ID: <5e7cd502.1c69fb81.2402c.714b@mx.google.com>
X-Google-Original-Message-ID: <20200326161455.GE9520@rohitsarkar5398@gmail.com>
Date:   Thu, 26 Mar 2020 21:44:55 +0530
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
 <5e7c5b10.1c69fb81.eb1b6.4979@mx.google.com>
 <fd519185-4b66-ce4f-a12e-fc1329c73ce2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd519185-4b66-ce4f-a12e-fc1329c73ce2@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 09:02:55AM -0700, Randy Dunlap wrote:
> On 3/26/20 12:34 AM, Rohit Sarkar wrote:
> 
> >>>>>
> >>>>> The command I used for building was "make -C /home/rohit/LINUX/kernels/staging  M=$(pwd)"
> >>>>> and for installing the modules: "sudo make -C /home/rohit/LINUX/kernels/staging  M=$(pwd) modules_install"
> >>>>> both were executed from the usbhid directory.
> >>>>
> >>>> why those commands?  seems unusual.
> >>> My Linux kernel source is in the directory mentioned in the commands. So
> >>> it is same as running "make M=drivers/hid/usbhid/" from the linux kernel
> >>> source root.
> >>
> >> So /home/rohit/kernels/staging is the top-level kernel source directory?
> >>
> >> "M=dir" is for external modules to be built.  AFAICT you are not building any
> >> external modules.
> >>
> >> Just run
> >> $ cd <top of kernel source tree>
> >> $ make all
> >> $ sudo make install
> > Further, on my system it takes a significant amount of time to run "make
> > all" for some reason. (30 minutes) even though I have previously
> > built the kernel and not pulled any update.
> > AFAIK, make is only supposed to build the files that have
> > changed. Idk why it is also compiling other files. Most of the time is
> > taken by make running modpost.
> > 
> > That is the reason I tried to build and install only the hid folder
> 
> OK, I get that.
> 
> For a driver that is built as a loadable module, you should be able to
> edit the driver, build it, unload previous version (rmmod),
> load new version (modprobe or insmod), and test it, without having to
> reboot the kernel. [until an oops or BUG or WARN happens]
> 
> If you don't "install" the new module file, I think that modprobe will
> look in /lib/modules/kernel_version/* for the module file and find the
> old one.  In this case I usually use "insmod path_to_new_driver_file"
> to load & test it.
Hmm, the weird part is that I did run "sudo make modules_install".
Shouldnt that get the latest modules into /lib/modules/{kernel
version}/*. Although it didnt work before rebooting.
I guess insmod path_to_new_driver_file is the best option here.

Thanks,
Rohit
> -- 
> ~Randy
> 
