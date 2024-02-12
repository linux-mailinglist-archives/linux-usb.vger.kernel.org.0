Return-Path: <linux-usb+bounces-6228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B58851034
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 11:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B58A4B239CE
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 10:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F9E17BDF;
	Mon, 12 Feb 2024 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n80MvJen"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D67182CC
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707732022; cv=none; b=mdfTOGAf6kUnPh5zvWxPJxVWyQOqu0PvcYrF4nCdIHKanPCWCWlMzM5aqRCeJceemJXDJn8O97tvVrlKmoZtHTp95dP0OnfbAk9jPmwflDQRLygsCJjiOPtUjvz7ZRz8mOTdqmgZqxb2rl3YW8WsO5C7OQdCEamREVUXmE4Wlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707732022; c=relaxed/simple;
	bh=OJiaG9OexGByMcG00vYnM4fVrArW7CoqsrzvTJWy2WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7LZg/R/UBY0qiFQ3J49qfvj8D6/34PI8KSGG5gt4lQmDKBd8JJ8jrxztUjMw9ipbc/9d60reVOSbjfDA5wPFDpUC+UH8u7qca8GcR9KU7Q3cXSCAxm2gW1j6Ju6e5m/zfgmwTXK53KmQX7go8vk2hmpaAH+zPfjCOstwUeaIjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n80MvJen; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2955AC433F1;
	Mon, 12 Feb 2024 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707732021;
	bh=OJiaG9OexGByMcG00vYnM4fVrArW7CoqsrzvTJWy2WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n80MvJenEhwZDCaaU/LCPMOUiDZ9rhVwjiLOqwysP6nTuPcTaZ9UQYYlptFPYGLd+
	 8SFXL09UC6ZG2w5YOD5pQXIdVLLHBB8w8uJDSOQ1UZ0rVH4KFw5BECrZ136psuRce5
	 Mwoh83Q51PNYdESJyD3S7jkZmshVn9mr1hxOnF9g=
Date: Mon, 12 Feb 2024 11:00:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH v2] thunderbolt: Add trace events support for the control
 channel
Message-ID: <2024021220-nullify-enslave-6747@gregkh>
References: <20240212090604.2551237-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212090604.2551237-1-mika.westerberg@linux.intel.com>

On Mon, Feb 12, 2024 at 11:06:04AM +0200, Mika Westerberg wrote:
> @@ -22,6 +24,7 @@
>  /**
>   * struct tb_ctl - Thunderbolt control channel
>   * @nhi: Pointer to the NHI structure
> + * @index: Domain number. This will be output with the trace record.
>   * @tx: Transmit ring
>   * @rx: Receive ring
>   * @frame_pool: DMA pool for control messages
> @@ -35,6 +38,7 @@
>   */
>  struct tb_ctl {
>  	struct tb_nhi *nhi;
> +	int index;
>  	struct tb_ring *tx;
>  	struct tb_ring *rx;

Did you mean to put a "hole" in the structure like this?  If not, please
move it around a bit.

thanks,

greg k-h

