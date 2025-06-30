Return-Path: <linux-usb+bounces-25316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14934AEE2B2
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B163B2FAB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 15:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB2928DF57;
	Mon, 30 Jun 2025 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zzpWtJee"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C08460
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297717; cv=none; b=DudPxLm1K8JRl7UmZQn2kkxFYMLji/p0HjpPhv/xagdu2KNOXjOWTWQU3KqAK856MOxjuIVYt0ifpLtupMq2AdqdP7dtEBGE2Grz1QwYhkOSKmlGGvybcJhxyMaWjlKPTdKRS3Ezq05VeyWlJm6ML3j4mqpH9jWiiWtgh1lpdR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297717; c=relaxed/simple;
	bh=QX+ALYgsEW1nlHBBwSIvelkRAZBIP0wzLUwWzbu50xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEPgdDOpzPM3EFtdsXHNLWSwnhWrr2SGtVB7vmTKIuFB5sg8JFDTGrBprwDGnUPr9Q6rG8g36ekVxBi0yjxiwhL943HCFImbzrB/mPzICVRJEYWZmQ7r7KjK3F37Fc9cZTRx/fsgpBzl8R5OR0xe4/R8EwnHQNh9gbawtzvfegQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zzpWtJee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6D3C4CEE3;
	Mon, 30 Jun 2025 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751297716;
	bh=QX+ALYgsEW1nlHBBwSIvelkRAZBIP0wzLUwWzbu50xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zzpWtJeeBDVS2XxSD9Ju7ucBp8rVc2NCquQ7Q7Lvc8sZwaQT5iMcn9CvNmLYPhVBe
	 BywtI3A8AdRMTVUEtysNZ+uxKZNEllLB3BQMPUgT1jV7z/cCqJfCAIT9X7kQm2xOqH
	 uCICxVCe9gOGsWDwY74PK5vvI/Uk1metBAiEnJ08=
Date: Mon, 30 Jun 2025 17:35:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: USB <linux-usb@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: xHCI USB3 host maintenance on vacation until July 22
Message-ID: <2025063007-skewed-fondue-e65d@gregkh>
References: <2a4a2761-734e-42b6-96df-2cf1d1b6de17@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a4a2761-734e-42b6-96df-2cf1d1b6de17@linux.intel.com>

On Mon, Jun 30, 2025 at 06:16:17PM +0300, Mathias Nyman wrote:
> Hi
> 
> 
> I will be on vacation starting today, back July 22.
> 
> Niklas promised to keep an eye on xHCI in case of emergency, and
> I will track a few select hub related patches for regression.
> Otherwise there won't be much xHCI maintenance activity during this time.
> Have a nice summer

Nice, have a good break!

