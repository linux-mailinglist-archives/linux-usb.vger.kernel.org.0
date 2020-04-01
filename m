Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B75D19A66F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 09:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731870AbgDAHos (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 03:44:48 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39252 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731680AbgDAHor (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 03:44:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id h6so13818766lfp.6
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2020 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=iZJIdNQ43DtVUQtAJHhe6w2H9S8SF10hMOn5a2rC+5w=;
        b=fhqvzqGM/zA9STRnYw5OuDaKsbA4bYJo5qTjD78YEgWFN6umtPDPaGzrCzkpK0OxFH
         G73bA8OFPfWgiWPBOHjlO39DRzHDj1WBn/+AgX8G1R0IoKftS6ZsIKaMwZ1QbAuOESv7
         Ccf4ZZ5Lp1SY8Szwwggcevn+yD8OhG5C4+4dLU4prML0XmM4JbDHTQC6RgaLnoYG1Fd/
         VScONMRruY7DjBgkG7fdTrROKG05OucDjQ9PmefFoJDICDwbb1iMGNDGbW4+HdkVfS7B
         1G/hj4AN5JXKVW4bFlxUsKn/51Yh+76KEwJ3zH4QkJZMgwBZ+ONfVajOucDe00mcx+W3
         xt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=iZJIdNQ43DtVUQtAJHhe6w2H9S8SF10hMOn5a2rC+5w=;
        b=ooolQKMoc7nD7bIrFd9vUGtNfZnTnAAGIqNKbVTYH5+jM4zPs01bl727oZHyTsg01L
         RSRzT40QV9ujT9HWQ0AtmC41ZimigZRB40i88hqHQxYQSH9CfSzRaL3dE2/wtzE2g0YR
         +9XyIbQLJ3K7TYyRhsC60E7MQpPTb2ToVLGzfib4mz6TlBimwq/74BgjuX87R6NSBcDl
         8PFD94L3EsQVq2wMJB3VJNGdC61oMdbHiYGf65Da5Sor3XeyVVrl/kwmVQ5E/XQGNQOF
         3ZzYdyEPQzUomtTeTSmkkLcUi5FoA84ddEcBv7Pne3BUf9Uu3Q+2QPrP6CxepSlU+nn3
         pFpA==
X-Gm-Message-State: AGi0PuYJ4e53N+Kg7dC6GNVjPYIk7uchV7QqdFa8j/+qssGWu9Ia+TWJ
        FKz34SnV9IZF8JSkFJg6r5Hvcwnm
X-Google-Smtp-Source: APiQypIjuyFp0ozlwRPp9v7EVNQ4jAWNUClgBZ8iaJ6qCLpmRRhzqXZMJzTVDDgJ1IUirHF8Oo+dRw==
X-Received: by 2002:a05:6512:108a:: with SMTP id j10mr13257873lfg.38.1585727085243;
        Wed, 01 Apr 2020 00:44:45 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id l6sm660260ljc.80.2020.04.01.00.44.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Apr 2020 00:44:44 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
In-Reply-To: <20200401073806.GA2019004@kroah.com>
References: <20200401073249.340400-1-balbi@kernel.org> <20200401073806.GA2019004@kroah.com>
Date:   Wed, 01 Apr 2020 10:44:40 +0300
Message-ID: <87pncr1wgn.fsf@kernel.org>
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

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> On Wed, Apr 01, 2020 at 10:32:42AM +0300, Felipe Balbi wrote:
>>  764 files changed, 86304 insertions(+), 86304 deletions(-)
>
> Ah, a nice tiny patchset, I'll try to sneak this in during the merge
> window now :)

That's great, Greg. It'll help hundreds of people, I'm sure.

> nice job...

Thank you

> greg "I know what day this is..." k-h

felipe "I've been mostly confined" balbi

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6ERmgACgkQzL64meEa
mQb2LQ//YpPYz4baz2VtmbeoXd9ffn9nBO4pkgQNyzBDJZpWVjalyjdReD6cOUDa
LGNx4X2WJonEh3S97DrStiQ2floNNUBFbgnSNWUuXggZM6H+5Eejwa3MlDgNhlGY
TXSdAnoz7l3bo8ByScwIhGO/Y3s5T9N2S05m1jIuDYjwmxozLeFgm10BIPQyI4nm
FFn8vD5OO1AzinaP8yKH2YSfFVafTF2njtKoRiVWXITEzad23FktPQZ1g3GS9BQ9
URXo+Bw8vViAugnTfkF9z89y0Yg+XaecEUxuA84Qr/JxSzIwraicK3C/Z2fgfkpq
OrS/+hmIW0iJeeLIhpfcfSDNrJ6X2HFOHVjs1KEtSPGaJeSMvPhFoqmv0kFRn9z4
3G+EJeGDcr7Ljvuv1FaGKN5f+FHxtyPfCrQ59JhoqOWOyNs+bSPfF47eWS8l+IIP
ImuspRO/UWHcG7jg1ObVabCIX7uxwTEaPZXhL96GzDD7HyOI2CreYNGcTFEEN2yN
g9OU7mYsvwdniy/Fto4dvE49LG5dkGwwq7iUDeiBTZka9aOmTukw+RB2lXE0S+Uj
L2UWc2fXFbC2WizVznraoVa7EQfZil6HrOWDS06tGnQ69F48ZK8oO/zt9EKbGP2/
qVlWu9dpOimw18Ibi7HqtdpX/qQ3PaCL1kbTKg+6fz8PnAyr4UQ=
=Xyuv
-----END PGP SIGNATURE-----
--=-=-=--
