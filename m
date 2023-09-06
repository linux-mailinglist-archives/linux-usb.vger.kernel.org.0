Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94803793614
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 09:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbjIFHSi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 03:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjIFHSh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 03:18:37 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EF8E50
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 00:18:30 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qdmo0-0004El-1U; Wed, 06 Sep 2023 09:18:28 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qdmny-007jWF-Vn; Wed, 06 Sep 2023 09:18:27 +0200
Date:   Wed, 6 Sep 2023 09:18:26 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Message-ID: <ZPgnwlOV1XP82kAY@pengutronix.de>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <20230906004144.4igr4akglxxqahc3@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DCe4yoaaYffnDjUC"
Content-Disposition: inline
In-Reply-To: <20230906004144.4igr4akglxxqahc3@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--DCe4yoaaYffnDjUC
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 06, 2023 at 12:41:58AM +0000, Thinh Nguyen wrote:
>On Mon, Sep 04, 2023, Michael Grzeschik wrote:
>> On Fri, Sep 01, 2023 at 01:35:16AM +0000, Thinh Nguyen wrote:
>> > On Fri, Sep 01, 2023, Michael Grzeschik wrote:
>> > > I just stumbled over a similar issue we already solved for the High
>> > > Speed Case when streaming ISOC packages and using a multiplier higher
>> > > then one. Last time we saw some bad frame artefacts when using the
>> > > higher multiplier value. The Frames were distorted due to truncated
>> > > transfers.
>> > >
>> > > Since the last case we have patch
>> > >
>> > > 8affe37c525d ("usb: dwc3: gadget: fix high speed multiplier setting")
>> > >
>> > > that fixes the calculation of the mult PCM1 parameter when using high
>> > > speed transfers. After that no truncations were reported again.
>> > >
>> > > However I came across a similar issue which is just a little less ea=
sy
>> > > to trigger and only occurs with Superspeed. Now, while the memory
>> > > bandwidth of the machine runs on higher load, the UVC frames are
>> > > similarly distorted when we use a multiplier higher then one.
>> > >
>> > > I looked over the implications the multiplier has on the Superspeed =
case
>> > > in the dwc3 gadget driver, but could only find some TXFIFO adjustmen=
ts
>> > > and no other extra bits e.g. in the transfer descriptors. Do you have
>> > > some pointers how the multiplier parameter of the endpoint is used in
>> > > hardware?
>> > >
>> >
>> > As you already know, PCM1 is only for highspeed not Superspeed. What
>> > failure did the dwc3 driver reported? Missed isoc? What's the request
>> > transfer size?
>>
>> Yes, I see missed isoc errors. But this is just a symptom in this case.
>>
>> I can increase the maxburst or maxpacket parameters stepwise and on
>> one point see the flickering appear. But when I increase the TXFIFOSIZE
>> for the endpoint the flickering is gone again. Until I increase one of
>> the parameters maxpacket or maxburst to much again.
>>
>> So due to the memory bandwidth is under pressure, it seems like the
>> hardware is not fast enough with sending the expected data per transfer,
>> due to the txfifo is not long enough and needs to be refilled more
>> often.
>>
>> This sounds like a fifo underrun issue in the hardware.
>>
>> I am currently looking into the fifo_resize device tree paramter,
>> and try to figure out how the calculation is done.
>>
>> From the software design point of view, having the fifo calculation
>> parameterized is a bad idea. We probably want to analyze how many
>> endpoints are going to be used in the active gadget config and use the
>> finite fifo length to calculate some fair parts for every ep
>> once and then never touch them again. Dynamic resizing should not be
>> necessary or do I overlook something?
>>
>> What do you think?
>
>There are multiple factors that impact the isoc performance:
>1) FIFO size
>	Typically the FIFO size is recommended to a minimum of the
>	output of dwc3_gadget_calc_tx_fifo_size(). For isoc, depending
>	on the request size, if it's 48KB/uframe, you probably need more
>	than the minimum. Each physical endpoint has a pre-configured TX
>	FIFO size. Without touching the FIFO reconfiguration parameter,
>	then the driver will just pick the first physical endpoint that
>	can be used, but it may not be the best fit for your purpose.

This has an effect but needs to be tweaked somehow.

