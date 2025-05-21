Return-Path: <linux-usb+bounces-24154-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FEABF1C3
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 12:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 029747A3501
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 10:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CD325C71C;
	Wed, 21 May 2025 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zzcrwdY4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035A2397B0
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823771; cv=none; b=H33SBWZEYJZyG8YOGasC/oPISabetIwg4Qg+MocTYoiTd5E3ygBWlF42LzCev6Jfm0IxV5tgQsuMXJk55xNOwYxhwcw9zfHfjxCfD4ny2MQpXrvsMxw0zu80natn428Wqsh3ci2xFTTqNExRomQv538N14xbvqobZ8fURGaT+oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823771; c=relaxed/simple;
	bh=VWM+KgwDOM2/y9yewWFPwlXa2M7DaH5l4c0LdjCpmPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKVCj8285DeBMTDcnoCLXzsLzMs1MCZlXO2yynWqNuuTQnPnlp7GEb9euFV2OHUvPy0ug2V3IE8kFfwGzddJPT8sYBQljLBnKtvGfXXhI17K8JXDCYK2tTzwnQUy7HuB8sMEHIQtQBZ2N0+qh6u95FOX7ndGMrbPFxXXOFrMhts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zzcrwdY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF54C4CEE4;
	Wed, 21 May 2025 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747823771;
	bh=VWM+KgwDOM2/y9yewWFPwlXa2M7DaH5l4c0LdjCpmPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zzcrwdY4HSUdfgnRMP2sP66DQY60wGvooNENyRBrL2Y/gIfOyUOO6qjko9JrKQ7u6
	 XJcqmc5h3c/rsIHALwJssteYn9kg18c6Sh/1oxjOHRyXfiM4wdaqucRQG+aumrf4ml
	 RGYPiRq3jucgTR6wmStGzmNVni2ovvRunK6drZK4=
Date: Wed, 21 May 2025 12:36:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/24] xhci features for usb-next
Message-ID: <2025052156-naming-employed-ccdf@gregkh>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515135621.335595-1-mathias.nyman@linux.intel.com>

On Thu, May 15, 2025 at 04:55:57PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> A series of new xhci features and refactoring for usb next incuding
>   - Debugfs support for showing available port bandwidth
>   - xhci parts of eUSB2 double isoc bandwidth support
>   - refactoring to decouple allocation and initialzation 
>   - other misc cleanups and refactoring

I've applied all but the last 2 patches here.

thanks,

greg k-h

