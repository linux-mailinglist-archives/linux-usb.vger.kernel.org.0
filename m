Return-Path: <linux-usb+bounces-17929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8BD9DB498
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 10:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF9828161E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4197A154C0F;
	Thu, 28 Nov 2024 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CAUxpRSW"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8571552FD
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732785057; cv=none; b=YwGwugVr9P6B3xBKeBqgv4Z51ojiwqJ/K0uBsfUt2bvIeK0qssd+Lv82poRQ37b1mJEQTasJP56Xc3WuwpdrNcIcRN7/ovGex2RKscchLKfZu8XZfKWn6zMRT3OQZtynE6WFCzzssPzKgqIXYA1PJxIH5pSavpfAwYONqOkg9Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732785057; c=relaxed/simple;
	bh=5aM6RUx2SpmIVmv77g8XGYaRBXTXgbsI0IpnnLfE7Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zpt1iCs1I8oMWLhrcbeKo+m5h69MPqvmUYrrks6mKd/W9RCdho0kvl4M7y+WidQGmA7n4vG1xuh8M9UFN9MwUIe0DSY/rVUr6DgbNt+rWf0rJDtmjQuuUiJpRFQoFwSS4rkhgcxdczIr0NZes27hMS2T58YHm5L3/cPNMwQQanY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CAUxpRSW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732785055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDJda/po3QEjwQCtXovWuVSEwD6COQFMRUy2RBfefjI=;
	b=CAUxpRSW07pHKDVJIfPzTo84O8UY0whdQSyt/N/BYrpkgY6NGNR57Ruye87z4d1YOLbqZL
	uMKbeFZfW1oYraBGYSRCCXND3rgyQAPcy/ZRAHv27HsHIVRGzyicVFhF+Pf1BJqe/3Cn8o
	jnXQiJUxkrgwumyyhjF8SgAh0k/pLzM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-Z8fJdg5pMtO534Rpqq225A-1; Thu, 28 Nov 2024 04:10:52 -0500
X-MC-Unique: Z8fJdg5pMtO534Rpqq225A-1
X-Mimecast-MFC-AGG-ID: Z8fJdg5pMtO534Rpqq225A
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-382440c1f83so892281f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 01:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732785051; x=1733389851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDJda/po3QEjwQCtXovWuVSEwD6COQFMRUy2RBfefjI=;
        b=cSfTspnyeAsiHDLDsApJKZzPR3bu4Y4ISivsZmv69NYXTOI3QSY46ZRnI93bhU/Smz
         dFOYtC3nTU9g16f24gGMGYxpxdVymq8bMNMaZQ+Vmnv9H8y5ItxQxyLoTan2z9t62/lB
         H6F6vBvg7WXdi9NNGDZYgBCeN48bgEPgwaaRQ5A2OKcG7qIM8V6cb0UqRUy798KhlA2Y
         Mm0M2+VHXcvFK7wb7i8LPPAJsY5Tu0/2ttNKky4RPfe4z5Mzc8MRh067e6k7+Ff2f+NX
         m5BWd8lHnLhJlbo9wcLcp0j5zfBLaYsE5nt6iMkzaUvhg4iCNSSRzVWFJfkDX9YnCEtf
         5e4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUED+rU7SdzWQzFr0tx6ga8kuxbrzyz/oCosOABcPHpGe7/jaDNBjwz6rTLgn/hsHfyHZEx8eAsX1o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoqu6FoImmhDx0etTY6VSjgF37iUbzc/vHRmFZ/Bs4d5QxLsyB
	d2TZdeDbEyiAyulmvYlamlsZq4rRLa8UaIQtnUZ4vFoWeUEEYKQC4Wy14L4BjJ5p0o/l9judgRQ
	MuVjKn/hCIHOhvMJhj1JQSaE2T2GBaxKqlLsGNuT/H1S7Uoq0uO2kIRvU4A==
X-Gm-Gg: ASbGncvQZgU4lG4Kmoacw8sWhBEj4TUgiGiKbf87FAWRLUbaQUuP4VONHpt8vEDW9lg
	c5b264ebSH0l2QxSfnOym6ilbswQhark+XtDwtffvkvl0Uqeh8RNYkqDbXLD0ixWDInnkfNdVq8
	valZstNs1uqtZiJIClO4cXe3SRlXPKYVSKFv7HtW5w+rUUbWYvFLepNAo2UrJKoKQsdyfWi07zD
	1aTDCwdHy81k3OX4PlTR5xubCiAVUkjUnVgFqghN48q4+/ujjQLiztAcaprTTOAT7lHHjC46bfH
X-Received: by 2002:a5d:6d8c:0:b0:382:42d7:eec4 with SMTP id ffacd0b85a97d-385cbd60477mr1866277f8f.4.1732785050893;
        Thu, 28 Nov 2024 01:10:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsTuVKbDatDJibWkkBY3qyBNrUOmRjmmbtXs6DloxMmrX6/Eh68Wlf/OFtK/lIK3HxJfy0wg==
X-Received: by 2002:a5d:6d8c:0:b0:382:42d7:eec4 with SMTP id ffacd0b85a97d-385cbd60477mr1866256f8f.4.1732785050538;
        Thu, 28 Nov 2024 01:10:50 -0800 (PST)
Received: from [192.168.88.24] (146-241-60-32.dyn.eolo.it. [146.241.60.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd7fd3csm1101404f8f.92.2024.11.28.01.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:10:50 -0800 (PST)
Message-ID: <db62a6ad-b96a-403a-9b70-9223dc6a3856@redhat.com>
Date: Thu, 28 Nov 2024 10:10:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 5/6] usbnet: ipheth: refactor NCM datagram loop,
 fix DPE OoB read
Content-Language: en-US
To: Foster Snowhill <forst@pen.gy>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Georgi Valkov <gvalkov@gmail.com>, Simon Horman <horms@kernel.org>,
 Oliver Neukum <oneukum@suse.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20241123235432.821220-1-forst@pen.gy>
 <20241123235432.821220-5-forst@pen.gy>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241123235432.821220-5-forst@pen.gy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/24 00:54, Foster Snowhill wrote:
> Introduce an rx_error label to reduce repetitions in the header signature
> checks.
> 
> Store wDatagramIndex and wDatagramLength after endianness conversion to
> avoid repeated le16_to_cpu() calls.
> 
> Rewrite the loop to return on a null trailing DPE, which is required
> by the CDC NCM spec. In case it is missing, fall through to rx_error.
> 
> Fix an out-of-bounds DPE read, limit the number of processed DPEs to
> the amount that fits into the fixed-size NDP16 header.

It looks like this patch is doing 2 quite unrelated things, please split
it in 2 separate patch:

patch 1 refactors the code introducing the rx_error label
patch 2 fixes the out-of-bounds

Thanks,

Paolo


