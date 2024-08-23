Return-Path: <linux-usb+bounces-13948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A493D95C92B
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 11:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6DD1F24A23
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 09:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDA214A4C3;
	Fri, 23 Aug 2024 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AkqnLab8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42094149E00
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724405102; cv=none; b=CSSIM3r4ScdquAIY5d915EOiVsRw/DR08G1WrzSPQTF/6CTwm+NV1fx5e/hXuzY7DSKAiIw4387BmTlnsGUf89D1NVIydSwWvJyCyyPaGqqWCmLuWGRIGTIRp4GwJedvUUegJX12xCbOK0igjIwSZ1BxwQw5kBcrNOTl4GH/jw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724405102; c=relaxed/simple;
	bh=lBox3i04v9r7q+JiUCbfN2Ws/2slpXblT7B6XEe+utc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAgMERVV8/J9hJBF+GXZ3bDMhxAXhjvBFs+SWCi/f98bpr+pZS1tWQ+z1yh7fVkn+7NotiFq00k0rzYvZowpNCIVNTrT4QSiJEkKDOUboLQA6Ot1ZLYFOx2UGi5UW5DoOjxEQHeIkEC7i9niwMiRjmI6sJBxghiL86AmrtlD5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AkqnLab8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAAFC4AF0C;
	Fri, 23 Aug 2024 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724405102;
	bh=lBox3i04v9r7q+JiUCbfN2Ws/2slpXblT7B6XEe+utc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=AkqnLab8GxhxnmGcH0/BsCPaGXJEb4kiCsJOD5mkTbTIhlvVZT29UZbS34H54gIvK
	 PtcTj4nzJguJd//RumfNJC/dF5pXrlfF/b9eiF6BNMWBjYsen/L4fGbv4DsC8Quqqk
	 RrP16dTRyYc68pcvVdUfFW1JQpzZyODwuHVV3G1k=
Date: Fri, 23 Aug 2024 17:24:59 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: linux-firmware@kernel.org, Vinod Koul <vkoul@kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: question about Renesas USB3 host controller firmware license
Message-ID: <2024082340-ream-crumpled-9434@gregkh>
References: <mbtpgfzqs5fud7pfrqi6wrzxg5eo47iet5sntdclwdzwo7zzhi@wtn4b55gpcp2>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mbtpgfzqs5fud7pfrqi6wrzxg5eo47iet5sntdclwdzwo7zzhi@wtn4b55gpcp2>

On Fri, Aug 23, 2024 at 10:14:18AM +0200, Marek Behún wrote:
> Can someone who understands legal mojo determine whether it is possible
> to add this firmware to linux-firmware?

Please ask legal questions to lawyers, not kernel developers.  Would you
ask medical questions to kernel developers?  :)

Why not just contact the company themselves and ask if this is
acceptable or not?

thanks,

greg k-h

