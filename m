Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA983C69DE
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 07:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhGMFsY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 01:48:24 -0400
Received: from smtp.bonedaddy.net ([45.33.94.42]:53798 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhGMFsX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 01:48:23 -0400
Received: from [192.168.1.209] (n49-190-172-168.per1.wa.optusnet.com.au [49.190.172.168])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id 4169F180043;
        Tue, 13 Jul 2021 01:45:30 -0400 (EDT)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1626155133;
        bh=ae/NCnKrOM7/LUwH8sseWw/72c7pqHgQzV/3W9Y0nmI=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=Vh1xgkTNqZPr3nP6vSrUO0TGNHjEInk4iffvFdLNUUFGg8I8UFmDBL5nVcUVJFdO8
         5xKFMf5ahuNalIFuYJK47NNPRJ2FfWae8Yhq4PbQIMsp1p/egX7VBjPAebIbaKsobz
         sTo6Mi7O4TMCOUgsdicB7NcgeHOBaP77Ca33DfVgcXXCvAnxj3CYSlJHtKdOUM0gXH
         4PXQ4xCNbzHzaNhVz1xFGlw3hH8+CxZEKgVurfoH7gkRdPgeVAVBFz3M9SliKpNZCX
         M4ivBYRwwqR12JPcTYP6DtSP3y7pT/gV0hlodYHiwPnVp7JqRptjZ/lLlM8DQFG88b
         AkoXSwBpDhoxA==
Message-ID: <6be6edd3a30888ef7181735a1bbdac579578fd99.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        linux-usb@vger.kernel.org
In-Reply-To: <YO0cL+4gzLSyTY7f@kroah.com>
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
         <ac8342bbedc5aa0f5754cb6830e6d5628cc022f1.camel@bonedaddy.net>
         <YO0cL+4gzLSyTY7f@kroah.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-AfMo5iRgjfaGF93x0unk"
Date:   Tue, 13 Jul 2021 13:40:27 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.40.2-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-AfMo5iRgjfaGF93x0unk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-07-13 at 06:53 +0200, Greg KH wrote:

> What do you mean "archive libusbg"?
>=20

GitHub repositories can be made read-only to indicate that they are no
longer being developed, this is known as "archiving".

https://github.blog/2017-11-08-archiving-repositories/


> What type of funding and for what specific development?
> What is lacking in the current projects here that needs to be
> resolved? And who have you asked for funding from so far?


The work needed is varied; the bugs/patches backlog, possibly porting
to newer library APIs, cleaning up build complaints, cleaning up static
and dynamic analysis complaints, integration with system software,
integration with mobile user interfaces, integration into distros,
automated testing with dummy_hcd, testing on devices, improving
documentation, promoting the tools, encouraging gadget authors to use
the tools, engaging with the user community, potentially additional UDC
drivers if any are missing, ongoing maintenance and anything else that
comes up during the course of that work.

I've mentioned the need for investment in the Linux userspace USB
gadget projects offlist to yourself, the other folks in CC, Bootlin and
a few other folks around the Linux ARM/mobile space.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-AfMo5iRgjfaGF93x0unk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmDtJ0cACgkQMRa6Xp/6
aaOhew/9GRP9VpjMSTB5toUeqJQuyspl0Mrj6cFTbT9M52MX3bUQnIxxSPmrxXgS
ZYoeuT8A3Ovqv2oib6H23REAk5CRFVcQ/yRRhYUNSD2eoAOaa/vTYSmYJdhMzl84
vQ+q5eQ7AbXMPOd0n/Bkto3Ylu3OTGtXsLr9XFGUl3DoqUYdsykq5IGaVKRG5Vsu
s3CkbbHsoqb8LMg8OHj6K8kzd+8XLslposYv++GAqoci8oXFa+c6L1gaXrPK59Co
pxpWkSI5aXzYG34ZWgWlV8KagexEXEiyizu2cEneWw9gf0/HHpZSY0ogy8SKt30u
j+26OzvEO70/ia3vj3y3psUKdyE/cmHIZlZgOsvp/5nOo90UdtZfsfArG0OwaK8K
I+J22aUXjRpX/uk2W9yb8K4SEQA/h63A6mbeVMdghoemxJsWPjQgC3wYGzTQm4o/
lE7ApGDrGZlrNX2fXslfjiPVXuBc9dfJN4Rnjtt1Q9uAB6DbdLcJUoU4F68XAEoY
0Eqtw5Ho0bl/DCRrhujh5k9uQA5QHBOfjGX42S8Vgm4WNtHsIFfgEZ9gVYQjyCy/
qNKFr3TbvwjqmJl0YaVY51REa0nysZ1LRkfX/oO06SsJvBH3f5cTC8h8xZEZ3q3R
mKSMzFWamDeEzgv+v1GO2I6AjnDJbsAviZg9tZ4VtsfXpXIMWHM=
=VPyZ
-----END PGP SIGNATURE-----

--=-AfMo5iRgjfaGF93x0unk--

