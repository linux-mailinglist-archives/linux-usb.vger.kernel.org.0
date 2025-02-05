Return-Path: <linux-usb+bounces-20140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E158DA2835C
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 05:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57AF43A652A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 04:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C79421518D;
	Wed,  5 Feb 2025 04:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hz4Sglot"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0DD2AF0E;
	Wed,  5 Feb 2025 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738729655; cv=none; b=GYvtPJfMR9KTCRrEB9EppyL1EGktpN5xwKzxWVdv2fJ7vzjl99rbXMfBMDEavyRGmGpX4LxizrbnTZJIXfNM6/0r7EIBIk1vFDp4wAEhvVQEbVtgTS5mRmURL9zw0FEBMQa1loesuMTH6gc9MRLxjRMfUe6oIhRr/sQxq96ARsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738729655; c=relaxed/simple;
	bh=s7foDQoVI2naSB264vrCozpwinSzQ1kbWowc5+BbdzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6+s8ZuSOS82SipoPdJfWPbEmEe/82x7PLNljXFeH/tr4UR5nbNuA4RLVnzq8uAyIkaH8BC7OAuCV2V3ob+Gga9AQOufrhY0tjAjdtBy8RX74DN7ekPNanzm2q5JDBwK17z/mogVNADmWjf7X+udotBO88HIMxSpi420FUSJ2dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hz4Sglot; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39796C4CEE2;
	Wed,  5 Feb 2025 04:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738729655;
	bh=s7foDQoVI2naSB264vrCozpwinSzQ1kbWowc5+BbdzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hz4SglotsyCYt/m5Rl8fa3qn7QbJHu140CCVzBf5TSiY37jko5Z2kzJY/gStK4I26
	 cRVQShcPi0X6RIh5Keho8K5s6ITdreMyUF0icCDsQO76QgzualNPiMuaRwhfmPUwv3
	 iwThasOPIQ/e+DdtZEV8Xs61er1lVr6OLP3solTxhwWKSTjKgoAIO5wdvQLdyCW2EQ
	 GkUoL1oi7PONj6gKlqCeW8cG2Nx67txTFfw2b9lryyLWBmZdUxPrO3wHPVEFGcP9jz
	 pwENje9yblJX4xePqRO0Q+ie5O9pLyI3vAMA+4h2eLP/nqYAk7CosN54n3tfMBjfFB
	 GQ6zPIfw872OA==
Date: Wed, 5 Feb 2025 04:27:31 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jameson Thies <jthies@google.com>
Cc: ukaszb@chromium.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	dmitry.baryshkov@linaro.org, abhishekpandit@chromium.org,
	akuchynski@chromium.org
Subject: Re: [PATCH v1 1/2] platform/chrome: add PD_EVENT_INIT bit definition
Message-ID: <Z6Los9yZs1st7OTO@google.com>
References: <20250204024600.4138776-1-jthies@google.com>
 <20250204024600.4138776-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204024600.4138776-2-jthies@google.com>

On Tue, Feb 04, 2025 at 02:45:58AM +0000, Jameson Thies wrote:
> Update cros_ec_commands.h to include a definition for PD_EVENT_INIT.
> On platforms supporting UCSI, this host event type is sent when the PPM
> initializes.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

