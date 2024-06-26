Return-Path: <linux-usb+bounces-11714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54476919629
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 21:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827B71C2146D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 19:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B48191483;
	Wed, 26 Jun 2024 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PMR1IDZh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A3114F134
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428846; cv=none; b=VIyNxxfIZXA6SGqsLptEA1Fovn16e2BdCJ39Ib+jjcw/w0zpDEh+zkOa3rZZ6Yk9aw3s+iqObzPpu5ymv+QODg+v+i9eGm5sWhTvmq/qSfgbKIAfiWT9F9mJmHl5FGOuJ+HqKy8BKeHASDMmimsooz1swNT9gGNF+aDqfCui53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428846; c=relaxed/simple;
	bh=FNQWcgOgG/NtkbC0LXEqSi0Yxr8kIxtCtl0SnCH+TVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRyoUUuDIw+mazhzZ0Uix+wK8TrTpQ8DwuUgvtM6ncyckuXg8KKwGeNUk/B6oSB1lRCv44/PqV50mnGExCjZZiF1dBsGDNQpuvKjP017n0UGhuNkzl0i2kVfvC+90Pi1iQdK2JEXVff5c+pX8Yqe8vSEtTv+dasVvdZyfsiyFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PMR1IDZh; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ce6a9fd5cso3805048e87.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719428841; x=1720033641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AodPF1IkN5fnqRoumqjusbpdgct/Kdh42q/2bY2KXHM=;
        b=PMR1IDZhqLKnENkWv0SGyctt5qS4xBj/ypOF/pbt1oEtbWqEIomtMLOs/i4gDTdqUg
         4bEXvjD5Gxjpar8j3ClhBp0VpiP1z/8rq6E2dWmze9sp8tbtPXuHLX9fvjzp7tH5iHgV
         ru4/YOJZ6cPIY9g3V33JOjot/8FZ4S5PEht6Gw3oIL2/pMRsb4czivlWWyAaWV9dlYz3
         XBZASqtJzZsj6L8/lFr4k44QuVpzkVtdskH+ihsV4+hI8bJN5kR1TUTILH2q0xaamRS4
         K1UfYlDevEFcI1BRPhcPJmj2zG8PqupgY7UWHHMKYi5cXSl/H/qDemUZ7J3vD4oQ6cVP
         39Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719428841; x=1720033641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AodPF1IkN5fnqRoumqjusbpdgct/Kdh42q/2bY2KXHM=;
        b=VlOQ4NNJep5Q0MraDWhXr+6lqhmlZa7zFehI4gs+ICyXYfqt6HyHktKkNFQm2SapNp
         EmrItjNqde5v3Wt7Ohec2xCdoTdN9Mc9TkI9mwenps5wozyIor0znpuFf2Hx+tA4xyn5
         BpOQIHWJBsSvFFiDIQt9ZTQM8yqlbI6vlk/S3cs+B1dg2xAM5HmL4OjuBDpGKb4vhzF2
         H1FXPCNk/hwShNLhmwY137U2XHFDyzaDX3uzh8fJ4yeTe6v5ZZduB6VSw/7eitSbkP9Z
         VXe6GCeC7JEI2t2dLef53sQxBESRmxu3IwITjJJ5ugrTPCS0MnzAYxSl0gHCZuXATkcl
         g8/A==
X-Gm-Message-State: AOJu0Ywsg5tnu8/Lz6dhe8LUV5eKXYIIECotXN+naVzrixAyRJD9/XMS
	ToFPYyC4ChCn/MrrRZiHSrSzG83EEIq4IYzQ6U8ae6+E5zeRVlToGkcx8F3Hl0z/SZWCi+9JhtN
	+
X-Google-Smtp-Source: AGHT+IG0o1YoWW0hiO5dw8ykTAloH63XgHhlj/r1Tf09wJkPv4Yq/Vp3zGqYhKWNhmyi/pXB8ntEZw==
X-Received: by 2002:ac2:47e8:0:b0:52c:d905:9645 with SMTP id 2adb3069b0e04-52ce183293cmr7494605e87.13.1719428840537;
        Wed, 26 Jun 2024 12:07:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:138e:201:27e2:fe9:90b9:6b9a? ([2001:a61:138e:201:27e2:fe9:90b9:6b9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c837f1cesm34366745e9.37.2024.06.26.12.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 12:07:20 -0700 (PDT)
Message-ID: <93ba1085-8c16-4326-9751-a392e376a623@suse.com>
Date: Wed, 26 Jun 2024 21:07:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reserved bits in bEndpointAddress
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>
References: <6a65e9f5-1ef6-43fd-8b84-b733016fd7aa@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6a65e9f5-1ef6-43fd-8b84-b733016fd7aa@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.24 20:37, Alan Stern wrote:

Hi,

> 
> There are three obvious ways of dealing with this:
> 
> 	Reject invalid descriptors in which the reserved bits are
> 	nonzero.  This might run into problems if later specifications
> 	decide to store real information in those bits.
> 
> 	Accept the invalid descriptors, but clear the reserved bits in
> 	bEndpointAddress while parsing the descriptors.  This could also
> 	run into problems if those bits get used for something in the
> 	future.

This would seem to be the right approach. Reserved means reserved. We
should not try to interpret them, which we would if we went for the first solution.

However:

> 	Accept the invalid descriptors, but mask out the reserved bits
> 	when comparing the addresses in endpoint_is_duplicate().  This
We should perhaps do the very opposite. That is only in this case
discard an endpoint if the lower bits match.

> 	might run into problems if any other routines assume that the
> 	reserved bits are zero -- there's some questionable code in
> 	devio.c's findintfep() and quirk.c's usb_endpoint_is_ignored(),
> 	for example.
> 
> I'm inclined to go with the first approach.  If a later version of the
> USB spec uses those bits for something, we can adapt to it.

Deployed systems cannot adapt and reserved means that they should
be ignored unless we have a good reason not to.

	Regards
		Oliver


