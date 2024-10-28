Return-Path: <linux-usb+bounces-16784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E49B347C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 16:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964361F22596
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 15:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116D61DE2C3;
	Mon, 28 Oct 2024 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKIz/RPK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1E185B68
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730128189; cv=none; b=MvW6DjtRu/VqaJql1FpzQTV8i6XePpG1AButSZ3HkvDXMxqTge3ZvFNn61igTiMbwxVUggslIrOVJW2q/H++kY/9nmAH+zRsh0kIyxWAlueSFh2n8KzQhS78AKb5GlW4IhP1tFLOpE66fDOYIRgBmvEVN18syXaic+7iIMzbfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730128189; c=relaxed/simple;
	bh=8z8gV2zn3xRSTaMuw8woo1e0MHQ4Fi7ZG10r5YC0YCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSnQX+Ffdoipln985hzcsULvSkoXrbD0RYftMRP9csf4Auf3MkILhdNYyfTzDxKmOl3CdWp7IEcWuf+77jZ+jDf7YJkrAUMTOqJbR/CJtpKpbVLGFKgdyP9KXxjdB4N+SHbXB63Y/NbIw4SbnXLS8PzIMUMDu9Dgh+0HILD5nQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKIz/RPK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2e050b1c3so3800898a91.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730128187; x=1730732987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ihn7VG0DIyROfbHBA9/5N2wlPKFxHrWUAloi2j5sy3o=;
        b=IKIz/RPKq+Jh83huIthdjG/DCllu7ZatVswANoJjo16cD312qLOHIEBRypLn/CLxHz
         ytukGlPwhd+ZiyhKEb81HCucaCcGP8i1PqY+YVyk4QAlTSFRF7LqENCVzxN8wBe/tyi6
         9kjTV14FCv++MKL9WMPZQN/t+R9zr7OKFK7LYTh4GunKpaFbY4Zi1OucjL0bRuqGZhSq
         dDkZgzW4RAsNImgcBgIz+BbNCxWO6lTpqUAEji1X/xNxj/gOCArqQ7IQ+W+B9/uV0raS
         mVSFJVsNfmh+zah/zCsAW7FIc2hQeEFM6aneW+WyRBtIGc7T5Ia17RJXqGZ3V9WhjF1N
         c7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730128187; x=1730732987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ihn7VG0DIyROfbHBA9/5N2wlPKFxHrWUAloi2j5sy3o=;
        b=Nb645EE2f328Atw993cyoYmC0DS5Pydtle21+ogzkzHJ5UyNqW/AzuYzQ3H7ev2GLv
         APxQAGZg4bve3vrAxTcs5HjzY9A7WJxggxJYtS8tyym7RwcK7sFwLes62kjhP7fmloes
         K6A7Qsbvn80mif76tA1u1tSLPhAYT1LG93C6WC/lMnzq0eex73KF5ni+EEGoPWY0VbcL
         cCkjGkVn0XAJG8nx+RX9qd5/IEdG8nh77o/5DkVcOoI/mI+x/LNM4Op9HfR4I5tQCbzY
         9Mhza047pNYMxjyB7JvMvO4YxvNbshGekPpH153S+H+jmeeegD7g3v1n5aoIOw96F54l
         jz7Q==
X-Gm-Message-State: AOJu0YzkS2HEHpXHp70ckgsLWqJxzgzt4f39ukwD++0XNprEIcasC1QE
	03dJ1pH63foJYiAnyediwSwSDZ9Hp72bvERJwY2SgGT8mag8/fAkY2vh45FkEEHKKjaKpsHpBit
	2SdV2HpH5lEqj5aZF0SHRJYDqsYMTRDfu
X-Google-Smtp-Source: AGHT+IGydSqgyVrt02nZvwqYGhb4HdhxCsaYu2HOBm7huwNQI+ofMFuvdSG64VfTSLsRPKfqXDSBxnDLCnqhLKIVxdo=
X-Received: by 2002:a17:90b:3811:b0:2e2:c2b0:d03e with SMTP id
 98e67ed59e1d1-2e91debf4abmr260614a91.5.1730128186937; Mon, 28 Oct 2024
 08:09:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
 <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
In-Reply-To: <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
From: Bart Van Severen <bart.v.severen@gmail.com>
Date: Mon, 28 Oct 2024 16:09:30 +0100
Message-ID: <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com>
Subject: Re: usb: gadget: automatic remote wakeup on hid write
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 9:37=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Oct 24, 2024 at 11:37:50AM +0200, Bart Van Severen wrote:
> > Hi,
> >
> > We have a use case to remote control a pc through a composite gadget
> > consisting of keyboard, mouse and tablet functions.
> > The problem we face is that when the pc is sent to sleep, we cannot
> > wake it by writing to the hid device, which is what you
> > would expect to work.
> >
> > We're running on Xilinx Zynqmp soc/DWC3 290A.
> >
> > We have set the bmAttributes ch9 USB_CONFIG_ATT_WAKEUP bit and do see
> > the set_feature request to enable remote
> > wakeup, just before the pc goes to sleep.
>
> Do you see a wakeup request from the gadget to the host?

No, I don't see any wakeup request towards the host.

>
> > We noticed the recent relevant work
> > https://lore.kernel.org/linux-usb/1679694482-16430-1-git-send-email-qui=
c_eserrao@quicinc.com/,
> > regarding function suspend/resume and remote wakeup improvements.
> >
> > However, the main question we have is: what would be the right place
> > in the gadget framework to fix the issue where a hid write
> > doesn't trigger a remote wake up when the usb device is suspended and
> > the host has enabled remote wakeup.
>
> Probably the drivers/usb/gadget/function/f_hid.c file.  I don't know
> anything about how this gadget driver works, but the file doesn't have
> any calls to usb_gadget_wakeup(), which means it won't generate a wakeup
> request no matter what you write to it.
>
> Alan Stern
>

That's what my initial thought was also, and that certainly works.
But then I wondered if it isn't a better idea to handle this further down, =
to
avoid having to write similar code in all function drivers, say in the
gadget core?

> > Some further context:
> > DWC3_DEVICE_EVENT_LINK_STATUS_CHANGE are disabled by default
> > (https://github.com/torvalds/linux/commit/799e9dc82968c66d6f8faf96d0bd0=
1e515b0b2f2#diff-5e9721ccc2bd0a326d3b1a8cbcd9d91130774b1a7d06533c39074ad67a=
ee7e96L1540),
> > so dwc3 gadget driver isn't interrupted when host goes to sleep, but
> > it does get DWC3_DEVICE_EVENT_WAKEUP when it wakes up.
> > So the gadget device in turn is not suspended when the pc goes to sleep=
.
> >
> > dwc3_send_gadget_ep_cmd does issue __dwc3_gadget_wakeup when cmd is
> > DWC3_DEPCMD_STARTTRANSFER.
> > It has no provision for doing the same when cmd is DWC3_DEPCMD_UPDATETR=
ANSFER,
> > which is our current patch to make it work in a pragmatic way.
> >
> > Sorry if the mail format isn't what you normally expect, this is my
> > first time posting...
> >
> > Br,
> >
> > Bart Van Severen
> >

Br,

Bart

