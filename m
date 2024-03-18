Return-Path: <linux-usb+bounces-8055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB9987EFF0
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 19:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24EC1C217FE
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 18:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6334779F;
	Mon, 18 Mar 2024 18:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="DXVyyRLr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pB6K4Sp8"
X-Original-To: linux-usb@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F194381C8
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710787687; cv=none; b=h+aCQfgvPOYEcYm4BG1xbf68tbqZCuXwh6MKZVz1xG4bJ0Wr9KsUJNTTRKfCYkL01xRcoSysG1MpOL344EfUvzMchzA3Hg0+GZOe8Ij4ceRBwMQUed+PJ10dm1S5I5prRCN01BkHa4EI+5GY2IUL6qpaq/IRuQmu9DTQr4PHtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710787687; c=relaxed/simple;
	bh=9JLmIx+FavDrdN8ydN6c9aSG8yyT6hPCRo4FWtBSQbw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=TmJSADResEcrI5kBr1GGrcyaLPE/nGyZxbdkqVJzVYL+cl+TZCC4CVbu36qKmfYBZytS10VKbcBUicjvfOrOYO053msxzK9YcbJd3kJvUfRTZQgNFui1BqNFOdqienA6gEOdTNE4LF+wZnfqoOcSPGYX7MHseZFcbmh0jSXLJWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=DXVyyRLr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pB6K4Sp8; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id CC18C1C000A5;
	Mon, 18 Mar 2024 14:48:02 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Mon, 18 Mar 2024 14:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1710787682;
	 x=1710874082; bh=ZKffux0ZvrdMIWtGLYFNfBBn54ZRNpD0JB/tkxtDfFw=; b=
	DXVyyRLrV0WLbDyc3AWkcMGRLnMWJklRUPNzGnbffeAwduphgm/qY1tJRVWqqQxf
	QXMeyuAdjc/j009U1lpRVBXt6iIWnIv07W1OuyRz6eEu7uoNKv/LEstO9pQMiPJc
	Tq7UqAcMtpLDUL4DqXVdVyfnzERn/9bF9qad2INhznibgLhzZW8bC/dPn9VmF6+i
	2DAy9CtV6G17dV4jNVQdppehBWov38nVl43OLrtlOLmt4cf3cgtLX5Ikpl4uyPFL
	npm3FFDDHFGRjQ7BNOtdHy7lSNemEj7znuMHJ/5DdaKxUuAzr1c6XbWKRX/gbwTj
	SeeLJbpyehNYPx2m4W9qVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1710787682; x=
	1710874082; bh=ZKffux0ZvrdMIWtGLYFNfBBn54ZRNpD0JB/tkxtDfFw=; b=p
	B6K4Sp8/czOWEZxvkkXsyZOxk9YO7fxZ65Llhqd/3yxMRMz3ir8ceY9q7MSKRig7
	VfS1JAk72njg01FRGkvKur7q9G8Yc66OJf6bDRuabZrty77VZU6ooPQDY0naY3wt
	dIDRwb6Tl5YFRhFdeVAVVXyWB7G/6be9Ii8dtX4l0x2MmQ0oaRelwDYHALiCIlS1
	4g5cIFTAaFlwyF6LEVvWhj/IXa/GyLtDmEM9QJ7gqh9DZouJtkKQqx/sMWshBvY8
	WpXtIOMuLSpRc5CH3ClsMrvGrEvl5QOGOkgIsgCLmPTIOJqnTUFXgnGaPryWN/Ov
	p+csYmG8ehqrJIJx7aVSw==
X-ME-Sender: <xms:Yoz4ZQQ36KsUqh0v64aRx_56rfMHeCjKo-tmjYfjAZ1dlJ_BNzpHpQ>
    <xme:Yoz4Zdwg80qohiT3s64CRxFvdzoI20KVfJ42IRBzTHAtT5SRIuYagUoZafG6VWW5-
    sbPgz4vh3mRZWx2H4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrkeejgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnsehsqhhuvggssgdrtggrqeenuc
    ggtffrrghtthgvrhhnpefggeffgfefhfejhedujeeijefhhfeuhfdvgeegvdffveettedu
    ueefteegfeevleenucffohhmrghinhepmhhoughulhgvshdrlhhsnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnsehsqhhu
    vggssgdrtggr
