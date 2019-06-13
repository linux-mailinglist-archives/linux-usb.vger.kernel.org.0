Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E8443AB4
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 17:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732096AbfFMPXI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 11:23:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:60736 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731916AbfFMMdK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Jun 2019 08:33:10 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jun 2019 05:33:09 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga001.jf.intel.com with ESMTP; 13 Jun 2019 05:33:06 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Regupathy\, Rajaram" <rajaram.regupathy@intel.com>
Cc:     "Cox\, Alan" <alan.cox@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Pandey\, Prabhat Chand" <prabhat.chand.pandey@intel.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Nyman\, Mathias" <mathias.nyman@intel.com>,
        "K V\, Abhilash" <abhilash.k.v@intel.com>,
        "Balaji\, M" <m.balaji@intel.com>
Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a raw interface on DbC
In-Reply-To: <20190612105408.GA22303@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com> <20190607063306.5612-5-prabhat.chand.pandey@intel.com> <20190607142132.GG14665@kroah.com> <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com> <20190610141607.GA5937@kroah.com> <4834501FD402484A85750D15DF17AB5C1D15AEE6@BGSMSX102.gar.corp.intel.com> <20190611095243.GA23226@kroah.com> <4834501FD402484A85750D15DF17AB5C1D15B030@BGSMSX102.gar.corp.intel.com> <20190611123409.GA26261@kroah.com> <4834501FD402484A85750D15DF17AB5C1D15DF95@BGSMSX102.gar.corp.intel.com> <20190612105408.GA22303@kroah.com>
Date:   Thu, 13 Jun 2019 15:33:02 +0300
Message-ID: <87pnnhekch.fsf@linux.intel.com>
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
>> > > > Who can use this interface in the "real world", is it only
>> > > > developers that have access to the special hardware dongle?  Or can
>> > > > anyone use this on their laptops for getting console access in a w=
ay
>> > > > that is somehow "better" than the existing interface?
>> > >
>> > > No special hardware is required. As indicated earlier developers nee=
d a USB A-
>> > A debug cable and anyone can use it to get console access.
>> >=20
>> > Where can I get one of those?
>> Here is one example:  https://www.amazon.com/SIIG-SuperSpeed-Cable-Meter=
s-CB-US0212-S1/dp/B0032ANCBO
>
> Ah, nice!  I'll try to see if I can get that in my country...
>
> Nope, not available in Europe from what I can tell, I'll have to wait
> until the next time I'm in the US :(

here's one from amazon.de:

https://www.amazon.de/dp/B00WHZ6VEU/

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0CQn4ACgkQzL64meEa
mQaBxw//ahSYPTrbE72QG4ag5HE1SD2aECUM/ipyTO+qvnO27tQuXT7ckSo4W4CB
T9j4BohoQczA1G4su/wDG7EyrhcPH7nFDdYEZoJ9rrj/gCz9h1kz7UwlQjT6M/KF
eOt36G1TnJMTINEDULeeA8h+dTB89k+5kMOAanMHP2SqazTRvtRXYNfTAj7LYnHr
Ga+wPbraZ0gvQeaQmkKm+nRxj14HuI0gk+lylaDXdSxQj0PZX0ck563Q3pV61+HG
qtKrN9bn+2y6W99hb2hmB4pg2tYpZ9YCi0VFics4pxvJmqBMgLFiYNEMLTzdsv5q
7xZOL+GtEhXQLtAuxJxPO+VhKYIi2eUA2cg5NPmyaz4EgDGCQulBGrdvyUuX7tmB
EqRHD754rVUuz2rmxTNmsqtgbB8uYDqMXlMDYJjOqGZQikV4DwODcCj8Bjck8WAW
ig3w6egL3mwAhVw/ZgoPbCBse287AoDpLJH0l+0ymOzlq77mpDweMH3F244MVZ2O
EIUM2WQZ88ZvEPtNBR4rOGR2+Pn4OwpBSq2OHjRz8dXE/PokuCtNPIKS6czBDPZU
CfQOpglOqGRByjJ4IdWWZluj+m2lXIrKr8LVbIPFR7UdCGH6zkf2hyZjLbAOkDLr
Tk4dMAAyRXgf78/RN0fUDBeO4s6iecWRvaxQbTVfdAN0yzooMNk=
=n7Gt
-----END PGP SIGNATURE-----
--=-=-=--
