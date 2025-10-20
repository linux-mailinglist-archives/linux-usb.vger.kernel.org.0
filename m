Return-Path: <linux-usb+bounces-29469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7DBF2928
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 18:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41F164F875A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 16:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2119D2638BF;
	Mon, 20 Oct 2025 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="S9Y2vtOo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E1A32F75C
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979550; cv=none; b=UAuGjXlmG6Svqzr52FmJbWH3F9T4YRmAsgv0rYM6P16jdBPiodR2m2vBgyGXBopZ+7ViVOx5JtPSr9C1pnWo1pDY+KtCfM4jgmPviQD+tCjPoO+bwec54Rx8ISxVVwb744AhyGGOg9No9D4Ak70J11GyhOEOJdAcFepfpj2Qqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979550; c=relaxed/simple;
	bh=G4IIEQsXq1zdqfeiQ67q5+Y4YDGcO2IWhXqVol5xqew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPQrUHQzQasrymUOQXajtNjdWdGpnCDAnkn7M5dMLkYQuKHHTYI5kgyostcpczH2U4KtpvuvewJxsGIiXbz9QnqmhpXIiZh2/00Xxs/PEELMwXYrV5mOLGJszACiUoDtc+JFjYWHRtkvdTr2ab2r5loHE8sfTAvW1I6iROLA0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=S9Y2vtOo; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-893c373500cso181001885a.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760979548; x=1761584348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uB/VZmCKvL9ltY4A0qr8Fdw6HiGHMx/f84IHKJJrOdE=;
        b=S9Y2vtOoTjRNJJJPwbY7Mrx20Ldi9AUcLWA13B6tx3lP7GP00VIdr3EXeC/0S4DZDQ
         MR0/SQ+JfitvcY+ok9h8tJIhRW9LTqWGTtsU6d58deYAPenkfMh+cUv2of+os3V+U3E6
         flGdnSK10ln/nWkIufNPVzqdq/wGqg79AzF11lCVBxBhaaCgPGP4xVnsTVIwCHGF5ugv
         THeGWLl4D7fPrUtkjPBH6fdVkojkgoTXqGW33MtjtfyAuemmHB7COmvSnCoAiZOGTJ+B
         73FhLXQMlMO0zfEmWxO5MwkD+IMFdKbTkFM9+dR72CuLk3uYuqgTsZcyGmjSL8Vuixa+
         88Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979548; x=1761584348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB/VZmCKvL9ltY4A0qr8Fdw6HiGHMx/f84IHKJJrOdE=;
        b=aGgw+8t08GmUjHfJWyIVn/vnKaKfUIymMmt+lshVSUbXIDz8AwDr74nEFtXEzaWte/
         lsY6bpt6JFZ7GAP+q4R+M6Rz1SPNmP9yQLCNlnjpJcw097A3yxhQ88IwZusG28/Z2VBg
         O5puoeBM97jM9vB7U6FBPCrs+q+1fK4+cSSdz5tEeMjDe6ARgGghuqpGG65oSSb6gYNO
         UwfMIh9+Xr87Cdh4cHa96v/r3K20hapE8D0Q2IgbiovaNpzhK+DEJ4Qrnmcu+d4y/wFu
         /Ea4cght4i8pXE8e368fLuXAa6h23xjf5Pzr3k68FlzcQ0qWN3pHzI7igDQqwRfzsSZL
         /M0w==
X-Forwarded-Encrypted: i=1; AJvYcCUo66si/MfmwfAnqcEbMZ7l6yhzqQoyYFpWYt908LVubrWS4ql3qLa/bx294+tZUwpavlqExEukThE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4oAlSkGkYsc53pRd0sSL/yCxCqT/DhsL1F5D5ME4Iji/L31Tl
	D93YiAIo2fXkvyVIPTwTxj+UUc7y2f9kJoMbZ1joLniHRdas0Umsg2A3vYiJqjaBgA==
