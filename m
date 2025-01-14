Return-Path: <linux-usb+bounces-19322-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90AA10312
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 10:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90AB67A31E4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 09:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DB81BDAB5;
	Tue, 14 Jan 2025 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLfoSvxj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6222DC29
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736847282; cv=none; b=h0ptSKyHSpNSW0Lmlpk0QL7dOk1UZaJP2KFRFhNi3pLnjuWLUvezFS0bwmNE5fuWf0e9qWs/N+vndDVVKqUe8oSv/oZenLL9Cw1Z5fSCVHoHkyPxlB3bDprnQqdsXFzb2LnTFM7ENg6dOgPIRAvh2uKgaR/9ql0xNz0SoYswI1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736847282; c=relaxed/simple;
	bh=eoqwR8OMWUTl5ahrL16iaLPnirdKn8PpwRqX+Rn8VXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHtFoNk/tzMKsLn65SZshYSy2Cez35ulpdAl6XCqtfYtGqowAJX1VdkX5xhtF5w+u//C/a9O9C5GrBVK+97rAy2dugV12zmLaFqg1t1TYNvosmC5dTBqfWMIoUHX0BpoYAAhplRELRZOdkrs+2y+LzISMTQIEL4/0/0tixmMvYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLfoSvxj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d9b6b034easo5528260a12.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 01:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736847279; x=1737452079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+//wOPVJb/kdHwJq9xTMOk2satmwWZFioSxOEAkOw8=;
        b=GLfoSvxje3C6oBsSZzHTAFn6Bo9wSAvJaE0mlPuMXFjSgBZJ7nLoWg6o4HUefBngFA
         A0yC24LC8BTGnfqU/5XjATY+9L9FGCFK/Celxhn5HXs5Re75kScEfaInyGMMHWTYn66w
         Nzd2TqNKRiBGWF1rd+EH5ojPpwJINvHCZu9NGdaKMjxa00/C2ovv26J+UTyEgpNf94AP
         ci0rYa0bkGGstgtLJfsR8BhuZQaNUTFsdRIKARjGxxV2bkZSYbDbTlVDQ0myw66jzw5z
         19lTE3sGp/PTH+jO63L1nc5RvETAAwFBdlcxCk3wQFSidJM2vPI+KSFDXd67C6BKCpnI
         SmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736847279; x=1737452079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+//wOPVJb/kdHwJq9xTMOk2satmwWZFioSxOEAkOw8=;
        b=aGV/V+8ab1IgNnidPcD9Ebbt6NVfSlOLhOgJdeP9IsnG/S4IsqRPZzAuSeJAGgrMcK
         4R4jgEg5AvGBIHhvZZ1eBFBF/+o5HDgtIwY7NzSigONh8MThZcWcQPl7UwJ9AFVTV5J7
         mo1gJ/kmhMrBjcFkvLu60RBFiXWTrODXi/cJB8lXM72QDZQGnoPP8e1FXosleZGyxYgs
         LaYsh1TLxCyF3+P5ZNtIaJ3GTyn2GgeQVeqilCUT+YFEoj67nRB+k6snMYlCJ8lDSRJO
         KIojiMFjqgtFZnhWWsXzE3fZO1ROYlwWYnw4vntu13JBjdUsTQ1jGy4ssRL4w3VIt6Wx
         QA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwP/Hd9YSwoAugkYILwqt2AajETMmb4lDUHOqEWyQaw2AxgYy4+KSqbCFnTOZqziQTMOVZZ91QvWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIwYU2F7tvDoWwoYjGsoHz4Wa4YDtoLZTR/3IPYclfe2h8OTdw
	OZ68RRLivlqjAX4jRn6gRTfAhVw7CnFtGSMj2aqh1iLoR68gsdgqd64chWuP
X-Gm-Gg: ASbGnctoopAAEVVbU9h6fniAiDHudxB90OtnXH97b/t22PTyna20sPGKosL/d9u6p61
	SEvU/z/4r8bACJDvg5w1LTv62fpVwLxLpshTPi+0x00RwJ0GTwsA8tuWzXU6tI5Bwir2BAlfSub
	GApAaDbKLl5TtkOG3hRBNsrprR6fKc05wz1SyBiholHECbbJt0ass9BClhr1dU7OFMFAnuuTjbb
	JKPLOUFSLQlpGDN6rxEfninm5vHs6/wESaXue2Z4Ti+56tKJCV7Ij3Cs/QrFyqzU6Okltk=
X-Google-Smtp-Source: AGHT+IHKA3FOSWfyVybQMGRC1QUb7Ua+6zkl004RvIPoYR6Y60iHcW7BpSxSYjQVeDZXvfLU/3rORg==
X-Received: by 2002:a17:907:781:b0:aae:ee49:e000 with SMTP id a640c23a62f3a-ab2ab6a3fc9mr2376289766b.18.1736847278680;
        Tue, 14 Jan 2025 01:34:38 -0800 (PST)
Received: from foxbook (adtu85.neoplus.adsl.tpnet.pl. [79.185.232.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95af424sm612725266b.137.2025.01.14.01.34.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jan 2025 01:34:38 -0800 (PST)
Date: Tue, 14 Jan 2025 10:34:35 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: xhci: set page size to the xHCI-supported
 size
Message-ID: <20250114103435.744bdc2f@foxbook>
In-Reply-To: <20250113143037.2131346-3-niklas.neronin@linux.intel.com>
References: <20250113143037.2131346-1-niklas.neronin@linux.intel.com>
	<20250113143037.2131346-3-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jan 2025 16:30:37 +0200, Niklas Neronin wrote:
> +static void xhci_hcd_page_size(struct xhci_hcd *xhci)
> +{
> +	u32 page_shift;
> +
> +	page_shift = readl(&xhci->op_regs->page_size) & XHCI_PAGE_SIZE_MASK;

If there is a v3 of this series coming for other reasons, I think it
would also make sense to rename this to simply 'page_size' or something
like that.

Shift suggests that it's the logarithm of page size, but it is not.

Regards,
Michal

