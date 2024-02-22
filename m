Return-Path: <linux-usb+bounces-6890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD2F85FB3F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC531F25240
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AE01474C1;
	Thu, 22 Feb 2024 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="U4eO1kE1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CApB06kK"
X-Original-To: linux-usb@vger.kernel.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493F31482E9
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708612197; cv=none; b=M0fGxTUDxXcQfIJJQKVl1tEjSS0f/SDkgJJdsrnb+JqgmukhOBekSHn90CqnySCFgBnLBAzgEawFEKOUY/BGMLRJEmBJme3lBFOYAsZg2tr0JDwtcFOJcQS3Y7HH8G/Fb+b9LmZUGnPwRfVOQaftzHzbeEmA+SGNlhFx+QKRemY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708612197; c=relaxed/simple;
	bh=FsXfQomB+m5sSdJPq8fcfN6jAxearJFjaRt9p5LkSiI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=VFvkxy0F8pYLLV473Pixd1c3z5jqaPQvY9rn/vBR/MQ83Pz0suDcFTOANv0RPBUy+0QD+qe5SkVjfYw2eFrk9FLEZ9IkbJUzXJbVwpFciGT3kfE9nxRdUEXRSEIO8P6Trymu7kPNpCwSezJxlpmd31W82WTuLZZON+j9Nh/CROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=U4eO1kE1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CApB06kK; arc=none smtp.client-ip=66.111.4.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0C7F35C0053;
	Thu, 22 Feb 2024 09:29:47 -0500 (EST)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Thu, 22 Feb 2024 09:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1708612187;
	 x=1708698587; bh=WZgUm+AjJHHYMfGW+gHK1m0dq3UF/Fx41ZGWIZsE1uI=; b=
	U4eO1kE1sbMjfPKyTM34Qg/Dn5dKiRE3mw6Vea050pAlvmb6Ju1y8h2afBsUFnt2
	6r0p0/TOqQie567wrlklZnJhkzjZYRhdQfd37jC91J7UFXldariB+nNsldXmrvIm
	RE0yKOfPfXxQPL6jkxOMITxBY3rYYFvaxq+/96hquNmzZFhv0bGYuJ/AedOIicR3
	bTn1KwwA7PqBB4NuQc1AjjQ7OPDNniOEbg1TV1dqSwetk3yWUP13I4da8E0FQgvz
	4whkbmLaM5WzNBop3R7r1mhlqUnIkUFOIxwGgCds6zFfBFpScnPAAioGXznPgifj
	NN5UDme1sVlJsxqzUtMXlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708612187; x=
	1708698587; bh=WZgUm+AjJHHYMfGW+gHK1m0dq3UF/Fx41ZGWIZsE1uI=; b=C
	ApB06kKip3sb/pLs6a4nOxP+2/vsftu3nSapOEvqTRrW0fVbZx1yJB5385YZRcJh
	Z7nh1t3vq7jcN5el2EJrW+XHiGLFMD8MluG1u9knkXGTsZMgX4uEG5JTrRf7wQjJ
	P5CE5rBUFnWp9/Rsjpd1W55ubY3ULxPRwQZTv0h1u5yc7l92tPqotjI9EtHgt5GY
	m8afBgfb0cW9TznULZ4qKY5hfiCtxvC34qbk6LtwPoxCCV1VtWkR1Ejigxdjtaay
	mfUCuLSszrBpZ3OTJNNi/RNSqyryrcBTpe0/lnNV5PE9RdmdQIzx3osTD6qzsfa9
	WhIm1Whw+rImWMJg1Asxw==
X-ME-Sender: <xms:WlrXZYHe30CLDulBcgEiOzJf47fovcQaE1Rk1XyjuMzvAFdeuMld5g>
    <xme:WlrXZRW_Gwbo6KyCkTkb0mpII8ep0xs8UXShrJo12ztkh-9d4j77XwSU4Suyq2BLV
    GgroWtLCSMRuNVwYSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeggdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhesshhquhgvsggsrdgtrgeqnecugg
    ftrfgrthhtvghrnhepgfegfffgfefhjeehudejieejhffhuefhvdeggedvffevteetudeu
    feetgeefveelnecuffhomhgrihhnpehmohguuhhlvghsrdhlshenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhesshhquhgv
    sggsrdgtrg
