Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4BAE49A80
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 09:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfFRH0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 03:26:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:5897 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfFRH0I (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 03:26:08 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 00:26:08 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jun 2019 00:26:05 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Jules Maselbas <jmaselbas@kalray.eu>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc2: Use generic PHY width in params setup
In-Reply-To: <0c370ba7-bb45-7580-1a60-021f15c1c37d@samsung.com>
References: <20190507100852.11263-2-jmaselbas@kalray.eu> <20190509091528.28397-1-jmaselbas@kalray.eu> <CGME20190531124510epcas2p1f261a838b299f3f99b521760872de32b@epcas2p1.samsung.com> <1d774b88-b176-448d-3e8b-8c1f04cb1406@synopsys.com> <0c370ba7-bb45-7580-1a60-021f15c1c37d@samsung.com>
Date:   Tue, 18 Jun 2019 10:26:01 +0300
Message-ID: <877e9jgxrq.fsf@linux.intel.com>
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

Marek Szyprowski <m.szyprowski@samsung.com> writes:
> Hi All,
>
> On 2019-05-31 14:44, Minas Harutyunyan wrote:
>> On 5/9/2019 1:16 PM, Jules Maselbas wrote:
>>> Setting params.phy_utmi_width in dwc2_lowlevel_hw_init() is pointless=20
>>> since
>>> it's value will be overwritten by dwc2_init_params().
>>>
>>> This change make sure to take in account the generic PHY width=20
>>> information
>>> during paraminitialisation, done in dwc2_set_param_phy_utmi_width().
>>>
>>> By doing so, the phy_utmi_width params can still be overrided by
>>> devicetree specific params and will also be checked against hardware
>>> capabilities.
>>>
>>> Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with=20
>>> phy_utmi_width")
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
>>
>> Acked-by: Minas Harutyunyan <hminas@synopsys.com>
>
> Gentle reminder, Felipe, could you take this to the fixes for v5.2?

darn it, I applied for 'next'. I'll remove from that branch and place it
in fixes. Pull request, hopefully, tomorrow.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0IkgkACgkQzL64meEa
mQaEtg//QHm4ABfRpJhlDPAML92Bajj+u02j2orJsp2hzlEGET6nU7lgveiiTSRv
Z4276cKHr+9/dCASCQg/SbDRKk3WRsnw810BazUylyw7JhQfMpfoLZy2Div/ydI3
pyrvoppbk4LW75Qgz/9ACj3oWjChI0j2/8Y+cbQkV556B/NlZyBjIxKNLqDj1FfQ
5APqX7jSSsYS7XtaMhewjRewrICOO9+JEkj7PVkPngFHApi39KQPvIUu7IBG0DH8
/9krXa7JBUjiSdQZk+cbo5h8CGhk7iUV6iPl5DDt2WQe1V9LQt14mIVePLbwLOtR
PougVrG1Q6z0xrK+ZcBpf/M+Gq5Kg4KN0viVBTsgTeZjCHW0EPcS1T2xPbYOtvo2
Yw6s7M86TPDyIZrhSsCBfOI9Yk1djzuj2btviGVSFtsBwIJsr8U6AwSDGGMdF9Ak
Jhwk0viAxAgWE/YdPa9WNGAIjmSCBgxXOmCKnrPX6+UDQTthqpRni+nZOK9jcZ72
pjv8YY08NC8nO3ihkGJODTSDr7D3OtsO7Bgm1d/8cU2EItlQ22kIjVMmmdzu2i7b
YF7in25lc2W5GLIpBDIxAZ1ME+3uFNAVu2U820dgj0Ajb3p/v4GBUzboCUG6BFYw
Zkzo1Epj/NxT6hUcq/obFEeO1D77Uo59hXl/A38e4hY7RKuuXkE=
=g3cO
-----END PGP SIGNATURE-----
--=-=-=--
