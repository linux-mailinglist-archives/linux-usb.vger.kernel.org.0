Return-Path: <linux-usb+bounces-30781-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0D4C749EA
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 15:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D507735AAE8
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 14:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC722BE036;
	Thu, 20 Nov 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PrycRMqz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349A29DB65
	for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763649551; cv=none; b=cHQ9bh+N7sKDUxWS7gkhxQe6Ls5Lapk1EeBSp/3WS3th0vjxgamoiV/j2shqQ8K5pTeEPQO3iQW5Oo7+0mK1nzY1IfWsmxn9f3XWwZ1wPRuZtAV8qW1g9sRzlgaaeKsGR8q7S7wUMRTawtmnDm5JLr4qn6PhRijUJA8bFvBB+as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763649551; c=relaxed/simple;
	bh=DH5oSJvR3dJe6OLgj5thuliJ6dQgbaPtx8wjWFyG4Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+Nb+RGAT1LuEDLJjrOUWNscWS5gJcGAbaP7jXQAaDz39H5wPyPMS90bIzMuU4frHnE/vN/1qYXYKcnrhILWd0hRIwnkUasf7bmdVnsUzZ7tebANvP57VLscDoxTSsL8m5cz7tsKBWUR/hcJB9G5FxpB4/DIwPFsVp+bdUCwD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PrycRMqz; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee158187aaso8090411cf.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Nov 2025 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763649547; x=1764254347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tsyge+UTNr06nxUBEgnp5/PyL3z7XzvVYDHeavNl7wg=;
        b=PrycRMqzPB55tkH8kLbqgKN9cJp/I1XRy4y+XkNpjKl8wi+qsU1kpBp3tv9z+9XVPE
         mwh7cj3OPXQ4CQ1LjxqmwEGC8qP7ofhUujtGFqgwveyJKqht8bFej/GweaUsDZgosw6q
         8KMuA97wGqPVicbL9kQO2XrPtLzoyJtxf3yqU/L+zBIUQ5NZVCeAs5A0O1N+t7sw5/T9
         RxduPutCBhXiC9tIyG00xy60Jo3/8ByXsKtl0KNP2LN+LJB6TfwvmS2tywJ8x5fqu0BF
         cLYlug3yPPUqAMU1dCPbmILRKGb5c/djg5yFhWlt3ZOKhvp0Y4WWdXHG3UkK0PG9+/Lg
         KXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763649547; x=1764254347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tsyge+UTNr06nxUBEgnp5/PyL3z7XzvVYDHeavNl7wg=;
        b=Zw7lv4wrLxlQAgCYdR+AGv7ij0wBhNCxm3ZSilU/kxbyu4opH3XoPRfTtoEhwSbGQM
         tNS6I0CHJ6rrqt2oepsZAwHiq7umPNqyOJKTi8b8o+780nc3g9hNJuhJyuWp1dzvvygy
         yjG9K4pHWcTeTY/FU6x828aQF07KP3kIN+8p+CG0CL8HEyZNd4t+kMlbzsJRcmHu+mbV
         oG2RlW1R1pSSqMXcJ1m9YEOcYRGwpZUcNHXyYOg4yEtmFWii7jfsZBOfEwtZE9vRwB/z
         cZtg1eR0ukXmlxSb3yZcY+xM4qCz4W9oc3w9Pl10ZCw3CYtNGHjFCxBxfVC3ZJc912ZA
         633A==
X-Forwarded-Encrypted: i=1; AJvYcCVzzD386SJdvYbjve4DKtkc+6PZNSOVocNlO/89gbqx16eTe2ZwsuqNSqc185Wa/E50Zc3z1lzViUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFO+yXo/T1B111ai0IY5TntD076EG5FhpMS9+hPuxLcsgSA8H
	rQ3jGDDk6Izhb1BD+wCXp0T2dD8FxoBukR2n6ZtFNYLVPOetEllH/W3fJiAQ78IZbg==
X-Gm-Gg: ASbGncuGaWagC7RJcAJkJN+oMZ7wKGK/FjXTpz6D0BpsibS7/6ncJdx3lm+zvrXSXd2
	c4/WrxrLIbvS5dplQEnN7Y57r84/5C7B5xV1WFx3cAhLeUeSP/CwkpxSVReVs3Z7JredKl5A3L1
	gUjUsNjZ7D224eiW4yjay0nQCjyirsGW0Bgd+I9UVMKmxhpMVyPnHialFOQjflyLaqesv4pQ6qn
	jqW3X8KMLTaRQX/yzW+fKasUV/hhADa3nScuKZR1takJVkUwJrBKJ3pRePqfcLU+DhhcMcMx0U7
	mKKsIOsqbE+UL49qq5Arw5pbWAPlgRk6QgnTkPphCeou+NTm8jd+MFAAVvp4x8k3eJIBcvc34RQ
	/iydNA6gPpADpJBvpr1bW7DDeyqfg6Qe2En1oVqxubK10mRObYDxjHIJG7XLkTM94CsH6zjTGNN
	8l7r7uBmGa8rMDg2YQf/2CZ/J9P4+dCTwJjfvLZSA6
X-Google-Smtp-Source: AGHT+IHLp6nckAQVgK/2ngVCfbWWF0HoJBajmN0+NB0f3cs0jt/2m3Sh3dQmu1QWNVCva0eiHfP1Og==
X-Received: by 2002:ac8:594d:0:b0:4ee:278c:bde7 with SMTP id d75a77b69052e-4ee4d3c049bmr24878881cf.23.1763649547529;
        Thu, 20 Nov 2025 06:39:07 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48b45ccesm16629521cf.0.2025.11.20.06.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:39:07 -0800 (PST)
Date: Thu, 20 Nov 2025 09:39:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usb-storage] Re: [PATCH 28/44] drivers/usb/storage: use min()
 instead of min_t()
Message-ID: <431b212d-e55d-4936-9318-a3fcf64b69af@rowland.harvard.edu>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
 <20251119224140.8616-29-david.laight.linux@gmail.com>
 <4208129f-a768-44e2-843f-309c50ea362f@rowland.harvard.edu>
 <20251120091802.0b238c96@pumpkin>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120091802.0b238c96@pumpkin>

On Thu, Nov 20, 2025 at 09:18:02AM +0000, David Laight wrote:
> On Wed, 19 Nov 2025 21:59:42 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > On Wed, Nov 19, 2025 at 10:41:24PM +0000, david.laight.linux@gmail.com wrote:
> > > From: David Laight <david.laight.linux@gmail.com>
> > > 
> > > min_t(unsigned int, a, b) casts an 'unsigned long' to 'unsigned int'.
> > > Use min(a, b) instead as it promotes any 'unsigned int' to 'unsigned long'
> > > and so cannot discard significant bits.
> > > 
> > > In this case the 'unsigned long' value is small enough that the result
> > > is ok.
> > > 
> > > Detected by an extra check added to min_t().  
> > 
> > In fact, min_t(T, a, b) cannot go wrong as long as all the types are 
> > unsigned and at least one of a, b has type T or smaller.
> 
> That is backwards, both a and b have to have types at least as large
> as T (or rather values that will fit in T).
> - which is exactly what people keep getting wrong.
> Consider:
> 	u32 a = 4;
> 	u64 b = 0x100000001ull;
> then:
> 	min_t(u32, a, b)
> has value 1 not 4.

You are right.  For some reason I was thinking that the comparison took 
place before the casts, which doesn't make any sense.

Alan Stern

