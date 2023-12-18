Return-Path: <linux-usb+bounces-4318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ECA817923
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 18:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5EF1F27E4D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 17:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33998740A0;
	Mon, 18 Dec 2023 17:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCi7hdPg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F309A7348D
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e2bd8c396so2418293e87.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 09:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702921517; x=1703526317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldGjj2xrZLvgAHJlwxjR+sTmCUfP2ZF2FqQOA8e1jho=;
        b=WCi7hdPg4rXzKE97XlSZ7p9O64pOXsKnE6FDYZj75a+ya3+q4IkK0G06/mNssp7Qez
         SNe0qVgz30hHxpvMX/EfXpgjJH6XsQrlAAPkgW3jmC7lT+dSWO3p+n96jK0WJ9FJ81DF
         9M4K29z5O/MGQC/YnTAOyUwghXdp9uxuOiZ3LxVDC7khRAHeOhoq7dTulmL2bHwmT64/
         3F0qFOVOxJXiQxLnqJAq1WR3R6gJPDVPtroPnSdQlsDWVrI2RKVWCSTN3HDpH7BfVkPY
         OaZ4BGuzd7C3j/q4k54+0n3dZDAwTUYiSbbrFtBtczURH0cH5CnwJaLz0bY0dpxuYW67
         XeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702921517; x=1703526317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldGjj2xrZLvgAHJlwxjR+sTmCUfP2ZF2FqQOA8e1jho=;
        b=PqL6qlYeSL4J8mc6pmw7DrtGKqzOa2NcCBN2Dn8qt7Rm3IN0PckX+RSFJ7rfpfhVkh
         gcKWcNb9K18NBnIS/YFn4d7kQDdT+oxejaVj+GumBoeQiysQJ7FQ1rSmp1RhODX44P72
         QYjb6kX5gMCTu8HJ3ie02HgmZSFCBpjtXCORsI6uMHufoqkAEg+bZGHKXMIPYab9fxb3
         QXXxRPsTAaSWwLTcl6qPlz6qUKejc7YxETbF+R+h31RxxX1+LKV6UJEEL0Tf9pdlfNYr
         P3e3w9o9Lw0sbsjkP6K0OSG0259OZmvSyTcdLzxDX/cLDcI1vicg2vyOpqh+EuLEc8Ns
         nAIA==
X-Gm-Message-State: AOJu0Yzp/iIZVoTOPMUkUa8JuiyG+aUoGxp+W+/Rkwu8LwGyv77TA9E0
	X7m6b7bOJRc1qKbe1tkE20zx9a6VdFsZN9+h1oDlRGS8kCU=
X-Google-Smtp-Source: AGHT+IFu4evdisRfrQ9THjOTMc8Nk9runMH/00FTg5ZQQ1W3yCtgZW8t9Rw0VOe6CkMnzwVJulpuqVSjpAkkbHSAtko=
X-Received: by 2002:a05:6512:3c99:b0:50e:383a:5137 with SMTP id
 h25-20020a0565123c9900b0050e383a5137mr1434298lfv.71.1702921516577; Mon, 18
 Dec 2023 09:45:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com> <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com> <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
 <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com> <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com>
In-Reply-To: <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Mon, 18 Dec 2023 18:45:05 +0100
Message-ID: <CADS+iDVAyUXQ-KXHgSgJkO=t3msGs5MhyVkBqcaV_N6SSw4EdQ@mail.gmail.com>
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: dgilbert@interlog.com
Cc: linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 18 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 04:46, Dou=
glas Gilbert <dgilbert@interlog.com>:
>
> On 12/17/23 16:25, Yaroslav Isakov wrote:
> > =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 21:48,=
 Yaroslav Isakov <yaroslav.isakov@gmail.com>:
