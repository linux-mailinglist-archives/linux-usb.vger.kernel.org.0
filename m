Return-Path: <linux-usb+bounces-23082-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E2A89DEA
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 14:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16C091900BB4
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 12:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8112B29E04F;
	Tue, 15 Apr 2025 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bJSozupJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038C229E043
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719759; cv=none; b=rLPJVBH8whREE+lHBHiZDX6gu6Qw9tf8Rp5d1LIePMFYac1LKangveevmwmGMOq+0mNxcQlLMmMm4Djz+yy+y+DPHBQZKAoyAEBsu/51s00qgwb4lrWOCn4+WO962vp4sGQLUmXhosPoUKeXvAqR5412GgrkFOVRWdlv5nMQ8Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719759; c=relaxed/simple;
	bh=nGZptLfmcIQJQ7SeMliGhRzKh98PHyOCwQNIGbVLckk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bD8cYwkJBhsP6rcKh5vTKvSLTUyrD75GiwGlO/PxOaugUWIzJSjluc5H3Mb/i81VICJ8ulaJEJykrUnCmzFqNsm2Qo1+j+PLrTOSKLzzHnHBq9p0XaMn1v/2JJWwZkuhPGiRGUeBlbYwfv0UQO06EXh6wpVzYMupaPT0496WSIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bJSozupJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D32C4CEDD;
	Tue, 15 Apr 2025 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744719758;
	bh=nGZptLfmcIQJQ7SeMliGhRzKh98PHyOCwQNIGbVLckk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJSozupJ5f8lV2IF04qidl6BxbioTwQM4Kmo/FNR68lbnM1bc5v08P4gMhO61lSOH
	 uNFuAr8fdgNvgxm0xaOD0txVfXwlwSF0bo6kbgBpWZXzAL2PvhtCuZnkKX6s/6zRiR
	 aYvjq+RJiUGF1SwVZyy5TA+HpD8YYlPKlePA5e9M=
Date: Tue, 15 Apr 2025 14:22:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 0/3] Introduce Thunderbolt/USB4 <-> USB Type-C port
 mapping
Message-ID: <2025041521-axis-broadly-2216@gregkh>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>

On Mon, Apr 14, 2025 at 07:55:51PM +0200, Alan Borzeszkowski wrote:
> Hello everyone,
> 
> This patch series introduces the creation of symlinks between
> Thunderbolt/USB4 ports and their corresponding USB Type-C ports. The
> primary goal is to provide users with clear visibility into which USB4
> port is connected via a specific Type-C port. This provides the same
> functionality that is already present in Chromebooks.
> 
> Alan Borzeszkowski (3):
>   thunderbolt: Expose usb4_port_index() to other modules
>   thunderbolt: Add Thunderbolt/USB4 <-> USB3 match function
>   usb: typec: Connect Type-C port with associated USB4 port
> 
>  drivers/thunderbolt/tb.h        |  1 +
>  drivers/thunderbolt/usb4.c      | 14 +++++++--
>  drivers/thunderbolt/usb4_port.c | 56 ++++++++++++++++++++++++++++-----
>  drivers/usb/typec/port-mapper.c | 23 ++++++++++++--
>  include/linux/thunderbolt.h     | 18 +++++++++++
>  5 files changed, 99 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 306a14d03f47fa152c7e47be544d8d582d387a20
> -- 
> 2.43.0
> 
> 

I'm guessing that these will come through the thunderbolt tree to me?

