Return-Path: <linux-usb+bounces-2205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C921D7D7D16
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 08:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052E51C20EAD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 06:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74238C15;
	Thu, 26 Oct 2023 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659A48825
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 06:55:12 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C85E129
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 23:55:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qvuGn-0005Cz-In; Thu, 26 Oct 2023 08:55:05 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qvuGm-004LiV-6L; Thu, 26 Oct 2023 08:55:04 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qvuGl-00AJaG-T4; Thu, 26 Oct 2023 08:55:03 +0200
Date: Thu, 26 Oct 2023 08:55:03 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Jayant Chowdhary <jchowdhary@google.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"etalvala@google.com" <etalvala@google.com>,
	"arakesh@google.com" <arakesh@google.com>
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Message-ID: <ZToNRynv4u6IbroC@pengutronix.de>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
 <20231020233044.dh63nu3tkbmrtfl4@synopsys.com>
 <69609645-fa20-4987-981d-1ab264e80b9b@google.com>
 <ZTe5leI7Hvk2/cl9@pengutronix.de>
 <45fe4c79-458a-4eaf-8de8-50682f7d8b52@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26BZ6edR9Ajw3wQ5"
Content-Disposition: inline
In-Reply-To: <45fe4c79-458a-4eaf-8de8-50682f7d8b52@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--26BZ6edR9Ajw3wQ5
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 04:09:27PM -0700, Jayant Chowdhary wrote:
>On 10/24/23 05:33, Michael Grzeschik wrote:
>> On Mon, Oct 23, 2023 at 11:13:03AM -0700, Jayant Chowdhary wrote:
>>> On 10/20/23 16:30, Thinh Nguyen wrote:
>>>> Sorry for the delay response.
>>>>
>>>> On Sun, Oct 15, 2023, Jayant Chowdhary wrote:
>>>>> On 10/12/23 11:50, Thinh Nguyen wrote:
>>>>>> The frequency of the request submission should not depend on the
>>>>>> video_pump() work thread since it can vary. The frequency of request
>>>>>> submission should match with the request completion. We know that
>>>>>> request completion rate should be fixed (1 uframe/request + when you
>>>>>> don't set no_interrupt). Base on this you can do your calculation on=
 how
>>>>>> often you should set no_interrupt and how many requests you must sub=
mit.
>>>>>> You don't have to wait for the video_pump() to submit 0-length reque=
sts.
>>>>>>
>>>>>> The only variable here is the completion handler delay or system
>>>>>> latency, which should not be much and should be within your calculat=
ion.
>>>>>
>>>>> Thanks for the suggestion. It indeed makes sense that we do not compl=
etely depend on
>>>>> video_pump() for sending 0 length requests. I was concerned about
>>>>> synchronization needed when we send requests to the dwc3 controller f=
rom
>>>>> different threads. I see that the dwc3 controller code does internall=
y serialize
>>>>> queueing requests, can we expect this from other controllers as well ?
>>>> While it's not explicitly documented, when the gadget driver uses
>>>> usb_ep_queue(), the order in which the gadget recieves the request
>>>> should be maintained and serialized. Because the order the transfer go
>>>> out for the same endpoint can be critical, breaking this will cause
>>>> issue.
>>>>
>>> Thanks for clarifying this. Keeping this in mind - I made a slight modi=
fication to
>>> your test patch - I removed the uvc_video_pump() function call from uvc=
_v4l2_qbuf(). We just
>>> call it in uvcg_video_enable(). That should just queue 0 length request=
s till the first qbuf
>>> is called. There-after only the complete handler running uvcg_video_com=
plete() calls video_pump(),
>>> which sends usb requests to the endpoint. While I do see that we hold t=
he queue->irqlock while
>>> getting the uvc buffer to encode and sending it to the ep, I feel like =
its just logically safer
>>> for future changes if we can restrict the pumping of requests to one th=
read.
>>>
>>> Does that seem okay to you ? I can formalize it if it does.
>>
>> I tested this, and it looks good so far.
>>
>> Since your changes are minimal you could send this with me as the author
>> and add your Suggested-by Tag. You should also add your Tested-by Tag in
>> that case.
>>
>I sent out https://lore.kernel.org/linux-usb/99384044-0d14-4ebe-9109-8a555=
7e64449@google.com/T/#u
>
>with a Signed-off-by crediting you and suggested by with Avichal and me. I=
t has a few changes related to
>
>bulk end-points as well, but they're relatively minor.

Sounds good to me, but you missed your own Signed-off-by in the patch.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--26BZ6edR9Ajw3wQ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmU6DUUACgkQC+njFXoe
LGTboA//fRYw7ZMp+1UYjI2xZCYc51yKcxDe56f1JTTut8a04buikqYyLR/duxhA
5O6j/fW5I7lPJOlLaACheoViw3F5S2BP19psOC65sjUAAeIKvbPfDKvpTKkq87ki
Gtr+O01QuS5xjz+qLPshuhEflDw3HvZzlksXZjfvSBqdJ30PXJx8xdkqJVeyeR5Q
8O4E2SPu94APzhZHie8aCCaPW1Zc8YkWDhxr9rHRGmZ3DaEpsHDpWm+vrg4qrLWt
rIowB6noUMjeEDrl7f7dKZFBGryVaf8yGGjZw1/ROwoAZNY5S1z4PVSIbvYrNfh5
W6oQzXerjm2D5wMlMUa/DAvXqd4X9aElhqf6UhyfYAsZ28OjSh97GiK9fAXGi/PR
EYCYjDzSm1JfSDAvZnIl6XVFHg86u/OH+JTrIA5mAmOBrUe6IoJv25ElqNeWm6ZY
AKU2iL4j1nRaRwMdoGzufUIvLKB5H2j82dqzgwfFYkPEKSi/vf0XSUjMSFA4cgON
FawHP1PoUMkYO3qOwTMgNFOrrFWAbmQhcCoeoSPrhOu0uTeFMGaWVU1fDjyrZ9wh
v9DiMNJCHp3foFjlxxqfSjAtLV0i24bOu/+FFH2q6Hu5cDFRQfYxWtxU6+O03I0E
QvWAs9ESbDPMs0l4QtLrRvnpjWZ5lkt8qIIYjGqhN5ZDhV57AX8=
=9SKu
-----END PGP SIGNATURE-----

--26BZ6edR9Ajw3wQ5--

