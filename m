Return-Path: <linux-usb+bounces-17728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8689D2F22
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 20:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4113281B19
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 19:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4621D2715;
	Tue, 19 Nov 2024 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A39pw1gP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0761D4173
	for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 19:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732045913; cv=none; b=A9trdidK6r5yUc3mpUE5eeTcfw41IayqJ92MeTD7+B7r4HsIPASwbUbUI0K/JyVbaq9UsGhUsVQW391lBXyg1xSjt4xj1fwFQS7EwLeLDWtjh7YZFdSD+tQxd1WCIP34065sBSrJ+TIF23xHXkPdDVI0yGgXGg/T0zahiZJbB4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732045913; c=relaxed/simple;
	bh=KXa+eoFUc12fG76iugK4IT2p7IH8zXYilAXtExHtGIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaGJJhONHxGaf0QNG5IFtNk7ThQq88MGrPqHpayfB44BwbJ0ApL0eJyVsgjmW7M0nmLkLCP9z988EO2bJDmIvNNwGMfkOAmF5F883MWue9bA7PeeO8k6169+EkUqeyCtNed85pt6c1pZLegi779kQIlgEFIETkkZj2ndA2X644M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A39pw1gP; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7180c7a4e02so773049a34.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 11:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732045910; x=1732650710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su94kXgNiCFH+xXll+Lv5XmYAhVH4Bg8Arj5RyW6hhA=;
        b=A39pw1gP3xbHUg9843Uxs2zOeDviQHpSTD4ERnlfJnQn7qcq0RzRbOqteTJbNEw1gL
         hJzruydmhZgfnfxYC8KlHA+FG4dNpZO0x9POtE+R/Us/WybSvB8HPQo9BihvvvMIQ0Lh
         TfpewB/XJdDgEvykUxbkU1sdn7qfYe2V5xHrZPsY2ky6XBdvhDY0pq3xNVJo940Fu1nL
         0WdzDQtfAWwZIijIMTdFTq14L8Qs9HT7igDgUa8BBqQdMwqZAKkB/TJYqi92ULy3xnN5
         SfAJzcUP/Yc7I9OVCM8mfIcxPXUP1y4JAoED7MBySNBQ2Ifti/8tAxaEP+1mzpMHLjMX
         mYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732045910; x=1732650710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su94kXgNiCFH+xXll+Lv5XmYAhVH4Bg8Arj5RyW6hhA=;
        b=GyLMf89OSf7MBxtOXxGecQMwJuJx5cs7iY/7abAW8D3sf0oxDxvYHrOu7NwxwB4IJN
         nQr0lVgr8Q1K6ck+qmxPRMRMHDby4ZulTvBGVBNcOZXMkXQlzkqNBLEcG50YAQVZ+a6m
         C87L8q1Se82fiw5MhiJ7RIieMEnkU/Bpl79iYoWs5HvMqsJLbVNhTzAchSkVBviqXehv
         bWiVSmdpaWaYpzxZoM5Sx2C10noTOU6+gGQ3Adj2OHmhpg008YPSEVaRYT4Fm/S1Q2Am
         tkyb4GBRFmLxFPmZ6KWhbpBuTTDFL6DnT6ajw7BuFtg4jRu9FjGR8J8hj0bPFQEEOWCT
         FVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjpIE2RV2FJ/bIYYsI5DHdRCySPjlLbR4om8EDOwrJd6w6/5p1T9ToQogx/sB7OzmXBspJR5OS22g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyfjaPzQPymFS9qbew55hj8BB9mnOYgBev9Zau9vbtlCc7Efk
	GDt6MCOLJ8iuKPQKReRlAdgEZaXt5OwRiROmpWE/8FiZ7zaWJzb7tRBnz9NzI8ocn5cFrczS+dd
	1qfA6NCRKOFwnb3JRIzM7AtKNxbU3Yw/B
X-Google-Smtp-Source: AGHT+IGEVdUbm3YTTn6lDHGHUnsRk55H0HXENbTKU9xWAPnsdnpl95l3aoCx0sMEyjU0MhC2+Y2wI70Yyd2SAPsYF6s=
X-Received: by 2002:a9d:654b:0:b0:718:ad8a:e2ce with SMTP id
 46e09a7af769-71ab31c124amr126714a34.17.1732045910515; Tue, 19 Nov 2024
 11:51:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e8f04e642889b4c865aaf06762cde9386e0ff830.1713310411.git.Thinh.Nguyen@synopsys.com>
 <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org> <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com> <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com> <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
 <672291b9.9d0a0220.1f040e.013f@mx.google.com> <20241031013353.cgxjqgboz6hcy4xx@synopsys.com>
 <672d0c05.050a0220.114196.1e8b@mx.google.com> <20241114023458.s2gf7gagiawhxn3r@synopsys.com>
