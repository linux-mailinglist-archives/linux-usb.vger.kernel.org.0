Return-Path: <linux-usb+bounces-33866-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHi+C1RopWmx+wUAu9opvQ
	(envelope-from <linux-usb+bounces-33866-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 11:37:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D9B1D6A77
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 11:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1611A30D1915
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 10:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6F23A1A41;
	Mon,  2 Mar 2026 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AYosUoW4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E042D392828
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447262; cv=none; b=PVsX6EDPrYXXFCHGycw/m5L4bCMMGeX7Lk5A7InauTNj9loDXgYgqvawgZC2zNUZ+SiKRrQMgp9fC5Hxzw0fgfwpFgOE6sHrzZI604UYFEIHQysr7m/uZmG1pScFgiWFPzApP8GgtN0oyk8JDaNAAM4jGcdTbrlmc9TKoj+nUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447262; c=relaxed/simple;
	bh=GjDGPMlDcf/MXxjNRrknNuVswFh75rCI363yIZeLzcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpEkhQsuSL/ojR/ZjQ9YyaANP5OtAFoFb3E1KScB9pFS4DdnZ9LMQwFCTQMr6w/yeVEQODHpKV3E4fC5FcyLs7ofaSqb570a4TyW6P6QePUFAdEz4jKhoZo5QerlOjwLQ+iaQPN6wo/K4FPkSH0jf+pAoUa5ay9QPMudsuUYaEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AYosUoW4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4837634de51so17044965e9.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 02:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772447259; x=1773052059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mac6iCuh/FaCEK5onqKP3LNwRHPgUG6JylTUvWKnd9c=;
        b=AYosUoW4daR8bCmOB3yCVseWGZHUossoZQp7lDSe6ybSMlP334+JRt6yM0HwCP2gC8
         qMClbS0irnF79MxCqPrBp0J7c7m86QaUxG0zLZ363Wpk58+E6B3UMMf2cWC5IDZLHNz4
         M1F4GSzF2ievY5CGkVtNPEwCwLfnh0J+BnlobV4YSWVA0mwrk5Q0b4wPj32iG9qaJsCz
         JWzcfuwm3oz5+bOBI1brdrwD4lrtWK69fEMLJL+mrZYJsexBk1PTRRV/DrFBx5YEiKnB
         4Ppa7yACM9esNd3de0KOU8xcK+cy9LlIIm5ccdWS3btZvBACUVvW526p1NF0Taa9isDX
         Xu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447259; x=1773052059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mac6iCuh/FaCEK5onqKP3LNwRHPgUG6JylTUvWKnd9c=;
        b=BFDWDs0TdAXV38CdsE9LpcqmfXPgDYdUyGaCJ2nJPdqsuP1yH6LfFNPDCPJcUTI3Jh
         L6Dm8Xg4/iU8PYGbOptjfSzuqE5+2jQ0hjOQj9oCQAXSFdisx3q3ESGuEB4OqFqGXD/h
         yuSkA695gCGyZXGcmECNUBrCBfF//T6LW4HnLQAnDCF9EMf3D5RahJ/Uaf0ZEU+TkpYC
         VMv6kUwgDH1baSiP0MP2JSO2mH6qYlThzOoF/hli+HFVWc97voYx4iqd40+L+9P/R5l6
         wTNu5SWia0fyP8DLsuXgyE/mNO5uFIqfnv4NLZmum3LmQIaaRdxYpkCB2DU79gpSwat0
         eyhg==
X-Forwarded-Encrypted: i=1; AJvYcCVjYuFzBW/djuCPNsGeR9S3COEIFA+hZyhomZr6QspHqPGJQlLdCSEUiDH5R+iwfsNuxNwhHlb26aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YziB9dFsB/yMiLSBg9IJe8G5xc+usgwiuaW9+KNf7Xs1SpIChDg
	yOUdBTF07yqbWIcA62aS9/yCLrvLhaTGN5NzKc5Fx0ysHXG23Psf95wLwKj0TWo07Wc=
X-Gm-Gg: ATEYQzy8oZIYx24ofOUksfIXAgqwMB6UydQ/i89ypYZgGhbZWPdOKzsO5bfTfMdbBdK
	40tSFndl8CipQoS2Ng9oghJcM3s0hAgtSScI0pYN8+2DY4Ap869TD6gOtmU2XmuHLl6BFV0m1Bv
	JnUk6HL7Oq8vDh2w+f6ZJnus/uAyNTx1JixkybJPr6aBmsujVcA5v7sd4sWe65B/M/MJ4BIeOxY
	v1e/RMzPiertX4/R3ZoGsXOejGf+PnfnKJQ7P+lkQWPSg8e44U+N2P26crwkBkhOC1XM8RO03DR
	D9BRCwYh2WPY4/+jCyHwAiX9MyYjRcGmytlixgXcmGF7RhT455Hc52QjCH6ru65cKFwafPSsoRQ
	z4YAY/Bu3XKcgoC7XUB1GPldWJGeN5BU3sElbGlOUZnO5LicfrHPZUAV8W+xmwJ5HEr1De+N1na
	5HDSdaqNYbb8izLWUXYTZ5N99LSrzm/vCgGnkCRtWoFQ0JKv2ClKT5tO55UW7BMMry
X-Received: by 2002:a05:600c:46c4:b0:483:7ae2:1737 with SMTP id 5b1f17b1804b1-483c9c1bbe9mr210916375e9.17.1772447259308;
        Mon, 02 Mar 2026 02:27:39 -0800 (PST)
Received: from ?IPV6:2001:a61:1346:4701:62aa:40c:8866:519d? ([2001:a61:1346:4701:62aa:40c:8866:519d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbd781sm237871075e9.8.2026.03.02.02.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:27:39 -0800 (PST)
Message-ID: <46b003fb-c3b2-4ad6-a3a5-c73e2e248a26@suse.com>
Date: Mon, 2 Mar 2026 11:27:23 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdc-acm: Restore CAP_BRK functionnality to CH343
To: Marc Zyngier <maz@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260301124440.1192752-1-maz@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260301124440.1192752-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33866-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,suse.com:mid,suse.com:dkim,suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80D9B1D6A77
X-Rspamd-Action: no action



On 01.03.26 13:44, Marc Zyngier wrote:
> The CH343 USB/serial adapter is as buggy as it is popular (very).
> One of its quirks is that despite being capable of signalling a
> BREAK condition, it doesn't advertise it.
> 
> This used to work nonetheless until 66aad7d8d3ec5 ("usb: cdc-acm:
> return correct error code on unsupported break") applied some
> reasonable restrictions, preventing breaks from being emitted on
> devices that do not advertise CAP_BRK.
> 
> Add a quirk for this particular device, so that breaks can still
> be produced on some of my machines attached to my console server.
> 
> Fixes: 66aad7d8d3ec5 ("usb: cdc-acm: return correct error code on unsupported break")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> Cc: Oliver Neukum <oneukum@suse.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Oliver Neukum <oneukum@suse.com>

