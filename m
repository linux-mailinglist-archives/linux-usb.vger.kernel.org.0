Return-Path: <linux-usb+bounces-30571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F242AC64BBF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 15:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id ABEF528BAD
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 14:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9125335BC6;
	Mon, 17 Nov 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mO2AZ5vd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5832826E
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391384; cv=none; b=Oxd00DtZLbInViIFKtuoXfTA4hwTmhyWztAHm6/kFrd9La4i+rCoF7xqM4LfnpPFjDMiwUjyn+VOrSKDDrI9c72Zv65V/lWj63mKb2AIw4ZYT92oSr7XVBZv4eQ8LwT62Km4+4SH+abwh3iW4DhODnuOmyy38MAccuGK0b2yJ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391384; c=relaxed/simple;
	bh=FUW7FF8r1W3YYL9VmYQ8ZQgxK2I4bKD568Bof2i6gC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJo7iNXRaB8D9WfbikX7yhAPLlEL0aYQKk/JLRwoSfiNDJJCWTU4y+NdbEO6q3Y3oBXS4GDIe9wkChEhmDU7P02zUbVhmi5QBBg4JnBNSdOYzLbpf8wpu6pLSNFir3wKTrQqx1r8jq1YXSf9Mpd0a+RzXPReHYojlVFNIhHBUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mO2AZ5vd; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b272a4ca78so597241285a.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 06:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763391381; x=1763996181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDTMAjFTHZZURat4atsXS5dyJJHx/gXD6vpgW9NtTRs=;
        b=mO2AZ5vdktTvwcCvqqpT8Vbtd0rYhceDoYeaOPGl2USzdCHvn/Gh7qetG7VRvfeQG8
         SsTmsU2M92Oal7RLC5m/0cuhF2ffeTQqzisFEeFFw67Uy3ir2Qv74Cv93ebhA2X84i4f
         uJ+Fqx7e7zaTHUEoT3sJXaiOA2lbql/9MpWsFLjre8CJx1Ob/1uc4hX5ARbfr6VCIDUr
         MTx5TPHfcVXnjl6Oz7bDx6rIu0KeX5ic2ta0o4t00wSpsZXMo2PQBr5xjwDZ6PB5/e83
         O91oSIhon2bSdcxTtJKHllEP3AtWSNLmPB/giJHIu+n5gYFNBkP0j4IPY1D1x/83RG1z
         rj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391381; x=1763996181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDTMAjFTHZZURat4atsXS5dyJJHx/gXD6vpgW9NtTRs=;
        b=hMPvtndrvWHly+e/0EBkYUtle+iUMwZlli1Yk0qDBsLasTp2jIv3Vu9gaSWVFyTP7Y
         OfQVwecoBprA3GX2GS/K/6Bv6s5JlzBEwt97XPjZixaKuYb+JBpgL781Sjpa407P+9zf
         JfkxxRdhVcx7SwPoCjLDdZcig66WKzwqFccuz5AAyWRG7dPB20N29KrutTTq4LYD3ZQM
         4hL/PdMOQqZtRK6KObUBBxTXksXILFwg8+c9eObVHJyT131hRVmXFp3u0gtdY2UoJfF3
         A8uX5kHXp4KadSZa3zW0CaRKW6qqYSPp1a+kBL5AtRqL5i1h+Ush+rz7aND85KgB1/7P
         4siQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5yyxa5nDbIDnDKm6mH1BomYs2rV2jHgpO9SnivrnTBzMKJ8JS2P3SmCSN9igOfrsvjDchm0bBr3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBdtODoMuw9axVeUZWkVKauy75E75vh//9jtfGoilSpnN2tMNi
	q0crauK8EtBTRbvGZ3Rsp52XuZ9x3U1NYclKWWuSrETcqzzu0paJSMC+KsDlCANZ8A==
X-Gm-Gg: ASbGncvynMreCPdfa3/QYveaap5F+OEbYoq24Glx82jI3U12KtMdSEsK+fLjKULwfiV
	SoksQucY7tWObwBKJyGkn/LLeV/yt2SF3sCV9ifHYxnmzyECU2/yxgVpppBqiqVaMwj3ltpAehA
	a+KetC8sNn40Eno/R4VwWXV1pCbj9j7ky3etZgHVk9S9uckz+d3VkYk7GWIQROAdLHMIVxGJJRN
	TJila6ipy9LL1CODrgfuR6Tv0crXEWhTZSTuGahfv7TcQ3pGU/It2rWWLyq2bl9ioseVmsWp0V7
	xjPkFsEGZ64EaexaowZB/V7fvCQ1WsmmPgZ8OzLXSjcv+84ZDSNARJkxwg1pV2hnCBkTzGouKsR
	7Fy0/di4cButCYsMKboUmCXfO54nSBqB8qBxEdRysIjdtLXggcv3FWuixYg17HIwcAWqZy8199N
	zrXGcDWbe4ZB4qOGEogw7Hx+Wm1XDdyw==
X-Google-Smtp-Source: AGHT+IEA4s9TEMA/DC/kZYt/NdkfOC8lgCBVVGJx2NH4cSc3zU3y7yNtT3OeFcpvLBqvdCfUiBKB3w==
X-Received: by 2002:ac8:5805:0:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-4ee1e82e6a9mr56880141cf.64.1763391381300;
        Mon, 17 Nov 2025 06:56:21 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede88799bbsm84283071cf.34.2025.11.17.06.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:56:20 -0800 (PST)
Date: Mon, 17 Nov 2025 09:56:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ma Ke <make24@iscas.ac.cn>, Vladimir Zapolskiy <vz@mleia.com>,
	piotr.wojtaszczyk@timesys.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stigge@antcom.de,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp
 driver
Message-ID: <9834be77-29e0-4a65-93f6-b61bf724f922@rowland.harvard.edu>
References: <20251117013428.21840-1-make24@iscas.ac.cn>
 <4fe5b63e-072c-419c-a1b9-bc21aec7e083@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fe5b63e-072c-419c-a1b9-bc21aec7e083@app.fastmail.com>

On Mon, Nov 17, 2025 at 09:53:21AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 17, 2025, at 02:34, Ma Ke wrote:
> > When obtaining the ISP1301 I2C client through the device tree, the
> > driver does not release the device reference in the probe failure path
> > or in the remove function. This could cause a reference count leak,
> > which may prevent the device from being properly unbound or freed,
> > leading to resource leakage.
> >
> > Fix this by storing whether the client was obtained via device tree
> > and only releasing the reference in that case.
> >
> > Found by code review.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> 
> The patch looks fine in principle, however I don't see any way
> this driver would be probed without devicetree, and I think
> it would be better to remove all the traces of the pre-DT
> logic in it.
> 
> The lpc32xx platform was converted to DT back in 2012, so
> any reference to the old variant is dead code. Something like
> the patch below should work here.
> 
> Other thoughts on this driver, though I I'm not sure anyone
> is going to have the energy to implement these:
> 
>  - the reference to isp1301_i2c_client should be kept in
>    the hcd private data, after allocating a structure, by
>    setting driver->hcd_priv_size.
>  - instead of looking for the i2c device, I would suppose
>    it should look for a usb_phy instead, as there is no
>    guarantee on the initialization being ordered at the
>    moment.
>  - instead of a usb_phy, the driver should probably use
>    a generic phy (a much larger rework).

Considering what the comments at the start of the file say:

 * Currently supported OHCI host devices:
 * - NXP LPC32xx

 * NOTE: This driver does not have suspend/resume functionality
 * This driver is intended for engineering development purposes only

I wonder whether any existing systems actually use this driver.

Alan Stern