> >>
> >> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 20:15=
, Douglas Gilbert <dgilbert@interlog.com>:
> >>>
> >>> On 12/17/23 12:24, Yaroslav Isakov wrote:
> >>>> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 18:=
08, Douglas Gilbert <dgilbert@interlog.com>:
> >>>>>
> >>>>> On 12/17/23 11:21, Yaroslav Isakov wrote:
> >>>>>> Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and I
> >>>>>> installed Gentoo on it, with kernel 6.6.4.
> >>>>>>
> >>>>>> Even though type-c ports seems to be working (I checked usb3 flash
> >>>>>> stick, lenovo charger, Jabra headset, Yubikey), I cannot see any
> >>>>>> devices in /sys/class/(typec,typec_mux,usb_power_delivery).
> >>>>>>
> >>>>>> There are no messages in dmesg at all, mentioning typec. I can see
> >>>>>> that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. I can =
see
> >>>>>> that device TYPEC000 is present on acpi bus, there are files in
> >>>>>> /sys/bus/acpi/devices/USBC000:00, but, there is no driver linked i=
n
> >>>>>> it.
> >>>>>>
> >>>>>> I tried to recompile module ucsi_acpi, with adding { "USBC000", 0 =
}
> >>>>>> to ucsi_acpi_match, but it did not change anything (except that in
> >>>>>> modinfo of this module, USBC000 is now seen.
> >>>>>>
> >>>>>> I tried to decompile SSDT1 table, which has definition of USBC, bu=
t
> >>>>>> there is nothing in it, which is supicious.
> >>>>>>
> >>>>>> What else can I check, to understand, why can't I see anything in
> >>>>>> typec/PD subsystems?
> >>>>>>
> >>>>>
> >>>>> I have a X13 Gen 3 [i5-1240P] which is about 18 months old. Everyth=
ing you
> >>>>> mention is present plus the typec ports and the associated pd objec=
ts:
> >>>>>
> >>>>> $ lsucpd
> >>>>>     port0 [pd0]  <<=3D=3D=3D=3D  partner [pd2]
> >>>>>     port1 [pd1]  <
> >>>>
> >>>> I guess, it makes no sense to install lsucpd, if it checks /sys/clas=
s/typec etc?
> >>>>
> >>>>>
> >>>>> A power adapter is connected to port0. Here are the modules loaded:
> >>>>>
> >>>>> $ lsmod | grep typec
> >>>>> typec_ucsi             57344  1 ucsi_acpi
> >>>>> roles                  16384  1 typec_ucsi
> >>>>> typec                 114688  1 typec_ucsi
> >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucs=
i
> >>>>> $ lsmod | grep ucsi
> >>>>> ucsi_acpi              12288  0
> >>>>> typec_ucsi             57344  1 ucsi_acpi
> >>>>> roles                  16384  1 typec_ucsi
> >>>>> typec                 114688  1 typec_ucsi
> >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucs=
i
> >>>>>
> >>>> I have exact same modules.
> >>>>
> >>>>> $ ls /sys/bus/acpi/devices/USBC000:00
> >>>>> device:ac  device:ad  hid  modalias  path  physical_node  power  st=
atus
> >>>>> subsystem  uevent  uid  wakeup
> >>>> Under /sys/bus/acpi/devices/USBC000:00 I have the similar files:
> >>>> adr  device:48  device:49  hid  modalias  path  physical_node  power
> >>>> status  subsystem  uevent  uid
> >>>> As you don't have driver symlink there, too, then it's a red herring=
,
> >>>> that lack of driver file is symptom of this issue.
> >>>>
> >>>>>
> >>>>> Strange that the Thunderbolt module is loaded since I thought only =
the Intel
> >>>>> variants supported Thunderbolt.
> >>>> thundebolt module is now shared with USB4 subsystem, and T14 started
> >>>> to have USB4 from Gen 3, for AMD variant.
> >>>>>
> >>>>> The only thing that I can think of is some BIOS setting. When I pok=
ed around
> >>>>> in the X13 BIOS I don't remember any setting that would cause what =
you are
> >>>>> seeing.]
> >>>> I checked BIOS settings, but I cannot find anything related
> >>>>
> >>>> Could you please show, what drivers are used for device:ac and
> >>>> device:ad, under /sys/bus/acpi/devices/USBC000:00? It seems that if =
I
> >>>> have such entries in my /sys/bus/acpi/devices/USBC000:00, at least
> >>>> ucsi_acpi works properly.
> >>>
> >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ ls -l
> >>> total 0
> >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
> >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
> >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
> >>> ../../../../platform/USBC000:00/typec/port0
> >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
> >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../../../=
bus/acpi
> >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
> >>>
> >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ cd ../device=
\:ad
> >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ad$ ls -l
> >>> total 0
> >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
> >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
> >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
> >>> ../../../../platform/USBC000:00/typec/port1
> >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
> >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../../../=
bus/acpi
> >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
> >>>
> >>>
> >>>>
> >>>> In my /sys/bus/acpi/devices/USBC000:00/device:(48,49), there are onl=
y
> >>>> adr, path and uevent files, and power and subsytem folders. Subsyste=
m
> >>>> links to bus/acpi, and path has \_SB_.UBTC.CR01, \_SB_.UBTC.CR02
> >>>
> >>> Mine has the extra physical_node symlinks to typec/port0 and typec/po=
rt1
> >> Yes, I have the same as on T14 Gen 3 (Intel). Looks like they have no
> >> driver symlinks, too, but they're working on Intel.
> >>>
> >>>> P.S. I tried latest live Fedora, just to see if I forgot to compile
> >>>> some drivers for custom-built Gentoo kernel, but same issue on Fedor=
a
> >>>
> >>> Below is a fragment of a post from Heikki Krogerus about turning on u=
csi debug:
> >>>
> >>> If you want to see the actual UCSI notification in user space, then
> >>> that is not possible, but the driver does produce trace output, and I
> >>> would actually like to see what we got there. You need debugfs to be
> >>> mounted. Then try the following:
> >>>
> >>>           # Unload all UCSI modules
> >>>           modprobe -r ucsi_acpi
> >>>
> >>>           # At this point you should plug-in the problematic device
> >>>
> >>>           # Reload the UCSI core module
> >>>           modprobe typec_ucsi
> >>>
> >>>           # Enable UCSI tracing
> >>>           echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
> >>>
> >>>           # Now reload the ACPI glue driver
> >>>           modprobe ucsi_acpi
> >>>
> >>>           # Unplug the problematic device so that you see the error
> >>>
> >>>           # Finally dump the trace output
> >>>           cat /sys/kernel/debug/tracing/trace
> >>>
> >>> So if that works, please send the trace output to me.
> >>> [Heikki]
> >> I tried provided commands, both in Gentoo and Fedora - nothing in
> >> trace at all. I guess, it's because ucsi on AMD can see two devices,
> >> but cannot work with them, for some reason. I also checked same
> >> commands on T14 Gen 3 (Intel), and I can see many ucsi_register_port
> >> and ucsi_register_altmode events.
> >>>
> >>>
> >
> > I think I managed to find the issue - looks like on my laptop,
> > ucsi_register fails in version check, !ucsi->version returns False.
> > Commenting out this check populates /sys/class/typec and
> > /sys/class/usb_power_delivery. I did not check yet, if populated data
> > is correct, but, it's definite progress.
>
> Well spotted.
>
> That is probably the first UCSI read operation that failed. At the very l=
east
> ucsi_register() could send a message to the log that it was exiting rathe=
r
> than leave users guessing.
It returns -ENODEV, which, I guess, is a signal for code, which
detects devices, that this module doesn't support this device.

P.S. Looks like power_delivery code works properly, even with
version=3D=3D0 - lsucpd shows proper directions, even with my Pixel 7,
which can charge laptop. Also it shows correct data for
voltage/current, for "partner" device. It also shows proper data in
power_supply subsystem. The only thing which is not working,
currently, is displayport altmode not showing, for dockstation I
have... But this might be missing module, or something else... I'll
try this on Intel laptop, and will debug it further.

>
> My guess is that Lenovo/AMD have a configuration or timing issue.

I tried to add loop, re-reading version in case if it's zero, but,
even after 10 tries, it's returning zero, so, it's some weird behavior
of UCSI on this AMD laptop. I wonder, what should be the proper fix,
then.
>
> Doug Gilbert
>
>

