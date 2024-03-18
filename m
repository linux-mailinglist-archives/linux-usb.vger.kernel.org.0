Return-Path: <linux-usb+bounces-8056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D5987F05B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 20:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31123282343
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 19:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2412956752;
	Mon, 18 Mar 2024 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNrVXg/g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126A56741
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710789778; cv=none; b=ElIZ4pRCNwB7f/3JyFPEz6EY8gxz2P28dMstli+s225DETUL9c86y0e/ERT+bOFEElXbBDNk/X5RXVEiv247Y2jrQbGuSzvB2Cw+J/jxh0e87ULT87adcphNtRc4HMQOnPhZRkyayhJYvPSzZz7WKRLO/CCRg/bzuel0EO7PQCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710789778; c=relaxed/simple;
	bh=nIH5TUEmQv1Gxjz0nxzp5ElBEE6R0jZdlIK8s6Sqmtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WegoqyVcPcuJLP1AR+J3dsraUSHr+cOn8fbl/sDPrdvgpq0+YAXyxlkFOpwFu2Ijd8G7Xrn6rgK8nGmEKTIN9kUeeaqO3NptcuhA1pcBx5obB+57JRKjuQgfLmjFTGYD1CbH8ROEOFRqTN7r2BIjaCaoP25r/VPCDOEseNws808=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNrVXg/g; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d4698f4936so68324571fa.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710789775; x=1711394575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2TNBC803oq3fpg21hq7PxTs9NS/MuUx4XfMlsEzNcE=;
        b=DNrVXg/gSJps1OQdQFAKlr46sy1iHdhX7YP45oARsDysxXtGro+33hIONO68t4CqtY
         79tQoh6t5bKfxrS6UC0vT4wvwOpHqhLZ8VDzFBgHsu7ulXi6TY1Vh2HkYQuqMQUitf6v
         72GhaoS1pXVFrCotWZ7IxEVbbJApDO/+bpTKoodQNzN+XnObtfUNvsd6YHs4DI0XgGom
         Nbpb0jS7hsxYEngnU5jm3KUyAQGVZl3p+oTZk3+H4WyIe32kgHkYaI7T52I/TmHACYtd
         lWfaxQsNf6Fovbs3gkYiK7M6cOOdxMXQo0t4aCDsRi4Q/Ws4735VT0VFdLk9J4KUJk6d
         PyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710789775; x=1711394575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2TNBC803oq3fpg21hq7PxTs9NS/MuUx4XfMlsEzNcE=;
        b=nmc1zbWTUREDS0KjmJlCoobDaJwCUX1EFbD/7fcIWb5DfImoZrfSEHcvMB7qvsBKTC
         GHQsXHLAyzM6AAlL3x+BSOz8aRbD9dRvCm8T1e9VSwFi3WFEy7P+3Mrczbck879FOxMc
         mXjcuSGc9eozLPl+V2Qj0q1VFGUgXOOXw2H55OlDkF5R/YaW+7MT9mujP9gVWS4fNR7W
         /tUZhowniM861OF9js6LdBRdp56zohQTnpoANe1IRSn8qRmt1Kyj8/VU9PBOOwk0Dc9P
         +oPvNg6X9AI93LXoSsISaIZln5US8rcLAvi3RirNqSP67f70VTWrVLB06gV4arUDmcfz
         bDCg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ53AVflyADGSQ3KrVkvxUFsRxGhUFz8L82g7G3ZEDCNXnCJC6c7v1+GFDROc+V5kmirjmsohjoeSSRcDzu++mY9Fyw6tBtqQb
X-Gm-Message-State: AOJu0YyFnAi0yJMcG51CQi0E+vICxonUro/2BacTHZiU53pmzFAsfRkG
	jutQc8lIWBoSzgpItw9kv17IHO6I+jfW+wUlE3xD1qSDqVRTtnMssUychWq5rRVvwHiIUUmuNaZ
	gWBGjjw+yNp5wkHSjODz0yvXmLj8=
