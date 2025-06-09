Return-Path: <linux-usb+bounces-24621-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F794AD2042
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 15:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BEFE7A66B0
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jun 2025 13:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D875325C6FE;
	Mon,  9 Jun 2025 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j9TqEKoB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6925A62D
	for <linux-usb@vger.kernel.org>; Mon,  9 Jun 2025 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477290; cv=none; b=tOS1O6F0AD8NhilS6+7aY/k4bJcOfnsKKSBKZZNqHDVCsots0D57Q0YoFiMWEhVW+kq8GRT+NMVSwfTlJvnmnOBZo0RIejaOwGV/LU6ZAvbp+QDQLowl1i2Q74LVWiT8ME3xqiAioFvnSRLMi982hjmeb73QRUjCPYBBGB4919k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477290; c=relaxed/simple;
	bh=AtQ5DeLqMLMiqzfDfVnJQLhsl7WhKEqsNLlvztdlvto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0XYmvwctbwi1jcio8/LY7jUsRGqp+h5bVataxSeUtGBecJdwg5O8L9yc7Z7kGiwqwmmFpMoaRAGmS0GPdHVF/ejd+4C/9uJXOz8rrlYOlUUj5E0A1NXftpqyP6udqdz9ocCT02/atgUiv2tjuzHoI6hHPfNec0TPjHc7r1Z7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j9TqEKoB; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d219896edeso432465685a.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Jun 2025 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749477287; x=1750082087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=j9TqEKoBMywOEfcnhaVJwWvQBq/XrTbFJ54DCMJY51GAyOsvZYuz4XYZt5hQEffDWF
         gsLlfUM74vgZ9KA+v9yWwKuMBIFg89Ws6V6DBpUfo77HvLq+d3p9x2k5o7NKZASW2/Dr
         GZnRDdKEmc8EU99vlX7EZuBtihki8V8nl2ebwvjMg2sW6BV0Gt61YiJWYJ0PYM8RySH+
         sc4iOitHh7zvzCGsMdTnOy+ijhT/8VweAMrh+f+jf6kVfVoY9czTpK0UtfWhtWj5Sib+
         K24zbIRmwjUHBVXixM7d1EOFSBxnXWgBS2rhdIQ2B+Xly0qeqjGcLkxHq4qgDQapwgFF
         GJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477287; x=1750082087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=FEOw4sQ4anF/RqDQWCy5lzHOx4DIoQUnnBlTDbHzVhIo6DWcejRvZlK3uvVl8olz5A
         foGkdtdke+vnfrVhbh87TmgO/J+aE5tE6U+Yp+hvcu8uKGLX4ff2B1lnXsAAhyxWBAMB
         pT3ez9mdKn1uqWtxDl5jfePri6boBLQw/q1x3NdnfQWqNE8iTTae4K0Yaz5KduYX7tV+
         c8CX5M7kjHybmBck+aZjQ27ZN9/897DOAKnXmjLDK6TWoWJSIdzwg0OD90VuadYMuBvL
         QNqLYC6N8N1L+EWhMxq1c9kHFe4FjV/NGt0CLlCX/3pTSfW2juVruB1bTn/wTD2+Uy80
         oS6g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3U9lECzAWd9gSMuvKRi9UKG/mBVA225SL1FMNjF9MyFlfSIQONqe9KaGOOxMXI0BpzAygT3VNuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3A2uP1cbvfAOOQdP5G27RSemZQg51Pzdd1GU9dS8GQ6ko1el
	U/lciMkXrRcPzMQilX1ypS6L1J2W+8MraEh55w3Uz/jkIRYCFDB4tvpAFuwmdVudTw==
X-Gm-Gg: ASbGncujl6WelUi6z3DpFiOZ/tcA7xzduYPOTkrLWQD+nvzh6cRNNowuQvPl256swQ8
	OzaPKlukHUaIE+xDeoPihg6aKhLaC3jEkopbEWEuAx73xQzBY3k9lhZ1CKxvcodaxBlx/+K1ppr
	4gDht9kE9VJQTerVwLLtZWo07WlmN3lFronNYBXTsA8fUS5w6J+eAagScobxdE6Yr01B13zn0w1
	Vv4jSgXiQMddbQdoit7KfJ3eodvEA1Ia1mTdGl1E6yAopvpS1yX5L33mTNub0EFX4Q40QgSTkl7
	oRlreUnhjospORJjedEmaG0g7z49CwSUO4xsSLSTJDQQxpTkUZo/Q6DztNE5qhWPzV9M0bgibvk
	3Lnvz
X-Google-Smtp-Source: AGHT+IFmfPwn0la8Bjg0x9fgItMpfqDL+xE2KxSEQfR+WeIFu+KstQKcIkZH8uGDncVhKeEIwi22SA==
X-Received: by 2002:a05:620a:178c:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d2298ce851mr2069583185a.44.1749477287608;
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a535794sm545282185a.26.2025.06.09.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:54:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>

On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> Hi Shawn,
> 
> Thanks for your reports!
> 
> On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > Hi Xu, Peter,
> > 
> > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > 
> >  - USB gadget is enabled as Ethernet
> >  - There is data transfer over USB Ethernet
> >  - Device is going in/out suspend

> During the scp process, the usb host won't put usb device to suspend state.
> In current design, then the ether driver doesn't know the system has
> suspended after echo mem. The root cause is that ether driver is still tring
> to queue usb request after usb controller has suspended where usb clock is off,
> then the system hang.
> 
> With the above changes, I think the ether driver will fail to eth_start_xmit() 
> at an ealier stage, so the issue can't be triggered.
> 
> I think the ether driver needs call gether_suspend() accordingly, to do this,
> the controller driver need explicitly call suspend() function when it's going
> to be suspended. Could you check whether below patch fix the issue?

The situation is more complicated than this.

In general, a USB gadget cannot allow itself to be suspended while the 
USB bus it is connected to remains active.  Not unless it can be set to 
wake up when a USB packet arrives, and even that probably won't work 
because the wakeup sequence would take too long and the USB transfer 
would time out on the host.

The best way to fix this problem is for the gadget to disconnect itself 
from the USB bus whenever it goes into suspend, and to reconnect when it 
resumes.

Alan Stern

