Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C9536F73A
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 10:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhD3IiI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 04:38:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhD3IiH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 04:38:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23DB4613EE;
        Fri, 30 Apr 2021 08:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619771839;
        bh=pGCjbgzCUk914LR4+P2qHmNVHF8pe4ErGf0kg6i3StY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bx5mx/nRjsYxQTXtJl707mO2Zx78BLTv7O0Prv86Cm4o/gJadKsK5c1J1Sq/LyGaY
         Yryzw3WEM6Kp23W7aXSiaCwtHiO8a1ot9HUDUf+hGthXf1um1o+Tygy6niir3SRTUY
         52hJFfxa7251a/tsO4rVnptJ+A0RiQX2SDgaOmRKHoH7Nx0961+2jC2MSbM++fHhUO
         nKl8G8CS6EVGEXJ+1dspdXEYtkdd8oW4w0H7UMBwPi/al6I3JxEIzIh9KKmoE7mDZj
         fsrniq4myW0gyZcCPR6eMGhYIDV+WhNqnsO9COr475uj2cBPft0lVxP3Gw6hAW2ffW
         4oFTN2dZ+7oDg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: Rename EOPF event macros to Suspend
In-Reply-To: <20210428090111.3370-2-jackp@codeaurora.org>
References: <20210428090111.3370-1-jackp@codeaurora.org>
 <20210428090111.3370-2-jackp@codeaurora.org>
Date:   Fri, 30 Apr 2021 11:37:06 +0300
Message-ID: <87zgxgi2x9.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jack Pham <jackp@codeaurora.org> writes:

> The device event corresponding to End of Periodic Frame is only
> found on older IP revisions (2.10a and prior, according to a
> cursory SNPS databook search).  On revisions 2.30a and newer,
> including DWC3.1, the same event value and corresponding DEVTEN
> bit were repurposed to indicate that the link has gone into
> suspend state (U3 or L2/L1).
>
> EOPF events had never been enabled before in this driver, and
> going forward we expect current and future DWC3-based devices
> won't likely to be using such old DWC3 IP revisions either.
> Hence rather than keeping the deprecated EOPF macro names let's
> rename them to indicate their usage for suspend events.
>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCLwbIRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhQFgf+KaHpMEbng8e8942mBMCb0MnNDYJN5lOc
ovbDqpA3Nbid9vsgTALfXZ7lTlW9DAdYooOpcPJ/peK6RORQO8oNwjii/SEIzBnW
hZkIFMu/XQmH/uQYV2VvDGd3LcKAMM+wl/Tpsi9qzhbI+nqshIHfnNO24kVQ/iMs
XmlytWB8X053PJ1ZoAghx5l7cBpxBjUHN04DQOXbxeGMK9YBYbgsS+rYjPvDUplc
OU/qYNUM0jUVpwD2BH2qO0IRI8HJ8JPXe6ocftDEQj5F6qi4lW7DDcbm2MvdEAp3
uJeO2VBhCtdz4Y14RQadNxWcJ6lGAXi0gSGoT+nnUPuKgskNSGGv5g==
=ke28
-----END PGP SIGNATURE-----
--=-=-=--
