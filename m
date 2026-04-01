Return-Path: <linux-usb+bounces-35800-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sA7uEQ1VzWk5cAYAu9opvQ
	(envelope-from <linux-usb+bounces-35800-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 19:25:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE7E37E9F5
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 19:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A515E3020A63
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 17:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA3C47CC91;
	Wed,  1 Apr 2026 17:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GBMj890R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DA37DEB2
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 17:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775064261; cv=none; b=Nx/GGZs5HR9Bf+5DPuPz8FbhUF8rlVnptUxogJTyEJRbO0IQUQubeXwljOk+9xl0p9VN/y1D7LRuh4w/glajOAkIALije58iUMLvZVSU9m4n6mgsGd5cEqnY5YUsY6kbbgDvFUVyCUuCza8Eut49RF4Shzbs+4x3fkhCOClXcfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775064261; c=relaxed/simple;
	bh=qVQKVZBz0MTMXXT3L8jbh8ljE7dPEalrrjj2yneqMsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTSmgmZTgyw2jA0DoiPILuwTPzhHCSNrYleahPzct0Sijx2SFjaY1tanLErCc3GACDKO4UMV9+tcWBRLCPRgLdvz7/fJ57zNZjm2fN5sZ9iIrV4WuyzHzLtWQDSkLrwWNmvUJ0HtrLip8Uxm0xGlOKwu4VfJSa8qd3moTJtcVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GBMj890R; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso12724855e9.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775064259; x=1775669059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKU2ZunSRFR2nbe/LptJhAukoIHGjJ9ZB7qHKKyexwI=;
        b=GBMj890R1gWZ/l8kdU1YtVddQ6nkeWETFJiAYLh/EWgEqDoBiRQe15/VgGLiHfcnYg
         IWrh736cf+85LRQcpdEfRWxN45dbDx3Yyf1S63amcH3qeXP1zwM4R14dd/wvuyNb5+jF
         rgIfowthu+4uaBzllPNd8eiBu1zY+R9ufSF6so7MLDLJhKjN4m8MUi6H3FRuVeHgyU8U
         QYSp7VPt6zJZwLi8nGhmqrgtG+7DzIF/lxUXzNDtJbEJRJCQimVFCjTiq/bfQ1KxMzgq
         rxMOAKGZvFeYdnQGZHsIrsdR/uWTiOCW2O60lx9kQbqYVAG09vOPCwvn8aCQUdAhOd6x
         oiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064259; x=1775669059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKU2ZunSRFR2nbe/LptJhAukoIHGjJ9ZB7qHKKyexwI=;
        b=jE1P4ajKyy+frVY98d6VBzwqAENfe3e7jIdmCwCbAOzdHWbURnrqoQWfqhSuYx6D0K
         JeZa2wK5POfOK3WNM2uIFuYlnoLpD2E6JXUDVWVO1RXXadYF/+dukjcIEUZFdqRbxHww
         8a1EcHMxZlpbfchzqNwXtxLxOrTNggdAVa+brKsNNTey9aM8pn/r87PtfHlHaALUJiHD
         0Le7pnafF2dVceTmnUBOL18jdv0/gUuNkvU7QlFQPbHP1vVEAQNTOsvnm8wd33IpY8EA
         mh1pRqmCyKRECMP+aWL1Ko6fccu8NF5yQ+WZyOJKqjJ/Xu/Axe4jeSw/ShLqgDUQ4pY1
         Rn7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIPlRy57HUk8ThLDU0kGCVaTgX8TWGVC0b6jpjREXAT6quPnv0OWxzFA81NY46QrpUsGT+/knLxUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vkF88mvKLwon2nvzb7uw7umOK3nKJmMAu7K0MBA3Ve4b3xmJ
	j5OKGQ/YPXydPqwpiw5C48i5RG1u2PRDVyYUT8TlXwXQS3ctH+lJeLNi7HEiIi3oZF0=
X-Gm-Gg: ATEYQzwASrd10njz27FjONbA3m3p7nVvKLD645BFamIRO0/PK5PZ/PseY/XUFeN0mK0
	cSMubw4tX2uWOt5qvv8aNZ80SmGY0rwRqr41+P98iXEgwMJ3xCXe1nyvDpz2Zvyj87MPR7t4Ied
	yAJzb2IdtSUb3B3QaPQAsloHdi9/107pgfxoZTO935xLb4uMxIlk+83MIVToTYznkZ1r8qH2mlC
	5gLsoy6cxBqYGkaSMcFH51LRbZgvvNXF9jh8s4RZ3bEDETKTwe1ChoOOSGWcreAiHXfAPK2Fc/Z
	HMBdO+b7/BOe5ps16sGwr4sIhXaVAwPp4OsdU/Ei9Har+TeF3zWDvdUGwP8Ms5LpNs50ug8P8s9
	o2yyHHl9Cc622IBIW/WY/xLCMvYYRjNedQCMC/MVT74f4FlgZoLe1s4P7hwMj/14A/VgFR7LShv
	TR7vWGn6pg+JkvC4FlsX2ZusLNm1MYKeFKaBy+6318LOS56GVzcfVab9qBvLV+vJN3fAxBqnVuK
	/I=
X-Received: by 2002:a05:600c:450e:b0:487:22ad:403e with SMTP id 5b1f17b1804b1-488835d17edmr74956605e9.14.1775064258714;
        Wed, 01 Apr 2026 10:24:18 -0700 (PDT)
Received: from ?IPV6:2001:a61:1391:2f01:bda6:de6a:c701:93e? ([2001:a61:1391:2f01:bda6:de6a:c701:93e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887adc52b2sm48393685e9.12.2026.04.01.10.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 10:24:18 -0700 (PDT)
Message-ID: <8fe179bd-417d-4624-9e35-04c75978dfc8@suse.com>
Date: Wed, 1 Apr 2026 19:24:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: usb: smsc95xx: suspend PHY during USB
 suspend
To: Parthiban.Veerasooran@microchip.com
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 piergiorgio.beruto@gmail.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, steve.glendinning@shawell.net,
 UNGLinuxDriver@microchip.com
References: <20260330134222.67597-1-parthiban.veerasooran@microchip.com>
 <20260330134222.67597-4-parthiban.veerasooran@microchip.com>
 <1c660862-de30-428d-a772-8bee9b990a59@suse.com>
 <2e9bc390-c870-46a3-b673-c7cdb5187cc3@microchip.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2e9bc390-c870-46a3-b673-c7cdb5187cc3@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,shawell.net,microchip.com];
	TAGGED_FROM(0.00)[bounces-35800-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: DBE7E37E9F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 01.04.26 05:18, Parthiban.Veerasooran@microchip.com wrote:

> Thank you for pointing it out. I agree with you. I didn’t note it
> earlier since the issue did not occur during my testing. I will move the
> phy_suspend() to the appropriate place.

Thank you.

>> And, as a question of principle: Why do you suspend the phy
>> in suspend(), but take no action in resume()?
> 
> In resume(), I did not call phy_resume() because the resume path already
> invokes phy_init_hw(), which internally calls
> phydev->drv->config_init(). This reinitializes and reconfigures the PHY.

Thank you for the explanation. May I suggest that you add a comment
to that effect to the driver with your patch? This needs to be pointed
out. Your code as such is fine. It just needs a comment.

	Regards
		Oliver



