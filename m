Return-Path: <linux-usb+bounces-2353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 697EA7DBB9C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 15:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96B911C20AFF
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 14:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2463E179A9;
	Mon, 30 Oct 2023 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A218029
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 14:19:59 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 09B92CC
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 07:19:55 -0700 (PDT)
Received: (qmail 672852 invoked by uid 1000); 30 Oct 2023 10:19:54 -0400
Date: Mon, 30 Oct 2023 10:19:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ariel marcovitch <arielmarcovitch@gmail.com>, johan@kernel.org,
  linux-usb@vger.kernel.org,
  Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Gaps in logs while using usb-serial as a console
Message-ID: <968c62ca-0ef2-4bf1-a17b-a6d88d5e2e20@rowland.harvard.edu>
References: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>
 <2023103052-unpeeled-calibrate-ae48@gregkh>
 <CAFGKuwp7JH8H9vjz8iJ24R9TRW0GDE-O96VBAG4L8X4DhTabXg@mail.gmail.com>
 <2023103003-defection-recess-cf49@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023103003-defection-recess-cf49@gregkh>

On Mon, Oct 30, 2023 at 09:30:15AM +0100, Greg KH wrote:
> On Mon, Oct 30, 2023 at 10:15:30AM +0200, ariel marcovitch wrote:
> > > Please realize that usb-serial console was the result of me loosing a
> > > drunken bet.  It's amazing it works at all.  For "fake" devices like
> > LOL your drunken bet was quite helpful to some people
> > Because modern PCs come without a serial port, I wanted to use it to
> > see early logs on my crashing kernel without having to use printk
> > delay and things like that.
> > I'm curious as to how kernel people debug PCs in general...
> 
> We use a usb debug port connection (it's a special cable).

Sometimes people use netconsole (see 
Documentation/networking/netconsole.rst).  I don't know how common it is 
nowadays, and it may not be quite as reliable as a debug port device, 
but it should still work.  And it doesn't require special hardware.

Alan Stern

