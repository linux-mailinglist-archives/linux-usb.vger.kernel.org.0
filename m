Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FD33B25C
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 11:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388960AbfFJJnr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 05:43:47 -0400
Received: from mga09.intel.com ([134.134.136.24]:4284 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387977AbfFJJnq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 05:43:46 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 02:43:46 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2019 02:43:44 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "leoyang.li\@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: fsl_udc status?
In-Reply-To: <9171a0e63bebaa0efaec64838f9a1c6982fc33e8.camel@infinera.com>
References: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com> <87v9xdc1ra.fsf@linux.intel.com> <9171a0e63bebaa0efaec64838f9a1c6982fc33e8.camel@infinera.com>
Date:   Mon, 10 Jun 2019 12:43:40 +0300
Message-ID: <87pnnlbws3.fsf@linux.intel.com>
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

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:

> On Mon, 2019-06-10 at 10:56 +0300, Felipe Balbi wrote:
>> Hi,
>>=20
>> Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:
>> > We are trying to get fsl_udc up and running on a T1042 with without su=
ccess.
>> > Seems like this driver is lagging behind the corresponding host driver=
(mph).
>> > The mph driver has a number of USB errata workarounds while udc has no=
ne.
>> > At least erratas A007792 seems applicable for udc too.
>> >
>> > Is the fsl_udc driver functional on 4.14.x(which we use)? What is miss=
ing ?
>>=20
>> If you're on v4.14, then you need to ask for support from whoever gave
>> you that kernel. In this forum we treat mainline only, which currently
>> is at v5.2-rc4. Unless you can try that version of the kernel, we can't
>> really help you here.
>
> None gave me that kernel, it is the stable 4.14.x tree that Greg maintain=
s, I would
> assume that this forum has some support for stable kernels too?
>
> Looking at upstream, there has not been any significant change in this
> area for a long time.

In that case, I'll let Li Yang reply.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlz+JkwACgkQzL64meEa
mQZLdw/+MQBaOTrG1GoWH8FhrE11HhbZjM/bySWX/UlkIRjs6rLI0ynFNQx/Pc1Y
R4cxVKs1URdlAcsT53jC6F52do2oBcKKBfQcYfs1TmzLMAc7TPhCBCv7bkUirgNL
leXq54UQARDd4hBmvMqlyyTGixlj34LaUnq2KOH3pmx4AC/0O6e5JcRxMVbbLs0N
kBnfpWleIJXlVS08xLupTc8mwjCHeMTLMQlYPE6UZr3ms1c+gfFxDaDP4uU4iWtM
C8DrStNTZzMD5LLU63zW06jRinNPNrDzKdrVTmkk2TETKYy2gfJ0vuPHOhei1f3d
vYj0E/l393H23Zqznc02YKCqP68/UU0TjpTfUxlhsUlSLiGPCzmYkn4aBA/zq8q0
aOO+sN2A/A3D4M3tXtdKrBzwVuRLGcaYeWPMxaf+u17/IVbQIzzSDLj1fzyILdsB
Q4Hl4riwtv5Ir2dlM34URcOqE3N7N39v1PsbKUCwygaHF/+fG7vjndhImWfT1AIR
n5MrK30MYHhnTx48NnyjCMFF5F4C+jMFnvUD5Q7Ws5RDxph8td/cnkuTVJ8vUK/5
QnOJniLMKUm56hxv6P6nO/El+lcUIg6yqx2qdVltpm+f33nKd/DM0Kh9l7S1PF34
MZ03+HuidytXTQ6VhjvtGuQcNpgQ+9A9z969rso6IBajX+uFkoA=
=c4/f
-----END PGP SIGNATURE-----
--=-=-=--
