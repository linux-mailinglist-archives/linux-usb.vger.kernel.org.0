Return-Path: <linux-usb+bounces-22986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBAAA8614E
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 17:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8394C6155
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 15:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7076921D3E4;
	Fri, 11 Apr 2025 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYCcQowC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3981FA85A
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383921; cv=none; b=s+zl6JsBba+Y3QNf/skgjjYGK0SO7V+ghhnimNT6+LR/Hta93l+WF6HxPplSDo7CXVAx1LHa1udW2V59fqwNafQaQellv5Sj/okGmjyo0wnMCRcMuQcTXMp1cK0l9+GNgrLQr3DnUHlj/+YiLSj1/CBEBmeJ+L4qUXiGrTwaExs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383921; c=relaxed/simple;
	bh=9iuSXzy/bwMNOwztIb7XHOC5dQnFH9Nt+RJncfvWS6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehCjbB4x0833KATPdDC4cRGwo/znOEYaLlJvgtihsKVMKqV6jS/HRx9hOzQjJe4MWz5KSw8zg02TxIq2JaHR4rOXfZf0Mx555tPM4EtWae6bGVhFGoI1MSnJ9xSK2PKYY54Ogm8dsCbNTTAfALDTm41Cg7ILiHlRhN1zC1NZVMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYCcQowC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30db3f3c907so20262021fa.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744383917; x=1744988717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrJf+/6V2xt5XDrVxhl+oG2CRGxwEr9GFFFSV5ZdS/A=;
        b=TYCcQowCJehAbgYIErhgBlv06uNVwuChidv73Hl10oagOhYHyyD08SrDMmua+2wrkQ
         /d0e/3rcktr7AQk7KmjeDa8dLSwOjGe5WgbLnpnBdIvl+aE30HtCkKEzc8TeAqXD0NPF
         UrXYkgte+1mkfxVe8boiLnCxXWI/+lFq9odQyyj++cj3kFGgX5OEKKxH5uke2Plu06GT
         eo4PuDBN66euXPSyJFbtSWUMo6z0In6+zoSoIqAjXR+8jd1P8UUm8cJhEWgt+vPxuH0p
         xQpIk6idqrIpfzk0gZZ181B/QgZ2aHTbln3sg6NLplLv3ozBcJtS8It41Qq9oRiLa9zI
         SQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744383917; x=1744988717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrJf+/6V2xt5XDrVxhl+oG2CRGxwEr9GFFFSV5ZdS/A=;
        b=nLgMF4hH1rCb83ZRotwpSFjbBHe0g+tud+nvRIXC1r5+CCLDIMQridu/+KWyPLkqD2
         2xPCx6PFoXKGKeqMCfWhjKCJxjEzEnGd20cJh/Y/QA1wpd5sJbxf558S/alkiQxev8KY
         Jhn4Kw30lNmZzwVNUV/n1Y/7JZTjqLapXrhxQ9P/VVPQTzQn0fZeT1g3XcqeaFcMGgeC
         5mnDE9uj5AhB8fXHi88aZy6qdXeIqj4gEexZ+8YW+74Oe+abQomV1zfWOxlVIgjZ5ypl
         1GfPY4obzF7BLPh/qolDhr9A03BVsyZiF/cWzBeeeJ6YVHFKHQ8qpnBYX1BnJaEtfei7
         ulPw==
X-Gm-Message-State: AOJu0YzLBEM2nywL6cyV/jwRFw8N6f32CwegjaEHw4Ed18DIWyezU3Be
	npUZ/ooYKE4vSs5PJeaCkkPgvz+qJmAgcTGTb3pbHbRZa4toQ4qANN7FxQ==
X-Gm-Gg: ASbGncsg+xbcxpcOzzysdIAEraSVAFa+OhSQD1CWFn4AhjI50iWwBIGsDRjzf1RGil8
	1yVQ7GLOBg31Xs3CMhVwvV19BxTXVa4HaRuq8gcpnPa/rgz90SPwbCX+LNmZ7tTFOr/Zrw/1+hl
	Om8kUwskTpFa9oYOCa9/KbHy90Q5HcCGeYH4nryktHo+yIr1nJ5o78qmuS0EtNFe2ghA8TPk9pL
	pd81GXFZbup/lbpDPf2/ar+YvOAggcgULDQ8dDyc8rWCx8X7DMDL0iDiYt2ftGUbnXr1WkOvnDC
	j8P+kYa/cvOU/KRoc7KurFl3vaCAABuL6XDXuVEkGPae4+B/UimvC9U/Z1jssv0d4JUAaWX5RLc
	+42VBgGIS19NF+HaB8zw=
X-Google-Smtp-Source: AGHT+IHzmD1H3Lkk5pue1mHod9DcF9cZcqZTB6c6ZkH/xxbS+j5S9f8PLqQn83Ke5IxerIh6tsMjDg==
X-Received: by 2002:a2e:be0f:0:b0:30b:cceb:1e71 with SMTP id 38308e7fff4ca-310499f5e6cmr10135551fa.9.1744383916863;
        Fri, 11 Apr 2025 08:05:16 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:140:cb26:b85f:125b:1bd8:a918? ([2a00:1fa0:140:cb26:b85f:125b:1bd8:a918])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7a5esm8060601fa.96.2025.04.11.08.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 08:05:16 -0700 (PDT)
Message-ID: <99e7c449-c9a3-4083-9815-7148f53e1ec9@gmail.com>
Date: Fri, 11 Apr 2025 18:05:15 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] usb: xhci: move DCBAA pointer write
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
References: <20250411091155.3386971-1-niklas.neronin@linux.intel.com>
 <20250411091155.3386971-6-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250411091155.3386971-6-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/25 12:11 PM, Niklas Neronin wrote:

> Move the Device Context Base Address Array (DCBAA) pointer write from
> xhci_mem_init() to xhci_init(). This is part of the ongoing effort to
> separate allocation and initialization.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
[...]

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 5f630e74b323..431c922b3f2d 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -544,6 +544,9 @@ static int xhci_init(struct usb_hcd *hcd)
>  	/* Set the address in the Command Ring Control register */
>  	xhci_set_cmd_ring_deq(xhci);
>  
> +	/* Set Device Context Base Address pointer */

   "Array" missing here?

> +	xhci_write_64(xhci, xhci->dcbaa->dma, &xhci->op_regs->dcbaa_ptr);
> +
>  	/* Initializing Compliance Mode Recovery Data If Needed */
>  	if (xhci_compliance_mode_recovery_timer_quirk_check()) {
>  		xhci->quirks |= XHCI_COMP_MODE_QUIRK;

MBR, Sergey


