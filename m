Return-Path: <linux-usb+bounces-32635-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKl4OaBMcmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32635-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 17:13:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D67869B3E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 17:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 965C330000A9
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D066325700;
	Thu, 22 Jan 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSVXNwWy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB76A1DF271
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097501; cv=none; b=mSuHuub/46PWqL+HBDYF8JDY0PWMZBSs3OC18hseoOXD4p4+4indF8vHCFBaz4uzKUhYRgPTCoTGYNiERvEao9V3Uuhzco/A24JUXK30YZcCXD6+0GK2aLtOGoOsuKxd6qx4ScFJwKJ6W5qIpxG4Z3KI79RwTa1DsuXbmf1bCDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097501; c=relaxed/simple;
	bh=lLVRoQ/NdVyGPvDLVE+VWuhnO65Kp7O9ikxAAXAQsz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGpO3ss3mKfr3q4XR7pCkcmNwdvvrHKUI8Spo6LFKyqIombjSWIbPwIjRpwhkHN5FQn+OG2Mk4bO6x8KamPNeVYFnkVBJ+D7pqt+kz309aIpDcOs34yCPTIjRtfW6GmS25dxyvmkcB5ed7Xo0IOZB9d7kalhjMyNUAGOn/+fADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSVXNwWy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34f63b154faso149504a91.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 07:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097495; x=1769702295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gkBS9ZH0cgt2rb2Ca65SWOiR4MnHFgrUTY9/ogRpvig=;
        b=OSVXNwWyscojlziQg760c2lk4v1W0IA+ynoJI9h3kXDapZ144RfbRgtkNlb7fRNK1X
         wBRDSJt+KRNtVUF3mA+QOb/L7PN0SD7XIXBnr05BHGESAnZjjPcod9rVjv8HIVP/TQnJ
         Dsm9avysAXsCSFWhuejdgEbFfH2/+QMLNeO5frC0g3qnCQryMIiZSPwsrDv7CJLAGmsk
         kZJWpBCfeHAF+zj+RGPkiCZprBFDWRPPcK4oCGmHsozihkfte3PR5Kgaah5rG8wmPgKL
         qArMk5vw6+JVkF/AJj+hr9RtbcnxtY/2Qs2bKptBU+o8NXTWLdy0A0lnO+uUjRxLuIgA
         Z/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097495; x=1769702295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkBS9ZH0cgt2rb2Ca65SWOiR4MnHFgrUTY9/ogRpvig=;
        b=IqVl4Ftz6ZGlfB8lx37iLucLiPAlhkuBHiNR0fvWSHBmuQzAKKPRW941haVHj1JBVs
         KUBkTptI/UXodsy3Og5jNVSwmc0glseU13lqdil1YNM+bOEeT6Zzac6gxRnKcIfP2AYh
         zdSH790V3VfewDZNmhoZaSu2c+1hnhFrKTnHZzfglnJMDuIBrJiqLxgMGRqzJM8kDdpT
         oLB5RfM1GcT93lFsPqmC3SLpgublKiBybzErVMpE+XX7BbU6GK0zkpedweSYunqyhQG4
         R3uuCrEXmvzyOeFDzEDxMmmoPttBSj6rQ/DGAj6HSl2cIVfxmoJXWBpG3ughCqxsNmN4
         shdA==
X-Gm-Message-State: AOJu0YzG6bGvcN9eGurFzGDDOMdkXTDNpmZnzwJ9aQ3orFTPXiWsPkdn
	77De1AR3Ht7D4rAO5SCy5wmUCiuNONo2mkAEuS5CJ5PmeHAWG76B1t2E
X-Gm-Gg: AZuq6aJj8VlcuvSGC1gosOWi/pngP3Sse69Hwo/wp8K/XyWs86OtpMsOm9qTvEqw0Ba
	/yy5FHuf9Jrd/G1JYzY4zDtT4qo32ZynfzlkVfIBzoUvwdFZ8Mg9h0LmnkJp8r9t8EXoNyzJqUU
	RaB4Vongt2bt48WgIrjKVrFoYndg/QZkA9pj3SMQOK5FmUBvSM+rzpo16FtcnwfcBPRZlxIknxI
	jqjHDBzSbNNqs9TyJHsSlrq0oQZvPBQKMBhqwkFZnbi2WMv4SUGYUzf7Hi2yFDBzzm7vnpSNmuN
	H9oTsN/hJI5NIanB3CT4o5Z1NYFh0Q3Ty9gdCKpoXCFb4VupZTskoLWP34pTR0PWKL1KDQ99jFR
	s15h32XqVwU8apoPAC4xJ/2S+VbIA5n9KxVuE98NfOFStZZw0eWCAbM9fgagOx9CWGZj80/uouD
	V0ObiuOXXkTg7xD1M72dgO
X-Received: by 2002:a05:6a20:7345:b0:35e:11ff:45bd with SMTP id adf61e73a8af0-38e6f7f2482mr58696637.5.1769097494810;
        Thu, 22 Jan 2026 07:58:14 -0800 (PST)
Received: from [192.168.1.7] ([159.192.80.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-821978c2f84sm2813997b3a.41.2026.01.22.07.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 07:58:14 -0800 (PST)
Message-ID: <fa42a103-3b71-4151-b44d-573452847f6e@gmail.com>
Date: Thu, 22 Jan 2026 22:58:09 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] usb: csc-acm: add Infineon/Comneon modem support
 (1519:0020)
To: Svyatoslav Ryhel <clamor95@gmail.com>, Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260122151746.7745-1-clamor95@gmail.com>
 <20260122151746.7745-2-clamor95@gmail.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260122151746.7745-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32635-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larsm17@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D67869B3E
X-Rspamd-Action: no action

On 2026-01-22 22:17, Svyatoslav Ryhel wrote:
> Add support for Infineon/Comneon XMM626X modem that used in many Tegra30
> devices with GSM capablities like LG Optimus 4X (P880) and Vu (P895).
> 
> The Vendor Id is 0x1519
> The Product ID is 0x0020
> 
> Output of lsusb:
> Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Hi,
please include a full lsusb output, ie lsusb -vd 1519:0020 so we can 
verify that union descriptors are missing.
(I have seen a full lsusb output where they are included.)


thanks
Lars

