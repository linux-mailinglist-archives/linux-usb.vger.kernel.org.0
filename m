Return-Path: <linux-usb+bounces-16293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C69A00E4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 07:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7041C2138E
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 05:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147D918C02B;
	Wed, 16 Oct 2024 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yn+hVyGa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9400118BC2C
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 05:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729057486; cv=none; b=dncpCTApeQBgg5+90VFDUaGsqIZl0IrCyu1iw9NW+WfUcM0IWdvNzAQMKvOYFQbh/h8VzvEC6YmiCDiEZmpxQbb1ZUY6oPr72tHfKmtT1xBoYZxNFhNn9IXLlqAWrCuaZnNHK8hScaK+owl7WoHgcTpojnNii7sdT0eZnVIVcZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729057486; c=relaxed/simple;
	bh=SkGYOk+FJB08tlaXN+nKMwVMtUGs8J5RtWEwktlts0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOdc1iY1qwBADj6Dsy/ZIH/naxFCIbuyLSx9RuIaJOqlXljQMhLjjMotWcsQbCKHuJq50G0Q3g8C/TW4yvM8kbTYQNK9NPyVyOf4heqv0f03CmQLmWI8rmMPrkXiWXMx106iogMpzobglUCBYU92o1BS8GfqwiXIBZIGucv2/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yn+hVyGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFEAC4CEC5;
	Wed, 16 Oct 2024 05:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729057486;
	bh=SkGYOk+FJB08tlaXN+nKMwVMtUGs8J5RtWEwktlts0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yn+hVyGaAdZfSTrPUx/ZFyH1sXAz3DCgs2Kj0ruOTTXhT7la6CfjnenQP3MSxbbiZ
	 ozOTMOS1RQjlR5mMgtQgMvODeT/sZ+25fv7MKpYvR2kYh6d2y4z9QEMHRC8I1q15yq
	 MdE7W3l/RYxDXDtMA0JAxrdFzehO0s1Y4mhDU+Us=
Date: Wed, 16 Oct 2024 07:44:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: mike Seo <mikeseohyungjin@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Fwd: [PATCH] r8152: Add MAPT for lg laptops
Message-ID: <2024101619-retract-petri-4aff@gregkh>
References: <ZvztDQ8VjBet53Mp@mikeseo-0-1>
 <CANjUrvZjCAhes6n+d6C0xK2G5UEEMiTp7pkjV4siGF_kj9++4g@mail.gmail.com>
 <143dc89d84e84b34b8d0ca920b7afa58@realtek.com>
 <CANjUrvZ1dOrZYajySN3kVsLdQi=_bn8kL5k-hBmXhLz7pS+iEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANjUrvZ1dOrZYajySN3kVsLdQi=_bn8kL5k-hBmXhLz7pS+iEg@mail.gmail.com>

On Wed, Oct 16, 2024 at 09:36:45AM +0900, mike Seo wrote:
> Dear Greg KH,
> 
> Could you please review my patch?

What patch?  Do you have the link to it on lore.kernel.org?

thanks,

greg k-h

