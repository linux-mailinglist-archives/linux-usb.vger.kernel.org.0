Return-Path: <linux-usb+bounces-5643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8E84277A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 16:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 695131C26AE2
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 15:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005157E79A;
	Tue, 30 Jan 2024 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/xSBI3k"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEE860ED9
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626941; cv=none; b=tfI7QxfALxyQGRRrXhlfpRNbHOXiAlNI6z5QHX4iJDuMXhmCF0dcdY7EHyjV4UDEF0+0SUNt+LJmt7Ft4fVUttCJy1SDFWuCBAZgo73ffaIrmPcrjDQhd7v6jOD4VDXiyF6zPMNJqTUK69/ntOtyMXsqPPj6kVWRxK7LM+f6Dts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626941; c=relaxed/simple;
	bh=BbeWxfR/GeztAvjZGETcXJN39M54yIugHJtJvLzfBU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lY2Equc96nG8sgmcNVPlfoiGtNha+WkTDCxhLOaIEgnt26JS7Y/elVOdRsPbV4Ilu+oQagP/b7XNLIEhxlW1MhZdRHB/+4pcG5XIScliwSpZkXAf50+ck2NuImOfoX8mj4Otf4CiABJw/4mrPyQCz8aoZha0ngkoQkjlCdxlvP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/xSBI3k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D5FC433C7;
	Tue, 30 Jan 2024 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706626941;
	bh=BbeWxfR/GeztAvjZGETcXJN39M54yIugHJtJvLzfBU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/xSBI3kyWhULI0bK1U1F5qPjzgyOCdZbU8ooXLUXlZtjlMpQY7GIdUxp7fEiNUni
	 F4a+DOuGtVxrkuj6kDHcf61KBhz8RUFjwMPsINTb+wEYrS3qZLuh6CG2t+iyEVAo/G
	 sHqpVQBGO13lHmxBNcLfihn1Q+WgvrUUI/MJIN0rxBSOrz4UVs8bsfG2NarGMZv3NQ
	 1GStqX5FdI5Zv4uqZU36AoaYQHbJdfHoNATFspNv5/IEa572oD+XDLXzf9NesVGgYL
	 YMMzyqzyvkA+qwS3F1EV/q8dRL297H5rLrxMZmmx726L02GZ60Ujab1K4I7YuIDMLJ
	 Gm36oCm0nUm2A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rUpcw-0000000086W-13oC;
	Tue, 30 Jan 2024 16:02:18 +0100
Date: Tue, 30 Jan 2024 16:02:18 +0100
From: Johan Hovold <johan@kernel.org>
To: wojackbb@gmail.com
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: qcserial: add new usb-id for Dell Wireless
 DW5826e
Message-ID: <ZbkPesS_cNYkySRg@hovoldconsulting.com>
References: <1706002788-19606-1-git-send-email-wojackbb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1706002788-19606-1-git-send-email-wojackbb@gmail.com>

On Tue, Jan 23, 2024 at 05:39:48PM +0800, wojackbb@gmail.com wrote:
> From: JackBB Wu <wojackbb@gmail.com>
> 
> Add support for Dell DW5826e with USB-id 0x413c:0x8217 & 0x413c:0x8218.

> Signed-off-by: JackBB Wu <wojackbb@gmail.com>

Now applied, thanks.

Johan

