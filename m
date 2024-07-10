Return-Path: <linux-usb+bounces-12092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645CD92CA31
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 07:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D891C2297F
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 05:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FF63FE55;
	Wed, 10 Jul 2024 05:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d+WYiaIJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4711CA87
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720589908; cv=none; b=tDmTMf4ilqOCtHgkuIBKVcFNfR6pk+gA28dLjOXGTUxkhTzyS3YyKT8HPccgu8yUXvvy0YC59oHR7PN9VEigPlF88sFvLXnTHw+kK/1wBbp9O2k+zSx6Msf+HvNph9qZLMOkWMQ95zANEEQ72xJJQRVkHfhAP9jkPqNOPPv33bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720589908; c=relaxed/simple;
	bh=kvTWKbCfScY6cD+znv8+54YbkgQxTMIMMVL9kcmvLik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTTTUgL7fLJAgJTY9kCyJN86feuVIA+xXN5LcmWprP8JC1J0BYtpSixN3nJXgHYD72zJ6s6cbtsQp5lS/zyrCCYBLyijISs0eZ3RcsmKYSFWO+aup33zO410aCubXcerLvdk+fOMBOlZkTOB0QsQPN9+CBN58hUh6OqGSkL0cgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d+WYiaIJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928C9C32781;
	Wed, 10 Jul 2024 05:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720589908;
	bh=kvTWKbCfScY6cD+znv8+54YbkgQxTMIMMVL9kcmvLik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+WYiaIJbZDtST5HS2Uvgtarhk0sF3Q9p8TVv3lRfP+WWq9yBFWcLLnCQq02tTat3
	 345GjGgzZZCg286gxRBm+ZZpRhm0R/lyGXxxlOn9UTxD8IRJQxiREF3/0tyLiSoas6
	 JCsiDzR9azOPReQvpw/FsuxHgvZFS6p26n2LJ4AI=
Date: Wed, 10 Jul 2024 07:38:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3 maintainer will be back in 2 weeks
Message-ID: <2024071011-venomous-showgirl-0d55@gregkh>
References: <20240709221953.wcxtlyc76kjlzc46@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709221953.wcxtlyc76kjlzc46@synopsys.com>

On Tue, Jul 09, 2024 at 10:19:57PM +0000, Thinh Nguyen wrote:
> Hi Greg,
> 
> I'll be back in 2 weeks. My response may be delayed.
> 

Have a relaxing vacation!

