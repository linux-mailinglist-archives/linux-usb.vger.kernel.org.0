Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A1C36D5CB
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 12:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239438AbhD1K3I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 06:29:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:45804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230057AbhD1K3H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Apr 2021 06:29:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22D4061412;
        Wed, 28 Apr 2021 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619605702;
        bh=2zapyPPp0lc/R+Dw+AEuiX8i+BqKzUr6n7RbRDQAltU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dz/FkXVpkFjOE1R/YJmZXKzrXXHZKnKj+edOnNA2EWE20jVdKISqBx60/cxGa6fNP
         66heaUleu8Ip+IykDebZ6yfuwgeinTfRSy70BFFM6kublc+PD4MqmWIs2CIpi7vmYG
         jEl0GeIHumWhph1zVqNRCpyDc3dqWOrL5WIrfQEoA4S9sG8ya3RsNEKUGV8mWKlzdH
         wqX/oDd0e38KH/wjthpaorJUIKFU1GXMKbSQWlZIt3f1WBd8wv0V8GgH6dU7P662lM
         cY7adq4HCaub2VE7gT1MwkJDRIbYnI16ANBDwuxGa7IN9DSwg2u2/ccyV6PUOuk9WX
         bxkcjldryausQ==
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
Date:   Wed, 28 Apr 2021 13:28:16 +0300
Message-ID: <87eeeuk8jj.fsf@kernel.org>
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

Jack Pham <jackp@codeaurora.org> writes:
> The device event corresponding to End of Periodic Frame is only
> found on older IP revisions (2.10a and prior, according to a

you're reading databook for dwc3.1, right? Remember the original support
for the driver was on dwc3. This was always called EOPF back then. We
should maintain the name.

> cursory SNPS databook search).  On revisions 2.30a and newer,
> including DWC3.1, the same event value and corresponding DEVTEN
> bit were repurposed to indicate that the link has gone into
> suspend state (U3 or L2/L1).
>
> EOPF events had never been enabled before in this driver, and
> going forward we expect current and future DWC3-based devices
> won't likely to be using such old DWC3 IP revisions either.

We still have original omap5 devices, running on revision 1.73a
around. They'll remain supported for the time being.

> Hence rather than keeping the deprecated EOPF macro names let's
> rename them to indicate their usage for suspend events.

what do we gain from this change? I mean, in practice, what changes?
nothing realy, so why should we apply this?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCJOMARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY5PBAAzkbQf9ZIfWmLWHxeYoJ4qdaoQeaDH1/R
Uq6zgbR/JLGddK1Nw/bPOO+LbPF08pvRxPiUFdtn8iyjeSib9Jh4kPOHEj/r2uEv
9B4Z49YTls55bRtRNjJ2B9A8ys41dt48dDBOrRdzPBi6VXHqJ4R/fXklKXyMN5+4
O+sdBxcK5lwBImQO4QTcVbeLQDFHq8cw8/nSm7zUokHFPtONphRxgZH+HBGQE1rY
Da0M+aE1xCNH4tdNYJTLMWU9ReEo05axnS4zMl+An6r6k6D2+jX5xMUq5bnzg3Fu
Gpy8iPKaSF0N5Rktlq4TqHY2LSfp3TtV+QW+Ec6E2nb6PHEL+kjst5ZvyA8CuuCs
uEiye/kUTLyTC0sKe7mtv7iFekpUgkDoNvSnDGQZ6CDL76ts9rMufRbOx86BAGdW
jUVyu/L/FqHSl6kWI3Ida9kkb/1uvEfCV+uPn2gvOGvRbcno2BIrFLF0X4965Qiw
tgfGGPHW2y+a80KvmxycLFUWqSdCv803DYS3FaB6zCfBBNyFm5OWVxUm7AFwnERS
bpmMQyQpnifE39xOzXZ+68izogAQ6kBQoso50hRXukyX4WBmxwhmuu0+D4CN5Dqm
F5ID0vUPLk92ackrepw2eHMS4pY9wK68LHDD9Joa2kjte3Q4i+iYaENOrm7PG/8L
BgZMHj7FU9o=
=y2va
-----END PGP SIGNATURE-----
--=-=-=--
