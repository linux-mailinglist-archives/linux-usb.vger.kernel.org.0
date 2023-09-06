Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26BC5793570
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 08:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241712AbjIFGkV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 02:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbjIFGkU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 02:40:20 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40651CF6
        for <linux-usb@vger.kernel.org>; Tue,  5 Sep 2023 23:40:16 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qdmCz-0001Yk-Em; Wed, 06 Sep 2023 08:40:14 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qdmCx-007itl-L6; Wed, 06 Sep 2023 08:40:11 +0200
Date:   Wed, 6 Sep 2023 08:40:11 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "stanley_chang@realtek.com" <stanley_chang@realtek.com>
Message-ID: <ZPgey9fp6Xst/9da@pengutronix.de>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <ZPUn5H0L/M7aBTZI@pengutronix.de>
 <20230906004353.ksxjazs4iaejnynk@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H+AKR3XIgRXG4yhU"
Content-Disposition: inline
In-Reply-To: <20230906004353.ksxjazs4iaejnynk@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--H+AKR3XIgRXG4yhU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 12:44:02AM +0000, Thinh Nguyen wrote:
>On Mon, Sep 04, 2023, Michael Grzeschik wrote:
>> Cc'ing: Stanley Chang <stanley_chang@realtek.com>
>>
>> On Mon, Sep 04, 2023 at 12:41:33AM +0200, Michael Grzeschik wrote:
>> > Hi Thinh
>> >
>> > On Fri, Sep 01, 2023 at 01:35:16AM +0000, Thinh Nguyen wrote:
>> > > On Fri, Sep 01, 2023, Michael Grzeschik wrote:
>> > > > I just stumbled over a similar issue we already solved for the High
>> > > > Speed Case when streaming ISOC packages and using a multiplier hig=
her
>> > > > then one. Last time we saw some bad frame artefacts when using the
>> > > > higher multiplier value. The Frames were distorted due to truncated
>> > > > transfers.
>> > > >
>> > > > Since the last case we have patch
>> > > >
>> > > > 8affe37c525d ("usb: dwc3: gadget: fix high speed multiplier settin=
g")
>> > > >
>> > > > that fixes the calculation of the mult PCM1 parameter when using h=
igh
>> > > > speed transfers. After that no truncations were reported again.
>> > > >
>> > > > However I came across a similar issue which is just a little less =
easy
>> > > > to trigger and only occurs with Superspeed. Now, while the memory
>> > > > bandwidth of the machine runs on higher load, the UVC frames are
>> > > > similarly distorted when we use a multiplier higher then one.
>> > > >
>> > > > I looked over the implications the multiplier has on the Superspee=
d case
>> > > > in the dwc3 gadget driver, but could only find some TXFIFO adjustm=
ents
>> > > > and no other extra bits e.g. in the transfer descriptors. Do you h=
ave
>> > > > some pointers how the multiplier parameter of the endpoint is used=
 in
>> > > > hardware?
>> > > >
>> > >
>> > > As you already know, PCM1 is only for highspeed not Superspeed. What
>> > > failure did the dwc3 driver reported? Missed isoc? What's the request
>> > > transfer size?
>> >
>> > Yes, I see missed isoc errors. But this is just a symptom in this case.
>> >
>> > I can increase the maxburst or maxpacket parameters stepwise and on
>> > one point see the flickering appear. But when I increase the TXFIFOSIZE
>> > for the endpoint the flickering is gone again. Until I increase one of
>> > the parameters maxpacket or maxburst to much again.
>> >
>> > So due to the memory bandwidth is under pressure, it seems like the
>> > hardware is not fast enough with sending the expected data per transfe=
r,
>> > due to the txfifo is not long enough and needs to be refilled more
>> > often.
>> >
>> > This sounds like a fifo underrun issue in the hardware.
>>
>> This whole issue sound like a case of stanleys patches:
>>
>> https://lore.kernel.org/all/20230828055212.5600-1-stanley_chang@realtek.=
com/
>>
>> For now I was unluky while adjusting the paramaters. Are those registers
>> anywhere documented?
>>
>
>How does his change impact isoc endpoint? His change should only affect
>non-periodic endpoint. Also periodic settings is only for host.

Since I did not find proper documentation of the registers I was just hopin=
g.

In the device-tree documentation stanley added he mentioned some device
mode properties. As I look again it seems the RXFIFO parameters are
the only one affecting device mode. So nevermind.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--H+AKR3XIgRXG4yhU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmT4HsgACgkQC+njFXoe
LGSRFhAAmpWNC6VOgFhiaeDojbJOVnTkqtz9yZa2GeZOLj/9Rd7dc1gLvHILsPAc
67oMo1YdYZprYVRK0CAOu8zXCfj9aK3mwxQf7pbw3MLvbWWFoBvxLSouT/QRDcQR
S/+8uqnP10Bl0/Yi7B9TY0cE/oUugOa/d+vhneodzIigX1lv05VSwEgWZsTzciwl
fDiA0QditkgdhsYN27vt2dhPDO+x9qWtSDpM/znCe73cxHFrhVTpwZHZj6XkKMa7
ubGPQHGAY9qQR4Zi40Rrsa0PBug8EbRUgHZ6S883SmS8Zgc2JhYrQ9IKfSxLmQny
RafbCLEn9zy6AgN56YWII1Smv2iO8Ue6xEuGt//pr5an46/WCzSGDb9GCNQ4cgjg
eVna/Y8RkCUUI2XHoXVAudJLu0JLls9NIBkM2tBx5WMFU6vaFH6666TDAIuwpOtX
PSmiQ/X75C09c7GqHvi/5sI0QXZ+JKzFzkZn0RXjchkoxAQmJwCzP+JN9CcIp2Dr
m5I6zlUdhOl4bV73sCKxN/bQYJCRCKAnZwbwpx/lOJE5dYF6EPnhnSZkznpRfCGv
QGCnDl1H0zGOgL4Fj+EsrggzqpTTuWOylw+yT0efujI1vFtjgvimxyCyR39ngGQE
m0JQJlSzK0Cjrg26pI877EwrkK40RdiHAHhPvjfF9Z3J3O/LGDQ=
=N3iB
-----END PGP SIGNATURE-----

--H+AKR3XIgRXG4yhU--
