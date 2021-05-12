Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4C637B971
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 11:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhELJnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 05:43:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230149AbhELJnB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 May 2021 05:43:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFB6361263;
        Wed, 12 May 2021 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620812513;
        bh=EcGVzhNa3kVMiKe9gvc14AAr37OrPaXHlWgmPgnYXJc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=uFFne6pJkGqsf7U9ktQZq808bFkMIDEomacQwKESGJUZ7UWhXXLtK2dmqAHsj/s+R
         83UX/43QwWjxpXjPXlUUNCtkY7LXKV/3LIqFtNPg7SseLiwizVUKltQibRd14/nDPW
         hV2nKBaoWwg914IPbtV3QSWnCfga/k0T9o4OyYUHDJ3vxCYzSbibv3+hk03nsjAHio
         TnUgTp4tEaxknyApsn8PomUDD4Rr1n5TM5cePNv5GhYtElhwjwoBF1yOJ4yO7jAlAv
         0toz8TxjQ7HkU1Ly1P5SQKkZvG4EryGTWzM1tttJxTRAPui6u3axpoLPzfCvvIqGdw
         FRI3rs18ySHWg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
In-Reply-To: <20210512093748.GA17479@nchen>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org> <20210510193849.GB873147@rowland.harvard.edu>
 <20210511025322.GA23868@nchen>
 <20210511191538.GC908414@rowland.harvard.edu>
 <20210512093748.GA17479@nchen>
Date:   Wed, 12 May 2021 12:41:42 +0300
Message-ID: <8735us8f1l.fsf@kernel.org>
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

Peter Chen <peter.chen@kernel.org> writes:
>> I suppose we could do something similar for the composite driver, for=20
>> gadgets that don't use configfs.
>
> Originally, I intended to do at composite.c to cover all gadget drivers, =
but
> I can't find a good way to use usb_composite_dev existing spinlock to do =
that.
> Since most of users already used configfs, I chose to fix it at configfs =
directly.
> If we want to fix it for legacy gadget drivers (drivers at drivers/usb/ga=
dget/legacy/).
>
> For .setup & .suspend, we could delay 10ms after usb_gadget_disconnect, e=
nsure
> hardware has triggered related interrupt, and we need to let all UDC driv=
ers to
> add udc->gadget->irq, in that case, the pending threaded interrupt will b=
e handled
> at synchronize_irq at usb_gadget_remove_driver.
> For .disconnect, we could use cdev->config to judge if the first .disconn=
ect
> has run.
>
>> But what about legacy gadgets?  Are=20
>> there any still around that don't use either configfs or the composite=20
>> framework?
>
> I only find raw_gadget.c that doesn't use composite framework, and it doe=
sn't implement
> many usb_gadget_driver callbacks, eg, .disconnect and .suspend. For .setu=
p, we could
> use above solutions for legacy composite driver.

IIRC the old EHCI debug gadget also fits the bill here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCbotYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgb1ggAnHiIn3Q4JGQOVtR45rQQE1pJIcyG0wce
MLrlElmWZnu/V1oisAIY+5jFgPVgEQqN1jP9A0P96BB5v95smqo+FB/NpIrCg2FZ
KvZ61x66yPhMv0bRa9D8FV3Stx+GHNUMPgkdHpMLIC5C3awi7LKjVzatZFEV5R25
/4SgG20/Y2M+IwMhZPf/WmL2DoZGtNnGCcx3CY9fnz5ZWNiFYNVlfESt0kjqp/L1
gb3nJUky+ADMAjAmDmdk2KMfXFc7Zh062bj++PcO/AMspDz6JmL8JHhgDnJfWHNA
UikjoMqd+lzDEwBbIf4ryJW6ndlRoKpgZFEW3eV8eovYKUx9N+nkzQ==
=L2Qu
-----END PGP SIGNATURE-----
--=-=-=--
