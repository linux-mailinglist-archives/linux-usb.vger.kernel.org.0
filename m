Return-Path: <linux-usb+bounces-18675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF879F7A76
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 12:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 883767A2F83
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 11:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F0B223C77;
	Thu, 19 Dec 2024 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="poIOKeDB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC072236F0
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734608135; cv=none; b=oGU/T2DA9O6Cq3Tok2fap71984ZquytlkAlDQ5uV/qYWT9U9hnuOOOl4F92/pPpVszK56nkuhiEeNhZlvIh0+iI+Dh7gkgRYgo+zFxe0tl48tbNjMLZKxdNcIMctm4umPex3LM0Px2olxw/1i8+DPPbP8/R/WqdwjdbUbNuKZoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734608135; c=relaxed/simple;
	bh=wGn0TILzcfCZo7BnukXQ3VDItwtOAE2u1/bLRzNoouI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZPUoqsqxed75vTfeLgvQHSO5NrIfRaQ39APQtzgBi6Y81WeJHvyLV/873BlHHi0+qlCP4FNQn05ipA6D9PFKL1mZZTwh0Bp3J4GToPtI1CJJKFihNJKVPucYAf7lIC1PIW8WfVb2dVop8FWr3K6rL7nxp6CfqQo0VOluZ6jYcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=poIOKeDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05136C4CED0;
	Thu, 19 Dec 2024 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734608135;
	bh=wGn0TILzcfCZo7BnukXQ3VDItwtOAE2u1/bLRzNoouI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poIOKeDBd/qofq/DESffeHc5tfe58Q9YFFWXMZakvUGVrf7iLT2U83Aquju7yVUQy
	 H1IgMYWc21sbuUSlypAU1q0NlEcOLkR/SkBA+T0ZcNocBsHYlW9Fu8uZm2h9ztVe2S
	 F8Pzvn4S35m1iAb3VejTQfajeBG52amZTuvTpbfY=
Date: Thu, 19 Dec 2024 12:35:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v6.13-rc4
Message-ID: <2024121920-trifocals-unlaced-9608@gregkh>
References: <20241219094723.GH3713119@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219094723.GH3713119@black.fi.intel.com>

On Thu, Dec 19, 2024 at 11:47:23AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.13-rc4

Pulled and pushed out, thanks.

greg k-h

