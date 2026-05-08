Return-Path: <linux-usb+bounces-37154-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE3UI0gj/mmunAAAu9opvQ
	(envelope-from <linux-usb+bounces-37154-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 19:54:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E76DF4FA3FB
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 19:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 261A93011F13
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 17:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D24413236;
	Fri,  8 May 2026 17:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="P0rY+qLi"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster5-host5-snip4-4.eps.apple.com [57.103.79.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A52FE056
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 17:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.79.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778262523; cv=none; b=cOpB0LhlPXyFN7cG9GhcYRA0NPPisqS/AIzd7BkWbtAGx3AiEWOG+kLeuu9W/CT5GnjrU9ZO699kfW7lL24/1bUL8M7z+1mTTi/jOvtfPsmgMeMG+Ipi0s2dcJrgoHgQGiA3qS+lawWI2yBj9LrxZt7uag4tFPLvvHhBxSEPYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778262523; c=relaxed/simple;
	bh=bHw7HTwpfOq3QxiJ1BuUqK1tzCiOsxQO9p4QQ4I7pi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJ5b5sI/dlG8UcWM4jx/h3Bg0vOuKlHiTBnRBTybs5G5vCCQUNEaLxjAYHhQXRVZFu0Jaqw+rkd6DmyF9cof9czfwdRDUKQHWZnu4FneGWRDzLA1xxufyhPQwYcUKVZEl6CwwB98ggnS7pXosUiU3+uVoQTKzCQ1MhOLVP0OUI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=P0rY+qLi; arc=none smtp.client-ip=57.103.79.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-7 (Postfix) with ESMTPS id 3192318002F5;
	Fri, 08 May 2026 17:48:40 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhJBkMDRQVJF0wBTVIPDxhMCkEUWgpcQgtJAS1eCF4fTBwdDlgGEhZdRVsYRRlLHVgWAV8GWXIZWhRcGFNFUR9UWEEOCloBUFEdXwIKBEcEWxdGA1NFQQQXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PGVoUXBhTRVEfVFheBFNWDhIBSwRfBlkKXVpBAV8aX1BGC1UKXFReH0QPHgtZD1oKQFsbBi1eCF4fTBwdDlgGDFBNAUMICgJRHFYNVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778262521; x=1780854521; bh=kHvvy5yxS7CNw2T1Cpc3tHmZrh6rKc5Q3rWxoahWoGI=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=P0rY+qLiJOhbkk4DD57e/fqrCGypCEtIH0T54h65TV6EmTxEUcPg4/Qo3Iy7BBOt+ykZpNQm33eHdCAXU7t5p+m5jGc9eO86MgUC+P5esZuQh3woZ1eAHDn6pOnPhDuw573yhgdcusab6Cx4caqRTW/rtZinwFkmITTsFw6oher3j1oVRi7x5+74TBLF0w5k0fp9T8oTRexRy+ULf2VZ+67F9H32uNP+AEeINXZYL5PPYvoE4dKrpctwSdx/cnDF2nNDXG875OdEfQsb30V34uvYigeu483UYhDMWMkmUyEFxrk+XVPz5DS0hU6g72APPllIJbaNkBWsxW01G/qFcQ==
Received: from [192.168.89.2] (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-7 (Postfix) with ESMTPSA id 2D7D418002C1;
	Fri, 08 May 2026 17:48:36 +0000 (UTC)
Message-ID: <b8372128-c922-4b62-91c5-46f848180bc5@icloud.com>
Date: Sat, 9 May 2026 02:48:35 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
To: Mario Limonciello <mario.limonciello@amd.com>,
 Jihong Min <hurryman2212@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508143910.14673-1-hurryman2212@gmail.com>
 <20260508143910.14673-2-hurryman2212@gmail.com>
 <ad41d70b-e9c0-446e-8bd0-4528de75b592@amd.com>
 <0d518d40-e239-4d93-8e71-0d2e140f00ca@icloud.com>
 <966c9e07-10e6-4abe-9cb5-77b974f31302@amd.com>
Content-Language: en-US
From: Jihong Min <hurryman2212@icloud.com>
In-Reply-To: <966c9e07-10e6-4abe-9cb5-77b974f31302@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE3OCBTYWx0ZWRfX935Lm/qcOlJ4
 Wd9FC7bHZcNIWRmEu4awLvUwSbEm2uMLs//2yZT8sgY4kYWdfpnwgSmELukQA0CfCZ4bUuVuD0Z
 U+k/FjEfI8w/y0wKB+QhldIyZ1X1/5RtVcxAOGQQXndpLxzrt/yF6RADdaMcM4j1of9vEBdDg5g
 g6tzmp/kz5P8i872ylvf4UjnucFwADrfm1DKeJcE5z9yxsKd4FS5bAQTofOjT4XOLuIqQS8NRHb
 XMmWo06QZmHmKYbEnJOCbxx8WV1a2ArLy2Af4qhzA2V8lbbAvuT5uSK57oZsgMiFd4+hvPcv94o
 euha7GuwlZHsxJyRk3WkUIOWQ+xwFljM5rpmL/xL/HyPmrhFHfxx9TvEQSTx6I=
X-Proofpoint-GUID: Cd0ZLK5VeTSlOhUfl_RtlPeOkMoRsz_y
X-Proofpoint-ORIG-GUID: Cd0ZLK5VeTSlOhUfl_RtlPeOkMoRsz_y
X-Authority-Info-Out: v=2.4 cv=GJ4F0+NK c=1 sm=1 tr=0 ts=69fe21f8
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=5jDBv52wX64A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W5yn_su87cR4V-zVC3gA:9 a=QEXdDO2ut3YA:10 a=PgRulw5oR9JgysbTFEid:22
 a=oa2-kN79Xhin27rcel9q:22
X-Rspamd-Queue-Id: E76DF4FA3FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37154-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linuxfoundation.org,intel.com];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[icloud.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@icloud.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icloud.com:mid,icloud.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

> Something else I was thinking about while reviewing this series.
>
> Promontory 21 is only on AMD platforms and AMD platforms are only x86. 
> I think the Kconfig should be conditional on AMD CPU support being 
> enabled and X86 architecture so that we don't bloat other 
> architectures with dead code that will never run.
Agreed. PROM21 is AMD x86 platform-specific, so I will add X86 and
CPU_SUP_AMD dependencies to USB_XHCI_PCI_PROM21 for v5.

Sincerely,
Jihong Min