X-ME-Proxy: <xmx:WlrXZSKSOdyaRmA3wqgIHkZnLRDSW9SwJ9zkwFd3Zdq16iUu264x7A>
    <xmx:WlrXZaEwCfaP3LOnbsncwyRv1gOHx_lsqA3gpeiV27LcJJyR8g_IcA>
    <xmx:WlrXZeUeSrKyvdYQJia3SKaupPNPee0wQZcbogPR7nY41kSqTAl_TA>
    <xmx:W1rXZRdP_41hmWeVGJelcs20eGTtfbNVtAdpzfazhZz-EgdzRsNz_A>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4EEE7C60097; Thu, 22 Feb 2024 09:29:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <b696742d-82a5-4882-8997-6acb8cec28e4@app.fastmail.com>
In-Reply-To: <ZYFqS+QAl6ZKdPQ5@kuha.fi.intel.com>
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
Date: Thu, 22 Feb 2024 09:30:00 -0500
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Yaroslav Isakov" <yaroslav.isakov@gmail.com>
Cc: dgilbert@interlog.com, linux-usb@vger.kernel.org
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 19, 2023, at 5:02 AM, Heikki Krogerus wrote:
> On Mon, Dec 18, 2023 at 06:45:05PM +0100, Yaroslav Isakov wrote:
>> =D0=BF=D0=BD, 18 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 04:4=
6, Douglas Gilbert <dgilbert@interlog.com>:
>> >
>> > On 12/17/23 16:25, Yaroslav Isakov wrote:
>> > > =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 =
21:48, Yaroslav Isakov <yaroslav.isakov@gmail.com>:
>> > >>
>> > >> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2=
 20:15, Douglas Gilbert <dgilbert@interlog.com>:
>> > >>>
>> > >>> On 12/17/23 12:24, Yaroslav Isakov wrote:
>> > >>>> =D0=B2=D1=81, 17 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2=
 18:08, Douglas Gilbert <dgilbert@interlog.com>:
>> > >>>>>
>> > >>>>> On 12/17/23 11:21, Yaroslav Isakov wrote:
>> > >>>>>> Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and I
>> > >>>>>> installed Gentoo on it, with kernel 6.6.4.
>> > >>>>>>
>> > >>>>>> Even though type-c ports seems to be working (I checked usb3=
 flash
>> > >>>>>> stick, lenovo charger, Jabra headset, Yubikey), I cannot see=
 any
>> > >>>>>> devices in /sys/class/(typec,typec_mux,usb_power_delivery).
>> > >>>>>>
>> > >>>>>> There are no messages in dmesg at all, mentioning typec. I c=
an see
>> > >>>>>> that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. =
I can see
>> > >>>>>> that device TYPEC000 is present on acpi bus, there are files=
 in
