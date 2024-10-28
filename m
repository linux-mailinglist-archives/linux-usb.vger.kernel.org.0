Return-Path: <linux-usb+bounces-16788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B99B363C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 17:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 509D1B254D2
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 16:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B774189B91;
	Mon, 28 Oct 2024 16:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pspya+3Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52B187858
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730132144; cv=none; b=I0Awi2v4vf21VeR8IxgfmNRVn2em75yVwKTL6MzYgGrTNm7HSP5Rmc5LKFNimuXe7qpaGgP1o7tDjyv4Q5Y44bgiXJN+zb1pp0H1PUICFvp1WMwnUMnSPuuwvk8NXyG1oMIudsEFxhEMvnr1QTOFUk1AwpmtugzuZoM+TvZM9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730132144; c=relaxed/simple;
	bh=F5rJuUptKxt47hiGXivb8aPSdalsna3+NC5OvxLg3Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKQPHRfLLLf1euhuKRrkY79/nqf6Zmht4QwcEDHrbrXLLaaZ6y1BGUb2HYnsUMmpLJ8T76azjy3jhspoJKzdNSWroaNyNpCtcCJOdXNT7+wMoDaSYzSgo0qjz0Zr1AGTY3tgBEPZp7SSwwg95tcHWXcVA8cy1ZgU6ft9Sn1wOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pspya+3Z; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso3115740a12.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730132142; x=1730736942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85qa4JdZ+Qk0EiFvZojq808qYM1OW3mYObeDVhKmhOU=;
        b=Pspya+3Z8dVEcDKitZrUWZooZ1pPAiANe7hFHM8qFGI9t999FTFOg4WLWDSnceTo3Z
         TUFgTGZWQaGuCNDi1qFxJNrByvMT95+rHrkfwXOplwLvlj4eNN5qs/omWORu0l51qgyI
         xdaMy1Q5lpVDObNTKGiTHy5mDon3idRhf3oDFz6CucWCUH8jfaywqLHVxdSG3PoHOIdv
         jNvPk7CXaftp7MytgMAGhLV9SVW6/XHPYs5v0PgVB62Mav0HVs4+gy3NZUcpDEQI1YrQ
         C870OAq6BHywMbgCpi/zN+wprjxh92Ih2jBU3F44Oe52YGtDcmBaVNYsXQKhUcqzPvKW
         B4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730132142; x=1730736942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85qa4JdZ+Qk0EiFvZojq808qYM1OW3mYObeDVhKmhOU=;
        b=tht7LYEdgeYhOUIcxqwcGFpkK8DiO1y9dyW13wnSyOC1FQHne31AdN9uQ69Gpcm+Lq
         776iSIZA5+B9dRmfw2VACsy4sIoBEXrX727BktIndQxVQNul2C147sHi+rXaIB03Sj+6
         RxXWZtDhmcHVT7cbg4nbi6UyAf7II0jZ82iHOU7JLnQD6srV2P8rkGdiTghc+wUgqgy/
         QCCPZHFz8LxHj3RWw9M1pAxM9N1XCxOXvrs1TgaO92rjQCXen66aAZukA6uDVpugkmOB
         s2D0azV0lorgGcHCNe95Wd2p0W2GgoWztGXlrQSzbFf3TzvgM1JOoBWCBQaOdRRwsIxI
         xo5A==
X-Gm-Message-State: AOJu0YxAHYvrz8eDdH7pzwnHA0O/Yet3UCc7jQtTQec+NVvRhH/rqMiN
	J1I43qFdflNNrCcWFKMlCka1hv6Nf0TRFMCIX1P6IZoHZ2J17F8XYbIzIwUD+lq2YNilGfWsQnq
	10AclKf8RuY2iSjwda4QijK80VEjPk3zK
