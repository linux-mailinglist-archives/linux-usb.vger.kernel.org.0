Return-Path: <linux-usb+bounces-11537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E6911FD5
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 11:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27561F21304
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 09:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D174716D9D1;
	Fri, 21 Jun 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cr/inEdl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CD16D9C6
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718960250; cv=none; b=O1TzsggUAP5Yejxfg9bhIzLHIX4XvdvwNqIjxxSYpdrNtYJg3ls6ioYJF8ERI0KoAF/sM6qM4lzPn0oyWOpl1fLSF6yA4menJeIOBVCo8tiwVUNiPhUVGdgJWVtKcXNWV1DHmRJ6uP4q/pLZpPlhxJ9TwqUfoxanAmAzET+T1ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718960250; c=relaxed/simple;
	bh=BPid2ubNOck3bQc42+uq22gjWpG55ep6oEErgS8Daso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJqMsaLIQmAYJzbAuVBBlIqUw6jbq8oxC7qXw10om1ALH8AFBiAdB/VASRCULqpYzfD7SRH6NnLpQUEzfnZpnv0NHPxFD0U5tzrm+o3pYPvG7zwHEJFbalIvZZ/q+fjD7C2xoWCvEpfkJFJ71FAyQY5rYYo38dNx3RGTpeTRtUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cr/inEdl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605C3C2BBFC;
	Fri, 21 Jun 2024 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718960249;
	bh=BPid2ubNOck3bQc42+uq22gjWpG55ep6oEErgS8Daso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cr/inEdlEYgTijYzUvFUIAE/Aas4CUevxWgCf5LJ7Snw8N7/3VXnLIX98PgzEn1q3
	 5vCNxGRCna0XM/yCnSmbEq793LzoCpoGnUZuQZr89JFYuyPa5zkQd/yBAFVIvsstZV
	 1Bgo2vWRd1MqkHcQnYs4pvwwbLL4XBbM9MTKjx3s=
Date: Fri, 21 Jun 2024 10:57:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: minh quan le <minhquan07032001@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Repo: linux-usb-gadgets / ptp-gadget
Message-ID: <2024062113-open-knoll-e452@gregkh>
References: <CALzsdVJ+Dy=z1JGur71CG-ZzoCH6nxbCuRBHVdOQ2bCgiOeutQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALzsdVJ+Dy=z1JGur71CG-ZzoCH6nxbCuRBHVdOQ2bCgiOeutQ@mail.gmail.com>

On Fri, Jun 21, 2024 at 03:45:49PM +0700, minh quan le wrote:
> Dear Linux USB Develop Team,
> 
> I am trying to use your ptp-gadget repo. I compile and run the ptp.o
> file successfully but it shows nothing. I built it on Pi CM4 with a 32
> bit Raspbian OS and connected it to my PC. But the PC cannot recognize
> Pi as an usb device, I don't know whether it needs a driver and how to
> install the driver. In addition, I use Functionfs to create a usb
> gadget and mount to it /dev/ptp directory, then run ptp.o.
> 
> I hope that you guys could explain to me more about your ptp-gaget
> repo and help me resolve the above problem. I am looking forward to
> hearing from you guys soon!

What "repo" are you referring to exactly?

thanks,

greg k-h

