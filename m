Return-Path: <linux-usb+bounces-9452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2BA8A9D55
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 16:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A3B281805
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 14:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A7F161935;
	Thu, 18 Apr 2024 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j1hM52jT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EAF548F8
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713451322; cv=none; b=WwGF3SnlPt2JrQ2+n2wnHT32F6FGBCJrHaMYAf29VlzOcTQF0O7IAQf5Ux/50U070Df8/3IshBeUOnfAeVT50NJ/tDD243uS2K434nk8gicV067O36KDYKDG9vqzqmn9glF8quHomSgidfkTRJg7Ww1+Xj6d2WHrNbQbDknUDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713451322; c=relaxed/simple;
	bh=vZCukj1HCS7I9ByYk86O84TTM+csd93QjbH+AcvFWJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FM2tWWR0HjcnHTw6f9Q4nEJOVdxuVemNlN/Z1DOAUW7tfCD52/aUvtT5XK6tA5F27WzsUpAjGLmVOzSXOzz70feTLyJqOrrumXJPuAn03CDoBuMuyMwdEBxFaRxuxMl+W6WZVv1yIXhsuyJkztnqvJcjQCDq0OH2kXe/50j8rHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j1hM52jT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C202AC113CC;
	Thu, 18 Apr 2024 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713451322;
	bh=vZCukj1HCS7I9ByYk86O84TTM+csd93QjbH+AcvFWJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1hM52jTdA8TRqg9XT1mue1lLF/eKx7X2lJzJZJ4hOMsTXABivKBGguMSiEVXaaGm
	 5qx9blVziDEfNizovUJXSg9BjooG/4vLjU+HypTKXkQo3/qGFkkieMMc8K60DHMRuB
	 7NaFUu/K1frWBYcR3Ex46ZE6T5qTWn4s91oiGZfw=
Date: Thu, 18 Apr 2024 16:41:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_fs: add capability for dfu run-time
 descriptor
Message-ID: <2024041850-atom-spirited-3369@gregkh>
References: <CO1PR17MB5419AC3907C74E28D80C5021E1082@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR17MB5419AC3907C74E28D80C5021E1082@CO1PR17MB5419.namprd17.prod.outlook.com>

On Tue, Apr 16, 2024 at 08:15:03PM +0000, Chris Wulff wrote:
> 
> Add the ability for FunctionFS driver to be able to create DFU Run-Time
> descriptors.
> 
> Signed-off-by: David Sands <david.sands@biamp.com>

That's not you :(

