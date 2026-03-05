Return-Path: <linux-usb+bounces-34036-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKnjHDreqGmVyAAAu9opvQ
	(envelope-from <linux-usb+bounces-34036-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:36:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E67209E9B
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C7093021EAC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 01:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC58212B2F;
	Thu,  5 Mar 2026 01:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEaWgOx0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE51AF4EF
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 01:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674607; cv=none; b=ZC9NDe+zw7SYx+8qYRjcTXUI5m1IVYcon9X/QD4xczCMjxui/Db8PoRVQfHIdVAC5nuxYIQaq9eRy9P8g+ThoqIuObYd3L9wBJnNWKUUvvsx3RhQAjYLjm30c2aL9zMKNoK0EXTAveSR6fKVObzGwSgPIZA6Ux83SXXBD/JLNGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674607; c=relaxed/simple;
	bh=E46tJhu+6s81m4gUea+xkRGYMYCZVoGrL+k8ZcSdvww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9uEC+AitawMS/gLOSElOeHDA8g4vDdBrt0i2uYXDMd7hkaloXUc2HwW/cDMzlKbpKE9eWjgq65ofHxxSNLutk9AEOS4WGTQp+q2weTIUFCujZ2JajoP2rw9pwB9gVmXlDdDualU0khHBvyH04kcYCN3ZtwkJtm+1wmWgPcg8FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEaWgOx0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35982fd8910so1930104a91.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 17:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772674606; x=1773279406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqIa5loS+UBDTN9nPFk4k91mm5BOMoTKsoDwc/4GnjQ=;
        b=BEaWgOx0yIYU38iWmK6xbZ7mxR8VAsQy+CE/tEK2OFZhNnsns7+LmZQDDzOBfSaGEG
         sOUUVWvRk3uhW4OTgTBVf8+Fkw/N6uu91po9o4iIVvWb+uulqrfnwuFMwsDskuezRrA8
         yoHoV0kDXbQlh6oSUPo4rzVFRZAXaRB0EBjOSp4uRFriaf9dyyOFnVk6B/2a1LlsxogI
         AB4Vt2wGDqvYtyHYd28TMcdbXtwywul50+rpULRBfSZM/K1YvdCs9HBVQtjLkAzmlUdX
         IyLF1sr0iG/pnlefcwKu7SOCKFrdV9TinIYKBOQJ/D+FfMIiiegQtsDCEmXGMc5RA/+c
         IR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772674606; x=1773279406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqIa5loS+UBDTN9nPFk4k91mm5BOMoTKsoDwc/4GnjQ=;
        b=s7iybR/yZIFeoiEMFs00TNsFPuERGNzAnhrGDDwU+F4KKd4hzABUCFcB60r6bhIwyV
         maxdctH8k0BMFXwXFkyu5vXWceANCb/+jt5wN4+SpBbteSPBj/BHPBUmqiz+ytCNAD6c
         EXEcF8BysEDCWCde+1AXeHI/a9t7yTd/T0dhhyI+4HDUHbJ573vriK2zOr4oCF2ARlEg
         DEssNLIih09vEIoTtK/2WR843/VihDFi1fezhlkcIcCdCu373U8rBFw+Z5DM3RcVXLX8
         arlftA1oXOdwT+S/yryzLgKIu0JGNgrs8vRFxnNGISm7FHEZzplDEH7gmDkZ+Mk9HUMZ
         czrw==
X-Forwarded-Encrypted: i=1; AJvYcCUpnitQkodZFucd3oKXj6kzQ9xHw39JpgqjT/WaTuIxfQtEhkQv0wLiaGdmsRlWSjzS/yqv589Gyuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99iZcvVwN1PfHnY33JZXGitniH4alpHxH8UO7Fv5TAXSMCmjW
	72hHk14sErqly0tM1/uK6zHKbzqaXTEjAkvjPGYE8I2sprRRIJRArHSV
X-Gm-Gg: ATEYQzzqGQ3NbRC9WVrmhEXHtRBFiqFScwdybURl29fjo0uKDWWMuAoLmI8X/Bx/WZ7
	wgmSF69J4sjAWBbqRIvWK2pnUFat8QsCEMJGIJ5mO9AxV9dFkYKk14UYWICymJh0cCq2H4ZVR4t
	muzxL30sHOGfLq0nBPa9W/VPVLd+qYEwNpDQG4K36GULtRIJcQiJBX1gScjjxLRpIQ/MQC5ta3H
	78JbUV7okPey696nSBG0znQ3VIP65egIcIOhVrzvSQm5sMS/WA52R2/11o+GfjefTaYk2lV8/Pk
	jvduFu9m/vKuJYTVb86k+OqHEFN00Bc2ilFgS1KwtDA6TwmutepmYvUMNNzjglYZchHlLjwUg5b
	6n1QLu83C6LOaQYWbAkkk4cHUx7eL3uJESq06ykfqz8aXmhd6Y7o/AajofOjpPfGQUVse7sXpJe
	Imql43nsUDL6EUnfMUEr+OqypOV6ot1C6qPVq447Uj9+r9Ydz6m/6LhIX1udrCH8/P
X-Received: by 2002:a17:90b:52c6:b0:359:8d38:cdf5 with SMTP id 98e67ed59e1d1-359a69ae18amr3527827a91.2.1772674605890;
        Wed, 04 Mar 2026 17:36:45 -0800 (PST)
Received: from ?IPV6:240e:38b:d99:bc01:efca:5b50:aaf3:bb27? ([240e:38b:d99:bc01:efca:5b50:aaf3:bb27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d554a2sm179816a91.6.2026.03.04.17.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 17:36:45 -0800 (PST)
Message-ID: <9e1d404b-2145-481d-930d-c3ba5be0a520@gmail.com>
Date: Thu, 5 Mar 2026 09:36:39 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add Chinese translation for USB subsystem
To: Greg KH <gregkh@linuxfoundation.org>,
 BaiKefan <baikefan@leap-io-kernel.com>
Cc: si.yanteng@linux.dev, linux-usb@vger.kernel.org, alexs@kernel.org,
 dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1765180570.git.baikefan@leap-io-kernel.com>
 <20260303194105.00004696@leap-io-kernel.com>
 <2026030412-mystify-ride-9103@gregkh>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <2026030412-mystify-ride-9103@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D1E67209E9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34036-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Baikefan,

Please rebase the patchset on latest Jon's tree 
(git://git.lwn.net/linux.git docs-next) and cc to USB maintainers with 
all testing you past.

Thanks
Alex

On 2026/3/4 22:51, Greg KH wrote:
> On Tue, Mar 03, 2026 at 07:41:05PM +0800, BaiKefan wrote:
>> Hi Yanteng and Alexs,
>>
>> A few months ago, I submitted a patch for the Chinese translation of
>> the USB documentation.
>>
>> Following your suggestion, I forwarded it to the USB subsystem
>> maintainer for further review, but I haven’t received any response yet.
> I do not see the forward to the USB subsystem maintainer, where did that
> happen?
> 
> thanks,
> 
> greg k-h


