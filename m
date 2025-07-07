Return-Path: <linux-usb+bounces-25545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5FDAFB513
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 15:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19B1D422B02
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 13:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4B12C376B;
	Mon,  7 Jul 2025 13:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IrRghkfJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1976E2C3254
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895921; cv=none; b=kRT0Rh0YrRtWMhDVpBazsmIX7O3Iw8h0n4MRyAgPWxhqAq6dhHPrXZfXtXXFuOkfoDGLKqfpv8nbh7KyrBPDIAKp0xdsrMMzsx1EkpEPKmLqb8C3aYFaPqKJ3KothXgWowpMwZ+4h1cKl38HfkIs0HYsav5aPKB2j/DlQZiUDzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895921; c=relaxed/simple;
	bh=QDsl9t2YEmmuQamk2XONRXJttu0U08QJn4stvPkU3nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLz5thSm44QTtYE1aUOO6Cvy54jxrUZ+uUsc4i6X92SI08I6VyNjPIVo4Rjn1IklWyL2GDHTdiLSJjDOSE11OsV3Z1WHo9lGjp8LLt/Ou1oQN1TEtEIg44RKvJEnd/J+prRaYsdV+/0CEzO5+3WxitW/vKA/M9Y7cPs8ZEsNBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IrRghkfJ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58ebece05so38509431cf.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751895919; x=1752500719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obIaEnQHyCk5QS48auX/2Kc2FC7ZvaEgBFlZseeyMAs=;
        b=IrRghkfJO3IwNRCwCbc7wUYvX1htcur/rkkF68IyyDG8NVkmN1hjzAEiSVluaX7O6J
         TY3uC1Qyf8Bfit4E1VLtxx3IduSwZ20AjsyokVOZ9UQ0MGVf0UevpbGI9VOkrpAUMxaC
         pp2BFDp3l9MxyDFwipvfNRfiQPJt+1GlwzOSMMuOk1c4tFvAl/dDXplcisWKvqa0gCAC
         sgsOvro8h+yKqWggjpGSVbaZ4AXpqzseBe0D6cS7jCmZF/qznxwzqzEzuxwWGrZy1gtT
         WCex2EJqsgPNAPnpAXkD/RQepuz+gv7G/EbtkK7NTfsQud3accNhQArJL9TGY77EQsdn
         8bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895919; x=1752500719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obIaEnQHyCk5QS48auX/2Kc2FC7ZvaEgBFlZseeyMAs=;
        b=NPTK8tEnDP2w0sBLDMhC1hoOigr5E3d4LnNted4JUtyoVGELlHlP3lsintouzWhJ6n
         0uFABHyrNqXtoU31NJBt6VufkBkIKAPYKt6fw0yilbW8ZDH2Ybv2lp1r4M5uOGzpjZzG
         hPonV5Crh2gibD5Oic7Zu3rk4h/J4pOrM1yhgPCdxobpBIXrv+sF1YsbukPoib4icPEQ
         UYXn8bE1SH19Tj3bg7OCVYsj54e7RvlbImn/AGsqhUjYAjaXjtukdEXaWx5VcyVyN+xb
         Pkh0VAEM54au1/lFt6ZDh+dl5XF4Gp9t7Uu7oiKASUAjg6l3Q2GF4s69Pwsoaydvc3h5
         lxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Nb7RV76gQbfPNMpT34iDTqMixJW7xv/3A3c9dH5qkSpTvlzal4iFcM+ntR/ZTggnzVsu6zXSz2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7WrHc2hEguKqz2Nj3TYdDOCNn9+lhPpefgF98oesiFYOjBwI
	px0yCohBY/wC3Yi++PCPUHDHNE7pOyEIhAlcz8kR5Jfjr4trc0CBEvYf0N7TiARMlg==
X-Gm-Gg: ASbGncu2V3tGZKiXAxfCTMyX71+NMnRYc7xze4CMM+A1sGRzyMMak/y3EjHxPb1g1Sm
	JlHTxYDSfDZvcXX6JR/zzCjXQ+wcYwIJLmTX6pW0exA0u910ao/e7CSAvzEd0/js4JcZBCz8ocn
	Ct/QGTgLZjjxeQageEo0KnvZ1QZk29RK+NUb4wd4u5F+MDuxhl/Xua6QZXYfh2XOlGOPL9uTjTM
	tiCHNa4bNbT5j9iq1qVowt3g6Vsbky+bEOxEWrTud/52aStTrp0Jt0i5yMMbHBpzDSuX/FH48Gj
	E/WbxsOVimWAIMhMtV+vFOPqqDlRyooJULX7014Qmg6woMZp+lr1jOiseZik5UcmslblHFY3EZD
	tuA1atf+sEj4BoFg=
X-Google-Smtp-Source: AGHT+IGi5sdbR8Yp9UGq9pviEO+RlKtWkQ+/NV+d3M1iFgpnz+i81iMMfB9kHMTqaC7aZmhLIBKb5A==
X-Received: by 2002:a05:622a:548c:b0:476:9847:7c6e with SMTP id d75a77b69052e-4a9964816ebmr210725461cf.19.1751895918890;
        Mon, 07 Jul 2025 06:45:18 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949faf39sm63783901cf.28.2025.07.07.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 06:45:18 -0700 (PDT)
Date: Mon, 7 Jul 2025 09:45:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Chary Chennoju, Srikanth" <srikanth.chary-chennoju@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Chris.Wulff@biamp.com" <Chris.Wulff@biamp.com>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Kalluri, Punnaiah Choudary" <punnaiah.choudary.kalluri@amd.com>
Subject: Re: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst for
 bulk transfers
Message-ID: <e5f4942f-4a0d-44a6-a2b2-7d567d4d0ddc@rowland.harvard.edu>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>
 <cf2940e3-5430-4e84-916b-608c33028a7c@rowland.harvard.edu>
 <CH3PR12MB872633800DDD386DCE8169B6B14FA@CH3PR12MB8726.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR12MB872633800DDD386DCE8169B6B14FA@CH3PR12MB8726.namprd12.prod.outlook.com>

On Mon, Jul 07, 2025 at 10:49:26AM +0000, Chary Chennoju, Srikanth wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Stern,
> 
> Thanks for your comments. If you are mentioning to have a check for the value which user is providing, then there is a check which is carried out(#34 to #37 in the patch). It limits to max burst value if user exceeds the supported value.

> > > +     /*
> > > +      * Fill in the SS bulk descriptors from the module parameters.
> > > +      * We assume that the user knows what they are doing and won't
> > > +      * give parameters that their UDC doesn't support.
> > > +      */

In that case this comment is wrong, isn't it?  You don't assume that the 
user knows what they are doing; you do check and limit the value to 
maxburst if the user's value is too big.

Alan Stern

