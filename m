Return-Path: <linux-usb+bounces-18823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DD59FD1A7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 08:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9FCD161C31
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 07:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7031714C59C;
	Fri, 27 Dec 2024 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1BkDvj9V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0E85D8F0;
	Fri, 27 Dec 2024 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735286206; cv=none; b=blUlNqTWIfoQqoShfFN+yjuDH40n/TejaAA7lk4nJuiN7bjSub7RyBwmkF5jH+wBqbLC7ayyUt+HLWMZus2NcLF94aF5rIDiw1cpbcSHN27+Q1+dw0WUW+DckFyiJnnP8KXHygK8qXn4/tTGxBnsZpawxW9jOrdNWRdpG82mSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735286206; c=relaxed/simple;
	bh=8eZt5KNdbE3/PjOfTYayJQeTyW8Dwc4vh8YVCW210w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmN8vzUn3E8Q9DB814AYc/FYrBic41WMe0MS+n4BJ/unAnfbct9u8MgeAb0POJBjrff+a0DdQeoE2/+IWPWmJN3JEMzYK5MFivhuK6uinxNZnFk+LVb0RFbd2KlPjb4QvlatBZELoy/p3rRvrP94KWKd4g9jLy+u1fQsycuwwDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1BkDvj9V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B2CC4CED0;
	Fri, 27 Dec 2024 07:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735286205;
	bh=8eZt5KNdbE3/PjOfTYayJQeTyW8Dwc4vh8YVCW210w0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1BkDvj9VBqhuaMkO6zwBO5sAW5/BjemH4ChufWUtz/aBUmjWkCvqx8lKVba02t+II
	 OWebqcyfVZksW5E+PRsJFr8qigYBT/YaJj6WwG2RTz3kFtHOS5qYwCxICPSnIvpBZ9
	 jPU9ZZnHVK7nyoHEtZURvlGdkZFsnfQUaF28TM7U=
Date: Fri, 27 Dec 2024 08:54:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com, dmitry.baryshkov@linaro.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: make yoga_c630_ucsi_ops be static
Message-ID: <2024122743-operable-treading-aa03@gregkh>
References: <2ffd08092fabaed0bea8b7a5e19e5c9464e76077.1735278513.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ffd08092fabaed0bea8b7a5e19e5c9464e76077.1735278513.git.xiaopei01@kylinos.cn>

On Fri, Dec 27, 2024 at 01:51:51PM +0800, Pei Xiao wrote:
> sparse warnings:
>     drivers/usb/typec/ucsi/ucsi_yoga_c630.c:101:30: sparse: sparse:
>     symbol 'yoga_c630_ucsi_ops' was not declared. Should it be static?
> 

That's a nice warning message, but doesn't explain what this change is
actually doing.  Please read the kernel documentation for how to
properly write a changelog commit for what needs to go here.

thanks,

greg k-h

