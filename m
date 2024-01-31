Return-Path: <linux-usb+bounces-5679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212CA843717
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 08:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEFDE286436
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 07:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B5E3E495;
	Wed, 31 Jan 2024 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hubKmiNK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1920D3DB8C
	for <linux-usb@vger.kernel.org>; Wed, 31 Jan 2024 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684849; cv=none; b=szA5LPbetpgQqDsUHdQneZbJ/BwtnGqvPjSVyFH86UEsbUHvT2Ia6TQ4MDyk1U5AWXkzFVH4ucWv4L4LZEAb3owPfCCrWApCQ4+TKokEULeGF+xWhEsvJ/YZcWfvi0rbvNHWv+jMA67L9bA525UkOJwEFotlDpDFfdD7tvqNmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684849; c=relaxed/simple;
	bh=COPwM1gQvAQC/EqZLQQSC7ZOQZ34DP/cf6Ehv6XASJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN7tORqAvynV8SlmaZt4DVlq9f/v6Thr94GvhL3zR5GWfY0dD0xTpGbvqOY7A/mhsNUNhHQnwYVF/MbZ29Qqu+4K0qTxCTo6p/9iKtuPWtlwpD2+pajDdzhUU4DeyUz/NS1uepk+39AlRnWdLOavMYeGatHOf1gECHlqAsnmS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hubKmiNK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so49883775e9.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 23:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684846; x=1707289646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwcBcIjXPlXiPn+FGjPZ+SnH2CPZlfRVs0XFlKd+ETk=;
        b=hubKmiNK96YzrX6lqmy8VFkMt/h7KUqbv36eMgNfU2P4QpBshlIJlQEuvrgSHWvpfl
         m/9u4g4kfAnsC0fJP5fd1BYHaVMCWhOGfyqdWCwWsOQ4raTtkteQQWSQkqVeu1YKoADg
         yAPP0tdwgrxLb0viT2ctJvW+sOPwW8xvoMXhfo/vkUwRBAamiHLIusVFLEerJ7mRpP9j
         2FPmEZ0GHvNgRyqwCKKuAqU8LlyM2JwX2uPEn3NJL2Ufoq1dYw9CUSAf/oA25c+Dj+M4
         FIU5KytKLh8kkFRO8/U8GzBTEpMgVRury2n1sowOnBFyXuw/u0KeuVO+Q0S4bFQGZzIO
         OlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684846; x=1707289646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwcBcIjXPlXiPn+FGjPZ+SnH2CPZlfRVs0XFlKd+ETk=;
        b=AKaluVZJz0GJUrENgMoybCtEd7Ol2jemlGyb0lqUZzia4HbmUcq7eZLGOcEzRcJZ4j
         2vF3zl9LDv2zKP5QUltFY0Z07wA2TmDY3sP1biYghgAeiylVxocKPRSepZrKhuxDD+cM
         BiWqgbL0XaNPmHPqMQMV04VHX2W72clzcz3+pvs96cfLoyrrG2m5ATCowZnMOg8RfyWG
         B2kwJioVKbVjHwFBCzQ3JPj/nqRZ6PAbzar2PUSy5t4K+YbAt/2a2LiCtirLJieaZeNH
         FGD3Co0iocXE5nIlC3bpuxQg0W9+UvSVV9Z4+g5Yl7zILtNdGZ8hRfVP/MlsG0BqFWVE
         uAAw==
X-Gm-Message-State: AOJu0Yz1n7r/eDFRVJA1gP8VintQUEvKkseSZseOeJSsreiAmGcgGn7N
	Nj0MEqduaRN5G0Pkm+xpbLkREFtD/s9tfbFsCsJUqOaFDhdi71SqtqSbt4iiymg=
X-Google-Smtp-Source: AGHT+IFks4uEzZbeLkyEPNVLhofmqk5xEso7DsWcDjmfP/+G42At/4okQxOWlX1iFvNogi2nqi0VDA==
X-Received: by 2002:a05:6000:1815:b0:337:c5f2:e843 with SMTP id m21-20020a056000181500b00337c5f2e843mr478037wrh.57.1706684846263;
        Tue, 30 Jan 2024 23:07:26 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe790000000b0033afed6e9desm1823159wrm.98.2024.01.30.23.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:07:25 -0800 (PST)
Date: Wed, 31 Jan 2024 10:07:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: lk@c--e.de
Cc: linux-usb@vger.kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [bug report] usb: ucsi_acpi: Quirk to ack a connector change ack
 cmd
Message-ID: <5123c5d0-fb40-4bb0-bdad-27354624f4e4@moroto.mountain>
References: <dbaf3630-6284-4ef6-b471-43c3885e16b0@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbaf3630-6284-4ef6-b471-43c3885e16b0@moroto.mountain>

On Wed, Jan 31, 2024 at 09:59:43AM +0300, Dan Carpenter wrote:
>     169                 dev_err(ua->dev, "Firmware bug: Additional ACK required after ACKing a connector change.\n");
>     170                 dev_err(ua->dev, "Firmware bug: Enabling workaround\n");
>     171         }
>     172 
>     173         if (!ua->dell_quirk_active)
> --> 174                 return ret;
> 
> So this is basically an else statement and ret is zero.  Smatch thinks
> it should be an error code but I think it's intentional.  Why reverse
> the if statement, return a literal, and pull the code in a tab.

I left out the not and the question mark... Why NOT reverse the if
statement?

regards,
dan carpenter


