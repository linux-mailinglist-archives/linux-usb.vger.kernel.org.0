Return-Path: <linux-usb+bounces-32118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F4120D0B3F1
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 17:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06BCB309CB2A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 16:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902153128C7;
	Fri,  9 Jan 2026 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sx2TOQxh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B3336402E
	for <linux-usb@vger.kernel.org>; Fri,  9 Jan 2026 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975823; cv=none; b=YIKAG3tayNfpqNCRgg9YcV3qithU0FdRGKf+e3jrjKy67K7+8y1Jh7dRSuVKWLOLZwiznAAHTuJ8yDZL+czLPtPgTWCYuWnNzKsyoNuWJu15yx+6wtyY2QoEJZaSBfB+NYulVXOy8kyiq4rlQ+RuuelN7TLKYJuJitZuf9O0hck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975823; c=relaxed/simple;
	bh=wfjgp3WZpYYyMfovX0U6H5pb5LPUgJ4VwEs/UiVVuYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSQ2pWg8IvytJTd6hwZ7u4LgrFemJoQkBUkEn0QME6mdeRtxHWTbZnw2pTSTjUdHMWIYG8Bd9qYvUyKEkKVZ74LzwICFWAK5lWq0pZ9GxkZNYtY8EOyot76QBZc8udqJNIIt4r8+6CabGRFjRi9RJKxjtRV7MF0NYBuye1gIDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sx2TOQxh; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8b2a4b6876fso647868385a.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Jan 2026 08:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767975820; x=1768580620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9+1Lj2Ia49PlZ8phzYmXGRiIG5dnW6GZZCnAIc4Eiq4=;
        b=sx2TOQxhZR6NDo1uvEd4dWO62GdtOupPMlzt1HxoDKULi23cS0weNZuPllcqJpInnp
         eYYyfcUP7kKAebcyjGPu1lZ31EkEiuYIucTVGREU57yRzH0yGzT/7ur8QnTJzjkC0NDr
         6+SiSYXkEzyaZl6ruaygaFpzp9hH6+oZYnANeLCZRE//Eo4SCBjkmSlTyhAp7b5o5R7S
         /ymdOofDsjaNioKSo9FqpKcYPP8kYDqKMW7jfKGJlvQ0iEfKOaxVIaZaHYHboeUu/lFQ
         xBockHf3SapOQxs6ATh00Ai2vgzKX+MHC+kCBHWvcX9khR5JgnVdZDnwvMpFVI+JK3Gd
         Ah9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975820; x=1768580620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+1Lj2Ia49PlZ8phzYmXGRiIG5dnW6GZZCnAIc4Eiq4=;
        b=dS0tpGvprOmtBTl8ExuzFeIc0MynJm6KUKGinJkRIYZuxFe9IhN0HsVD5FIWwIXzTj
         KIWdhHsIxnt3x7NWpKAh6L7lCHGk5WhTRPNQ4vVeJd3z0uNoH/mFZFjiyYQxV9lP1qrO
         QTASptfWJLzBHp2Lv42AQQfTtQ1hbAfCaFGplpNOavmy3cRiQ3bAOzcjUzWRn/J6XYAg
         ix/ZTyktkvHwy3pbPx6TbfHB+jP4wpl17clRGYKfp9TFKcROPxl294UTfoPPEeap1YIF
         jPsNlDzbLBQtBO1+7kzz9GThE8zG4Sba3L/mgcCz3Z8sflIWpOQ4tfAfXmQ46Iut14XX
         NoRw==
X-Forwarded-Encrypted: i=1; AJvYcCWzjOFj6Qr0jjAb9vGFgTZSWDL0QiVanifzdsDzPVcD/ncxFoIJoZnMCIq/RlhMadI0m0gIOgcNPWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyThCqaCG3psQgYYLElA1ADyGahT9ROzkfb6H6JzE4pIqPhTVSw
	HmN2PMLJD6hKHMnD+S5ps5am1G3Y27QgvZ6fHqUl8dCa8WeZjbLsiCS1TNNBBWTm9g==
X-Gm-Gg: AY/fxX6WwIdFwbs51HR6UcbsgoZJMmw+ri/wJzO6xmBCfunOoEsrmxSdQyxd4gN0InR
	S2ObIa+qmsI4SfdX5WhzYO2nLd2dfi8CuP6H+AAY3lRrvezjpC1iPHrHzC/D275rS2iutiYgCeD
	wJ29ecRA6+rPk0iwK30nYiaaqKe4uWkHxhxoiRFGBUNSY/ctFnveDNoRMeNsgDjkIpKnB/zNxZH
	jXh0bD0ak8FWaThfafWrYl5nKkP7J/RTOf01AVDIaIChrTKGJEnt3v3qP0TUrk70a4KqAz5vrca
	g7WIeTvE3BCHVzY9EDp1dvN8d5NZgOIwpMCkxd7KDk4N7M8fwnfvn2Jwc0wsU9ILP6KPsfYhaAX
	AQakBvM/VDmQWixc+UTlhU+5VVPJ4muXE5iYdwG6ycdreRfnO9jAf/3MigzNPd5rVXK2eQIBSMu
	S+xdH6Xa9K+jHg
X-Google-Smtp-Source: AGHT+IGpUv6x1BkYqKFZga3p3dyMM+yI0zulrhjIRGQ1t7fJ61IKuJsoq2s+Qw1yBDKBUwJ3NhdVaQ==
X-Received: by 2002:a05:620a:3911:b0:8c1:6018:b186 with SMTP id af79cd13be357-8c38942e90amr1259529385a.87.1767975820261;
        Fri, 09 Jan 2026 08:23:40 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::daa9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530f99sm844533385a.36.2026.01.09.08.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:23:39 -0800 (PST)
Date: Fri, 9 Jan 2026 11:23:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: PETER Mario <mario.peter@leica-geosystems.com>
Cc: "peter.chen@kernel.org" <peter.chen@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: chipidea: otg: use autosuspend in ci_otg_work
Message-ID: <7bda6ee2-ab80-413b-b92a-6c88a70b0f3f@rowland.harvard.edu>
References: <20260108153458.1707897-1-mario.peter@leica-geosystems.com>
 <bc08faa5-9089-44f6-8c7b-236a47aabb0f@rowland.harvard.edu>
 <28460ab0-02d9-4e19-940c-519c0e97440b@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28460ab0-02d9-4e19-940c-519c0e97440b@leica-geosystems.com>

On Fri, Jan 09, 2026 at 11:57:17AM +0000, PETER Mario wrote:
> On 1/8/26 17:12, Alan Stern wrote:
> > The real way to fix this race is by ensuring that device detection will
> > occur in all cases, whether the controller is at full power, suspended,
> > or in the process of switching between the two.
> 
> I agree this would be the proper fix. Do you have any proposals or ideas
> on how this potential race could be addressed?

No, because I don't know how the hardware or the driver works.  Peter 
Chen would be a better person to ask.

Alan Stern

