Return-Path: <linux-usb+bounces-4834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE58E826EDD
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 13:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50924283CCA
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF8B41237;
	Mon,  8 Jan 2024 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jdvTbWMF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537853FE53;
	Mon,  8 Jan 2024 12:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B614C433CC;
	Mon,  8 Jan 2024 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704717952;
	bh=fPF+aQpb+rIH8cFOZ6IUKtNet5bDno+F6C1ugoA4mzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdvTbWMFmamB+bvyLgQezdSd7ubfc2Nv9l48RVGCQn55M5Uf1bnCS4IYT+xiySXXi
	 gVSsAjcRt88NiHeaWomixfBf5UmD/2XwZvezx0HiEkJteknZwc7RVXIIdzUy3l2BBq
	 QnrwbqI5WQJvXqVVCuia9/GX3W8JZWZ4aCmA7yHc=
Date: Mon, 8 Jan 2024 13:45:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: ncm: Fix indentations in documentation of
 NCM section
Message-ID: <2024010830-haven-sprawl-de51@gregkh>
References: <20240108123602.10593-1-quic_ugoswami@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108123602.10593-1-quic_ugoswami@quicinc.com>

On Mon, Jan 08, 2024 at 06:06:02PM +0530, Udipto Goswami wrote:
> Currently, the section of NCM which describes attributes are having wrong
> indentation.
> 
> Fix this by following the correct format recommended.
> 
> Fixes: 1900daeefd3e ("usb: gadget: ncm: Add support to update wMaxSegmentSize via configfs")
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
>  Documentation/usb/gadget-testing.rst | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)

This was reported in linux-next so it needs a "reported-by:" tag, right?

thanks,

greg k-h

