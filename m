Return-Path: <linux-usb+bounces-19159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 164B4A07156
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 10:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D4A3A2CB5
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 09:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80362153C0;
	Thu,  9 Jan 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="WLGJFLJH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1721518B;
	Thu,  9 Jan 2025 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414433; cv=none; b=Ij6mNpP//fAklBvvFJlO7H9wPi28bEw/EJHDX5X+xKIS99IwL0tUUsptKetBX84VfCIfGkCJUY3w5LJi9MhLjx11l1X8ayzmA8oG17s9Tbqm2nxs2jovIaz2bC4SGoCoT290uOOHeeIGrhW0t+zZEO6S49sDFvac7NL82BPrDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414433; c=relaxed/simple;
	bh=5Uuo7GIQi6l554vNb26zWhXM2+4wEaja8beiy5977Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfqY6wCNgttmIasMR7jsqxZjTcUXRHS4OL955tkBVbWxgPx01anYG19E942uKr4rnZuYHt4Kb6Bec5OA3G291Nov6WqpN8hP68a/94c4yLrHTlvkHq2dAlZLNVvoV4UtJB58fTz6ydOPi8M9Q/ESYJHDb+lMU2u+ViD6FuCvuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=WLGJFLJH; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 396981F932;
	Thu,  9 Jan 2025 10:20:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1736414421;
	bh=vcT5GsPR03/Mu+ViF50B2oZhu6Q+cj9VsPPi5wONoC8=;
	h=Received:From:To:Subject;
	b=WLGJFLJHtV1p/BHFjx0eCT8p7b6zvhtvAQBWNr5qP1MJFqxn6GwQFPW8AsOUP7bbx
	 c4HL3C2RioB6D6QwVjlUnKwRhC31G5zdHkNaiQG5k2UW5DTaUh2TiBW78MyRA/OPFn
	 v38lf1XviMS+qrWyY6ljTs0TTQ0V/CZdWp6nVkIn973iF+dDOzWPi7jS64HBDuyOLg
	 JmR1Z0fleCDIajFa4K3Gs4YyiytMdNCvQe3lrb1DGfyeAM2HUq6n4c6CracIt3Ua0R
	 vW7poUUyHYcTG7tPpWzQUTzkuuKH5L0WP4TW3EQ+xGHCZpt7GqIv84dOemZODy/QQf
	 vud2BeclTbW0Q==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id D67237F84B; Thu,  9 Jan 2025 10:20:20 +0100 (CET)
Date: Thu, 9 Jan 2025 10:20:20 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-usb@vger.kernel.org,
	Peter Chen <peter.chen@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, ritesh.kumar@toradex.com
Subject: Re: USB EHCI chipidea regression on NXP i.MX7
Message-ID: <Z3-U1DXdMQ0eZaW2@gaggiata.pivistrello.it>
References: <20250108093101.GA22448@francesco-nb>
 <20250109073500.45gge4abb4h6mmay@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109073500.45gge4abb4h6mmay@hippo>

On Thu, Jan 09, 2025 at 03:35:00PM +0800, Xu Yang wrote:
> > If the USB port is connected to a USB HUB, and a device is connected at
> > boot time to such a hub, the following errors are printed and the USB
> > port is not functional.
> 
> Does this happen 100%?
> I tried many time on i.MX7ULP-EVK board, but I can't reproduce this issue.

The issue happens with i.MX7D.

Francesco


