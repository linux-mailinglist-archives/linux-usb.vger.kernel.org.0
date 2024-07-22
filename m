Return-Path: <linux-usb+bounces-12335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AC4939348
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 19:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDC9E1C21328
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 17:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949AD16EC18;
	Mon, 22 Jul 2024 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="paTEZkxY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C7816E86E
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721670127; cv=none; b=Xq2YRwQoBKf956+mA4ULAu7RY46sfPDdVK+voIZlxyN0bH+13ylsN3bm8DJ78X1iIQjRKOVuSgv9KxBeMEn5kohrvON1OSMs4P5rVkuuYoz+HBLq74t00c1J2bYZig6Tkk2imYVRYzqMV7oYylGERBuLrn8AYO/0jdAx+ETVxQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721670127; c=relaxed/simple;
	bh=ugor9w5E1mjhIPRTlWtgixZzPX0NqkshVh+YsIeluos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OG/Wry/1kXgPS1wH4Zsutya3skGMrbL+Pl3awi54YwnGFkKTh2iwCQ8EgQt92EUtB9lGVPDn0VskrvHsttLgXh3tRWWZpJ6gAkX/PbYneN2ZXhy9jx2+i2Zspjn6P0Ig9t0Pd5xFu+aUzIZZhm/eqGAKwckf5qwmV9Ylyd/bNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=paTEZkxY; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-664ccd158b0so45531817b3.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721670124; x=1722274924; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GEAsfep1o9bHfuVcReQXlWhCpCPBZX/z+vcGE41Ain8=;
        b=paTEZkxYSt7I+TVvHCcf+cG5Ttrag7DgIl4cZBYjlLk+dpYuYmUiuA8KbUGaTGLIaK
         VzgjmAce1n9PalHB+8AKdYvOlBBOAD/P/0XFkG/FxG2jKPxXEDRZ2aKkdiughOvxXAuF
         DINQzhiMgVUW9oerS290WLshnq4ry/zaHwzpsPXkV99QxCYZvThj783DZJeKBgTqoHaf
         xIMb8NDkflriruhA3TQ018UdfkFWJEfH82JfyZ7nZO76e+Qc5wdBhH8QyNN1BPcnLOfO
         HW0AJG11EaIA3ndZT3pWv8StByDEOITeEXSMFMVgd8hOOFplW3dt9gmZYA5O4kHInyQo
         PQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721670124; x=1722274924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GEAsfep1o9bHfuVcReQXlWhCpCPBZX/z+vcGE41Ain8=;
        b=gEHcmVsDo9k+0OoeO8konSo9LjCiolI9mfzpua3JCrLYPzVN6h2EDQaiToh2ZBG/KC
         82CIPSflYoDLJG+O4rnjHgwSA5R5t+KKcyDkzaP8JJJfs98rc8rDo23cuOi+40/n/Nr4
         oZSlaPGq3RF82H52c5/a9/lQa/Mh4oTIiVeQHwfzR8dUcdU551u/HmSh/6sT9szXirNa
         WuRa7UP/YzGoJ3Bu+euGL+89lRiz5/RgkhryaWX3IfWY42cXk5RMtitOsCHskBRWTM6w
         KxivxBxFfP6y0OMaafh8QroV+oLC0u2mqQCf8pS3HrcPyauJT+tyVsRlCOu3fNOHP00e
         edig==
X-Gm-Message-State: AOJu0Yz41kqsSiyPWyD3HIVLLn4aGWg0bL1ngX+bXnoq4zW8p/rFdTkC
	KOZLovrT7ep21ltnJgqVx73DgtcthxFg24xnwZgnxe5/vMHKium9x6LNZHwtFw==
X-Google-Smtp-Source: AGHT+IHj+m1AO569rZQrG4jvehlr1DtinQEuf9uup9u3ryjKrg2R5yTBlWyPsl8/KQkTrF2H/4zZkw==
X-Received: by 2002:a0d:cd82:0:b0:62f:a250:632b with SMTP id 00721157ae682-66e4b8e155cmr5726207b3.8.1721670124661;
        Mon, 22 Jul 2024 10:42:04 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a19905a8f3sm383032885a.80.2024.07.22.10.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 10:42:04 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:42:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chris Wulff <crwulff@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Roy Luo <royluo@google.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	yuan linyu <yuanlinyu@hihonor.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Felipe Balbi <balbi@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: core: Check for unset descriptor
Message-ID: <97672e7a-edb4-4a00-b404-c5891319912e@rowland.harvard.edu>
References: <20240721192048.3530097-2-crwulff@gmail.com>
 <29bc21ae-1f8a-47fd-b361-c761564f483a@rowland.harvard.edu>
 <CAB0kiBJYm9F4w5H8+9=dcmoCecgCwe6rTDM+=Ch1x-4mXEqB5A@mail.gmail.com>
 <b35e043d-a371-4cf9-b414-34ba72df1ccc@rowland.harvard.edu>
 <CAB0kiBKDB=1kF4YRXckph4QG7tQbDdBMsOtcQh9+p1jtyokdPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB0kiBKDB=1kF4YRXckph4QG7tQbDdBMsOtcQh9+p1jtyokdPw@mail.gmail.com>

On Mon, Jul 22, 2024 at 01:11:01PM -0400, Chris Wulff wrote:
> On Mon, Jul 22, 2024 at 9:38 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Jul 22, 2024 at 09:00:07AM -0400, Chris Wulff wrote:
> > > On Sun, Jul 21, 2024 at 9:07 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Sun, Jul 21, 2024 at 03:20:49PM -0400, crwulff@gmail.com wrote:
> > > > > From: Chris Wulff <crwulff@gmail.com>
> ...
> > > The previous check was also hiding the error, and introduced a panic.
> > > I could add a printk to that error case, though it would be unassociated
> > > with the gadget that caused the problem. This function does also return
> > > an error code when it fails, so the calling function can check that and
> > > print an error.
> >
> > Okay.  It wouldn't hurt to print out an error message, even if there's
> > no way to tell which gadget it refers to.  A dump_stack() would help in
> > that regard, but it won't be needed if the guilty party will always be
> > pretty obvious.
> >
> > By the way, how did you manage to trigger this error?  None of the
> > in-kernel gadget drivers are known to have this bug, and both the
> > gadgetfs and raw_gadget drivers prevent userspace from doing it.  Were
> > you testing a gadget driver that was under development?
> 
> I am working on adding alternate settings to UAC1/2 gadgets, so this really
> was a case of trying to make the failure in development easier to deal with.
> I don't believe there are any problems with existing gadgets causing this.
> 
> I will add an error message and submit a new version. Perhaps
> WARN_ON_ONCE would be appropriate here to get that backtrace
> instead of a printk?

That sounds good.  You should also mention in the patch description that 
the purpose is to prevent undebuggable panics during driver development, 
and no existing drivers will trigger the warning.

Alan Stern

