Return-Path: <linux-usb+bounces-19554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72418A17B18
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 11:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1E9E163487
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 10:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566421E9B19;
	Tue, 21 Jan 2025 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eTfLrJA7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017B31E7C07
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454246; cv=none; b=oOOGJVA1tt52rflHiaFMZgTb+EsBTdth9NmaQjokWdLYprl/CBSQ6Uqqz0hpvi1BBYQCfkOng2JWbuk1kp2F4iRYqFRontGrSJ6eJ4BfNLmRJYTZgkGj6nhge/8jLxdK0E0s5nW2xZbd9q/AuvkcQOeHDDyya9NtQW3WpTlPu7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454246; c=relaxed/simple;
	bh=CI7FmsqudmVhYBCbsOCRKMqjy3MmFlVJq7TwHksWTDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEQGo2w1MIlDjefVUap/feYNqmb64tHBK6Km2M4pZcSMkL2dgu8TT4h5UtC9JFHq1BcBNwE8yTeJ3SncoXcRpMNr3mwX/2Mf2UyYsjSzzllYt8/k2Iqhm43V+U3wbpoYJhe4bV3nwUB4XYpKyBSUqlRVY3MkKyXOWz5aDDocflI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eTfLrJA7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso918733666b.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 02:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737454242; x=1738059042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=peWYivbfAOTnI2yradHMHdT/q+b6yZhKcWKaBFpAlMQ=;
        b=eTfLrJA7my9ydxeLCIBqojeQy602TOMZwHVZsuj+JspzpVWNJi10Bpng4JtD0IJekg
         fbyPq4xHvUo8q12F0m7y+pn30jNhGCih+fxwM1xYb/x6ZRLZ2c/r3OnGuzgR9tVfqT5q
         zkLhqy+L/R4ba4BOzyZHqcZjVf4KQNAY2q5vgYOaSfEdilKN8I+CrthVpnuxN25zNVXk
         fAjVKPuDgkzZSztxMbmkbW0tr8FrjIGd0CVs4wTcBBCHnT7+aemNbRIXC0/1eJL5O5b2
         vA8XPA9J8aCvcaGaUj6DcRHJxrO1oxrcmOFqcu24VUshAR4dFFMyVwMiEe1Ie0jikVGD
         Wtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454242; x=1738059042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peWYivbfAOTnI2yradHMHdT/q+b6yZhKcWKaBFpAlMQ=;
        b=LS2Xbt5v8B5upF6UVBkpxTrQI6BFgJQRK2LCXIFB8KIUrewQ2yfUEoPGUST7VReYYE
         JG2lt8WfQrhqoeF0L6UP4/qnlEyNqufN/01wTHpALqwot9SFHCjQg+WzTgdKr4bvDLc0
         fspKcgcNgfpyU9pa6cN2EDvb/FhnjXqK6dGyVlPgtucek99VFPelhm3H6/UbsGcO1bmz
         X+/1ZJLbT943dxrGkB4xv8o70L19OBhqnFgeSoX7CwMjeblGLgxOiYmX3e5uGEvQTE80
         30x6dtgOhg5WM2t1cR61WOae0ZYbrCLOHFFC4+hNhBt18S0uJcSWHNVVu7SKPe6fW5My
         0xcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVspR6EeTO20vprpeNlF7Nn6oFoIyEBJ7+imWr5lSYKCOLKGJxz93aeF9tzkUTr284VZ4GtjWC69Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDg9DiD0rzC6gRXI2V/HVGyRN8FprWmUKH3c+K7p+ns7w2IIHr
	7lL7O+/dROyc9Se1HxhZwvWCSITRamVwf0MQf3d/W3l+0iD/Md+C6PQYVx0CYcc=
X-Gm-Gg: ASbGncueyDlYjlxU1c7ktiwPvsUrTsfFuDv0zaZ1fekJnLOTeTp34Mx0A/QZsypkaNS
	Ajpag6RlUBM4DmEW6WR0RdjPiGEC4v6RlMgj5LRkmQTrblmZTCYtTFL3fn5LILvNy1eGCkx9Zg3
	7/iz5bZ1BfSzCTy+/P+u7Q3pwVCS72OIWcC/Mz+aMfpT7idKDHNXef/lDd/wpCUHXQd13x+BP3a
	/ZSwpj9rs4ERXjSSkN1/l+I8vJ37f/w1g7lScJ6Q7xeotggCAz4Dvpbvxk14Zdpi73fXYpCi0xt
	eqJkYJX8Gx48EzbokfT8lO+cZUsSd4qERDRb6Q==
X-Google-Smtp-Source: AGHT+IHFukCOcjAARr4ty7TISkJvPmgc67CaDdSWKXaF3TAzHhgwZ9sQgfJEs7hNCgwUA0PxLhQU6w==
X-Received: by 2002:a17:907:7b9d:b0:aa6:7165:504b with SMTP id a640c23a62f3a-ab38b17b928mr1441384266b.31.1737454242248;
        Tue, 21 Jan 2025 02:10:42 -0800 (PST)
Received: from ?IPV6:2001:a61:137c:9701:41e3:e368:740f:c4a0? ([2001:a61:137c:9701:41e3:e368:740f:c4a0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87d7bsm724758766b.128.2025.01.21.02.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 02:10:41 -0800 (PST)
Message-ID: <32945abd-060b-4da8-aa1b-1e45dbe2d4d2@suse.com>
Date: Tue, 21 Jan 2025 11:10:41 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] HID: pidff: Stop all effects before enabling
 actuators
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: anssi.hannula@gmail.com, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-10-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250119131356.1006582-10-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.01.25 14:13, Tomasz Pakuła wrote:
> Some PID compliant devices automatically play effects after boot (i.e.
> autocenter spring) that prevent the rendering of other effects since
> it is done outside the kernel driver.
> 
> This makes sure all the effects currently played are stopped after
> resetting the device.
> It brings compatibility to the Brunner CLS-P joystick and others

Hi,

it seems to me that the same thing would happen upon resumption
from S4. Will this be handled?

	Regards
		Oliver


