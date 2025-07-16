Return-Path: <linux-usb+bounces-25872-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (unknown [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E2B0708F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 10:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A5B504293
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 08:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2242EBDD0;
	Wed, 16 Jul 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TJ+DqaZf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7FA2EBBA1
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752654572; cv=none; b=VDqWZ54DpSWsr+DoVFUoCbCXpsQ590yRXDA7Z0Gb6N1atsd9o2HkHx8168qR049YxrFdCnYVYhHGbsP9/lbwnCTqC4EcBzadUFiKIk84GRxsU2U1j6fnd8/gmtn71rhkgWdPeRHJrBP+GfXxzAFdtiyWoKzuSKRATejhXEHxtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752654572; c=relaxed/simple;
	bh=/dVOnKYB8CD/wyyHbMWcCAYLrsRBtnjmn40w6cFnUfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaPWa6x9LhpD+W9jSUKyYugxIpxs9y7qcIkNCNvtXxi5MFOuMtABToDQZF95btdyJpwmQ4DR2097OeiI4jb0JkRtJxHbG9w/dgqHY5wU4NspFUYtIEqmuDV4inbNNyts7Mw11ivArYKM9bz8pyGcz/aZC5zrpbiqLIbLAytqris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TJ+DqaZf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a528243636so3546903f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752654568; x=1753259368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kTS987hZr2/BPWLmY8oveEZ2X67lASpu1Bb54ts50jo=;
        b=TJ+DqaZfl0zIkqswkSGb6b5pGV9HjXtR9W602M0rVQSG5DF65rjluDPe+4ILj9b0xD
         dQdGk+32aL1h6rxwo/lmrOc4pUZ/8LUMZ9u/noYWD8KZMRM/qJS6PorYHnu35IVMgeyS
         9tmAiw9zyY+Y4or08t2QxQm3vpQiZKYyy4yfMlJ8QqYvxbXa1q5KVodNevEzG0lpvLWf
         zVyAR/H006nurUAGEEZx0AmFMCLmEPeXsYjPfhOW9OASpo3W5S1WX5WSgE1/ZhwYWtlo
         EDtoSWGFOyIDh2xOD0LCgtbPQhm3fDnEMIg9faXtbQICCpUH3uJflijVdayK9HDzQGbj
         ZyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752654568; x=1753259368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTS987hZr2/BPWLmY8oveEZ2X67lASpu1Bb54ts50jo=;
        b=tXO8gYQKQdyS6R+Sg8uR3DviUHOxmEX4RNUEI7OVRiT2ERZ20GlHdRkTsxNYF78rMP
         atc83rC7bpMRxounyyt7awGXggaSK2BdEIdsau9BknJSYyzJVve8wi8SfZ1boXXcQlki
         e1WHWL/h8NzSZEkLbey6TszQvfno2MqnnMVyhh6mnei/Z4ArPYz9P4MoSGGtWhPkU1AV
         tPHs0SiKsPKWs6DswA+jaW8vH4gCE5HRyc190Oru21uSuv0AjxPPbd3+dUfGHdRZs4Dr
         2wHPNaWsf/6I7Vrq5ib4QqRc6KdJvLpmz/l7SEu84+9P+iM0UNNny+I/gGjov+yZUvmV
         Ba8Q==
X-Gm-Message-State: AOJu0YzyCkyVxG/tNuna2kvAK/Otnw33uGGvBpT/I1M5DG0IgpoVq+mE
	ZNvyZWGO6Og/ILcwe7EU8nY5R347Gv9sxuHv6OAIRlLzwuIHOBQ9owXpwafynwr4+1w=
X-Gm-Gg: ASbGncswIJ22ZfwUBqEEvmsgqU8c1WE1NIrHpwWrnyWICs+hdw0mlnLHpD/rv2lwuSb
	F86CBKU/z5VWkO2lybLjEgjM1Lz2SUaQNOcGjXy9jd26ki0qRlf3g/F/JG2uOD5LUqJGiAS3Qc4
	bNEjAvuZO1/N7AaF809jXaGsSC1I+TIwnfV3Xto1BzzOZbJc9ixO+Aop45c6kkV7Shy2rligT2o
	D9uksJZODyOMrhiwA8mEbyBZDASVZg1jgs1j8zqkY86HCASpDTBrbJuQn++s14GyDzK2JGJofUE
	xjPtuVP81emJCKB1vECLVObBdMF10iyBdo4OyPhdcGGMS/4HKhHXxAieA4utGvcZlbhJpUOtlbI
	wei/hFai+wskJuXz9HYLrTHjirc+Qltr3AEbvdabFBp5C+rzOaDx1W5TVGB15Hvyluw==
X-Google-Smtp-Source: AGHT+IFSZH4omeTXZAl7Lh2gjNFC0tMnhjbsZXaH62GbzEcddv2hbbklP4Avf1fLgsmVBRMpxR52/g==
X-Received: by 2002:adf:9ccb:0:b0:3a5:39d7:3f17 with SMTP id ffacd0b85a97d-3b60dd898c7mr1162606f8f.47.1752654568473;
        Wed, 16 Jul 2025 01:29:28 -0700 (PDT)
Received: from ?IPV6:2001:a61:133f:9e01:b1a5:79c8:d196:e761? ([2001:a61:133f:9e01:b1a5:79c8:d196:e761])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e332sm17275063f8f.79.2025.07.16.01.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 01:29:28 -0700 (PDT)
Message-ID: <fa20ab91-5ebf-427d-b938-31ea6fb945cf@suse.com>
Date: Wed, 16 Jul 2025 10:29:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB cdc-acm driver: break and command
To: "H. Peter Anvin" <hpa@zytor.com>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-serial@vger.kernel.org
References: <ce54ae11-72bb-4ac7-980b-c1cbc798a209@zytor.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ce54ae11-72bb-4ac7-980b-c1cbc798a209@zytor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.07.25 23:00, H. Peter Anvin wrote:
> Hi,
> 
> I noticed looking at the CDC-ACM driver that it uses the assert/local delay/deassert method of sending BREAK.  Given that the CDC model has a delay specifier in the command packet, is there any reason not to set TTY_DRIVER_HARDWARE_BREAK and sending only one packet?

1. The existing code is tested and usually works.
2. The locking goes away. I have no idea what happens if you are
sending a second break while a break is still going on.

> I'm also wondering if it would make sense to support the SEND_ENCAPSULATED_COMMAND and GET_ENCAPSULATED_RESPONSE commands, presumably via an ioctl().  I'm not 100% sure because I'm not sure there aren't potential security issues.

Well, one of the purposes of the CDC-ACM driver is to hide that
you are talking to a USB device.
In theory we could do that. I don't quite see the value.
Sending arbitrary data from user space to a control endpoint
does not make me happy.

	HTH
		Oliver
  

