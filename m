Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCA42198BF
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 08:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgGIGjW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 02:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgGIGjV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 02:39:21 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA7FC061A0B
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 23:39:20 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e8so1126895ljb.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 23:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Ohfc1uS1pCQo3xz7r/CjvIN5mToF/nK6r7d+BceRnso=;
        b=oDBrGV5oXnDPh6U5px67Ew04eEy5hk7aTwzWxDMI4I6WUncNSLgYybukb5CoNY4kTI
         o4Ol2nrYMSraFrxrlx/UHvnIngaKuFE+6Y6SXoATzjuHQ0np9Jxc/K/Mj3JmlI0+snY0
         TkPS8VmrrV5eTs0ticFccpmDhQOzSSbwiC/OqhTFX3qIzo1pk3HemXH0hvFKD6VsYBsC
         XTu45J030UPNdJGeYykFPcLrQRv3sb8YtpV3CG7bDkFcsjwlHyTVrJHrjimtHrEthW71
         0eMl6HUPUF/MqE9jbVpGW3Dpa64gjYLju6SA8Ls2nqiUdgdk36/g/hOtb5vRUIaNDgHd
         KqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Ohfc1uS1pCQo3xz7r/CjvIN5mToF/nK6r7d+BceRnso=;
        b=LF4WKZ2EyrWosLOOXkc+mm29ZVgre4yiv0G1DE2QqKTXV2IEP/Hvfm2WLjBBzl4GEp
         Li66Ms+dUYBE4Cly4qN3ZmO6SuvS5E5vaLcAXLQe4zwKPy6Aa0TFq2B4d4MHYlwrVus2
         43Fjk9/NhRdPePok+UvaPLjtYMyI8Pa8vALgRVmVFCNpJVcCxyugKigAeeZK7R7BqSfK
         ZqFljcNCRsk1mQDHPhWF/85NB5yKu8Z62rSECv+wcdOR3jrMDcal15+31GyThKGTgQyX
         JvxAqjuhjUOwYVPuxm0W0y8SFRcVhEwHP7FwnzJ+izhiRaho/iykIXTP4ZlQVvUBicLO
         +R8g==
X-Gm-Message-State: AOAM531UY7SYM+eVdKw4tm5IpRm+jN0yBxg6PLq+DijimAbbSunQ/xyM
        WZYRIsi02XJCP5gQCiAjeZOkYPJd
X-Google-Smtp-Source: ABdhPJxxlFuCa8gt1cpfEBYCo+1KszlXjJ2TQEj+qivshATWJqkhlyT2Vrily9Pne47XFZkb1EpOtg==
X-Received: by 2002:a2e:9cd6:: with SMTP id g22mr29252680ljj.429.1594276758955;
        Wed, 08 Jul 2020 23:39:18 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id v19sm606266lfi.65.2020.07.08.23.39.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 23:39:18 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Benoit <benoit.sansoni@gmail.com>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: gadget mass storage with two USB OTG device controller
In-Reply-To: <391a537e-108d-210b-01be-c20dd9d0e68e@gmail.com>
References: <8f870ba5-5dec-e362-51dd-65311315f6f2@gmail.com> <CAH8TKc9gaebqZOpv0OFxG-Dq+Tj+FdgJamQ=eP4SMJ-eYBrkOA@mail.gmail.com> <391a537e-108d-210b-01be-c20dd9d0e68e@gmail.com>
Date:   Thu, 09 Jul 2020 09:39:14 +0300
Message-ID: <87o8op6vl9.fsf@kernel.org>
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

Benoit <benoit.sansoni@gmail.com> writes:
> I am in fact a newbie in USB OTG device mode.
> The configfs is really convenient.
> It works like a charm.
>
> I applied this configuration below and can see on the host the different=
=20
> mass storage.
> This configuration can be set in boot init script file.
> But what is the best choice to apply this configuration at boot up ? (I=20
> am currently using yocto.)

no idea about yocto, sorry. Perhaps ask on the yocto mailing list?a

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8Gu5IACgkQzL64meEa
mQZMAQ//d0Coa/rgaq5YU+WpSGvtXmWc+TlRpMxGZMeo3q4TD9EDGXo2tN7E++JX
1NOIXgWia3vMH8rAHzx8oET1TJWsiUjYqoAHAl/k5+pDGouA0UgorqO+LslOsTTA
Ajp9nGUL+SjEXLn6+ygCDzbmKe1sqRVyhH/V3aWwIxGmxfu1/aU2Qg7DfCa3X00a
qjDSgnW8YXzkC4YmoVCp6TImVzh8jHuRJp7IheUp//eoP5ogOuP4CAp2syxlRuYJ
J5g8xZv2yidUnugtsOchFIOfG7t/0c0GcIsjgHmp1dh+PQ7yhc7HdvJpgsJnhn67
BpzFd5hjLaI2LWFnyLP15v3TINF/nDCa3cIu2dW4eiabtcsdKWM2d2h+d7LEx2zx
CqJb/ovYdEpQ+faWd3Deheiq6hYjdFHy/q3LwLSHyFWvqwrjp7ZvI4/fYDi2vTU6
QlYBRGVStkDbggfT54QvbRDQks5GqVAwsNwx40PTmzRVTLhbF30XujlzI0TGlm6T
eViIkON3M+Az2YfAJ20vIwZBwiRy0u2e/ca9z0G7oSTTANST7hOmJh7ewrK2hb81
28k9RzUqHNjph7ttqPL0kfCkfzvCJWjMqKUail4SKxGcLzw6Tl06Bro7EYLierlx
ioxQgcQEHLwL8a0AFDn3Bnsf2JdeorsUHPWLJMDMdKlHzUc8+fc=
=AoQw
-----END PGP SIGNATURE-----
--=-=-=--
