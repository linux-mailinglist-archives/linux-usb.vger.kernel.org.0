Return-Path: <linux-usb+bounces-14777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3596EED9
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 11:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C911C23680
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 09:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74231C7B8F;
	Fri,  6 Sep 2024 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oAmvG5xM"
X-Original-To: linux-usb@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD991C7B7B
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725613998; cv=none; b=Cgt7ooJmxlBOdscIB5xAbuvUFgw2tOAPXvZFZTZTqomJB01M1WXUenFs0eJNVn02eOmupKjRk77Trs9qpg5u/4/IqhMrDzQdlPv7HJzuXvY9J+s+2vTBNz6nicocMMj4D38k8IOiQYu9YmdmHYFG8/xSllhD8rj6ouJty702Cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725613998; c=relaxed/simple;
	bh=FO3OnzQCYf5XaTnOgHdQrwmKtK3/VT0ecilwbwzzCWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA8uvkOFxEuQltMBfTaILxofJNnS5/tZxIwDcrvlnAdsUfSvZPzICHcD9P6f6fZoLsSK2ttHww2cZeHqkWvZ3vJW2vJG9B3LBkDc88TN+WyoVGcTW+/c6qjr/R9zZYOKr7CBeafNsiZIcHwMAXpC1g5+jGs/vxtnnuShiPlUjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oAmvG5xM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P8fxc1HKaOUB6wOiTADncN2wqkEK80jWJ2fl/jsaj9c=; b=oAmvG5xM3VZCWP5ipzfwzww5fv
	9jDwTwcbOQH3E9mnD26ScU1aCpIE/psCFCjMTsKWgtSYLmZodVtPqV2An6/MgKXRNAO/125BXTgDt
	vPt1R/eENh9MEApDvTDrYE6HtYNWkXwm36qHHX7dibB50bMOua454b6Jbt9XWcyfid/76imwvQEQM
	AAxILWlthomyXkRhiLaqLZs/9sKCjDdofUUAePKX0NpEdINNkzraGSWONxiqOfeiZU41KKP4mi9Gm
	meSOUdEZ7M7FJhsPiQHeq7ce+nGijOYKE8wAEw1F8n92OlMeNC+kk6HYlkEzlJoPjvKvOQeGUUvlq
	6hBrkgwQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1smV1h-00000000dFW-27MN;
	Fri, 06 Sep 2024 09:13:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D8D583003E1; Fri,  6 Sep 2024 11:13:08 +0200 (CEST)
Date: Fri, 6 Sep 2024 11:13:08 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH v2 0/3] Fix a lockdep complaint related to USB role
 switching
Message-ID: <20240906091308.GV4723@noisy.programming.kicks-ass.net>
References: <20240905204709.556577-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905204709.556577-1-bvanassche@acm.org>

On Thu, Sep 05, 2024 at 01:47:06PM -0700, Bart Van Assche wrote:
> Hi Greg,
> 
> This patch series suppresses a lockdep complaint about recursive locking
> that is triggered by switching USB roles. Please consider this patch series
> for the next merge window.
> 
> Thanks,
> 
> Bart.
> 
> Changes compared to v1:
>  - Added two patches. One that combines the two mutex_init() definitions and
>    another patch that introduces mutex_init_with_key().
>  - Changed patch 3/3 such that it uses mutex_init_with_key(). Added Amit's
>    Signed-off-by.
> 
> Bart Van Assche (3):
>   locking/mutex: Define mutex_init() once
>   locking/mutex: Introduce mutex_init_with_key()
>   usb: roles: Fix a false positive recursive locking complaint
> 
>  drivers/usb/roles/class.c |  6 +++++-
>  include/linux/mutex.h     | 19 ++++++++++++-------
>  2 files changed, 17 insertions(+), 8 deletions(-)

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

