Return-Path: <linux-usb+bounces-27387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0298AB3C6BD
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 02:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C82A5A509E
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 00:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D662264D9;
	Sat, 30 Aug 2025 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QQdIJbX1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE01835962
	for <linux-usb@vger.kernel.org>; Sat, 30 Aug 2025 00:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756514787; cv=none; b=tMK9owxAGk5ESJaXEvhTKL35QujHK01trYDikyfPcN6U04nyVTiiI4lZ7Xbhj/1tWpZtVsfCqHDlGnYqhpCTRdIghVtJofZhD/gW+sIrbneWb5naZSuuP93HhiMDd08rebzdHEMvxttOYN+FHid9X6edxXTJtWBzmNdnlvK+lzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756514787; c=relaxed/simple;
	bh=BlDlbu38u1XtKOS0wceLCkC5etFPhXGYTr/KipiVV4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKajuPoiOaVgdC7O3k5iTBiKPICuovbm04By/D2vEyPS6KTbiVFiVCnNvei8kPUwZQrctY6Fc++Zl0rFO9rGVWTae6d5fVhqgfxcwfYmDhspOJhAx/mCQFmj4UOorTuBo8Np3y5ZcjLFbYjRJrBcC6dhkucC50mwrK9ZMLKtRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QQdIJbX1; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7f8ea864d63so259552885a.0
        for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 17:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756514785; x=1757119585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WPLPq7twwaRsnABf4Ucetp6Xy2kklMZkEh1mgaPuZI=;
        b=QQdIJbX15hbPDKjxHYUBn1RSsGqL6HPNcppWJnLdsKGUPnoH/mkFx/bYGSxk8a4goB
         BDavTmOpqOX+UUPc34+Lby85IdVaQP81SSmWT6YV2TJwp1m1wWscMC0+pSNgFOPekE4I
         M1LXOkMPMtpzJvNlOYg5XTb7cyJ2cMdvgtsLG6cbktlbAC3LJdypk7vLbAuFr9rawS/+
         eV0jOl0hSL/bVe2QYE67643drRLsLKAQFnkWgTEJGnVpu4W8pgqn759w45umm8HrFDaL
         osUjk1MfMH6Cz6A1GUmHuMY4GGe/sWvO7vYfAWScVWbIA0ls7wFsMuL2c1fHwLoW6dY7
         u9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756514785; x=1757119585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WPLPq7twwaRsnABf4Ucetp6Xy2kklMZkEh1mgaPuZI=;
        b=A/uoS8oglLZlToffIBmaEapbBRTXsOLaKeo/dsrlBJDBZd2cpljb4v4BdGSWfvpyZT
         2X5gfO28CQaZIQ5/XI29pvf6+Rf8pjvaxILztaAdIrDJQ+KUMzm4Ux/K1TaJzZ4INz0+
         chKbP1CMrVFnCeaFIpoAtofac4I+Y/MX8UNcH31F8WCmTvRBs2zgdxahV3NMsjzfv/kB
         IpMo7gr74x/b6GnsTp7//SIYOKpVGgE+aY5xBK/E6DgC/JGGEE1yCJDcJgjWyjVZUyqG
         nsBYZ0jDjLBGR/ncvSy8dyQ91HeIDymHW6G+ZX8t5wLLWpFJKQTuhGRkso9NJJmMqeoI
         v8UA==
X-Forwarded-Encrypted: i=1; AJvYcCWGBl8oyshXy2Ue5TYv3LPuGBc7QInzpSl2+6sP/owP56kQWxYez8jhUjr8cGAYNGYqrLfPIwHn+TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/3BNNjp1/kb/tmtgfWxk48Ke99lH/iuI+oJeRu5C2I9KNqnQm
	BykM+sp3V7wfRV7AfqWOwmfeZpdy5n0zEOoUVSnw5gd9TEqOxERBULXOK71WjwqmLg==
