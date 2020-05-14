Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E66B41D38E8
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 20:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgENSJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 14:09:02 -0400
Received: from shelob.surriel.com ([96.67.55.147]:56396 "EHLO
        shelob.surriel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbgENSJC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 14:09:02 -0400
X-Greylist: delayed 929 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 May 2020 14:09:02 EDT
Received: from imladris.surriel.com ([96.67.55.152])
        by shelob.surriel.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.92.3)
        (envelope-from <riel@shelob.surriel.com>)
        id 1jZI32-0001WL-P5
        for linux-usb@vger.kernel.org; Thu, 14 May 2020 13:53:32 -0400
Message-ID: <e3e536719b8ef6326feaa9ffdaf852acaf093ab4.camel@surriel.com>
Subject: XHCI vs PCM2903B/PCM2904 babble error
From:   Rik van Riel <riel@surriel.com>
To:     linux-usb@vger.kernel.org
Date:   Thu, 14 May 2020 13:53:32 -0400
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-RIKPAaV8eoMNLtZOstdf"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-RIKPAaV8eoMNLtZOstdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

for whatever reason, various amateur radio products use
the PCM2903B, PCM2904 and related USB audio chips. On a
system with an Intel C610/X99 USB xHCI controller (rev 05),
and recent (>4.18?) kernels, this seems to result in USB
babble errors.

I hacked up this little patch to allow much larger USB
packet
sizes (the device advertises wMaxPacketSize 192), but that
does not appear to change anything:

https://paste.centos.org/view/f49e6f42

Where should I start looking to see what is going wrong?

The usbmon tool
is not capturing whatever packet caused the
babble error (no surprise there), so I am not quite sure
what my next step should be.

The audio layer also never seems to get
packets larger than
192 bytes even with the larger max packet size in the=20
snd_usb_endpoint struct, so I am guessing maybe the babble
error can also be caused by something other than a too-large
packet? Maybe a packet that was transmitted after too much
of a delay?

Is there something in the urb that can be hacked to allow
much larger transfers, or delays in transfers?, and some
way to capture what may be going on here?

--=20
All Rights Reversed.

--=-RIKPAaV8eoMNLtZOstdf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEKR73pCCtJ5Xj3yADznnekoTE3oMFAl69hZwACgkQznnekoTE
3oNERQf/Yeog8gPXF2u/pjwJTJXWSPHXli7Y9xZUUVnl2Ua+oA/+iF8DCVDZriMf
eGnQbXsYGtX3x0Nrej66GWZVcEk9BlchclVCQFM8AtD1HI/5EMN1iQz+2QbVikua
Wx44H1orJOk9VQVZpI8VsWVq4gQjzvqfHcqCohJ1H5c8gAHuuY88o7IEs7csDCF1
DzmzyWNCxge09bXCCLGDenC7stAlVMeB08Ve6yBCOKxwjrnOQ/TyrDTBCdcUJDkH
Os+/GLa+a7V3fLvk+P7F7dEB+d0i/oVS3TUrRzuWUXnR9FGZUx88MWv+1+ZHdfbO
fDRkIrVIDGy5l83IOabchx+kRMGslw==
=BtPN
-----END PGP SIGNATURE-----

--=-RIKPAaV8eoMNLtZOstdf--

