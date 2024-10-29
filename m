Return-Path: <linux-usb+bounces-16806-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A219B40D9
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 04:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B5A2283801
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 03:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06261FCF77;
	Tue, 29 Oct 2024 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X4juaSdP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625491FCF63
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171584; cv=none; b=ka1Ev9XjS7WuBFB+VCZEZyM8qAXb/yqvq7DDItrqdVjbPkXVuVQ0v6NHQWAyENwmLaTJRJQ6UGhsf6is0MyAZihruydqQuirFOaHFWkbB4VQORoNdQjy8H0+/8sRdUtxWe8LsCbaQvkErYLQEVSJp+oAQp03TB6sHMsuVuWbdek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171584; c=relaxed/simple;
	bh=U6x/pgDLbkgenpJfxPXCfBJcTyrfqm35yimz/j6r+1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bF/OSRuzhh/neQLQCgqx0K4sQVAuObpg83iiMxTLXcRk6tu9x/N8RCl/jwEQ8B6eJZ1oU6DkQc7SWsHcKS4zLPCyZpgkELngDA1dtm0YJn9uuT+dV7+j7zZ4LhMFgq02GQaGUaWWUBtO6Z1n3AY6CE92LAzLdCEdFiBvkP9CbqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X4juaSdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AC3C4CECD;
	Tue, 29 Oct 2024 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730171584;
	bh=U6x/pgDLbkgenpJfxPXCfBJcTyrfqm35yimz/j6r+1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4juaSdPt4CTrDUBQ03Juc4auqb4U3d3cin02hdlSr1gEWnTV6CzAEempMzzwrz88
	 TxvZyvyAQnedpyJDTSHlhhwPtzCweROA5W7p/Aqhs0FhDOVEQqpqx+/NlhQsdSH0Hs
	 dj0bxxDLxNlRP/OwVGPTtatnepSHsHNlFGvz2D9M=
Date: Tue, 29 Oct 2024 04:12:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.12-rc5
Message-ID: <2024102942-rickety-causing-e766@gregkh>
References: <20241025061542.GL275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061542.GL275077@black.fi.intel.com>

On Fri, Oct 25, 2024 at 09:15:42AM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:
> 
>   Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.12-rc5

Pulled and pushed out, thanks.

greg k-h