In-Reply-To: <20241114023458.s2gf7gagiawhxn3r@synopsys.com>
From: Chris Morgan <macroalpha82@gmail.com>
Date: Tue, 19 Nov 2024 13:51:38 -0600
Message-ID: <CADcbR4Lqqoi5-MT5KyJtsNLpa-wEJxe2D7Lr0gHCqJRjSNbnig@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Roger Quadros <rogerq@kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm no longer able to replicate the issue, so I'm guessing some
subsequent fixes solved it. I thought I tested them all but maybe I
missed one.

Thank you.

On Wed, Nov 13, 2024 at 8:35=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Thu, Nov 07, 2024, Chris Morgan wrote:
> > On Thu, Oct 31, 2024 at 01:33:54AM +0000, Thinh Nguyen wrote:
> > > On Wed, Oct 30, 2024, Chris Morgan wrote:
> > > > On Wed, Oct 30, 2024 at 03:10:34PM +0200, Roger Quadros wrote:
> > > > > Hi Chris,
> > > > >
> > > > > On 30/10/2024 00:49, Thinh Nguyen wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Tue, Oct 29, 2024, Chris Morgan wrote:
> > > > > >> Sorry, to be specific it was the fix that causes the issues I'=
m now
> > > > > >> observing. When I explicitly revert commit
> > > > > >> 705e3ce37bccdf2ed6f848356ff355f480d51a91 things start working =
again
> > > > > >> for me. With that commit in place, however, suspend fails for =
me.
> > > > > >
> > > > > > Ok, Roger's patch is causing issue on your platform and the $su=
bject
> > > > > > patch? Can you provide more details on your test sequence?
> > > > > >
> > > > > > * What does "no longer able to suspend" mean exactly (what erro=
r?)
> > > > > > * What mode is your usb controller?
> > > > > > * Is there any device connected while going into suspend?
> > > > > > * Can you provide dwc3 regdump?
> > > > >
> > > > > Commit 705e3ce37bccdf2ed6f848356ff355f480d51a91 will enable
> > > > > DWC3_GUSB2PHYCFG_SUSPHY in DWC3_GUSB2PHYCFG(i)
> > > > > and DWC3_GUSB3PIPECTL_SUSPHY in DWC3_GUSB3PIPECTL(i) during
> > > > > system suspend path, unless snps,dis_u2_susphy_quirk or
> > > > > snps,dis_u3_susphy_quirk is set.
> > > > >
> > > > > I see rK356x.dtsi has snps,dis_u2_susphy_quirk;
> > > > > Does adding snps,dis_u3_susphy_quirk resolve the issue?
> > > >
> > > > I'm afraid it does not fix the issue. Specifically when I do
> > > > "systemctl suspend" the device begins to suspend but freezes with t=
he
> > > > kernel log output via serial console listed previously. Note I have
> > > > console enabled in suspend. Additionally button input no longer
> > > > works at this point.
> > > >
> > > > Specifically, I'm testing this with the Anbernic RG353P device base=
d on
> > > > the Rockchip RK3566 SoC, in case you're curious.
> > > >
> > > > I'm not able to get you a register dump post suspend attempt as the
> > > > system completely freezes, however I can get you a dump prior to
> > > > suspend if that will help?
> > >
> > > Yes, any data is useful.
> > >
> > > >
> > > > Thank you,
> > > > Chris
> > >
> > > Can you help answer the other bullet questions I have previously.
> > >
> > > Thanks,
> > > Thinh
> >
> > I have 2 ports, here is a dump of each:
> >
> > usb@fcc00000:
> >
> > fd000000:
>
> Thanks for the dumps! They're helpful. Looks like the fcc00000 is device
> mode and operating in usb2 speed only, and the fd000000 is host.
>
> Can you help narrow down the problems by checking these:
>
> When you set the snps,dis_u3_susphy_quirk, did you set it to both
> controllers?
>
> Which controller suspend causes the problem? The host or the device or
> both? you can check by unbind the driver for each 1 at a time to prevent
> suspend. e.g.:
>  # echo usb@fcc00000 > /sys/bus/platform/drivers/dwc3/unbind
>  # echo usb@fd000000 > /sys/bus/platform/drivers/dwc3/unbind
>
> Thanks,
> Thinh

