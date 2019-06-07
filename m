Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C014D38A85
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 14:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbfFGMnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 08:43:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:41360 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727450AbfFGMnW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 08:43:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2019 05:43:21 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga006.jf.intel.com with ESMTP; 07 Jun 2019 05:43:19 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Pass transfer_buffer to gadget drivers
In-Reply-To: <CAAeHK+x-6Xgefkj1279rSGru4u6jSkZ6Tm_3h9eeqzJ6xUnfgA@mail.gmail.com>
References: <CAAeHK+xRHB28N_VUbcCit=81+wKK=A9X3aA4rTa9aShy7b2Bnw@mail.gmail.com> <877e9xd2nx.fsf@linux.intel.com> <CAAeHK+xG7-U7kWp1uTT2oA1-Krr2iw8SGnzrciw+0kuLr1qsYA@mail.gmail.com> <874l51d1l3.fsf@linux.intel.com> <CAAeHK+x-6Xgefkj1279rSGru4u6jSkZ6Tm_3h9eeqzJ6xUnfgA@mail.gmail.com>
Date:   Fri, 07 Jun 2019 15:43:15 +0300
Message-ID: <871s05d0rg.fsf@linux.intel.com>
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
>> >> Andrey Konovalov <andreyknvl@google.com> writes:
>> >> > I've noticed that when the host performs a control request,
>> >> > urb->transfer_buffer/transfer_buffer_length are not passed to the
>> >> > gadget drivers via the setup() call, the only thing that is passed =
is
>> >> > the usb_ctrlrequest struct. Is there a way to get the transfer_buff=
er
>> >> > from within a gadget driver? If not, what approach would the best to
>> >> > implement this?
>> >>
>> >> I think you need to further explain what you mean here.
>> >>
>> >> What do you mean by gadget driver in this case?
>> >>
>> >> If you mean the drivers under drivers/usb/gadget/{function,legacy}
>> >> directories then there's no way that they can have access to anything
>> >> from the host.
>> >>
>> >> Remember that gadget and host are two completely distinct units. The
>> >> only thing they share is a USB cable. When it comes to Control
>> >> Transfers, if a data stage is necessary, that must be encoded in the
>> >> wLength field of the control structure.
>> >>
>> >> Also, host side does *not* pass its usb_ctrlrequest struct to the
>> >> gadget, it passes a series of 8 bytes which are oblivious to where in
>> >> memory they were from the host point of view.
>> >>
>> >> If if you have the same machine acting as both host and device, each
>> >> side has no knowledge of that fact.
>> >
>> > Hi Felipe,
>> >
>> > What I meant is that any module (gadget driver) that implements
>> > usb_gadget_driver struct callbacks and registers it, will only get
>> > usb_ctrlrequest through the setup() callback, but not the
>> > transfer_buffer/length.
>>
>> A control request is *always* 8 bytes. That's mandated by the USB
>> specification.
>>
>> > And therefore it can't access the data that is
>> > attached to a control request.
>>
>> There is no data attached to a control request. A Control Transfer is
>> composed of 2 or 3 stages:
>>
>> - SETUP stage
>>         an 8 byte transfer descriptor type thing
>>
>> - (optional) Data stage
>>         if wLength of control request contains a value > 0, then this
>>         stage fires up to transfer the amount of data communicated in
>>         wLength (during previous stage).
>>
>> - Status Stage
>>         A zero length transfer to communicate successful end of transfer
>>         (in case it completes fine) or an error (in case of STALL
>>         condition).
>
> Hm, then why does the usb_control_msg() function accepts a data and
> size arguments? Which are described in the comment as "pointer to the
> data to send" and "length in bytes of the data to send" accordingly?
> Or is this the buffer for the response?

That's for the data stage :-)

usb_control_msg() is an upper lever API to encode and entire Control
Transfer (all stages of it).

What is the problem you see, then?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlz6W+MACgkQzL64meEa
mQbD/xAAuJXYZtyw8+wDJdYxvPArHbJsa+EssC9w1rj+yVAOeWSirVDovo3Wbszq
s69S95xksieq7s+vSDvWkSn4Lhe/DzsMvnB4cgtGE42aZWCNKLKXOzmBCwrgox4d
4JHAkSTHCM1Xwn4fHHQf7KquMX91DlrPBNNJypc9kn+8AB3eRrjjzhGEv+4MOUI9
nKBIk7oTj48lhhVISclkjNCx5t6D+qjxECG3G5IdAoARBH8EVEFPfTz26sC1qt1T
or1/R5XR0+ydKnGf8zk3w9HZmMxgQgChyE1XON6PzvXdlTRGfDvVaeKYV2A7W5JP
rzcbBYx+ieixtUyjDpxfDPNpY+hyrB7L8q/HwC5vOteb7vc97QOUzLsz7jVzzhKO
V08ORIqTicu2LO1bBsyVhSu6f4xqoKA8+qmmdEjb0+FGXgyJnse1D4T3EIzX30Og
65PZ1K8D2xSHLxJBPHEr+as5sTmFSmO3M1nRbcO4LanAyGzL8pHgevNyhModUSXn
/vhxrPe01/qoskM32fqv1x49QbsjJZH17v0pmqdNic8qLur+2Owl7Q8Oidigj3kV
n0/U8Pi1uVaU6/DVgUqB1LfAX84SGWjKToHNHZWRlWdYCJV0Vir1fEhEohgD8vAz
ryi5kWlW/Jex+B0fNdXrRpzCLUvxHVQg4tUZtGDmYjNNZjpNkKQ=
=tz2B
-----END PGP SIGNATURE-----
--=-=-=--
