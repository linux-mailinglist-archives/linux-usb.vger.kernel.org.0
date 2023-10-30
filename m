Return-Path: <linux-usb+bounces-2352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDCD7DB9BA
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 13:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4A71F21FCB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 12:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36FA156FD;
	Mon, 30 Oct 2023 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D55A15487
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 12:18:24 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5ACDA
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 05:18:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qxRDm-0004w4-Iq; Mon, 30 Oct 2023 13:18:18 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qxRDl-005KSU-LK; Mon, 30 Oct 2023 13:18:17 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qxRDl-00GA0L-CN; Mon, 30 Oct 2023 13:18:17 +0100
Date: Mon, 30 Oct 2023 13:18:17 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
Message-ID: <ZT+fCXtsa3s4CoGC@pengutronix.de>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <20230906004144.4igr4akglxxqahc3@synopsys.com>
 <ZPgnwlOV1XP82kAY@pengutronix.de>
 <20230906230510.vi7d4wnjeiapgtyk@synopsys.com>
 <20230906230900.tmyhlxomrhsm3kna@synopsys.com>
 <ZPo51EUtBgH+qw44@pengutronix.de>
 <20230907233319.djsrstygwo6vr3yd@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sIYZ6J9rJQd4E7/N"
Content-Disposition: inline
In-Reply-To: <20230907233319.djsrstygwo6vr3yd@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--sIYZ6J9rJQd4E7/N
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

On Thu, Sep 07, 2023 at 11:33:26PM +0000, Thinh Nguyen wrote:
>On Thu, Sep 07, 2023, Michael Grzeschik wrote:
>> On Wed, Sep 06, 2023 at 11:09:03PM +0000, Thinh Nguyen wrote:
>> > On Wed, Sep 06, 2023, Thinh Nguyen wrote:
>> > > On Wed, Sep 06, 2023, Michael Grzeschik wrote:
>> > > >
>> > > > > 2) Burst setting
>> > > > > 	I think this is self-explainatory. Large data request needs
>> > > > > 	higher burst.
>> > > >
>> > > > I will have to find out if the burst setting can be changed on the
>> > > > rk3568 somehow. This sounds very likely.
>> > > >
>> > >
>> > > The dwc3 driver checks the endpoint descriptor from the UVC function
>> > > driver to setup the burst. So just setup the max 16 bursts (or 15 in=
 the
>> > > descriptor). The dwc3 controller supports that. Whether the host wou=
ld
>> > > do 16 bursts is another thing. Note that there's no "mult" setting f=
or
>> > > SuperSpeed.
>> >
>> > Clarification: no mult setting for the dwc3 controller when operate in
>> > SuperSpeed.
>>
>> I was somehow mistaken by the wording "burst setting" and thought of the
>> axi-bus burst setting to the controller instead of the usb3 maxburst
>> setting as you ment actually.
>
>I see. You were referring to the axi-bus burst. If your platform takes a
>long time to DMA out the data, it will impact the performance also. You
>can play around with GSBUSCFG0 to enable/restrict certain burst sizes to
>see any improvement. However, I would expect the default
>coreConfiguration values should be optimal for your platform design.

I was not lucky with that parameters. Under heavy memory load the
system still runs into fifo underruns.

>> However. This is usefull input anyway. I never thought of maximizing the
>> burst and packagesize and let the host side make the decision.
>> But we will probably will eat up a lot of usb bandwidth by doing so.
>>
>> Before your note I was somehow mistaken that the maxpacket and maxburst
>> size had to correlate with the actually transfered data we queue into
>> the hardware per request.
>
>Right. The maxpacket, maxburst, and mult limit the max request data
>length you can send.

>> > > I recall that UVC tries to pack a lot of data in a single request. A=
ll
>> > > the while some intervals it would send 0-length data because of idle
>> > > time. I would spread to more requests with a little less data to give
>> > > the host a little more breathing room and bandwidth.
>>
>> The higher load per request is due to the fact that the uvc gadget is
>> using the multiplier, maxpacket and maxburst parameters for the size
>> calculation of the request.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/usb/gadget/function/uvc_video.c#n331
>>
>> Since it is clear now that those parameters are not necessary coupled
>> it makes total sense to split the requests into smaller chunks.
>>
>
>Ok.

So changing the req_size to smaller chunks indeed did increase the
stability. The main misunderstanding here was that the that not every
request corresponds with the timeslot of one interval.

After reading this thread once again, it is clear that this is not the
case and we still find all possible bandwidth by decreasing the size of
each request.

The main takeway was that with the hardware will cache several
trbs into the queue. So when there are not enough trbs available
because they are just to big, the fifo runs into underruns.

In our case with the high memory bandwidth usage, the trbs could
probably not even read out that few trbs in time and did trigger
the case earlier.

So with smaller requests the fifo will be filled with more smaller
trbs and does not run out that fast, since more trbs are cached to
begin with.

One more question: Does the caching amount of the fifo directly
correlate with the endpoint setting in DWC3_DEPCFG_BURST_SIZE then?

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--sIYZ6J9rJQd4E7/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmU/nwUACgkQC+njFXoe
LGSJrQ/+PFLsvWXU90p60Fqb8nTGS3pt+JawjtASlW75KN1PoETqqEb1H7mFd4Vq
iGSC8j/QUobFdLs0UJhU32LPyUxXwIjoiN53FkQqfG2TmxQdZYZFXIfJ+fjVJspi
m+2hhMDoone1mE7OrWa1Do37J5832n2tSqXP8pdJap8VP2JSRcYUXkYrvqvD36Bg
sr7dd/XU/w7mf0YsmiGLQbUgI/1ff21IMGkTiCI8OvtW5AA0svqshKIpI0oXpvbu
tBNVzk2/O7qt1oV7krLIz2wa/eNIku3/6SC9cIwUdtG5twp3sWYnaHaQkk21JvcN
xn8XE9pIMdyrbLdTnIsO13sdKDlRByZwnY9e9wZOdO57rGDYm+4G355N57Fvb1t/
LUZJuXISP6nbzCr+4yqKQ6EYmjFHQ8/6dKPgMkbNWfM11m+E+AVEshdavznFcPbl
eJMBJQtd0wKzpgZuh8H3+zCbLYVN9MqoJkFUoS2K+lmfVdRYwoHcNd+dyigG3LNE
2+tyCAH5KHCGq+i+WUF5v3TcewbtquL/Nwgzp3n+zc5C2IKS0T9EVTxLbG2Bf+8M
HennVFPu8h1HgNJJryAK+cgygPxkrvUFOGgNGXijeuWP0xBBxQnr62oQ3wMsDI0J
FB7jqusEyy74n0lLDGfp6i9ppUZIpGvHhHWQtW892CPJPALyQIU=
=89XU
-----END PGP SIGNATURE-----

--sIYZ6J9rJQd4E7/N--

