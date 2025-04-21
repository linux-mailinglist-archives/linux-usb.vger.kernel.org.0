Return-Path: <linux-usb+bounces-23264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B067EA95466
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 18:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6F7A173CB2
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 16:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1102C1EBA1E;
	Mon, 21 Apr 2025 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jFRxqYUJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C661EB9F2
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253355; cv=none; b=FrbVFf16GxzZyPdAKG5PyfhqSFJEkVWR52XUSD7egOVH+qYj65nRxh3wavGGwM+qejtbR13WtiWBa7IznQcdqhrs3T9MPCnR1YFIRiooU+y1yz9BhD6l8YcuNkCBtCnlqVn1RUNzJIYfwcFJS9lQxM9EyN3o6IGWk9MnvYITWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253355; c=relaxed/simple;
	bh=5SUzXHMnJ8ZA8NFrXvxDJyChyzOu2g6SoeD0bI97gJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNou9Le4bWMvxz+3jAkKubQePyXiU3ukwYjBM7K8aiq0udQMEw3UW2Cn/4Q/2VS5hYOCCxvtQNL7KBg1VQHYRSttBbBv4UbjnToydTFlID49uvOiGd0qGntebRIKWHpQs79xjC9K/Cd+Hdsc0qpqw1CvGwrFTOeALYs7uIVJbko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jFRxqYUJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5SUzXHMnJ8ZA8NFrXvxDJyChyzOu2g6SoeD0bI97gJc=; b=jFRxqYUJLEl99kv9YdDuTS/oiD
	svrKKJ+ZVkvNWOOBMyXrBFowAgjTnQUhDFOh4H/HDsSoeC3vDYYGCTm/DmNGrMvZxLoAquLDGmB2d
	moc9aHANao411kH/veYBZ4dpMb+fSUSkFrBIxdyZrAwi/2MAwFTBsfNLyDPnxgGuyDUYr6K9kNepZ
	qSINWvqedavKkW1mlE+nwDmP0q4fY5gj0YcuMrWrKEPfLVmHyi4QFxrrdfUf375mWCPqzcWC4H8cf
	Kjz1kOQMr99yw61d0q08A40J0e9B221wL1S3RvEkolV/BpfK7+jAzHafLzeY6HB2AwqNW+dnrkKtl
	HgbxhcQw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6u7a-00000002utC-1wp3;
	Mon, 21 Apr 2025 16:35:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4DD8630057E; Mon, 21 Apr 2025 18:35:49 +0200 (CEST)
Date: Mon, 21 Apr 2025 18:35:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: andreas.noever@gmail.com, michael.jamet@intel.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org
Subject: Thunderbolt display chaining
Message-ID: <20250421163549.GA40412@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi guys,

I got two Dell U2725QE screens, that can do 4k@120Hz. I'm trying to
daisy chain them on thunderbolt 4.

Using a windows laptop (Thinkpad X1) it all 'just' works, and both
screens are running 4k@60Hz, all good.

Using a Linux laptop (Thinkpad X13 Gen2i -- tigerlake) it sorta works.
It drives the first at 4k@120Hz and the second at 4k@30Hz, which is
kinda terrible. Trying to manually set the first screen to 60Hz works,
but doesn't appear to enable me to then manually set the second screen
to 60, it's stuck at 30 :-(

Using some Tigerlake NUC, I only get a single screen at 4k120Hz and
nothing at all on the second screen.

I tried having a quick look at tb.c, and it has this bandwidth
calculation in tb_available_bandwidth(), but I'm not quite sure where to
start poking.

Help?

