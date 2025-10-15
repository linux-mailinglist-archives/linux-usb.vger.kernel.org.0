Return-Path: <linux-usb+bounces-29332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77439BDEE29
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 16:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D14213ACEBF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 14:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32DA20E023;
	Wed, 15 Oct 2025 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GMeONgcy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432D7263B;
	Wed, 15 Oct 2025 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536846; cv=none; b=PnbZjGwETmXE7fbqsndaPqvyUdhPA2C4cIJl30LBmyoz1CUr/eAwuJdOhPjHyYfvKD09dwV0g1pZeDwBiVmQo0NRdNnKlS3uMiruguwoigk40yPrz4igaShuTE7l0T3PugDGmK4r8Uafnvh/QPqtXIDqKysD/0osoQXXoYx56Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536846; c=relaxed/simple;
	bh=MDRP8V1iEZmLz15Z2XSYpGm1FBRVJoPP1hu8VeNx7ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lkj0ar/VITxfaIsXNe8K3sx61YPmTc8Lmcan30SFqKwydGrRA8Sc/FDaF8vYQ401bcI/SyET1GpStRqqGDD78IjnKqJ9INFe+qqHQO49bet6SDTVZKqszg0ZqW6lACBvJawP19VZiGP/J3B3Kz8LnkVJenMA4fiflOy6D9BaC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GMeONgcy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73649C4CEF8;
	Wed, 15 Oct 2025 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760536845;
	bh=MDRP8V1iEZmLz15Z2XSYpGm1FBRVJoPP1hu8VeNx7ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMeONgcyepwm0q8G6yDqZzSVPHJGauZD93Jk2kOU4+j+n7BsdNxgCF796c/70PXeU
	 sVffMT5gm16KO/lGzAayC4D4WrZHBUrG+uyz9lOqSGt2YD0EcU/AqyY7bWgQAioVj1
	 cFIk0Ho2pRYO60HO+f+4yQ1XLGbLKztgpf1iFQYQ=
Date: Wed, 15 Oct 2025 16:00:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Add support for orientation
Message-ID: <2025101530-skeleton-able-6523@gregkh>
References: <20251015-usb-typec-ucsi-orientation-v1-1-18cd109fb0b7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-usb-typec-ucsi-orientation-v1-1-18cd109fb0b7@linaro.org>

On Wed, Oct 15, 2025 at 04:50:36PM +0300, Abel Vesa wrote:
> According to UCSI 2.0 specification, the orientation is
> part of the connector status payload. So tie up the port
> orientation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h |  3 +++
>  2 files changed, 27 insertions(+)

Why is this a "RFC"?  What is the request?

thanks,

greg k-h

