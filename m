Return-Path: <linux-usb+bounces-23416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D43A9B22B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 17:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A83F47B1CEA
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14121D5CC4;
	Thu, 24 Apr 2025 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W16NcgVC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F384315C
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508374; cv=none; b=kbj/zbwMvBxCMT3QAm/8hjui34SDSDW9k/w5iAGmPzfkS+bja/MtnoZFYG/rXmhQzvTv6JnbxhzTKsJbCZBYSYWb4toD7bFE88hmaVgfXD+K/ATZRLrPW6atpoqpUOE8xF08ypPMZy5ozFPsAiQ2SVAhJ+PGurdByMYV8enDTzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508374; c=relaxed/simple;
	bh=F2WFF7UNE3KM8MD2T2BvHUn/fpd0JMUCrqmPNKGb350=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u67C8KDaxeza7NKkVWgWis5eIWtrgLQdT4WVfNG0vP+PfmuG1W1gKDTLiSFaiOUiSTmzCtz7fQZ0LZDpi4Txo6o5FNssOtpQs9V5jQlgRUy/8W+04lXQlRTZLqubeVYxa0efFgUgAc15t0OeDn1ChmuvWR6ovzQt9xe+HY1hboc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W16NcgVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F00DC4CEE3;
	Thu, 24 Apr 2025 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745508373;
	bh=F2WFF7UNE3KM8MD2T2BvHUn/fpd0JMUCrqmPNKGb350=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W16NcgVCePNULrqF86adRBcfA/j+jM758Zv7/QkPC3fpmgmCS333KqrBQbOUdmyiG
	 aDq2rqS9BD5uy1yIHrx3rjITeqKTdY6MN68wzM8tw0DJML9u5mtGWK+OM+1OB0PO46
	 2hdHFBRmMq41qZ8boDn33AM7ycDojkor4C9Ni2ig=
Date: Thu, 24 Apr 2025 17:26:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220052] New: The usb/cdc-acm driver uses memory after it is
 freed
Message-ID: <2025042449-occupier-waggle-1c7e@gregkh>
References: <bug-220052-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220052-208809@https.bugzilla.kernel.org/>

On Thu, Apr 24, 2025 at 02:31:20PM +0000, bugzilla-daemon@kernel.org wrote:
> Created attachment 308013
>   --> https://bugzilla.kernel.org/attachment.cgi?id=308013&action=edit
> A patch file that solves the kernel panic.

Please submit this properly through email so that we can review and
apply it if it is correct.

thanks,

greg k-h

