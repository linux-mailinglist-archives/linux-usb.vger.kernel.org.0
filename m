Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867672547F3
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 16:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgH0NHG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 09:07:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:47838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbgH0NGP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 09:06:15 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F8272177B;
        Thu, 27 Aug 2020 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598533574;
        bh=CsyBLCeNf0dkNDeBsjaGXYEf31dJgW32YFFFbCsA2wc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=wcR+WVOwPjKQ+JXSlX6qCnAnfdgQg94Q/pdSgb/kq8qkB3owraYDTO3MMspsU1TSf
         aUxr2eeIPammKlI/zd/u0B4BGQL1PyBJRLhfE7uH6fEsxc8aMlgKHecUE1SN84Ac0k
         NRntBhmq1wUNDUysLXdIV/1V6+uNOCeEc1eFmWZo=
From:   Felipe Balbi <balbi@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhenwenjin@gmail.com, sernia.zhou@foxmail.com,
        yanfei.li@ingenic.com, rick.tyliu@ingenic.com,
        aric.pzqi@ingenic.com, dongsheng.qiu@ingenic.com
Subject: Re: [PATCH 1/1] USB: PHY: JZ4770: Fix static checker warning.
In-Reply-To: <20200825081654.18186-2-zhouyanjie@wanyeetech.com>
References: <20200825081654.18186-1-zhouyanjie@wanyeetech.com>
 <20200825081654.18186-2-zhouyanjie@wanyeetech.com>
Date:   Thu, 27 Aug 2020 16:06:07 +0300
Message-ID: <87mu2gi6gw.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.com> write=
s:

> The commit 2a6c0b82e651 ("USB: PHY: JZ4770: Add support for new
> Ingenic SoCs.") introduced the initialization function for different
> chips, but left the relevant code involved in the resetting process
> in the original function, resulting in uninitialized variable calls.
>
> Fixes: 2a6c0b82e651 ("USB: PHY: JZ4770: Add support for new
> Ingenic SoCs.").

These two lines here, they should be one line :-)

For the Fixes: line, you shouldn't worry about the 72-char limit. Also,
when resending, don't add a blank line between Fixes and Signed-off-by
and since this is a bug fix, it seems like Cc: stable is in order.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9Hr78RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb2NQ//aIT0yosGqzDLShjKlr3XLVh0fMR0srEn
KH0AUMPmQ/c7wiibmr/k/md5ZYflP6bi7P/qU6kOp/sqGeQ1VKt6LYAswohPfeoc
TbyVITONa3wSco3qu2w0wQWdmqayUV4O3S6Oi9Qn/Q/vID2LWOchgxytL/O4f500
ifoWVqJci03JUXh+HP72CTZ990WdiwZLpWHzNtQSiaHnlciWuVhzu1Mu0MTbFsAZ
HXZIzHeEhcJpktb+BCeyMA3aHyz07XLP2go6f45y0XgJIoiGSxLgYKx49hg2pm+r
NEWdlNRCr6r3eCAPC2jwIQaPv5enffyVexdywg2MLF09mjGnGa9LgErKzUOno56i
RMcNacUlVkyFX0CDYUIhV6oNXaWZVhSdiJFEBfXyvkXjRB1HiM6fOwRgGg1USkah
xGdp+4zGfpZ5d9XuQQGJMLnG7yCfJi92zGvByWfpc8QYLnPeJv7sNi/cWP4AETk4
/2HJKW+O4ZV2+tkpqSKgruv6Us/O7FTG8gI4GHLuLqZyu4d4fUgOTa1UobhNU6WX
tNe/oYywGQAQ/9bCXebZFTNciaiR3j/XtjrrW949ELQguHSEfN1v2lJlyehyh6GS
BLZa1n6+FdnzkLmAUd+RHJwbMm5WDTf6eGD4JIZzGU4NHOHN1jdvSDnIZENlifOM
C8Mf0iEPUjs=
=sN0E
-----END PGP SIGNATURE-----
--=-=-=--
