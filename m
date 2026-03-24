Return-Path: <linux-usb+bounces-35408-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMnrEMvbwmm0mwQAu9opvQ
	(envelope-from <linux-usb+bounces-35408-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 19:45:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2231B02C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 19:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AE48301AA94
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 18:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D073B2FD5;
	Tue, 24 Mar 2026 18:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Nj6CCrMu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D533B19B3
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 18:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377925; cv=none; b=D+k04Cq84jIE/NJmfW+OFbI1DZqmBnKJqcTvOzf5qBEU+t0kQEZ4rRLrFA8vPpbAmD5rwuNi24rCWDT01IT2Kvnf3NYgn62miQyVmMEBHIsVukkiyzNZBXoiZUyfxNzi2GeCNkfxNzbjIy80fWx4MRj4zq0JxynNHbRXHXmzb3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377925; c=relaxed/simple;
	bh=zgIDjGBLHYRXKjHT62Y8zHCcmWlzgS1goIgHk7PM6/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAcgc/8/NPxci1qctwhlGqrK45GgYIBRwUkQIwVgxxBdVHzOzWt4ffPY5nfX37To4ZVhjYMB6lH9qaBT4NImoAUe2mdoHBetWnP1+XaqDl/JrEOPJsjhxjH5w/npTWHfsOGK5TQ0ykWbpWkXhQwqfifGjMLs+O+JDrsE/yG7tz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Nj6CCrMu; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-89a05955720so66024806d6.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 11:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774377924; x=1774982724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV3+ksbhWzQ3JWuKsMBNviGlAsd2rzdqL3CoeGDVw0U=;
        b=VhXPUmyugrtLxrHWZf/1ksmmpSq5/Uu7h5oSFzJHaWCt3a9bUxNw6kZYa4bU1Npgl3
         5PV3zG+az111Z0n//rghXktX6PlIjxkBjOoTM1D2hVqbpw6Do3rcjhXFJzgtu5jfKLOV
         O+REWf5GDvWRdlW41gMaHq8sAzz7ExLKlP8UhY14bF6V80+AFH+PXgptHef+O3TSqe/d
         0e3IhVBMSvz+MmCG1hDHXb9Lu2Bggk27FYo5P7JyVInwF5fIf4l1E1FD6veb8E4PZufl
         1FRf/aMgm48cJak3uV7HtE2GyVMF8pt72w+Q6lzsQ8FhBfyCzKGmxv9NXcYB2HF2eq+m
         HWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvCunF6unqN7geHZvihazkguzJOPYGTNQvAfew9O1GPqzmOFOsFmarjWlYsXQ2HPCg5IXfybSzc7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84Olr7Zx/shU75O4Kr9HxRH6cTJ2MzeiU4DBGc9qrG8H5EAZg
	cWWYRTZq1DLNrdOxku0eiWzDebJqTsenbj0AvblYiCr8ahLY68FSJskM+Ldsdx7P8b2F7W5JGyq
	px9LAuwtLUDDYFqqLampsqyG1UXzRVnw6g3adSlTXau/ZDVsTOe6SCD3qjpW5fSgFu4OkizlZZ6
	rko4Y69fJzmfbERAHyt7m1XEHfNOsyp7qtU3KyxsGk/gKsOS65+rMeRWRSEsS1NsUGOD6eZIEOk
	Md+uuMAiqZ1LQ==
X-Gm-Gg: ATEYQzzMZLoACFYgtFY03UPHr1E5gGQ4FW0wYJG0KY1qhlrE3xw0UWvclFFhDVGIlAx
	mvnk8fcO7DNqHf7OuNt3RM+OXo9nSC5dQluKihCiaJknCdvQi5044s3SfIgJY27JwaM1+7KJcQM
	93w1LNTVm7cumwwC6BgfxQmPRQQmLJ/dGLlD4BeXEVnPDdaUjpSaNUYwyyzj4PQ+bN0D910npuT
	NRaXTYjaudQV08unauPpiJMd/mSmgFlsExsWg634zlkFy/PbCFUQO4/mx5CwJpZmUry+KC1yrxl
	TDAnv48AEui/n3lOtGH9bfhjHmYjWa+aW8sn2lDpvRsJwcwasbiCAQuOePHzRfWFK50ndihBT3i
	1DcPs4i2PmZbtZelA/keSlzGzYNb/1DJlP/q9LpW8fO5UljjrbX417UEYeHuOj+OGM3bE5/4GzG
	8KbEEmHKq66POnX0hu1RFj1G7516uHNIXfMFyU7ak+9by89dB9Gv6OdMHvaA==
X-Received: by 2002:a05:6214:4892:b0:89c:3d3e:697c with SMTP id 6a1803df08f44-89cc49aca3dmr12054986d6.14.1774377923418;
        Tue, 24 Mar 2026 11:45:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89cc1dfd018sm1068226d6.25.2026.03.24.11.45.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 11:45:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd77e5e187so1248653585a.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 11:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774377923; x=1774982723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qV3+ksbhWzQ3JWuKsMBNviGlAsd2rzdqL3CoeGDVw0U=;
        b=Nj6CCrMuil+nt8xT0AKZIm5QdVA+sosb4LiMc+cxyx1YpTN2DqqjQKgbsz7QqPqhKN
         fcpBqlu5cLtExB7hds3pNeydqBxZVzR/zTA8Tm1u3sYtzzOYOZOmTUXSBRVS22O2f6E7
         XLxekBksIExr/atJHImahxThigT7b8sucdAxY=
X-Forwarded-Encrypted: i=1; AJvYcCUT7vKtek1StmUJKBr6Yhk7+4AHOQa8Bv7U922zm5JbfzymTtR3XC51vaaNXQN+xVmiFfQ7SAbQ2dE=@vger.kernel.org
X-Received: by 2002:a05:620a:690f:b0:8cf:c218:739b with SMTP id af79cd13be357-8d000f3b707mr94339385a.18.1774377922497;
        Tue, 24 Mar 2026 11:45:22 -0700 (PDT)
X-Received: by 2002:a05:620a:690f:b0:8cf:c218:739b with SMTP id af79cd13be357-8d000f3b707mr94330385a.18.1774377921695;
        Tue, 24 Mar 2026 11:45:21 -0700 (PDT)
Received: from [10.14.5.144] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc9088df1sm1144053285a.25.2026.03.24.11.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 11:45:20 -0700 (PDT)
Message-ID: <6c46d196-bb77-4a7c-aeab-d167747fcd11@broadcom.com>
Date: Tue, 24 Mar 2026 11:45:17 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: bdc: validate status-report endpoint indices
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260323121730.75245-1-pengpeng@iscas.ac.cn>
 <89a5cf0e-444a-42d3-b7cb-49ce2560995c@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <89a5cf0e-444a-42d3-b7cb-49ce2560995c@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,linuxfoundation.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35408-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justin.chen@broadcom.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BEA2231B02C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/26 12:20 PM, Florian Fainelli wrote:
> On 3/23/26 05:17, Pengpeng Hou wrote:
>> bdc_sr_xsf() decodes a 5-bit endpoint number from the hardware status
>> report and uses it to index bdc->bdc_ep_array[] directly. The array is
>> only allocated to bdc->num_eps for the current controller instance, so a
>> status report can carry an endpoint number that still fits the 5-bit
>> field but does not fit the runtime-sized endpoint table.
>>
>> Reject status reports whose endpoint number is outside bdc->num_eps
>> before indexing the endpoint array.
>>
>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Tested-by: Justin Chen <justin.chen@broadcom.com>


