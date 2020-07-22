Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67384229328
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 10:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgGVIKF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 04:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbgGVIKF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 04:10:05 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE7BC0619DC
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 01:10:05 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id d18so1657444ion.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CC9p+SGfKNB0FVOe2RPKu5zB0Ao6RZv3eOulgqFxmBY=;
        b=bxrrq+o+sS64eMtgANcJpGWDWP80vxecTQn01XbV8nHOuTo7yL1rjujRSQtJ5iXcsb
         JLJ/aTmtnwSctY7j8wXUDwzi2zcetB34mvmMfoaoXiFW0iRE2Uru7+xD9dNLoUFmb5Jq
         6SazuXTBZDLdVm+fWquxtk6TkDNQ7iWtT+U6VgzvT38AXZb3X84YTytwrf+9zV2AV6ly
         TELysDtco3X0lSfaI9U3UErxDAalFUU4nUm3OBY0eNADQRpmzEYCNo1nr9qM/mOwk23q
         /eZRr10DPNmg+EMvlHRriiIInyG1ITh3EHzAHO+282Lbmwmqdim0EdN/roEbIeSt0QXM
         p8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CC9p+SGfKNB0FVOe2RPKu5zB0Ao6RZv3eOulgqFxmBY=;
        b=h+Shztun1Y2+NuaYqYpLCGSlnSDnvmo3nAZNTlQSk13b9JhMiXl+8/rhpR02YDLluC
         N84k7BILzz0qpzIl6CZa1Zxgj+jhqQ6im/WdD0FBW02rh04pd4G2fpNBeUT/foEfmcvz
         XEJJTLfHjsCkKgs/8Pt4NdmwPtY83VPSeueUQBKlk4l+h9QvaOIroHHUdg17HDmsJMQ8
         6WmtBFN6E/vmG9GOLIxykIFlpU2B9C5G3VQzDaCpy+71oqv3iMJRHLsWWO5Pzbm4ATiQ
         UD99OSWXei/CzrrqJyvN6lljGBCYT56OS+ymMwaCX1jNB+0LKBowZK9I/9Cgb/iDim2x
         4mWw==
X-Gm-Message-State: AOAM533pMI4UAnYyvyTJL2BWMQ4L2qlRVpxGptxZjnwzfnZFxMm80iRM
        aY78DYA3E5DxM4YC43TTY2NRG5z3ziRoTyGuqw/RDVVW
X-Google-Smtp-Source: ABdhPJyuBt9lEdlH2F2VScBw+amqjQrHzz0asiOjxs5ROQobFIMQtyjUQ9RvpWCmFr1SLtsAehx+1whoBSrlr3k9n2M=
X-Received: by 2002:a02:cc24:: with SMTP id o4mr36339997jap.105.1595405404109;
 Wed, 22 Jul 2020 01:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
 <20200720162422.GG1228057@rowland.harvard.edu> <CAJK_Yh_ZAvuSBFdUitkPbzp_L69Fuew7cTKbeTH3X8aJdOJeqw@mail.gmail.com>
 <20200720172951.GI1228057@rowland.harvard.edu> <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
 <20200721150628.GC1272082@rowland.harvard.edu>
In-Reply-To: <20200721150628.GC1272082@rowland.harvard.edu>
From:   =?UTF-8?B?U1pJR0VUVsOBUkkgSsOhbm9z?= <jszigetvari@gmail.com>
Date:   Wed, 22 Jul 2020 10:09:27 +0200
Message-ID: <CAJK_Yh86DgD8wTKcCOtvKF9SxKuW61KfKq_rQied3VoK_N0Emg@mail.gmail.com>
Subject: Re: linux usb gadget - mass storage
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Until now I was only able to check whether g_multi is working, but
apparently it's working just fine.
So now I'm re-focusing on the Pi Zero again. I will post any updates
as soon as I have them.

Best Regards,
J=C3=A1nos
--
Janos SZIGETVARI
RHCE, License no. 150-053-692

LinkedIn: linkedin.com/in/janosszigetvari

