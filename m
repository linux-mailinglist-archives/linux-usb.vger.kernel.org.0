Return-Path: <linux-usb+bounces-16824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6D9B489F
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 12:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44887283C15
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 11:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEF9205AAF;
	Tue, 29 Oct 2024 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhNcenc1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174D1205155
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 11:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730202588; cv=none; b=qh/JU24FfOCUtjRkXiN9BfFl19MLeAbr8C56wazQyNTevPfkKcSLhwe4DCMTd4r9b1H6XYAS7J75eZsvGxffpBnuSeosBLLyAKlKi1+A34Cb6NB0LX+xU7TIyNioUliZHRFhZLESsmh3lPbcH4exnLOgw4gvMvJOvdBoUM8QAB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730202588; c=relaxed/simple;
	bh=Wmu4PVZ7sqzhbNwuHgl+lr3TvR1GURWQqA/wymGkI68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0a7/1oS0eTJtMCvx9Oj+Q4dVZrS7PMj9zH4/3W6Rmw7glV10i/X/cyGEBOuDVyBr8UhIVF8V1ANUiVQpjBUQIF9JNmQ004RPoxsu1ah+zb+wj/Nv7M/yeUAy/AOPh0XqHyhhYWxg8uwfAJzaGxFYqIjsHTv1J//siWmvcbx+CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhNcenc1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CF2C4CEE6;
	Tue, 29 Oct 2024 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730202587;
	bh=Wmu4PVZ7sqzhbNwuHgl+lr3TvR1GURWQqA/wymGkI68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhNcenc1PI/m4y/rO5P9p6S9yTLyzcvmbhOZwuH+rYp1SZpZ3W0AaXIjfqPSxpUWW
	 6M5dpRzY2SYn3dliL+8UrLjANnOTSUCBfsSIvhDextQW8Q38Zt8BUIr87JhdKb0ZZd
	 Jx3Jz4gpvJCFRXvTprW2GmjTfm1XZPA6E10Z64GxSk1mIlpbCuPdEb6GrWpuS41z+x
	 K+vasYT8ynef4AkJH0LlSxMLTMhdY3CD4CAxVnqxlvZIb6DQswKA/hRHH0LSGtK1Ga
	 MuOIA/Afq9E1NtIMMkS+lLawLrbQN0XDRHffn9Qq4PLHcpXyckF82FTC2TNX9df2pZ
	 0qzlVIdwE8YdQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t5kjf-000000000Dz-0as5;
	Tue, 29 Oct 2024 12:50:07 +0100
Date: Tue, 29 Oct 2024 12:50:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Reinhard Speyerer <rspmn@arcor.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Fibocom FG132 0x0112 composition
Message-ID: <ZyDL79-5rnPu1A9S@hovoldconsulting.com>
References: <ZxLN-sb0ujuap36t@arcor.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxLN-sb0ujuap36t@arcor.de>

On Fri, Oct 18, 2024 at 11:07:06PM +0200, Reinhard Speyerer wrote:
> Add Fibocom FG132 0x0112 composition:

> Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>

Now applied, thanks.

Johan

