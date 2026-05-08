Return-Path: <linux-usb+bounces-37155-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAB1GEcn/mmxnQAAu9opvQ
	(envelope-from <linux-usb+bounces-37155-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 20:11:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B654FA6EE
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 20:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17BF3300E168
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 18:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3095372EFF;
	Fri,  8 May 2026 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="nkFuTMQD"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound.ms.icloud.com (ms-2001e-snip4-11.eps.apple.com [57.103.73.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FDB274FDF
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.73.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263871; cv=none; b=XBT1tZnM8dYUjOFqcf9qpxwan0V7WxAzsTVYRb4o6LMchU0zwN5bjkgmWezxf3daZwIOn99Zsv8YQbIF2yyk8i29pNMbrcJ9dCcnBr11QkRD4cwLFTBscTIAUK95DBuSW6Pxj0AmEGA1tJo5bEOE4EHn/g1Fb0WbiOQZPs9w1yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263871; c=relaxed/simple;
	bh=uhoEwFpD0wLLc2f6/ghy4yzGQTrFwfEiWin1DsoyXDg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ihUPhEz/22uDIdgBSDcAfzkLa6W3xo/RK7kuZMvumSajK2Nze1XiTISZ9STv7cIHJC72IdhgVvvs8lKHPPhyMT3ZGFuROQjKtyZDRs3TmoKaWgBH4ucR2kwCuwZAltPZeUvG2q9FbLFUwtaICwgVmeW3CM6gaN2VZqsk4w4a4Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=nkFuTMQD; arc=none smtp.client-ip=57.103.73.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-1 (Postfix) with ESMTPS id D77FE180044B;
	Fri, 08 May 2026 18:11:06 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhJBkMDRQVJF0wBTVIPDxhMCkEUWgpcQgtJAS1eCF4fTBwdDlgGEhZdRVsYRRlLHVgWAV8GWXIZWhRcGFNFUR9UWEEOCloBUFEdXwIKBEcEWxdGA1NFXwMXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PGVoUXBhTRVEfVFheBFNWDkIPTQQIBgkFXQhKBQkaX1FEW1ULXQVcH0AISlJbU1hUFlwdAC1eCF4fTBwdDlgGDFBNAUMICgJRHFYNVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778263869; x=1780855869; bh=0mjrF1GTIkE+Ezcb/ccqXnK0O806odp0Xc3hbwPBEkM=; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:x-icloud-hme; b=nkFuTMQDJ8l08ZZ+Bhzk8a24C9DCGNM2eGCagE5cdFQRV9kjTmLrxMnnxQDHthRPosYB66SdV0fK9KQuiAy1RQdZK6zFGLt582R9nK75+n7zPu1sg1kRpZ8AhenUJzQ9lXBTCEwsWREk3z2XkCNw/L3sGEUUPpFA0l8VnxYWJhX+Qs/7aj5CSJhRJjVHFfokZz1MyP2ZSSXGL+DLbaJEPXWfF+eHezqGiBIr4CAJ+TwBDAlGIQfc4w/3RZybDZlkeWHVW9wun0i5TU6y3zePM35vOsqP424Jpe6L9emveubXnMQRQUgAA8kbuMAsR26aBCFgmC5V/qhPOvNa3c7fSA==
Received: from [192.168.89.2] (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-1 (Postfix) with ESMTPSA id E513A1800152;
	Fri, 08 May 2026 18:11:03 +0000 (UTC)
Message-ID: <2657e1b7-126d-4c4b-8027-012a6d3ffee3@icloud.com>
Date: Sat, 9 May 2026 03:11:01 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
From: Jihong Min <hurryman2212@icloud.com>
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
 <b8372128-c922-4b62-91c5-46f848180bc5@icloud.com>
Content-Language: en-US
In-Reply-To: <b8372128-c922-4b62-91c5-46f848180bc5@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sl9rJsX7eR6qgLM1qVLBH4gVb3t01cp7
X-Authority-Info-Out: v=2.4 cv=f79FxeyM c=1 sm=1 tr=0 ts=69fe273c
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10 a=5jDBv52wX64A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=cZtEhlklJ10v6u5TLhAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sl9rJsX7eR6qgLM1qVLBH4gVb3t01cp7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE4MiBTYWx0ZWRfX+B2wgVjg2Q/r
 RNN4afRGFiweI7ch7aU7gk8wbXXDLe7vpVXTQNRBqgetOdAFvRiXZ9ra0bHEAv7FsvjsFaa52UR
 aMDmjdnMfYNec17kLaG1ZkJqUN3q/IVNmIHbhsVX1ZU1VbAq5oIK2S3EV1HayXWpchk75te3iek
 plxGGzivtAbYTEQ9QV/4SS6r0GMsBeRNOsgYI2E3dmn5U1pQLMutx00UVOdI1hlY9pMjQm2wYef
 Y3inbE7domPmONMWSIDhZTF19tnOM68r5sZ8BBZ6wUOnY66gS0qtQMVSUVPhxlsiBMrB9Idfzww
 LeRFlbox0YGi6iTwrG57y60ahU/owMXgxl98lm/hFHDjG5s184IaQFpHBZHBIg=
X-Rspamd-Queue-Id: 03B654FA6EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37155-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linuxfoundation.org,intel.com];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[icloud.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@icloud.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,icloud.com:mid,icloud.com:dkim]
X-Rspamd-Action: no action

>> Something else I was thinking about while reviewing this series.
>>
>> Promontory 21 is only on AMD platforms and AMD platforms are only 
>> x86. I think the Kconfig should be conditional on AMD CPU support 
>> being enabled and X86 architecture so that we don't bloat other 
>> architectures with dead code that will never run.
One related Kconfig question: would it be acceptable to make
USB_XHCI_PCI_PROM21 default y with the X86 && CPU_SUP_AMD dependency?

This would only default-enable the PROM21 xHCI PCI glue. The hwmon driver
would still be controlled separately by SENSORS_PROM21_XHCI and would remain
opt-in, so the undocumented temperature register polling would not be 
enabled
by default.

The concern is that, without default y, distribution configs may miss the
PROM21 PCI glue and then SENSORS_PROM21_XHCI can not bind even if the hwmon
driver itself is enabled or available as a module.

Would you prefer this, or should USB_XHCI_PCI_PROM21 remain explicitly 
enabled
by distributions?

Sincerely,
Jihong Min


