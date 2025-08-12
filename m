Return-Path: <linux-usb+bounces-26741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644DB21E4A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 08:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 277373BD7AB
	for <lists+linux-usb@lfdr.de>; Tue, 12 Aug 2025 06:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E132D77F7;
	Tue, 12 Aug 2025 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TtaO3+iW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B9D2C21E3
	for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 06:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754980032; cv=none; b=AMcZqZIFNwSX84q7e5+LZIOSPU24yrZ1ALiS2ej5RTyMQ9aA+QcjuuLZu+EhhHuGqIpw9WPKwfp8RayO+ClUDnp+Z/o0jkiooTPFtzBtQkXoyjfEwFMSNLxR24UhJ0Twa+r/UlnhqPgl7LfFwpKzzx6v07I1AORkUBEj/zoxDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754980032; c=relaxed/simple;
	bh=xLTviAAMGD/VYxZ6tq6Ha8Ise3ZhwyFCNNRcgdtNiJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlJF/09zCfWPjftwQnTdht941yk5zR2zY2jJrFqep4FvF3/Yj98Eq1UAN4unRVYjzolfc1Sjp7jIAOHnJGpIT1RoNlKBYSta7bJ8+FnWokuT5ZJAKEmaiOn9jiMYaWYg1+EcnT5BISqAj2MnEU2U6KJXuumkjdYeNkccSr17OJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TtaO3+iW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F46C4CEF0;
	Tue, 12 Aug 2025 06:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754980032;
	bh=xLTviAAMGD/VYxZ6tq6Ha8Ise3ZhwyFCNNRcgdtNiJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtaO3+iW7r30P+I+HHxtgM0XCRkvmKWvi+yovGQYC7mfqohp4+Y2gbO2S9EfU4a37
	 mhrsJfmroAF08CkPi6cAvPYTvDCErMk8YEowyTtltTtlqSFlqgTVhujztYnZfm3m75
	 eRxRxqPp8dqDzQguy+4Sl/BL0gEBnH/jjX7ZpvMU=
Date: Tue, 12 Aug 2025 08:27:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH] thunderbolt: Use Linux Foundation IDs for XDomain
 discovery
Message-ID: <2025081201-opt-grappling-cf96@gregkh>
References: <20250812054710.2910816-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812054710.2910816-1-mika.westerberg@linux.intel.com>

On Tue, Aug 12, 2025 at 07:47:09AM +0200, Mika Westerberg wrote:
> There are other vendors now that have their own USB4 host router
> hardware so using the Intel donated IDs may confuse users. For this
> reason switch to use USB IDs provided by the Linux Foundation for
> XDomain discovery.
> 
> Link: https://lore.kernel.org/linux-usb/20250722175026.1994846-1-Raju.Rangoju@amd.com/
> Cc: Raju Rangoju <Raju.Rangoju@amd.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/xdomain.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

