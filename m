Return-Path: <linux-usb+bounces-34084-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJmMO197qWkg8gAAu9opvQ
	(envelope-from <linux-usb+bounces-34084-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:47:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5BF212036
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE1E13050261
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 12:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48B639A04A;
	Thu,  5 Mar 2026 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WHQNoay6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB88239E172
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714676; cv=none; b=u/62RW+HxopOkHtkGPX1KH48QlVdEl1fFuGqMHDEzhiBLD7u5IhTmPxM0tuFpId93WcPSB1yAKV6YEu6/uyz/JwZAI216KdIK3/ROI7hc6b4gWFW1gIdgyKskP8JM0SNVIOg3Jqn4bQh8TmPuaqHSom30aahnCtykDu4u5TxtLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714676; c=relaxed/simple;
	bh=GSag5Q4jCngGqf98CXuJLR1x9DuqSRMDC68HgCORpnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qh+nKUYgkQYsx/saPQi+OMnSXdTZ6vtOF4wXG3PelOiaO4sypqj2/kGaNEpfA9TIbBgpM4lB4ASowHc6/jpAN99T88MszHXaTkybdOUMuo5ivweG5qmY/vF9pH7xQp9VwIPD0/Ia7XpvjWcRHeHYUFGmyoOXEjgg8EtNjptFcBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WHQNoay6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4807068eacbso67098895e9.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 04:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772714673; x=1773319473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCltzBpa6o/UQP6jnCo3U251jlEDoBoIotp3CYCoQ0g=;
        b=WHQNoay6jvYiv2aA9GsH1XIN/QyT2hyxJyCY5K7lOtLd2UNmr9xT4u140F9B9Mp5DR
         efpuCTh9I120nVEOh8rt2i0EfKDYVpQoN956LAvRB6lySmgrXMNTGVRXHsjv3Tbuyvsu
         JyzJeJPRuQWCjrZRZiZZZ+z7/QIkRdDau+X6tompzzzRtkoz/JbNZdW63n5xvFZ/sfeA
         mLO8LypWKCPbxU/xjs/k2lw2IdHd6uyoNL+CWRM/tAHwQiQ0cx0hem1UctoyrZi+i8aW
         ui5M75QDyGMn0LLio17fIwK2q3tduZSkbPz+tjHBPy4uduwvnpvjupwH5Tbur2qDYIeT
         Dobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714673; x=1773319473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCltzBpa6o/UQP6jnCo3U251jlEDoBoIotp3CYCoQ0g=;
        b=EOD6ghD9B9gxQMMoE4tJNlg/hqBx2YokOnOvZt1DpO/p3viRGx9JeImpHpz2iv2NXg
         I4qWe2Jcq2wnZy83wYYr8PCPVLbDs+XdTozZWY8j8P4DJINFo8/t30g9vUOyf5GVUow/
         w2W2rCDORb5sqKkpd4ndlb7jRmgQFicGEKDWAPvs+OazN3MdgdOh7fqxSs6jcPFCFIZP
         WNlgC1U8z0nZrX38JK1HmxjlbZC8XrKwuLH2Ih+tD+Djdh64gBm4ODKHhvshVG2wBqtY
         OEHkE95DVfnCVhmKmkSdy43niCMhKBqqOrKgUF4v8eQcr8/LDhHRax4nutSZUYFckPTA
         RCag==
X-Forwarded-Encrypted: i=1; AJvYcCVZFmPLBnpmCrK+VBj9RK5Y+5TwZyCTIOXoj90T4rAYBvlSwgyw+5E52HeQ67++dB6lOpfDbPY4Mxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMRN8Yx0phQbuZDI6k5nFBNNqIstIZHqyKwjpoLpg5da1Etqf
	Qv5TQeJGvcbqU5mOs5ZIM0sBNvl6EzqiLmXkv4MuMFCbMOW4aDFNfoXtJDHBuCAgUio=
X-Gm-Gg: ATEYQzyUKOiHPzgCWGicAVqjKIZbtO08cYiYbZw4VKtapnXaR+Z8EFzanYcZqHr1tcM
	8j0D7OvwLzc0vxPKVGICKc9/mJzUTYxJ94AXymdZ1UofrOXVbRnVzOs7Ol3ciBv1EJZviYBnMi0
	p1bygrP/6DY1yjyc1rA/HMXx2beh1LrsMvYaZ1NQgRlLBbJsGmJXq1X0Gzakr2+g0eb2oEtseh2
	Y5b5Fo4anbdLRv/qt1K5HQc8GeYVBW/kEaCy0GL3vDjuHxKAhvXXc4fDPS8LKGXvT+er4gPKIjH
	tExZgRtoCUDSE/Ag2gZ9VS0AUXrQoTFQ/GvT6eo55I+R15NxM/oIr8LSCxlcuhbIdKKc14m27Jl
	TQah9h0L3F7n/bK+xrGG7qobcN9ys6wFBY7joeGA8NoACsZQ5UNOH/xkHp8Ynccd5zyOQVftVBK
	tpuqahRanJail9H0aYetyG1v+LkMTpcI81YmjnYvSNWkPyypaqAkudxPAI4rTcp7m8FNQ=
X-Received: by 2002:a05:600c:4503:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-48519899450mr91113005e9.22.1772714673216;
        Thu, 05 Mar 2026 04:44:33 -0800 (PST)
Received: from ?IPV6:2001:a61:1363:9e01:43f1:e533:276c:e9a1? ([2001:a61:1363:9e01:43f1:e533:276c:e9a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad2b26dsm41681205e9.31.2026.03.05.04.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 04:44:32 -0800 (PST)
Message-ID: <678e1fc6-356d-426a-aec0-f0bf46c7d3af@suse.com>
Date: Thu, 5 Mar 2026 13:44:31 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
To: Gui-Dong Han <hanguidong02@gmail.com>, Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, robert.hodaszi@digi.com,
 kees@kernel.org, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>
References: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
 <f8c304be-c061-4656-b7ba-83150c2b8746@suse.com>
 <CALbr=Lb6Vir4+O-=8-iL7M8=Gqgm=VUp6s+XGVC75QixFaSmOA@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CALbr=Lb6Vir4+O-=8-iL7M8=Gqgm=VUp6s+XGVC75QixFaSmOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3D5BF212036
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,digi.com,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34084-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 05.03.26 13:28, Gui-Dong Han wrote:

> Specifically, wdm_read() accesses ->length and then ->flags, often
> without holding ->iuspin. Similarly, wdm_in_callback() involves
> multiple accesses to both.
> 
> I am indeed nervous about this pattern. Without barriers, changes to
> these associated fields made on one CPU might be observed in a
> completely different order on another CPU.

OK, I rechecked. And indeed it seems to me like setting WDM_OVERFLOW
and WDM_READ could be reordered with respect to each other in
wdm_in_callback() and that must not happen.
What do you think?

	Regards
		Oliver


