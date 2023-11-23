Return-Path: <linux-usb+bounces-3238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B937F5A88
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 09:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEDCCB20ECB
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 08:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6510D1C2AD;
	Thu, 23 Nov 2023 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VJMrc7/d"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832DB168D9
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 08:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8895BC433C7;
	Thu, 23 Nov 2023 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700729526;
	bh=DBtWK3+4bTYvqhR6xwdSm2zuTXXKyTcaPF4a3vAo4Ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJMrc7/dELHegU6ys8Q9xNaHPwau7uBCLn6rsF+qCD+JTomT6cSouvQ5Lk2OamqAF
	 s5YDFYEvpMJgFwTo7i9tx8F8ZknIk6vZK4F2a9BsDAqa8UcELizInMXzMByX5uAXR5
	 79bPHk+oJqaxd3H1FVY5Y9mnEPbYnDy3Xk9kRLZY=
Date: Thu, 23 Nov 2023 08:52:02 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: stern@rowland.harvard.edu, badhri@google.com, quic_kriskura@quicinc.com,
	francesco.dolcini@toradex.com, quic_eserrao@quicinc.com,
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] USB: gadget: core: adjust uevent timing on gadget
 unbind
Message-ID: <2023112339-deeply-curve-034f@gregkh>
References: <20231122220001.539770-1-royluo@google.com>
 <2023112253-fresh-blazing-baae@gregkh>
 <CA+zupgzWqhOhAR0_ybxTQVL928dgAqbm5eqJ6gd-0qrNK7VZng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+zupgzWqhOhAR0_ybxTQVL928dgAqbm5eqJ6gd-0qrNK7VZng@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Nov 22, 2023 at 03:13:20PM -0800, Roy Luo wrote:
> The logic is there since day 1 of udc in Commit
> 2ccea03a8f7ec93641791f2760d7cdc6cab6205f (usb: gadget: introduce UDC
> Class). Do you still want me to put on a fix tag?

Yes please, and do you want this backported to all older stable kernels?

thanks,

greg k-h

