Return-Path: <linux-usb+bounces-18620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1D9F5EF4
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 07:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F29EF1895772
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 06:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5BF176FB6;
	Wed, 18 Dec 2024 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IEGRV0Js"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D57157A55
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734504979; cv=none; b=KELOE+oQ6hMa/hiEIv1vejvjHW7hlfO+eQDuXu7CvBYq5SFUFaLz8WUeyT3RzXJsB4s0+pH2AZMOdBMnxQpY3IXcgMN1fF7REDW6Zd8DLy7rO3qdMqwAdFG3OucNzlqDuAJ1oeFQpXduCrB1IHUANkkIUy2gcsi+reaIgsywWnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734504979; c=relaxed/simple;
	bh=hfvSk4A5a66BaoAMAXDM95mrtCoDKHyjxfswKLxUBQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rckS0gQlf6z9JjQu6CelkxTkc4pxT+PsgqqVdeO8UgrNHp2GkcMLQ752c5e/IPYYkBqwH4Y5/kecEGWTCuqtfVLmbtmzAiYWWEVU5qei+2jwIfRUFaciTXU4O2ZclIDIziyc43VB5iv9rRw/IUNLUyf/K4aZj5zWbG0aoVu+meg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IEGRV0Js; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22FEC4CEDD;
	Wed, 18 Dec 2024 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734504979;
	bh=hfvSk4A5a66BaoAMAXDM95mrtCoDKHyjxfswKLxUBQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEGRV0JsgAkszCaAZvG5tSQbzc8MdjgEqglwbmZIQvzXBwAVB2aJpSjh3t3xnVdGN
	 f/Kade+Aa7rMOiIRL7Ht3aspF/njXE8we/+ale34MaKTbzETn6R4N6Okrockf15ck/
	 QpiAE1DTCR1NzMVOsQ+RqpC1XLQ26xqKuEkH71AE=
Date: Wed, 18 Dec 2024 07:55:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: WeitaoWang-oc@zhaoxin.com, mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "xhci: Fix TRB prefetch issue of ZHAOXIN
 hosts"
Message-ID: <2024121824-primp-friend-380b@gregkh>
References: <20241217112917.623898-1-niklas.neronin@linux.intel.com>
 <20241217112917.623898-3-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217112917.623898-3-niklas.neronin@linux.intel.com>

On Tue, Dec 17, 2024 at 01:29:17PM +0200, Niklas Neronin wrote:
> This reverts commit 2a865a652299f5666f3b785cbe758c5f57453036.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

You need to document a reason why this is being reverted :(


