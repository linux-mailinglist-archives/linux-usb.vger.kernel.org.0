Return-Path: <linux-usb+bounces-31243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C48CAB7C1
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 17:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABBA3301516F
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 16:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEF22D060D;
	Sun,  7 Dec 2025 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FzMwH04n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8C5E54B
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765125372; cv=none; b=JFT+hLu1oyG5Vxpw8Gw77975zF3aZefJerI5JsuVpkBb6TyZv6rjSw7pb4nE7ngEbUZfUKkZzeG+Q1uOambQLWZkHYqEnS2g+h6KoBHm7VfAK1RrViprP8iuo+6tVcz4coqCasUGcwZydRDIyBgMJm4YH7WpYZGmiWAZRs/9xzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765125372; c=relaxed/simple;
	bh=evCqNSZXxUHYtMTFVgwN8tMblWRUJ3gdzw7I2qnLcx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIIZdh9CymlGV6lWnrDcBzUOOoSNH5QQrsLr0UN5Oqwd6GasZNv7bJ3j8TN+7LufJLTKdgKZZrLELm2y0KpRgIJ+fNNSyW0UHl9dCdLO1gBSntE1h1Qnos4aj0/9DlA1KE00yjxvJnpj8ZfCwfYUG7AKWxu81meDyhh7A6TXAm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FzMwH04n; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-880503ab181so40642916d6.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 08:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1765125370; x=1765730170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uK/ZVROsyWRahZ4D+UgkJUmlyNlXoP3LqAoBXFSqPgQ=;
        b=FzMwH04na/kM4M4S5/XLAJ11wfz8Hl0mgiSuMCSgUiRh/vuhghwwVxET6gWEG1LkpB
         ckMBlZiswCfBZZMz6MUQBzbZ5w7v+6FVaaavOWY51wklwXIvVdNF0eLFazW96oyXOQhY
         I5JDq/YUysnhoM+m2QI3UZ8VbC0Y66PZdGQ2C1xoB246/rema2RLt07oShug4Vic1LYw
         bolrGnDS3tYDEqEXTz+gDyQkN2b+SCS2kvtnwfDcxb7rmsgCeXb/QuhsoI9LIbVh5XbW
         bCygpjGl+u05rGFshwIV1UqJqEx/cVh1CwSiLQ+kJL7GuDObVxNj9vQEDJkhR6OXFuWr
         810g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765125370; x=1765730170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uK/ZVROsyWRahZ4D+UgkJUmlyNlXoP3LqAoBXFSqPgQ=;
        b=YSsGL94n20dyOGNmmM/9eLQZFuD8HQn4Rgv1LNAOc4L+Mak4z9nBGJpg8pM8Y5Q04Q
         EHgw0hPTiF0+5Xdd0XQceE7Ra14gJ2mF6QQQSKn/8FeKaSHGKJRsPFYLgg9/CnUKi4Pu
         YnnoDrX8FH1qZBPOdjYhRojGxgEW7yzoe2oEH4pBKwHNYWCxqMum7pGUwc4akB8nkATS
         tPOC3dbne/AitXfWDFAVO94PuiGbbnB0SArkwdIo25DY2k/ouV4JsskP9S+6a3jWXuep
         3esAhFBDHi+QUJ6Kxh5S6nDSLfR7iwTdruRQ4nBr3xRxvE1CFl+vr6+XLv4LyTxr4smU
         YKxg==
X-Forwarded-Encrypted: i=1; AJvYcCX0SOnu+oKFnSC0qiN5qAcCLK0I3nOYznTLaDAxpetxlIyn99olNcV5azF7gZkdAxBuBKBg+bFkLGs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxq79hHNjFeK9Z/GjwFxc73Y8DkvaA7F7PH8SwxEywAK2gnN7b
	pnVNZwnIGM2AO+56m+4ujakdCeL/bcR6pO83CcSugWLSuQ9HiaSxv6rJLZrTmxvNAg==
X-Gm-Gg: ASbGncsrYymAsNrCAA+CBX1lquUS2KnZ2JbW7m/vMEyQv1rPRiT/glEcj/iFWriAtY0
	IeoA1WzumsLNuhibsxlSzmo+lxggU4yBFvZdoJlP6aR/9qPW2KX74DCqb1wPFfJeNvbOTArcQYq
	P0m7FXOrXGUeTZZUiXRcCZBploh13WBSBAuS3jJcHyd1sQhP9iPMZ+l9UaFcBfA/eyOiQ1K+ZVN
	nRtZN0aoLIduTQE3auBsz46bwlbqMwIXNgrT8kd2dwvEOsfjNtjofjtIYRtiTZ4bE1qpNnRXpwc
	A9kZ4K35hspybTBm8SezcaDWLQbe6oizPu0mxLbw6ak2Ne1x0hT78NDiJcKpDKG4zex4CyXnYR6
	pbv20fbwu3azhfM4thFTF9nDzyCrPAW+8GZ1/Rf64+8x0qCdwMI6yDL4BrDRlR0ran9W1G++EME
	wVSlTLgEisNnFv
X-Google-Smtp-Source: AGHT+IHunm/1gUhODnfT8+TQVH2VuwuEPBQA69Zvan054v1MyQHhj04FZHW4MDCyTvN7iqoA8wxZYg==
X-Received: by 2002:a05:620a:29d5:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8b6a23ddf61mr803639085a.68.1765125370124;
        Sun, 07 Dec 2025 08:36:10 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::2aa9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b627a798desm840460785a.33.2025.12.07.08.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 08:36:09 -0800 (PST)
Date: Sun, 7 Dec 2025 11:36:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Message-ID: <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>

On Sun, Dec 07, 2025 at 12:47:25PM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> As per the suspend_devices_and_enter() [1], if .suspend() fails, it invoke
> the .resume() callback.

Quite wrong.  If .suspend() fails, the core assumes the device is still 
at full power.  It does not try to resume the device.

> This patch series drops redundant resume() from
> {e,o}hci_platform_suspend()

These resume() calls are not redundant and they should not be dropped.

> [1]
> https://elixir.bootlin.com/linux/v6.18-rc7/source/kernel/power/suspend.c#L519

The message on this line has no bearing on what you are doing.  It 
merely says "Some devices failed to suspend, or early wake event 
detected".  There's nothing about invoking the .resume() callback.

Alan Stern

