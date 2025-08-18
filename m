Return-Path: <linux-usb+bounces-26972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2D4B29F9B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 12:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55DFC5E5F9D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 10:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708D330E0DE;
	Mon, 18 Aug 2025 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EwIW1kBT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5C02765EF
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755514261; cv=none; b=cV/wntHwwmzGMT7yFNc3OeJj7j52UUwSCm2seeCVqLVFq9L8O8uaaRB1+tf+6wkWf1Ulvh21NdPVgYNtole2fK4oAAIDaZGzxTauC5TcyaNAWiycIRvvyHarPcma24MFb78EmqsVk4DDnGlAprHYci1ETGfSTeDk8Q0VSfkGaS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755514261; c=relaxed/simple;
	bh=pZ28X6C6V+lht1om+EThDAP4EVsl4TPoXoYx+3BdCx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GduQvO72rRfAM6XynGWT5ZEx1Lv9f/cHmi7deKQ2UCC/KpX5a+x33WocFLQZPNyMCZ+vLaHAvSbnjRSp299hrJtZheBgOn6iCIdhN+5o0i2jmWvsD17LzJtAPKEoyI/HfpeIqO2aBxO1J6T2/GuruDaIV23s3B14KLxT3Vt+eHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EwIW1kBT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso18831555e9.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755514257; x=1756119057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZHyg61EBWZaARHc87dfxpWntWm0nMzTS3sgcvk3T3M=;
        b=EwIW1kBTgag/lEv67UZSyFSE4hfrKqNCrDD5WDwgejKDJwbDaezHDvk7oo1PWAxsiz
         UUGQb3rVYbEsYNIXxOdoasaBjzLKNVZAOlG4CsiYX2jeBaHhnrAgMr4F9KXmJ6cSzSMd
         NTc0eC9azuQ78FE/3/hl8zc34YjJ3QI9BY8uGFIhenMZ78fbuf4O4bkG0UVT/RAqHaSL
         FTMLFdoObpmwAqhV7DTJzI1xIOFmFwKtEqRGy70SsAPutmQvljcBN8IXYreqAMWarj07
         QA4JICXqLYKt1ar64zaJ1APpaeI/39kh1C64dcG0Z9zZZ96hg57XjIhdNryYPWMzV/3H
         opZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755514257; x=1756119057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZHyg61EBWZaARHc87dfxpWntWm0nMzTS3sgcvk3T3M=;
        b=JMI2GAqJ85LwCjJiwZlZaYytJ1vVh+zAUC1b0g36xKScGfps816KO6BNn9aorFpNSp
         aOHld8rai/ONOb+ujyTSQ+/AhdLDnV/O02ygR/yiD3eOqYekCo2ZPEhrovZ7LsQB1QyE
         U904mkAdgXt52yZbaPsylLK2fP7NQMtWh6AkxTCZEaC/1mklz7bGCC3JOsUHTA4Ce/i2
         btiGQtEweo0GXIcCGzDTN5vXyOaCKfhwTb8qREg61Mn/YJ3eV/Br9xdJaQ+/WHf7k6yO
         oAmQIjlGfcTuO6C5Owi14Dt+wNRcNDAmw3ebgL/TrNIpDQxSnCes3i+KxRTaq+pHxfNL
         RnwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTV+0NAzAnsdxOIgljxQWjciTeRq9TJt38JyISFby3zGl0vOXZOpcDCelK0BeUylnPGnd/soAbMEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCEjfmeSEUfBYYb3a9dLuSGJR7KIZjumDLJkdrvKC9Cvm0w9e
	2bO8Rq5D8bcg37Lp/mHjIWa38lwXk031E80YJb1ZzDkrqRDpkBIawQNBMpxXK0l4/Gw=
X-Gm-Gg: ASbGncvHSZunRyuSFj6xDbezAi0H1caEQ3QW2Y38DdlAC6J8CjZDaZgE1kTZCUmjUgy
	a8016vKoLO+nPPXe8g4QjTBu5De1XDCYB4NhQwHwZCF8Lg+XapmYoGWROpLz183Ni8aNZS/vFTC
	6E9Onnb2lLMBF28Oh4KOxNHdzGUwuD0bcsAqbnkYXsdXrONKNM6csjrcHB5nk5Vyau6WXQRJl4i
	y2MlI1auyfGIYimMO/oZwguKAQ9R9P2jUZ7s4EyRVhK/z/c7fbNb9UlQoiTnsftsE9TEZmF4yYM
	H85+mKiPUbhOOVFdGVAwAMAYzUC69V2uwY06UFiyYrSh9vJ1a2vTRt+H5QanLrLJKduc4lr5liq
	3Lk8i41Vm7fd+ivihuL2CvgZsRzjo1uGkGrQNNmTJAV2nEMOuAq5l7//uQ4f1Dro=
X-Google-Smtp-Source: AGHT+IFtjih4o8NS4VHkcYD2Txcwmf+pFe1QNvS0DpqHsE8KLRkcgWRFJ+48VhP74+JNXQyo/iL/1w==
X-Received: by 2002:a5d:5f49:0:b0:3a4:ee40:715c with SMTP id ffacd0b85a97d-3bb66a3baa4mr9592468f8f.14.1755514257365;
        Mon, 18 Aug 2025 03:50:57 -0700 (PDT)
Received: from ?IPV6:2001:a61:134f:2b01:faa4:fc57:140d:45b? ([2001:a61:134f:2b01:faa4:fc57:140d:45b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb6816ef48sm12090391f8f.58.2025.08.18.03.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 03:50:56 -0700 (PDT)
Message-ID: <a1cf393a-9901-469b-90f4-81211f2e1b9b@suse.com>
Date: Mon, 18 Aug 2025 12:50:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] USB: Pass PMSG_POWEROFF event to
 suspend_common() for poweroff with S4 flow
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>
References: <20250818020101.3619237-1-superm1@kernel.org>
 <20250818020101.3619237-5-superm1@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250818020101.3619237-5-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/25 04:00, Mario Limonciello (AMD) wrote:
> If powering off the system with the S4 flow USB wakeup sources should
> be ignored. Add a new callback hcd_pci_poweroff() which will differentiate
> whether target state is S5 and pass PMSG_POWEROFF as the message so that
> suspend_common() will avoid doing wakeups.

Hi,

how will Wake-On-LAN work with this change?

	Regards
		Oliver


