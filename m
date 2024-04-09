Return-Path: <linux-usb+bounces-9118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08BB89D65E
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 12:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 917511F22103
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 10:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4A181749;
	Tue,  9 Apr 2024 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ElScF4K6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777121E89D
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657456; cv=none; b=FLbKOiWsah7+McxlHDuP1Sjn6SwL9SzjIL9wTmbXLLpTWNM6luh2gUGI8vsjd0OsK99ZC7UCJW+TiCSz0AYvqfkVWToF2Kc5zzg2gZ1akN2a3kOhTdkuxoOOT0f2OwhhrSWMniajg3U/nykOaJiNpQW7qdxQiOOkItvU1uo5oL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657456; c=relaxed/simple;
	bh=3enq4KCg1w7ax+gnKLd7lWi+CtTzROJzmvXiQEuDaMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oW2Jws3u1+uDd9zRO77AHyNZyLZczEw+/mGXaSehMVGcbSgQzTQ19c+JligL006F83PmdT/XnIJDsO8ebEWsExv6r/Gk+uuGxOMqRMzS2qMeeCXMFd0eBkWmDnmHziMdXCHlZTWTQao3nRFVG54lDOqgEf68cpcNZ3QS4KACAEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ElScF4K6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD15C433F1;
	Tue,  9 Apr 2024 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712657455;
	bh=3enq4KCg1w7ax+gnKLd7lWi+CtTzROJzmvXiQEuDaMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ElScF4K6wdx/l9GXV87Pzix/eCZAuOBNqoMEHO9zp+sTkPY2PpSOr7rHCrB1cPL8t
	 YQz4GgwiCtDRzYtLUQ3GkU/75If/zXzoUGwCw2uoLKdRttvEkfe4I9RjQPs8aGEjUb
	 ka5IU1LfYHGbXApF8b6jIeMV+l7+di6UAF5SuWho=
Date: Tue, 9 Apr 2024 12:10:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc2: host: Fix dereference issue in DDMA
 completion flow.
Message-ID: <2024040936-dosage-marrow-c1d6@gregkh>
References: <30794381684043b7083bb873d82b012254e033f5.1712656793.git.Minas.Harutyunyan@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30794381684043b7083bb873d82b012254e033f5.1712656793.git.Minas.Harutyunyan@synopsys.com>

On Tue, Apr 09, 2024 at 10:06:32AM +0000, Minas Harutyunyan wrote:
> Fixed variable dereference issue in DDMA completion flow.

What do you mean by this?

> 
> Fixes: b258e4268850 ("usb: dwc2: host: Fix ISOC flow in DDMA mode")
> CC: stable@vger.kernel.org
> Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

Did someone report this problem?

thanks,

greg k-h

