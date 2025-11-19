Return-Path: <linux-usb+bounces-30729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EE3C6FB36
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 16:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 964BC3425B6
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 15:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9442DCBE2;
	Wed, 19 Nov 2025 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HsegXHqO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590322D9EF2
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566371; cv=none; b=VNqC2/dtE4123O0enj5iqUUvPNlnl27t9WR4yeQHLKOPaWCdMfhp/z4CU1fzJbY2DxjXVBUSK8BEIGdKTI7FmWAJijDr58YBibDZC2j6WMzz2nP/1sbaaiwQoh43n44fnGwqepfkhousfc2JBkHuxM/1YJSSGnYao26iRSqBUsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566371; c=relaxed/simple;
	bh=WynHrS0/0jCa0VSfxlEE9vSAFx4+8x7cntXygcegi2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itom/CnRkQU2e8WO8duPFEPm94khgSZ4R7KUU4FWVtnG/hbk5dtDNT47wYxadBocY7McCo3yBTjTnKbS87TFx6yJwDALHcVdQwRRVPC0ORLSKBUrJFBXgTNklcLsrmUvYav/29M4qjelJiXkgji122pGjJ9KuBvRK5/lweCjk20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HsegXHqO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37110C19422;
	Wed, 19 Nov 2025 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763566370;
	bh=WynHrS0/0jCa0VSfxlEE9vSAFx4+8x7cntXygcegi2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HsegXHqOifA+1/3npOY5IjNDNB/5gggTpOu6xP+4Q+X+/hTQtA3DjZN0Y/nXuZU+e
	 zdHh9qfQVOdgsFHNNe3VN7JS6zZwfWbx7bBuogNJsZWc5rusd+xuPrQA/dEJmpJqld
	 BvX4+MSdnSuQiO1H/+hcsTQGRwYIJCF1d1Mm/dlE=
Date: Wed, 19 Nov 2025 16:32:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Korsnes <johan.korsnes@remarkable.no>
Cc: linux-usb@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
	Peter Chen <peter.chen@kernel.org>
Subject: Re: [PATCH] usb: chipidea: udc: Link otg and gadget
Message-ID: <2025111923-equate-crabbing-39c3@gregkh>
References: <20251119152641.49872-1-johan.korsnes@remarkable.no>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119152641.49872-1-johan.korsnes@remarkable.no>

On Wed, Nov 19, 2025 at 04:26:41PM +0100, Johan Korsnes wrote:
> Link OTG with gadget, same as other UDC drivers.

I do not understand this changelog, sorry.  Can you please expand on it?

thanks,

greg k-h

