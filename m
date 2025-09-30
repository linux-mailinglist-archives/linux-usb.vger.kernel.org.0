Return-Path: <linux-usb+bounces-28820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 369BBBAD28A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 16:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A580F1927812
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 14:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F282F60D8;
	Tue, 30 Sep 2025 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yhxuy5ew"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E4C1D9A5F
	for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759241982; cv=none; b=j51dqlIBjGCyV5+Mc2vdOMP+lWopwyxCGtmT1SCAeVHTIYh8QNwO1V1R+jPvwBOhR//cnyw657FIHdL5U+OyOStV86x9moP8m8eExSrKkoBFzOAYxe3O2vLX1BeebkPXpXd/1W/cyrrVEirJD5HBoO+ziGaRCaYExVYzJxoz7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759241982; c=relaxed/simple;
	bh=GSqtGKeLEkDO8mOc2Pcj0fzEKM7m/L0trIvQsuHGZ+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbcGB7gYQ66EuIKXN/rrUgexn+uJ87xcQmOZ+mh/MvtQOlEzIOVIFFBlMXQTj76Py+0QIiD8kBWHzygSssXgOOOEcruwgPagkjgUgcI60gVc4t7KQYFyRUY2NVTTo9QCDUG/IT52NQHKSVANFDrwrkrJ9bYlTVDEx9yUw++isYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yhxuy5ew; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so13887535e9.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759241979; x=1759846779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDjqq7jrvNjkxYsdvJ5PPEYM1NX5CibO3X/31GcV+t4=;
        b=Yhxuy5ewqtHtT5+GU5Z05rg4D2EA75Q9+s7iO1LX9UbDq6Bt+M4RjAAM19KhgnaWED
         1hgORD0jrKCg/7kEmkdm3DSv+aieNIIrRxpDtaCWrQxxH23L+HthN6u/s2qch9xOHJCx
         h6hw0f0EduAWK7XUJfAQPv0tTUOXdELc2e0+Z+uqpxXTRpHlUU5Xxds1mwfcjKVW0H+4
         Ybr/gCovG6tgtJN9J8fNwQ0fWBRYEOsbBmWzZdGaFWj1lfvqBBY7QYk9t7T2JmqkZc+5
         J5DzHqU/CZtF+8uk5ZjZh1Dv1uzbhh07CXYsRFWTqMUTn0HNV0xP7UNm8aU9B6WtqDci
         2OeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759241979; x=1759846779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDjqq7jrvNjkxYsdvJ5PPEYM1NX5CibO3X/31GcV+t4=;
        b=o2MFXeuANOVtI+P2LkGYW8Gk2VT+/Bj0Ckmg5lQOPezDPITtNuzWk328ydQ3XVLfI+
         v9W5j62TMPy8wde0p1n1wnXmAbFxCnYeuxF1GqXnQrqQOPt2D/0ED69zXrfYBdshuUin
         F8kLD/n0WOtEC5Av9w1rgWG5L+uV9jCWikoXzTesIBK5eTU2t3NTpABk5YvXSX+iftvF
         KLNhPgniLhCf6sFfhxQ0Fqv7+2MObDuUfWSXLG1e5sKa0QveOdinDAGFZWIz/ycnYeDx
         uMVloccFgr82pXbucFNFCT90rSF20BbVsDo7dbrNQNloyDAYgqngLCnZjuy97J4Gv0ky
         0lxg==
X-Forwarded-Encrypted: i=1; AJvYcCUbh6wh27FtVogLxRdemPcbvIU5LvEy/fO1aWs4oOK6fVXQ+qyOW7LxoAEaXrWGyrooqp/fW1BKVPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9GSuWWYodbX/xPWoVZDqBNeBV/aHsv4gapJXi+X6tT3WwenYK
	EMxtvzO7xrs8HC5rGXLfa7k0sNOei1oyXXOczctA0+C/+f2B8Ssy48WKmY4LVMrbls8=
