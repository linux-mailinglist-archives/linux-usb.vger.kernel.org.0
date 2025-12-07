Return-Path: <linux-usb+bounces-31248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED8CABA5A
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 23:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CA73300DCBC
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 22:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2702E54A1;
	Sun,  7 Dec 2025 22:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyAcx00G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1181FBEA8
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 22:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765145201; cv=none; b=SjqpMjgn1ZTrm7D9Z+xmGpOmDqqlazTG0q8XC2qOTBUr5U6P+ZqtAY9PAOHSKdl+t3+Hpr6YHH21SbtbnFcCeogFa/ss0rZyczqf7DeQuMh5NN3HZGUqWMu5APZcDYrw8f3Wom5HehYzw2TqN3vRJvh1ftTk0GK+Ad7TxC8U0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765145201; c=relaxed/simple;
	bh=yT6tc7i4bprUf+4J93CVvBqZCIInBPoW4tDt9vX/0To=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q45rvKl9Ao6l+00jmAEWG2kvCgCQv77dsdpY/XnvzcARMBi+aHQ+b6g02pRb4j3ouoeEBWSRrEB9HqcpVcdVeUVPZnCtZ7HNZKAftQczPXV2aqqY6yM4F15GOIoxXOPHQbcuFfJuBL1MA27DkUjxkwzTZJ0Ly2bBhbL14tRKlZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyAcx00G; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7355f6ef12so436469666b.3
        for <linux-usb@vger.kernel.org>; Sun, 07 Dec 2025 14:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765145198; x=1765749998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT6tc7i4bprUf+4J93CVvBqZCIInBPoW4tDt9vX/0To=;
        b=ZyAcx00GbCltPgeR50SlmUjasYOA7vNW5tZtXIMCHewkHBBroc/jb1yyJo/GuhYfgk
         R/zfWmgTy78oailaP/JHEz+FBny0Ldoj2nfEDuy0HD8aT9jAuTh3i+8F4F8e5foBvFbL
         lufvqwaJMGYLKTCfzEGYeyidkZ6rqYG+a82rLzjeiEnBCEcZLh3v5DOW67QxXJknLEPV
         QzosVFguUHCmaJL3eau3+D65+OjgG9NNkTLaPU/oR0o+2iUYbCQiWOt+pCFh2fTYb3eF
         Dki3WZT95MuW8YPnFv2dve9DuR0HsAQRp1Oo+yELrCriwrxsYS4yoFcUC0V36ahg1YsH
         I7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765145198; x=1765749998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yT6tc7i4bprUf+4J93CVvBqZCIInBPoW4tDt9vX/0To=;
        b=A4LAIbyvloHRyf7VTjZVzaCwwJ1lcgqqn3jmyfYwi7MLwY/eJ5MQFvaCCVKw1BZQfg
         /8xbfQZMnrDrrYAR/qU+XmObRxBlLECMZ7EI+dNpDa4Aiz46hakdCodXriHv4UlAPTnb
         yC1iDTrE2IVys8dWnn+CaSJmxMJfIng31NAJM8xgAUaqxiIGR6uZMGLWwx5dq9dw9FTj
         Yc2lsYLP7KyUWnIAec9U9orJT70/H9ulAAIgqdVXcLXY3q/7aRf23ZodmG8HwsJtGuJz
         U1wPLsQVT9RB/yxsALedAnYt+Q52AgGQq4tFPrJ7IGS4XcLNlkejTLcjHy1pySffpBL9
         bh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIxE2xAkfqXjYjbReFdPT/1wCwkX7jPCTsB8yuaWmvC4ffUvPZ0srfYzNMBWfiyGrmx/ZwwvK2A6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YythR6bnDZ85yFvgl0VrNz2tMK+2UxaiWRRXpzVp11T//Axnm43
	X6tdhGEy13FGcEeXAHg0EG1KECBtcqekuV72G/q9HVE55/OgUfFrellA3JHujA==
X-Gm-Gg: ASbGncsVVWr3klTEIGtwOLiBQM+BUV9ri0g81dcm0okhE4dfLbQKvS2Q4bu8BtMsYxA
	+MoHsqhVS+6l8nyglap01qcw+82JCml96AXMyb9GOn1Xpxke2Tj1jciHdUGhscql47YA3py25Xu
	aEm+s/dFhE2jzeVXXTr/SSWS6wxdefesjDydCtGKs4xwhYZ/sRePrmgcf93NWdwu5M2yMR5dx48
	R8TyAiLiY4RbbZnfUZnBQpEQ/IdxUkUBNpvIutOjwQO44HZsM+RqInHfDK9dJ0LLMb0JUd+rZq2
	wPQs6Vi/CyJbjYw+f8ooD6wyrUOMab12/Y9FUiKz7eVCrrzt2muR+Vxd7S2WNerZ++jZ8fldt1v
	d9gnepbrPXsTV5g++WA6lYskAyUn1adIbgfUoCvgiqaTWAx790tQcq4dpX6kN8u4RcD0krMPBxC
	0NCDDoXanrw1DENa6tHHxeUvM=
X-Google-Smtp-Source: AGHT+IEzBR8h58u0S1pm2qfyheZ9U4Na5T6T15R/233PTZkB7ddDrfFWPCj8rDw2jCfiG+AlBbLcag==
X-Received: by 2002:a17:906:4789:b0:b76:791d:1c5c with SMTP id a640c23a62f3a-b7a242cfdd6mr534884266b.9.1765145198384;
        Sun, 07 Dec 2025 14:06:38 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4498865sm938369566b.17.2025.12.07.14.06.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 07 Dec 2025 14:06:38 -0800 (PST)
Date: Sun, 7 Dec 2025 23:06:34 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Johannes =?UTF-8?B?QnLDvGRlcmw=?= <johannes.bruederl@gmail.com>,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that
 hang on BOS descriptor
Message-ID: <20251207230634.7b279127.michal.pecio@gmail.com>
In-Reply-To: <2025120846-nearby-breath-e5fe@gregkh>
References: <2025120708-header-startling-ffaf@gregkh>
	<20251207012059.7899-1-johannes.bruederl@gmail.com>
	<20251207084012.7c232e52.michal.pecio@gmail.com>
	<CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
	<20251207104505.1d5f3718.michal.pecio@gmail.com>
	<CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
	<2025120748-extras-retrain-16eb@gregkh>
	<2025120846-nearby-breath-e5fe@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 8 Dec 2025 06:12:15 +0900, Greg KH wrote:
> I'm sure this isn't going to be the only device that can't handle the
> BOS descriptor if Windows isn't querying for it

I speculated in bugzilla that maybe Windows isn't asking for it, but I
doubt it now because BOS is required for LPM. More likely it was simply
WinPCAP failing to capture those queries when I tried.

lsusb works, so something "fixes" this device - maybe just waiting long
enough, maybe using different wLength, mabye getting config descriptors
before BOS or setting configuration first, I don't know.

Windows in a VM may show you how to do it ;)

Regards,
Michal

