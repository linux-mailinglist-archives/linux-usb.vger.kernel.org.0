Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B82936F73D
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 10:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhD3IkB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 04:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:44174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhD3IkA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 04:40:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A078613EE;
        Fri, 30 Apr 2021 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619771953;
        bh=7eo8AjAD1mt+H9bOT01J453tG5xz5ZKw2SlYSv4VmBI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=h0eLkAqrb/bJhiy/0yspa4T1uiQHX3ksA4Rs8ULMjBm/w7qzHw0oKx5ZEf1cRXbCG
         ctlneFLpyvzEejMgqA986cRO1fQzMivoH0eUXO1Go2NYCley9Vv7Hi+uQGq1R0mHej
         BCTiniLxE9RrXDJlksPvVb+WhHfAWc3iyv4y+Eowv1/Ni7Ej6bvxweHioICtjozKOl
         CaCsr6K1PDCyZbUn5LpJb4e74vbOeu2tiuLw6DFFXtZF2tRF17DNoeCRjaMS5/nKmf
         DIYeCXwSFdECIgzkhoZ68d1EqhMio5VRZ7XpAYBMFth0ywDskjTiCyRijZ49wV5Flv
         5uLwh6zyI3/lw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [PATCH 1/2] usb: dwc3: gadget: Enable suspend events
In-Reply-To: <20210428153458.GD20698@jackp-linux.qualcomm.com>
References: <20210428090111.3370-1-jackp@codeaurora.org>
 <87h7jqk8xk.fsf@kernel.org>
 <20210428153458.GD20698@jackp-linux.qualcomm.com>
Date:   Fri, 30 Apr 2021 11:39:04 +0300
Message-ID: <87wnski2tz.fsf@kernel.org>
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
> Hi Felipe,
>
> On Wed, Apr 28, 2021 at 01:19:51PM +0300, Felipe Balbi wrote:
>> Jack Pham <jackp@codeaurora.org> writes:
>> > commit 72704f876f50 ("dwc3: gadget: Implement the suspend entry event
>> > handler") introduced (nearly 5 years ago!) an interrupt handler for
>> > U3/L1-L2 suspend events.  The problem is that these events aren't
>>=20
>> look deeper. They *were* enabled. We've removed because, as it turns
>> out, they just add a TON of interrupts and don't give us much extra
>> information. The only reason why the state change interrupts are still
>> there is because of a known silicon bug in versions < 2.50a. That's all
>> documented in the driver itself.
>
> I did go through the commit history. Are you referring to your change
> 799e9dc82968 ("usb: dwc3: gadget: conditionally disable Link State
> change events")?  If so then it sounds like you are talking about the
> link state change event, defined as event value 3 and enabled with
> DEVTEN bit 3.
>
> The "link state change event" is *not* the same as the one I'm referring
> to in this patch which is documented in newer revisions of the databook
> (both DWC3 and DWC3.1) as "USB Suspend Entry" (event 6). It's described
> as only getting generated when the link enters U3, L2 or L1 states.

heh, I need some sleep, apparently :-)

>> > currently enabled in the DEVTEN register so the handler is never
>> > even invoked.  Fix this simply by enabling the corresponding bit
>> > in dwc3_gadget_enable_irq() using the same revision check as found
>> > in the handler.
>>=20
>> More importantly, *why* do you think you need these interrupts?
>
> Bus suspend and resume are useful conditions to be notified about--
> that's why we have the .suspend() & .resume() callbacks in struct
> usb_gadget_driver.  But currently the dwc3 gadget does not have any
> interrupt generated for suspend, and as of now the dwc3_gadget_suspend()
> does not get called, so it will never invoke the gadget driver's (let's
> say composite.c) .suspend() routine.
>
> dwc3_gadget_suspend() is called from two places:

understood.

>   1. dwc3_gadget_linksts_change_interrupt() - which is the handler for
>      DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE, the one I believe you are
>      referring to and is only enabled on revisions < 2.50a.
>
>   2. dwc3_gadget_suspend_interrupt() - which is the handler for the
>      DWC3_DEVICE_EVENT_EOPF (which I'm promptly renaming to
>      DWC3_DEVICE_EVENT_SUSPEND in patch 2/2)

Right, now it all makes sense. Thanks for clarifying.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCLwigRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUiK5gf/eNV0N41+/zNUKRjSUftXOe3yxSdoUW/d
Ma3d/uKxYPtWL5J3qEubIjiKcQn0UI8nsUq6RasSyM0nX2gcrGVR6WdsHxsKoPKa
7O7yV0tD/EJSZLCG42kK3u0Posi8eePCc5Kjujcbgiy+0i4SfOeOG2F0rXBclNQ9
D8e3zfrglVUkKk0HUb7b6SXEInjNIDd1Hw2swi94cwPu3m+6fWZc6i3nVN1JKHHc
jza8MsIZvo1x7E2q6nqcfcNETKaysGxZPOx69z3b1abLK6yDroQMUU9csxpP1WFj
CGQpcnAmJI5rlK0p+7dY5gf/ZhTZwpwhhMuK1kW0Ef+xdwbbRu/3kw==
=I5I0
-----END PGP SIGNATURE-----
--=-=-=--
