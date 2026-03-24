Return-Path: <linux-usb+bounces-35365-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAPsFaElwmlOZwQAu9opvQ
	(envelope-from <linux-usb+bounces-35365-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 06:48:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B523026C6
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 06:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62A2A3040A9A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 05:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E2335B64D;
	Tue, 24 Mar 2026 05:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iconn-networks.com header.i=@iconn-networks.com header.b="MXmoFw5t"
X-Original-To: linux-usb@vger.kernel.org
Received: from zebra.wilibox.com (zebra.wilibox.com [62.77.155.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD233EAEC;
	Tue, 24 Mar 2026 05:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.77.155.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331009; cv=none; b=V4zLO0wNM+stIR8jhHYuVTdLui99fo0DlHdEo3avJPiJ/txr4Z5RHbw+x+Uoz/QQ7eikS3JewQnVR78VXrSuidJ7UsTAIOUdMWCyryyjsgCiHlo7otUm8f4KsmhC5WRj13ThGoNdIjEFq9bOX3ZyWzrUY3QPD3xVvSPE8tbnQrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331009; c=relaxed/simple;
	bh=rdP7MhIXpjDQwQ3bx/efJFcF5y724frMTJDRDPeohsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=np+BELqOFt5Rv2l6cyKy7DZiaHqUYpQGIDnbPiCgmRwpnwZIJJLpg4lLqJyB1z/76T0SWzG0riVnoiOmL1kcJX8zq6qyirqRADrqNjAYDGY6xYPBoiTlodIDULLL0G8VE6GFle8iMACtMemUp5LxDSdyeWoOS/BuaBmb9WIGWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iconn-networks.com; spf=pass smtp.mailfrom=iconn-networks.com; dkim=pass (2048-bit key) header.d=iconn-networks.com header.i=@iconn-networks.com header.b=MXmoFw5t; arc=none smtp.client-ip=62.77.155.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iconn-networks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iconn-networks.com
Received: from [192.168.27.140] (unknown [81.7.79.211])
	(Authenticated sender: ernestas.k@iconn-networks.com)
	by zebra.wilibox.com (Postfix) with ESMTPSA id BE47F171B5F;
	Tue, 24 Mar 2026 07:43:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iconn-networks.com;
	s=default; t=1774331005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EDyRIU0WQpx1BH66g+4eplgbvq/CjRifTteZN3Aw5dM=;
	b=MXmoFw5tzQLo4OHzQchwSTFOXSh1C/jr/y8PurTpumMMZPeZS4QUf8G3uSH4PwYZdrslBn
	RdTei9PZtOlNHjFsYuu8Y9CR+xKasWv1W7Ezn6vCFITeq/gmfBEUkwlr6yVb9a+XZEhDFA
	HHswyK+RCixmgwniXDQzbRb1pDmmw4T5syvMpMUl7LqGLvY2GDVyngF0ColGYBHXgcqibT
	EXwoqV+1Wc9D6IYGEoaPVMt6mbEW8g5tjc0PnUnWzK7Zjv6sy9jcfcGfERLnl5eKbu/+6Y
	jo/93vIqqjawtaDs5kOiO0FvbJMH4cN8JHgzZu4TIanhC71gpxK0MCChM0i6hQ==
Authentication-Results: zebra.wilibox.com;
	auth=pass smtp.auth=ernestas.k@iconn-networks.com smtp.mailfrom=ernestas.k@iconn-networks.com
Message-ID: <71c1520a-31cd-45b1-844f-ca1e8a497c2c@iconn-networks.com>
Date: Tue, 24 Mar 2026 07:43:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] USB: serial: option: Add MeiG Smart SRT853
Content-Language: en-US
To: Lars Melin <larsm17@gmail.com>, johan@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323143753.686561-1-ernestas.k@iconn-networks.com>
 <f547c497-8da1-4993-8d52-579f42810aba@gmail.com>
From: Ernestas Kulik <ernestas.k@iconn-networks.com>
In-Reply-To: <f547c497-8da1-4993-8d52-579f42810aba@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[iconn-networks.com,quarantine];
	R_DKIM_ALLOW(-0.20)[iconn-networks.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-35365-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ernestas.k@iconn-networks.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[iconn-networks.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iconn-networks.com:dkim,iconn-networks.com:mid]
X-Rspamd-Queue-Id: B0B523026C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-24 04:38, Lars Melin wrote:
> Hi Ernestas,
> the SRT835 is the name of a CPE that is available in more than one 
> configuration depending on the installed 5G card.
> You can not use the CPE name when adding linux driver support, please
> find out the type of Meig 5G card (SRMxxx) it is you want to add 
> support for.
> You may have to open up the SRT835 in order to find the name of the 
> installed 5G card/5G module.

Hi, Lars,

My bad, will open the bad boy up, thanks for the comment. :)

