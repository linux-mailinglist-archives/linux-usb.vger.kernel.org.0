Return-Path: <linux-usb+bounces-30773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A4C72C7B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 09:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0BE0A359596
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 08:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB3E30BF4B;
	Thu, 20 Nov 2025 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umYwHn6C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8764B302CD0;
	Thu, 20 Nov 2025 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626802; cv=none; b=NOTLce+wtzZOgsxjKbVBe6Z7nygg7CuTON8yzg+CewSjVPS94NEaqfMuS5+tCbO58EyHQSYJGWThbDbxwSfAc+eop6Z+owBLQMYIv3bzh0caQpkCl0FE2+nbEwHjH5KojkSPUk1gAb+tQgDhgMoYvsXKZdJHlGwWuZeLHBwynsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626802; c=relaxed/simple;
	bh=RxDPhffDV0KuCg3hXM9CfYPba4pq906fwuxIATPJd8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXCYF/EZk6o/8C//J5YkWehgS/qzThOFsyhqYMXK1GJJq86kNG1benNQA31Za+bbOe7vKTnvcEhidi66JD/T/74ZudAXneE1G8DRmNXQJ4EJk/EQKH8XQa6RMeeizrGKv5SyIus++MFysW3jEKUNGNawT143d51sdLWHi0doE2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umYwHn6C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7375BC19421;
	Thu, 20 Nov 2025 08:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763626802;
	bh=RxDPhffDV0KuCg3hXM9CfYPba4pq906fwuxIATPJd8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umYwHn6CRlilYb8aMdKWhMEJQa306xmvRmsWa79Q9xX7ZwhQMTNJkUwJ6hKM15zUA
	 f8AfdljMxB/G20HFoeb4FcyjYbANQCj7fp5tdgsakizQDvwBUy3H1G6OizZHqVRoed
	 l/xRPXwgMxqjLM4te8Uiua5HJajKGT2b50J0vEYVTrR9yxDIOsBWb5nRl0qfRYg/1x
	 ii2jxHRk7XZd+Qb9vekFe94pfIanHDecO7kUv5jIOMUNjwtVGIbGa5V0QWYn5CPheD
	 vJzUGa+vO39NojfxiSjrzX9jMGCL2KHHEe07H4eGWqZdLsEhISlB6fy816X3m5ueFc
	 OUg8bTXpQNqZw==
Date: Thu, 20 Nov 2025 09:19:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com, 
	p.zabel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com
Subject: Re: [PATCH 3/3] usb: dwc3: xilinx: Add support to program MMI USB TX
 deemphasis
Message-ID: <20251120-polite-ginger-tarantula-08c98c@kuoka>
References: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
 <20251119193036.2666877-4-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119193036.2666877-4-radhey.shyam.pandey@amd.com>

On Thu, Nov 20, 2025 at 01:00:36AM +0530, Radhey Shyam Pandey wrote:
>  struct dwc3_xlnx {
>  	int				num_clocks;
> @@ -306,7 +307,7 @@ MODULE_DEVICE_TABLE(of, dwc3_xlnx_of_match);
>  static int dwc3_set_swnode(struct device *dev)
>  {
>  	struct device_node *np = dev->of_node, *dwc3_np;
> -	struct property_entry props[2];
> +	struct property_entry props[3];
>  	int prop_idx = 0, ret = 0;
>  
>  	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
> @@ -320,6 +321,10 @@ static int dwc3_set_swnode(struct device *dev)
>  	if (of_dma_is_coherent(dwc3_np))
>  		props[prop_idx++] = PROPERTY_ENTRY_U16("snps,gsbuscfg0-reqinfo",
>  						       0xffff);
> +	if (of_device_is_compatible(np, "xlnx,versal2-mmi-dwc3"))

Don't sprinkle compatibles all over the code - it does not scale. You
have driver match data for that.

Best regards,
Krzysztof


