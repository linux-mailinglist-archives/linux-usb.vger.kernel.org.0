Return-Path: <linux-usb+bounces-9278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE28A1A67
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 18:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534C91F27F6D
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 16:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD10481CD;
	Thu, 11 Apr 2024 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MynCAshF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B3047F60
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712850017; cv=none; b=nXr7Rv8aWWbjwb/fPAGbihd+p62pVuZE+v3pDYih4LAGNBNEO58MYq3D8A2AVoxst8cP0aBFzdo1gxWvHwQrI2hynohuZ2OSpkGZ0MWMnoxX5VgKdwhasDrfDnjTAjQEAAWANsjbGJn6pW05lBuZKiK/m7Ao/CvmYutTTAXDnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712850017; c=relaxed/simple;
	bh=INK0I2VgPHeoEjFFDqD4XL2fVdTPxVMXuHs9KgH60kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/G+8X1/AUBkybI7vf8SWtUxcE6QfcTPQgQI6U9vwfVdIXAC6aEScmTb9PKrFdXth+9NtT2wS0HhEJbBGe2clhAF4DOI8vPwJpU1SJnTIi0IlLNNqAEjerRw//1fmCZEq6DrmQnsLbuyHUKMPgKcjStWETQ5Sfyt1r8P5PdL26o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MynCAshF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-417d0194703so166075e9.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 08:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712850013; x=1713454813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvhIQSr6A6FqEDfrLHrzJYQMf0rTMc825zvGxqB0hho=;
        b=MynCAshFoRMz1RStctmBMqoLnB9N+KLU4fU7snsRY+mFIG926LhyD+m+cyAaCi4Plw
         Lyi+o7j96hNuv16hPu1zsW//+WtMaJZ1R25dfzlHpF7RgakzlpgQcHe4qem3bg86zMNb
         EJi+ojI6LBJVn1odw5hGVm91SrFEreQ6TPvoCcV2XI7mBxH8ee/UPvUSev7Lmorr1uKJ
         jtQENWsTIk0I+DkwoODFlynYtEVhqeTC1+s8ewib3dIPHppNn7/XfNKjXflarTE7vjEU
         kBmf9HvRlxASl8rhjTfLuviyreigOSpiBt1rfBxTBRsaC1S9weF8N99JSenFLcoHs4pb
         qezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712850013; x=1713454813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvhIQSr6A6FqEDfrLHrzJYQMf0rTMc825zvGxqB0hho=;
        b=Va0PexjKY4pw5FlX0SsV/on1Y2SNnTjo5Vpikr/cSRNova1etwwHelKbGc5j42CLop
         ZqKqabFvx1ZQIT8645nschYlgMsamehKgDqB+bWRNox0VP9yX+rnmGjXnbbWLI2IIlOU
         YcC0E8XIdefzVFtF9GS4A/FE0hipBBtEjgcOOvQZVRH1TUdY11ouAISEAzzQQC2YhG85
         Tm/g+ufkdXpdVogCO8PRQEt9LUeqXrlh9YKz2hGaEYbhrXlZcBXNxvIY67euEudBnlNe
         /V+X3bB/4ua3wtX4wZjNcaY4crcaS4fR/cnRU7nJ8k2Bd/4lZErgufgGTlh9bcm1Yrlu
         jd7w==
X-Gm-Message-State: AOJu0YyZrjGYijYKIiTwzLGnVOcOtZ6V20UlZtuD7h7nHZwW7meGp3N3
	tYFaCwh4kwTXLfAzCpFxMAxCtIg4cxrCI3yDjE/SpP+/RZ4c97wYwHrun1d+yb8=
X-Google-Smtp-Source: AGHT+IFf6u9XeEP2YIZFiNXbD7CofMSBEwJEnjfHLLIAMwXeckyZSbmmvM66WpjilcP4hj8b/5aofg==
X-Received: by 2002:a05:600c:5025:b0:416:389d:3844 with SMTP id n37-20020a05600c502500b00416389d3844mr132931wmr.11.1712850012820;
        Thu, 11 Apr 2024 08:40:12 -0700 (PDT)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id u14-20020a05600c19ce00b004162bac1393sm2656197wmq.43.2024.04.11.08.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 08:40:12 -0700 (PDT)
Message-ID: <f67e75bf-b367-4c00-bdd0-d0b8dff30245@suse.com>
Date: Thu, 11 Apr 2024 17:40:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/6] usb: usb_parse_endpoint ignore reserved bits
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
References: <20240411124722.17343-1-oneukum@suse.com>
 <20240411124722.17343-2-oneukum@suse.com>
 <3257a17c-cb38-4cc1-94ca-3e6dc4bb5d88@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <3257a17c-cb38-4cc1-94ca-3e6dc4bb5d88@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11.04.24 17:35, Alan Stern wrote:
> On Thu, Apr 11, 2024 at 02:42:59PM +0200, Oliver Neukum wrote:
>> We have to ignore the higher bits in bEndpointAddress
> 
> Mention that these bits are reserved.  That's why we ought to ignore
> them.

OK

> Also, this is not really an example of hardening; it's more like
> future-proofing the code.  The existing code will work fine with a
> malicious device; your real concern is about possible changes to the
> spec in the future.

It seemed to me like a vector for a DoS, but in hindsight, yes I'll
take it out of the series.

	Regards
		Oliver


