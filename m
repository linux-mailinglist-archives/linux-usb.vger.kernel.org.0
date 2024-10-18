Return-Path: <linux-usb+bounces-16393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F29A34D1
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 07:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569291F23ECE
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 05:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2D618132A;
	Fri, 18 Oct 2024 05:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JQXNzGZl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5517BB34
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 05:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230835; cv=none; b=HZwOgYdb2LOkCWVK7h5Aq6Mee1YHAQF1gEm/3MkACWdKWm1r4ODIrF3BdLSOFApHWjaqvGcTuzkbBLa6sGsjfivXzeDAHZKmCHyTcqTTaZ2UcPapIejNnsBscRNYn68Zw53vVSi+9T7wCDUy8e20+SzSDmBXCN8Y+VR0PfiWjT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230835; c=relaxed/simple;
	bh=eY9mLY7DHFsvxyvst8BnMl+yqM2Shgbp7trC3jANch4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaYgCdkld6fmq8RLoGt5Vu4rI1BVWw9JauknZNgvRkWREF27nDx6Qpq9SEZC4TePLiP92z9cyTBTR20I/Cgt8MXzUOPimOOG6nK8Nm5CZRNOZbabh4Pd1jIzx3I95oybroBVY6a39PfDwR0joZsC26QjgSYjB3BtgH8IbTBVxpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JQXNzGZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87A0C4CEC3;
	Fri, 18 Oct 2024 05:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729230835;
	bh=eY9mLY7DHFsvxyvst8BnMl+yqM2Shgbp7trC3jANch4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQXNzGZlCZcnr/B9eDpjxIyJfPUxI0Szv63zRpkwtyqXP+0vRJ97lY8ynWSzo04Ub
	 20jP2BsO+CbncIK5hqi3Sq08G8m/kd5K9Jkl8zlhT52eSvacxHBFCL8lZFxBPF+KTO
	 TFDSJM7YuVNoay7tLHWy5Afy2aKPzuC1vA41KDew=
Date: Fri, 18 Oct 2024 07:53:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Angel D Raygoza <9bea5cde-4b55-4b34-b91a-37dbd16ce68e@startmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Usb IP Failing to connect depending of program being runned even
 when the connection talks are identical
Message-ID: <2024101824-shakable-portfolio-9cfb@gregkh>
References: <50f9a086-d873-44d2-bdda-a8e00dd2421e@startmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50f9a086-d873-44d2-bdda-a8e00dd2421e@startmail.com>

On Thu, Oct 17, 2024 at 03:05:43PM -0600, Angel D Raygoza wrote:
> Dear USB Linux Mailing List.
> 
> I have been trying to write a USB IP Virtual Device  as your protocol
> (https://docs.kernel.org/usb/usbip_protocol.html).

Why not just use the in-kernel device code instead of creating your own?
Is there something wrong with that implementation?

thanks,

greg k-h

