Return-Path: <linux-usb+bounces-29879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2881BC1F2F6
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 10:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5835C4E4B19
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 09:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA47333F383;
	Thu, 30 Oct 2025 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h4tJv4M8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B58F5B
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761815227; cv=none; b=uBrXiDJUZ7HFWrOO2kcYXae4/oSlQWIsJbKjlx8LY3REJJg0ot+qjiW6R4vkNsXkL7ZTQGyojlfkZYZ7o07IY9XxYJH3DcqMEeqsQMiUMOoo+hyAPDoFkoQmQV0XWGXaHJ9ey1SVvkrtx/pYH79kbqQDzNVeyF7eoeeso/fpQ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761815227; c=relaxed/simple;
	bh=MX/OtZofh3mDIgJONQiFaI3Uxyx8kmq9bvQLjQN6pz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx502yYxCMIwUtYyXqSF+bU5pgq2fSSFQsjoogsLCpKqXMf+CVz7MQ8Md6fizFC8AG8nPhl6ko+kNZUmxD0e/X9VzUTdmdgFHG6DT84gdHRiAU9UXV8AfLKAzD1c/+Wf3lFw6Pgz+iDLwQRS/SKedLfVcTHHAIxqKyjL1DqSG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h4tJv4M8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E5EC4CEF1;
	Thu, 30 Oct 2025 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761815226;
	bh=MX/OtZofh3mDIgJONQiFaI3Uxyx8kmq9bvQLjQN6pz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4tJv4M8L8uUqSXiuPrVGGbZW2beu4/LO7tmj6OUb22PMWbptqX5n9Hcs2ZDebwfn
	 6kvX5jRLZ0pGQLVQzpWF+jAP/g67JMQqBVSfIdGFj6PQuI8DOLKH0qGMgIPQOdvfC2
	 sGNVE1TE8uyGh53i+wAL5V7cVgBjKHmKch5OHPI8=
Date: Thu, 30 Oct 2025 10:07:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.18-rc4
Message-ID: <2025103056-prism-sandstone-c20d@gregkh>
References: <20251030063405.GX2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030063405.GX2912318@black.igk.intel.com>

On Thu, Oct 30, 2025 at 07:34:05AM +0100, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:
> 
>   Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.18-rc4

Pulled and pushed out, thanks.

greg k-h

