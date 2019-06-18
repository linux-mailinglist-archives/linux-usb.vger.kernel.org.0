Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C56E49A58
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 09:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbfFRHUJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 03:20:09 -0400
Received: from mga14.intel.com ([192.55.52.115]:57805 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbfFRHUJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 03:20:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 00:20:09 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2019 00:20:07 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Youn <John.Youn@synopsys.com>,
        John Youn <John.Youn@synopsys.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Sorting out dwc3 ISOC endpoints once and for all
In-Reply-To: <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
References: <87a7etd8s7.fsf@linux.intel.com> <2B3535C5ECE8B5419E3ECBE30077290902E78AF3D7@us01wembx1.internal.synopsys.com> <30102591E157244384E984126FC3CB4F63A11B8A@us01wembx1.internal.synopsys.com>
Date:   Tue, 18 Jun 2019 10:20:03 +0300
Message-ID: <87fto7gy1o.fsf@linux.intel.com>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>>
>>>  static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct
>>> dwc3_request *req)
>>>
>>>
>>> Would there be any obvious draw-back to going down this route? The thing
>>> is that, as it is, it seems like we will *always* have some corner case
>>> where we can't guarantee that we can even start a transfer since there's
>>> no upper-bound between XferNotReady and gadget driver finally queueing a
>>> request. Also, I can't simply read DSTS for the frame number because of
>>> top-most 2 bits.
>>>
>> For non-affected version of the IP, the xfernotready -> starttransfer
>> time will have to be off by more than a couple seconds for the driver
>> to produce an incorrect 16-bit frame number. If you're seeing errors
>> here, maybe we just need to code review the relevant sections to make
>> sure the 14/16-bit and rollover conditions are all handled correctly.
>
> I think what Felipe may see is some delay in the system that causes the
> SW to not handle XferNotReady event in time. We already have the "retry"
> method handle that to a certain extend.
>
>> But I can't think of any obvious drawbacks of the quirk, other than
>> doing some unnecessary work, which shouldn't produce any bad
>> side-effects. But we haven't really tested that.
>>
>
> The workaround for the isoc_quirk requires 2 tries sending
> START_TRANSFER command. This means that you have to account the delay of
> that command completion plus potentially 1 more END_TRANSFER completion.
> That's why the quirk gives a buffer of at least 4 uframes of the
> scheduled isoc frame. So, it cannot schedule immediately on the next
> uframe, that's one of the drawbacks.
>
>
> Hi Felipe,
>
> Since you're asking this, it means you're still seeing issue with your
> setup despite retrying to send START_TRANSFER command 5 times. What's
> the worse delay responding to XferNotReady you're seeing in your setup?

There's no upper-bound on how long the gadget will take to enqueue a
request. We see problems with UVC gadget all the time. It can take a lot
of time to decide to enqueue data.

Usually I hear this from folks using UVC gadget with a real sensor on
the background.

I've seen gadget enqueueing as far as 20 intervals in the future. But
remember, there's no upper-bound. And that's the problem. If we could
just read the frame number from DSTS and use that, we wouldn't have any
issues. But since DSTS only contains 14 our of the 16 bits the
controller needs, then we can't really use that.

To me, it seems like this part of the controller wasn't well
thought-out. These extra two bits, perhaps, should be internal to the
controller and SW should have no knowledge that they exist.

In any case, this is the biggest sort of issues in DWC3 right now :-)

Anything else seems to behave nicely without any problems.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0IkKMACgkQzL64meEa
mQb5lxAAuaSQWwTg0WyHUd0pKVcI1qXFNxGhrH05cKzSzud7HM1drNTqoLK40HEm
lMUBJFKEBfzyBDoMAUR4YjrB9dfWitL29t/BAzIFosPt+LWjRAmbuwxRZO+VXmxO
E4A5bqfQEnLWE8T28lr64gQbuFRo0ilatKF6IaXXKLHqYts0Nx1itnfq55nkQ9md
7JnXB/FyEh0Le1EBiYinq9uPfy/6PXXNNBkvB1A2GTlwnEjjO7RejIXUsv7ErFFk
WfUhvbtKDfup+kjyN4DP2C4C/TNMGVSnyc2m89fCCde72m+Bvi5LipuMVzaQ1nnr
PApVLTDDw2ZeNHyen2xgPbQ2GweqStx8Ip1GMI89hw14oTDT7RqHw0Vy2qZHsbTn
KLlY9roXDmCPNpiTE4ATM2ndz8v/oPOZl1EyE2tvMkBp9HZOSUgvVrMb1bbJ8aln
u7HrX6FmgOwBUBNVqViFyS4rMrrLirzhVqKlbeyfzcQb9TjqNcRbWki05D8aTcrg
2MSvGjiJbjwKvHbNHp01U9srinYFALRJAL5wkx3EirlPDkmhhxLCUGKuqhYmKLyj
r4Wcp2W71ZTqadegXOzgRAhsme2bG4UeUksgSBfNB2A9O3EbN9YCgVLSV4IpjHim
F0BJw9WMFjtdpkE9l8CrftKEcv3v4lqNiQhVDm9E4DiaNaJ1MI4=
=VNep
-----END PGP SIGNATURE-----
--=-=-=--
