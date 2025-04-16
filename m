Return-Path: <linux-usb+bounces-23130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0AEA8F465
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 15:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89D631905127
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 13:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096111898FB;
	Wed, 16 Apr 2025 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C1mJ+ovf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814A149C7B
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808942; cv=none; b=WavMAsi5RUlo29MLE10JLSz0k9BEKtca654iPRJ56xoyiL2N4z2ABbTvQdjyPWEpp05WRj0+TPLWYA6jBiHHq0WbM20XwEHv77nn9S1+yex4o6ishUMzlCXmCHmcRdowrU5eikXx2t22XWKOCXwlKoekTxa/beSYPEmd0boF48s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808942; c=relaxed/simple;
	bh=p/iyWC6HvCPY2TgwnlCPzsZ6CCy+XnmL1Lk+5LmCGhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5vBu1EadjvaWXQxU9qUvYN3PJbEcvuWFDk6+U3t/bBxeQhdS3XCodkb1sAFevbm92Tb84XIXpP0BjzHqZi8X2dtc64Tme/S7wKPtn8xxf06+HNUaxIafUh25e9uap65R2IuXxOkKRhDfZnK1qlYAp6YCAzcRCPRRllj2/IT28k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C1mJ+ovf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso530761f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744808938; x=1745413738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Q94yOoOApKItt1hLRlRluZyloOVNtuhZPjQvabIyLY=;
        b=C1mJ+ovfwyUxOkxUy1ZTdUzVTdLc0RTLKxkJc8+vB2fqvW4KW1R/A6d70EaWq8dAms
         vGioGUTBt716F9p8sEqqoaGcb0DtqmksNlpiVqKZwPtjaytNly6ntmO2kBojQTn/6z4/
         xPgmTmUFp7r11MVZKuS2D5DS5PoIFQIzADzxHN1IfFT/sRqEr675OUX23QRIE4VBz1Ft
         foTbQGc1OgS3PZe3oJkEZwECeFzN719qLs2Q8UNg6/4pbQj4Z1g6osxMRBWMHxHe7MRL
         PWmDqP6/xmBGNwtvMKYDkaFp1XSvhFx3/9m6FZXYkkVRgeScd8GLSPYcuPZB7CFu6u9L
         wM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808938; x=1745413738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q94yOoOApKItt1hLRlRluZyloOVNtuhZPjQvabIyLY=;
        b=d6TXTEj275ma1zjaqa2Ce9QZr/nznoh+ZdC06Vza+W+PY/LP+TOlJsR7T3xFc9GDOb
         YqpHqa17TVjhLavTAfUxa7GeABgsU5WJQkIgf+tER+k4JZirNrc4pD0jhDPbS7U2a7Tg
         DzQ3DBJdwm9ftpezMLCmn1vrl0ainMmbwsGxJqCk4VelPJlhFT2zF0IVplf33kd1wExD
         MEozuQDJN2deYxZ+0jXqyJuaIasq37AwMOcLdwYqu/aV5rdb1geeVcLAiFsTqpq6y49a
         weBsFpYi/wlPhSq9UPxElB4Foqqnmmn87f75dSOM6nI4cvmW6nBcnX3IsLBNep57W5CR
         UWGw==
X-Forwarded-Encrypted: i=1; AJvYcCV/WqjDm21cMZqhLyzOiG+R7MdamvUAm6xZjJtBlsu38MkZtGyZvXp/ZDDqazDKRLNSumtNEJxuA2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpjzNELJSNKol2EXezMHI4ysOGYh0jLvmT/d9659CXSWsnaVph
	LdbVKLjy0GbZaeE8VrNV2AJwlsDmVqzyvQX/vVVFyW73n5KWnGfJW62dHSkeEsU=
X-Gm-Gg: ASbGncsArRPYIyYDuYjTkKptV80XS2Dkgm4yITnyTP2s2qZfjYatNJM1GJOezLZU78t
	QYnonAk/NlWWufLsAZH+4RePT0atIagoNexX9F/TdoWuIyjtj4OHGxEEedH+u/grn3TS5cWn6zB
	VdzLtxa6Z+i5/GNhQZ1K3q8SDqD8GaRqBAYlIxleqvKdma6IjwEJs5lqTY7POo4lUPVo9/PTW8q
	4qvsQF/CYa8CSUVqYeAgmuHg8VT1drHPd626DUfCOxajZl0u0X4QvNdUH/dZkb5+U5Cl/sozytl
	f9Olz3Xx2+ovVDu6WX9jY0gQ4RjYtai8dB6dkHJEjxi81MlBstWxxECe7FLV0sYhZuBlKQOrkSx
	UdRs6SmY=
X-Google-Smtp-Source: AGHT+IHOsJk1QtB5kEoSZrYAYpRPaEigS+0jlbTDIIkpc2LnRk68oJlodSN8FXDP3R34O6sthrpyNg==
X-Received: by 2002:a05:6000:4021:b0:39c:223f:2770 with SMTP id ffacd0b85a97d-39ee5b18646mr1809040f8f.15.1744808937399;
        Wed, 16 Apr 2025 06:08:57 -0700 (PDT)
Received: from ?IPV6:2001:a61:1350:fd01:ac0d:cf4f:2906:b446? ([2001:a61:1350:fd01:ac0d:cf4f:2906:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cd17sm17165723f8f.78.2025.04.16.06.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:08:56 -0700 (PDT)
Message-ID: <65bd42ee-ecbc-4a23-9036-42358aa086df@suse.com>
Date: Wed, 16 Apr 2025 15:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
To: Petr Tesarik <ptesarik@suse.com>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
 <2025041110-starch-abroad-5311@gregkh> <20250414090216.596ebd11@mordecai>
 <522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
 <20250416094807.2545efd8@mordecai>
 <e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
 <20250416124736.3ac2bd55@mordecai>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250416124736.3ac2bd55@mordecai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 12:47, Petr Tesarik wrote:
  
> If I stay with the USB buffer allocations, AFAICS the mem_flags
> parameter should be used only for non-zone flags. If you specify,
> GFP_DMA here, it will have no impact whatsoever on allocating DMA
> buffers. It may unnecessarily allocate from the DMA zone for doing PIO.

Yes. But we should not limit enforcement of such a _new_ policy
to one method in order to fix a hypothetical issue.
There is just no need for action.

> Now I think I should really write an article for LWN to debunk some
> myths about GFP_DMA.

Well, if you go to that trouble an explanation of why memflags
are passed in USB at all and how DMA works in general would be
productive.

	Regards
		Oliver


