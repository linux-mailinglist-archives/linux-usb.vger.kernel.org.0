Return-Path: <linux-usb+bounces-24870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE805ADE4FF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 09:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EE021884422
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 07:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F9E27E071;
	Wed, 18 Jun 2025 07:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b="hk74WUOF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.wyraz.net (mail.wyraz.net [46.38.234.247])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583EE1D5CEA
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.234.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233344; cv=none; b=EhkuPxhHPuoNOckqpxp+z4C8RDl1rO4btchjaDdl1xuXb3TUiaN+RvCw5yG6RSvPIni8nZQOmoKFyZ+kC9gnLJ7bxY/KrxncDoQrok+Vf1VLoyI8KqJsdQMyjV7quOhcSnbappypou+OYXoMCJ8nz0OrUv/Snu2EKiVCSIPGnJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233344; c=relaxed/simple;
	bh=JIQDpiW/Dj6Eml/kBoCUArvSbqs4hYqbJfC+xLTYovE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=pngKxcnpOT4dKA7MhrMpe3zd1OY3pS7HWXeX9S9Y/TrnNW/RSpVpa1lWxKrMECjVT6Gy1xhaarG1ZD/JLXnPJpduBvo1FELK81dt6mRU4+wgFHVmfIj9hCiqaAbhwxUF8RWRfSUPFXk6J17ZEFAzEqwkY6QlMxLr4LEoLE1Thrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de; spf=pass smtp.mailfrom=wyraz.de; dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b=hk74WUOF; arc=none smtp.client-ip=46.38.234.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyraz.de
Message-ID: <b7c3389d-bfea-4e9f-a960-2939114be33d@wyraz.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyraz.de; s=dkim;
	t=1750233339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIQDpiW/Dj6Eml/kBoCUArvSbqs4hYqbJfC+xLTYovE=;
	b=hk74WUOFjIrWWhKRUNPsKxVUMq9xXKJOIyqkx3BG+3ea0RDhZOky+Zy2hF0jxM/GnsRW61
	qmLH8vJw5Zx79jMqS2COI8J8cjxYXiLhTSN/0k+suvG+QY+8QlrOTN9Qu3JnMxD9Nx5BY8
	yEpaHuh1/RkcYhbBSVrPtWUhJr2pzSkwmDxRHds73JlBcvsUUsMXmbdr8hdCO/FfTCMs6X
	TJOVJ6ivgW2DVfPWBzn/q1xbZN1HVy30Hm9CamdQ0nrwztSlAzo02ht+gIOBtH4ofyVveh
	6D3OyFYcF+LNAz+gwUKaLwD6cwQSzaLYR1L2dy8onKqla64muLhoGK2qcodvHg==
Authentication-Results: mail.wyraz.net;
	auth=pass smtp.mailfrom=michael@wyraz.de
Date: Wed, 18 Jun 2025 09:55:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Support LTE modem Marvell ML352 which is found in several
From: Michael Wyraz <michael@wyraz.de>
To: linux-usb@vger.kernel.org
References: <39a77238-9fbc-4432-93ca-637764f3fd2a@wyraz.de>
Content-Language: en-US, de-DE
In-Reply-To: <39a77238-9fbc-4432-93ca-637764f3fd2a@wyraz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: --

Please ignore this message, It's totally messed up. I'm very sorry.

