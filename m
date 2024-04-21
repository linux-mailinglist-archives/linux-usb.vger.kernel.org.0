Return-Path: <linux-usb+bounces-9526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F388ABEEB
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 12:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DE381C20869
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 10:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5A810A01;
	Sun, 21 Apr 2024 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z5wEoUJM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1841094E
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713694617; cv=none; b=ONJBnwtIf+7IuORhtUxohkDqEfqYosuKB4NuEKEdFwe6Ocj1aeJVbo+dJjLqMnay1CiDGT5Hh6BHTM6h3JAMgUbYgXnmR2ywBOtTu979SYv4sGytjP3KhlxXA7GY5XXopktH/opSSRDDkvTmandb10MZp3gIETjOr0RRFsfo3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713694617; c=relaxed/simple;
	bh=2RPvAZIFw2e1p9GxWPyBahBu/6aH1A6ZP9nWOViJoEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPS7uhlt2OdEQKuoq8nCXC8wdMjk+Cbk6VZsEK2OWs1jVPhMWnfE6EIvRjv3VsofYrUBroMatC14yQg/zKpGySSpkpUR1GUttyqKyMqWbDpscoPYoSQItxXRkYuO5JvFHIh3F5hi8ViAWZH8Nire8zlVRBNIE2e73NHC8jCdR3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z5wEoUJM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1171C113CE;
	Sun, 21 Apr 2024 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713694616;
	bh=2RPvAZIFw2e1p9GxWPyBahBu/6aH1A6ZP9nWOViJoEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z5wEoUJMpIBLKYnvdne1ZXHAzQ5RYaCro9QHSUe6rzWTAs/hiQ6ACCZw9pkkQm8gK
	 ZTc3po2XNkVoAHNHQfrkio0KM/RKqJrxRIrJdzHR1iazMA/EN57Nu4vtnfdYchJfoJ
	 BidquxDmL66WrqfFBKwJideRJsT3iZOU/NMmHVoE=
Date: Sun, 21 Apr 2024 12:16:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chris Wulff <Chris.Wulff@biamp.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_uac2: Expose all string descriptors
 through configfs.
Message-ID: <2024042140-outfit-mockup-a329@gregkh>
References: <CO1PR17MB5419B50F94A0014647542931E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR17MB5419B50F94A0014647542931E10D2@CO1PR17MB5419.namprd17.prod.outlook.com>

On Fri, Apr 19, 2024 at 08:45:17PM +0000, Chris Wulff wrote:
> 
> This makes all string descriptors configurable for the UAC2 gadget
> so the user can configure names of terminals/controls/alt modes.
> 
> Signed-off-by: Chris Wulff <chris.wulff@biamp.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 72 +++++++++++++++++++++-------
>  drivers/usb/gadget/function/u_uac2.h | 15 +++++-
>  2 files changed, 69 insertions(+), 18 deletions(-)

Same Documentation/ABI/ question here.

thanks,

greg k-h