X-Gm-Gg: ASbGncvLmyv9ZYm6hmLk/o1q5fdVE7+Ogwc5mm9DcdoKRw/BA9K0oyuUavw9JN9T+p2
	yvkVggNrMTS1qrqeL5m3sjb5lynMU2iqaYd4ko68SnZXt6C1UzyY9bvg6rmk6lgfP/59Wh/QpfN
	bkVITPQJmLEiYRjeWo3oTkbgcfs+GBZbvjfvYFx/LX2tU8Xl9spRadC591Jr1sLyevDwYYv5K+X
	PfvJA9hKOy+n/W6byKvNDH/jv0kE+JBumvLY4HmuQ2Di1+ybvihwLoIOy+gQbY3Yn5qYdky2DF3
	5VLqGmEnixGItVEwrX3Pz6D7PIdIAvLLyANOEpM+dTeAhzBz9PTvC9f2QWl4ebS1a5u/byvwEEX
	DhMUoGmm64L5x1+FMu10DYIzE2DDGl0D8lZMbufZkxiyIC0Rtgkjs4DCwtcj5eec=
X-Google-Smtp-Source: AGHT+IGZAD/5oX1ipv48pfdQeRFK5TqRyymJQORmTLlc+sbKKPcFj0zcXeK1EO+S0yZ9fWsth2JhjA==
X-Received: by 2002:a05:600c:468e:b0:46e:36ba:9253 with SMTP id 5b1f17b1804b1-46e6127b93cmr330185e9.15.1759241978952;
        Tue, 30 Sep 2025 07:19:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e56f3dc27sm67637095e9.5.2025.09.30.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 07:19:38 -0700 (PDT)
Date: Tue, 30 Sep 2025 17:19:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: David Brownell <david-b@pacbell.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Christian Heusel <christian@heusel.eu>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] rndis_host: Check for integer overflows in
 rndis_rx_fixup()
Message-ID: <aNvm91A4Mmu_qamc@stanley.mountain>
References: <aNvOh3f2B5g0eeRC@stanley.mountain>
 <2025093055-awoke-facedown-64d5@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025093055-awoke-facedown-64d5@gregkh>

On Tue, Sep 30, 2025 at 03:56:39PM +0200, Greg KH wrote:
> On Tue, Sep 30, 2025 at 03:35:19PM +0300, Dan Carpenter wrote:
> > The "data_offset" and "data_len" values come from received skb->data so
> > we don't trust them.  They are u32 types. Check that the "data_offset +
> > data_len + 8" addition does not have an integer overflow.
> > 
> > Fixes: 64e049102d3d ("[PATCH] USB: usbnet (8/9) module for RNDIS devices")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/net/usb/rndis_host.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> David has passed away many years ago, odd that this was sent to him
> given that get_maintainers.pl doesn't show it :(
> 
> > diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
> > index 7b3739b29c8f..913aca6ff434 100644
> > --- a/drivers/net/usb/rndis_host.c
> > +++ b/drivers/net/usb/rndis_host.c
> > @@ -513,8 +513,9 @@ int rndis_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
> >  		data_len = le32_to_cpu(hdr->data_len);
> >  
> >  		/* don't choke if we see oob, per-packet data, etc */
> > -		if (unlikely(msg_type != RNDIS_MSG_PACKET || skb->len < msg_len
> > -				|| (data_offset + data_len + 8) > msg_len)) {
> > +		if (unlikely(msg_type != RNDIS_MSG_PACKET || skb->len < msg_len ||
> > +				size_add(data_offset, data_len) > U32_MAX - 8 ||
> > +				(data_offset + data_len + 8) > msg_len)) {
> 
> Nice, I missed this in my old audit of this code (there's still lots of
> other types of these bugs in this codebase, remember the rndis standard
> says "there is no security", and should never be used by untrusted
> devices.)
> 
> But will this work?  If size_add(x, y) wraps, it will return SIZE_MAX,
> which we hope is bigger than (U32_MAX - 8)?  That feels fragile.
> 

SIZE_MAX is always going to be >= U32_MAX so it works.

Right now size_t is exactly the same as unsigned long.  I think we might
end up making it a separate thing so we can enforce stricter checking.

> Then we do:
> 	skb_pull(skb, 8 + data_offset);
> so if data_offset was huge, that doesn't really do anything, and then we
> treat data_len independent of data_offset.  So even if that check
> overflowed, I don't think anything "real" will happen here except a
> packet is dropped.
> 
> or am I missing something elsewhere in this function?

Yeah.  You're right.  I don't see anything very bad happening with an
integer overflow.

regards,
dan carpenter


