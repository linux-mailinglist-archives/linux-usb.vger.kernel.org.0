Return-Path: <linux-usb+bounces-1857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D37CDD42
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 15:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7055A1C20DAD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 13:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FA7358AC;
	Wed, 18 Oct 2023 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2318636
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 13:29:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF8095
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 06:29:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qt6bb-0006n6-7X; Wed, 18 Oct 2023 15:28:59 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qt6ba-002ZG9-66; Wed, 18 Oct 2023 15:28:58 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qt6bZ-00GTRJ-Sm; Wed, 18 Oct 2023 15:28:57 +0200
Date: Wed, 18 Oct 2023 15:28:57 +0200
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
Message-ID: <ZS/dmTjdCCdnelVP@pengutronix.de>
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
 <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
 <20231012184954.ech7kfpqjkunq6eu@synopsys.com>
 <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVCP3qdL2nu0mKes"
Content-Disposition: inline
In-Reply-To: <c47e864b-4b9e-4a21-afea-af121a4d7771@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--SVCP3qdL2nu0mKes
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2023 at 09:33:43PM -0700, Jayant Chowdhary wrote:
>On 10/12/23 11:50, Thinh Nguyen wrote:
>> On Mon, Oct 09, 2023, Jayant Chowdhary wrote:
>>>> On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
>>>>> We had been seeing the UVC gadget driver receive isoc errors while
>>>>> sending packets to the usb endpoint - resulting in glitches being sho=
wn
>>>>> on linux hosts. My colleague Avichal Rakesh and others had a very
>>>>> enlightening discussion at
>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/8741b7c=
b-54ec-410b-caf5-697f81e8ad64@google.com/T/__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXq=
h8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk7hFr_t5glBG2BYJlOYfFKEUpiH5H4gQ73n_-Y$
>>>>>
>>>>>
>>>>> The conclusion that we came to was : usb requests with actual uvc fra=
me
>>>>> data were missing their scheduled uframes in the usb controller. As a
>>>>> mitigation, we started sending 0 length usb requests when there was no
>>>>> uvc frame buffer available to get data from. Even with this mitigatio=
n,
>>>>> we are seeing glitches - albeit at a lower frequency.
>>>>>
>>>>> After some investigation, it is seen that we=E2=80=99re getting isoc =
errors when
>>>>> the worker thread serving video_pump() work items, doesn=E2=80=99t ge=
t scheduled
>>>>> for longer periods of time - than usual - in most cases > 6ms.
>>>>> This is close enough to the 8ms limit that we have when the number of=
 usb
>>>>> requests in the queue is 64 (since we have a 125us uframe period). In=
 order
>>>>> to tolerate the scheduling delays better, it helps to increase the nu=
mber of
>>>>> usb requests in the queue . In that case, we have more 0 length reque=
sts
>>>>> given to the udc driver - and as a result we can wait longer for uvc
>>>>> frames with valid data to get processed by video_pump(). I=E2=80=99m =
attaching a
>>>>> patch which lets one configure the upper bound on the number of usb
>>>>> requests allocated through configfs. Please let me know your thoughts.
>>>>> I can formalize=C2=A0 the patch if it looks okay.
>>>> Why do you want to limit the upper bound?  Why not just not submit so
>>>> many requests from userspace as you control that, right?
>>>
>>> Userspace negotiates a video frame rate (typically 30/60fps) with the h=
ost that does
>>> not necessarily correspond to the ISOC cadence. After the
>>> patch at https://urldefense.com/v3/__https://lkml.org/lkml/diff/2023/5/=
8/1115/1__;!!A4F2R9G_pg!e3zVZGt-6Td6HJXqh8GaZAsUeKyvKBhOoyru9qzn3Vkw01Vdkwk=
7hFr_t5glBG2BYJlOYfFKEUpiH5H4gWbb9bvy$  was submitted, we are
>>> maintaining back pressure on the usb controller even if we do not have =
uvc frame
>>> data, by sending the controller 0 length requests (as long as usb_reque=
sts are
>>> available). Also, even if the userspace application were to somehow pro=
duce
>>> data to match the ISOC rate, it would  need to have information about U=
SB
>>> timing details - which I am not sure is available to userspace or is th=
e right
>>> thing to do here ?
>>>
>>> Here, we are trying to handle the scenario in which the video_pump() wo=
rker
>>> thread does not get scheduled in time - by increasing the number of usb=
 requests
