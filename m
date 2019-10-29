Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC04E8355
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 09:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbfJ2IjC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 04:39:02 -0400
Received: from mga09.intel.com ([134.134.136.24]:25823 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbfJ2IjC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Oct 2019 04:39:02 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 01:39:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; 
   d="asc'?scan'208";a="229982723"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2019 01:38:59 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Jacky.Cao@sony.com, andreyknvl@google.com,
        chunfeng.yun@mediatek.com, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Reject endpoints with 0 maxpacket value
In-Reply-To: <20191028160818.GA257088@kroah.com>
References: <00000000000030af530595acdd8b@google.com> <Pine.LNX.4.44L0.1910281052370.1485-100000@iolanthe.rowland.org> <20191028160818.GA257088@kroah.com>
Date:   Tue, 29 Oct 2019 10:38:54 +0200
Message-ID: <87sgnchroh.fsf@gmail.com>
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

Greg KH <gregkh@linuxfoundation.org> writes:
> On Mon, Oct 28, 2019 at 10:54:26AM -0400, Alan Stern wrote:
>> Endpoints with a maxpacket length of 0 are probably useless.  They
>> can't transfer any data, and it's not at all unlikely that a UDC will
>> crash or hang when trying to handle a non-zero-length usb_request for
>> such an endpoint.  Indeed, dummy-hcd gets a divide error when trying
>> to calculate the remainder of a transfer length by the maxpacket
>> value, as discovered by the syzbot fuzzer.
>>=20
>> Currently the gadget core does not check for endpoints having a
>> maxpacket value of 0.  This patch adds a check to usb_ep_enable(),
>> preventing such endpoints from being used.
>>=20
>> As far as I know, none of the gadget drivers in the kernel tries to
>> create an endpoint with maxpacket =3D 0, but until now there has been
>> nothing to prevent userspace programs under gadgetfs or configfs from
>> doing it.
>>=20
>> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
>> Reported-and-tested-by: syzbot+8ab8bf161038a8768553@syzkaller.appspotmai=
l.com
>> CC: <stable@vger.kernel.org>
>>=20
>> ---
>>=20
>>=20
>> [as1925]
>>=20
>>=20
>>  drivers/usb/gadget/udc/core.c |   11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>=20
>> Index: usb-devel/drivers/usb/gadget/udc/core.c
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
>> +++ usb-devel/drivers/usb/gadget/udc/core.c
>> @@ -98,6 +98,17 @@ int usb_ep_enable(struct usb_ep *ep)
>>  	if (ep->enabled)
>>  		goto out;
>>=20=20
>> +	/* UDC drivers can't handle endpoints with maxpacket size 0 */
>> +	if (usb_endpoint_maxp(ep->desc) =3D=3D 0) {
>> +		/*
>> +		 * We should log an error message here, but we can't call
>> +		 * dev_err() because there's no way to find the gadget
>> +		 * given only ep.
>> +		 */
>> +		ret =3D -EINVAL;
>> +		goto out;
>> +	}
>> +
>>  	ret =3D ep->ops->enable(ep, ep->desc);
>>  	if (ret)
>>  		goto out;
>>=20
>
> Felipe, I can take this now in my tree if I can get an ack.

Definitely:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl23+p4ACgkQzL64meEa
mQbQcA//S1YD9MP/2e4Nz6RFDzk79gqKGOtptuUPWuCsLYJW1AWKCtQhBmjoCr0k
Qi4C+PKgdljtrmxDl9Q2g24tEB2TYS/AXYR08hnT7CiVCLQg7eGnoQHhP91VkE4T
PBK2g4yYrMTw7AzdPuwA97piozAJE9hrpQgBdw74ZItGgJjf6IbS+b18ytJBpQRn
xL1Qly39/lhoh5coAQPiioS5VoBThpB2Wz+E36Kh30iUIVLL7pM5351RIuazzh1f
Oj9K4bbiDLFb4cJ+y3aBjqt7SbmebbsW1B+YA9kugWSOd1qjdt6boE1cVfrxV6U9
HO7hJGsTmP/pkNvQl/zm2th08r5rrrGTV/CO9q5IWN4hGfzU/7WzXQd3PJxaUdch
SimW3fFrw7QpeleBZwrTpPrUFECReQCgEvEwNFchb4KQN+mTOhhdez5kEfTG9tGi
XT3D1lc5hqxZfBFUo1TnndRX52ggJqQQKVgxFSOHr9+aQhG4niqANO31Weh1gCu+
ncyhRSoUb5IYWvB5jcewcXzPtfadj1fLqt9azDzflGrZNBdEMCEr07X3aLFpIYAL
HEy3dqeeZKQs2M+tt/NlXf0quxsdeZWmkndDe9nZefBtEx55V4iy6zn+kYj7z6KW
nK/NzOod/Nr++Sun4403cekscRvjJOPzufPGeIlmmjrwz/NsF44=
=MtVv
-----END PGP SIGNATURE-----
--=-=-=--
