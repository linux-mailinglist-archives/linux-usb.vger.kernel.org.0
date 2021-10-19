Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D29433CB8
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 18:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbhJSQv5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 12:51:57 -0400
Received: from mout.gmx.com ([74.208.4.200]:34381 "EHLO mout.gmx.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232507AbhJSQv4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 12:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
        s=dbd5af2cbaf7; t=1634662183;
        bh=oM07xMdBVpT+3JAWT4TsvQk/NYHTzCl7WPFGaCNHuDg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ge+tI4JzaHuqw79ZHjHx8QpqifPFFNK2IdxIb9F4hGyIBcdSBl+xU6BEnvQSFWdZM
         tavu4zOQtHULaHZ58+CJEvu3OKoJq1QP1943NL1K96d7+nHXZKrFS4h+vot56JM0Rk
         OUrOTe06uUmyEcjdbxJ1utDwSVa5iM7NHUQxGaTA=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [2.124.36.225] ([2.124.36.225]) by web-mail.mail.com
 (3c-app-mailcom-lxa06.server.lan [10.76.45.7]) (via HTTP); Tue, 19 Oct 2021
 18:49:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-44e1c8df-a575-445b-a6ca-805886188b1b-1634662182985@3c-app-mailcom-lxa06>
From:   mark_k@iname.com
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 Link USB-SCSI converter and LUNs
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 19 Oct 2021 18:49:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20211019143229.GA1082114@rowland.harvard.edu>
References: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
 <20211019143229.GA1082114@rowland.harvard.edu>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:pzwMzj1sAELpI8KzURTZeJ6xdEGjhOQN9MJfniyIntH0DpOm9WB9DeteRTLvQQeUJBCuE
 D4ZPleXWss6198707Xb83SRpBFmuSyIa3QGnVohPZRYEeW6k1GD3wWrHibwQC68TyTEzj9SSmxzP
 a9obPikI1YbHCz3Ubvu7UF3Epr3OPhHKMk4FqmSpn6o4b8nUA9RfQMYyvfdK6+8n60OVbLBhmv6M
 zDgKve+h//UdI58CelOUYCWxDHAlW23NWWWNWhM7uwEktWaZSbK7f87kWXGHFkv3EF2g2BVhGRGQ
 s0=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0xX92zr7s3A=:Sla03tlHaJx2Pn82Bd91QE
 2nd/HPcNxK4j61M7ub45O9KSAUcg8GgHRn8MpjMFh6xm/exmNPnurWWh/X/TwYyHUEX7y0Vbg
 NKPKeWGnB+0dRKUX5Hr+cuaKniP/piQCu255iTbIBhgvVop/8EuQW2B2k4T/in04206FMTzI7
 XyNyh1xdCuKtx8B8RJfJfO2yx9dvLzcrwqbNrwOcrdfQkavT5LP7ddUcx9N2k9UyqHVs295ex
 eynnw7x1DuUYLRJ+DPliw1M3uowZUZg9tVRHi25qOYLluPP/wmJr1j/seGAVeImMfLGPfm2CE
 6pzue1MI2PBWSlzgDwWGURY++T995rw/7cX+5ygeKOAbBvCaau5Lu4yc2xCjXRcEsSSE21Jt1
 csG3iv0s4HkSKxSGIGl4F6qpboOmg4N0qxxMsTVQc8sVvQ8yxyjuDbYV8sT95iBFdS/90Hydq
 7sycUDV4i3uQpau9XD28BSCKazeS6tm12vc9jiFmkyisujFxjo6cxv4WNGoAOkS14GkT9Pa1f
 YbKLe8R7g5BUk5plRaMLDls2oxInHKhihyQ0NtArV71QAYi7xI0XAGLL1yeems1Tk0VtmVSXt
 SeBECqQyzbvcqM+bo/75333LTWdXkG/+tidIWI4exYQJACuA9EFmoTnui+fkQm/9esyrxHbGK
 LbUSGOzD0hvjd77LwkDwe7+mQHSSpZBpXlHafFYYuVd7D5w0iNz0u318NgNf8hjNounCZofPe
 nI06+Z+KtcDMXqgVEV2mAfW2Nddpz04RqjuLvT8lTyZ7a6X51wIvwftem/5xUfgJORV6xfwsR
 4pbkVfi
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tuesday, October 19, 2021 at 3:32 PM "Alan Stern" <stern@rowland.harvar=
d.edu> wrote:
> On Tue, Oct 19, 2021 at 12:15:09PM +0200, mark_k@iname.com wrote:
> > I have a Core Micro Systems USB2 Link USB-SCSI converter (07B4:0380).
> > ...
> > However in order to access multiple targets and LUNs, the USB2 Link us=
es
> > byte 13 of the command block wrapper in a special way.
> >
> > Normally CBW byte 13 has bCBWLUN in bits [3:0] with bits [7:4] reserve=
d.
> > The USB2 Link expects the target ID in bits [3:0] and LUN in bits [7:4=
].
>
> Why on earth does it use such a non-standard protocol?  After all, the
> USB mass-storage specifications have been available since 1999 or
> earlier!  And they haven't exactly been kept secret during all that
> time.

The bulk only transport doesn't have any way to access multiple targets.
In theory mapping the LUN number in the CBW to a target ID could allow an
unmodified driver to access multiple targets, as long as their IDs are
contiguous from 0. (At the cost of not being able to access non-zero LUNs
but most devices only have one LUN.)

Maybe that didn't work out as compatible as the manufacturer hoped so
they set bInterfaceClass to 0xFF not 0x08. Or maybe that was just done to
prevent Windows automatically loading its built-in mass storage driver,
so the vendor driver could be installed instead.

