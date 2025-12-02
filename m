Return-Path: <linux-usb+bounces-31089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BCDC9A16A
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 06:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305483A27F9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 05:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF6D2F6933;
	Tue,  2 Dec 2025 05:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T7HInX2w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A42951A7;
	Tue,  2 Dec 2025 05:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764653269; cv=none; b=IMKz0Q/5MMEKjcQpeeRVIdEmt9x1HRzZ/4YI7UUZaRwWiTPk/W9vbNqN49KbXBkSnCqBk15eG6oUJQZcrG6d71Mnfi1E8f1RK1d2XvWZ8fHh2Kra0NX6YMJs9jSN7+Euxo6/ORjMoCri2s54enGB8T1/SApLwUDs/E8OJpyDfzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764653269; c=relaxed/simple;
	bh=yrOBU9DwcPAqZ6fPKbWux1oxZV3GR/Jk/quk7iKOQpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKGV49Ok+GY7L9aqXiMT4A7i86Sm+Y6UuG2E1R6HMDStipWtKL9m3KRpN4DPG052pbw6C91JCTF56D7Qk47T9/JMM3fOZcMYzwpB8SUaqwmshCZ6YXpev2CR6Ah36yOv7ChLRP8c/X44gS4MwLJ2yDIbGymwO7MjiYr6kIsqxOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T7HInX2w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB51C4CEF1;
	Tue,  2 Dec 2025 05:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764653269;
	bh=yrOBU9DwcPAqZ6fPKbWux1oxZV3GR/Jk/quk7iKOQpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7HInX2wkn3GycEuulaSRmRkBV92oX2WL4G1nq84Rn9qEiVqkoi9mzSyDz7Y2I+4u
	 7qSIVoQ9pl+T4bkCvamEFpxtJ8qdHrEMy1xZkmk2V50B74rvyWPoB9ICfA63s2pxHF
	 OM2DzHlLdp22RRjnFkKFEY4wLEvKDADOcuAsjzAM=
Date: Tue, 2 Dec 2025 06:27:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Clint George <clintbgeorge@gmail.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	khalid@kernel.org
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
Message-ID: <2025120200-backslid-endocrine-e64d@gregkh>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>

On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
> As part of my LKMP mentorship i have to complete 5 patches as a criteria
> for graduation and thus have focused on working on such
> beginner-friendly patches so that not only do i get the required number
> of patches but also get familiar with the process of kernel
> developement.

The LKMP internship should be done in drivers/staging/ as generally
coding style cleanups are NOT accepted in other parts of the kernel,
unless you get approval from the maintainer ahead of time.

Does the maintainer of this driver want this to be used for the intern
project?

thanks,

greg k-h

