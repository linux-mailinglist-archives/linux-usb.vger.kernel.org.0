Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E183A2F46E3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 09:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbhAMIvH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 03:51:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:43732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbhAMIvH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Jan 2021 03:51:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 769C223139;
        Wed, 13 Jan 2021 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610527826;
        bh=eMpOcIgc2LkAVihH8vbM6HoFr+v+uKc2FtIxMqXrYGA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rQqd5I+PyQIIgFA1Xw4ZC8bsTqDPx/PCOoXKLAALE0nvcnKFMRW6S8+HbJcMv2t2i
         3aajC6JhAbPQyKKOdXErNylu+5HglXrvUO/8WGt9+9Dmpn3xqIjR6Y3avwJbb58K+/
         tJqqxOK0K/O6I/+3TIxOnODyxVzyFra6KSfGLbMDBiEg8/JKWe3Ek33zlZ/tmiJlwO
         UzQRibkpkLckmmOhiy+fXr8Nj85Cf/aPtyVX66VFeYgkczN7v0/8MPDxsBvMfLO05K
         psO5qCsbWWsEAorO42wumdsQSORqXJ5yUM8Lz0jlplmWYjAFxUz3ZKBxZzbYz8GvJZ
         Y2/rX5AekfnnA==
From:   Felipe Balbi <balbi@kernel.org>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: DWC3 controller Runtime PM
In-Reply-To: <887ef415-4d15-062a-361f-f55c8ce5c351@amd.com>
References: <049dc0b1-1c3c-de1f-f788-ab1cc0dba3a4@amd.com>
 <887ef415-4d15-062a-361f-f55c8ce5c351@amd.com>
Date:   Wed, 13 Jan 2021 10:50:20 +0200
Message-ID: <87turl2pbn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

"Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com> writes:
> Hi
>
> On 12/15/2020 4:03 PM, Shah, Nehal-bakulchandra wrote:
>> Hi Heikkie and all,
>>
>> On one of our platform , i have added pci ids in dwc3-pci.c file.
>>
>> Now when controller is switched to host mode and nothing is connected
>> to port all ports are showing run time power status
>>
>> as "suspended". But controller on PCI bus always shows active. The
>> xhci_plat_probe function already sets pm run time enabled.
>>
>> Anything is missing?
>>
>>
>> thanks
>>
>> Nehal
>
> Can you please guide here?

controller in host mode is xHCI. Mathias, any ideas?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl/+tEwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb5qg//VQOcJ+ZItaN8nsN4E/T1z46mhtJm4mTm
o73/RlNEPnFqVPQJCp6kb4pRKf1rG1J/jjOPGmY9wl51HmzZQS19V9CaO5JSciF+
G89AniHab/czZ0Ogg+x1q7dpivL03xBsnoJSXWDgE7lNl/vKwE7qqRwlXem79tq2
Fgvb3zOngXZJamT9iGhthkJvW6GQNl6gPy0BODPuZ+BHepQ6C9/yrvQLdDCd6/h9
cCycAHV+7TB3qZc778okaxTT799nFU4P1etlgncdI5vwERefcaxOdfl9A3VglXil
4TVh0V4PxtACGvDAf6LYELWTLi5h/PXquHZ6fMigFUvTUe8hq+Zz7SK4Sah2PfqR
70w2suA8R4POsqK/ByJpFdEh1HbsQ3WcbBZUXzbU20DHltnXvKr+qJwaY8H5COv9
PCEp52QXtycuT2h0pl1Ms9bHREZNu2j0tjbzKocpEdJnWQ3WIra7z2ztkgEfGC9w
yAm0LxXzWCFJfk0Xng3ZFpZ3XDrIvsu9zQ9XZ79OyWBRSujV5Fog7+9nL0Q6LJe+
97qKIltGvoFNBKEBBRS8y0bpsFiQakQP5P/pNUPG3Lu5R/jn8zjf5K9KyOuPSKqI
JO/gsPD3QTx3yc7OOWQw5qV5gmSCwXqD0InlrXn6tNWw1vuz7w83eS6cA5tKnBtk
7ku+spMSRyU=
=u+f4
-----END PGP SIGNATURE-----
--=-=-=--
