Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3A3326AF0
	for <lists+linux-usb@lfdr.de>; Sat, 27 Feb 2021 02:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhB0BI6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 20:08:58 -0500
Received: from smtp.bonedaddy.net ([45.33.94.42]:37376 "EHLO
        smtp.bonedaddy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhB0BI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 20:08:58 -0500
Received: from [192.168.1.209] (unknown [49.190.168.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pabs3@bonedaddy.net)
        by smtp.bonedaddy.net (Postfix) with ESMTPSA id B6B27180031;
        Fri, 26 Feb 2021 20:08:28 -0500 (EST)
Authentication-Results: smtp.bonedaddy.net; dmarc=fail (p=none dis=none) header.from=bonedaddy.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1614388111;
        bh=9ktoKNol23wyRJqjD73sAMsbRp3gtWVfZoW5SAwsV4g=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=kY/wqk7lkBq1pn1eFPPORM3ERpccds3mHfeJQ76un75Wv41I2L39hioiQOr1ULdzb
         EI1kmkuK6KOed4rCPXAquqyRxJlDGjYqUYLgZRdFZAjXYLxtDC1YavrpxxOCBRzhkc
         pW3S2pYtE7VAoj9UOxH3NRkCRVICEZUEJyngcVQYUZYWcbyH8OWDLoL91oSK20lFHd
         hompFHsVRLgFjfJi7bvRxN5FVGZw9RfZdsmFv2gr4wIgNwYjJCqEKWEWQW/2L95PUY
         AeC4sn60oTUEl1Yndd+aMVOLz1pIhLTqzOLQcF0FCuEC+IX+F5Ax51FW7RHeMyK1ew
         kqzdaupA65YEQ==
Message-ID: <f89e3e5b5e25b89a603e2d97542d60461b429910.camel@bonedaddy.net>
Subject: Re: proposal: move Linux userspace USB gadget projects to
 linux-usb GitHub organisation?
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Mike Sweet <msweet@msweet.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Porter <mporter@kernel.crashing.org>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
In-Reply-To: <DEA8D27F-3313-4457-A2F8-66B09CF392A7@msweet.org>
References: <e6e918148b817e88efff77d3366cde057924fb45.camel@bonedaddy.net>
         <DEA8D27F-3313-4457-A2F8-66B09CF392A7@msweet.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-R4bSRAWtLMqLjOX5wK66"
Date:   Sat, 27 Feb 2021 09:08:02 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-R4bSRAWtLMqLjOX5wK66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-26 at 14:24 -0500, Mike Sweet wrote:

> Paul, please add me (GitHub user michaelrsweet)

Invited, you should get an email about it.

> I=E2=80=99m gearing up to work on the USB gadget documentation

I guess you mean the documentation in the Linux kernel repository,
I assume that the libusbgx/gt/gadgetd docs could use some work too.

> Implementing IPP-USB has been an interesting challenge

Are talking about a IPP-USB device implementation?
I can't find your implementation on your GitHub account,
could you provide a link, or is the code proprietary?

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-R4bSRAWtLMqLjOX5wK66
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmA5m24ACgkQMRa6Xp/6
aaOjow/+NQ0pxM5aPN5Y/FmHK0U48Xsxe3HM5wbsrA4ISDcCM2becknCN7fa5qtn
XyB19X7Lg5JoE/jxY361ewCvogrwr7t3TFwYw/VgLYKH/nq2A2gYTLOFfi4TdWyp
HKbZeqMPvg7oGYcre2zAnV5o5LXf80trsnzub95Muhz9c9WwGe69k5sE4UMshz0m
ieGpNsFBpzHQercCJbPWQ1PfHl0r7FwmWcJHIA+tEhkuovOMRcYMFENRCr41yiNZ
b4WJs6Jbf0dqRFy/42UaFwYCSGmKoKPpyhUKTx/jv503dqaF3uTO+hohEin88VlL
Ih5C/YqWukgSQ00dq7HQaxWdhBePSQgL3Ww2CEnrfZXVGOtP5PgHeGITLAea2L1I
ehFomRtJHDtgXLaN+4TSGjO96W39gt0eTKlOwr3XFlTzivf+oCGwWvjnPOSEW/fZ
jnDArvjVMhLd/DFqcP1gxfh6zd0bPWhleSHOr9/ItwyTqHVcmGuHwrDJWsUCoQRd
vBcPomALSKFCyArTMmry8fL26sodbzln9jnTrE9iGAK8JSr2NrUSxycMt4le4ykC
RyCH+wvsUVneMLlsQh+yQjE4QkKWaLhQLGl/KYPfY4p7a+dOp9JJ+HONn0jXP+/P
sBgVnS94xO8D7jZF3v4CCziVE6pn9qbO/jkVHsfQw32ld21AJDU=
=bktf
-----END PGP SIGNATURE-----

--=-R4bSRAWtLMqLjOX5wK66--

