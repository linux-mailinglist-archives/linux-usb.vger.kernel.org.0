Return-Path: <linux-usb+bounces-11607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09969915AC5
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 01:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E571F22127
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 23:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217DB1A2C25;
	Mon, 24 Jun 2024 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Hzzi/f/m"
X-Original-To: linux-usb@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438838F9A;
	Mon, 24 Jun 2024 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719273334; cv=none; b=lsRnnFtLF6/0ERyTWB2s7625aoa+8YjFhXoqND+j2880bnzFyJV0GoxHbLOtHTI9Be+xz9ATMe1P1/RZvheL8KNZpAHC1paATsAzIPce3Y+22M7eHUCyuRV1RCn5KfNTMvXQT/w3MQT+C6vr5lAVHM0wQoiicCOvpKqfe/jAq7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719273334; c=relaxed/simple;
	bh=LM1Doa73WH2U5GZd0XjIfitH1ryNkqLvgCDsiw2vTHE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lRGbkA2/i7NMSv8/2IvmZcu0V6VzlUnpZTr359b3PMpBEFIb/PNHAFgU4EeGi3pOxXQrbguvtqsmWxCxHa9ETq0NlEkwoNu5rtL9nrfV3N0h+wgvY2BOJhtuGFcayUWrCmyfcvsIFF+fjzDzv2kbVww3IUcuz18b+UeD8kLsuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Hzzi/f/m; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5774020009;
	Tue, 25 Jun 2024 07:55:26 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719273328;
	bh=LM1Doa73WH2U5GZd0XjIfitH1ryNkqLvgCDsiw2vTHE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hzzi/f/mEXrNfUseAUuK3uJNbCFk1jPN4G5K+/b1ByhbFtLgWrdIqX56+oPlOK04c
	 eLFLQWAHYNOAT7nXQ/sovVxWV9T6eqp1pC6kVGPnKCIqAaRfz41SIrD0J/eA2dF+KO
	 1BswyJu2QIA2ZqYmIUoG8bSN/tCf5vmBapc3BaqhUCkqscXf5/TIqt5BoPizgnlnSd
	 De2Aug2lRZHaIPAEhZ5P7q6GLebTDND68ieLv0pDNLxtHCUgkYDKtaNPF/VGDS0PqB
	 48qviuDObLOP+4FSUAx1crCDpF9zHcyDKavCif+xquHeoT6u+FrdRvCCXRXRUK8hW7
	 l8H0HfmVbA4pA==
Message-ID: <acf7873c4bd9ce1352d54fc479d5d387338929e9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: validate endpoint index for
 ast udc
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ma Ke <make24@iscas.ac.cn>, neal_liu@aspeedtech.com, 
	gregkh@linuxfoundation.org, joel@jms.id.au
Cc: linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Jun 2024 09:25:24 +0930
In-Reply-To: <20240624015314.2249128-1-make24@iscas.ac.cn>
References: <20240624015314.2249128-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-06-24 at 09:53 +0800, Ma Ke wrote:
> We should verify the bound of the array to assure that host
> may not manipulate the index to point past endpoint array.
>=20
> Found by static analysis.
>=20
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Probably best to do a v3 with a changelog as Greg's email suggests (and
for the v3 changelog entry, mention that you added the changelog).

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>


