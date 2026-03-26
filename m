Return-Path: <linux-usb+bounces-35519-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO6HKEt8xWnw+QQAu9opvQ
	(envelope-from <linux-usb+bounces-35519-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 19:34:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F155633A2C7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 19:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCA5930712C1
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 18:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635C33A6F15;
	Thu, 26 Mar 2026 18:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DbTWIhR3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD8393DE2
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549169; cv=none; b=hUkRbz6MyhlkSpdZ6dzshqJJs+FGbyRhrVP6wSbs6DjffmtZENgMGrnkSy6TMbFVxywL3L3nGXExk0eAC25kgjtkocVNyh1/hmHTCTq/oef9w4SgAzTX0sszMtBX8xQYtUIKFfvwnAiyQ/2Fwe8ZSxprwcvfOIhzb4l0kGi95KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549169; c=relaxed/simple;
	bh=V+CbNPqjY2+ian3TESqiXgpqQ/qwDQERSAQuBwHS4vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPa31q8NcjNCnNqaAIaI6Ikvg9BdC9Ll+qSsNbvTj8djgiUdAj8kJV7IcC9pARdh/sJ/D6QW8G6JeNEE4xbdLg+6dlRSD7+LHLPu2f4Baw3856G6RgoeOCLy7zZnAOByTvLlA+Bsl6lkvPER4VuI5RFLAXviaxsili70KK9t7WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DbTWIhR3; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d7fdb922a5so1055558a34.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774549167; x=1775153967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8fj29rOSYJGnGx20ARVQ7d7Af99h3bIbiRJIZmbp7Y=;
        b=DbTWIhR3ydYCIKT+JByW9lYXbzcGob1wFZILgxPOv81nGiY/2Lkc0jsFCuL2zWUkxr
         jUdnFOMVCIq5AFSsxSUkuvrgY42rsoZ+UVTtBqzDanFnHVihU4TfoLVCNJ9A6jtaNAj9
         ccOhpR9LnNRpbNhV+j2tjoCHbZkgC1Sf3FIIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549167; x=1775153967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8fj29rOSYJGnGx20ARVQ7d7Af99h3bIbiRJIZmbp7Y=;
        b=heZcKDCI5GTguTj7gaLFDzJ+P/prgjek+a+X49iO2BiNokCPpUZ6CKd0zWLSzWy41Y
         YxL7qku7KWfAFWxY9EBEYvV+uHS6jLyIv4ywT0SrNQ1m2z44nAe93HfJIMmD4nL8ULW2
         xCHVkjWz4x7bWbRmeCSE0oFVTIVz2q9ywIFBhFCtPT2hkvX6YZKiu/kJvMWFsu4Gm/DE
         4ePEpkXghYtLvkua33E2q0sEkaX1IaZrnrt4D+lG6gI1aBgJ5hSeIj0scXnIWjtWenen
         U9c7cq0Bob8YrtVcpv61QGEXu1RoMSJBdvCXrK4qNk90I5z0GVqWZ9TXm7dyvf0xrhN2
         aVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpUSY2QZ/3J/rso1XeEklRI7EGPNeYu2U90chR3hgSCqVAvoc/5UAZTvyJfjb/IN1Y4CFUadmoW18=@vger.kernel.org
X-Gm-Message-State: AOJu0YxapO5vNYSax1wA7mbVmrsqnpdtBo9qKyHMHJVmQXIyqD5CBtwq
	FRtsiElMihbtZ0xkRvDlj8WZZcmqaTbYqEBmj5QLzAvnjqDP1vHrnHbFJYq92oZ2Q9M=
X-Gm-Gg: ATEYQzy/FQJ8lY8lmIRx1lkCQWqKWXteIIF7iJCSYfCqXXe6NI6U7Yjmhhk2bp0H9rh
	FJ+WRe/f1nnRUoHeq51hJfnsfjU3laLjN0WW6F4/eiB2INLlBJ1OOQ4f6vaCZV/9XZ64Zg1tylT
	giPLkSjK0z0gYIB8pmwgw/RyPvAxpfLMTNSVArcnikZkSwvILt1JvKOsfRwLU9b06xXbMENpdE9
	cxBh+VvMV338QIf7Ka744n8urHVOgYKLdxOCHAjgt41Eh0tz6YKH0V7NCptNhIRVyRrOg4Nbhdw
	WAa33EMOLc1rLv8I2azT/uOPKMbAvdNCh0LyR+Tflp4udrQs/VfrMvrcUcuhLHxXWGgkrQJ+m3E
	At1Xv7GqVmIn6reEiMjc5Zik8D+tzJxBdfZr59qhkXJ6msSZAmaUoPwOPtXBF8nIfmLyxQIsBWr
	Hxs8yDPC+P4HDl7rXHoc2nq5kYJczeuqu5wWA=
X-Received: by 2002:a4a:ec4c:0:b0:67b:b0bd:8bd2 with SMTP id 006d021491bc7-67dff55d83cmr4967130eaf.59.1774549167454;
        Thu, 26 Mar 2026 11:19:27 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e0a9e1860sm2590726eaf.2.2026.03.26.11.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 11:19:26 -0700 (PDT)
Message-ID: <b3a6543a-9375-4e52-960e-3f8dc4be5526@linuxfoundation.org>
Date: Thu, 26 Mar 2026 12:19:24 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of
 strcpy()
To: =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>,
 gregkh <gregkh@linuxfoundation.org>
Cc: b-liu <b-liu@ti.com>, johan <johan@kernel.org>, badhri
 <badhri@google.com>, "heikki.krogerus" <heikki.krogerus@linux.intel.com>,
 "valentina.manea.m" <valentina.manea.m@gmail.com>, shuah <shuah@kernel.org>,
 i <i@zenithal.me>, tiwai <tiwai@suse.de>, kees <kees@kernel.org>,
 "christophe.jaillet" <christophe.jaillet@wanadoo.fr>,
 "prashanth.k" <prashanth.k@oss.qualcomm.com>, khtsai <khtsai@google.com>,
 tglx <tglx@kernel.org>, mingo <mingo@kernel.org>,
 linux-usb <linux-usb@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <7990xi1aonqb-79968wxve9t0@nsmail8.2--kylin--1>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <7990xi1aonqb-79968wxve9t0@nsmail8.2--kylin--1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,vger.kernel.org,linuxfoundation.org,linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35519-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: F155633A2C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 04:57, 艾超 wrote:
> Dear Shuah:
> 
> Test Report for [usbip: vhci_sysfs: Use safer strscpy() instead of strcpy()]
> Environment:
> Kernel Version: v6.12.76+ (with patch applied)
> Hardware/QEMU: Thinkpad E15


> Conclusion:
> The longth of the name is MAX_STATUS_NAME+1 = 17, used the strcpy copy "status-abcdefghijklmnopqrstuvwxyz1234567890" in name and used strscpy copy "status-abcdefghi" in name.
> Tested-by: Aichao@kylinos.cn
> 

Thank you for the report.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this patch up.

thanks,
-- Shuah

