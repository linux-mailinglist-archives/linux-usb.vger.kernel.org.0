Return-Path: <linux-usb+bounces-24643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFADAD3238
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 11:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 927413B72E7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 09:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE8528BA8E;
	Tue, 10 Jun 2025 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LnyEJVNV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38728AB1A
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548105; cv=none; b=U1mf7o5bzPfkMoOwLXBdl2yuD6L9YW91UPVk8/XQ4/61kgjDs+pKs1ugH/8adgULZw7zGtwEdTBRoEC8Ot3XftKQ3cydvmBQPTbDGzJgYEUEl0pjxjh6A3laKCgzKee4/E5MqEOKGpDf51Us0O+labnJxpZhM6GYgWvIFXolDBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548105; c=relaxed/simple;
	bh=gfqKQUVdNgoYrhOlRomcpoZ1JXJ0s03ZyueH+1jSrss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrfUcPz2qETfOs7IrjaYJhaKuerCNtMzOrB8cx9c6t+zOa+lT0gPKN+5uUMsoDlz3DtbbVbjNIC9OPzh0BKucr8c7KFSAinZTlqZCyxbLrMqeuIprJCJCZPV3ezJrL8q+a01yxqpSSgMD/irVGnA6o2NI3LaqiitSf3WLgGbxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LnyEJVNV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3274772f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749548102; x=1750152902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vIhuZjiGLVmHW6LJ5dLscM6HtnslwSWXdO/lCThNQUU=;
        b=LnyEJVNVUfE3Iit6gYrV9KAcQZD6EFASLeExJ2LDLa4m1/CShpBpP39X834FG3qneD
         R5dkWR0Yl3sFMFnA/C834Lu7yx1D5yUqt6KWQpdqcmdwvucxjQvO1tOB1/MFYaDbkIyb
         I5Ri+kShQNUItceO5kUzwFqoqnHhVP/952LRx1oMu0I3buCKVoAizb9/ixV5AtUFzVEz
         CtHMWU06c5qGdh6Oi8ejOOKvr8jTEwGqKWBbUgdjCJRmw6lZAYMtuFnEpWgZQDDh6goS
         b99as/uOSEgjap+4Y/aKhtsTfgx1GIToBoha1EKeh/w5uUONMOEXEFS1g6V/v6zH4FQr
         OZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548102; x=1750152902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIhuZjiGLVmHW6LJ5dLscM6HtnslwSWXdO/lCThNQUU=;
        b=s/V8UfhnIRMGEiIZR6QuSfnGaFX6wX17h+LBIs88QIqr5FBQWcpWczLSvj9wG6Mjgz
         2jjXpvvVHOHCZF9CZ0VzOvjmGdQ9BK7TyYYmwoGR+UOYPZtjV31vRZ7Z097uGQi4d3H3
         RcKX6HhmTr6cPwAzcputc/tRzXABxNu6ePDr0cHaBiWSF3jlgSw5bwu7fmiitGIZAjAL
         8FzyzbiBiWOlXt3RmX9EAnQxbjNjGQSHF/iQYMTJpw3tstUVpSoM7ZT9AFL5c6ket7km
         0HxdSHTnb7+s4GYnptqQvjxqYDrhgqZ0J9kzNFMvUOrSZoykVMCvwie+ESuFO+ayDUSo
         isOg==
X-Gm-Message-State: AOJu0YySsjfKo/gKVMvCJcvQQt+fmRcTgjLRjgeI5OVY8M/dT1K8/FA9
	35tjzeudgCLBeu5+AGMEe+p+UVT64lp6wbcaZfdPTYx452yt8+8LqtyZutcEPxI69I0=
X-Gm-Gg: ASbGncsg9zsgrL02kUrpyXmS6dCFtcl/L88mbmpDYzWDW5tAweowZul7ggLQu5VhD2t
	up+JDV1w0mPgEwbv7YGfQcSemwPS2s4Xizr1T+xaTTs+HLquWXkwv+uSEzr8S7DVVfqkXNeGMxy
	PXjBdrcjoFUOR98GqTpxPWDhFvSPL++IZ4Sy9TGMIHKeU+C6AHIfx+45mM0uE4UreOF7ryqKmuG
	Tj+KKd69BXEDtCl2OHfAERIRrRT4QcvwUiwkVmnXLpGxAAGkOyaUZyeS9Uq+eJknQB9HzqVcukE
	vZalT4M3TXIlBU2ybkqvbAJUS8ZT5s98CrHGOLzQllgdQznE4D9Q+nNtCWttzQlPtWpeIW4zbVJ
	B3hjBDPFkfX3Rn/O8WquMuHFylyQW
X-Google-Smtp-Source: AGHT+IEQlTZRXW7vkWedsbdHpf3XBXkYI9eNMwOqbYhqA/9V85XZoxKjQX3auljn/RMev2+m8IS0fQ==
X-Received: by 2002:a05:6000:1ac6:b0:3a5:1c0f:146d with SMTP id ffacd0b85a97d-3a55229bc30mr1501109f8f.33.1749548102024;
        Tue, 10 Jun 2025 02:35:02 -0700 (PDT)
Received: from ?IPV6:2001:a61:1316:3301:be75:b4b4:7520:e2e4? ([2001:a61:1316:3301:be75:b4b4:7520:e2e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532436863sm12004174f8f.52.2025.06.10.02.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:35:01 -0700 (PDT)
Message-ID: <66b3847a-a3b8-43fa-b448-570f60b775be@suse.com>
Date: Tue, 10 Jun 2025 11:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: hub: fix detection of high tier USB3 devices behind
 suspended hubs
To: Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 stable@vger.kernel.org
References: <20250609122047.1945539-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250609122047.1945539-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 14:20, Mathias Nyman wrote:

> 
> Cc: stable@vger.kernel.org
> Fixes: 596d789a211d ("USB: set hub's default autosuspend delay as 0")

Is that the correct breaker commit? It seems to me that it marks
only the commit which turned the problem into the default. It
was always possible.

	Regards
		Oliver


