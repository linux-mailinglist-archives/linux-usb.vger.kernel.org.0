Return-Path: <linux-usb+bounces-11063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0D901F76
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 12:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9BCBB275EC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 10:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCC578C64;
	Mon, 10 Jun 2024 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wuLxRgpy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563CE2C190
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718015569; cv=none; b=HLftwiqfFVwYBGIhACDPLVo9B+aiAGCHeQ6xXQfxIeA+dyKz8XjTx8bfWnr28dOVxuRRFzb4ZusVG4hg4CxnmqTKEYiFkmTRRC7dqlHduxABcOsL4Y/ZaYnAMOlhh3EdAzsNuRAw8G5P0oADznQA5lY/sNz62JbgGuE0xFzHlj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718015569; c=relaxed/simple;
	bh=GFoFmk3VCKB2AWA0zjqMxwUUZmuPqpxf5K/+dgEgQLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aL+N/M00XAZG2sUKzOOfHaod1C5umDPcPULQvgHt2RAUq6GTd6c+v/VWk1Hvo/rmQ9cHFSple4//c1fgKg5fa/L/WFmqMVuSlaXUI0umjq2j0B0BrNns+2VT6BG1o/PrnmcSJa7cxoBR6v4Apj03YgWiRM6DzIifQcRY1DZ1eqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wuLxRgpy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63519C4AF1A;
	Mon, 10 Jun 2024 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718015568;
	bh=GFoFmk3VCKB2AWA0zjqMxwUUZmuPqpxf5K/+dgEgQLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wuLxRgpypNQYAOjK9MuxHFKhf3Sy5a9ldqYuU2kUe7XyfFq8W5nnRrlZCIe7WhjKE
	 WIsFmTJWydSvKopBdAcAhb+qcWdfYjoWLh1uPoUQEpygrpUtHrxN9UtzaYNUC8T6Oh
	 aIog90mbZx/zibBb+uXU1XznYHaA4aM2U8hX9cR8=
Date: Mon, 10 Jun 2024 12:32:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/6] thunderbolt: Add sideband register access to debugfs
Message-ID: <2024061052-overhear-pushcart-b91a@gregkh>
References: <20240610100627.3521887-1-mika.westerberg@linux.intel.com>
 <20240610100627.3521887-4-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610100627.3521887-4-mika.westerberg@linux.intel.com>

On Mon, Jun 10, 2024 at 01:06:24PM +0300, Mika Westerberg wrote:
> +void tb_retimer_debugfs_init(struct tb_retimer *rt)
> +{
> +	rt->debugfs_dir = debugfs_create_dir(dev_name(&rt->dev),
> +					     tb_debugfs_root);

Why save this in a local variable?  Why not just look it up when you
want to remove it?

> +	debugfs_create_file("sb_regs", DEBUGFS_MODE, rt->debugfs_dir, rt,
> +			    &retimer_sb_regs_fops);
> +}
> +
> +/**
> + * tb_retimer_debugfs_remove() - Remove retimer debugfs directory
> + * @rt: Pointer to retimer structure
> + *
> + * Removes the retimer debugfs directory along with its contents.
> + */
> +void tb_retimer_debugfs_remove(struct tb_retimer *rt)
> +{
> +	debugfs_remove_recursive(rt->debugfs_dir);
> +	rt->debugfs_dir = NULL;

No need to set it to NULL, but again, I don't think you need the
directory dentry at all.

thanks,

greg k-h

