Return-Path: <linux-usb+bounces-17295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC69C002F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A6A8B23458
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DC41DB52A;
	Thu,  7 Nov 2024 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fxJxxmou"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1651993BA
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968850; cv=none; b=dv9CTeH1qmPN7kKn1Vo6UigzhW5ctLQ+z9o7I82YT3zuAsXssn8ST9F7xEI1KhzRuRHJRDLa1l2LWR/Jvso5wDBi1X+r1YknaE3xSkSEhKTMz7XakQf8/tbk10QMmAgN9os+3Pwk3I1HJ19BiMQ+i0MfbHsUquhPv+iFP0B+Xcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968850; c=relaxed/simple;
	bh=UfwTzqFdHBvvxWqsRk3igANXnlWz6R73b/QT4cu+x0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4m1WIbnGY46Bhc7TfkmW1VXGzBVxmCScTGbH2UNq1xYwTVNDWwkXg7QntNlz+8vKpgi69Pz6cCVW0SQgeoC7yHbDAt0mtDGPoSowt3RRMuqD+T/wvir/IuXn5M24wa57hCceVXV1WjpE2K2Km2X674oTmjl7kxrrwrhEkpkC6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fxJxxmou; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA052C4CED2;
	Thu,  7 Nov 2024 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730968850;
	bh=UfwTzqFdHBvvxWqsRk3igANXnlWz6R73b/QT4cu+x0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxJxxmouQS0ggzyi3lmIwMNv29/w/UOmP4eJn8nBJpK8gAWaSjVLv8t9FvXefi3sN
	 cdTe5ZzNKs+JP8e59xAftRHex7brpMF2jROzHqlxmKiKiPHWLH+JiIwCFjOlRUWgT9
	 2s6VHS56Nk9hanGhNN3X9/A/ndS5Qc6EAUqn4emw=
Date: Thu, 7 Nov 2024 09:37:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 3/3] usb: misc: ljca: print firmware version
Message-ID: <2024110741-unfold-condense-6c54@gregkh>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
 <20241107073718.405208-3-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107073718.405208-3-stanislaw.gruszka@linux.intel.com>

On Thu, Nov 07, 2024 at 08:37:18AM +0100, Stanislaw Gruszka wrote:
> For diagnostics purposes read firmware version from device
> and print it to dmesg during initialization.

This changelog text isn't correct anymore :(

thanks,

greg k-h