>> > >>>>>> /sys/bus/acpi/devices/USBC000:00, but, there is no driver li=
nked in
>> > >>>>>> it.
>> > >>>>>>
>> > >>>>>> I tried to recompile module ucsi_acpi, with adding { "USBC00=
0", 0 }
>> > >>>>>> to ucsi_acpi_match, but it did not change anything (except t=
hat in
>> > >>>>>> modinfo of this module, USBC000 is now seen.
>> > >>>>>>
>> > >>>>>> I tried to decompile SSDT1 table, which has definition of US=
BC, but
>> > >>>>>> there is nothing in it, which is supicious.
>> > >>>>>>
>> > >>>>>> What else can I check, to understand, why can't I see anythi=
ng in
>> > >>>>>> typec/PD subsystems?
>> > >>>>>>
>> > >>>>>
>> > >>>>> I have a X13 Gen 3 [i5-1240P] which is about 18 months old. E=
verything you
>> > >>>>> mention is present plus the typec ports and the associated pd=
 objects:
>> > >>>>>
>> > >>>>> $ lsucpd
>> > >>>>>     port0 [pd0]  <<=3D=3D=3D=3D  partner [pd2]
>> > >>>>>     port1 [pd1]  <
>> > >>>>
>> > >>>> I guess, it makes no sense to install lsucpd, if it checks /sy=
s/class/typec etc?
>> > >>>>
>> > >>>>>
>> > >>>>> A power adapter is connected to port0. Here are the modules l=
oaded:
>> > >>>>>
>> > >>>>> $ lsmod | grep typec
>> > >>>>> typec_ucsi             57344  1 ucsi_acpi
>> > >>>>> roles                  16384  1 typec_ucsi
>> > >>>>> typec                 114688  1 typec_ucsi
>> > >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typ=
ec_ucsi
>> > >>>>> $ lsmod | grep ucsi
>> > >>>>> ucsi_acpi              12288  0
>> > >>>>> typec_ucsi             57344  1 ucsi_acpi
>> > >>>>> roles                  16384  1 typec_ucsi
>> > >>>>> typec                 114688  1 typec_ucsi
>> > >>>>> usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typ=
ec_ucsi
>> > >>>>>
>> > >>>> I have exact same modules.
>> > >>>>
>> > >>>>> $ ls /sys/bus/acpi/devices/USBC000:00
>> > >>>>> device:ac  device:ad  hid  modalias  path  physical_node  pow=
er  status
>> > >>>>> subsystem  uevent  uid  wakeup
>> > >>>> Under /sys/bus/acpi/devices/USBC000:00 I have the similar file=
s:
>> > >>>> adr  device:48  device:49  hid  modalias  path  physical_node =
 power
>> > >>>> status  subsystem  uevent  uid
>> > >>>> As you don't have driver symlink there, too, then it's a red h=
erring,
>> > >>>> that lack of driver file is symptom of this issue.
>> > >>>>
>> > >>>>>
>> > >>>>> Strange that the Thunderbolt module is loaded since I thought=
 only the Intel
>> > >>>>> variants supported Thunderbolt.
>> > >>>> thundebolt module is now shared with USB4 subsystem, and T14 s=
tarted
>> > >>>> to have USB4 from Gen 3, for AMD variant.
>> > >>>>>
>> > >>>>> The only thing that I can think of is some BIOS setting. When=
 I poked around
>> > >>>>> in the X13 BIOS I don't remember any setting that would cause=
 what you are
>> > >>>>> seeing.]
>> > >>>> I checked BIOS settings, but I cannot find anything related
>> > >>>>
>> > >>>> Could you please show, what drivers are used for device:ac and
>> > >>>> device:ad, under /sys/bus/acpi/devices/USBC000:00? It seems th=
at if I
>> > >>>> have such entries in my /sys/bus/acpi/devices/USBC000:00, at l=
east
>> > >>>> ucsi_acpi works properly.
>> > >>>
>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ ls -l
>> > >>> total 0
>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
>> > >>> ../../../../platform/USBC000:00/typec/port0
>> > >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../=
../../bus/acpi
>> > >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>> > >>>
>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ac$ cd ../=
device\:ad
>> > >>> dougg@treten:/sys/bus/acpi/devices/USBC000:00/device:ad$ ls -l
>> > >>> total 0
>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 adr
>> > >>> -r--r--r-- 1 root root 4096 Dec 16 19:11 path
>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 19:11 physical_node ->
>> > >>> ../../../../platform/USBC000:00/typec/port1
>> > >>> drwxr-xr-x 2 root root    0 Dec 16 19:11 power
>> > >>> lrwxrwxrwx 1 root root    0 Dec 16 16:45 subsystem -> ../../../=
../../bus/acpi
>> > >>> -rw-r--r-- 1 root root 4096 Dec 16 16:45 uevent
>> > >>>
>> > >>>
>> > >>>>
>> > >>>> In my /sys/bus/acpi/devices/USBC000:00/device:(48,49), there a=
re only
>> > >>>> adr, path and uevent files, and power and subsytem folders. Su=
bsystem
>> > >>>> links to bus/acpi, and path has \_SB_.UBTC.CR01, \_SB_.UBTC.CR=
02
>> > >>>
>> > >>> Mine has the extra physical_node symlinks to typec/port0 and ty=
pec/port1
>> > >> Yes, I have the same as on T14 Gen 3 (Intel). Looks like they ha=
ve no
>> > >> driver symlinks, too, but they're working on Intel.
>> > >>>
>> > >>>> P.S. I tried latest live Fedora, just to see if I forgot to co=
mpile
>> > >>>> some drivers for custom-built Gentoo kernel, but same issue on=
 Fedora
>> > >>>
>> > >>> Below is a fragment of a post from Heikki Krogerus about turnin=
g on ucsi debug:
>> > >>>
>> > >>> If you want to see the actual UCSI notification in user space, =
then
>> > >>> that is not possible, but the driver does produce trace output,=
 and I
>> > >>> would actually like to see what we got there. You need debugfs =
to be
>> > >>> mounted. Then try the following:
>> > >>>
>> > >>>           # Unload all UCSI modules
>> > >>>           modprobe -r ucsi_acpi
>> > >>>
>> > >>>           # At this point you should plug-in the problematic de=
vice
>> > >>>
>> > >>>           # Reload the UCSI core module
>> > >>>           modprobe typec_ucsi
>> > >>>
>> > >>>           # Enable UCSI tracing
>> > >>>           echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
>> > >>>
>> > >>>           # Now reload the ACPI glue driver
>> > >>>           modprobe ucsi_acpi
>> > >>>
>> > >>>           # Unplug the problematic device so that you see the e=
rror
>> > >>>
>> > >>>           # Finally dump the trace output
>> > >>>           cat /sys/kernel/debug/tracing/trace
>> > >>>
>> > >>> So if that works, please send the trace output to me.
>> > >>> [Heikki]
>> > >> I tried provided commands, both in Gentoo and Fedora - nothing in
>> > >> trace at all. I guess, it's because ucsi on AMD can see two devi=
ces,
>> > >> but cannot work with them, for some reason. I also checked same
>> > >> commands on T14 Gen 3 (Intel), and I can see many ucsi_register_=
port
>> > >> and ucsi_register_altmode events.
>> > >>>
>> > >>>
>> > >
>> > > I think I managed to find the issue - looks like on my laptop,
>> > > ucsi_register fails in version check, !ucsi->version returns Fals=
e.
>> > > Commenting out this check populates /sys/class/typec and
>> > > /sys/class/usb_power_delivery. I did not check yet, if populated =
data
>> > > is correct, but, it's definite progress.
>> >
>> > Well spotted.
>> >
>> > That is probably the first UCSI read operation that failed. At the =
very least
>> > ucsi_register() could send a message to the log that it was exiting=
 rather
>> > than leave users guessing.
>> It returns -ENODEV, which, I guess, is a signal for code, which
>> detects devices, that this module doesn't support this device.
>>=20
>> P.S. Looks like power_delivery code works properly, even with
>> version=3D=3D0 - lsucpd shows proper directions, even with my Pixel 7,
>> which can charge laptop. Also it shows correct data for
>> voltage/current, for "partner" device. It also shows proper data in
>> power_supply subsystem. The only thing which is not working,
>> currently, is displayport altmode not showing, for dockstation I
>> have... But this might be missing module, or something else... I'll
>> try this on Intel laptop, and will debug it further.
>>=20
>> >
>> > My guess is that Lenovo/AMD have a configuration or timing issue.
>>=20
>> I tried to add loop, re-reading version in case if it's zero, but,
>> even after 10 tries, it's returning zero, so, it's some weird behavior
>> of UCSI on this AMD laptop. I wonder, what should be the proper fix,
>> then.
>
> You need to report this to Lenovo. This is an issue in their firmware.
>
> We can work around this by adding DMI quirk where we hardcode the UCSI
> version for your system, but before we do that, you should try to get
> Lenovo to fix their firmware.
>
I got forwarded this report from the support team. Was able to reproduce=
 this on my system.
I have internal ticket LO-2879 open and we'll look into it.

Mark

