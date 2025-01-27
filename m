Return-Path: <linux-usb+bounces-19791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0DA1DCF8
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 20:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6923A4B86
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 19:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74549190052;
	Mon, 27 Jan 2025 19:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwCg/2dT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EECE194C96;
	Mon, 27 Jan 2025 19:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738007631; cv=none; b=cEF+3PAS3eQSBf+CvXiuHdMhx6NzA3QgLslw2SLqAyfeotn0dw2uEl6byMyN7penCzZh5jUq+onxA9TwWc7vj6xJZkyG0z4QNbGP1r9UQbtnd0P8D3cj0UZEMXD6LyJbAi9qzgVP4Ds63+vFjbrK5kopmdd2WNb2L7+UqfqLAUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738007631; c=relaxed/simple;
	bh=MrFtSzTN8htbQpvWEHR0TEbsC1Vz+dUQf3jxr3W3fSw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h+f0cFs1gGmrN4Ipai4XtCwZqOye6DBlwt/82K4JzY5q3doB2MDrR+oQtZNfZ5hVCewz5weLzE+8yoDjUWj1yaqfVaUngCR0Wbkzhnraf8pnhYcrg9SiMSWYfNqzfuHMIkRA4ehVTdY9tvNdD+LQHl4XN9bl8vIV8dhfACMs7WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwCg/2dT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54024ecc33dso4885868e87.0;
        Mon, 27 Jan 2025 11:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738007627; x=1738612427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tOUgPcP/LCb8gGwVdU2czT8MW1Mc2fScSHBFfHrWRQ=;
        b=KwCg/2dT6tcsHwu58IKZ5AZ6Kx5VGoDrUBrTvS0nCyg4T7EfcOGmtRnOwYXBfi3wob
         6eRt9+0YQevBZ+14ev1UHZ6VtRmiet6+caYyABtuIbrU+W4uhuiaDIQnXcWWU3jCypYi
         7aBUqsDnfG30JtEnw+L4lAazQyf5VGA0d028+5rePQoYSDgmDd5iRu9V+Ze/JeCaHp5v
         s801+lI6MYQTgy9DbQMgZM3rdWTKvkuG0Obv/pV0HKPPj/pUNc7KsByq19Le9hD9pF/J
         9B3cNiK19E5n52REF8QAuQWKeDYHmuKMgB9GwuuwtCxSWazP0/Argybne/Oxe/3qsUOg
         KnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738007627; x=1738612427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tOUgPcP/LCb8gGwVdU2czT8MW1Mc2fScSHBFfHrWRQ=;
        b=fnuADjPqKEG+0Z9A/YXmNwHnrShRnks2BPFNdRHD/0gUTC5oG/P9/sCMmQchqWNW8j
         UOHlXUfRdJ43o4ss4GkWeUbacYyeEAPNFbfhUzgRcR4BbH8Aa8zMoR+z3ZWVO+DYJ7FJ
         3b3d9gvMYO/XBERznaHDFzlCNLbN1mDhfTh7HV9KhN063aSaEFvea8qRJMTUcV1WgIeh
         4Ee6M3EQ4GpN6O4IKqW4m/73oXZviX//OfyoYEdNz9NOdnHao3lTwnCsr/SuZQxfOHbm
         tt2kKyPa7I6pYv360ddZ7OYxH1UoOP2HJByrRgQTrAsPi9Yv/MmaYXpnarpWj4Mz9B03
         10Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXH+xfZ05WMsZVWCwUdrWgyNUER91OSD7uA6oom1nMOLzmC9/whlUgy1qI2LlxHIaCflexR9e8Faan0YXM=@vger.kernel.org, AJvYcCXHKCg1MDBjiXB3I7sqdLxonLfAOqPJwcKM+XueNPSV3GgjKYxv6lEZlvbN7WMOCFTHr6QHMmas6qwT@vger.kernel.org
X-Gm-Message-State: AOJu0YwsOmw8MSYFCxBcQIlek0NlPNxv6/CwEvxg8756+SrdPqVrlgCG
	PlPKit50AbpHPpmIINuCK8Mu0uIycdlN007i/yXICtTRozoX0pNA
X-Gm-Gg: ASbGncu6QYEDoYdi130fKNtHMDk5+R6Lhdcn2jh2ttV7OpAdzp0/c1zMqV71dYYRXRp
	K3wTDqDyt5piDtP84gvhgg9ZEMe5SJHceWjudDxbn3UP5L8YJJzag9t/BLJgc+Wpqo+6DHU49it
	hqPPWu/6GRD+zwg4XjBGq2zSZjPendfpr+oj6CZRavDejPs6F+uAqeDpC33AotAYsVs6ValvNKd
	BeorP8UftfN2A9Iquh7jp7DTHu7b6CTsbSBUShOHDQiLXwB1VBoZ6VU3Pneh2D1JSD4pDKIGMP1
	PsKZdr7MQP/nhcjFlYbqqw==
X-Google-Smtp-Source: AGHT+IEda1CVUE7wpXuLwMQNVF54u2RXY15IFKlq+jJgzdIywDIlXSJB6iDx70wj1Lkyh1w0MKfrLQ==
X-Received: by 2002:ac2:485c:0:b0:540:1cb9:850b with SMTP id 2adb3069b0e04-5439c2483bemr13894257e87.31.1738007626930;
        Mon, 27 Jan 2025 11:53:46 -0800 (PST)
Received: from foxbook (adtk111.neoplus.adsl.tpnet.pl. [79.185.222.111])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836834csm1386187e87.149.2025.01.27.11.53.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jan 2025 11:53:46 -0800 (PST)
Date: Mon, 27 Jan 2025 20:53:40 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Restore xhci_pci support for Renesas HCs
Message-ID: <20250127205340.78b99964@foxbook>
In-Reply-To: <2025012701-citrus-omission-89b3@gregkh>
References: <20250127151051.1a91bbe6@foxbook>
	<2025012701-citrus-omission-89b3@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jan 2025 18:29:52 +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 27, 2025 at 03:10:51PM +0100, Michal Pecio wrote:
> > Some Renesas HCs require firmware upload to work, this is handled
> > by the xhci_pci_renesas driver. Other variants of those chips load
> > firmware from onboard flash and can work with xhci_pci alone.
> > 
> > A refactor merged in v6.12 broke the latter configuration and users
> > are finding their hardware not working after upgrading and need to
> > enable the firmware loader which isn't really necessary on their
> > systems.  
> 
> Why isn't it necessary?  Those chips want firmware to be uploaded, and
> if the driver doesn't need it, it should be able to handle it if it is
> not present.

Because their chips have already loaded themselves from attached SPI
flash, so they are ready to use with xhci_pci like any other HC.

The FW isn't optional, we just usually don't need to load it. And FW
for those chips is obscure and not redistributable AFAIK, so people
have little reason to enable xhci_pci_renesas if their board has ROM
and works without it. It is 'N' by default.

> No, please don't put #ifdef in .c files if at all preventable.

Hmm, I suppose I could replace the #ifdef with 'if (IS_ENABLED(...))'
and leave the rest to dead code elimination if that's preferred.

Annoyingly, the code to be knocked out is in xhci-pci and it has to
stay there to avoid runtime dependency on xhci-pci-renesas, which was
the whole point of the refactor.

> If the firmware isn't there, then the driver should be fixed to keep
> on working if it determines loading it is not needed.  This type of
> check should not be needed in the xhci-pci.c file.

This is a check for kernel configuration, not for firmware. If the
loader is disabled, we don't want to reject those chips expecting them
to be taken care of by the loader, because that is not going to happen.

Regards,
Michal

