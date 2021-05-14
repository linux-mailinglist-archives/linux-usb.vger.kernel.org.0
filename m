Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2F438040F
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 09:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhENHRs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 03:17:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230247AbhENHRq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 03:17:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7105F6140F;
        Fri, 14 May 2021 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620976595;
        bh=MzazHLjch1bm1m1vJBFRRaeL/5/xTApgB1VZulym1os=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=BerNZUG5dkpwYCIopF5QkBtBQ0m1mLfDujpDDtdlwloP8jpzqt3R17eo++HD0Qofh
         ZnuWtgUcndvH5KUzD9mkMlN7uESoiIGT6AlGYKqiTpJETENdtMF9iE0m0uP73c67yL
         wVHWhUTCndGQNNWNOOZOIg37d+4Aa3TOZR9D76RpZlHB9gwKNBHkjm9SQofRuzTSPg
         5pnBBwtf5iAQFawRIHCo3Oq2vrCfOBJPhP48CXCUj9MMKPhhW1tuMnTj4OhZdz+qtQ
         jB2yFs2rrUYNMDr3oXGjwVsXogNuGx7lQnLUiwvMVEYLnVPn2xqSH+CvuSML0ads5d
         EfH3Ag4SyhNyQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     "Chow, Watson" <Watson.Chow@Avnet.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
In-Reply-To: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
References: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
Date:   Fri, 14 May 2021 10:16:27 +0300
Message-ID: <87r1i97pkk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Watson,

(please teach your mailer to break lines at 80 columns)

"Chow, Watson" <Watson.Chow@Avnet.com> writes:
> Hi,
>
> I'm using the SoC (Xilinx MPSoC) with DWC3 USB controller. I need to
> emulate my hardware to work like a USB camera and so make use of the
> USB UVC gadget driver - g_webcam.

which Kernel version are you running?

> Refer to this link and the driver source code, I find 3 parameters to
> configure the ISOC transfer bandwidth.
>
> https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/transfer=
-data-to-isochronous-endpoints#isochronous-transfer-example
>
> They are:
>
> streaming_maxpacket : range [1 - 3072]=20
> streaming_maxburst : range [0 - 15]
> streaming_interval : [1 - 16]
>
> So, I load the driver in this way
>
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D9 str=
eaming_interval=3D2
>
> Create my own app base on
> https://github.com/wlhe/uvc-gadget
>
> Test result
>
> In my evaluation, I can set the combination of parameters up to
> this. The streaming is ok.
>
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D9 str=
eaming_interval=3D2

streaming_maxburst=3D15 should work here too.

> This should be around 900Mbit/sec. Far less than 5Gbps bandwidth of
> USB3.0

IIRC Isoc endpoints can't take the full bus bandwidth, I don't remember
the exact limit but I think it's 80% of full bandwidth. Still, that
should be around 4Gbit/sec

> When I increase the parameter combination to:
> # modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D10 st=
reaming_interval=3D2
>
> I get the below error message and everything stop.
>
> [ 1089.751559] g_webcam gadget: uvc: VS request completed with status -18.

> 1. This error is somehow related to the underflow of the transfer
> queue. Is my understanding correct?

that means the controller lost an isoc interval. There is still
discussion going on regarding isoc intervals in dwc3. It turns out the
HW doesn't make scheduling super easy for SW :-)

> If so, how to solve?
> 2.	My goal is to utilize the full bandwidth of USB3.0. How can I achive?
>
> [Some background information and my test setup]
>
> I started from the Xilinx TRD here.
>
> https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/541786361/Zynq+Ultr=
aScale+MPSoC+VCU+TRD+2020.1+-+Xilinx+Low+Latency+PS+DDR+NV12+HDMI+Audio+Vid=
eo+Capture+and+Display
>
> With kernel version v5.4:
> https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v5.4_2020.2

v5.4 is super old, please test with v5.12 or the latest v5.13-rc. Also,
when reporting dwc3 bugs, make sure to include regdump and trace events
as described in dwc3 documentation

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCeI8sRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhP6wf/VUtG7XzVRvRmJCfQeSxzHDqic9lLj/yl
0ej/SzoKRKKV40IETMX/936G75mwr0grpOSno03cPlvLt61cHLOiWaRIgurJQEFb
YAdhlicT6GIEbP+v6UhZqTZoV+auBkg2TGUQoHdCWCFSMdLTUfTIKCbmf2BTTg4X
0dY/d7aqnwqoFFOkIt2Z7uX7T9HdYGNjCCKp/2NytbA1CiJAguw5ki+9XEWbX76W
3lO0Jo8pjAeOiizuhym4cCKvASQ1GsoVtbz3QyqdvjGe9LM6ydVx4Kod8a7R35BC
iHsLZGsQDeB8OMn3WlBpMVNe+qWA21DhMyHCAwM+8XJgp4f0sl/R+Q==
=ni+v
-----END PGP SIGNATURE-----
--=-=-=--
