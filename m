Return-Path: <linux-usb+bounces-19197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA2A092C4
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 15:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202C03A30EE
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 13:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069DC20FA94;
	Fri, 10 Jan 2025 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WH2iBuZX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D824400;
	Fri, 10 Jan 2025 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736517592; cv=none; b=jXD/09h2bKYiidCq7LNdbkRuivEUtiCrlMlJWF0uOjvJHXU37RsIlfPpwQO89NWpUxHEVNuVJouMp/3HeqXM7b4gLzEshA1uNrYt3h4rDiMh8i8ad45dpI28GrSNZ9CY8aq/NKgPZX9yHXkZ97SjppANHT/RRymCMIsjuBJV1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736517592; c=relaxed/simple;
	bh=aJPjnaiziZNETSZJP+4ivoZ8HjLhfV+b6x2D9pMqLeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtEbM3z+npX6o59ucPVRVVfskRbFfXIVDlM3gJcn1HCjVqz4it4FLPen99XbvWhpRVvJrDJx7jOCftKJJklB5t0OYeVcq955XppzN7K0tCfbh/YPcB2ctVmZrMs848AH0mA0MphzRYXyzUj7HXdGbVeTneeIBUiUNzOapya8Nx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WH2iBuZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2301C4CED6;
	Fri, 10 Jan 2025 13:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736517592;
	bh=aJPjnaiziZNETSZJP+4ivoZ8HjLhfV+b6x2D9pMqLeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WH2iBuZXBNUAdFftuJ70QMleNHPqwxOJB3HK1ZAfSg+gyt5Cdt2onpYqXS8i5EU5i
	 5b55jw2oE4C0AMEaE0OnMv/96OHDc2duK7gJhn6e05MjG8L10K7cj/V0nOUUYSOnp8
	 SlfWOL1EKHKA0gtVzfMs8lD5bDh7Otx5kC1SlXv4=
Date: Fri, 10 Jan 2025 14:59:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial device ids for 6.13-rc7
Message-ID: <2025011040-haphazard-snowstorm-9836@gregkh>
References: <Z4Ejzlpd1OxM_bnk@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Ejzlpd1OxM_bnk@hovoldconsulting.com>

On Fri, Jan 10, 2025 at 02:42:38PM +0100, Johan Hovold wrote:
> The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:
> 
>   Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.13-rc7

Pulled and pushed out, thanks.

greg k-h

