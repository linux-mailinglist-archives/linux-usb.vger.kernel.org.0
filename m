Return-Path: <linux-usb+bounces-19665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF58A1A2C8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 12:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 536DB3A2162
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 11:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D48220E30A;
	Thu, 23 Jan 2025 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyT61fYR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933BF145A16;
	Thu, 23 Jan 2025 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737631126; cv=none; b=aA1+3AiJKtwvpv2Hk9uwv4fU5nqet6apwxmy4TmrsE+kNxUp40+0Rei1GAYufCrLRjQDD7twoNY1MXudBAvkVrk5Q3Ri5n/MXxiO1Mt1XL7FXnaCqyRxKPrtqEgSEOJQH8P814FpNUIFY94Q1KQ+q1Aw28a1JZ6AqfBgI+G0SLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737631126; c=relaxed/simple;
	bh=r9Dez7xaMItmuzMlzG+w4mCId9j6E/+v+HFpv0umWZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuvgXOUeN0+xHXFRzxPNWxQ8sLNVqtXzWKWKEYKr+jj7tjJORTn6oEbeCgZfXF+91refjrguZBIpQ/INKW3xwYLw7QkvbNK8OAanHq+8TlAiMxd4+LxG8mzeO5t3TD+/JMbCt1mluOTJcWrzaIn1rrT2uol3gg08r8IyKDKdnBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyT61fYR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BDFC4CED3;
	Thu, 23 Jan 2025 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737631126;
	bh=r9Dez7xaMItmuzMlzG+w4mCId9j6E/+v+HFpv0umWZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyT61fYRlvy3b5iA4e/nzX+vqdKZs7TfBtVfrL3XM/U/yyt7T4Z5yyZ0DLcHnzLd3
	 TfodxmAVNQi90cJfQjGe3hKRyFrDbLVPNpu7ZI7W9as1dRSggA56+S8U0KjWi88huy
	 60bn/omnmWDS0doDVfgxXnPwu30fMly4cBTX6086e02/XRBNAjq2XqObosNfV3R92V
	 JzBDzDYz44MAMQxi5DODlREoSsWSYUOqywa2/TveTDLtg2och/pAN7DFNAFsq73kUO
	 VXqMgUvkGlkOhnerHZwu2AmeuBbHpaGhkd0cBBWeq+R9NZCeqERwTnUqhM3tdj2JZ0
	 ZLjHqXpQc6ldg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tavEZ-0000000022c-4BoD;
	Thu, 23 Jan 2025 12:18:52 +0100
Date: Thu, 23 Jan 2025 12:18:51 +0100
From: Johan Hovold <johan@kernel.org>
To: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Message-ID: <Z5Ilm06wcuNsqtod@hovoldconsulting.com>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
 <2025012200-activist-disprove-808a@gregkh>
 <312dc0e4-a024-40e4-9aba-ae9074b58086@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <312dc0e4-a024-40e4-9aba-ae9074b58086@leica-geosystems.com>

On Wed, Jan 22, 2025 at 05:17:36PM +0000, POPESCU Catalin wrote:
> On 22/01/2025 14:53, Greg KH wrote:

> > serdev can not use usb-serial devices due to the lack of hotplugging, so
> > why is this an issue?  I thought that just would not work.
> 
> Well, I can say that on 6.12.0 it's working :
> 
> [    0.929493] usb 1-1: new full-speed USB device number 2 using xhci-hcd
> [    5.906574] usbcore: registered new interface driver ftdi_sio
> [    5.906632] usbserial: USB Serial support registered for FTDI USB 
> Serial Device
> [    5.906727] ftdi_sio 1-1:1.0: FTDI USB Serial Device converter detected
> [    5.906842] usb 1-1: Detected FT-X
> [    5.907809] serial serial0: tty port ttyUSB0 registered

You'd need to patch USB serial too for this to happen so this in not
mainline 6.12.

And if the port is open during disconnect you'd see a bunch of warnings
because the serdev tty port implementation does not handle hangups.

Johan

