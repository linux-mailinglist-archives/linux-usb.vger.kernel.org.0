Return-Path: <linux-usb+bounces-25293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD3AEDE73
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 15:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89C457A720C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 13:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C026228C877;
	Mon, 30 Jun 2025 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OPddzOeR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7CB28B7C7
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288826; cv=none; b=Qc5mmEq2Cl2NATgjX7OU8xIyQXthg7+AesQM0mEmnQDfOMGCU4wXSq8rl9nt8HpXGc5K+dpcxYxCM1NefA/j4hPUjw4Rtm+gQTyx4zZMcC2s/Xv91WkjpqjVEQHcETK2YZZnNp02+hx6ogtrJtEmmZtM/UMMxddGISyYuv6RWOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288826; c=relaxed/simple;
	bh=XzSA8lqce7ObaJi4R2x6wnKGTAh2x5xLjrtEhvRLgZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJnRP4amCRILILmsLvQtaWVDwZv38UY1AuxXSpNnTKimua+0RSSOW49rfdaTKdyT93fyK5cVjhcMXV4HhqAlSbw3BMfmoo+xfL7VrQgAbP7bNt9gSBFIyoOiG0jdwgMSsUhnCuwuGb+pmwz1C608dsbus1gRqdfNrcJUackWuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OPddzOeR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0de1c378fso304350766b.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751288822; x=1751893622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjTqc5w8WVqrn6bONYW3G2Bp0s1AYzagFEFfl1Akrl4=;
        b=OPddzOeRIk3YNhPdxHYL7w8/GQj4aeVwJUTambd8nomwNZYXveT5WhdXDixyHmv2Dw
         B4pfGinQQeclX6LQhxXG/ZSuW+JehuyvHlfKyXQChpNzPKLNn2tUZ2ZX7C2UeB4Y0g3U
         kK9hW1DSFVq/Y7kgIlJNlThQX6YhlH7WS6pKrkLrmNQGMOMLlSPQsSLJzlL1pFSNh2J2
         jqKo0BWE4qBW7v7Bl4jRUOjOTpJdZWMkVUs8u60NSmJP7yPqalddVWPnGW5X9nfkc5g7
         kanr+QlbqJj/2K9qDQSzIvVcq+3wGPyRQ3RkcZq00ycy0dqUuhPqzc+Vd7F6IMMdUmpO
         Ewbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288822; x=1751893622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjTqc5w8WVqrn6bONYW3G2Bp0s1AYzagFEFfl1Akrl4=;
        b=gN+/5WW36gWeEiSNShxGAJcK6AzldZrsT2NoF1G0SwUq0iq0cPPH2EWqLnv3XWG7zv
         AW4UYhSeKdo/oYNGLx80ofQbcNtMjPR22ZVi6LGKbooMjExqAG7hsoAcit3reFeR94wR
         pgedA6i0jqnJ6B9Ien/p8nIjHL1JgCg5EwVvvVyK8/xaMM51cV5/Uqki3kzVIMjtjJvW
         wlM+dCqcMC63BYYaEJGcarJua35a4UNgDLPddsCp9UWgDRO3JoOpYNFMtdBYW6xLVpU2
         1V6rQBPceRme5UZsgWjLAbg5BeBwafTkpmCjvncD342KwsKpbdvyL5BxW+n5Mqml8VFL
         4IqA==
X-Forwarded-Encrypted: i=1; AJvYcCU4EZCRlBLTd58vDjo1GjdhaNsknNjP2E0JKK5tQWOoWMsdKH5v4Ly459LavwTH89WvaLyeeTRsCO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyooMfWR/w4NohdZL4vuR1TM+GMBbVEWSjv7tT3qMsbPmz00Fe
	K9g2GkSCvcwT9LGjbxsLwSq1vvSJus8xJmqrgIwZtQFJ/iwCadEI+vPSEcqOg3R+blE=
X-Gm-Gg: ASbGnctQfOCiq43i697pNKRu5u36W2aJzNCqW5EP7xZQ4WQT59nOWI5Q/MJRom7Dwm1
	pVOFzTynAz6m0PpnRVVPpR9qaACkLpl3JiHGCWfjzcbP6LbXWH/Xpnr3TEp+1udMt6BRDggqKl8
	SgmYQoewSMfUf0lU642Hn0hi2KBwHq+VG+bHm35K0S8Xl2O5vfb/UmnN+pUaPobC2fWzvyGasfb
	DW4pJ7FpyAHF56zXy6venSR6plO36+EK6Qsh3lRzygRs3IZMS/UJpy/wt5oGqSQC1+KhT9nhSf6
	nYi4ZI4x+UJg/eJmT04Ju+okXAXGndFf4oyChjYqw78y9XrYDlglJIpOzeTu/NQs3pv2sRW/3sm
	t5/g4F+1WBqG9z0eIOW193FhshA==
X-Google-Smtp-Source: AGHT+IGQQy4U19NiLnmRx9yAJ+yqWDYzFld5hJO9BbU/RWXFjYdkBLOk4FCpcLsDyCYGwv+95jV0NA==
X-Received: by 2002:a17:907:3ccb:b0:ade:3413:8778 with SMTP id a640c23a62f3a-ae3500b8e0emr1306050466b.30.1751288822034;
        Mon, 30 Jun 2025 06:07:02 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b1:b001:7c81:22a6:ebbb:9d2? ([2001:a61:13b1:b001:7c81:22a6:ebbb:9d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc08sm664696266b.131.2025.06.30.06.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:07:01 -0700 (PDT)
Message-ID: <9ca2c058-d562-4c9e-8d0c-695703573ed7@suse.com>
Date: Mon, 30 Jun 2025 15:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
To: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Kannappan R <r.kannappan@intel.com>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
 <94cd36e2-db7c-4693-9f43-01c855dc6891@suse.com>
 <6dce47fd-01fb-4401-88a3-d9e85ee5529a@oss.cyber.gouv.fr>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6dce47fd-01fb-4401-88a3-d9e85ee5529a@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30.06.25 14:34, Nicolas Bouchinet wrote:
> Hi Olivier,
> 
> Thank you for your review.
> 
> Indeed our current implementation of the usb authentication is still a bit
> crude.

that is understood, but the question here is not just whether they
are crude, but whether they are sensible. You are putting the use of
the authentication code in usb_new_device(). This means that the admin
cannot change the settings of currently connected devices. It would seem
to me that the check should go into usb_claim_interface().

	Regards
		Oliver