X-Gm-Gg: ASbGncvsO/DZ0+qJgHVQtKn4kbkEuUgGBTtMhUPzBXKUD08sSqx9FW0tCAmSYB3FRN7
	9RfVIG0s3QUpzZjHLRW2g9vFxzy4Q43wmseQ9Dq/OBOAAYJGyFyognFddMPnQj/WXVQIPOoHWb+
	RfoaQyTrK2kvViWLaB/SvEfonkc7oTCslAi5tQgFzKvcD/TSws5qW6cxCdX4h9v+8laXoU3MKhP
	ZLjsiv7eoJezc7zXcSPq324obspEh8hKVDtG756FvtZ3YXH1WJr4qvw5R8ubNWY/QZGGHLf34m1
	k8k9tRUoXBiTyQLHB5NuPEpi74GUQQJgcKbRl1uC2O4Kdb2w8CYB0azaCp4CEYJu4wokoP0Tom3
	WjV68IIN6TCIG6NONDhFqScX9k2823NbLdRAuDBz+Cy4WwLZoNvEENGbTgw+bMsaTd+lHmj/gq3
	+92hzVi+nR4sY34/peMjgbsv0PYaKllN23r0zgNjxP7izgSTOUaHGIOu+QXzVg2wnSIipcbQ==
X-Google-Smtp-Source: AGHT+IGHLtr5/zlm5Vk8aYNdt9qjYP5rvB9gZkc2DEsoKbe86O4g6iczemLL9y9CqHYMB7xXk9uMsg==
X-Received: by 2002:a05:620a:4410:b0:848:af6f:cb94 with SMTP id af79cd13be357-890569d449cmr2055375485a.43.1760979547552;
        Mon, 20 Oct 2025 09:59:07 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-19.harvard-secure.wrls.harvard.edu. [65.112.8.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cf58e7bfsm588289785a.50.2025.10.20.09.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:59:06 -0700 (PDT)
Date: Mon, 20 Oct 2025 12:59:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <3c2a20ef-5388-49bd-ab09-27921ef1a729@rowland.harvard.edu>
References: <20251013110753.0f640774.michal.pecio@gmail.com>
 <20251017024229.1959295-1-yicongsrfy@163.com>
 <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
 <20251017191511.6dd841e9.michal.pecio@gmail.com>
 <bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
 <20251018172156.69e93897.michal.pecio@gmail.com>
 <6640b191-d25b-4c4e-ac67-144357eb5cc3@rowland.harvard.edu>
 <20251018175618.148d4e59.michal.pecio@gmail.com>
 <e4ce396c-0047-4bd1-a5d2-aee3b86315b1@rowland.harvard.edu>
 <20251020182327.0dd8958a.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020182327.0dd8958a.michal.pecio@gmail.com>

On Mon, Oct 20, 2025 at 06:23:27PM +0200, Michal Pecio wrote:
> On Mon, 20 Oct 2025 11:56:50 -0400, Alan Stern wrote:
> > Instead of all this preferred() stuff, why not have the ax88179 driver's 
> > probe routine check for a different configuration with a vendor-specific 
> > interface?  If that other config is present and the chip is the right 
> > type then you can call usb_driver_set_configuration() -- this is exactly 
> > what it's meant for.
> 
> That could be doable and some code could be shared I guess, but how to
> get the probe() routine to run in the first place?
> 
> The chip may be in other configuration, without this vendor interface.
> If we remove _AND_INTERFACE_INFO, it's still a problem that cdc_ether
> may already be bound to the CDC interface in CDC config.
> 
> Registering a *device* driver plows through such obstacles, because
> core allows device drivers to immediately displace existing drivers.
> 
> 
> It seems that this could work, if cdc_ether blacklisting and revert
> of _AND_INTERFACE_INFO are applied as suggested in this series.
> (But as part of the main commit, to avoid transient regressions).
> 
> I wonder if blacklisting is considered necessary evil? Without it, it's
> possible that cdc_ether binds for a moment before it's kicked out by
> the vendor driver. Looks weird in dmesg, at the very least.
> 
> FWIW, my RTL8153 is blacklisted in cdc_ether too. So much for the
> promise that cfgselectors will allow users to choose drivers ;)

Another possibility is simply to give up on handling all of this 
automatically in the kernel.  The usb_modeswitch program certainly 
should be capable of determining when a USB network device ought to 
switch to a different configuration; that's very similar to the things 
it does already.  Maybe userspace is the best place to implement this 
stuff.

Furthermore, with usb_modeswitch it's not at all uncommon to have some 
drivers bind momentarily before being kicked off.  People don't care 
about it very much, as long it all happens reliably and automatically.

Alan Stern

