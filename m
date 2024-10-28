Return-Path: <linux-usb+bounces-16785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7393A9B3571
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 16:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B271C2192C
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 15:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532121DE4F8;
	Mon, 28 Oct 2024 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gNs5xwwn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D08C1DE88D
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130938; cv=none; b=YPz1+bCqNBjP0lKxfu6JbjfIiGjeak4tpjZDdKwmHjeq6TB9aHt3YgJW7Q2JY7sbs6biSlep2p226Rq2YUGXrbK+AfaluyR441vu2ALbQtgvR1esM4yz+Krn8X6RGDwufsasfZ6ydv65NPvDxJ+FaVAq4UD+9wVBlqZOEjtiZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130938; c=relaxed/simple;
	bh=nMZzlaYWJrMEs2WkebKPvBVvnJJPjJxKo75Ykmoxufw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB9hslNgVSgNEsuNFLESvEdV6P91Exc+rzYbLoQ3xdbCRMrYgKO3O1UN39UKx60IVerHJX4rxAaqehF9rSeiZ96utJlUn987lWHVCRLyF47zP7jVaKhpuAKCoTDUYwU3DmvZMs/lMFRVVk6jsSnZd3WrEvFQu2WRh3aMYl4kja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gNs5xwwn; arc=none smtp.client-ip=209.85.167.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-3e60825aa26so2661923b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 08:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730130935; x=1730735735; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lwvuMVXpIc0dl0nTyvaeULRWFk8oR7abpn6Rmc4Rhew=;
        b=gNs5xwwnY47BlmFUTJ2ze4TThmbN0yJ/Vs05B2jq15kBn4VLsskjlvTmg4Hml3Om3o
         7xDR5iIq1Ye8CrQ6EnJEll3iqcgn42vNErrpFwrZgsScSZmsNbUZ1bYTRTDGZTm4SsXJ
         ejB6uFso6gF96kDxhAbJ5B/Sj+5vcPP7TqhXArttkMjmuVNS4KvthO1xh2PfNqbSoQct
         mMvhzxKQ7XIv+a+xi5h00VekMekW1AmJKSjiXAIZRu5+riwq/0V6ZlQ03T2kK/hBdf1Q
         CFYHgzo+RX7IzkOJn/gqULe+jv+R6vm2FNpu/CX9VnMa3XPttBOVsnTxWSWxAehWDQ5T
         d0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130935; x=1730735735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwvuMVXpIc0dl0nTyvaeULRWFk8oR7abpn6Rmc4Rhew=;
        b=dd5pMgra0he/HzekHCfvN1yA2pqYIaVHhzy5sehvPFkH5rbdDApTpplKm0MzBQqxkp
         Uq0quCQrjXRSZYB7tKunWNjlfVD617DThPrtKKDrsuk+RYAs/sUC5nbprNNXQ1tfrrRe
         48+/U4Fq4MKUZVmLcZKkNdZG6nXO1wys2dv/qXVOJoIzXvQt3qSvPb7sq1/0zvUrcc9G
         6pLeJEFJTsUhDA/ytRuN2s1Qvxfz4l4xazn+sB9TKkGvO2QdBGwfxmrR6iKrTHMSbKZ7
         V5pWNZaTJLvVfJGsmWc8UL6fK3pSymGcUYZ8MP5vkstLfCKx8aZku4ci2stLpkpKS8Y2
         +xnw==
X-Gm-Message-State: AOJu0YxohMiliBlMiCxbn/FltAV192qUPbZFYgCvbcG0XXAF8OJb5P3a
	bsB4sWHGwUHhaLE0do8GtjrgsnGgTtnpeuXctQvq1RDW/VAHhPvO7Mlo+kz70dfRgCTyLLxQkag
	k/Klx
X-Google-Smtp-Source: AGHT+IEOUPPFiw/hBvP5L0i+4D1SrIauGGptXWNFK4I82hKkuXtAXXQY/H7Co/0ZnkOQvwuEI6NHIg==
X-Received: by 2002:a05:6808:2e8b:b0:3de:2154:c4c8 with SMTP id 5614622812f47-3e6384cfd5bmr6744473b6e.44.1730130935454;
        Mon, 28 Oct 2024 08:55:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d1799fd530sm33619996d6.85.2024.10.28.08.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 08:55:35 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:55:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Bart Van Severen <bart.v.severen@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb: gadget: automatic remote wakeup on hid write
Message-ID: <467b1da8-325f-473d-bf46-96947993c626@rowland.harvard.edu>
References: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
 <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
 <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com>

On Mon, Oct 28, 2024 at 04:09:30PM +0100, Bart Van Severen wrote:
> On Fri, Oct 25, 2024 at 9:37 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, Oct 24, 2024 at 11:37:50AM +0200, Bart Van Severen wrote:
> > > Hi,
> > >
> > > We have a use case to remote control a pc through a composite gadget
> > > consisting of keyboard, mouse and tablet functions.
> > > The problem we face is that when the pc is sent to sleep, we cannot
> > > wake it by writing to the hid device, which is what you
> > > would expect to work.
> > >
> > > We're running on Xilinx Zynqmp soc/DWC3 290A.
> > >
> > > We have set the bmAttributes ch9 USB_CONFIG_ATT_WAKEUP bit and do see
> > > the set_feature request to enable remote
> > > wakeup, just before the pc goes to sleep.
> >
> > Do you see a wakeup request from the gadget to the host?
> 
> No, I don't see any wakeup request towards the host.

As one would expect, given that there was no call to 
usb_gadget_wakeup().

> > > We noticed the recent relevant work
> > > https://lore.kernel.org/linux-usb/1679694482-16430-1-git-send-email-quic_eserrao@quicinc.com/,
> > > regarding function suspend/resume and remote wakeup improvements.
> > >
> > > However, the main question we have is: what would be the right place
> > > in the gadget framework to fix the issue where a hid write
> > > doesn't trigger a remote wake up when the usb device is suspended and
> > > the host has enabled remote wakeup.
> >
> > Probably the drivers/usb/gadget/function/f_hid.c file.  I don't know
> > anything about how this gadget driver works, but the file doesn't have
> > any calls to usb_gadget_wakeup(), which means it won't generate a wakeup
> > request no matter what you write to it.
> >
> > Alan Stern
> >
> 
> That's what my initial thought was also, and that certainly works.
> But then I wondered if it isn't a better idea to handle this further down, to
> avoid having to write similar code in all function drivers, say in the
> gadget core?

The gadget core doesn't know when the user wants to issue a wakeup 
request; only the function driver knows this.  (For instance, only 
f_hid.c knows when there has been an hid write.)  And the whole point of 
usb_gadget_wakeup() is that it provides a way for the function drivers 
to tell the gadget core to issue a wakeup request.

Alan Stern

