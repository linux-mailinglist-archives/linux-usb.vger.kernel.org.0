Return-Path: <linux-usb+bounces-35947-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEfyODfmz2kS1gYAu9opvQ
	(envelope-from <linux-usb+bounces-35947-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 18:09:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A5396164
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 18:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97D0130417AF
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 16:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9305F3CE48A;
	Fri,  3 Apr 2026 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UfiYMppm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D63CCFD4
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232394; cv=none; b=q0QNHZTYgFXnyCbZoTCTELpXs/ETYD3dT/8OzaEkaGSqK8dlzxFWqtYknxtwghcJN3mErT9S8tc+z0ZkrYTTZOZK9pMQ1iJ6EDTKGuMZGX025EHnonkM75vRb0NdfxW9sXTLk0fPM+o7An9GiZw+e50OXZfe822FDXSX/yMB1so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232394; c=relaxed/simple;
	bh=xQBPZREomER8ilLHH+NLd8Q+ITnzkaC4RtwK1iEadt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDXBJQYNP/1vMWG4ZTlLlHxT6mM61MXZCcp/hca0m9lQimNvwvaGt0/GDBBeoM8cRPBjKxEWUXse2+1oCOiybp5+fz52EwyJs7Jl6rsOd0msZa6fJM0EO53U/v6yvaEP2pIzLbcXfWmTtWKfRGVSYSHogTzViHZ99AkGO2beTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UfiYMppm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a041eae5so2999285e9.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775232387; x=1775837187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5HNxQIi8JAaOPklyHHiUQC1mXkMBZvxx//VBNeSE4M=;
        b=UfiYMppmoPNvddsnwKLjK9pg5cMF+y0FrJ/xXV+ylpkMnloy5EwUIoXp7Q1hUx8llg
         6y64DrBwFfhc2KdJJuK/dpUM9ElroQgtynAWmeqhpmWEVoVRgFvQQYXy/Nqc3ZqHf8uQ
         fSah33ke9gOJC/2cboCPPMMkaqYCkXoeyvANxlCHM09UdnDuzpv8SPSHAgnQNz+Vd1vf
         l8oJYPXqxEU3Y/Mzc0bjbsR6JnXC2jMcCMIvR2JbgCyvdUMgcZ3zHjKfz6hyS8PqoUS5
         E1syKbq3F+UdZ3zUd6nLsW6A+yYvkJTl6RD6K6yaM31nNdN196okgSMieATbqIUTOXMI
         Rg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775232387; x=1775837187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5HNxQIi8JAaOPklyHHiUQC1mXkMBZvxx//VBNeSE4M=;
        b=MiFC1YSgOjl47kxWkxKACfn898vSntrnMvV1yAeKodt5NnAd/4SZZzTpv2TzUYR+wJ
         iBUkXeHTPi15EWotlzlbmTdw95H/2YsmlAhEH+vma7i8ssk6oR3cNt+6a8IlRtwUEBm8
         NDdV/NI0/ckQD1r8znay482G/MFeL5I8S/O57GCS2mVWmZJPPLwAVaDFmLUx1MKdN6lt
         Y9b2sW5U1bW83xZVbkoGVklYMQhmGTZTK2k84lJ1N4KIqI3BUpP6ticVdZC9ttGNFfHG
         D5tF3tm3zOs1QN3mXpudYHFCJ5MikV3eiiqObpiHir+mZE4xuubCBVCHM9e6s7YCil/9
         0+7A==
X-Forwarded-Encrypted: i=1; AJvYcCVSyzNsexD9lwE97W/p80bbvY7JRPc3AehRb9TmqAyvZ69HavaTYOoKpyNaSpoWHRzEJT07+hJtSas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8XVaFadme6yYkGsylPpLV7wZsuugn6/FEcqwKM3EB9J7R0Ah
	yIggJCOANddR7+MuxO0qjZAkUfnvetS7YtM4i51DgBYw/dZnA32Y17xe7xA3a3gFpNQ=
X-Gm-Gg: ATEYQzwXyrrX2wM2n4ckVqC4rm4TzFP99QrWioCX+RnhW202GZthpDPFKaPqsBDM/5o
	tZkImcdhYoDu9tkZAhp2sMV8WIjeqavukg8ndChwqnnwNufqnAIKQyEV1I3RXFDjBf1y9J2xeQU
	P/IrETEmZtH1gYEMiVLtQe+48kiJfKCp7dFXr8+NUDMIhbd9I5vvMM+1Q8pY8jNuKijTzbzwR5B
	jOyddtfJQ38GPXwSX3FyUZTXkyv1I8TlwAxQVlZW30sVOW4ZE0bDpnOiQZk4Ag2xENRjyvFsGcD
	HQUlT76ba7Aw3xi4uWBfqAy1MEAlSW1BBpVqUpQ08hjubHSoxQDgLFL5csFL5NEco1W+zfSuG7D
	JPcAWdTon6b9bjXIkFIdUka9nRE1Wq+FZvdMDQLrDz+ZhmvFqR1PQ8yhpfKiGDDVTEFuhEDYKC5
	/lXVCyMeYMX9BAO8Hc2p3JmJspU0PqbHVoR8QJ2hGX6u7LX40vmT8uCZ6WY58ekL4QW+s=
X-Received: by 2002:a05:600c:4f11:b0:486:f9aa:2b57 with SMTP id 5b1f17b1804b1-488997b3aa5mr59619705e9.16.1775232387122;
        Fri, 03 Apr 2026 09:06:27 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a0:6901:49a0:3a9e:c592:7d89? ([2001:a61:13a0:6901:49a0:3a9e:c592:7d89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm256313355e9.12.2026.04.03.09.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 09:06:26 -0700 (PDT)
Message-ID: <15d8dc67-1f2d-4df3-a7ee-2d093dd9a1c5@suse.com>
Date: Fri, 3 Apr 2026 18:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: Add support for second ACM channel on more
 Nokia phones
To: =?UTF-8?B?0KDRi9C20L7QsiDQpNGR0LTQvtGA?= <symansel@outlook.com>,
 Oliver Neukum <oneukum@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <a8008c91-52c1-4a5c-ac96-dd45f109c68c@outlook.com>
 <7ae48e14-0228-4bd9-91df-306dcd12896c@suse.com>
 <7dcc9837-52e8-4760-b710-403d464f908f@outlook.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <7dcc9837-52e8-4760-b710-403d464f908f@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35947-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[outlook.com,suse.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 632A5396164
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 03.04.26 15:20, Рыжов Фёдор wrote:

> Nokia phones have two kinds of model names: "commercial" (for example, "X3-02") and "type identifier" (my X3-02 is "RM-639"). There are cases when different phones (with different RM codes) were released under one commercial name. They look and work very similarly, but may have difference in memory amount, radio bands, SIM operator lock, region-specific SARs, etc. For example, T-Mobile branded Lumia 710 is "RM-809", but "global version" has code "RM-803".
> 
> Different RM-models have different incompatible firmwares. They also have different USB PIDs. That's why there are multiple lines with same model name.

Thank you for this response. This is important information. Hence I'd
like to request that you add a general comment to the driver with your patch
giving exactly this explanation for device appearing twice. Right in front
of the declaration would be best. We really should make sure we do not
lose such information.

	Regards
		Oliver


