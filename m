Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8929368CF0
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 08:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhDWGIz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 02:08:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:51446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230113AbhDWGIx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 02:08:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC009601FC;
        Fri, 23 Apr 2021 06:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619158097;
        bh=SSqj2JnzmkW2aMxdXtj2OVBktUpkiQWfypbg0gazn9w=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fr9mD77fWXpIWeQKEfNSfv9aFogRbewgdvwIigP1ziXcrArQeRRhxic4fMIe03Oo2
         bhyxa41EYkUKFm70rFluQE0Uoiti26+JnKiUTaDb2I4B/gB4t8W+bnFyonS7bAa3Hm
         ZAn07JKZLVMExgRcw0157D7MssnkcbHxZtpjJoKELMDzi3HVWIP4mjQFktOpwJZxPh
         BM6jTVVdEbGZJ69y5ZkTevZU5KUEtiFLT9pXpy2OvmiItyTjt11/ZAme+DYmOpGkJL
         xWf0PcSjrE5G3fRNGsR6VShi4DoN4MDUUuodOv+1F//pdI9z3ai9ZK8DWCbnaYJD1W
         6CO4UdRd3l50g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/2] usb: dwc3: Capture new capability register GHWPARAMS9
In-Reply-To: <f76cc4a9c8c4ab325f5babe03c57b039166360b0.1619134559.git.Thinh.Nguyen@synopsys.com>
References: <cover.1619134559.git.Thinh.Nguyen@synopsys.com>
 <f76cc4a9c8c4ab325f5babe03c57b039166360b0.1619134559.git.Thinh.Nguyen@synopsys.com>
Date:   Fri, 23 Apr 2021 09:08:10 +0300
Message-ID: <877dktmt2t.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> DWC_usb32 introduces a new HW capability register GHWPARAMS9. Capture
> this in the dwc->hwparams.hwparams9 field.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCCZEoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZvXw/7BcCjqB4leZDzcEHX3BbNF0B5MLVNZ2dg
MG+5gQnxCeB5mtEbKbqywjU2Piu5J7TwQlIulAowKj39NpyeipaOa4H9Fm+VQ+gi
3LAHZfpcJu3HPXD3kp4RyfzCn3POIu2GsrW37pDVuAu1rdMqgntx5aYwJZqUdJAx
i9eEY2PbO1Qv4KVLGlplQJbLbqmOot/2L9F1KD2jNcMp24JTnjf2Izn9g0fuoJmV
KUYxLr5ZyZOpeuTg/GqxUn8kd51cZbugx6B94P/1/7R7Axeglk27566kijSiN190
aTJI03mWRRlDNiNRyPhVODRGi+DnzI8ca8Yt/Fwdggvyg/heiy4UGKJYT9AknPNB
70TpfYYXhF50DzVcm2ApYOze1KDK+2g4SwuCpLqPXPJngpGZu9xTY9vWg5/8fBLl
+2AugEjTzl9dAI8mMngsP2eSxAkonfHbIq0IM6UXYBmFZnntPSORoE4vmE5Y1wXm
HeUaRToCFjRYlPBOXy0tWkttXBs4ZxL76Vldr0cI/zbTB51k/BIVmblQ6kXil4HQ
SQEjEq0dbZhxHSsyN1pwYQnQWTEoID6Mcp/CrmHYpkvZbJSFl102S/aiBGg4p6i9
zC46j5dLLC6kLD6FYxPuh88dUwHw4gENbUoww7tJnPTCcVyDaO8XzgPl3bns7UW5
RlZwZW+ysN4=
=Toug
-----END PGP SIGNATURE-----
--=-=-=--
