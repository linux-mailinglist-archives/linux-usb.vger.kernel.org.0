Return-Path: <linux-usb+bounces-14631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904BE96B56F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 10:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFEC5B24392
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 08:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D81E1CC161;
	Wed,  4 Sep 2024 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="08YAiaMy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D024A15746B
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725439749; cv=none; b=bfa4aqYsDpsj5p4GgDZfLqWAQfg1p/JORp7u8mtQ/IcAFZouii9+9RHEbz/G45xvfu5iiCQ92UTBVacj09vQks6GVi43xJ8pgraabVqdrEtpT0bUmHsDHYDkm1iCV1BmvJZIilet6AqnAqUsqUMV39ZlAF/SUKE6MQ2OuUzE0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725439749; c=relaxed/simple;
	bh=+KM8T5KRKLvfur/5FxxUx8vemYVFLA8tjWktG5cVDSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVmDK9yyIj2YTFtzEgcuRs3ClRBnVcmEostWoWAvMcORXTjheESPcNham3wT8+oXTReUROu01cp5OQ96K4ew2LPbS5HSx5DBKGS0vA2MSbp8B4Z6ciU+OCKcHzLsrVGtRHJhdhW+/S5aLO2OHxvyGR+18+GW40FkAjX/hPNZukI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=08YAiaMy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6198C4CEC2;
	Wed,  4 Sep 2024 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725439749;
	bh=+KM8T5KRKLvfur/5FxxUx8vemYVFLA8tjWktG5cVDSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=08YAiaMyVSPnw2kqO3ZhRsbwDUfjB422ta0OC9ZWpWJUlYHmUEi9EnqKAoKzuuZvF
	 3Axa4JEZQE8v2PWRi02up8zutFkU673uhAF4/3HWFNfrMwj4mP92wVl6ouBtJXA7xn
	 pjqQ8Po8+f/xmC6ttuCXhhy2GTD1HppSvNT0uxyY=
Date: Wed, 4 Sep 2024 10:49:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: patchwork@huawei.com, Thinh.Nguyen@synopsys.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, vz@mleia.com, stern@rowland.harvard.edu
Subject: Re: [PATCH 1/2] usb: dwc3: Use helper function devm_clk_get_enabled()
Message-ID: <2024090400-enforced-unmarked-eea8@gregkh>
References: <20240902123020.29267-1-zhangzekun11@huawei.com>
 <20240902123020.29267-2-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902123020.29267-2-zhangzekun11@huawei.com>

On Mon, Sep 02, 2024 at 08:30:19PM +0800, Zhang Zekun wrote:
> devm_clk_get() and clk_prepare_enable() can be replaced by helper
> function devm_clk_get_enabled(). Let's use devm_clk_get_enabled() to
> simplify code and avoid calling clk_disable_unprepare().
> 
> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>

Also, have you tested that this actually works?  using devm can have
tricky sync issues when shutting down so I'm going to start requiring
that any conversions like this be proven to work properly on real
hardware.

thanks,

greg k-h