>2) Burst setting
>	I think this is self-explainatory. Large data request needs
>	higher burst.

I will have to find out if the burst setting can be changed on the
rk3568 somehow. This sounds very likely.

>
>3) Internal cache size
>	The controller caches X number of TRBs every time you queue a
>	new request. If a request has a lot small TRBs, then it needs to
>	recache multiple times just to complete the request. Typically
>	the controller caches 8 or 16 TRBs. I notice that UVC uses SG to
>	split up the request to small SG entries base on logical parts
>	rather than for performance or hardware size contraints. So,
>	there can be improvements here.

In my particular case the issue is also seen when using the non_sg uvc
path and doing memcpy instead. So I for this usecase it may be the less
significant factor.

>4) Host bandwidth constraint
>	The host can limit the burst threshold and do less burst than
>	what the device is capable of due to the host's bandwidth
>	contraint. If there are other endpoint traffic on top of isoc
>	endpoint, then the host would have to reserve bandwidth for
>	other endpoints. Depending on the host controller
>	implementation, it may reserve more or less for isoc. Also, if
>	there are hubs or other devices in the topology, then it impacts
>	the bandwidth too.

The host has no other traffic going on other then the isoc uvc streaming.

>Base on your description, looks like modifying TX FIFO size impacts the
>most. We already have some properties to calculate and resize the TX
>FIFO size, did you try to see if it improves for you? (check
>dwc->do_fifo_resize).

First, thaks for the detailed explanation!

I already enabled do_fifo_resize but it did not have an effect. However
when I additionally set the second parameter from
dwc3_gadget_calc_tx_fifo_size in dwc3_gadget_resize_tx_fifos from 1 to 2
it improves the streaming. But it does only to another threshold.

In particular without the fifo increase it was only possible
to use maxburst of 2 and multilier of 2. With the increased txfifo
the it was possible to use maxburst of 4. My goal is an
multiplier of 2 and maxburst of at least 6. Otherwise streaming
of 4k mjpeg is not guaranteed.

>> > Perhaps you can capture some tracepoints of the problem?
>>
>> IMHO tracepoints are probably not necessary here anymore.
>>
>
>This helps to see how uvc setups the transfer and see what could impact
>the isoc transfers (for point 3 and 4 above). However, if just resizing
>the TX FIFO works for you, perhaps we can just focus into this.

Since 3 and 4 are currently not so significant I will focus on the
first two points.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--DCe4yoaaYffnDjUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmT4J8AACgkQC+njFXoe
LGSMSQ//dbmV+NcvC2MklQf6AA5okAUVd/4TvomYOsSHeUC/pyqWlUm7/ySbRL3z
VpZJqkRwdZxNa9OcX0oWOyIUlXM+zlNIA1nEwySyMmZBiUjFHEckc3YtXs7ebiTF
eak/jOzIscp4BnBnYljhLf0txZtzaEVu04B6wfbjp1Cvq5qMLY92nwdNbq5Q9He1
1YSZzhCMtWyY3pbOhBpwofpRLyUJ/hlbYx4WSPaOUryJYxEOODMPN2ygY3/VpTQz
PXyYFFBpfXycttK+kAvva1AoUoAphXNB3XwXOKrLv/DPFcJd6/Cd4fbn0prtymTa
z/rWyGBJ2hzxvRhXWESBdI07TSsQhFVTDeYmi9hFshmW7O/1IT2vTjHkbMF730s4
QbY36ek8iU64d3bIgBrzRD8Mz/WniaLRTaWC/ngAsMbauh9NgvaqMGtQfGDes1bo
Y3Ta3ZyZRc0dvpi8zYgQyxG8M0RsoOg2nH/U3f0zBXieezVbH1cG5s6lRooIaGfe
EcRVtE72K3IfTVDMpiV+KhjtjE5AbHAmIDFfHek/wy++M9WnGS7lt+v0sQoNH+QK
UvZoY4H+dEPF7LxDuh8vr6iralBDf/Fx4eqeMmIl+FdVDaA+APdzDA+Olxz9nDTg
cXb6xkjtGC8+qg/OKdtxRA4uQemjO08xrOn4/rKTcPfeoq2eKwc=
=gBjk
-----END PGP SIGNATURE-----

--DCe4yoaaYffnDjUC--
