Return-Path: <linux-usb+bounces-13736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD0958736
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 14:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8906E282114
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE54918FDB9;
	Tue, 20 Aug 2024 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HStJNNPz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E094D18B47F
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157667; cv=none; b=M+IjNXY4Er069+zbr9tZjMTvrXmFstvm6aJ1QCIVV6dOkqX/7hc944Dxgli7wPd9stZrBgALG9tCprw8mtmDmnUUklo0kQL2eNnZU9zCFilzCsGxBsXgQstFdc3D1rI8AEZbixbFqgc3d/x6JYav2IKBlgxIr4opVvxsT6Z39RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157667; c=relaxed/simple;
	bh=PGSEQAyIi9jI9oBqITOqFC8xkaLtciX6Fdb8rojnYRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBJUmv1ioe8T2rhnhvPIc6hyIypSrDSqtiz56QEPwPxGpIbAE2lcmEULkK66V3/b7HaVX+AX3HwUCcvnZnus1UtSZk4948Lupx2hT0RTNgKefiL7yNE8bbfeKik4nokZs9fkX3+UNLSnx7sWSeOP0m4FTs+vQ0XxhPbMnF2Mwp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HStJNNPz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso2572789e87.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724157662; x=1724762462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th9bq7VQDRijrIGlbRpXI4kxULxr9Qo0oEmRThChA6U=;
        b=HStJNNPzuu0/AI3Ca29alwvbcRKL1K+FehVrwMhE4P5VDiEv4I3gmdd3B1x9QRaYiZ
         ZpmigPqQv9iwo1AcorgXhtId9GsqBHxqxtnthrxC1FQIytt82URK/hffaA70Cw2XkWJU
         0Pkd1ZHPXMXZJ/ichO20V17OrZcnNWOjPc/4OKffE7LJSfqW5NV3NnGYCy6DRfTeYmSu
         CanOdhaL58fM6x3+De2Ssbo0MBj74woov03m8hf2Yycb0imA/0idsWhA/jPDGxbgzF2L
         xCxAUEPzaB72gaa3MnlrwnFamN6yLiZEavHYL6YG+tlMA+95r+fjiN+rsLv1eDL984aZ
         59vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724157662; x=1724762462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=th9bq7VQDRijrIGlbRpXI4kxULxr9Qo0oEmRThChA6U=;
        b=UIw2ICpOy+LtFM5MEgyBw3zDNq6qaknkD5EfCm2aLqT19F82ucQvxdXGqHS5j6881h
         w2+/BVe3OICTY0/gzMmw16GfjwYtCzEN4bUs/P1Mo3kJu+Pj7R608YaxM9dNwwZ+Rnk2
         J1FBlxbsr2IW/3KiBz/OeX8xUBkYkpfR/9ULCwHlS6UNmkLqhVuUt8cMBydMdus8CXYw
         LyrlFGIstu3ZynZUCeMx8XvCwz/kn3917trxXPbJIUoFx78vbNauRnXhn2dKTmoe/9n5
         l8ufcc0/nnUevHdL/USnCbY1cR/UJMmGLCi2NXRPk6fpN4kTvKzIWn5EPKGURAhFFGBi
         CkaQ==
X-Gm-Message-State: AOJu0Yw8G+HdW+JYzkWWQLFCkY8jbii8FRu/QhTn2692VvZ19eeZBSpY
	768ysFVZgvrv1DSnV2DdBGZUEC8XyK1otue8QqbmW1s38SON17ionHyBtYuOaC4=
X-Google-Smtp-Source: AGHT+IFNYgoQNngidsNHNA8R7CTMeA6kfVvv/tq+qTTtkoOL0vjEXyJyslyeRT0dXztU8fTH3SUt5g==
X-Received: by 2002:a05:6512:6303:b0:533:44e7:1b2a with SMTP id 2adb3069b0e04-53344e71c63mr623283e87.40.1724157661251;
        Tue, 20 Aug 2024 05:41:01 -0700 (PDT)
Received: from ?IPV6:2a02:3033:209:8a31:69e4:f574:e675:7754? ([2a02:3033:209:8a31:69e4:f574:e675:7754])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838393598fsm758618966b.133.2024.08.20.05.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 05:41:00 -0700 (PDT)
Message-ID: <f0155b49-f940-471b-834c-62254afc52d3@suse.com>
Date: Tue, 20 Aug 2024 14:40:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cdc-acm: Add DISABLE_ECHO quirk for GE HealthCare UI
 Controller
To: Ian Ray <ian.ray@gehealthcare.com>, Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240814072905.2501-1-ian.ray@gehealthcare.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240814072905.2501-1-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.08.24 09:29, Ian Ray wrote:
> USB_DEVICE(0x1901, 0x0006) may send data before cdc_acm is ready, which
> may be misinterpreted in the default N_TTY line discipline.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
Acked-by: Oliver Neuku <oneukum@suse.com>

