Return-Path: <linux-usb+bounces-26161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD7B11A38
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 10:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 877BB7BA67E
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 08:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB4F239E64;
	Fri, 25 Jul 2025 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dZkVJsIy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324C1FC3;
	Fri, 25 Jul 2025 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753433284; cv=none; b=C/txG0xGNsQRdaK1oIbDUhJbTVJYKlPqLyFIcfXDqI10buNZt/dQRCfrYxrFWGufzgsODSAYhyqqusfSHAmkVZHGc2ipABfQY2d9FsVwbZ+cPORWZ4pGNXb/NJArNcXDjVAF79fhWGkb6VEA0D5ZfO8ZDeksBT9xKT073PClpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753433284; c=relaxed/simple;
	bh=hvj1ihctKw1L0QQ+ZZnC1o5z1A/89BDCxlya0HhhA2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlwylcSLPOsyCFficBj9vAsPgvCCKQLU6U60hhIyRgq2mFuh5wrR5OBNK8C9zqov5qQyzdY/DspLdO/J2q3NmXYC1LsBb/JwJnLh6FRDLcjdqoUcx/4D9OylF+EJ0N20emfLZMY6PqL58zzPfZDk/6gru0Z584cLC0zz5lDKKYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dZkVJsIy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3676BC4CEE7;
	Fri, 25 Jul 2025 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753433283;
	bh=hvj1ihctKw1L0QQ+ZZnC1o5z1A/89BDCxlya0HhhA2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZkVJsIyf8hrZaEdD1ZeQtn18XWQiB0s4iW9iIWwz8ExWUEDhqv/grSDG3fnrd3Vj
	 ZWTJH323hdcBvHjBhvO1L5PCFMyXAAyWORhUUDqun9oFWEZaHlKsLDDRRXKR777cPo
	 uDxvtMFtP0tL4XsreS+8XH5V4egV5NNE4txe+7YE=
Date: Fri, 25 Jul 2025 10:48:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Add shutdown handler
Message-ID: <2025072542-bleep-parting-3e7a@gregkh>
References: <20250725062158.2418961-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725062158.2418961-1-prashanth.k@oss.qualcomm.com>

On Fri, Jul 25, 2025 at 11:51:58AM +0530, Prashanth K wrote:
> Currently during system reboot, SMMU disables its translations
> while devices like USB may still be actively using DMA buffers.
> This can lead to NOC errors and system crashes due to invalid
> memory access.
> 
> Address this by adding a shutdown callback to dwc3-qcom, which
> ensures proper teardown of UDC stack and prevents DWC3 controller
> from accessing memory after SMMU translation is disabled. Reuse
> the existing remove callback for this purpose.
> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

What commit id does this fix?  Or is this just a new feature?

thanks,

greg k-h

