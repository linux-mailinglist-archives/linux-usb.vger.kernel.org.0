Return-Path: <linux-usb+bounces-22286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF7A74756
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 11:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5981B61667
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 10:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321DD21773D;
	Fri, 28 Mar 2025 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qt8ATXe5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7CD215040
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743156427; cv=none; b=C/2mfdfjrmoLc+oJ407XnIkaoAeQ/4hmL1knYEAwW8M9wubrh89JYJwql34MXjGKXwA1W9gl8HPVzX1mz4Lv8iprF8nsHhZmXpbvrh5BuKNk5ed3R6U0lX4CHam58rC+U8DWqp6LN8PpNeHsc5UNbBgkVdOZ3RpRJy1VniQ6Al4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743156427; c=relaxed/simple;
	bh=BMiohrASLEFWi2YJxbihqZgDoD90cF4iUVlEizunU2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzdUWroByQ89IrtqP15p6pajRstl/BheECxmatDWEjPqRXoNStquSZjBkLtCOK7Byf4K6kz19Rgaj64roNUmmRyl4VPcl33EXFtMiucU3i4ljEY0JvWnk9iJByVfmPHpCto9pK5Vh/OiMFFu2TzZdJbXsX218PspHWO5YWl1v2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qt8ATXe5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B473FC4CEE4;
	Fri, 28 Mar 2025 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743156426;
	bh=BMiohrASLEFWi2YJxbihqZgDoD90cF4iUVlEizunU2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qt8ATXe5NK0L9Baj87shTE7qO/0oe7/Iy1i37tvzfDiJqEnXhxjzB/xqqgFLiCA0t
	 D83QDxCBeYRTtKDyeQsV3xtAcnFszsGLh083p4WUYf6vc1yvgB9AiH24CYnqgcLy1o
	 1Lh1PWd+bpXxnql5Ucy4VAeIKLEY56/seZ7NG8A4=
Date: Fri, 28 Mar 2025 11:07:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Frode Isaksen <fisaksen@baylibre.com>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
	Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: gadget: check that event count does not
 exceed event buffer length
Message-ID: <2025032817-perceive-deeply-91ec@gregkh>
References: <20250328085603.2156517-1-fisaksen@baylibre.com>
 <2025032841-tactics-linguini-f2ca@gregkh>
 <CAJ03sU_Ad4nc=nvNU7Z+bjGYF35BEh_V5suWw+Vi0pb=imSpQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ03sU_Ad4nc=nvNU7Z+bjGYF35BEh_V5suWw+Vi0pb=imSpQA@mail.gmail.com>


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Fri, Mar 28, 2025 at 10:57:46AM +0100, Frode Isaksen wrote:
> >What commit id does this fix?
> It fixes commit ebbb2d59398fb7ef92fae83d6aeba0cbb2b6f99f ("usb: dwc3:
> gadget: use evt->cache for processing events").

Great, please add a Fixes: tag.

> >Should it go to stable kernels too?
> Don't know, it happens extremely seldom. First seen on kernel 5.10.

So you do not think it should be applied to any older kernels?  If it is
a bugfix, it probably should.  Please resubmit with the proper cc:
stable tag as well.

thanks,

greg k-h

