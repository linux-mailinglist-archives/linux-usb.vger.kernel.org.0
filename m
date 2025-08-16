Return-Path: <linux-usb+bounces-26921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 664AEB289CA
	for <lists+linux-usb@lfdr.de>; Sat, 16 Aug 2025 04:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D49A3BCAF5
	for <lists+linux-usb@lfdr.de>; Sat, 16 Aug 2025 02:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DAD199EAD;
	Sat, 16 Aug 2025 02:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cenuj3tW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327D72615
	for <linux-usb@vger.kernel.org>; Sat, 16 Aug 2025 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755309853; cv=none; b=JB3xhUFH2qQjx90m1IUepzGeWPmqwf8sblTWKT2rz5BTsVfdP1i3BGtK20VULd0lUOkr29/NQX0RO64IpLumrRZDd1RSJcKpn3sPnLK8M8wBFgZHY1tiSKSpC0+NM5l9C4lOz2GHzp9BZ5DKj4t/YEpanD4HYRfrr1TmMctnhHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755309853; c=relaxed/simple;
	bh=+AVNEDHZHvQdDTf/WXMK9J79piDVR1YQex7lGADXNAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddbOiZK68/YZVKugd0iqlnjIqxhsc/0E7lX30NPUiQ27F8XODL8U0FYqAWpfa5K5BYDRBhjDwxuKcJSU4hy7KPssX6cEp2GX/xjfqDTK9zHKn3XerXXvsAfVOIs+kQw/UVTM4D0VN3S/GKw0roh4OmcSiX/8aFhUx9YcW+SxwV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cenuj3tW; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b109bd8b09so33582601cf.2
        for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 19:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755309851; x=1755914651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CcMOgsUXh0XDH0c0L0SpGP+Mo5Ev6stvJb0FAAUHGhY=;
        b=cenuj3tWXktJhQtg0khNHET0QtPPpFOcCEeCvWUZC2h9B1GPP5sybMxBMITwvZRG7x
         hO/hWd+up8ccGDsI9BCH5YCKOO65xHeiolUYrkYN6avD6yoy7LeWl5N9Vb0AFgZ4YYfX
         YqwYDKRsonH0ADrFlFo0h3ryUxa1CSIZjqBOUReEUtLJS/rlZ9mliNsmuIvHdGr1V+4U
         eluAypSOa7PwnQhc2GFWzc41je7MGzjN13JzdDkNu4gikyIu3XI3hQ5kIyQYiYgkQq4E
         D4fYP4iAdghCnlrkkDu1Y4WzP3dSfLbJk6VpbXu9gsknR1GGqQkcCKaUyXW7AmDMD94m
         vXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755309851; x=1755914651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcMOgsUXh0XDH0c0L0SpGP+Mo5Ev6stvJb0FAAUHGhY=;
        b=k9nmHJhhtGJqn5i80CWAG/A4yBK+sEslkBvmAOpLjypeZEeEn48ty1qk+B/0i9TkHf
         1JAdETIBB0vtDcyuz3kxm69CD7u+t1gTgBizdzDDcyXOV9YahEuRZ3KXovNacct72y8r
         /8bn3bHk0iqKjaWl8CeKPMdLin0xc/LWx5XpNDvIpRms5ObLN8V8WYUqyVtUzwbOpHGu
         OUh6IGGWnLHBdozt1cDF6ukj2A4gqnP3Qwg9EbNGXtvkY7u/IFXJCmjX7oNa7n2SJRhp
         Sv08sL1b0AHHDYYkcMTNpOM3pRzCwjvQtIkrJsqbNuVaFqZjBtlQQn25sRQ7d/gP73Jv
         91+w==
X-Gm-Message-State: AOJu0Yxq3bctb35npUJN+vyWsvOOoI3Zg5hpq8nu3M7UnuOlEvmB7cXn
	B2rOIozpZQ4+uOq6g3S8cWhK7/IrqRMiJG3T0YI+jUMoCK0Dn2nFRIlhIFzWdtLO48plWFKbsZ0
	Q1WM=
X-Gm-Gg: ASbGncvXV4W1eEOBG/gCMwJP5xcnxATrHFFcTK6Ksg98yQhWB9cldeYSZ2meBq/lHn/
	uOySRWrM+iOu13XD5icsPpSe0WzZMDgsD/wELjMHXw7ufVdV1BjaIzMG5U3QJB6D56E6KkF7W4h
	Ed/1HF5I1u+4n6nkkxc0y6VBGg3sC9d2mgxFFIGxwh5G63tsHJR/5rqEMI9s2AQHOKGsABSGwkS
	lchibY/5xE6OaY+M/4naocNMuJz6RXMOaCcH9aTMlA6Yq2jZNa632zlUqqLQm7fEyOyKt7hWgvr
	uw5YVTzhIRMKbqc3XPO5SkmbcOFkLx5OL02K19XGTOFMFCYe+LwMWNV/KwbRQDPsQAq0pp07Ef2
	nFajsgPMRbDqg91UGOTGhGq23TdU=
X-Google-Smtp-Source: AGHT+IFE9vxFHxeUetK8f9CiqWYjVjlFVsaLb9eFMyjpoYVSsHguoDg64RA2ulZKIWWk6gXVkGb6hw==
X-Received: by 2002:a05:622a:11c9:b0:4b0:7091:54a4 with SMTP id d75a77b69052e-4b11e0a150amr60097611cf.1.1755309850932;
        Fri, 15 Aug 2025 19:04:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::f777])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc5d069sm17884101cf.21.2025.08.15.19.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 19:04:10 -0700 (PDT)
Date: Fri, 15 Aug 2025 22:04:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <4e83d098-19e8-45aa-94e7-9ef005a0c8ab@rowland.harvard.edu>
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
 <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
 <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
 <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
 <e5d73b85-9c7f-4c74-9a00-700b4b6e7d70@valdikss.org.ru>
 <da6326e4-9b47-4347-a044-879b4be58560@rowland.harvard.edu>
 <9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru>

On Fri, Aug 15, 2025 at 09:13:09PM +0300, ValdikSS wrote:
> I *buy* these legacy devices to improve them in Linux :)
> 
> I'm making an open-source print server hardware for older printers, that's
> why for me this issue is worth researching, at least to document such
> hardware heisenbugs.
> There've been different USB behavior and incompatibilities with scanners
> (fixed it in SANE) and printers (fixed by CUPS quirks file), but this is the
> first time I'm going down to USB HC level.
> 
> This printer (Canon LBP1120) does not have drivers for 64-bit Windows or
> recent macOS, that's why for many it's a paperweight device you can't use or
> sell, unless fixed by other means (usually a VM with 32-bit Windows, and now
> my print server as well).
> 
> You gave me directions where I should look for, because I didn't know how to
> start debugging without the logic analyzer.
> Usbmon captures only USB communication packets and some of USB HUB
> controlling packets (such as TT related), but does not include
> device-controlling MMIO registers, which was the case here.
> 
> I'll add debug prints to everything related to MMIO and take a look what
> could be improved. Thanks!

Good luck!

> If you have other ideas I could try right away, please share them!

You might compare the usbmon traces for your patched OHCI against a UHCI 
system.  They should run at approximately the same speed, so it's not 
clear why the printer would work with one but not the other.

Alan Stern

