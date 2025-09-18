Return-Path: <linux-usb+bounces-27863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B6B51794
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 15:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA41B467F84
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 13:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEC431353D;
	Wed, 10 Sep 2025 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1magHIKh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA632D24B5;
	Wed, 10 Sep 2025 13:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509673; cv=none; b=Q8Q41ZW8nBZjy3f97t66YdJfeMJ/Mbz1YxMZDnGml1Edj/uQGRmMm9B3lUUtWRzw8bRxqV+tqTgQMvIBTOkOk+WlwbK5Tbzczutys35z5pr+y/eQ0pVcQAy8rc9AagJuk7NmATk/qfGWezP296SEGY5xj0YZ1Ob7t8B2Y4FQeec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509673; c=relaxed/simple;
	bh=DyNJs6g5umEsrOBZd9lbXMkbQG9TYA0En8+/wKy3g9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bg0cQVeBARK+GrB25PsSgbyHOZ7wPkEivypKLYAePgpT3Xss1/Utxm828bk2zOG3keZ8dCf9SAckCEA7J/CqEiawyHS9zTZ+nzWt093tuHdD07yad9do7n9zCGdt7OjgBGdX2ajMvPXCAPkvsud7sJ5ft0ErwqXufrKr+awpTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1magHIKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C36C4CEF0;
	Wed, 10 Sep 2025 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757509672;
	bh=DyNJs6g5umEsrOBZd9lbXMkbQG9TYA0En8+/wKy3g9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1magHIKh6lrz4+ehPeKRVmhJbqLIEaODUAUZYcc4clhEoGHjvAy7JpgFP8QxGxTIF
	 i32JopSef6SitIkzxQyeUdXANbNSXBuvtVELItwcjVimNdxU9TxZd3QZX28GcXfTWv
	 fQXkh3OkMlwu9Wu+XpTDC+Wug9ZdRBR4YtwZ6M34=
Date: Wed, 10 Sep 2025 15:07:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ryan zhou <ryanzhou54@gmail.com>
Cc: stern@rowland.harvard.edu, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, rafael@kernel.org, royluo@google.com
Subject: Re: [PATCH v2] drvier: usb: dwc3: Fix runtime PM trying to activate
 child device xxx.dwc3 but parent is not active
Message-ID: <2025091023-joylessly-finlike-8382@gregkh>
References: <385dccf3-234a-4f83-9610-81ac30bf1466@rowland.harvard.edu>
 <20250909161901.10733-1-ryanzhou54@gmail.com>
 <2025090959-italicize-silly-f628@gregkh>
 <CAPwe5RPxRhvYmoDZF792Vwv638kt+Hk+CYoJJCmcjewGp8NfYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPwe5RPxRhvYmoDZF792Vwv638kt+Hk+CYoJJCmcjewGp8NfYQ@mail.gmail.com>

On Wed, Sep 10, 2025 at 08:56:36PM +0800, ryan zhou wrote:
> Hi Greg KH,
> Sorry, I didn't understand your question. Are you asking for my patch
> commit ID? I've resubmitted patch v3, and the commit details are as
> follows:
> 
> commit 92bc5086f53404f6d14d8550209d1c8cd3fa9036 (HEAD -> usb-next-develop)
> 
> Or do you need the commit that introduced this issue?

Sorry, I mean "what commit does this fix", so that you can add a
"Fixes:" tag to it.

thanks,

greg k-h

