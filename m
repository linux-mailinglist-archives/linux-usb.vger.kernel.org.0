Return-Path: <linux-usb+bounces-5157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C896D8300F4
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 09:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DDEE1F25503
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 08:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633B0C148;
	Wed, 17 Jan 2024 08:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="HDmelU8d";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="+kCl4rCy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C68DBE4B
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705478562; cv=pass; b=r/jPuGiQ/FeSV0sQanmPPc1ACQw1xgShK0I6RH3f6GhnQtbHw53WOgK/hGGI2MFQQlwTBuFCcFkwZsLDCj8K5p0AWsbDkyyVmwv9saJ+bz+Db7pWnyK2psfMxiGnfcQjKiv3gV2LeLs7EjHbmno0saVCkRk/z+0xOyhOJ9KJDYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705478562; c=relaxed/simple;
	bh=eX0J/caprb2Zl05VzYGw2Py53uRAiNC9CjfWBFs99qI=;
	h=ARC-Message-Signature:ARC-Authentication-Results:X-RZG-CLASS-ID:
	 DKIM-Signature:DKIM-Signature:X-RZG-AUTH:Received:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type; b=WVFJSDaNSWR6Yz9oyHgpgVt5qNyQayRitgjgZAHHi1ZeTsGgs4AUUz6XIboDtq7T5w7IFEB+fmW5/e5Shyyb4jtw/aqchwyoDTr3u1Az+P3b1svKfsSfh5JSLtJrlEIznILAopueVZU7YcCK1FQUWv0aqIGUdY8ChzSxHbnX9aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=HDmelU8d; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=+kCl4rCy; arc=pass smtp.client-ip=85.215.255.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
ARC-Seal: i=1; a=rsa-sha256; t=1705478370; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=hr9obVyKIsHGCKeDspHiUqXSKQwndBRK1/R14Jovn9X0OgFN+axynO9EzISs+nmwDb
    8hjn7EniMZuaK1oodM72u0VSnUHD0YaXmwLvftdpeqeWIK4XgEVZnepOeS5JyC3FexW6
    nczgvgzkS1Zk8aaZa948RkjYKDBeVYiVmXpgODZOgAwHyAQZbU+LI6F/nmpZj+jNg2S5
    Eot4KUpQiINxQvdIH5Viq6sQ/Dk7Hx3/C3BKiPY/3VEPkzJBO7NnHWCHfMoD+K3Gf6Dc
    wl0BKya3JfE00aAq7z0tgtkMGoBTLVXpw9xIAmILDQucEVP/4QRo+uFMho77g6A0EMAd
    NA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1705478370;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=C/e/6pr06up1Au15DSEodgsnFzrzs/mFKtRoOefR2NY=;
    b=JyuldSon6nuLZpeLk7bOfIcEw/qAE9NIIMt8Pn4gFI21kXmUBduFhX35oo+GfVX4bR
    3u88D8KHsvuU3GA1/hp+TqDTWFT+PRfKTNljAI/RgbofFyw6DlVRCcjc4j1+26+rbSfv
    apbissxjUFK0tKgVoKqzgupxa2K4z6429V0Af+ZZmQLd3XeQpAzGDUTcHpHYjEGBK+7n
    VrQQ1g5iM1kEtmXyZCtvAL5QhekQaIK0N24xUW0wl446qfe8OBVuNJtkMABFBBmhv9qQ
    GQZD0n+EH6sCTexop7UkQYuqmVsacPSAUv3vIbOMsRlub4nEooCUhqJj7MdmdzroVQXC
    LD9A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1705478370;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=C/e/6pr06up1Au15DSEodgsnFzrzs/mFKtRoOefR2NY=;
    b=HDmelU8d2uFRveJxt1r+6J0pg2z2NHsuQX4GruoLDZQ7zw2lt7gju+jpP0jEh5+mKU
    7gSbtqqo4jUC9ak8mtySJV1wib0jLcudXquTD2jI7DI5nBpyKIkLGxd3QLxr1wo/kIeM
    BDmiC8pJlR66h9slO0DGjCl4jwUU4bdkdQSEqIAaTG6yQNEJgKJdvirVX3g4aOqtdrtj
    iQ6dlHnLsSkDgWiovVnT3ZPT8t8yKdh+FFMoY1B2wKiQpcFEOsN4lEpfe80AQxc/03l/
    7pR154c7atqpFHt0n1L4e4rErCnm29lX9QyZL7tDljIbC62lJP7IoLmDHXMazTgeWuVg
    w4vA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1705478370;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=C/e/6pr06up1Au15DSEodgsnFzrzs/mFKtRoOefR2NY=;
    b=+kCl4rCy/aYDdRUVr/rdZah4w5Ryd36ryJxBjEYUZQUsHTBPxpIh7XHMCbv4px4FwY
    /PnSNkyC80HL3PespDAQ==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPD3fBonz7dJLi1xPuooJ6RC45Y4g=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.10.2 AUTH)
    with ESMTPSA id c5619e00H7xUTtY
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 17 Jan 2024 08:59:30 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: Greg KH <gregkh@linuxfoundation.org>, Lars Melin <larsm17@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: "SilverStone TS16" external SSD enclosing needs an UAS quirk
Date: Wed, 17 Jan 2024 08:59:29 +0100
Message-ID: <2270283.o7ts2hSHzF@nimes>
In-Reply-To: <fc14c873-04ee-43cd-8328-b4e5b03e0230@gmail.com>
References: <3750407.VQhiAETyHQ@nimes> <2024011630-convent-slouching-ce10@gregkh> <fc14c873-04ee-43cd-8328-b4e5b03e0230@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Lars Melin wrote:
> 0bda:9210 is a Realtek USB 3 to pcie chip used by umpteen
> enclosure manufacturers.

SilverStone TS16 is not the only one that makes problems. There's also
  - Sabrent NVMe M.2 enclosure (Model EC-SNVE) [1]
  - UnionSine Dual Protocol M2 NVMe to USB 3.1 [2]

> I have got one from Orico and it works ok under both linux and MSWin but=
=20
> it can be a bit finicky if it doesn't get enough power, it may for=20
> instance work well with an earlier (slower) type of NVME SSD but not=20
> with a later faster type unless you provide external power to it (usb=20
> hub + power adapter).

So, the Orico one has problems as well. Do these problems disappear when,
instead of changing the way it's connected to the computer, you add this
quirk?

> Slowing down all RTL9120 already in the market with this quirk is in my=20
> humble opinion not a realistic solutio.

What else do you propose, for those of us who buy this hardware (=E2=82=AC =
50,
it wasn't a cheap one), connect it directly to a computer (through the
vendor-provided cable, to an USB-C 3.2 Gen.2 connector, as in my case),
and then experience 1-2 crashes per day under Linux?

Bruno

[1] https://ubuntuforums.org/showthread.php?t=3D2466059
[2] https://forum.level1techs.com/t/nvme-to-usb-3-1-enclosure-buggy-in-linu=
x-rtl9210b-chipset/199752




