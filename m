Return-Path: <linux-usb+bounces-18832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4459FD413
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 13:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8D81883302
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 12:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379611F1315;
	Fri, 27 Dec 2024 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TYgT5Az/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ADD79CD;
	Fri, 27 Dec 2024 12:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735301324; cv=none; b=AaqVgyAv8ZIeig7vnfY1NTKGn7K7FK5MIjq3Y3nQyg2E/RWTSlxLd8zRjdN334TKlkqv1iKNkUnbJajF7jhhVLt/MTf61XKUam9RjaOmS0alC6U5C+Zjx2lAjH/QZcBMkqfFo57vHD1c0ggrj8tWyVN92+sqrgVOF29UWbXAxTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735301324; c=relaxed/simple;
	bh=+IYwXJEtOwfRhLs3JgOvErXDGL8VT9OyIdexVGLdumc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl1I6buw51tP0S9LVfHzRPRRpcuLdoMWOD93XnwQS41xOizkdYnqS8kXLcTy61F1LAsivfq75XtL1SNS/J7O9FwA9nqzCpRQBRmtQhscGjDn7stvHh014GPtmG3N/nepd9xJcPmZM1ARsjoYpasVwip7ITFjEAIXMGazSTg1ORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TYgT5Az/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87453C4CED0;
	Fri, 27 Dec 2024 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735301324;
	bh=+IYwXJEtOwfRhLs3JgOvErXDGL8VT9OyIdexVGLdumc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYgT5Az/wwGZhKzk/hYhgbWZM5iv2KZH1cH4r0pHtkwxxvxapXHS9uM4KWMIriHge
	 YseYUAD3R7K/fVg08vUgjDeUIw3/UZbgrcJPTrJygq4V/76XXGIM2L92xHKrSb3C85
	 Hh7tnedtjT0y2SfkiIr+3tTuvsnbJGRfUfLFW1F0=
Date: Fri, 27 Dec 2024 13:08:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: u.kleine-koenig@baylibre.com, aaro.koskinen@iki.fi, balbi@ti.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH v2] USB: phy: tahvo: Add check for clk_enable()
Message-ID: <2024122741-earring-brilliant-4cff@gregkh>
References: <20241226013500.684623-1-zmw12306@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226013500.684623-1-zmw12306@gmail.com>

On Wed, Dec 25, 2024 at 08:35:00PM -0500, Mingwei Zheng wrote:
> The APP-Miner reported the missing check.
> Add check for the return value of clk_enable() to catch the potential
> error.

You did NOT answer all of the questions required as documented in the
./Documentation/process/researcher-guidelines.rst file, so I can't take
this, sorry.

greg k-h

