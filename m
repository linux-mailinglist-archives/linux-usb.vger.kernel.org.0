Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22953DA4CA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 15:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237656AbhG2Nz5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 09:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhG2Nz5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jul 2021 09:55:57 -0400
Received: from mail.cyber-anlage.de (cyber-anlage.de [IPv6:2a03:4000:6:30d5::1337])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218C2C061765
        for <linux-usb@vger.kernel.org>; Thu, 29 Jul 2021 06:55:54 -0700 (PDT)
Received: from cyber-bucket.localnet (p4fec676d.dip0.t-ipconnect.de [79.236.103.109])
        by mail.cyber-anlage.de (Postfix) with ESMTPSA id C780C51725;
        Thu, 29 Jul 2021 15:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cyber-anlage.de;
        s=cyber; t=1627566948;
        bh=xxc13I2Vs1dBV9l0Y6iZNfsYvBlEUbeg68IEoH5pOlw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CBycRlcah5WPmyBl19Ck6SELBgz+dzGR4E/1XHiS81UuqiiBGrv5M3s30s7n7VFgo
         Vt28dcZB1zQPl/wZX+1jfT2wSnQd49PhR7xnPWP8h89cv5R8GfwC7L9f9Ur9aRRspU
         Mez1EWhjbKqyGomAWRiyQuvgs6sLTKM44dfWHcH+yMk5oCx2SPYWhMueCdZ9jxiumq
         Bu+EX7ETfHKdrxPnVaMmrymyoRBj3CHfYybbdIM12QVuHCOUdGu51pxdxiFiG2LLgl
         p4iR/rASmuma2LKxJZTZ91hpMbbu2NqPbaKbq/fK6lPHIytjqX8LvCMWZuwBtNoDQy
         TMEkfrpBAIijA==
From:   Chris <chris@cyber-anlage.de>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: pl2303 : unknown device type
Date:   Thu, 29 Jul 2021 15:55:48 +0200
Message-ID: <4913832.LPSoa04KD1@cyber-bucket>
In-Reply-To: <YQJ+pLPIGc4Qwrf8@hovoldconsulting.com>
References: <2560053.x2KRyp2eMa@cyber-bucket> <YQJ+pLPIGc4Qwrf8@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6591134.GnlnUSDxm1"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--nextPart6591134.GnlnUSDxm1
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Chris <chris@cyber-anlage.de>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: pl2303 : unknown device type
Date: Thu, 29 Jul 2021 15:55:48 +0200
Message-ID: <4913832.LPSoa04KD1@cyber-bucket>
In-Reply-To: <YQJ+pLPIGc4Qwrf8@hovoldconsulting.com>
References: <2560053.x2KRyp2eMa@cyber-bucket> <YQJ+pLPIGc4Qwrf8@hovoldconsulting.com>

On Thursday, July 29, 2021 12:10:44 PM CEST Johan Hovold wrote:
> Do you have any idea what kind of chip this is?

No, sorry, I don't. Do I have to open the device to check? (I'd rather not... 
I'd have to crawl into the attic to get to it)

cheerio,
chris
--nextPart6591134.GnlnUSDxm1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEn472JWEQLcP1NoSxpPnvy7Wy1NUFAmECs2QACgkQpPnvy7Wy
1NUYAQf+IsHFksiTS7JJBTE9wfgBM/RLauCNWLTbE7fuLPSznHplNmCbIoijzFEI
W+1DEpdPc6dHU6bxpO3qTgp48bmBvbI5PO60lr/Sl00OcW6+I/8X5rZQHPJB29Mi
u5WH/02kUK2LaOvKohtrg1dgz6Xi0ACUsF0ngJW86NsOW/snkaUYqAbcLspGGfLK
di7pG0j1Kf1V5ZfzGjZ6qE37oYEMXLagdOliapxSxUAZGPnEzuErHronzQ4FVzQS
a++8tBL0mu7g0u4i1DrkD2Mgim17UMC033Gr1xlRtZY9EdHAmpQ1Pryu2XcvxIdS
Ktx/jrLrvqggMEgazPmc5MOXKr3u9Q==
=ozdU
-----END PGP SIGNATURE-----

--nextPart6591134.GnlnUSDxm1--



