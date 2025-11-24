Return-Path: <linux-usb+bounces-30859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DE0C80763
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C253F4E3FF1
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 12:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8742F90E0;
	Mon, 24 Nov 2025 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e6Uk9KbW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C31D6193;
	Mon, 24 Nov 2025 12:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763987350; cv=none; b=ZZHeLmaeZB/WvMDHpyQKLEjF6Hz5R8X1WxI5bxeFzrUmHom3FJRVulpPX1FoV+7FyKNj3QmQRC1JP4fPUNPy99cQpwbetNPFYLD0uTsUtYKcEMHjsI1G7Q6QN/CEHbV2w3oDP8j5p8VCdP8jxMjDDoCC5nVnbNZmC6CtIYvSkG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763987350; c=relaxed/simple;
	bh=yTAgyQKp4DIt2TnZvO1kytgyJaA18RsDMd92v64IfsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrzROzX9refx+jKwyZZ2TUu5NdxRhlYUfhTYpUDZjk+O/p7kF3rqGdb7eWs5i3WWPKuqFlUigtdXz8G73fiBN1Ea4p3o3Ulwf/zENVlthyM5LEjb4EK6/xuzqXFAyJx0l6xYw6VpPqRSD1wAptu7TDMu1bTy5IYJ65HIgmT4z/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e6Uk9KbW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2EF2C4CEF1;
	Mon, 24 Nov 2025 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763987350;
	bh=yTAgyQKp4DIt2TnZvO1kytgyJaA18RsDMd92v64IfsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6Uk9KbW/yA+R6NDpwFS+dkw9HuHkmx7asyHSkuFmq/s7A+oSRLwVZR5tO8DLvUf2
	 zcHAGjKEs9IareZvGkcQZIJZAgMu5RiNRekcQy8mxLvVvnyrSW1+L2K9MzaQEJgyCT
	 hgGBNxnWyI1BPn0yvwxY5T75T7tZOQTEPA2tjgSo=
Date: Mon, 24 Nov 2025 13:29:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix missing typec_unregister_port on
 error paths
Message-ID: <2025112448-hangup-detonate-f46c@gregkh>
References: <20251124122030.1759-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124122030.1759-1-vulab@iscas.ac.cn>

On Mon, Nov 24, 2025 at 08:20:30PM +0800, Haotian Zhang wrote:
> The ucsi_register_port()  registers a Type-C port with
> typec_register_port(), but several error paths after a successful
> registration returned directly to cleanup without calling
> typec_unregister_port(). This lead to a potential resource leak.
> 
> Add a common error-unwind path that calls typec_unregister_port()
> for all failures to ensure proper cleanup.
> 
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

How was this found?

How was this tested?

thanks,

greg k-h