X-Google-Smtp-Source: AGHT+IFRynb9CyyIoziL7yoscm9kM3KiHfI/Zvbo5dixr8i69ryEGucNc+pjl84WL81iORhk8ngcMWVbWU/7bOqnUVg=
X-Received: by 2002:a2e:a0c8:0:b0:2d2:4fa4:f4b2 with SMTP id
 f8-20020a2ea0c8000000b002d24fa4f4b2mr8609139ljm.28.1710789774406; Mon, 18 Mar
 2024 12:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com> <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com> <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
 <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com>
 <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com> <CADS+iDVAyUXQ-KXHgSgJkO=t3msGs5MhyVkBqcaV_N6SSw4EdQ@mail.gmail.com>
 <ZYFqS+QAl6ZKdPQ5@kuha.fi.intel.com> <b696742d-82a5-4882-8997-6acb8cec28e4@app.fastmail.com>
 <64479f78-4359-4eb5-9367-257b24f62ccd@app.fastmail.com>
In-Reply-To: <64479f78-4359-4eb5-9367-257b24f62ccd@app.fastmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Mon, 18 Mar 2024 20:22:43 +0100
Message-ID: <CADS+iDWQxsgvAnkfu8Nukjw5E3d49pwBsWZScyc_HQLGKLwbgg@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: Mark Pearson <mpearson@squebb.ca>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, dgilbert@interlog.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Mark!

=D0=BF=D0=BD, 18 =D0=BC=D0=B0=D1=80. 2024=E2=80=AF=D0=B3. =D0=B2 19:48, Mar=
k Pearson <mpearson@squebb.ca>:
>
> On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
> > Hi,
> >
> > On Tue, Dec 19, 2023, at 5:02 AM, Heikki Krogerus wrote:
> >> On Mon, Dec 18, 2023 at 06:45:05PM +0100, Yaroslav Isakov wrote:
> >>> =D0=BF=D0=BD, 18 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 04:4=
6, Douglas Gilbert <dgilbert@interlog.com>:
> >>> >
> >>> > On 12/17/23 16:25, Yaroslav Isakov wrote:
> >>> > > =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 =
21:48, Yaroslav Isakov <yaroslav.isakov@gmail.com>:
> >>> > >>
> >>> > >> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2=
 20:15, Douglas Gilbert <dgilbert@interlog.com>:
> >>> > >>>
> >>> > >>> On 12/17/23 12:24, Yaroslav Isakov wrote:
> >>> > >>>> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=
=B2 18:08, Douglas Gilbert <dgilbert@interlog.com>:
> >>> > >>>>>
> >>> > >>>>> On 12/17/23 11:21, Yaroslav Isakov wrote:
> >>> > >>>>>> Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and =
I
> >>> > >>>>>> installed Gentoo on it, with kernel 6.6.4.
> >>> > >>>>>>
> >>> > >>>>>> Even though type-c ports seems to be working (I checked usb3=
 flash
> >>> > >>>>>> stick, lenovo charger, Jabra headset, Yubikey), I cannot see=
 any
> >>> > >>>>>> devices in /sys/class/(typec,typec_mux,usb_power_delivery).
> >>> > >>>>>>
> >>> > >>>>>> There are no messages in dmesg at all, mentioning typec. I c=
an see
> >>> > >>>>>> that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. =
I can see
> >>> > >>>>>> that device TYPEC000 is present on acpi bus, there are files=
 in