X-Google-Smtp-Source: AGHT+IEsgpgjKZs9ufaGTdKs0muKMMCbNomCVIu2jeDLlfe7w8rcrzvTtrcES2ET75o5/jg7zze5vab0FqfEq9xnls8=
X-Received: by 2002:a05:6a20:d43:b0:1d9:ea5:19da with SMTP id
 adf61e73a8af0-1d9a842d028mr12186265637.17.1730132141771; Mon, 28 Oct 2024
 09:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
 <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
 <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com> <467b1da8-325f-473d-bf46-96947993c626@rowland.harvard.edu>
In-Reply-To: <467b1da8-325f-473d-bf46-96947993c626@rowland.harvard.edu>
From: Bart Van Severen <bart.v.severen@gmail.com>
Date: Mon, 28 Oct 2024 17:15:25 +0100
Message-ID: <CAOLjEn4vJuxmRGUpUqMS6C7P82d18TkgURhd71UkXNTm5waYtw@mail.gmail.com>
Subject: Re: usb: gadget: automatic remote wakeup on hid write
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 4:55=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Oct 28, 2024 at 04:09:30PM +0100, Bart Van Severen wrote:
> > On Fri, Oct 25, 2024 at 9:37=E2=80=AFPM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > On Thu, Oct 24, 2024 at 11:37:50AM +0200, Bart Van Severen wrote:
> > > > Hi,
> > > >
> > > > We have a use case to remote control a pc through a composite gadge=
t
> > > > consisting of keyboard, mouse and tablet functions.
> > > > The problem we face is that when the pc is sent to sleep, we cannot
> > > > wake it by writing to the hid device, which is what you
> > > > would expect to work.
> > > >
> > > > We're running on Xilinx Zynqmp soc/DWC3 290A.
> > > >
> > > > We have set the bmAttributes ch9 USB_CONFIG_ATT_WAKEUP bit and do s=
ee
> > > > the set_feature request to enable remote
> > > > wakeup, just before the pc goes to sleep.
> > >
> > > Do you see a wakeup request from the gadget to the host?
> >
> > No, I don't see any wakeup request towards the host.
>
> As one would expect, given that there was no call to
> usb_gadget_wakeup().

Correct

>
> > > > We noticed the recent relevant work
> > > > https://lore.kernel.org/linux-usb/1679694482-16430-1-git-send-email=
-quic_eserrao@quicinc.com/,
> > > > regarding function suspend/resume and remote wakeup improvements.
> > > >
> > > > However, the main question we have is: what would be the right plac=
e
> > > > in the gadget framework to fix the issue where a hid write
> > > > doesn't trigger a remote wake up when the usb device is suspended a=
nd
> > > > the host has enabled remote wakeup.
> > >
> > > Probably the drivers/usb/gadget/function/f_hid.c file.  I don't know
> > > anything about how this gadget driver works, but the file doesn't hav=
e
> > > any calls to usb_gadget_wakeup(), which means it won't generate a wak=
eup
> > > request no matter what you write to it.
> > >
> > > Alan Stern
> > >
> >
> > That's what my initial thought was also, and that certainly works.
> > But then I wondered if it isn't a better idea to handle this further do=
wn, to
> > avoid having to write similar code in all function drivers, say in the
> > gadget core?
>
> The gadget core doesn't know when the user wants to issue a wakeup
> request; only the function driver knows this.  (For instance, only
> f_hid.c knows when there has been an hid write.)  And the whole point of
> usb_gadget_wakeup() is that it provides a way for the function drivers
> to tell the gadget core to issue a wakeup request.
>
> Alan Stern

Agree, best to handle it in the function driver.

Unfortunately, as stated earlier, the dwc3 gadget driver doesn't
enable link status interrupts.
That should be enabled again, so that we can test if the gadget is
suspended before
calling usb_gadget_wakeup() on hid write.
Dwc3_gadget_wakeup() does fetch and checks the link state explicitly
to return early
when in U0, so might as well always call usb_gadget_wakeup() on hid
write, but it feels ugly.

Br,

Bart

