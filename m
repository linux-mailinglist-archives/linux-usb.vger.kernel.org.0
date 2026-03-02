Return-Path: <linux-usb+bounces-33886-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCjJIH7fpWkvHgAAu9opvQ
	(envelope-from <linux-usb+bounces-33886-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 20:05:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C71DE9BE
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 20:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21EDC30065C0
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 19:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F263563EB;
	Mon,  2 Mar 2026 19:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Veg68WIi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488C359A8A
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478328; cv=none; b=jXmXtpjVi0f1oxsmhFTljGIWdzpHtZSLlCOEqR3RdhgrslDG722JfDCiC3KbKGQXcrJyz1FYyr0KB878Wpm8apOgYk4/Yy/FGFA8wAsGnVYHFLqVOaibYIQfBMBCDEFK6YBsktfH3iF7xprCTYzm9YnRb60x/Fvb2ILtSK7kD/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478328; c=relaxed/simple;
	bh=+dSzVp+ZJQEGO1DIm9o2uxvt2gdPzJonX6f61zYC1ew=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dI08Yzm3souLD1pU66eTbzi9CL8z6Z2HwbUoxYtczA/PM6WPmvKPX+lr+WfH2s5peQdId7vw3KligbE8otmo7WlJH2jI5b1WdaJD35nH8MhquULlkieF1lN650/911gsrszzjKICnkti6nataA01X7vvqj34LEehz3+vXggHDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Veg68WIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E9E2C19425
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 19:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772478328;
	bh=+dSzVp+ZJQEGO1DIm9o2uxvt2gdPzJonX6f61zYC1ew=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Veg68WIiArF8dZMxTjsfU84B8KmbnCfTfKKsT8gg16oLH6ady5qkL/Vd5ATF0/IwI
	 Rt18bx401JEN18taZ3zASpw6gwBYYhnDg/rJ2dMVUeNjq/gjRvVawC/TkVLjpDD+bA
	 H5yB1a3cKohCr8A1eWmf2cR1ModPORkCUqRr4RKSi5HspNavk4hvNnr6wrHMxs9EpF
	 1mTFC70TON4UWNj/IHvscvHop9QrBnPH/FoNrKLr3gwssLdwNrIxma1UOvEPIQiZZg
	 fu/Kjw129UVuGP+Ktudpjq2e1EjL11oqeZXq2sQCNTXp3gQcrpe53yuqUaksXCCcrS
	 qm5ls6c88eu+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D21CC53BBF; Mon,  2 Mar 2026 19:05:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Mon, 02 Mar 2026 19:05:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-MUJeGjr4u3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1F4C71DE9BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33886-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,reddit.com:url,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #19 from Alexander F (superveridical@gmail.com) ---
Created attachment 309514
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309514&action=3Dedit
Z13 dmesg with xhci_hcd.quirks=3D0x40

The xhci_hcd.quirks=3D0x40 quirk resolves the 10 second resume issue, the d=
evices
on this bus also don't disappear and work nominally. Not sure if there are =
side
effects to this quirk. Since I don't know what to look for without "HC died=
", I
uploaded a dmesg with the number of resume/suspends that usually triggers t=
he
issue.

Regarding the brokenness of my device -- it's highly likely. I thought that=
 it
was the improper interaction with / "fragility" of the hardware/firmware th=
at
causes the issues described below. I assumed I should just quietly wait for=
 the
next AGESA, but it seems that it could just as well be some kind of latent
hardware failure mode (a common type of failure, or some QC issue?). It's j=
ust
strange to my inexperienced self that it manifests itself so similarly for a
number of people on different devices in the same way. The debug data repor=
ts
from others are definitely required before making a decision on this, since=
 my
sample might not be representative. (I think it would be even better if the
reporter from Framework sent the device on which it could be repeatedly
reproduced to AMD)

Here is circumstantial evidence for my device/soc being broken, over a mont=
h+
of semi-active use, the issues are seemingly adjacent to
sleep/restart/hibernate actions and IRQs (I apologize for the non-technical
nature, and if it's inappropriate, but since I'm the only who provided debug
data so far, and I'm not a hardware person, that's all I could do to provide
the context. I'm prepared to supply any data requested):

- No mass complaints about 10 second resumes on Linux here
https://www.reddit.com/r/FlowZ13/ and there is a good number of Linux users.
- I primarily used this device with linux.
- The first issues I encountered were audible latency issues on battery on
pre-installed windows -- LatencyMon showed 30000 to 50000 (i.e. several full
frames) interprocess stutters for me, during a 3 minute test, while simply
playing a video in a browser at about 8-10w soc power.  But since I wasn't =
the
only one
https://www.reddit.com/r/FlowZ13/comments/1jcgfn9/2025_395_audio_cracking/
(note the screenshots, these are not mine) I thought it was "normal".
Interestingly, clean installation of 23h2 windows cleared this issue
completely. Upgrade to 25h2 returned the increase in latencies on battery p=
ower
from about 150 to 400, but the horrific 10k+ stutters didn't return. If it'=
s a
hardware issue it could be that it was "fixed" just be due to the less bloa=
t on
a clean install.=20
- On Linux I only observed smaller stutters using
https://testufo.com/animation-time-graph#scale=3D20&measure=3Dinterval , I'=
m yet to
do it properly using a lightweight compositor that is not mutter + mangohud=
 +
vkcube.  Several times on Linux liveusbs I encountered "hrtimer interrupt t=
ook
2million+ nanoseconds" messages in dmesg, but not on the up to date kernel =
and
firmware on Gentoo though, so far.
- The device could simply die(as in you have to power it on as if it was of=
f)
on suspend / restart action. This is rare, but it's at least 1/100 - 1/200
chance. Detaching power / USB devices could  be a factor, not sure.=20
- Two times it died while in use. One of those was shortly after hibernation
resumption on linux. The other one was on windows, but I don't remember the
context, probably also after hibernation, since ASUS software forces it. I'm
afraid to explore repeatability of this, since it's a tablet, and powercycl=
ing
through battery disconnection requires special tools.
- Haven't observed any instability outside of power related actions -- I
compiled an entire Gentoo on it(-j16), played heavy games for hour+, left i=
t on
idle for days. So far my understanding is that if it survives a minute afte=
r a
power action it will be rock solid until the next power action.
- The device could accrue "brokenness" that is preserved between "soft" res=
ets.
This is also rare. For example one time it was systematically doing very lo=
ng
boots due to getting stuck on a btusb device, and it was cleared only by ha=
rd
reset. In this state it was similarly stuck on power on at the bios stage (=
logo
appeared with a significant delay)=20

Feb 13 22:36:46 gentoo kernel: usb 3-3: device descriptor read/64, error -1=
10
Feb 13 22:37:02 gentoo kernel: usb 3-3: device descriptor read/64, error -1=
10
Feb 13 22:37:02 gentoo kernel: usb 3-3: new high-speed USB device number 3
using xhci_hcd
Feb 13 22:37:07 gentoo kernel: usb 3-3: device descriptor read/64, error -1=
10
Feb 13 22:37:23 gentoo kernel: usb 3-3: device descriptor read/64, error -1=
10
Feb 13 22:37:23 gentoo kernel: usb usb3-port3: attempt power cycle
Feb 13 22:37:24 gentoo kernel: usb 3-3: new high-speed USB device number 4
using xhci_hcd
Feb 13 22:37:29 gentoo kernel: xhci_hcd 0000:c6:00.0: Timeout while waiting=
 for
setup device command
Feb 13 22:37:34 gentoo kernel: xhci_hcd 0000:c6:00.0: Timeout while waiting=
 for
setup device command
Feb 13 22:37:34 gentoo kernel: usb 3-3: device not accepting address 4, err=
or
-62
Feb 13 22:37:35 gentoo kernel: usb 3-3: new high-speed USB device number 5
using xhci_hcd
Feb 13 22:37:40 gentoo kernel: xhci_hcd 0000:c6:00.0: Timeout while waiting=
 for
setup device command
Feb 13 22:37:42 gentoo systemd-udevd[595]: usb3: Worker [673] processing
SEQNUM=3D2836 is taking a long time.
Feb 13 22:37:45 gentoo kernel: xhci_hcd 0000:c6:00.0: Timeout while waiting=
 for
setup device command
Feb 13 22:37:45 gentoo kernel: usb 3-3: device not accepting address 5, err=
or
-62
Feb 13 22:37:45 gentoo kernel: usb usb3-port3: unable to enumerate USB devi=
ce

- The other time it had caught a bout of systematically dying on restart. W=
as
also cleared by a hard reset (holding power button for some N>10 seconds).

While there are similar reports in /r/FlowZ13, if such state of the device =
was
prevalent it would be more notable. There is also a possibility that the st=
uff
above is independent of this particular bug.

Miscellaneous (likely unrelated):
- There is a back RGB backlight window usb hid device (3-5) and I observed =
it
in the 3 states: Right after a hard reset it's turned off both on DC and
battery, as it should be per ArmoryCrate settings. Power off / power on cyc=
le
turns it on for some reason, until the next hard reset. But in that turned =
on
state it could be responsive to systemd and echo commands (systemd turns it=
 off
after a short flare up on resume), but could become unresponsive, and in th=
at
case I have to do the following to turn it off.

echo "3-5" > /sys/bus/usb/drivers/usb/unbind; sleep 0.5; echo "3-5" >
/sys/bus/usb/drivers/usb/bind; sleep 0.5; echo 0 >
/sys/class/leds/asus\:\:kbd_backlight_1/brightness

I managed to reproduce it repeatedly by having it ON after a power on/off
cycle, and then resuming once on battery, and after that on every resume you
have to unbind/bind it. Other devices on this bus don't have resume issues.=
=20

Other likely-real bugs I won't be filing/reporting/commenting on since my
device is likely broken(just putting it out here on the internet):
- cat /sys/kernel/debug/dri/0/amdgpu_pm_info and amdgpu_top report the wrong
soc power wattage while on battery -- when I disconnect DC, on idle, soc po=
wer
instantly jumps from 3-something w to 6w. upower --dump and powerstat show =
1w+
lower settled actual battery discharge rate, which should be impossible.
- encountered https://gitlab.freedesktop.org/drm/amd/-/issues/5000 over HDM=
I to
LG 27GR93U-B at 4k 120hz, wasn't able to reproduce it a second time after
trying for an hour

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

