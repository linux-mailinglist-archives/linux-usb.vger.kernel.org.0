Return-Path: <linux-usb+bounces-25125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35673AE9FDF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 16:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF9F63BFFC6
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 14:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6D12E92B8;
	Thu, 26 Jun 2025 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="nwR0HYFE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OgxiDQ3e"
X-Original-To: linux-usb@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63F72E718A
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946701; cv=none; b=nfUWQEowgv0dwN7ISrLTUa2h7laXYosu9OUTW6V+gkWoT3qF/d/ypLVGZ4W1wPWf9h2l0rKwvqFHzDlM1rwPhOcDBo3n7nq4ecVMenC11/LyKMiA+enyafQrZPorCY4uXdDo+wUJnyf2TQcPEM4CbrvWDK1ip0JClNU+xmlJyb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946701; c=relaxed/simple;
	bh=BJ8QZzleztNjIsu9/THvi0uI0E5MsWXAmM8KhaXj/Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlxjmBBx6bwgYDM+/KyO67PYDkl9T0wyqJqZe83fOsmQFRHJmcR2oZBgJhU9KZlj5DQ4IGPpmLtSg3arcKU6nSaeCMbkQPbZxahie198JGs23XV4G+Hp0iW0NeZ8mkSYLX7y7uoM6AfbW+w7pVjYsjXE62QDA8DII6GC/6z9ymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=nwR0HYFE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OgxiDQ3e; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 829DF7A0116;
	Thu, 26 Jun 2025 10:04:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 26 Jun 2025 10:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1750946697; x=1751033097; bh=BJ8QZzlezt
	NjIsu9/THvi0uI0E5MsWXAmM8KhaXj/Po=; b=nwR0HYFE5xjHkoOjPW21kRA93Y
	yEG4qYRrXDYiOQgepkpOjC/8UiwUN6nZZY7QAhyUiZmP9w/s2LoYD7VbF9w6OY+/
	g9abTsRnEdwmDtbvm/QdnDgq8yZYdJjDAmL0zNlITMscnmjmg7ue+NQGTSt4fUjX
	bhxKpl5/Ccs34fJpp79XY6ZzwBzjwNgx9aaPkPYLzeLkaGd3pvk4CXwRlTW/0HP2
	GTdsvWB3DpEplNJy2gdRtOBVBzbLQ/GWBEHm75MBiL261roxNr6yHdqBV80x4mDi
	IVJq/spJWCNzByMR1Ig07PLsoV26SEwH1+JS/BNqJ4XoiGQdACu02veIA6cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750946697; x=1751033097; bh=BJ8QZzleztNjIsu9/THvi0uI0E5MsWXAmM8
	KhaXj/Po=; b=OgxiDQ3eMv5hAV2yUUs4VtmJfi+qTBI83U96ChixBYCvgFJS38I
	OAdX1TLxxB4V7AtUG4lkEgXCOC3bmsvjM0sCPCw3hV3DevjjQLw6x2EWoPpZOzjb
	13osNVLeN4rhMrCm3H6MZWUGMmOr16qkjcLGXxedQsfUVl604ZQHcGBSmnA6aO54
	YrBXsS6EM+COBOuhzYsewAZBwp6zktbHBaUI8IUefShDAEfvD2XiKqOTlwn7VjJg
	OQFmPP0CCoB6MMZBtZNyoxuORT6GLDljn2LCRWjxhtkQ8pwvDQmoR3SqSVjCLY0D
	ESpbyLsKyW728woJ2WdXr3/r9Zq0vpPKHpw==
X-ME-Sender: <xms:iVNdaPPzvSdQmEnJ_lwaKEMzwSrGWuoy8HTgtUnxaZsCwCzzcacJIA>
    <xme:iVNdaJ9MB3s0qLEetLVQfnAqHQZaybiYCrivz_uEKJ6w8pfL68gsxKH_m9YUbgSlb
    -SPyahCPBLLOA>
X-ME-Received: <xmr:iVNdaOTR5mw3e1eiJWIWQv3AjZhz4fdPAOH_Vc_zSIubHIgMLDsu3VqN8FM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvd
    enucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggft
    rfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufe
    fhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopegsuhhgiihilhhlrgdquggrvghmohhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:iVNdaDui7Tmjd9fiFEEGmdp9xZ6DTqQqKLFwCfeydNtKDan_hvl0Iw>
    <xmx:iVNdaHfZlh6XIXMJOthZpIsE-_eiYkDg1_271xZe3lQEfu_BcdBDCw>
    <xmx:iVNdaP0dNrrBdmiSSv1sLz8ufKKSXTM7aTx2FkHNviX12CfHFy3l_A>
    <xmx:iVNdaD-k1WW_MzS4D5J7YIZOh2HCGwl7cJzQpHT4ixFpnIF5SQi9ZA>
    <xmx:iVNdaDqiUM0Ta_88exIueQlpyIeWAhjG2J9lPhyJ8z3PgBE_zYpTPoB6>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jun 2025 10:04:56 -0400 (EDT)
Date: Thu, 26 Jun 2025 15:04:53 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220272] New: Latent race condition in USB code unveiled
 with optimized memset_64.S
Message-ID: <2025062650-handling-brussels-9f92@gregkh>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>

On Thu, Jun 26, 2025 at 11:39:35AM +0000, bugzilla-daemon@kernel.org wrote:
> Experimenting with AI to tune memset_64.S (see the attached file) for my Intel
> 14700KF-system unveiled a race condition in the USB code.

Odds are this is because your memset code is buggy :)

As this isn't an existing kernel issue, there's not much we can do about
this at the moment, sorry.


