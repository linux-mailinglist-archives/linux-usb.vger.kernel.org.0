Return-Path: <linux-usb+bounces-28951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB600BBFE27
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 03:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DE63AFF59
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 01:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DFD1DF74F;
	Tue,  7 Oct 2025 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdlW7SjD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1BF19755B
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759798989; cv=none; b=FLr6qXA5kPp4zkKMvTyREYo+skzURBC/qZMLdPQFsFNv2w8ZHbEPJtmxv5j/M9KjHQLNVIRsbQ3Scwk2e6SLF9EDTTbjN2WcaJNQ/ruexxJ2jAit/2gqhcpXHAwXiGx8aJA7/jzb4zZI//JsJdJ+jBwSDBzzzRAngO9qRouSJ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759798989; c=relaxed/simple;
	bh=UzFkx3V2abUc/caTx+es4GrOpbz+tlZiDJJUXkho6gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjuGLMf+j9rCCaLMHKbZ8pT55hyh4xEDvsBZxRuonOUQ3u8eYpkSaIOxp4qQaoZqczcnjKlnmymZSjPwkYHG+SkXEvPP7JNVgOnxmvR4JZt27D+NzSHGOZwTa86Hn+0iQwxLazlR2fNTq1C0/dMR41SCSJMvOLVPX9xbvv+HMus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdlW7SjD; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8e286a1afc6so3440720241.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759798987; x=1760403787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SBkp7v3+iaIFjg2UJKNokAvDTy3nHBsuuGSn7XWGZE=;
        b=CdlW7SjDHjoBM2V1yMrNF2PRNUFEX6oPGJcEZyiPvnAhcl1/DrPkn4uICGodLURs+w
         bEhe0VLKgCbRmzRR9BRszv1GFeB0BFwyfpDn2b9brarePKmjQ3xKNmIBlaiW6oyWxOmN
         c4kc3mOZfRf2+/ZF8vwPSfZn3r0a1kgtjQEEbUPmjVMTzd3pCU/GyujKY1PjnU/hO7Gv
         4/0+xNOTM6ZtkN9/qGHWirUaaVxH4KkWrUNOTkMrO4ohfbiZIwjEUs8BBDisUp4WyHjG
         yvbuwMO9YMUQT0rVVFA5qpnW42aeiAu+XS1Nu+Vqag3v3fHT5x6XqHpDYc59oII5LRtf
         tRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759798987; x=1760403787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SBkp7v3+iaIFjg2UJKNokAvDTy3nHBsuuGSn7XWGZE=;
        b=wObsVjOrzPKskNUQSs6QH5N7vOUqGYWZlUMQ9xbTMDuLLgFz/d/ZGPldQ/taQVDfnF
         2zCocUuirFctbyFcrQ1dsswxglEOJqpKn9vSMEWTVwBsw4vP8LE5U2Tet8W2CWv4ukIZ
         vn/mY+IvirVbKsp5ufkUo6JqI//nOVvkBaw8fQeuKEGW4RDaSJ6+w8z2M5cze+Ngalor
         iO39s0Oev9OmYXOAGg8Drs/temDfOhzVCzdKiomS9TqDdUJGLcApiDsrjeDgVzsE6Cnq
         PQDLc3oWUflKroO/Q/Tua6n5Q4DaMoe/vLWIoUg1JGFLZQiJKbhqS0G4JSuuet8g1lPh
         HNog==
X-Forwarded-Encrypted: i=1; AJvYcCXhWDLJF0qJa3Sjea9DQYVEJF2Vy4qkHc2hm9noQ3SjCM+2Jwb1c3NeiRYLPG0Ib5FywMEREw5XqRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXR6ge65nQk6vrPVBA2D/RCwrG49IKriQkWh9Py1tcVoY6W18
	qOxvWplQ/kyTG8nxkKSCncM1CGkptvKKkuPpaMo8v6YDKFmYZ9Dt8TUo
X-Gm-Gg: ASbGncvh1xf/BfyYlCO8OFToxns5qrbkbLwLAfwfT4oJ2AAyITk7LE5hcR2wuuFBCuS
	dtLLIunEI8+CXkkBibvXUz6SSuPTM9ePCfWt/LwssyiZ/a4Y3JBh+jt89YI8OQQbH1oxc9vbu9q
	zud6BCCZZfQR63YKZrE1c2N3xtz8cUC0PVoH068oppd2nL4k6a64ohDJVTMbaDveP7HUMIkiU8S
	wspK/rD8vtGjOZfcZ6zimcpNE7XLb3+yynB/LGLRfiVtUcWCCyrPNLDuqWjOdHO6H/fSIeJ/Jz5
	yXvcTeXxpUIWJ/RHJahNvSb1XTkNtQ23+8gAwvgp06xya542m133sii56VAxJHtiXSTFYfmdxgC
	ynihR5vlxYV4TXmq2rruiR3SbSqZFH85eRK+RyTdP7aAPQ6y9IJExMPjkWsX8r5cxsJWOgY5wwA
	==
X-Google-Smtp-Source: AGHT+IFKzaGjI5KF3o8XjbsbEV/y+PYj4yekSF7is/jJyVeOW5Z3tWkcMSrolqH6JqxaNt8Zy5fevw==
X-Received: by 2002:a05:6102:160a:b0:5a4:60ff:80c3 with SMTP id ada2fe7eead31-5d5d4d401aemr672803137.14.1759798986666;
        Mon, 06 Oct 2025 18:03:06 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d383430asm419000137.2.2025.10.06.18.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:03:06 -0700 (PDT)
Message-ID: <03a4cb5e-85da-44f3-8fcc-67e23920cd5a@gmail.com>
Date: Mon, 6 Oct 2025 21:03:03 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: serial: fix: space prohibited before comma separator
To: vivek yadav <vivekyadav1207731111@gmail.com>,
 Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20251004065618.70151-1-vivekyadav1207731111@gmail.com>
 <aOOyNpNL3YCrLIgq@hovoldconsulting.com>
 <CABPSWR4W5Eyz8=NPvysT7XhFY=bjCO_WqqOOMWeZGen9e2fhqQ@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CABPSWR4W5Eyz8=NPvysT7XhFY=bjCO_WqqOOMWeZGen9e2fhqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/6/25 13:54, vivek yadav wrote:
> Hi Johan,
> Thanks for giving time for the review of my patch.
> I understand your point and will avoid such kind of practice.
> 
> 
> ~~Vivek
> 
> On Mon, Oct 6, 2025 at 5:42 PM Johan Hovold <johan@kernel.org> wrote:
>>
>> On Sat, Oct 04, 2025 at 12:26:18PM +0530, vivekyadav1207731111@gmail.com wrote:
>>> From: Vivek Yadav <vivekyadav1207731111@gmail.com>
>>>
>>> Run `checkpatch.pl` script on path `drivers/usb/serial/*`.
>>
>> Yeah, don't do that, that is, don't run checkpatch on code that's
>> already in the tree. Use it on your on patches before submitting them to
>> catch potential issues, but always use your own judgement when
>> considering its output.
>>
>> If you just want to practise sending patches, changes like these are
>> accepted for drivers/staging for that purpose.
>>
>> Johan


Please don't top-post. please look at the following wikipedia page to
see what top-post means:

https://en.wikipedia.org/wiki/Posting_style#Interleaved_style

