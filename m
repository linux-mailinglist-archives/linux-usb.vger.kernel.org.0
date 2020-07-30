Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE802333B3
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 16:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgG3OAu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 10:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgG3OAt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 10:00:49 -0400
X-Greylist: delayed 427 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Jul 2020 07:00:49 PDT
Received: from zproxy130.enst.fr (zproxy130.enst.fr [IPv6:2001:660:330f:2::c2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59CBC061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2020 07:00:49 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
        by zproxy130.enst.fr (Postfix) with ESMTP id D0BC3121669;
        Thu, 30 Jul 2020 15:53:35 +0200 (CEST)
Received: from zproxy130.enst.fr ([IPv6:::1])
        by localhost (zproxy130.enst.fr [IPv6:::1]) (amavisd-new, port 10032)
        with ESMTP id 4aX1d1dOoPkr; Thu, 30 Jul 2020 15:53:35 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
        by zproxy130.enst.fr (Postfix) with ESMTP id 5C51B12167B;
        Thu, 30 Jul 2020 15:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy130.enst.fr 5C51B12167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imt-atlantique.fr;
        s=50EA75E8-DE22-11E6-A6DE-0662BA474D24; t=1596117215;
        bh=0B49j/tKXINXMw58I5d5ImHZrIuNX/+HHpyayp6M+eo=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=AV90oc4JT9ytEwWMs9YDSAi/lOnwAkfxKQKRh1Lq30GBk4JKGMQPyrG4PIjS4/tVS
         QawemDPmJnMps1+22ZAUPAJrPycrWl4UM3LQfxvyrBPhiK5GoJVHVwYlPQ6m+RxBdq
         RCMZCTJ76N/jqD7TX52aFVIeG1CojH/2+z24Zi70=
X-Virus-Scanned: amavisd-new at zproxy130.enst.fr
Received: from zproxy130.enst.fr ([IPv6:::1])
        by localhost (zproxy130.enst.fr [IPv6:::1]) (amavisd-new, port 10026)
        with ESMTP id kUKIb60Ix3dP; Thu, 30 Jul 2020 15:53:35 +0200 (CEST)
Received: from localhost (unknown [10.29.225.220])
        by zproxy130.enst.fr (Postfix) with ESMTPSA id 30C67121669;
        Thu, 30 Jul 2020 15:53:35 +0200 (CEST)
Date:   Thu, 30 Jul 2020 15:53:34 +0200
From:   Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>
To:     linux-usb@vger.kernel.org
Cc:     miguel@det.uvigo.es
Subject: Patches to make multicast proccesing on CDC NCM drivers
Message-ID: <20200730135334.GN1496479@bartik>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nrXiCraHbXeog9mY"
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--nrXiCraHbXeog9mY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Miguel Rodr=EDguez sent this set of patches two years ago to fix the lack
of multicast processing on CDC NCM driver:

https://www.spinics.net/lists/linux-usb/msg170611.html
https://www.spinics.net/lists/linux-usb/msg170603.html
https://www.spinics.net/lists/linux-usb/msg170567.html
https://www.spinics.net/lists/linux-usb/msg170568.html

I've using a DKMS version of them, available in
https://github.com/stbuehler/fixed-cdc-ether-ncm/tree/wip/patches
since more than a year ago, and they are working fine with my Dell D6000
docking station. IPv6 connectivity is broken without them.

Is there any chance to consider those patches (or what would be needed
to make it happen)?
It would be great to have them upstream!

See also: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1779173

Best regards,

 -- Santiago

--nrXiCraHbXeog9mY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRZVjztY8b+Ty43oH1itBCJKh26HQUCXyLQ2gAKCRBitBCJKh26
HczYAP9Ihg7L+Tjv5ouUM/t+LMaU8qSl0vC0hKBonc8jYUFfmgEAhZuKCobOoTlr
g02rD6KFt6ba0l7pogRmRM+wGknJaAI=
=sjTb
-----END PGP SIGNATURE-----

--nrXiCraHbXeog9mY--