>>> allocated in the queue. This would send more usb requests to the usb co=
ntroller,
>>> when video_pump() does get scheduled - even if they're 0 length. This b=
uys
>>> the video_pump() worker thread scheduling time -since more usb requests
>>> are with the controller, subsequent requests sent will not be 'stale' a=
nd
>>> dropped by the usb controller.
>>>
>> I believe you're testing against dwc3 controller right? I may not be as
>> familiar with UVC function driver, but based on the previous
>> discussions, I think the driver should be able to handle this without
>> the user input.
>
>Yes we are testing against the dwc3 controller.
>
>>
>> The frequency of the request submission should not depend on the
>> video_pump() work thread since it can vary. The frequency of request
>> submission should match with the request completion. We know that
>> request completion rate should be fixed (1 uframe/request + when you
>> don't set no_interrupt). Base on this you can do your calculation on how
>> often you should set no_interrupt and how many requests you must submit.
>> You don't have to wait for the video_pump() to submit 0-length requests.
>>
>> The only variable here is the completion handler delay or system
>> latency, which should not be much and should be within your calculation.
>
>
>Thanks for the suggestion. It indeed makes sense that we do not completely=
 depend on
>video_pump() for sending 0 length requests. I was concerned about
>synchronization needed when we send requests to the dwc3 controller from
>different threads. I see that the dwc3 controller code does internally ser=
ialize
>queueing requests, can we expect this from other controllers as well ?
>
>This brings me to another question for Michael - I see
>that we introduced a worker thread for pumping  usb requests to the usb en=
dpoint
>in https://lore.kernel.org/all/20200427151614.10868-1-m.grzeschik@pengutro=
nix.de/
>(I see multiple email addresses, so apologies if I used the incorrect one).
>
>Did we introduce the worker thread to solve some specific deadlock scenari=
os ?

Exactly. This was the reason why we moved to the pump worker. I actually
looked into the host side implementation of the uvc driver. There we
also queue an worker from the complete function:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/media/usb/uvc/uvc_video.c#n1646

So this sounded reasonable to me. However we faced similar issues like
you and introduced different ways to improve the latency issue.

One thing we did was improving the latency by adding WQ_HIGHPRI

https://lore.kernel.org/linux-usb/20220907215818.2670097-1-m.grzeschik@peng=
utronix.de/

Another patch here is also adding WQ_CPU_INTENSIVE.

But, after all the input from Thinh it is probably better to solve the
issue in a more reliable way.

>Or was it a general mitigation against racy usb request submission from v4=
l2 buffer
>queuing, stream enable and the video complete handler firing ?

I don't remember all of the issues we saw back then. But this is also an ve=
ry
likely scenario.

>I was chatting with Avi about this, what if we submit requests to the endp=
oint
>only at two points in the streaming lifecycle -
>1) The whole 64 (or however many usb requests are allocated) when
>   uvcg_video_enable() is called - with 0 length usb_requests.
>2) In the video complete handler - if a video buffer is available, we enco=
de it
>   and submit it to the endpoint. If not, we send a 0 length request.

It really sounds like a good idea.

>This way we're really maintaining back pressure and sending requests as so=
on
>as we can to the dwc3 controller. Encoding is mostly memcpys from what I s=
ee
>so hopefully not too heavy on the interrupt handler. I will work on protot=
yping
>this meanwhile.

Great!

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--SVCP3qdL2nu0mKes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUv3ZMACgkQC+njFXoe
LGS6GBAAinn8GCkexSVxCre5g+nKJglzQZU8eFhaGoi67gkQ569mtjA8g2A6nxIY
jYMHqr4mqHlnTQRToWeQuMYx66DZ5IqtW58tgD5wQraqg30xamUXLknSirmTcjd3
OAK4QR4+uqarn6uJlZt2MzGsUtMbGmuORJQU9ZoxHqKgUqc6CtBluGNdipMrPEuR
E1P0U4V1jrBIic57j9TSu0GNJaycBTj7Fjq4mhcMsrZX3R2r+mAG/v2KofEuostT
ev+BW5gM2Fvs1lddTvuHpe6JETiI7nFKAkzaHSuqclU3IFveDAanyD9YrwM9R7S2
7LJIX8gmbi6gZ6leoXmbPupDqo9jj2OhF3Ier3epsd1UQUawQ32i7rkPeqOZ17Mr
0AvVy1Fniz1Gp8GPp79nf8tVs7aKvPMHgUTbevPxOcGPUBK6IkK4UgIajjsxRy5Q
OQ4IoBAvqqwafy9l5quG7SYGNU/qigeiDQiJcyAEwUIVOOpsZxx2Ef+i8DTWJzpr
IYR/pmvHTn+BlfMdwcYhJWbV4rEVwh3v9qbeGo0ixw1S9XQvtmI4lYtEdDDfszZp
cANh6o+/IjjU3R+HpdDbjAq+whoBXrK5hXSsNrr9+3+prfdWv9N09pc95TLHkt3n
Y0nBA58drEpcjr4rrM0CKINQOx8RB3UpuYsLuCvby806RHxj/Kg=
=iXRP
-----END PGP SIGNATURE-----

--SVCP3qdL2nu0mKes--

