Return-Path: <linux-usb+bounces-16634-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D89AE5AD
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 15:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B4471F24E0F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2024 13:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74151DD0D0;
	Thu, 24 Oct 2024 13:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHmWzLnu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2681D90CD
	for <linux-usb@vger.kernel.org>; Thu, 24 Oct 2024 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729775189; cv=none; b=ZmToyKtbhnFtXaJfnnIAVgA2ypVtvXQuso6wX7oSUrytW925mDFMJrDlkbjf/+HbNY1fO+q8D77YrZP5xiv/BR2paB6REynuKtJMgYf/1SqCXAbYR3yJbqk3sH+vj6fXblCs2dmnkK4wSobDCh413BJqe63a2dXtIBy7/mMzy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729775189; c=relaxed/simple;
	bh=c0TsvaEv6VuRgDZrO0YATpD6rxLgit1A1mX/GADcaPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoIK88TWDh5LVysnL0nzYXKplPyi6Ar3+QNbuEq/1+GWJmp5FDf/3BMnMIcQNM7fEMSMFqXp2MwXNmTT+AxzLmVzEQ9hK2DpUFV8wnBUcNurKwcAiNKSt3GNRGm/BJPpzqAP7ce3NY+G9rEoRb0tM5zWh3jhUgP4vuT/TlCuvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHmWzLnu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9ECC4CEC7;
	Thu, 24 Oct 2024 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729775188;
	bh=c0TsvaEv6VuRgDZrO0YATpD6rxLgit1A1mX/GADcaPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHmWzLnuKIJwhylGRse9l7rHwSnM8vdKpG//vNvno7X1pLUup9Ji2XqFF+SBPJuJf
	 kHoZQwhCzzTsMLtyDnSLnX8HRUCG2CA4Ft3dNWb5Y8+NZyR8a4Pr4jjjFu7sDfizC4
	 7uqwJTKAZa0ccRVXFXKnoZHJgEjbZZfNalZe14sbtSoemApvQrR4OcP1yIC6ThEzPr
	 t00NNsGnSdy67Qmgc7yrNAB1T59IO/wpKnNoa7A273qOV+KgR3bxTVK8Yk/85Uhygz
	 m/GIvP9hXFd1JDz9VBA9WvaaGUum4O5p2dUdNziaEGqqjYTYt2eTCDUSHEGB/g0O1f
	 0zmFM2d1XDLfA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3xY3-000000003Py-2ToM;
	Thu, 24 Oct 2024 15:06:44 +0200
Date: Thu, 24 Oct 2024 15:06:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: Use pm_runtime_get to prevent RPM on unsupported
 systems
Message-ID: <ZxpGY_RgP3M7VTv-@hovoldconsulting.com>
References: <20241024112117.723413-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024112117.723413-1-Basavaraj.Natikar@amd.com>

On Thu, Oct 24, 2024 at 04:51:17PM +0530, Basavaraj Natikar wrote:
> Use pm_runtime_put in the remove function and pm_runtime_get to disable
> RPM on platforms that don't support runtime D3, as re-enabling it through
> sysfs auto power control may cause the controller to malfunction. This
> can lead to issues such as hotplug devices not being detected due to
> failed interrupt generation.
> 
> Fixes: a5d6264b638e ("xhci: Enable RPM on controllers that support low-power states")
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---

This is a new version of this patch:

	https://lore.kernel.org/all/20240925161520.2736895-1-Basavaraj.Natikar@amd.com/

so please resend a v3 with a changelog here.

Also remember to CC people reviewing your patches when resubmitting.

Johan

