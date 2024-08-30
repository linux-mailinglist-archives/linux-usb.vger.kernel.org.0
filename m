Return-Path: <linux-usb+bounces-14344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FD7965A61
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 10:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A22E628D66F
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 08:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB83D16D4CC;
	Fri, 30 Aug 2024 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaDBJaMH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785814D422;
	Fri, 30 Aug 2024 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006775; cv=none; b=K5gnwtnQVLqJdNEPZl0P0WioDCPNLDH6byS7jreiR5GI4PvKtoGmoUFWDwfn7WXY8Ggj5YXYwpUq9OWzDdREF+JydmIT5s71YQgKysW67oRujyPbLpxMi91KDCAauVws0GcLDPYV7htyw4/DU05uvJfqv0zHThNq4PErgtoRnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006775; c=relaxed/simple;
	bh=YEJdcaUfR9XcunbshRrg9SG0J6v5PICFCQwTIjmSOIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3uV8r+gUio0Kg1godmZ+NsILYHW8gGmdvyMdVyMJ26SQXg7rrrqvEtYRXOCiw8YuiMg9Wh4yklsloyHGlqHchFQSR5+7bu1MMdxtINyhSKfXOqjM9GQY9G3I3pZrQ9z2xolzd1cWO9OzbjDayXKy3aNCvl0B3dxiO1y2rAcqMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaDBJaMH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F40C4CEC2;
	Fri, 30 Aug 2024 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725006774;
	bh=YEJdcaUfR9XcunbshRrg9SG0J6v5PICFCQwTIjmSOIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YaDBJaMH2FYZ7ErEyfcC5uePaEQtH6o/v2HSjlnjYvW88Lwj99Kk88Ep/iIelMgPq
	 mxJ3WmWrf0fkaCDbocmHnLn4RPaju06Uf1oZZB22m4i0GNtbrr0qZDvhZcCbK4hR0s
	 CN5ttv3y6iRXbrIgZ7ApEnZ/K6s7wP/dymcP5d0DjjY0aojgPZMzpVKBvgrmfGOQ/r
	 A+RURvAI+q5+Z9UTrAnqG+O7e/lbUlOh+0XTscBTY0L8Pt3c0ykdOpFz+gge4MpOnF
	 cv2PkjDjNgy3HJVvzn6e9NJCfqwaGwkMdlHncXOs7kcZMG3sOneVY7yIU8IZM/+Zmf
	 h7x+YlA108ZRw==
Date: Fri, 30 Aug 2024 09:32:50 +0100
From: Simon Horman <horms@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCHv2 net] usbnet: modern method to get random MAC
Message-ID: <20240830083250.GH1368797@kernel.org>
References: <20240829175201.670718-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829175201.670718-1-oneukum@suse.com>

On Thu, Aug 29, 2024 at 07:50:55PM +0200, Oliver Neukum wrote:
> The driver generates a random MAC once on load
> and uses it over and over, including on two devices
> needing a random MAC at the same time.
> 
> Jakub suggested revamping the driver to the modern
> API for setting a random MAC rather than fixing
> the old stuff.
> 
> The bug is as old as the driver.

I think this is appropriate:

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Reviewed-by: Simon Horman <horms@kernel.org>