__@__=CB=9AV=CB=9A
Make the switch to open (source) applications, protocols, formats now:
- windows -> Linux, iexplore -> Firefox, msoffice -> LibreOffice
- msn -> jabber protocol (Pidgin, Google Talk)
- mp3 -> ogg, wmv -> ogg, jpg -> png, doc/xls/ppt -> odt/ods/odp

Alan Stern <stern@rowland.harvard.edu> ezt =C3=ADrta (id=C5=91pont: 2020. j=
=C3=BAl.
21., K, 17:06):
>
> On Tue, Jul 21, 2020 at 02:20:27PM +0200, SZIGETV=C3=81RI J=C3=A1nos wrot=
e:
> > Hi Alan,
> >
> > Alan Stern <stern@rowland.harvard.edu> ezt =C3=ADrta (id=C5=91pont: 202=
0. j=C3=BAl.
> > 20., H, 19:29):
> > > 4.19 is a very old kernel.  You'd be a lot better off testing under a
> > > recent kernel, like 5.7.  It also would be more convenient to do your
> > > development on a regular PC instead of a Raspberry Pi.  You can use
> > > dummy-hcd for testing gadget drivers.
> >
> > Okay, I put together a Slackware-current based VM to conduct the
> > development work on.
> > I compiled a patched version of kernel 5.7.9 with all the necessary
> > config parameters to have USB gadget support with debugging enabled,
> > and also the dummy HCD.
> >
> > At first loaded the g_mass_storage module with a smaller ~700 MB iso
> > file, and it loaded seemingly fine, and functionality-wise it also
> > seemed to work fine, although there were frequent periodical debug
> > messages about the gadget returning command-failure status:
> > https://gist.github.com/jszigetvari/5bc4cdc8c55588907b71832558cb00a7
>
> There failures are normal.  They arise because the computer sends
> commands that the gadget driver doesn't understand or support, such as
> GET EVENT STATUS NOTIFICATION.
>
> > After that as a test I tried to dd all the data from /dev/sr1 (that's
> > the device file the gadget was assigned) to /dev/null.
> > The process completed without any user-visible errors, although the
> > failure status related messages kept on appearing:
> > https://gist.github.com/jszigetvari/ffa19850c94f12510c0b78ed5aaba2e1
> >
> > Finally I tried to load the large, 11 GB CentOS iso file as the second
> > phase of the test. On the Raspberry Pi (with kernel 4.19) this was
> > when the crash happened, however this time it did not.
> > Originally Tiziano Bacocco's patch came around to be the time of the
> > 3.x kernels. The patch needed minimal adjustments to apply to 4.19 and
> > 5.4 and also to 5.7.9 (though there was a one line offset in
> > f_mass_storage.c).
> > https://gist.github.com/jszigetvari/5a9796c8af8a01c0edba6a8696540029
> >
> > Although I have to admit that on the Pi Zero I was using the g_multi
> > kernel module, and not g_mass_storage I assumed they share the same
> > code base, so they should work the same way.
> > On the Pi zero I need the extra serial and Ethernet interface to have
> > access to the Pi Zero, as it doesn't have a wireless NIC, and that's
> > why I chose g_multi.ko.
> >
> > In the end I did a dd with the 11 GB iso, and to my surprise it worked
> > well. dd returned without any errors and it did show the true 11 GB
> > size when it finished.
> > In the kernel logs most log entries were about block reads, but the
> > failure status messages were still around. If there was no activity on
> > the device, then they accounted for the majority of the logs
> > generated:
> > https://gist.github.com/jszigetvari/a9225fa3173e6c7b7b50673a494d9c37
> >
> > I have to admit, I stand puzzled why it worked on an x86_64-based
> > machine and crashed on the Pi Zero.
>
> The crash message on the Pi Zero indicated that there was a problem in
> the host controller driver (dwc2-hsotg), not in the mass-storage driver.
>
> > I guess the next step will be either:
> > * to try using g_multi instead of g_mass_storage on the test machine
> > * upgrade the Pi Zero to run kernel 5.4.x (AFAIK that's the latest one
> > can get from the Raspberry Pi Foundation's git repo), and recompile
> > that kernel version with the patch applied. (This will likely take a
> > few days.)
>
> Yes, that might indeed help.
>
> Alan Stern