> >>> > >>>>>> /sys/bus/acpi/devices/USBC000:00, but, there is no driver li=
nked in
> >>> > >>>>>> it.
> >>> > >>>>>>
> >>> > >>>>>> I tried to recompile module ucsi_acpi, with adding { "USBC00=
0", 0 }
> >>> > >>>>>> to ucsi_acpi_match, but it did not change anything (except t=
hat in
> >>> > >>>>>> modinfo of this module, USBC000 is now seen.
> >>> > >>>>>>
> >>> > >>>>>> I tried to decompile SSDT1 table, which has definition of US=
BC, but
> >>> > >>>>>> there is nothing in it, which is supicious.
> >>> > >>>>>>
> >>> > >>>>>> What else can I check, to understand, why can't I see anythi=
ng in
> >>> > >>>>>> typec/PD subsystems?
> >>> > >>>>>>
> >>> > >>>>>
> >>> > >>>>> I have a X13 Gen 3 [i5-1240P] which is about 18 months old. E=
verything you
> >>> > >>>>> mention is present plus the typec ports and the associated pd=
 objects:
> >>> > >>>>>
> >>> > >>>>> $ lsucpd
> >>> > >>>>>     port0 [pd0]  <<=3D=3D=3D=3D  partner [pd2]
> >>> > >>>>>     port1 [pd1]  <
> >>> > >>>>
> >>> > >>>> I guess, it makes no sense to install lsucpd, if it checks /sy=
s/class/typec etc?
> >>> > >>>>
> >>> > >>>>>
> >>> > >>>>> A power adapter is connected to port0. Here are the modules l=
oaded:
> >>> > >>>>>
> >>> > >>>>> $ lsmod | grep typec
> >>> > >>>>> typec_ucsi             57344  1 ucsi_acpi
> >>> > >>>>> roles                  16384  1 typec_ucsi
> >>> > >>>>> typec                 114688  1 typec_ucsi
> >>> > >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typ=
ec_ucsi
> >>> > >>>>> $ lsmod | grep ucsi
> >>> > >>>>> ucsi_acpi              12288  0
> >>> > >>>>> typec_ucsi             57344  1 ucsi_acpi
> >>> > >>>>> roles                  16384  1 typec_ucsi
> >>> > >>>>> typec                 114688  1 typec_ucsi
> >>> > >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typ=
ec_ucsi
> >>> > >>>>>
> >>> > >>>> I have exact same modules.
> >>> > >>>>
> >>> > >>>>> $ ls /sys/bus/acpi/devices/USBC000:00
> >>> > >>>>> device:ac  device:ad  hid  modalias  path  physical_node  pow=
er  status
> >>> > >>>>> subsystem  uevent  uid  wakeup
> >>> > >>>> Under /sys/bus/acpi/devices/USBC000:00 I have the similar file=
s:
> >>> > >>>> adr  device:48  device:49  hid  modalias  path  physical_node =
 power
> >>> > >>>> status  subsystem  uevent  uid
> >>> > >>>> As you don't have driver symlink there, too, then it's a red h=
erring,
> >>> > >>>> that lack of driver file is symptom of this issue.
> >>> > >>>>
> >>> > >>>>>
> >>> > >>>>> Strange that the Thunderbolt module is loaded since I thought=
 only the Intel
> >>> > >>>>> variants supported Thunderbolt.
> >>> > >>>> thundebolt module is now shared with USB4 subsystem, and T14 s=
tarted
> >>> > >>>> to have USB4 from Gen 3, for AMD variant.
> >>> > >>>>>
> >>> > >>>>> The only thing that I can think of is some BIOS setting. When=
 I poked around
> >>> > >>>>> in the X13 BIOS I don't remember any setting that would cause=
 what you are
> >>> > >>>>> seeing.]
> >>> > >>>> I checked BIOS settings, but I cannot find anything related
> >>> > >>>>
> >>> > >>>> Could you please show, what drivers are used for device:ac and
> >>> > >>>> device:ad, under /sys/bus/acpi/devices/USBC000:00? It seems th=
at if I
> >>> > >>>> have such entries in my /sys/bus/acpi/devices/USBC000:00, at l=
east
> >>> > >>>> ucsi_acpi works properly.
> >>> > >>>
> >>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ ls -l
> >>> > >>> total 0
> >>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
> >>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
> >>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
> >>> > >>> ../../../../platform/USBC000:00/typec/port0
> >>> > >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
> >>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../=
../../bus/acpi
> >>> > >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
> >>> > >>>
> >>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ cd ../=
device\:ad
> >>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ad$ ls -l
> >>> > >>> total 0
> >>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
> >>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
> >>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
> >>> > >>> ../../../../platform/USBC000:00/typec/port1
> >>> > >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
> >>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../=
../../bus/acpi
> >>> > >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
> >>> > >>>
> >>> > >>>
> >>> > >>>>
> >>> > >>>> In my /sys/bus/acpi/devices/USBC000:00/device:(48,49), there a=
re only
> >>> > >>>> adr, path and uevent files, and power and subsytem folders. Su=
bsystem
> >>> > >>>> links to bus/acpi, and path has \_SB_.UBTC.CR01, \_SB_.UBTC.CR=
02
> >>> > >>>
> >>> > >>> Mine has the extra physical_node symlinks to typec/port0 and ty=
pec/port1
> >>> > >> Yes, I have the same as on T14 Gen 3 (Intel). Looks like they ha=
ve no
> >>> > >> driver symlinks, too, but they're working on Intel.
> >>> > >>>
> >>> > >>>> P.S. I tried latest live Fedora, just to see if I forgot to co=
mpile
> >>> > >>>> some drivers for custom-built Gentoo kernel, but same issue on=
 Fedora
> >>> > >>>
> >>> > >>> Below is a fragment of a post from Heikki Krogerus about turnin=
g on ucsi debug:
> >>> > >>>
> >>> > >>> If you want to see the actual UCSI notification in user space, =
then
> >>> > >>> that is not possible, but the driver does produce trace output,=
 and I
> >>> > >>> would actually like to see what we got there. You need debugfs =
to be
> >>> > >>> mounted. Then try the following:
> >>> > >>>
> >>> > >>>           # Unload all UCSI modules
> >>> > >>>           modprobe -r ucsi_acpi
> >>> > >>>
> >>> > >>>           # At this point you should plug-in the problematic de=
vice
> >>> > >>>
> >>> > >>>           # Reload the UCSI core module
> >>> > >>>           modprobe typec_ucsi
> >>> > >>>
> >>> > >>>           # Enable UCSI tracing
> >>> > >>>           echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
> >>> > >>>
> >>> > >>>           # Now reload the ACPI glue driver
> >>> > >>>           modprobe ucsi_acpi
> >>> > >>>
> >>> > >>>           # Unplug the problematic device so that you see the e=
rror
> >>> > >>>
> >>> > >>>           # Finally dump the trace output
> >>> > >>>           cat /sys/kernel/debug/tracing/trace
> >>> > >>>
> >>> > >>> So if that works, please send the trace output to me.
> >>> > >>> [Heikki]
> >>> > >> I tried provided commands, both in Gentoo and Fedora - nothing i=
n
> >>> > >> trace at all. I guess, it's because ucsi on AMD can see two devi=
ces,
> >>> > >> but cannot work with them, for some reason. I also checked same
> >>> > >> commands on T14 Gen 3 (Intel), and I can see many ucsi_register_=
port
> >>> > >> and ucsi_register_altmode events.
> >>> > >>>
> >>> > >>>
> >>> > >
> >>> > > I think I managed to find the issue - looks like on my laptop,
> >>> > > ucsi_register fails in version check, !ucsi->version returns Fals=
e.
> >>> > > Commenting out this check populates /sys/class/typec and
> >>> > > /sys/class/usb_power_delivery. I did not check yet, if populated =
data
> >>> > > is correct, but, it's definite progress.
> >>> >
> >>> > Well spotted.
> >>> >
> >>> > That is probably the first UCSI read operation that failed. At the =
very least
> >>> > ucsi_register() could send a message to the log that it was exiting=
 rather
> >>> > than leave users guessing.
> >>> It returns -ENODEV, which, I guess, is a signal for code, which
> >>> detects devices, that this module doesn't support this device.
> >>>
> >>> P.S. Looks like power_delivery code works properly, even with
> >>> version=3D=3D0 - lsucpd shows proper directions, even with my Pixel 7=
,
> >>> which can charge laptop. Also it shows correct data for
> >>> voltage/current, for "partner" device. It also shows proper data in
> >>> power_supply subsystem. The only thing which is not working,
> >>> currently, is displayport altmode not showing, for dockstation I
> >>> have... But this might be missing module, or something else... I'll
> >>> try this on Intel laptop, and will debug it further.
> >>>
> >>> >
> >>> > My guess is that Lenovo/AMD have a configuration or timing issue.
> >>>
> >>> I tried to add loop, re-reading version in case if it's zero, but,
> >>> even after 10 tries, it's returning zero, so, it's some weird behavio=
r
> >>> of UCSI on this AMD laptop. I wonder, what should be the proper fix,
> >>> then.
> >>
> >> You need to report this to Lenovo. This is an issue in their firmware.
> >>
> >> We can work around this by adding DMI quirk where we hardcode the UCSI
> >> version for your system, but before we do that, you should try to get
> >> Lenovo to fix their firmware.
> >>
> > I got forwarded this report from the support team. Was able to
> > reproduce this on my system.
> > I have internal ticket LO-2879 open and we'll look into it.
> >
> Just to confirm that I've tested a trial BIOS from the FW team and it fix=
es the issue (shows up under /sys/class/typec
Great to hear, thank you!

> If there's anything in particular you'd like me to confirm let me know.

If /sys/class/typec is populated, I think it should be enough... Just
to double check, is /sys/class/usb_power_delivery populated, too, now?

I also did not manage to see anything in /sys/class/usb_role or
/sys/class/typec_mux, even with my hack - is it expected on AMD,
because of lack of appropriate mux/role switch drivers?

>
> I've asked the FW team for confirmation when the fix will be released. Ex=
pect it to take a while as the test/release process can take some time
>
> Mark

