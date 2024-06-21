Return-Path: <linux-usb+bounces-11539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D7912267
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 12:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3721C22FA3
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 10:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82B917164C;
	Fri, 21 Jun 2024 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WVmRPn+m"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC3B17165B
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718965768; cv=none; b=NzS96OvGVndDDmLDfKVIvRigfBH2l/AlwLoMaEJpdrAdA0bnrPo16VGubHsSJ4OoBnEzQQoLnhHq1i8KvJWHEB19u/T2AA7AJspWDPT2CR63KctwlKENX+pXX7l++EM4gAP9F5SE6B0nUU3+7QdrIvXVHeMoFzVbbL6YJ+wgr4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718965768; c=relaxed/simple;
	bh=SdESykqwYFqfYYTWRM6ppHyzfSs/uLaUhHzlKtB+msQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGgXe60jvf1bedoisjsaT8D1n5ig9NgTVR8W1HzFbaoU0swIwfKZ7CEsnvR9/JmLakJwcgeDG1UNmCFt9unjTv9oMaJmpRP2hIj/Cp2CNcKJyFyGtN/5c41b3IWTswUcJoElYA2DGnKSNqcohTXrB/kn5gvSLf3wQkLaXe45Zzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WVmRPn+m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F363C2BBFC;
	Fri, 21 Jun 2024 10:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718965767;
	bh=SdESykqwYFqfYYTWRM6ppHyzfSs/uLaUhHzlKtB+msQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVmRPn+mS0j1uXZCoqqv6VUrUSeNtI08j1U/7n4lJ77v27eZ+BCUNfpOPF3mDm3Zq
	 mdYDEmBTBH94LVHK/bKbHqLdpC0kxFAwas4efhKTZJa2WTxqA36a/7GCXIG/+iSna1
	 +lNgkwoE7Aqr+l3q6/86G5WLOcCmZGQCPtFqbygo=
Date: Fri, 21 Jun 2024 12:29:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: minh quan le <minhquan07032001@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Repo: linux-usb-gadgets / ptp-gadget
Message-ID: <2024062104-pull-spearmint-068b@gregkh>
References: <CALzsdVJ+Dy=z1JGur71CG-ZzoCH6nxbCuRBHVdOQ2bCgiOeutQ@mail.gmail.com>
 <2024062113-open-knoll-e452@gregkh>
 <CALzsdV+3xCVuC3oQaE4nCf3F6YAOZ1nyYywSzyUW9jiMDVUHAg@mail.gmail.com>
 <2024062124-dish-decade-c5b7@gregkh>
 <CALzsdV+J+99x55x7+cioKsBB9Qb76bV_1LFnd4QnuBDfMnsH0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALzsdV+J+99x55x7+cioKsBB9Qb76bV_1LFnd4QnuBDfMnsH0w@mail.gmail.com>

On Fri, Jun 21, 2024 at 04:46:28PM +0700, minh quan le wrote:
> Here is the repo link: https://github.com/linux-usb-gadgets/ptp-gadget

Ah, interesting.  You might also want to cc: the developers involved as
per the README of that page.

good luck!

greg k-h

