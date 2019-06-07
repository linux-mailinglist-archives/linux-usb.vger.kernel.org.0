Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACAEE38A26
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 14:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfFGMZe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 08:25:34 -0400
Received: from mga11.intel.com ([192.55.52.93]:11336 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727693AbfFGMZd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 08:25:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2019 05:25:33 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2019 05:25:31 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <CAAeHK+xG7-U7kWp1uTT2oA1-Krr2iw8SGnzrciw+0kuLr1qsYA@mail.gmail.com>
References: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com> <877e9xd2nx.fsf@linux.intel.com> <CAAeHK+xG7-U7kWp1uTT2oA1-Krr2iw8SGnzrciw+0kuLr1qsYA@mail.gmail.com>
Date:   Fri, 07 Jun 2019 15:25:28 +0300
Message-ID: <874l51d1l3.fsf@linux.intel.com>
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
>> Andrey Konovalov <andreyknvl@google.com> writes:
>> > I've noticed that when the host performs a control request,
>> > urb->transfer_buffer/transfer_buffer_length are not passed to the
>> > gadget drivers via the setup() call, the only thing that is passed is
>> > the usb_ctrlrequest struct. Is there a way to get the transfer_buffer
>> > from within a gadget driver? If not, what approach would the best to
>> > implement this?
>>
>> I think you need to further explain what you mean here.
>>
>> What do you mean by gadget driver in this case?
>>
>> If you mean the drivers under drivers/usb/gadget/{function,legacy}
>> directories then there's no way that they can have access to anything
>> from the host.
>>
>> Remember that gadget and host are two completely distinct units. The
>> only thing they share is a USB cable. When it comes to Control
>> Transfers, if a data stage is necessary, that must be encoded in the
>> wLength field of the control structure.
>>
>> Also, host side does *not* pass its usb_ctrlrequest struct to the
>> gadget, it passes a series of 8 bytes which are oblivious to where in
>> memory they were from the host point of view.
>>
>> If if you have the same machine acting as both host and device, each
>> side has no knowledge of that fact.
>
> Hi Felipe,
>
> What I meant is that any module (gadget driver) that implements
> usb_gadget_driver struct callbacks and registers it, will only get
> usb_ctrlrequest through the setup() callback, but not the
> transfer_buffer/length.

A control request is *always* 8 bytes. That's mandated by the USB
specification.

> And therefore it can't access the data that is
> attached to a control request.

There is no data attached to a control request. A Control Transfer is
composed of 2 or 3 stages:

=2D SETUP stage
	an 8 byte transfer descriptor type thing

=2D (optional) Data stage
	if wLength of control request contains a value > 0, then this
	stage fires up to transfer the amount of data communicated in
	wLength (during previous stage).

=2D Status Stage
	A zero length transfer to communicate successful end of transfer
	(in case it completes fine) or an error (in case of STALL
	condition).

> I've faced this with a custom implementation of a gadget driver module
> while using the dummy_hcd module, but I AFAIU it's not relevant to
> those two, but rather to the whole gadget subsystem.

What is this custom gadget doing? Which kernel version are you using?
What error are you facing? Could it be that you misunderstood how USB
works?

Best regards

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlz6V7gACgkQzL64meEa
mQaaOg//duRD2hUgQoVOn2spKqB5JZdo9R31mjrZFhak8vQ4j1xIhjy3cyvsLmgG
5QgA+jOTLeDEnRRufuxZWw0tDG0JeF5gUv4vfDlFflqslJ6riWD21nLT71oPARyL
XOl11YExdZatAMFoj3ShFO0iXUgjepAu6MM/DVcgG5wveA3dy5yIk8gLm0+gCF8p
UGCT2dOg5kHOhDGlz0s5iIPOeAcOChHrNneEtqQHrE8O0j8ysUb6octzP178lIdJ
pzEJFWiFGEzHOwFW+hPxUAAERo57yenAzOqdJzw83czwRRA4ZxumdvEqAr/LkUWI
pZeTmtSukbB3u9+rS4ZFHmnmT544US+PQbC0UmOdGstp5o5/xJixfzuWmFj7TLTl
vPtziQmUI8z1/LVeNJWkKVHf/+oyLpp4xv27V3H9rerkiQRAWzjt9zDVxpvObxbj
mHZROy+iTVz3+qVkd4WomK1sRof/v9/HUjoP+XqYwWtvl7OF/tPpUaTjfayXXMe5
6OSAAleThZtutXYFjSm7NHsvWQ7jnhLoWjrD8RUvZ4hOC2F2epFyRqXrpE0PnWP5
Ot9M3Y+IWzYLNfonGr+u+1WlVvYJX+/U9Cy2w0g6Eveh4gFsp/qi219RHAhcUqWW
gjWZrDuoBHWzWGWLPRLGLftVQPWR5wzWODi2oN6M0xCEKgvOuD8=
=TTLE
-----END PGP SIGNATURE-----
--=-=-=--
