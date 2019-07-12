Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 110E96678B
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 09:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfGLHP1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Jul 2019 03:15:27 -0400
Received: from mga03.intel.com ([134.134.136.65]:29405 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbfGLHP0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Jul 2019 03:15:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jul 2019 00:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,481,1557212400"; 
   d="asc'?scan'208";a="174381080"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2019 00:15:23 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Rob Weber <rob@gnarbox.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: dwc3 Disable Compliance Mode
In-Reply-To: <20190712050139.GA28879@coops>
References: <20190710230110.GA3188@coops> <877e8phviw.fsf@linux.intel.com> <20190712050139.GA28879@coops>
Date:   Fri, 12 Jul 2019 10:15:19 +0300
Message-ID: <871ryvu3js.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Rob Weber <rob@gnarbox.com> writes:
>> > If not, is there some mechanism we could implement to reset the
>> > dwc3 when we enter compliance mode? I attempted some sort of mechanism
>> > to reset the link state, but it does not seem to help the issue. I've
>> > attached my patch and the trace events for my attempted workaround to
>> > this email. My initial approach was to transition the link from
>> > Compliance -> SS.Disabled -> Rx.Detect when we detect we've entered
>> > compliance mode. The traces show that the dwc3 just enters LFPS.Polling
>> > and subsequently enters compliance mode, despite the link being reset.
>>=20
>> I think you would have to go through the entire Power On Reset
>> sequence, but that's likely to be flakey.
>
> Okay, good to know. I am not confident in this approach as well because of
> the state management / recovery we might have to perform.
>
> I wanted to explain our goal a little bit more in depth in case some
> other apprach might come to mind. Our product supports 3 ways in which
> the user can work with the USB port: Host mode, Mass Storage Mode, and
> Ethernet Mode. Host mode is pretty straightforward. Users will generally
> work with USB mass storage devices and USB-Ethernet adapters in host
> mode. Mass storage mode exposes an internal user data partition using
> f_mass_storage and configfs so the user can connect our product to their
> host computer for backing up data. Ethernet uses the f_ecm and f_rndis
> functions creating an ethernet connection with USB hosts, particularly
> mobile devices, to interact with our mobile applications and servers
> through a wired connection.
>
> We control this functionality through a userspace application written in =
Go
> that creates the gadget/function configuration in configfs. Given this
> background information, are there any approaches that come to mind, such
> as reconfiguring the gadget? Thanks in advance for your input.

Not really, if it goes into compliance mode, the only way to get it out
of there is with a power-on reset. You can't even change link state back
to U0 as that will just tell dwc3 to walk through the compliance
patterns :-p

I think our best bet is understanding why we're transitioning to
compliance and preventing that.

One question comes to mind: Does this happen *only* with the ethernet
gadget? Does it happen with *all* hosts or just a particular host?

Any chance you can capture a full session with both CATC or Beagle 5000
analyzer and dwc3 tracepoints and send it to me?

>> >           <idle>-0     [003] dNs2   184.588232: dwc3_core: Compliance =
Mode detected. Attempting recovery routine
>>=20
>> Don't we get an interrupt for Compliance mode entry?
>
> Not that I've seen, surprisingly. My compliance mode recovery mechanism
> looks for both compliance mode and loopback mode, neither of which I
> have ever seen in the link state change events.

That's odd, I would expect it to still give the event. Oh well, moving
on :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0oM4cACgkQzL64meEa
mQaQMRAAzuY4UPkQcdf9kV973pRn0J6mq35vCl8FMvWFQHiQPTIRKA+ktFYz6qt6
cPVuy5A5wF9f7SAC8a61/C6am0RTtWPlsTg+9lxRW1wpWt+4geSWBfr1dlH1Djse
SfZ2Q+Bj/UHPX0W73gT8AMnaLY1TvRa+iGZJH6SrlKnX25IkIeaQgV882GDzny5G
aTwfBhe6g2ixgI36Scsn7Ahk4d4SkVA+frgtWGgX610AH7EvGYts046XIni9Of2d
J35nMmHvHu96suhY1RVpF4b4HLGLZYhoTjW6zpZDQm5j5fR/1ld2G9aiCuFU8gfX
K6WtRNG0ljgWD/VwPJ6pzcCa1ybDrRu812gxfz+O555vtMycPr5RZdxM4EdNufzd
THmQ42N35g3M20c+4RQwk1+XEFCwdO7ZA4V+fgZQKUVL86yRBGxwasgfpa70dWhO
n3yr1IDjaE7SsLU4Wau3pNJzvhbM03op0PToDhgu51jDMkXqZi8ZQQdlPSSfTbUI
xS8ljz+55FCc6OenEFdp2a8TPkfc7Om82h9khL64lZOTfMT1RM2eLl/E0nOS3UqC
aDTLgSc+0VOFoogahEsNLZOxz9+ZbB8ETgSZXqdQ/22yHMCfnIpNBFSV2KyBdAFO
ub7LsEXT7jQjq1+x75F5mYTt8RqCgcX2N5FhPusS4of+9vIbf7g=
=5KaN
-----END PGP SIGNATURE-----
--=-=-=--
