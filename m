Return-Path: <linux-usb+bounces-30905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045CC84CAC
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 12:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C1CD34AD05
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 11:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270EF314B9F;
	Tue, 25 Nov 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bwl5XU0x"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFCD27144B;
	Tue, 25 Nov 2025 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071194; cv=none; b=NerNOXBw4ODDxM8tZDkjcVtmapq451HxefKOR8P5wUdidmIvLhNOMrOYJ2RyvFmfbs/nunW8D4gaBFJCxW+RYMj/fOY8L5PmbLweyh831Ga+kQBNEGSjXYAWS3UO/MgrQZkpkm/1QdbNEeckgG5L+kIlD4jiG7ft9ZHa0XfuOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071194; c=relaxed/simple;
	bh=kuVZE2Dr21YvT+yDx0eSPFzLeD0a5UT/VomzlwR1Jis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1EsrT9Euafu0Pm+YbTeA3WgAVxWTycEr8e86RHGot1kavOkDlxpsLtrksHbYLl391fwYg9M+BZeb0OeGT4v+RhS9eWo1JBQZP8o/NMSNHg+PWpUkX+EsKf9wFDOi1ossFOnRsaYtEK8RaubJH1gpdrkLQirgyuOqGoWNAp6Cgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bwl5XU0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86C6C4CEF1;
	Tue, 25 Nov 2025 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764071194;
	bh=kuVZE2Dr21YvT+yDx0eSPFzLeD0a5UT/VomzlwR1Jis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwl5XU0xjqYlgzncVFd9IS/PXKCKlTfKlCJdde0TEMtjtjbRt7oHI99LJNEyXErhM
	 i0ndbobwYid9bIGOkOK569VirmiLcQDIbm+er4/JH3yBlgogesuEtyEbWrz1Tc9omO
	 UdrqgnGb4BXL5YiCiLzorntwJthu213crzTr7SMU=
Date: Tue, 25 Nov 2025 12:46:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: typec: ucsi: Get connector status after enable
 notifications
Message-ID: <2025112513-charting-napkin-120d@gregkh>
References: <20251125-ucsi-v4-1-8c94568ddaa5@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-ucsi-v4-1-8c94568ddaa5@chromium.org>

On Tue, Nov 25, 2025 at 05:31:24PM +0800, Hsin-Te Yuan wrote:
> Originally, the notification for connector change will be enabled after
> the first read of the connector status. Therefore, if the event happens
> during this window, it will be missing and make the status unsynced.
> 
> Get the connector status only after enabling the notification for
> connector change to ensure the status is synced.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---

What commit id does this fix?  Does it need to go to older kernels?

thanks,

greg k-h

