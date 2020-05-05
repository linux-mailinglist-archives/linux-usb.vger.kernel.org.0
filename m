Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7431C4E57
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 08:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgEEGaq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 02:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725320AbgEEGap (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 02:30:45 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DB3C061A0F
        for <linux-usb@vger.kernel.org>; Mon,  4 May 2020 23:30:45 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j3so390465ljg.8
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2020 23:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=9VkRkb1ro1GgJ9r1EmvnofJjjCP5hTfDcQnLR5xMf4s=;
        b=PRJF5rkB1gz41pH86KmPzfEkDhICs5RLTWoksw5ku/HqdCc/xy28MNwD1y+yUlmo6z
         uSjWQ+wtI8Yo2cDeLkQEfxGgcIlAvROo6faOHxwgEUR30mf7lNNieRd1cErj2w+I42AH
         iGv6xXDkj20OZ3n/wp4FF9NKGpUq3ns4UREYXf4jzooqWl0dgr3Jy2e/TIB8Mi6gzQyY
         OERhy1z2SLQzwtdFug1hSrkffCeuihAQIk/bVZp77Il37e9ybUiRB0PHcMRSKNQpsFYj
         UHPRTgu0Yn/oMkMPF9ZPyeaOsuLETTWMpuiPw1VLfAxx0aAGOpV+0dVNsYxovW+/pmwB
         +ixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=9VkRkb1ro1GgJ9r1EmvnofJjjCP5hTfDcQnLR5xMf4s=;
        b=LuFcmA7VlX9wz6lJgWUVxh0tCnat3f+QTWz9u9sN8UFt0e8++F90ouB+m++ZmMCu6/
         0qJLtZv/3CK8DjLtjTho4pWbWToIJ9cWsXcX6P9eToPH9WiOVjhtg/nyfLVjKfOckMxS
         +f4E/B3l10SZ2yZEkBKE4mMLFGZzWVfF8r8POz/t/rHxPPxMXjzL0j2Uw3nzFz6XtyD7
         DwMvNcOJvcEEUaQy219osIjfOaRe1gw2PEi525giIGTWgBJTY2uUZBrCj32GfRWJ3rN0
         HL2uByPLGem+RBYlkoX6aDWX6RJjAPcMSbB3IGzhnpOtNBXYTsMmutaezX0dL+j9h9wP
         ELOg==
X-Gm-Message-State: AGi0PuZ51x/Ef6AT2XzN6pgTWkSvJ894dWP2PdirnJagyZMxT0tBu6DE
        SlOr/38+RZrGfN1V/1mg6uyym/Pe
X-Google-Smtp-Source: APiQypKcjm3a/GYvCCLaLvivyXzf/CFDKvtaMS1yMNfEJGvjbZlsnc9NikHkG5SdLi5BYRXW3Kk+dQ==
X-Received: by 2002:a2e:8901:: with SMTP id d1mr827015lji.37.1588660243461;
        Mon, 04 May 2020 23:30:43 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id o3sm911278lfl.78.2020.05.04.23.30.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 23:30:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <Pine.LNX.4.44L0.2005041018520.11213-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.2005041018520.11213-100000@netrider.rowland.org>
Date:   Tue, 05 May 2020 09:30:38 +0300
Message-ID: <87d07ic2r5.fsf@kernel.org>
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

Alan Stern <stern@rowland.harvard.edu> writes:
> On Mon, 4 May 2020, Andrey Konovalov wrote:
>
>> One more question (sorry for so many :).
>>=20
>> Looking at other fields of usb_request struct I see frame_number.
>> AFAIU it's filled in by the UDC driver for ISO transfers. Does it make
>> sense to expose it to userspace? I don't see any composite/legacy
>> gadgets use that field at all.
>
> Do any of those gadget drivers use isochronous endpoints?
>
> In fact, it also looks like none of the drivers in gadget/udc/ touch
> the frame_number field.  Maybe we should just get rid of it, since it
> isn't being used.
>
> Felipe, any preference?

It was added for functions to use to tell the UDC which frame they want
to start the request, but it was never used. I don't mind removing it.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6xCA4ACgkQzL64meEa
mQYB7g//VcEprmmelTPR78LbGNYvMx5NIEE2iezfjDSVBhs2lflDK9cs62B2B5OR
VZ12SSimET9107+qqt+KF9WI576KD9g1sKKYpbn9Ofwzjvup7aaV+L3R+jVr0zrJ
+r3xnMK4VMe+jSbhKBTTRxANv6zePGlqL3CMpbI3z3u31QRpEC1XiZA+YGChNcKZ
lVVjTvh6GRJ7nw1m7g/1qPY5cSPus49Q+Y7KuyOqu7FOmYCOrpETmC/Y4R7CaPDj
mfAAtHOF/VCRcBKwgwLPv7u0NPjyvlDWNwCLmo7kYWe44a9RHIHRx9RMEdcAxsCM
KARQZQivuWSFNU3wa+LJ15c1XuNwH/vWwrL9PegfFqwor4LAw2bpO+pQrC/kX3n0
eXSu0zVfXraoFdzNLRgNnKrbbAdEhLmESeSEie/yZBo0zcS7tILn1VN85C3A+z7F
KUcouq62GEUa/5O4oHpBw+N+jYRd1SXLGnqxr2v+bSL2dJ+vyuCnvPZyJjXRPR4P
THGyGl6gn4RHstNiwhxV7gXOMciIZj3SRdkysiQNOOam5le6fdfBAp56sjTbAwyW
PMUppGQMN5DZww42bcgxs9AQc2m4DoUL7wGx1VhxBz44QK8YqfSwr95H8WmoUyxe
61PywFtAE6pxrqyodmkzZXoZ8p9krRiEwvch+neR/gT+Ck5np00=
=oQEC
-----END PGP SIGNATURE-----
--=-=-=--
