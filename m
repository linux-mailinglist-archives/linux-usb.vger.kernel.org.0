Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7769FF23
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 12:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfH1KJ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 06:09:27 -0400
Received: from mga09.intel.com ([134.134.136.24]:45363 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726259AbfH1KJ1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 06:09:27 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 03:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; 
   d="asc'?scan'208";a="356067008"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga005.jf.intel.com with ESMTP; 28 Aug 2019 03:09:24 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Cc:     Guido Kiener <guido@kiener-muenchen.de>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb: gadget: net2280: Move all "ll" registers in one structure
In-Reply-To: <bc390967a9ac59e658ae79ba74a23a6ca898351b.camel@kernel.crashing.org>
References: <bc390967a9ac59e658ae79ba74a23a6ca898351b.camel@kernel.crashing.org>
Date:   Wed, 28 Aug 2019 13:09:20 +0300
Message-ID: <87ftllwqi7.fsf@gmail.com>
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

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:

> The split into multiple structures of the "ll" register bank is
> impractical. It makes it hard to add ll_lfps_timers_2 which is
> at offset 0x794, which is outside of the existing "lfps" structure
> and would require us to add yet another one.
>
> Instead, move all the "ll" registers into a single usb338x_ll_regs
> structure, and add ll_lfps_timers_2 while at it. It will be used
> in a subsequent patch.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

I tried applying your patches but it resulted in build break. Can you
collect all the dependencies and send a single series? I'm applying on
top of my testing/next branch.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1mUtAACgkQzL64meEa
mQZ/JBAAhgG3PsmT3w9Zjdbe0kBXKSyasrKZ1CFENDu512wMD8h0DGoPQE0p7H7o
E5ghBKEoTysyZKgztdMp0kPFmzbW2zS4zYwxA2IxwzAIKUfkSApYVmz6BIlCk+BB
LFfEQWkX1HWnL+/A2mBLQDJFnYVda0nURR2NWl58hw0ZnzWg4lE7DT9HlPTEqgrR
v+fdMA8PSNi8XVjh6jJqGF2AhwE0LCqDFEvq4ViQtXq2VldMzvrFC6pPJ4hbOy/2
S8QF8490G++IIvT5wumdiQR1qAwmsCeqUg61e+pCX15ZSh17GCBsdoemDCXnPOnk
Tk6vWxKu/IaX/kYb2biylCKllwte0bYk298teo75iMGNEtWgl5gqIjoY4QDKTwlc
sxA+fQBXwmbIZeFaHqWgT2eiH17yxO34AqYhh28VDybW+aDyJdziGeEh3AqK3Mr5
jl8G1swUT1HdOGdchvM2FflacdN4hWjWG2ncWW8f8sBBuHhcKvccJ0ncbst9MPQ6
0aGC8oOpNSgsNXn/92wuQ12Mxck5nvwowqGUOfIB51Ua+IBo7ysV0lxJGUfce+cQ
UCd3R1avICNTVYVqTz70wqJnSjqLHEmZfQ7O9qo+SyoGRMijdTU34byz05URIpok
4QjzYUMTGsWXmJQAPZg6p26PBl0Zs1VVJELciciECosjUWUx1js=
=qMXv
-----END PGP SIGNATURE-----
--=-=-=--
