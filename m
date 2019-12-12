Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA5C11CD1B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 13:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbfLLM00 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 07:26:26 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38119 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbfLLM00 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 07:26:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id r14so1561256lfm.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 04:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=SoLlzSMheg6fse+3oNghoYBqKCuOwRgyP29BGtrRpkk=;
        b=WIubx2XwrhNnGUXF1XSlDEHsCpYfJsFa1LeNgY3+RJqhxrq0izXUpYJHJYFxnGGjK7
         wiBlWTqoMt4umJqxo4H6/GpqVuZmP7PzjoOmdMd64q4sGKgBaIG5HOFe0XeOaelMBfHo
         06UJVXfLQ34uXYUazoOTfnmsk40gKxUhe6sq848x2pD9ntz7/OgwJN2xfi9Sq8avgZQD
         HYLb37fzUiExM/d4nniEtQpKZdTkNq+CWcFfqlOlP9Hz/6j5da2Cv0E6Tgas1qtPBhv0
         DnrlRsSSIi0tbenaP3dDTwyVh5uPKtWxIrCH0x6gtXnJ8jqLlkcHdUoFKgpEvCN5JtXx
         sx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=SoLlzSMheg6fse+3oNghoYBqKCuOwRgyP29BGtrRpkk=;
        b=Wpm5p8+2V+4tOs6gbMR9q1ykc+OeaBiTdiR2yix88NF6zqrybUjnuAP2L5Iok6j9Ae
         JA3LWamwFz7q31Qfjvhg/2QzsqoG8R5M9Ujy2uGRNTtQlwnM7CS2jCxAiZSqDu42sQ+m
         mK6vgLFCcOuvBSOEWhjt73CXkFUejKQMMD4DKfurOC0iKvbQP8t3+gPTzHPjZ8aB3SYu
         8yD3AcbgLUyGDrH4IbngnNZbG+5a2zrKY/v+inoVYcUezGnNC8cIXb7AQ0eiOsKjjBLd
         jlyinp+MeAxzgVWGBw5WtyU7f8oARkY8pAJsRd/Q9oI/DJAOitR85M3QLXdZxyMQFWec
         BOCA==
X-Gm-Message-State: APjAAAX3TzhiW/+uev83cfwRdlQa1FS74LaBBmxYTRU4G/XZSOVg1PpA
        AC19z2kgaqqAqi53o89StsMsh0TlwvZ4Dg==
X-Google-Smtp-Source: APXvYqw3D7xKhiJsRMrCubqPJpjDtazuLqDp+JZC2LihZ935BfAh9Zax1804IU55GjJ9nxaPH8f4Nw==
X-Received: by 2002:ac2:5dfa:: with SMTP id z26mr5492914lfq.103.1576153584020;
        Thu, 12 Dec 2019 04:26:24 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id l64sm2902993lfd.30.2019.12.12.04.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 04:26:23 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: pci: add ID for the Intel Comet Lake -H variant
In-Reply-To: <20191212111642.GB1534818@kroah.com>
References: <20191212093713.60614-1-heikki.krogerus@linux.intel.com> <20191212111642.GB1534818@kroah.com>
Date:   Thu, 12 Dec 2019 14:27:08 +0200
Message-ID: <87k171wwyr.fsf@kernel.org>
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
> On Thu, Dec 12, 2019 at 12:37:13PM +0300, Heikki Krogerus wrote:
>> The original ID that was added for Comet Lake PCH was
>> actually for the -LP (low power) variant even though the
>> constant for it said CMLH. Changing that while at it.
>>=20
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
>>  drivers/usb/dwc3/dwc3-pci.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> Felipe, any objection for me just taking this to my tree now?

none whatsoever :-)

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3yMhwACgkQzL64meEa
mQbJgg/+NwcrZoiFTBHVkHgo4egngatY+25Hq64wNvkCGm7PkjTuR8PrJ6YO/FtJ
rwC5rW7sKMAtLsLbgPPezt+7LSAeKC18va8IwJDk/755aXNFAU27TSNxDAjfCepn
KAQ3euvsmEm03v8zurFhQg6oAcnb8c2Hkg12hzikiu6ZuJCQDf0ewF9tZ7nCGr7n
fFFoIsyJsYLVgGOFmMSIKGcsVnrjb2NkF3My9gxNvZOlKOeOP1CFNHoZQtGN3CBL
czY5jq2nk1haYfyDj43hqqlj9yo9ROzfkXB6YjMCTzzSaiQDUCZ/lwoO9IZ9wfHQ
dxxb3VYJmylZchy5POdV429WPrgqTUxGQkH8NyVYb7un+bYlv1kh9+c++0ZPOxVT
IVtlo4PWzOhcBRtknoxh4z5Buu88W52bUJL2h1tDSfsXmVGUOnemtgcd5HdtFILh
+a3M42vxjpdhnI8VUCK7FRYB4IEOaUXBe4JDms6LnDCJ7Fupyzs4VUwp44Zhbdom
n9DK7iRR0oFwJRRRmjm2We0FnDn7qhM/G9Vy3nZ/YXFUobZLhbkJsrh8gewqE+kA
vepuuaH1cipmbGFzswaRZc92YKdgaZlbxqxNrASdIaw+8HVpAWXV2kPLJkzohpgF
NUX/A5wOS1dA1EARLBnWMo7Myhnt5F+YINH0fDQx/qC+y/ZuiK8=
=nHTz
-----END PGP SIGNATURE-----
--=-=-=--