X-Gm-Gg: ASbGnctquqFD+C/B3fdUrJF/cXS8OJ9v6uKIxLBy/39BHK++hYPdfWWiNkXlf+r/IjI
	g8WC4rnTSsi3TRxfEL6lAr3MYc0GOfUbF3T8A9++TAdkRcgPgEfEwNcUlXxaXH6WSBzlDheuVdi
	qFZRR8efCYoVbnPva8VPaZnHoBstvHRRglfBfflr2PeMcQyg+duqKqry0X0V4KrNpRbioQd13Vd
	eTa4NEJU37t5ZWEO3UBAaaslvNFMBBqG+FBMohh36tk8OLncZGinqfxBj7GH4U1LIk0auvZ7WJf
	3CfOT4B0RODdYnaaXeoTqNx7rnMelC1IezapOE68gWilITfxKWHBwMc31joHnGNS5aQ2ltzhRfF
	igcqnxti65Y5rKMvujXN1HcViSAOW30R8U6Mvd69B
X-Google-Smtp-Source: AGHT+IHQhb8okk0kP47DsuFPXdYzK0wNLahGp44Tj91jY2E09GnY+68a+tSLHGTv0ixop6Om+PzYNw==
X-Received: by 2002:a05:620a:7011:b0:7fc:e9e5:5b0f with SMTP id af79cd13be357-7ff26eab060mr70691485a.6.1756514784762;
        Fri, 29 Aug 2025 17:46:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fd35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14849559sm272681985a.41.2025.08.29.17.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:46:24 -0700 (PDT)
Date: Fri, 29 Aug 2025 20:46:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	ryan zhou <ryanzhou54@gmail.com>, Roy Luo <royluo@google.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] drvier: usb: dwc3: Fix runtime PM trying to activate
 child device xxx.dwc3 but parent is not active
Message-ID: <056bd3b8-7d62-42e5-8b5d-4113a9ef769b@rowland.harvard.edu>
References: <20250826150826.11096-1-ryanzhou54@gmail.com>
 <CA+zupgwnbt=5Oh28Chco=YNt9WwKzi2J+0hQ04nqyZG_7WUAYg@mail.gmail.com>
 <CAPwe5RMpdG1ziRAwDhqkxuzHX0x=SdFQRFUbPCVuir1OgE90YQ@mail.gmail.com>
 <5d692b81-6f58-4e86-9cb0-ede69a09d799@rowland.harvard.edu>
 <CAJZ5v0jQpQjfU5YCDbfdsJNV=6XWD=PyazGC3JykJVdEX3hQ2Q@mail.gmail.com>
 <20250829004312.5fw5jxj2gpft75nx@synopsys.com>
 <e3b5a026-fe08-4b7e-acd1-e78a88c5f59c@rowland.harvard.edu>
 <20250829190731.gx2xrgdz3tor5a2v@synopsys.com>
 <CAJZ5v0gY=w1G-R1EdpJi+Hm5+YmDWY2yJDHgVVVeOvQAkO1ffQ@mail.gmail.com>
 <20250829201306.rchlatbdxqy3xiki@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829201306.rchlatbdxqy3xiki@synopsys.com>

On Fri, Aug 29, 2025 at 08:13:07PM +0000, Thinh Nguyen wrote:
> ..shouldn't the PM core know that A was runtime suspended to not skip
> ->resume? (sorry I'm not an expert in the PM core, genuine question
> here).

This doesn't answer your question directly, but I would like to add some 
background.

There are subsystems/drivers that do want to resume their devices during 
system resume, even if the devices were in runtime suspend originally.  
At a minimum, the PM core doesn't want to take this choice away from 
them.

In fact, the USB subsystem was designed to run that way back when 
support for runtime PM was first added, and it hasn't been changed since 
-- although maybe it should be.  There are explicit mechanisms for 
telling the PM core that a device should be skipped during system 
resume; we could use them.

Regardless, I don't recall any discussions of the particular situation 
in this thread ever taking place.

Alan Stern

