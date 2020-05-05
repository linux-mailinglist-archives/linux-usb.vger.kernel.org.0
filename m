Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FED1C4E5B
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 08:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgEEGeM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 02:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725320AbgEEGeM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 02:34:12 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE86C061A0F
        for <linux-usb@vger.kernel.org>; Mon,  4 May 2020 23:34:11 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z22so425377lfd.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2020 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Qm89k86sCYhllVKPg65NRhX0ZbalwFesaQl+Boi6CiI=;
        b=OdsbTxTtDfYSTfo36cUpoEZMUcipZWxI04dgcqNueWRy0+9VwqSyBq+pB4ums9pGSH
         gqcOiGVuVMrlw3PxhnNFaa0YErvBKdOM6WG5Tg5WKlrebQjqsKGny/ed89n4Fm4EJgPe
         wrGO33TNqbE8h5H9xmo9kYb6Fx3f4SrEM/52KTekq0dBmeYKbeT0NZ9XUFKq8iv0lLoX
         lIwsdismgg27POFWoC/nILsHr2nhyOZ09hTZsWEdPn7i9ft3jXz1sfRdaa7odHznNJ3V
         lOqNJA/Ck3q7F5o9mVr87w0t1pMulTSrnOjKIuQG4ThjpnizZD8DLVrb47PokIeqETm4
         X3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Qm89k86sCYhllVKPg65NRhX0ZbalwFesaQl+Boi6CiI=;
        b=b2gHUhU0Gy3tNaU/tlz1vKMqovsAB/73CWjaT95SSn+oSGNJ1bmdy0qfYzILeogrPo
         yq1i0+2Cqau6swhJ4OcOv76+7p0HpcCFEgr0dIlO9tSsSJ6INUrm6Rd93TwLkr4iIDnC
         TYlpjGRJKDs8hB9mlw/FGztEMIWD4ghtao5yujIveLTrhBKXe5Q+dfYnd9sKsxIm24n8
         HMH3djyBYrTP2RRnlaYmbVAeHYXY53/5E0QSrhSuA5eDlkXvcpnTpGT/9dJryvFC3LTV
         uTVmYjhdeDrq2yG9xwqZJUq/VeRxzenxQGCCrK4bsxkXx1sPwW7kO7qNDf7i3CFr8uFh
         cmKg==
X-Gm-Message-State: AGi0PuZDBSU6DdlXePnSCqU39qSKE+7/Yga/qRYSpUIl/eq4nGayi0J/
        Ar0IsPKRBWAQCFSGY+QPUwE=
X-Google-Smtp-Source: APiQypIKDfaEivLouGYRA6ryFrFTaHkwPbJ2OAeqkwTujBYnX6H9yfsqIBk0/sID2QZRua1nKQAQZw==
X-Received: by 2002:a19:c783:: with SMTP id x125mr596064lff.21.1588660450148;
        Mon, 04 May 2020 23:34:10 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id u21sm879336ljo.61.2020.05.04.23.34.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 23:34:09 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <Pine.LNX.4.44L0.2005041114130.11213-100000@netrider.rowland.org>
References: <Pine.LNX.4.44L0.2005041114130.11213-100000@netrider.rowland.org>
Date:   Tue, 05 May 2020 09:34:05 +0300
Message-ID: <87a72mc2le.fsf@kernel.org>
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
>> On Mon, May 4, 2020 at 4:24 PM Alan Stern <stern@rowland.harvard.edu> wr=
ote:
>> >
>> > On Mon, 4 May 2020, Andrey Konovalov wrote:
>> >
>> > > One more question (sorry for so many :).
>> > >
>> > > Looking at other fields of usb_request struct I see frame_number.
>> > > AFAIU it's filled in by the UDC driver for ISO transfers. Does it ma=
ke
>> > > sense to expose it to userspace? I don't see any composite/legacy
>> > > gadgets use that field at all.
>> >
>> > Do any of those gadget drivers use isochronous endpoints?
>>=20
>> Yes, there are audio/uvc function/legacy drivers that use those.
>>=20
>> > In fact, it also looks like none of the drivers in gadget/udc/ touch
>> > the frame_number field.  Maybe we should just get rid of it, since it
>> > isn't being used.
>>=20
>> It is used by dwc2/3 gadget drivers (which are not in gadget/udc/).
>
> Well, if Felipe thinks we ought to keep the field then you might as=20
> well export it to userspace.  Drivers are free to ignore it.  :-)

dwc3 has its own private frame_number as part of its own endpoint
structure. We simply copy that to the request. That's is currently
telling the gadget driver which frame the request completed. It could be
used by the function to decide when to queue more requests. It can also
be used to predict if we're in sync with the frames or will we diverge
and miss frames in the future.

If nobody has implemented any of that so far, I don't mind removing
it. We need strong evidence that this will never be used, though :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6xCN0ACgkQzL64meEa
mQYyUw//WDgbFSybsziAH2hdCaV4EZjaFRrTBwBuEWG/sCbrIeNbe5fD+LMgTZP+
SSKVSJAo0Ed16AiGzfVWkBIZPiz6DrOxQ+zqEDBRvSOOJPcAvAXRqHCV03Unqw13
+w0cqu29p/AyWms0bTRorDTTQwIQhTA5tplw9g32dW/AT71QmmqyCucLk8iVCxJ2
/7JTf4NKxssBMLvuziNAQLdXWQZqIdq5ulh1JAusm2yDvsQcvItxBOqt4Cjh5A7v
/3iy7tQd2H3KfonER7D2pGDVBajqcvfa+iWErREXgDs7ac2gR0f5gek0INauUURf
Sk9UbiLLlmjV6UV92OEFWORZsNWbPgdqaNQ/jWKiqcmpiwOGpc1VhWK51CtF37HW
CK1f0DlsZykV2GjqjfAGHYciHss0i2MafF3Q0SKWzqaLVdjukh+Wm95wJMPBPfS3
w6Ws2ORS3cAomgH8TJHyP7GKNj+v4fm/yzkJSCCvQkuiPPyYbiNNl26TD08SHmH+
e6zbvvZZoKgiVf0gImN8lsYGDGFW49POI2Ni9gRwDVNcJ/i0Y74Yu+ImxvuQitYx
w4VIjuJPyjs6lAFUGbmVxo2ND1BLoZTgaYJsZAHrf8CKHciIciJmEu57wRiFUI0o
Uo579hu6sLOO3vgJksoDx6nfFE8yXNBoGSQAGlPLE2RkWG91lvs=
=nTY2
-----END PGP SIGNATURE-----
--=-=-=--
