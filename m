Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 542FC38998
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 14:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfFGMCR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 08:02:17 -0400
Received: from mga04.intel.com ([192.55.52.120]:46698 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727388AbfFGMCR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 08:02:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2019 05:02:16 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2019 05:02:14 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com>
References: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com>
Date:   Fri, 07 Jun 2019 15:02:10 +0300
Message-ID: <877e9xd2nx.fsf@linux.intel.com>
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

Andrey Konovalov <andreyknvl@google.com> writes:
> I've noticed that when the host performs a control request,
> urb->transfer_buffer/transfer_buffer_length are not passed to the
> gadget drivers via the setup() call, the only thing that is passed is
> the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
> from within a gadget driver? If not, what approach would the best to
> implement this?

I think you need to further explain what you mean here.

What do you mean by gadget driver in this case?

If you mean the drivers under drivers/usb/gadget/{function,legacy}
directories then there's no way that they can have access to anything
from the host.

Remember that gadget and host are two completely distinct units. The
only thing they share is a USB cable. When it comes to Control
Transfers, if a data stage is necessary, that must be encoded in the
wLength field of the control structure.

Also, host side does *not* pass its usb_ctrlrequest struct to the
gadget, it passes a series of 8 bytes which are oblivious to where in
memory they were from the host point of view.

If if you have the same machine acting as both host and device, each
side has no knowledge of that fact.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlz6UkIACgkQzL64meEa
mQbiHhAAxZ4dru2uQnqYtP3r+fmUJdH4lsEmrE4ea76I3OuMxxCKoLdzYqefuKbg
si3FWLNvCFWV5iLz9/md6TUswXecI3Xi6kdceX83EPRD5/wxvCSNMeB2mX0bDI4T
29uAJLbQJpoVC3OZzxsygryHbOgwvjlbvMgidGtw43XbF8hOoAELocQy5cif9fwE
Wh0cP4DPwpvcf+648As7J6CiqwNJUD8MeKXB/O20xhG9zVIGrlRdy1WtwmR9v2Qv
CNpWGKcHkodwVT3PCRCJ8488qbMvINbj2MnVnx/cJSi6pIE8vhvLubi0t+9Lf8dm
eGIIaKziJeyK/XErZH9wb5djo8kjVg6RkmgI7cCqY7RFKlILbgaFcBrwPI5iedrB
5jJvMLfrHnfYpp4MfOb3+mrnvJr1jIuU46wXt6sl3Ap51Wf1egQGlai9y3GEfN99
TsZ9zEfQWtmfUYabecgPd7NNUX9FfK+6veny9n2cZwSaPpq7IkHfdK4GN9aQako+
TAlLrlfU340n5lUn066YbY2zm0WTOWXyu7rq66EERN2Xk8BzmZD4PM2ADEasi1nW
uphRL7t9HG26kTYNT/Tx7l9v99/yJ9qN9kZJYgLeJ8nT0PEuAFvQUTznxB0NbMCv
WlGs+bmsxmW94F7t1j8qXvGh8bGfLSkFwhN19RZfE/26KF2cQP4=
=tzej
-----END PGP SIGNATURE-----
--=-=-=--
