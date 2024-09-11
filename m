Return-Path: <linux-usb+bounces-14942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC79753C0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 15:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAE251F225BE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 13:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A6E198A21;
	Wed, 11 Sep 2024 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E6gV7Lzt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54089193099
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726060705; cv=none; b=UKHLe3VAFeixKHdnFcx3LCu5H2NohUIgs7QWfX3vhpDre1v02eWvST8ntpA4a/i4XUDj9Cy6FgOAUsNeqYhrwf31wcvyD6tsg8pxXbvNKWumsn3qQMtoabEHvjuR1CNhHxMfZx0+YU+TF9TM7XAxp3zTzWnbFKjKcwkYUWJBd14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726060705; c=relaxed/simple;
	bh=A7zVjjQnOtbeckLDNbKIVqchtdGVvcZ1y+RFF2KYV44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQJ7hSNuiqi+Afz4Bj8eg43li6AJE4W2VoWqGCCJAf1gf93SpJR/53mZ9KKYYWBYfEWhyuVdB7xhR79VikkA63HKjYsU0B4kZkXZ9pu+rcQMiR26RlrWO2d8xzzFy62P7YNbV4lVyJf+obQfaiGMgvZHA1ecbUG3bW2mxLlTCP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E6gV7Lzt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D96C4CEC5;
	Wed, 11 Sep 2024 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726060704;
	bh=A7zVjjQnOtbeckLDNbKIVqchtdGVvcZ1y+RFF2KYV44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6gV7LztOAhEqvDJ/dmVj7si/G+IEh/OSLBcHUrXaG/FwmHRygRrMBRKOkiR+Fq9Q
	 XVFrBJwLgCeShR7jFDnWK1/9trDcdNYmFyW3XsxCIaIpl/gEoWa7T925PKbj5HrYhX
	 R6ZlLfU1fv4kDBEnyLM0LNX6LrwX1/md9Z62KNgY=
Date: Wed, 11 Sep 2024 15:18:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v6.12 merge window
Message-ID: <2024091106-trace-certified-8334@gregkh>
References: <20240910092810.GJ275077@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910092810.GJ275077@black.fi.intel.com>

On Tue, Sep 10, 2024 at 12:28:10PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 47ac09b91befbb6a235ab620c32af719f8208399:
> 
>   Linux 6.11-rc4 (2024-08-18 13:17:27 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.12-rc1

Pulled and pushed out, thanks.

greg k-h

