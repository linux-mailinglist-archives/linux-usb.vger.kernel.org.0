Return-Path: <linux-usb+bounces-22310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E178CA75403
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 03:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3BF16D430
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 02:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F337C35977;
	Sat, 29 Mar 2025 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Zd4sLRTm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4413DDB9
	for <linux-usb@vger.kernel.org>; Sat, 29 Mar 2025 02:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743214134; cv=none; b=EuwPdEp1Kspul4jOCV6C/GnDZjKT/5NevjEh9zl45n+RtwrnrCV0EDfV86AKailrBkJRRQ56joG8o6tO5T6GRo53i3T6CGfKlnRUUeap52HtPbH2wy2i/fi96VEThYkZnFCPghEOp3Od/EVNfTDjr7tL5LRx+aaHufQK5y8mZ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743214134; c=relaxed/simple;
	bh=0+HnC31GvY6wN6NHBG+s6TLkjag8zoKgbsytjbA+8VU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owqKYqZHrP9JnK8VYEqabwoz/acILjfW/bbFcghzG+4tWWtwYVR1cK54aQnKqjJgbQ9NmvOu6n8v+TwMhr/+xpBDTM6gGF6Cwm98xLgb4DFffZM6TRoX5Bpz4Zl4uzrqg3lUMKq6oVbHXy3TzDdTENOFTkeGmYjrLb+IRzIzDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Zd4sLRTm; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4775ccf3e56so40287601cf.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 19:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743214132; x=1743818932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oATviJxkq8eZnZ3wSWsDdw1hCY/CMybDZVnVXiFSWoo=;
        b=Zd4sLRTmUW6HQC6GFAmBRH7MrnLNxi7cH1RByvhTQoIMslcxQmqTDBd7DeywkA5ezb
         WQC+GSQckqVLU8eBttjDq7GiRynTpREusrUvHKUCZaHQuLjPokE+SPQeT1FG10bxYj9i
         OUHD2oL0TZ2PvVnYILE/YyikOt8TnIJXxunUgkOHdsC7udMptcKy9r4PjG8U3/LvFDSs
         /ih/SUnlMF62GnY/OhKQPL8/Rm/0uqmbWRxQ18qA5D79WB1R5Bu5vCnzEUEPt2iZ4O7q
         9ztK4q4jqXZV8GFZI+5/0acfwu+jy+rwVJAdZb3VocwJpBcd2Pp6fMNjIhvIq53dZaLs
         82Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743214132; x=1743818932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oATviJxkq8eZnZ3wSWsDdw1hCY/CMybDZVnVXiFSWoo=;
        b=EAYAa8WBJB8mKUIX7yAU9Eps2NONPPexEU2qD4W6ESBC6HpoGeeQt5maePu8KHsYCX
         Or/8X43gCkx7L6KtncfCbWcxqdw0e+Qzu8/GlIpcgNaTW2uc2W51ikf8dzPlTrrgJrOW
         UdsmHtlEvz1XHLZkVFcfnVIsmRiLKtm8nJ0y8JjVuWDYTT5nCo4y4FonXKgvzWLZnPth
         imCifC39CXLuF/xqZJ+vBci6t9UQF3DgXi+yKVrsZomMOc6R/Mz3zQcNO8KjI8/w0gsh
         5eB8O0PK961JI/F4PYlmILGMOIqNNL+WHt8aOHRhQ3b0Quid9bdAYuP6iiZQWNRuq8nI
         oxdw==
X-Forwarded-Encrypted: i=1; AJvYcCVdCuRuGxkTA8zCCV0vhHlYhv0U52QgNMEmHM/+opRt6+f7mYdJGXIWwv1BaR0xUVDQeRCMGL1tZ5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTDPi1dZ6Ae4Ym3hsTevYoqSNidRE4sTz+5/qY0is4KJJKkUT8
	NTgEWBhpanbTM58bsSHm2pHq3bvNwI2ZwO1sdmbmf4LBwY4ASAUsm5WHaMdCbg==
X-Gm-Gg: ASbGncvm9/HY0iBJfCwpNRTcuEpUD3pJZ5pPNjCcvcVqVxL2v9u518XkDaBDzgnxh6O
	ZCn1JU2nIauRb/BUybwDQzwQPslGSm31n9EQHbZ2Uuf/+Ym1uJ9ntkQ8+YgeLCkKN14c5mdadQM
	ceFMrvrwUwwzkuyptLQsFlYJ3+PhSr4c94oUHZDYKltJDUuILaTkqWFxDqc6LyNtUBAc/lLE/iv
	on1TZLbEVyhxaI4nQtskIZ48JRPSlQqaI0jnBAWr/FRR2b/Bax7nHZ0pYfQWut5hYmhARszDR1r
	fVaJhJTAspDifz+4Gh8v8EiqXsjGr4QOi9X7QJG7GRfG
X-Google-Smtp-Source: AGHT+IH1L2+053HKjBANc7GI5t6N9eFdk9KEPgNwqaYsT0C/dL/Gef0yLBObqVY66eNPyS88Tua+Bw==
X-Received: by 2002:ac8:5e46:0:b0:471:bd14:a783 with SMTP id d75a77b69052e-477b3f4a757mr27665491cf.25.1743214131601;
        Fri, 28 Mar 2025 19:08:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4778317b416sm18061541cf.50.2025.03.28.19.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 19:08:50 -0700 (PDT)
Date: Fri, 28 Mar 2025 22:08:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 resend] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <24798648-c5a3-4e31-9897-4610053007f3@rowland.harvard.edu>
References: <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
 <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
 <Z-RyiI1X9BN43feQ@shikoro>
 <c7f67d3b-f1e6-4d68-99aa-e462fdcb315f@rowland.harvard.edu>
 <Z-bEBk68dh918vy9@shikoro>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-bEBk68dh918vy9@shikoro>

On Fri, Mar 28, 2025 at 04:45:10PM +0100, Wolfram Sang wrote:
> Alan,
> 
> > Fix the problem by adding the I2C_AQ_NO_ZERO_LEN_READ adapter quirk
> > flag to all the USB I2C adapter devices managed by dvb-usb-i2c.c,
> > following Wolfram Sang's suggestion.  This tells the I2C core not to
> > allow length-0 read messages.
> 
> Thank you again for fixing this issue. There are some USB-I2C bridges in
> drivers/i2c/busses which also do not prevent zero len reads. Would it
> make sense to put a protection into the I2C core? Can we reliably detect
> that an adapter sits on a USB (maybe via the parent device), so that we
> can then check if I2C_AQ_NO_ZERO_LEN_READ is set, and take action if
> not?

This really should be handled by someone who knows how those bridges 
work.

In the case of dib0700, it was clear from the source code that the 
driver uses USB Control transfers to tell the hardware about I2C 
messages.  I don't know if other bridges work in the same way.  In 
theory a bridge could use USB Bulk transfers instead; they aren't 
subject to this restriction on length-0 reads.  Or a bridge could use a 
Control read transfer but include extra header material along with the 
actual data, so that a length-0 message wouldn't end up generating a 
length-0 read.

So the short answer is that you would need to find someone who really 
understands what's going on here -- which I don't.  Sorry.

Alan Stern

