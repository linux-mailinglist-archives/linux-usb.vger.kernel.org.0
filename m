Return-Path: <linux-usb+bounces-4203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA80814864
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 13:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4953CB22465
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 12:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34C82C6AB;
	Fri, 15 Dec 2023 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MltOoTzl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872EF250FA
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 12:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4883C433C8;
	Fri, 15 Dec 2023 12:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702644464;
	bh=DtpTA3QMhv3XDgaXilNJXp7RHJ8ed8kHFhHKPw2BSJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MltOoTzlGtBywcahIuQNwg6VwiZV+XUjQxkc5V3xMBv9OOAH8DTU4YIefV/U8tS3q
	 05gXjziQIUVqlarddPDW9vccq8X9vXwucWqTVCouJDuuVKSZtgdmQckWtpBOwYYMcs
	 yRMZ5I4UADCCw5JVhwsfnxsNUPkWjSqtX8c8O3lc=
Date: Fri, 15 Dec 2023 13:47:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-usb@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	kernel@collabora.com
Subject: Re: [PATCH v4] usb: gadget: webcam: Make g_webcam loadable again
Message-ID: <2023121555-carded-lunchroom-9233@gregkh>
References: <20231211123819.76648-1-andrzej.p@collabora.com>
 <20231212190517.202002-1-andrzej.p@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212190517.202002-1-andrzej.p@collabora.com>

On Tue, Dec 12, 2023 at 08:05:17PM +0100, Andrzej Pietrasiewicz wrote:
> commit 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> 
> has rendered the precomposed (aka legacy) webcam gadget unloadable.

Why the extra blank line here?

> base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
> prerequisite-patch-id: 5ebe1b40adede82d8413ff25a9e69f3e6b9fdfa6
> prerequisite-patch-id: 0525706498a65e3ffe25cb6ee19462da9ae6f5b5

<long lines sniped>

That's crazy, are they all really needed?

confused,

greg k-h

