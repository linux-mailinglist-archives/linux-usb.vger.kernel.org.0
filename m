Return-Path: <linux-usb+bounces-7856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0956878F1F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 08:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 664B4B20BE8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 07:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87536995D;
	Tue, 12 Mar 2024 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GafU+9zw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31522B657
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710229196; cv=none; b=SLNCdtWGu3ya7IrSpUaEh2SX6ae5ol3I2eZHVIK7RA/Xl3fU6YeWazbfjsUPki26GQQ2ZIEbKFtmtMQpc3lbn30pwQKvIkI6psPV5yQohUmr1/9znRwqmhELM2c24efZEiKqh1G4/oqNqiyOsRcLnAL1pbAKNqvNuHMWOQ/sG4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710229196; c=relaxed/simple;
	bh=OZRVd3UIG0VasT7oR5J3DGeby97zRFMqZcZytV+3hwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVEfjw6phHk8+NWuvx+6RpdWSi0OJPszGj6Uz8V92LUP1eHHj01XjLks7yzN6BueAW9V51hpKYEWjaa+jQ7HMHNcvGFhQclbnm8hFbn7WlgarNT47q1bxiGgKalcQO6MSTHWaPUUHNKJYN4IsscPQ7J/ppm58dNAYJZldmiVGCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GafU+9zw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66A0C433C7;
	Tue, 12 Mar 2024 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710229195;
	bh=OZRVd3UIG0VasT7oR5J3DGeby97zRFMqZcZytV+3hwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GafU+9zwayveAkdI6qcOEcoe/QaEhPAbgdqqTZXNVWf0wWlG8WAMCcYgxh0URSysw
	 G+n+Rl7a4aVQpJHY24Z5r4WTnWZ052HlJRVGSkA0GLv5IsgCKhcuW8JvkFXP5iQvlD
	 e8k7msBjoI025Ome0DM31evFL7KOt0kiJN7rau9Tj2VM/YeMprHl2T/kRkPuvdQRvu
	 7hBVy+ZspZ8TMs9MJjPRBCiqvCBzoauByWbtoPNuPHAVQBuRafAVpFJgy+68jAOsPQ
	 mxcNlQbCKjPakyA1Z25tlqLPF4ePdNhqHwM3JwLK8EAlz1BI3bsBpuM2MWJhZ+eZcb
	 i9quFTxpkOm1g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rjwjy-0000000070k-0GHS;
	Tue, 12 Mar 2024 08:40:02 +0100
Date: Tue, 12 Mar 2024 08:40:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com, daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Subject: Re: [PATCH 4/7] usb: misc: uss720: point pp->dev to usbdev->dev
Message-ID: <ZfAG0uEmtiOBNeR_@hovoldconsulting.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-4-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312055350.205878-4-alexhenrie24@gmail.com>

On Mon, Mar 11, 2024 at 11:50:29PM -0600, Alex Henrie wrote:
> This avoids a "fix this legacy no-device port driver" warning.

Please be more specific.

Johan

