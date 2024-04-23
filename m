Return-Path: <linux-usb+bounces-9658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A688AF587
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 19:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 045EE1C22BC1
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 17:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A70813DDA6;
	Tue, 23 Apr 2024 17:30:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 07DC4208A9
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 17:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713893432; cv=none; b=SljvS8icUKSIaMzA2sHWzAvCfZ27oxqttlrn7URGU+zyJFtsdJPDcgKkqk0zmM3D/uzA5AauMCT8GjaxnhXjbPAz+x7jHMcSHHVwa/Fxl1EQKVBoUMC4AXo0qviYbpRU8CjjGJoHY7vu+fmc9wxKCWdeM14+UR3hf1e/UndQe1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713893432; c=relaxed/simple;
	bh=TGfJ0cmUzCDzWG0x80RhdgjYviORG91iuvKT8Q7VJ+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3NaqXa6LAGClBPKrLY/cTuaSyzxhlKk5yfJ0obtcJTpAZRNOjpFzCkZk1vnJ/BWsmyXe/PpryL1jRJvr2Pi1IDZK0lPNN5jD6SghFlJ/GPuT52ddS0Al7Ynb7PWYoEBhZyoQFZ/XJBwZsq2LSVGa2ACy5VwGl8TyJod7f6bpZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 422058 invoked by uid 1000); 23 Apr 2024 13:30:28 -0400
Date: Tue, 23 Apr 2024 13:30:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
  qemu-devel@nongnu.org
Subject: Re: Problems (timeouts) when testing usb-ohci with qemu
Message-ID: <10f44ba3-51a4-42a6-85c7-f8068b56fee1@rowland.harvard.edu>
References: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>

On Tue, Apr 23, 2024 at 10:04:17AM -0700, Guenter Roeck wrote:
> Hi,
> 
> when testing usb-ohci

What is usb-ohci?  Do you mean ohci-hcd?

>  with qemu's pci-ohci emulation, I keep getting
> random usb interface timeouts. Sometimes the usb_hub_wq times out.
...

> Sometimes there is an i/o scheduling timeout such as
...

> This is not a new problem; I have seen it forever. Recently I spent some
> time trying to understand the problem and found that the linux driver does
> not always handle all ohci interupts.

Please be more specific: _Which_ interrupts aren't being handled?  That 
is, which flags remain set in the intrstatus register when the handler 
returns?

>  Since the interrupt is shared and
> thus level triggered, that means that interrupts are still pending when
> ohci_irq() exits. The interrupt core in Linux does not re-enter the
> interrupt handler, presumably because it is marked as shared interrupt
> and returns that the interrupt has been handled.

Isn't that behavior mistaken?  A level-triggered IRQ that remains set when 
it is re-enabled (when the various shared handlers return) should cause 
another interrupt to occur right away.

Edged-triggered interrupts would be a different story, of course.

> I found two possible fixes for the problem. One essentially mirrors the
> code from ehci_irq(), the other adds a (bad) kludge into qemu. Both "fix"
> or work around the problem.
> 
> Question is: What is actually wrong ? Something in the generic interrupt
> handling code in Linux, something in the Linux usb-ohci driver, or
> something in qemu ? Any idea how a proper fix might look like ?

To answer these questions we need more information.

Alan Stern

