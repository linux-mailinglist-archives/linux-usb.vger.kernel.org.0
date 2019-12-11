Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 830D011ADFF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 15:42:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729883AbfLKOlH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 09:41:07 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38983 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729686AbfLKOlH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 09:41:07 -0500
Received: by mail-lf1-f67.google.com with SMTP id y1so5572575lfb.6
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 06:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=q+GGh7e2EcjsBLeLLpaAmVmyjv7hx2udZkjwQtL6404=;
        b=gJj9o8YyjLAF/bL0+I2dcXV4+2rVS1dmBlPmXJVmUpd/Aio9ruCxqMiQ9KC3VHCYqE
         FEbMkXBcWQ9kpfUV2vr0CudexnbS/dZMwayLOD1B0HV1SJquYkylKXQNXjKGt9AL9JEc
         668FfUfiowwGvwLKBj+YyZUbuEs2eXUR9p8h/KXWTUl+Sl3SeTfQLGCbBMJNhBTMUbSI
         NDStcZPqvAXT/R/d1Q8bGTfoW7Jdc9oCeGyAsVwbiViu/AOTH8PzNzCbUaJRUCw6DGCs
         WhtYWUWiOm9guH0S+4is4YUvjJFuTmeruLuK3UimL8pUPD/GhrwLGsFUHDeUdiOLdsE3
         D71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=q+GGh7e2EcjsBLeLLpaAmVmyjv7hx2udZkjwQtL6404=;
        b=RMg+J6z4IKptAsuhE8s5l50EoAamr7t7aLvrkkGvaNoxAsS8v48MXKzq14XhTYY43p
         q4LeV2n/PS93i4uhEQQ5wTuwp2TkD1sGoLvgHLUTyR4Jd19nXk1grtbp6RgSwNiukmol
         5qHlIxcnbWQ4VHVFPMX4I+2BrDsmj9kqekcZ+eMcJ3y3wwnYfY9T2Y+L8g1QRdjXw/Rd
         /0Xhwp3jnQU1/6xE7ddm603aDe1rOM0KjX+01nLDZgx16YOdHniIFP3eKkNNFw21ugog
         fMmeZfTOdDEHN52zSfVFCDUht0OGl52UcCditocI3HkRP+DKcROJ4t3/gnqmrDtqYIHn
         dsNQ==
X-Gm-Message-State: APjAAAVXYqcL5+78GuYlmWPiRux/51ojbV+o6Dbb7o8WrKYJe7SPitYy
        4LeazIJfvGzcVLy+CKQlZY6lWsFoHKo=
X-Google-Smtp-Source: APXvYqxh2e93qP5NkPG4DN2YlLAcs94/hYXN4SuIYdDVurXcL74rqT+cUXLJ5A29j1SH4USKhSirDQ==
X-Received: by 2002:ac2:4946:: with SMTP id o6mr2455641lfi.170.1576075265061;
        Wed, 11 Dec 2019 06:41:05 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id x85sm1311939ljb.20.2019.12.11.06.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 06:41:04 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Bin Liu <b-liu@ti.com>
Cc:     Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
In-Reply-To: <20191210134815.GC26131@uda0271908>
References: <20191113141521.1696-1-b-liu@ti.com> <87blt9psrd.fsf@gmail.com> <f12d3637-ad95-b5f5-f331-df791e85ab3a@ti.com> <87r21ncgy1.fsf@gmail.com> <20191209171522.GA26131@uda0271908> <875ziol7q5.fsf@gmail.com> <20191210134815.GC26131@uda0271908>
Date:   Wed, 11 Dec 2019 16:41:50 +0200
Message-ID: <87blseyle9.fsf@kernel.org>
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

Bin Liu <b-liu@ti.com> writes:
>> > de-assert DRVVBUS. If left GCTL[PRTCAP] to OTG, grounding the ID pin
>> > would make the controller to assert DRVVBUS without any software
>> > involved. So the fix should be the following. Please let me know you
>> > comments.
>>=20
>> But that's expected, no? If port is OTG, then it must obey ID pin rules
>> specified by OTG. IIRC, dwc3 is OTG 2.x compliant, at least the version
>> TI uses.
>
> It is expected when the usb drivers are bind to the controller. I am
> trying to solve the issue that DRVVBUS is still asserted on both host
> port and otg port with ID pin grounded when the drivers are unbind from
> the controller (after modprobe -r dwc3-omap, DRVVBUS should be
> de-asserted).

I see. Now I understand the scenario. Thanks for the explanation, Bin.

Care to send an up-to-date patch so I can queue it?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3xAC4ACgkQzL64meEa
mQY08g/8CxOxYFPzNwaeTVsAblg0rJtHgWR/6zIuGxYSRPHCgd+lgDeroQa2OVJ8
bx8xVBCt4dTJ+QDRG6SRUWzlH28gxP+ChWcERD29qi9nofDEhi8ZmFYpzMjG3jN+
uZ3wV2PSA3laIh3jL9FBZwHNWyay+ia47M0QAt8dSNaojMvoT3u6XCiU703t89qx
rW9LKJlxuuPcRstdpRMCIPUjoBzvZSlpd3BrLfcyh3sGIhd0tuUpIbGfw7AbS8VH
iD+TSJLEYPrKc+QYdeZoeelarrMiFLP+4boVqpFqW1Pr82DmCnSXqIt3WoLspKKb
b8BRq87PDv6QyOMZWt7sEXcjwM/CghXRxEGsziCXtMWkZUEnbii1lsJtQPA48pVV
nhh5RuMnviX7DoXPoLZ07lU7MfUol6XKq5XwhK1ubdKqCYHKOaw/mGufGvCEIZcc
6ZJ3rb0acC0v1yA3p72vQbgyCQ9Ooj47PBmfYsnjysQB1H+XNcyUcIn3o2JdghdA
t4UeQOLyLyv7zAvLzarN7TC1l3KLUkSFaS5ccK3ph7AOH1wZvVgjwt8HsMMkx6tJ
/FNhigtReIx+m/3rclnpTI5TjvUF7X5ny5bkEH8LsSdzswjrHZZbb5SozNQV8Hap
x/8h9GmJDL5KpswNr8qJysWzU5dWgaeS/pmTmKt3Ob8bjRAEIq8=
=7TA6
-----END PGP SIGNATURE-----
--=-=-=--
