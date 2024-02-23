Return-Path: <linux-usb+bounces-6961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C68615A5
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 16:25:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFF011C23F4F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 15:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0354112839B;
	Fri, 23 Feb 2024 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ruabmbua.dev header.i=@ruabmbua.dev header.b="kISvooDL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9218663F
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708701812; cv=none; b=ZaAIa5a2fk9C8Iz+UYR+VXLIvFFrE35TyMsjm3lAfmDbxqaf0zfhvjuKxbQMCTts6cmAqqbKpaq/NCleiJtLnzpKWcL04Q50EZnwPyL1QHkhjomL+oifJncQUkAixy3oPynCF+HKnX5Gwckk9GQ7qkawMQZfPkNrArUfCh4Z2Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708701812; c=relaxed/simple;
	bh=yjCef3Pl8r2Z8X8RosnOWlv63dblyb9vSlopjUoO06A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=WHNwsuODp1cYc4ShFwm9Wy7x2fPlclVBIppxD1UX6n8Rz7hsjmiBF4qzLR0PjV87m28bS2BGdBTJ2hXwkFrAvqQ+BIOEaRADj3DoncxQ481vuvOW2I8pd2V/5zIHvsZf1tg1xYoGtH202Iz/xKHmNM86gmAmv/S3ebfaS/7AHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ruabmbua.dev; spf=pass smtp.mailfrom=ruabmbua.dev; dkim=pass (2048-bit key) header.d=ruabmbua.dev header.i=@ruabmbua.dev header.b=kISvooDL; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ruabmbua.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruabmbua.dev
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ThDKm0gBMz9sq5;
	Fri, 23 Feb 2024 16:23:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ruabmbua.dev;
	s=MBO0001; t=1708701788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjCef3Pl8r2Z8X8RosnOWlv63dblyb9vSlopjUoO06A=;
	b=kISvooDLVakNYsyXKGj/B8X5WDP9Vdr/Ylu4EDCpDSvRDo8bof4WAmfTclF4zxx0Js9ZHs
	hi3JwDT8BOUInUe2PAddMK35mSEAXnTA6omHOhJ/4ii87gIcABVxOCqKphVTojyVczQ3td
	6r+TyW4ro48pQnYW7HTpMMyQQy1FH/li7thewYLZpL9hi+hWPiOUZVoQf85z+Vbu2D2fQI
	XrN8uKjKIbTzzViUMsyKvLzFmYq8VNtCCLC6G3388pLQwl0p0TnRSbbylR7nWH3bQSq107
	QqUpm9Ys09jgYfQ0KnAogwrASVNzPXJ6h5c3lELzfE+CyIfX9BPCN5i29Zh9Hw==
Message-ID: <6b9425c4-ac1f-4215-aa59-24e48056774f@ruabmbua.dev>
Date: Fri, 23 Feb 2024 16:23:06 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: linux-usb@vger.kernel.org
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
Content-Language: en-US
Cc: yaroslav.isakov@gmail.com
From: Roland Ruckerbauer <mail@ruabmbua.dev>
In-Reply-To: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I think I am running into exactly the same issue on my T15 Gen2 AMD
Not surprising since the models are almost identical.


On 17.12.23 17:21, Yaroslav Isakov wrote:
> You need to report this to Lenovo. This is an issue in their firmware.
>
> We can work around this by adding DMI quirk where we hardcode the UCSI
> version for your system, but before we do that, you should try to get
> Lenovo to fix their firmware.
>
> thanks,
>

