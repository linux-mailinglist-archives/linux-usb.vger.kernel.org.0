Return-Path: <linux-usb+bounces-25128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEED5AEA218
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 17:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E0214E6178
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 15:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3162ED163;
	Thu, 26 Jun 2025 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nhg3GA+A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90C22EAD1D
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949889; cv=none; b=D3FDFLSv3+FgYhMNPbOHTTdapUuEgOXZLFg2fpeXrTqrg/dppcZavffZh7PG6CkbRumAdqf3NzOexe8ZxDfjFN6SXN/BdjhkCp69HnOBd+KOdRp87yNsAHLcYpuPB6sKdBayITriG22wPPL37TLIjMyOuPlNi2pvNCr5DVWhiOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949889; c=relaxed/simple;
	bh=y3iq1kXhyZOEbcCYE21f0lZDxJ3vD2lCbwnmQI2dM5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQVgJ1HrmUr5s4GHRhfwOhn/5UB4uyRg0YgZcoigd2JZZIhJgt62IGGqFdA1gxBYDsJZdej4Zhj4Y72SYGPa85gGDsK3/8ZXhhpLBDkyUNuLft/54ZXDmueTfJ6F1GA9DAa/sGGsgEUNRV4xELDQQR2BZLijaQ5NoAU4sr6zdAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nhg3GA+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220B5C4CEEB;
	Thu, 26 Jun 2025 14:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750949888;
	bh=y3iq1kXhyZOEbcCYE21f0lZDxJ3vD2lCbwnmQI2dM5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nhg3GA+A424/ac1nzb1Ez8X1PnIDuW2r2XihJn5gNpWYiLStYOHoF8zzQD+TjhjZV
	 Rrp/2Vz8iWqpMaFvcBewiMcnLMG4I+vYZGLxihmrwBwDiiIS+RuiT+JOMWD+SfhSbI
	 jkBh1GKMqLJlf9O0hmgR/QFUqMPon8duwjS7OAuo=
Date: Thu, 26 Jun 2025 15:58:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH 0/1] Fix "detection of high tier USB3 devices" patch in
 usb-linus
Message-ID: <2025062654-juggling-crown-8452@gregkh>
References: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>

On Thu, Jun 26, 2025 at 04:01:01PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> This is a fixup patch for
> 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")
> that is currently in your usb-linus branch.
> 
> Let me know if you instead of adding this fixup want to drop the original
> and me to send a new 'squashed' patch instead.

This is good, I'll take it as-is, thanks!

greg k-h

