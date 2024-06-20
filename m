Return-Path: <linux-usb+bounces-11485-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1C7910648
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 15:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DE5E1F26D04
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 13:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0A31AE0B5;
	Thu, 20 Jun 2024 13:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mpsiF5GX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF61AD3F0
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718890497; cv=none; b=UgbYC8weeKk5ADNswW6Wr34N1DPrzlGxxtjVW/Hlc9LmrVHu6RGX6n0Z2/y7ZtVZChLuUG8xIw/5AObu5UJ+o/Nn0FJLopUBX4WJq/UBSDVjGq5VVegCvvDVqEi8WoJ+qDXj+xLyPjWznUTSSqXpvBxiztvEMwkGnMI5YaEC+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718890497; c=relaxed/simple;
	bh=tX5Uzf532LWXeHsWref82i6E0hWRHD5a12xsHwO2Mhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0NHDmdjQsMv2lmkTHwqE+6/4C6WoKZ3yqoXne6FdcEeBaGYTwmnreGMSeUB7DQpTj1l5vidsu8GDFO1Se/9DUcNGPSeyV+OsI9tyKXyZ0XYlEq+QCPm0tQooVFXLUedj5nKKtWRz/5qRCELdZZnO/lNqH7Ha600GU0Kwy5r59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mpsiF5GX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB558C2BD10;
	Thu, 20 Jun 2024 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718890497;
	bh=tX5Uzf532LWXeHsWref82i6E0hWRHD5a12xsHwO2Mhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpsiF5GXbHabLUk/1+/ksOyaTgUY2Q9YnWcl7uT9blMeepKAvOZ5/rQRajv1Izf9v
	 01wJtvsuajYducgQfXISuAbzJCGPDqelzaFgus11QGzzwUN5os0Kjx5AMzhm1NDRtX
	 FU1qpXK3ad7UPj+1b9K/4+bhucNSwDZCsE5blFgw=
Date: Thu, 20 Jun 2024 15:34:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: qiang.zhang@windriver.com, ivan.orlov0322@gmail.com,
	christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: printer: fix races against disable
Message-ID: <2024062037-willed-outshoot-dc43@gregkh>
References: <20240620114039.5767-1-oneukum@suse.com>
 <2024062039-twerp-magnify-2469@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024062039-twerp-magnify-2469@gregkh>

On Thu, Jun 20, 2024 at 02:28:07PM +0200, Greg KH wrote:
> On Thu, Jun 20, 2024 at 01:40:26PM +0200, Oliver Neukum wrote:
> > printer_read() and printer_write() guard against the race
> > against disable() by checking the dev->interface flag,
> > which in turn is guarded by a spinlock.
> > These functions, however, drop the lock on multiple occasions.
> > This means that the test has to be redone after reacquiring
> > the lock and before doing IO.
> > 
> > Add the tests.
> > 
> > This also addresses CVE-2024-25741
> 
> What?  Why is MITRE assigning CVEs for the kernel now?  Who asked for
> this and who assigned this?  Do I need to go poke someone with a big
> stick?

Turns out it was allocated 1 day before kernel.org became the CNA, so
false alarm :)

