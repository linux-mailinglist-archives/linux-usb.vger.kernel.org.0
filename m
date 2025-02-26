Return-Path: <linux-usb+bounces-21099-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40630A46853
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 18:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445CB170450
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 17:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74D9225407;
	Wed, 26 Feb 2025 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="aEShLF0T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB412253F2
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740591831; cv=none; b=AB6gRW+NIbGboCy6GvQ8cJ+diqZArC6qVOqpU5iVm7LL+ceLURzNz2Tk67S388xeXjvbGgx5wMXF+IhZgPxSnzNV5GbyyTJnYhT9GFm6q7vPd6UF5dw1/TriageO0ZwsmL1jNN7g+dyQBkgAEFpivsf4RMP+JkzJhl+ixxto004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740591831; c=relaxed/simple;
	bh=jyth1btC4BYmAx83Vy5KXGJbtMr6DoP7axVH7P1C3ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXIQ1gshaJu0PK4SpJMbF+zyF0bF8p9VX2Agcfr0Qp+YigTXhBar5iWczdnG5kAPafhrSzxE0dKDp5UwskOpXIvq/k0THqFUBtG7geGmgA4Jl3/A7TxfelhpPdWX/Rg3lpIZc9x7U1GyjY99wIbvIc5uU/gnyzsFg5Ubu9u7eCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=aEShLF0T; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C26F6240028
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 18:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1740591826; bh=jyth1btC4BYmAx83Vy5KXGJbtMr6DoP7axVH7P1C3ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=aEShLF0Tskn+mUlFD2WxzJR1gxisJwmDEGl2z19F3PqtDhOrtRblu3OM+0VxfIRSv
	 0AHxtG5d5COpnC30BnHwZsV68XZ0QRBMyARkR8FOgZ+hbvGvSQx9EWnxzN8r8NhLCO
	 nT2Wbkgi57CKwdVQheYf76LsHAZmypF9XIXDT1VaT4ywCecuHmFq/RypXquUunUG1l
	 0BJGJH4l0AbUcmLJ8rTZmqaJDTAiKmx8956LwDdvyg4jH2iR/AdsHHLMHw7C0jGET2
	 hnaMkaEsR/MY5vAgS5ECFIjUvDZ1OSay3sVvEkIa2rnJ996YIRVWq+tJUuzuML814D
	 ir5GZf51jXXSA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Z31zk0DVfz9rxK;
	Wed, 26 Feb 2025 18:43:45 +0100 (CET)
Date: Wed, 26 Feb 2025 17:43:45 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: j.ne@posteo.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/9] usb: storage: Mark various arrays as const
Message-ID: <Z79S0Uzxx9VJM5tY@probook>
References: <20250226-misc-const-v2-0-ab655a4a29cc@posteo.net>
 <ea5c2735-cfb3-4e5f-a7f9-40d4493bd05a@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea5c2735-cfb3-4e5f-a7f9-40d4493bd05a@rowland.harvard.edu>

On Wed, Feb 26, 2025 at 12:02:02PM -0500, Alan Stern wrote:
> On Wed, Feb 26, 2025 at 03:17:22PM +0100, 'Jonathan Neuschäfer via B4 Relay' via USB Mass Storage on Linux wrote:
> > While reading code, I noticed that some arrays in USB mass storage
> > drivers are declared static but not const, even though they are not
> > modified. This patchset marks them const.
> > 
> > All patches were compile-tested.
> > 
> > Signed-off-by: Jonathan Neuschäfer <j.ne@posteo.net>
> > ---
> > Changes in v2:
> > - Add new patches 2-9
> > - Use consistent authorship information
> > - Link to v1: https://lore.kernel.org/r/20250225-misc-const-v1-1-121ff3b86437@posteo.net
> 
> The patches themselves look good, but I still think you should explain 
> in the patch descriptions why declaring these arrays const is worth 
> doing.
> 
> Merely saying _what_ you are doing isn't good enough.  We can tell what 
> a patch does just by reading it.  What we can't always tell is _why_ you 
> would want to do it.  That is what needs to be explained.
> 
> The explanation doesn't have to be terribly long or detailed, but you 
> should not omit it entirely.

Fair enough, I'll add such explanations to the patches.

Roughly, my motivations are:

 - Moving data to read-only memory can prevent unintended modifications
   and the hard-to-debug issue that might follow
 - Const makes it easier for human readers to know what to expect


Best regards

