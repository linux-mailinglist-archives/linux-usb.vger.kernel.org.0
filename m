Return-Path: <linux-usb+bounces-26810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB004B24D0D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 17:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32DFF886143
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 15:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5532ED157;
	Wed, 13 Aug 2025 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SdMeFhAV"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022F519E81F
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097828; cv=none; b=PDDvV3trlb2r/YXKjz9ypOkOdKT27+N6PDr1I1S0UEE86N+LNbSBs3TfrP5R+4NG0782lzQF32KAJMqCfAAPXwYH8jfr8rKuNFOxWQZBURxJHaY7HwuNeYaLGlDLhteJ/JXuJ57pBtz6/RdaUV7ppoxEvdIxd66Zdp5XQLgavVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097828; c=relaxed/simple;
	bh=99uxcXR1J2m2BQHk77hnPMNeqK1L68EQcBXd93xjZgI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jgLHBikrCYMG7hINWkwZuzYC10GKrbOdySuP3Z17car/FsMYCfLTxZti9kaP1/88whj3Utei/lwEtq17RDjNRUAbHJpJ0LXDtC4mXD7kTdE88uCwurOB74uxVaaAyLLVchyl9uZ5rcEuoX6Xb7Iy1cR++Izbnq0HIpTU0XmcxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SdMeFhAV; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755097822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGeRG7EIYSd/DYHs9x114MtCV4AwqXM+cwNPFQAJbMo=;
	b=SdMeFhAVUAWHfrtYGvdN0CNlSrfvu6tfrH7yecpzEjjvnXmIrswCKomYEBSbnP/oEezy/3
	adhrMngNvcTdPaZhmHSN7RmCkctR6TLGYhs26oKKYiUe5QfvvgiQfw+olh7tjrtFRcekYc
	2b4/XQp+anvQvbJ+AN4oRnIg+fEZfLI=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [usb-storage] [PATCH 1/3] usb: storage: realtek_cr: Improve
 function parameter data types
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <a6deb8d0-dc8e-4d4a-94d2-ed2617091eef@rowland.harvard.edu>
Date: Wed, 13 Aug 2025 17:10:10 +0200
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E3437C91-EF05-4EB2-8998-10D599ED3AAD@linux.dev>
References: <20250813101249.158270-2-thorsten.blum@linux.dev>
 <a6deb8d0-dc8e-4d4a-94d2-ed2617091eef@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Migadu-Flow: FLOW_OUT

On 13. Aug 2025, at 15:59, Alan Stern wrote:
> I just looked through the original source file.  What about 
> rts51x_bulk_transport_special()?  Shouldn't its buf_len parameter also 
> be unsigned?
> 
> For that matter, what about cmd_len in both routines?
> 
> And have you checked the corresponding values in all the other 
> usb-storage subdrivers?
> 
> As you can see, worrying about the difference between signed and 
> unsigned values, when it doesn't really matter, quickly leads to a 
> morass.

There are many other instances throughout the kernel where types could
be improved, which is why I originally combined this with the if check
change and limited the data type changes to that scope. Feel free to
skip this one, as it might not be worthwhile as a standalone patch.

Thanks,
Thorsten


