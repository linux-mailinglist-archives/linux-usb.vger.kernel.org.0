Return-Path: <linux-usb+bounces-38157-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA55LN5rGWrGwQgAu9opvQ
	(envelope-from <linux-usb+bounces-38157-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 12:35:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2522F600E79
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 12:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D8B330AB1E9
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 10:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438FA3C942B;
	Fri, 29 May 2026 10:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g41+KBg0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607433FE36
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050671; cv=none; b=o1/8pINITKnZEmC/nK1cWxaLtbbRyrWfP/56pIy3/1/beLcm3q5sl4AN8Id6oTjUrb0GNrSEZiE/5nkQ/QIu0Eyxnu3JKN7bSY2jAx3lBB1Gbo8klaYBeriHxjDSNyy0n6Nia9vHReqI9qG+zhQr4X41xFUfMOOWbjGa+VJVl4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050671; c=relaxed/simple;
	bh=TnQ9Pz7fsUBXLgOheDV2t6F0iPGT1NGiYVSE4Vaf550=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kr4Wj0nG5CMPyLkBpNcmAgb1swc8K6ZgNEILpOY1tbOEWPhcAISWidzmkzcfHonrKGOgKkx5SNfdiV0nYTx3eqRhR8CMkXLLdqQZX15/uMpnfMGhMsxENuti2Ffc5aCDfYkdsWA8jDk1z8OD1F1NEw03vNeyyozXV+VUsr4fYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g41+KBg0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so59309785e9.0
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780050669; x=1780655469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnWegkTJYjsTiRlpCjBocEuV+DyykuuRTv5OiUPKgrc=;
        b=g41+KBg0McHkaVSlua/ACtPi0rdk+DcJM9lpfLqgZbBkY57djQ2Cic04p+d2PMYGVv
         T0z8H6L0yOUX9v53bus3/O7LSwXxz12SHIe9Ogq8rOkx4fpdWE37q9Kc3RAbUfCxchEH
         DmY9p7GokJIrtIwLXc6OMApvo2lSXtlsS6auG1LLTxg142+P0uFSl7aaMDRnZGUvDg96
         Z9i2xMS3evossShX7ImceOUYlFSpBpB5SkWxpSIIRPVZX8tMSjjjs2M5yNY3rNTtbnkz
         rxCHWy21Ej6tzYA+Rr7AZnqUI+xBfR6F8+jvumzIyv4aXHspd8z8FkhZVtnGi+CIp0Ho
         XQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050669; x=1780655469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnWegkTJYjsTiRlpCjBocEuV+DyykuuRTv5OiUPKgrc=;
        b=MfOVOoPD20GX2082IhwhHb1KoGAaQ/6hHhxG/7rTVIOv5voatZHz4jcAusDST9x0Lf
         MaCQY8ummFVwwIeeoKfHL/W2rJRsprx7hl0tP9FuTiE8vGAiUNAErliGwHJ8nydDKxBI
         8XMcasp/SV2m4oJwzr34uxCsgqpWXCWquEqAjm1O8fC53h4HqSU9lG5p3a4eNK29Zvaw
         WqLl5HBd1m4lgom/pupNFw73ZMEmY0N4UZVJBlAt8p7BVzXVzSsQqD2c/on/0Pbf9A6+
         xDjgvpr8csD9eBF88UijIjIBiS2uDrsYnQjXzZwkOMk92CFFDU3aESFVmJVgr3F91fgK
         3mOg==
X-Forwarded-Encrypted: i=1; AFNElJ92BbrSy2mgka3QZ8Agn5R7S6JrDm23J/UT86LRvEPk/+RkfopshgZ0bNBarjHjqUeI/u5wx1+zm4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcS+wFcYkvLywxr4oJoP8hFd7X13/7sR1QC/DKKZpvJ+cG7R7F
	768JCuSOKziQ9AThc8lZzJHCV8eP7oyxNkvPPljmJyYmPEEz9Ivn+5flhL6aVvHAW5VAKQD77hX
	Dtozt
X-Gm-Gg: Acq92OEDSulNT0lPh0ZGQp548AKfTzZ0Gy2zsXssXqicXY4ipKgebUjwO4X8sBqD04j
	Mbg5tvEoVLcYDFp8vkYCzgJ7s1gtdqBs8HXpqCoqUod5WaNIlecR3erXbG7yeZoICCgsdWyirEW
	Csmpis0KCIRe0rFe8keO2ZBpNZgWxh4/noW1BrfY18c3vEAwUPI7FGMUQzNRvB8BOVicdW5SQtl
	JuPa8b3aqF/kzlVu4D7tsSjdn5UX0FmUJkEEOr9BQFxnTF2q5WteANVBhKo3Pd6MFY0MmaB2h/n
	pbhdXjO5qCcen7W9cVdHrsaRSLZXApx26c9PxKyBwkE5N5FZi89oAnTynsAYUlXKI5eeZBR/88W
	+krxi3IMYd26S9GVS3bq5B5ppu6esbK3ZEiG+9vOH7kdB7W9VoOsRJoY85DyArFxgo4hOUy/Xw6
	Rz6LKNuFOuIJG4bGVAu5qhjxuuTR65o0sFE5cJtoEikE6uNPxoFiUJxvC9j07fFwOCWREMAJCeN
	Ck=
X-Received: by 2002:a05:600c:250:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-4909c0813a2mr26657805e9.8.1780050668957;
        Fri, 29 May 2026 03:31:08 -0700 (PDT)
Received: from ?IPV6:2001:a61:13e8:2801:7422:57b5:ac0:e7e6? ([2001:a61:13e8:2801:7422:57b5:ac0:e7e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm2827353f8f.9.2026.05.29.03.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:31:08 -0700 (PDT)
Message-ID: <7f78b968-3cb3-4194-b709-28e45946697c@suse.com>
Date: Fri, 29 May 2026 12:31:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev()
 and usb_set_intfdata()
To: Ginger <ginger.jzllee@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260528082751.204898-1-ginger.jzllee@gmail.com>
 <5099d6cc-c8bc-4fdc-97cf-31e96a57e0c1@suse.com>
 <CAGp+u1ZoHA52vPL5msC29BM5g3xT9c8-A20tAs2LHStnuwMmbQ@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAGp+u1ZoHA52vPL5msC29BM5g3xT9c8-A20tAs2LHStnuwMmbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38157-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2522F600E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29.05.26 08:58, Ginger wrote:

> I think the intuition is that the global exposure (i.e., the
> 'usb_minors') of usb fops should be disabled first, so that the
> subsequent nullification of internal fields can be considered local to
> prevent concurrent accesses.

Hi,

if I understand the logic correctly, the order in yurex_disconnect()
makes sure if yurex_open() and yurex_disconnect() race, yurex_open()
will never see an unregistered device with intfdata != NULL.
That is, precisely because without a lock the race is unavoidable
the newly opening task will be guaranteed to know that it has
lost the race.

	Regards
		Oliver


