Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471D729A66D
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 09:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894617AbgJ0IVc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 04:21:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:42912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2894615AbgJ0IVb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 04:21:31 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2633320878;
        Tue, 27 Oct 2020 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603786890;
        bh=eoerEQwzTU3BtGUH6HvCc9OoDxXZ3eKxiuuFqwMZQYA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kQB9VU01KRTVaOvXv9v4e569kiY0cOQc2b8Pw/YukxTPsM8SvJyS76yNu84oNgk4F
         QcmHnoz9kSudEwgmYOI2rMwFLTXkPsRqS1A/Qf3t+Lk5HxLz4hMZiwtmJWdOoQgZ9f
         3CnGPDC5UcN2W24dDUJwTos6AmESwFgvGmLyuQlk=
From:   Felipe Balbi <balbi@kernel.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: [PATCH v2 01/15] usb: dwc2: Fix/update enter/exit partial power
 down.
In-Reply-To: <20201011135059.76B73A005E@mailhost.synopsys.com>
References: <20201011135059.76B73A005E@mailhost.synopsys.com>
Date:   Tue, 27 Oct 2020 10:21:23 +0200
Message-ID: <87d014dqpo.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Arthur,

before I review your series, there are few things I'd like to point out:

1. A single patch should do one thing and one thing only

2. Every single patch should compile and work on its own

3. When sending a series, remember to include a cover letter

4. When sending a series, you can rely on git to produce a thread with a
   cover letter

	git format-patch -o series --cover-letter HEAD~15..

5. Remember to run checkpatch on every patch

6. Please, read https://www.kernel.org/doc/html/latest/process/submit-check=
list.html

Artur Petrosyan <Arthur.Petrosyan@synopsys.com> writes:
> - Updated entering and exiting partial power down function
>   flow. Before there was a lot of confusions with core
>   entering to partial power down in device or host mode.
>
> - Added "rem_wakeup" for host exiting from Partial Power
>   Down mode from host remote wakeup flow. According to
>   programming guide in host mode, port power must be
>   turned on when wakeup is detected.
>
> - Added "in_ppd" flag to indicate the core state after
>   entering into Partial Power Down mode.
>
> - Moved setting of lx_state into partial power down
>   specific functions.
>
> - Added dev_dbg() messages when entering and exiting from
>   partial power down.
>
> - During Partial Power Down exit rely on backuped value of
>   "GOTGCTL_CURMODE_HOST" to determine the mode of core
>   before entering to PPD.
>
> - Set missing "DCTL_PWRONPRGDONE" bit when exiting device
>   partial power down according to programming guide.
>
> - Added missing restore of DCFG register in device mode
>   according to programming guide.

From=20a quick read, it seems like each of these topics deserve a patch of
its own. Could you break this down into smaller patches? Also, you have
colleagues who have been dealing with the community for a long time,
perhaps ask them to do an internal round of review before submitting?

That may help you get your patches merged in a timely manner.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+X2IMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ4kQ//Szr8CsN1DzT/W945c9vG9Wy9QmFVO/3k
VHCYvAJGCaMfpNqzg/beH0DyTI/IkEXn6Nl6k/Wtdl0r/4DAQrKSnWOxfcSGybRL
RDhd7aeNNYi1CEN67Y1TFR6M0oUWL/Sjt6On8fapVEwq2RjYj1WcWIgq2rjA3YNT
PwNTblBxhZmRn+oIWy1j050+7D+ExgazVPMnOa59Mwr+piNNho0ebBV2ekNY/J7U
B4EcMxU3rnQDokPulMssozSKhDRGSGVcB4xIuXhk2EBUrYFpgpy2ajgM/Shi6UDE
84GTc7BZraHyAJdKfvpJXWz2VsoE+rBMmJPLdNoWHEQy2C5vhP6TeqrQvddR0drV
FLjAfBbT6C6aVmWmEev/8+WBSJXu56xzEt7JF0AEhpwZVdP/hlaegHOYM2/BLNfj
LonEHZBhtF7CQ4j9K/rL4TYWdvreyR/HgrY53/rAuyBmH4Nk4rb984772oMFaBpf
xy6PCvfpiBysnffOf1URiTIaa7HsxmLLamuJBdnkO4bLJ/ICtaY7bvSRlf7KGPjm
QsU/EmVzdNhlWH+14ZGgjbSn2OoR/KR/S9NgmgSSkZuCyO3tcYcngcmJuEgZ2oHV
8XvC6JSL1VlfuQsLEjymOAnZscygppsZVy8kXZKUQkh2VlQW26HkQTV0WeTDjWZ8
pL7miWoO+1I=
=OCu/
-----END PGP SIGNATURE-----
--=-=-=--
