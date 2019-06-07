Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D098B3875D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 11:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfFGJuG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 05:50:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:28392 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727790AbfFGJuG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 05:50:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2019 02:50:06 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga003.jf.intel.com with ESMTP; 07 Jun 2019 02:50:04 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     John Youn <John.Youn@synopsys.com>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC] Sorting out dwc3 ISOC endpoints once and for all
Date:   Fri, 07 Jun 2019 12:50:00 +0300
Message-ID: <87a7etd8s7.fsf@linux.intel.com>
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


Hi John,

Now that we have dwc3_gadget_start_isoc_quirk() which figures out the
correct combination for the top-most 2 bits in the frame number, why
don't we just use that to start isochronous transfers and never, again,
have Bus Expiry problems?

I mean something along the lines of below diff (completely untested):

modified   drivers/usb/dwc3/gadget.c
@@ -1369,9 +1369,8 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3_e=
p *dep)
 	else if (test0 && test1)
 		dep->combo_num =3D 0;
=20
=2D	dep->frame_number &=3D 0x3fff;
 	dep->frame_number |=3D dep->combo_num << 14;
=2D	dep->frame_number +=3D max_t(u32, 4, dep->interval);
+	dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);
=20
 	/* Reinitialize test variables */
 	dep->start_cmd_status =3D 0;
@@ -1383,33 +1382,16 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc3=
_ep *dep)
 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 {
 	struct dwc3 *dwc =3D dep->dwc;
=2D	int ret;
=2D	int i;
=20
 	if (list_empty(&dep->pending_list)) {
 		dep->flags |=3D DWC3_EP_PENDING_REQUEST;
 		return -EAGAIN;
 	}
=20
=2D	if (!dwc->dis_start_transfer_quirk && dwc3_is_usb31(dwc) &&
=2D	    (dwc->revision <=3D DWC3_USB31_REVISION_160A ||
=2D	     (dwc->revision =3D=3D DWC3_USB31_REVISION_170A &&
=2D	      dwc->version_type >=3D DWC31_VERSIONTYPE_EA01 &&
=2D	      dwc->version_type <=3D DWC31_VERSIONTYPE_EA06))) {
=2D
=2D		if (dwc->gadget.speed <=3D USB_SPEED_HIGH && dep->direction)
=2D			return dwc3_gadget_start_isoc_quirk(dep);
=2D	}
=2D
=2D	for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
=2D		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);
+	dep->frame_number =3D __dwc3_gadget_get_frame(dwc);
+	dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);
=20
=2D		ret =3D __dwc3_gadget_kick_transfer(dep);
=2D		if (ret !=3D -EAGAIN)
=2D			break;
=2D	}
=2D
=2D	return ret;
+	return dwc3_gadget_start_isoc_quirk(dep);
 }
=20
 static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request=
 *req)


Would there be any obvious draw-back to going down this route? The thing
is that, as it is, it seems like we will *always* have some corner case
where we can't guarantee that we can even start a transfer since there's
no upper-bound between XferNotReady and gadget driver finally queueing a
request. Also, I can't simply read DSTS for the frame number because of
top-most 2 bits.

best

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlz6M0gACgkQzL64meEa
mQZn2w/+Mj5fo4O6dJFQeaZrstjdM4PyjtLPBtBFr4oEkSJAwD61u91RCEr//0nS
TRkH12dLmucAyCxhXHv5+MgKKSCMRJMYfvU4kXY2ttPqD6bzm1hAIrsupCcbn8zG
R4AjCW5/QUIHZ19dtHGIGsNNWlUDBP0FVEE+uX+A6+6gzRWoZKmcK3MFSwXPbXlK
bkYnH01vhnkbis39BBQVxtB9jkVkWvty9DubIqVjfHG5+8CMz0kB02cMOW7Nqm5k
GJkDU+kw4DdtuvjpIzagvX2skFMySy8QQ5Ub1cUutW7Y6HrCavtILodzn3eXkAu/
rKct9pmYW+tvBMQ7syydA6YNYVUFgrJYUQQtwrhf8k7TCDHFFjELVZHNMQFJQdbJ
5rF6EMhb/5Ogjom4tZ29Eqm215kRc4GZVLWpyipLbCRxh6sSp4rhcWhF14b/spOQ
hGvwyOmjC/Yw66wgLgJ4ZpH2BSoofBWdboaHFfMY+9/bmLthi9yMB6nY/UU444Xd
JJ3lQDmcPmCno24D+IQodh4M+/9KXJoXkzibSJTysnrL0gHVWVZPhX+CcI5jeMdb
JTXNJBkVAofFBcX8cTHnti1LPlIIPtejpYAOiZmegRNWS0Y/N+FF+7fHo4BE7HCR
uxl8Ly171PLbiMwU6TE6Q1WbFmRUjvTR+owefAw3h10T8hq8rb8=
=+5aq
-----END PGP SIGNATURE-----
--=-=-=--