X-ME-Proxy: <xmx:Yoz4Zd39OmNTpz0_N28ZD1eyOv82hr3K-r1xxOtssT2GWJktgu5d0g>
    <xmx:Yoz4ZUAR0jL8cpjF2EH266HggVt2DF_-0dwOwarufNXLMTScaj7rzA>
    <xmx:Yoz4ZZicNAIIgdBnB7w-ZXKhcyLnOKv4s5NzD7doFfimQx0v6zZwzQ>
    <xmx:Yoz4ZQrZHeKFuS988qvsu48jVJlz6pFscz5YCzebdwuU8hMFyp0ipQ>
    <xmx:Yoz4ZZeW6KQ0_uDwugolQG0FYXFFA3bRXzuB9b_y-dbZNJFaFHDJ_OgA6ro>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 05885C60097; Mon, 18 Mar 2024 14:48:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-300-gdee1775a43-fm-20240315.001-gdee1775a
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <64479f78-4359-4eb5-9367-257b24f62ccd@app.fastmail.com>
In-Reply-To: <b696742d-82a5-4882-8997-6acb8cec28e4@app.fastmail.com>
References: 
 <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
 <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com>
 <CADS+iDVhNzAHfbW+Nks_29rgJXwFTCsTU93XHQpCYBCW6cvxzQ@mail.gmail.com>
 <e7257a7a-1391-47e7-9702-d7c9ec3ff338@interlog.com>
 <CADS+iDWM8czf-D8D8H1gx2YBPCYbO4cexO83dUQ6-H8KKQSx4g@mail.gmail.com>
 <CADS+iDWSsLA+HrFLsD4nvo5KCRJTdiuZKp5cYVkXBnkC_nTfRw@mail.gmail.com>
 <eff9a939-cd38-4cbd-89a4-faebc0de67e6@interlog.com>
 <CADS+iDVAyUXQ-KXHgSgJkO=t3msGs5MhyVkBqcaV_N6SSw4EdQ@mail.gmail.com>
 <ZYFqS+QAl6ZKdPQ5@kuha.fi.intel.com>
 <b696742d-82a5-4882-8997-6acb8cec28e4@app.fastmail.com>
Date: Mon, 18 Mar 2024 14:48:34 -0400
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Yaroslav Isakov" <yaroslav.isakov@gmail.com>
Cc: dgilbert@interlog.com, linux-usb@vger.kernel.org
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024, at 9:30 AM, Mark Pearson wrote:
> Hi,
>
> On Tue, Dec 19, 2023, at 5:02 AM, Heikki Krogerus wrote:
>> On Mon, Dec 18, 2023 at 06:45:05PM +0100, Yaroslav Isakov wrote:
>>> =D0=BF=D0=BD, 18 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 04:=
46, Douglas Gilbert <dgilbert@interlog.com>:
>>> >
>>> > On 12/17/23 16:25, Yaroslav Isakov wrote:
>>> > > =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2=
 21:48, Yaroslav Isakov <yaroslav.isakov@gmail.com>:
>>> > >>
>>> > >> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2=
 20:15, Douglas Gilbert <dgilbert@interlog.com>:
>>> > >>>
>>> > >>> On 12/17/23 12:24, Yaroslav Isakov wrote:
>>> > >>>> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=
=B2 18:08, Douglas Gilbert <dgilbert@interlog.com>:
>>> > >>>>>
>>> > >>>>> On 12/17/23 11:21, Yaroslav Isakov wrote:
>>> > >>>>>> Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and=
 I
>>> > >>>>>> installed Gentoo on it, with kernel 6.6.4.
>>> > >>>>>>
>>> > >>>>>> Even though type-c ports seems to be working (I checked usb=
3 flash
>>> > >>>>>> stick, lenovo charger, Jabra headset, Yubikey), I cannot se=
e any
>>> > >>>>>> devices in /sys/class/(typec,typec_mux,usb_power_delivery).
>>> > >>>>>>
>>> > >>>>>> There are no messages in dmesg at all, mentioning typec. I =
can see
>>> > >>>>>> that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded.=
 I can see
