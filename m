Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A335790F22
	for <lists+linux-usb@lfdr.de>; Mon,  4 Sep 2023 00:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbjICW7h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Sep 2023 18:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjICW7h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Sep 2023 18:59:37 -0400
X-Greylist: delayed 1076 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 03 Sep 2023 15:59:33 PDT
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E6398
        for <linux-usb@vger.kernel.org>; Sun,  3 Sep 2023 15:59:33 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qcvmg-0005eM-SO; Mon, 04 Sep 2023 00:41:35 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qcvmf-003AKz-OH; Mon, 04 Sep 2023 00:41:33 +0200
Date:   Mon, 4 Sep 2023 00:41:33 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Message-ID: <ZPULnRSVgd5S3Cao@pengutronix.de>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1sQgAEp/XFncW4Fk"
Content-Disposition: inline
In-Reply-To: <20230901013118.iqpegkklfswdkoqc@synopsys.com>
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


--1sQgAEp/XFncW4Fk
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thinh

On Fri, Sep 01, 2023 at 01:35:16AM +0000, Thinh Nguyen wrote:
>On Fri, Sep 01, 2023, Michael Grzeschik wrote:
>> I just stumbled over a similar issue we already solved for the High
>> Speed Case when streaming ISOC packages and using a multiplier higher
>> then one. Last time we saw some bad frame artefacts when using the
>> higher multiplier value. The Frames were distorted due to truncated
>> transfers.
>>
>> Since the last case we have patch
>>
>> 8affe37c525d ("usb: dwc3: gadget: fix high speed multiplier setting")
>>
>> that fixes the calculation of the mult PCM1 parameter when using high
>> speed transfers. After that no truncations were reported again.
>>
>> However I came across a similar issue which is just a little less easy
>> to trigger and only occurs with Superspeed. Now, while the memory
>> bandwidth of the machine runs on higher load, the UVC frames are
>> similarly distorted when we use a multiplier higher then one.
>>
>> I looked over the implications the multiplier has on the Superspeed case
>> in the dwc3 gadget driver, but could only find some TXFIFO adjustments
>> and no other extra bits e.g. in the transfer descriptors. Do you have
>> some pointers how the multiplier parameter of the endpoint is used in
>> hardware?
>>
>
>As you already know, PCM1 is only for highspeed not Superspeed. What
>failure did the dwc3 driver reported? Missed isoc? What's the request
>transfer size?

Yes, I see missed isoc errors. But this is just a symptom in this case.

I can increase the maxburst or maxpacket parameters stepwise and on
one point see the flickering appear. But when I increase the TXFIFOSIZE
for the endpoint the flickering is gone again. Until I increase one of
the parameters maxpacket or maxburst to much again.

So due to the memory bandwidth is under pressure, it seems like the
hardware is not fast enough with sending the expected data per transfer,
due to the txfifo is not long enough and needs to be refilled more
often.

This sounds like a fifo underrun issue in the hardware.

I am currently looking into the fifo_resize device tree paramter,
and try to figure out how the calculation is done.

 From the software design point of view, having the fifo calculation
parameterized is a bad idea. We probably want to analyze how many
endpoints are going to be used in the active gadget config and use the
finite fifo length to calculate some fair parts for every ep
once and then never touch them again. Dynamic resizing should not be
necessary or do I overlook something?

What do you think?

>Perhaps you can capture some tracepoints of the problem?

IMHO tracepoints are probably not necessary here anymore.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--1sQgAEp/XFncW4Fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmT1C5oACgkQC+njFXoe
LGRMuw/9Faky0UQ+62g8qUT4cmhcWJTlaDA791oUQYeAU4vXWsFK8ZiA8O62M5Ig
+1NWFW0ReBIibZFHo5wizKPuTE9o+TLXMMolPGPwmSZmsuUZT3rIwxQXn1N8vb8c
0S7j+TocRtfDA5QVcq2mDya7kVNW9FZNj8nwRHPNg533sKb/9FU4GJoc/mhU48wU
R3PLn7LdzhZEdfj4IbCrktz3C4KHAljBV9VT/GW+5Vxk5q8VgoN0crjmGhxE6xZF
U9wtzjA8y6+/O81B1XPfLlObMn4YaGAKYXznTF0gs/RnJ2yZ+jEQE6H/uTxGEGxx
YdMoNniLdl1wgRTT6Lf64Ft2mzX843JbD3Jz/4ikRg+xQkCuE6biRgbEDRMejYBw
mSl0g3u5A2xnqA9lW5pn0+/Xk76XYs7DVrMGkqlWxf+LD+hRo0bulT8AV2evctR6
fFeywBjSX8gPorVGJO3kqsT9zB5y81Q7zfD75IPdtI52Tlfo1gmIqfh/o4j9OFbp
Fz1mFXva8hBajgmMlanYytDrxvy7LPd5Gha7d7DosYocwQD1cZusDNoSDtkrfSsE
xqg8llL7YPgWXpPFiQTLYIQKpFj4IBaLchGsuuVMByZhiKTTIFCKqnm4Br8ZCnib
+VooHLfyE3y4K+nxlz5j/MBrbnMMakWRIbZro6CWkvNmBWwck8w=
=fWQY
-----END PGP SIGNATURE-----

--1sQgAEp/XFncW4Fk--
