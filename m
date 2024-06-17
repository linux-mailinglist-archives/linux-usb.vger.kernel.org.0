Return-Path: <linux-usb+bounces-11352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917790A251
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 04:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CFF81F21A3C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 02:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA60161310;
	Mon, 17 Jun 2024 02:10:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 08FDA29D19
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718590237; cv=none; b=k2rUM8qMedCavnFflvdgxy8CrJ8gktO4Ux87lMU5K/nCgL8tJXnC7+dzXcnuKeuWGtokIW7f6lj8c0BJAB8OkLT12SXNhU9ndUMHj/Cj1CnovEvjOtPOqEJZGfddVNIHzf3A8HXe5vP6S7iYjyFXPZ94gYSohXb1+zKv06tFW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718590237; c=relaxed/simple;
	bh=pC2H/O6eiqESTCmr8neLdEOkJtPLbpth/TOg54DIL9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVH0yE8XTQwcBA9k9zcdZlikityRaN2v/Uf6Ov0LX0t/PjCb3XlCj7zYDwTTgE7t5+PCpogJoiCCXCKsnoEIsAISa28oc7fdJJqrhrVVwidioJa4NilK2PFmFRVKs8OkEfq4M8BS/ZSCkv7Jp0HsDWS6cY99/8UNUj0qRMBLHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 376162 invoked by uid 1000); 16 Jun 2024 22:10:33 -0400
Date: Sun, 16 Jun 2024 22:10:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: USB list <linux-usb@vger.kernel.org>,
  Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: Stalling non-0-length OUT control requests in Raw Gadget/GadgetFS
Message-ID: <762b8751-16d5-4ce5-8504-efcb6440585c@rowland.harvard.edu>
References: <CA+fCnZeLRqk-FOkJ81qMY0NMZC7YnW=beTw=w_DVA=OhOnywRw@mail.gmail.com>
 <8b7aa23c-9976-46c2-b64f-1d4614aefe89@rowland.harvard.edu>
 <CA+fCnZd1UOqCiH7L1FMMqLhepiMSBfgVb-tXfc81F_VuX_zy4w@mail.gmail.com>
 <73838855-fe52-4d2f-a826-c5757f75bd92@rowland.harvard.edu>
 <CA+fCnZetfWWhO+Fufg_Q=MOFtyN+g6nBrLJ29HGrGc0znsQTGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZetfWWhO+Fufg_Q=MOFtyN+g6nBrLJ29HGrGc0znsQTGQ@mail.gmail.com>

On Mon, Jun 17, 2024 at 12:42:56AM +0200, Andrey Konovalov wrote:
> I've been collecting different kinds of non-critical issues and
> inconsistencies within the Gadget subsystem I hit while testing Raw
> Gadget. It's unlikely I'll get to working on them in the foreseeable
> future, but it's good to know what needs fixing should the need arise.
> 
> So far, I have:
> 
> - Allow stalling non-0-length control OUT transfers
> (https://github.com/xairy/raw-gadget/issues/71);
> - Contain USB_GADGET_DELAYED_STATUS within composite framework
> (https://github.com/xairy/raw-gadget/issues/70);
> - Support isochronous transfers in Dummy HCD/UDC
> (https://github.com/xairy/raw-gadget/issues/72);

As it happens, I wrote a patch (meant mainly for testing, not production 
use) that implemented a start at isochronous support in dummy-hcd.  It 
was far from complete, but it could be expanded.

However, it's another thing I have lost track of.  It may have been 
posted to linux-usb at one point, but that would have been quite some 
time ago.  Probably before well lore.kernel.org existed.  (I vaguely 
remember working on it before moving to my current home, which means 
in 2008 or earlier.)

Alan Stern

