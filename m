Return-Path: <linux-usb+bounces-37150-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN6eMLwf/mkRnAAAu9opvQ
	(envelope-from <linux-usb+bounces-37150-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 19:39:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 471FB4FA0D6
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 19:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BB8C30459C8
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 17:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FF0413224;
	Fri,  8 May 2026 17:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="zW8G0XVJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster3-host3-snip4-7.eps.apple.com [57.103.77.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754D410D21
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261887; cv=none; b=pgV89HIjh6FyLwFgxlYAxAjAAUqopbMyCmRWbZ3JM0saEA9o7VHUWhc7AjS8vgQZ2q+cB2zZFSoi0L2HZBXlL8GH1i8kvMbi4aZW6T1qApA4qc0xWnhTa//ex7S6h9vvEW5SVWurorT6M5r8Eitj0kvig5gbkSdEUaPuvJNWzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261887; c=relaxed/simple;
	bh=94R/QwsybbBzR1ekCC85MN/MnNhExX89pnlxdPMUFIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNv3XTqS2Qh0z4OexdLLtGKo1bfMnXn+rWH8HAP7KpgxIT3AhHJXIvSKdZg6iQ8dNSq7aQjAu8DksY8jGyhmfytzxW4lAtGoBGajG9ge/iTAEKhLOI/mSCoaL9IinV3Q1qU5P76hoYWJijB1hkk4+4oG0adsbn4VEisQZwEmB6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=zW8G0XVJ; arc=none smtp.client-ip=57.103.77.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-3 (Postfix) with ESMTPS id 630251800644;
	Fri, 08 May 2026 17:38:01 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhJBkMDRQVJF0wBTVIPDxhMCkEUWgpcQgtJAS1eCF4fTBwdDlgGEhZdRVsYRRlLHVgWAV8GWXIZWhRcGFNFUR9UWEEOCloBUFEdXwIKBEcEWxdGA1NFQQQXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PGVoUXBhTRVEfVFheBFNWDkUNTlAIDlJWXQxNBwwaX1ZGDVVSXFENH0QLSFZVB1kCQAgZAy1eCF4fTBwdDlgGDFBNAUMICgJRHFYNVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778261885; x=1780853885; bh=2Gaxvl/4GCmdXsxMSVsMtj2eUIHFRsgIyPlEsCEOxsM=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=zW8G0XVJbCf/FlLxdOUv/OED4zzYr0FEw2Tat38Oqq3QPQHVctYCFi2BQuyMFV/raoouTsKb7EnADK/GzrHJm7uHeMzoUNk3Cw6ZAyZNHCfOmjl67iD8sNlAujrfW4fBWDSP5OomfZkoc4wasqUbLahbwoLR6aLWk7CA5XyvRVSpQnYqVo0qBpkCnSaXmp3vszZ2kz5cNkXXpIKZsYKU5FBe83SyrvWT7DDrf1Svqw0LBDJrB18M14lr49rOJxVWJaTkGuX+F+/SsqjdcWaZYlYTEQR+b7U7YXr9gT3V6EZ8J03yK0QxxR/jfmVw8fiWZNK6udcEsmV49YRRzXYYFw==
Received: from [192.168.89.2] (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-3 (Postfix) with ESMTPSA id 7BCDD180161F;
	Fri, 08 May 2026 17:37:57 +0000 (UTC)
Message-ID: <546ce99d-554a-4d64-a1ff-420e802001a0@icloud.com>
Date: Sat, 9 May 2026 02:37:54 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: add AMD Promontory 21 xHCI temperature
 sensor support
To: Guenter Roeck <linux@roeck-us.net>, Jihong Min <hurryman2212@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508143910.14673-1-hurryman2212@gmail.com>
 <20260508143910.14673-3-hurryman2212@gmail.com>
 <0269bf45-316b-4ba5-af0e-312f6c2bebdd@roeck-us.net>
Content-Language: en-US
From: Jihong Min <hurryman2212@icloud.com>
In-Reply-To: <0269bf45-316b-4ba5-af0e-312f6c2bebdd@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rD_QwU-zS2IxD-YnjQpZCyhF2T3lsYc4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE3NiBTYWx0ZWRfX4ZkxS6YcZIaj
 O8O7cCFtCe8MOO/Wnq9S2NzTa/f7GEFsorYF0tthmi8aqRK5gjhPb/FytGKQJdgbddzRGXui/A6
 5DvuOTKSxubRxJ7imzJMQI7XttUwh6VwQ5ReFG914t5P5GYDeCtO+QlT1/KOtR7ifVmk59w29El
 B9E7UYRbI3zpGEYTOl3rW7DLzaFnJgcSKkywkjCm6XrPo/2J4L67fCujHdkS+4pyrEMlkrtGoFn
 K2uPGoQK36tuuCw89w3J/Qb5yHx7rkaCZYL/7JBMrw1xKoL+eFa8KpL1J7tuxkvcFt4fGeq9CfT
 HuIvpRPj/SVEylgqHs5GJaY7qSWJsOBB0mYtOjQ8owJV8/I8zBVlMSbtZpy6Yo=
X-Proofpoint-ORIG-GUID: rD_QwU-zS2IxD-YnjQpZCyhF2T3lsYc4
X-Authority-Info-Out: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69fe1f7b
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=5jDBv52wX64A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=k_rWY7h1Oc5qVOcB2M4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PgRulw5oR9JgysbTFEid:22 a=MienORt8HT0FiJ1vGQZ6:22
X-Rspamd-Queue-Id: 471FB4FA0D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37150-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[roeck-us.net,gmail.com,linuxfoundation.org,intel.com];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[icloud.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

 > I am sure I understand the reasoning here. What is the problem if it 
is attached
 > to the auxiliary device ? Other drivers do that, so I don't immediate 
see why
 > that would be a problem here.

I kept the hwmon device parented to the PCI function intentionally 
because the
temperature value is read from that PCI function's MMIO BAR, and systems may
have more than one PROM21 xHCI PCI function.

If the hwmon device is parented to the auxiliary device, userspace may 
report it
as a virtual adapter. Parenting it to the PCI function lets userspace 
identify
which PCI endpoint each reading belongs to, which is useful on systems with
multiple PROM21 xHCI functions.

The auxiliary driver still owns the hwmon lifetime. Its remove path 
unregisters
the hwmon device before the PROM21 xHCI PCI glue tears down the HCD/MMIO
mapping.

 > +#include <linux/math.h>
 >
 > Is this needed ?

Yes. It is used for DIV_ROUND_CLOSEST() in the raw-to-millicelsius 
conversion.

The other review comments have been addressed locally, including 
dropping the
extra mutex, removing the unnecessary channel checks, passing the MMIO 
resource
through platform data instead of looking at the parent's driver data, 
removing
the redundant hwmon ABI wording from the documentation, and the small style
cleanups.

Following Mario's advice from the v3 discussion, I will wait for the current
review discussion to settle before sending v5. I am keeping the current
work-in-progress branch here for reference only:

   https://github.com/hurryman2212/linux/tree/prom21_hwmon

Sincerely,
Jihong Min