>>> > >>>>>> that device TYPEC000 is present on acpi bus, there are file=
s in
>>> > >>>>>> /sys/bus/acpi/devices/USBC000:00, but, there is no driver l=
inked in
>>> > >>>>>> it.
>>> > >>>>>>
>>> > >>>>>> I tried to recompile module ucsi_acpi, with adding { "USBC0=
00", 0 }
>>> > >>>>>> to ucsi_acpi_match, but it did not change anything (except =
that in
>>> > >>>>>> modinfo of this module, USBC000 is now seen.
>>> > >>>>>>
>>> > >>>>>> I tried to decompile SSDT1 table, which has definition of U=
SBC, but
>>> > >>>>>> there is nothing in it, which is supicious.
>>> > >>>>>>
>>> > >>>>>> What else can I check, to understand, why can't I see anyth=
ing in
>>> > >>>>>> typec/PD subsystems?
>>> > >>>>>>
>>> > >>>>>
>>> > >>>>> I have a X13 Gen 3 [i5-1240P] which is about 18 months old. =
Everything you
>>> > >>>>> mention is present plus the typec ports and the associated p=
d objects:
>>> > >>>>>
>>> > >>>>> $ lsucpd
>>> > >>>>>     port0 [pd0]  <<=3D=3D=3D=3D  partner [pd2]
>>> > >>>>>     port1 [pd1]  <
>>> > >>>>
>>> > >>>> I guess, it makes no sense to install lsucpd, if it checks /s=
ys/class/typec etc?
>>> > >>>>
>>> > >>>>>
>>> > >>>>> A power adapter is connected to port0. Here are the modules =
loaded:
>>> > >>>>>
>>> > >>>>> $ lsmod | grep typec
>>> > >>>>> typec_ucsi             57344  1 ucsi_acpi
>>> > >>>>> roles                  16384  1 typec_ucsi
>>> > >>>>> typec                 114688  1 typec_ucsi
>>> > >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,ty=
pec_ucsi
>>> > >>>>> $ lsmod | grep ucsi
>>> > >>>>> ucsi_acpi              12288  0
>>> > >>>>> typec_ucsi             57344  1 ucsi_acpi
>>> > >>>>> roles                  16384  1 typec_ucsi
>>> > >>>>> typec                 114688  1 typec_ucsi
>>> > >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,ty=
pec_ucsi
>>> > >>>>>
>>> > >>>> I have exact same modules.
>>> > >>>>
>>> > >>>>> $ ls /sys/bus/acpi/devices/USBC000:00
>>> > >>>>> device:ac  device:ad  hid  modalias  path  physical_node  po=
wer  status
>>> > >>>>> subsystem  uevent  uid  wakeup
>>> > >>>> Under /sys/bus/acpi/devices/USBC000:00 I have the similar fil=
es:
>>> > >>>> adr  device:48  device:49  hid  modalias  path  physical_node=
  power
>>> > >>>> status  subsystem  uevent  uid
>>> > >>>> As you don't have driver symlink there, too, then it's a red =
herring,
>>> > >>>> that lack of driver file is symptom of this issue.
>>> > >>>>
>>> > >>>>>
>>> > >>>>> Strange that the Thunderbolt module is loaded since I though=
t only the Intel
>>> > >>>>> variants supported Thunderbolt.
>>> > >>>> thundebolt module is now shared with USB4 subsystem, and T14 =
started
>>> > >>>> to have USB4 from Gen 3, for AMD variant.
>>> > >>>>>
>>> > >>>>> The only thing that I can think of is some BIOS setting. Whe=
n I poked around
>>> > >>>>> in the X13 BIOS I don't remember any setting that would caus=
e what you are
>>> > >>>>> seeing.]
>>> > >>>> I checked BIOS settings, but I cannot find anything related
>>> > >>>>
>>> > >>>> Could you please show, what drivers are used for device:ac and
>>> > >>>> device:ad, under /sys/bus/acpi/devices/USBC000:00? It seems t=
hat if I
>>> > >>>> have such entries in my /sys/bus/acpi/devices/USBC000:00, at =
least
>>> > >>>> ucsi_acpi works properly.
>>> > >>>
>>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ ls -l
>>> > >>> total 0
>>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
>>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
>>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
>>> > >>> ../../../../platform/USBC000:00/typec/port0
>>> > >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
>>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../..=
/../../bus/acpi
>>> > >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>>> > >>>
>>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ cd ..=
/device\:ad
>>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ad$ ls -l
>>> > >>> total 0
>>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
>>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
>>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
>>> > >>> ../../../../platform/USBC000:00/typec/port1
>>> > >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
>>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../..=
/../../bus/acpi
>>> > >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>>> > >>>
>>> > >>>
>>> > >>>>
>>> > >>>> In my /sys/bus/acpi/devices/USBC000:00/device:(48,49), there =
are only
>>> > >>>> adr, path and uevent files, and power and subsytem folders. S=
ubsystem
>>> > >>>> links to bus/acpi, and path has \_SB_.UBTC.CR01, \_SB_.UBTC.C=
R02
>>> > >>>
>>> > >>> Mine has the extra physical_node symlinks to typec/port0 and t=
ypec/port1
>>> > >> Yes, I have the same as on T14 Gen 3 (Intel). Looks like they h=
ave no
>>> > >> driver symlinks, too, but they're working on Intel.
>>> > >>>
>>> > >>>> P.S. I tried latest live Fedora, just to see if I forgot to c=
ompile
>>> > >>>> some drivers for custom-built Gentoo kernel, but same issue o=
n Fedora
>>> > >>>
>>> > >>> Below is a fragment of a post from Heikki Krogerus about turni=
ng on ucsi debug:
>>> > >>>
>>> > >>> If you want to see the actual UCSI notification in user space,=
 then
>>> > >>> that is not possible, but the driver does produce trace output=
, and I
>>> > >>> would actually like to see what we got there. You need debugfs=
 to be
>>> > >>> mounted. Then try the following:
>>> > >>>
>>> > >>>           # Unload all UCSI modules
>>> > >>>           modprobe -r ucsi_acpi
>>> > >>>
>>> > >>>           # At this point you should plug-in the problematic d=
evice
>>> > >>>
>>> > >>>           # Reload the UCSI core module
>>> > >>>           modprobe typec_ucsi
>>> > >>>
>>> > >>>           # Enable UCSI tracing
>>> > >>>           echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
>>> > >>>
>>> > >>>           # Now reload the ACPI glue driver
>>> > >>>           modprobe ucsi_acpi
>>> > >>>
>>> > >>>           # Unplug the problematic device so that you see the =
error
>>> > >>>
>>> > >>>           # Finally dump the trace output
>>> > >>>           cat /sys/kernel/debug/tracing/trace
>>> > >>>
>>> > >>> So if that works, please send the trace output to me.
>>> > >>> [Heikki]
>>> > >> I tried provided commands, both in Gentoo and Fedora - nothing =
in
>>> > >> trace at all. I guess, it's because ucsi on AMD can see two dev=
ices,
>>> > >> but cannot work with them, for some reason. I also checked same
>>> > >> commands on T14 Gen 3 (Intel), and I can see many ucsi_register=
_port
>>> > >> and ucsi_register_altmode events.
>>> > >>>
>>> > >>>
>>> > >
>>> > > I think I managed to find the issue - looks like on my laptop,
>>> > > ucsi_register fails in version check, !ucsi->version returns Fal=
se.
>>> > > Commenting out this check populates /sys/class/typec and
>>> > > /sys/class/usb_power_delivery. I did not check yet, if populated=
 data
>>> > > is correct, but, it's definite progress.
>>> >
>>> > Well spotted.
>>> >
>>> > That is probably the first UCSI read operation that failed. At the=
 very least
>>> > ucsi_register() could send a message to the log that it was exitin=
g rather
>>> > than leave users guessing.
>>> It returns -ENODEV, which, I guess, is a signal for code, which
>>> detects devices, that this module doesn't support this device.
>>>=20
>>> P.S. Looks like power_delivery code works properly, even with
>>> version=3D=3D0 - lsucpd shows proper directions, even with my Pixel =
7,
>>> which can charge laptop. Also it shows correct data for
>>> voltage/current, for "partner" device. It also shows proper data in
>>> power_supply subsystem. The only thing which is not working,
>>> currently, is displayport altmode not showing, for dockstation I
>>> have... But this might be missing module, or something else... I'll
>>> try this on Intel laptop, and will debug it further.
>>>=20
>>> >
>>> > My guess is that Lenovo/AMD have a configuration or timing issue.
>>>=20
>>> I tried to add loop, re-reading version in case if it's zero, but,
>>> even after 10 tries, it's returning zero, so, it's some weird behavi=
or
>>> of UCSI on this AMD laptop. I wonder, what should be the proper fix,
>>> then.
>>
>> You need to report this to Lenovo. This is an issue in their firmware.
>>
>> We can work around this by adding DMI quirk where we hardcode the UCSI
>> version for your system, but before we do that, you should try to get
>> Lenovo to fix their firmware.
>>
> I got forwarded this report from the support team. Was able to=20
> reproduce this on my system.
> I have internal ticket LO-2879 open and we'll look into it.
>
Just to confirm that I've tested a trial BIOS from the FW team and it fi=
xes the issue (shows up under /sys/class/typec
If there's anything in particular you'd like me to confirm let me know.

I've asked the FW team for confirmation when the fix will be released. E=
xpect it to take a while as the test/release process can take some time

Mark

