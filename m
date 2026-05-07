Return-Path: <linux-usb+bounces-37051-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCUOCT0H/GlkKAAAu9opvQ
	(envelope-from <linux-usb+bounces-37051-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 05:30:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3384E29A9
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 05:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46C60300A5B6
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 03:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9139E2D9EC4;
	Thu,  7 May 2026 03:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="AmcArhM1"
X-Original-To: linux-usb@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster1-host10-snip4-10.eps.apple.com [57.103.76.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87F165F16
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 03:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778124592; cv=none; b=lUaR/OQJHq45YDYSEksG3PRp6MfbSi6MwCXFIB6etqdPp22gW1er0dL+UXWVmrwwUq+1uwVKQPvktC5J2HqXae7kPoF/o+6kE8Xs0Gd3ilfl7+S44x2UsiCaf5C97XxAeFAP1VRsCVi49LNIp/wWGaLQVsMPO2eVeuBvKtH7wZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778124592; c=relaxed/simple;
	bh=AA+h13ygloHL7WlYCl2vXfWMwo0irJG4t0MnVX9xM/A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VTVs235cFdmcjJXWH599iXnZOeJgvJtzdKF4JTEOOZTuvRawYSbx7MRP3v2yVnqoaD++B2BTo0dhW+OfvbN+QJKYCCEQy8tsyzgHPjXmhMMRhoeucmo1MviGUHc69d5XwOc91AhT5kmrUUmYhuaKB/npwv4ZCC1eoqRckFazQbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=AmcArhM1; arc=none smtp.client-ip=57.103.76.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPS id C684D18000B1;
	Thu, 07 May 2026 03:29:46 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhMHVsARQNFDFYEVBcOVk1RDUEfTgZTHgtKAl93AlEcVg1XQ1QEX1BfHA4FQhlACVQZXV8FWgAwUBtfAkIPHBNWFRMfVFYDRBkQVgFYVl0FTRpcGFkPHANNVloOWwRHFBcbXAAXG0YCBCMCXwBFAl4JVgEwFw9WTVAbXwJCDxwTVhUTAF4PD0wKHVZbAA8ASRRKBV1TRgYTDhoeVAUJVF0IHQcJUw0HEg9OUF13AlEcVg1XQ1QEX04ZDEodUlZbE1UXRgk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778124589; x=1780716589; bh=xiO80MKCQGnBn7bYo3wXKE3b28gDaoCGsntdpJkmXT8=; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type:x-icloud-hme; b=AmcArhM1mRfE0iSs53r82cAh8NA2wHF8y6yVe7PkpcgSJoYebNQ72+tfoBZ1Nc4vA4RYWsGfIPzwdmYSgMaTLu01bG6t2Xo+Fv39HbNoXjJKGgVb+GhfEVLopn6KZO39xtze3WJqZL2o9SANiB8Ydgv2z2wTIgsbJwmJDza5rnrX5hX+6gBRRocN5S35gKR1iljWGv+vgDNJjTGnjOHc7psgcTwks75jRd5sLuqIrdtXG9LH3Fz/xCTSS7pGHEIpYwuX2pKdSRVYwbtlMYPAE1nG6mqDC5RP2SxD/Al92DHBOnT5DkL8mbOf761bFjXo3zDbiePi/Kuq4Zxuzx+PGw==
Received: from [192.168.89.2] (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPSA id 341FF18000B7;
	Thu, 07 May 2026 03:29:43 +0000 (UTC)
Message-ID: <3ee67d29-260d-4c7b-92bf-1e4ddf5b66c0@icloud.com>
Date: Thu, 7 May 2026 12:29:40 +0900
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: add initial support for AMD PROM21 xHCI
 temperature sensor
From: Jihong Min <hurryman2212@icloud.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jihong Min
 <hurryman2212@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-usb@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260506032939.92351-1-hurryman2212@gmail.com>
 <cover.1778099627.git.hurryman2212@gmail.com>
 <2e2ea249b30168a2eab62fc110c226a511f21bf2.1778099627.git.hurryman2212@gmail.com>
 <5a61ad36-d754-4ab9-8a56-83bccc1397f2@infradead.org>
 <c2a3d27d-3b01-44a6-bbf6-fec637789b3f@icloud.com>
Content-Language: en-US
In-Reply-To: <c2a3d27d-3b01-44a6-bbf6-fec637789b3f@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzMCBTYWx0ZWRfX1JJY2z7S9WL2
 9cGsNPneLYO61NVg1Ooby+VB0DqRjbOmTSLjRLHlYIxbQLxFCNLH7KdCT8tIAS8s3zSeD5WMA+W
 cla4j/MM3H4aCAyFcLHG7thDdHk34Yzw/AlX2lx/xV3QtdHvNeewu+P4FsON3xFbG4w8BhNjRPL
 +kig+cqU+45PT2tm1WYQLfN01vupBV0BY+OpvABzPtf+arKwpXmcspCRRV+65y/SkXLOGN8x457
 WANcIN2cA7t1roHpRY/KuxeDOs515BYtx8eN/RT8R4eaEw3R7vqlJRCY93cF/1c9oxs2ZqTEDUE
 4q6AA3cNcH9jofr44UvkPEtb8/tYYtptzxXtKXpj+7oKqgdg5Pm4c453y0k2qA=
X-Proofpoint-ORIG-GUID: G_jU8VvAtb5Jsr1iWb6dpbI8ddRfOmKu
X-Authority-Info-Out: v=2.4 cv=E7nAZKdl c=1 sm=1 tr=0 ts=69fc072b
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=5jDBv52wX64A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=hqD2QSi1MT07sOiQ9kgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PgRulw5oR9JgysbTFEid:22 a=MienORt8HT0FiJ1vGQZ6:22
X-Proofpoint-GUID: G_jU8VvAtb5Jsr1iWb6dpbI8ddRfOmKu
X-Rspamd-Queue-Id: 2C3384E29A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37051-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[infradead.org,gmail.com,linuxfoundation.org,intel.com];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[icloud.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@icloud.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,icloud.com:mid,icloud.com:dkim]
X-Rspamd-Action: no action

I noticed that my v2 series was accidentally sent as a reply to the v1
discussion, which made the patch series harder to track. It also appears
that Sashiko did not pick up v2 as a separate patchset because of the
threading.

I will send v3 as a clean new thread with the review feedback addressed so
far.

Thank you,
Jihong Min

On 5/7/26 07:52, Jihong Min wrote:
> > It sorta looks like these entries are supposed to be maintained in
> > alphabetical order, but that new entry is not.
>
> Yes, you are right. I also noticed that but it seems I pasted it in 
> the wrong place.
> Fixed this locally for v3 by moving prom21-hwmon after powr1220 and 
> next to pt5161l.
>
> Thank you,
> Jihong Min
>
> On 5/7/26 07:17, Randy Dunlap wrote:
>>
>> On 5/6/26 1:40 PM, Jihong Min wrote:
>>> diff --git a/Documentation/hwmon/index.rst 
>>> b/Documentation/hwmon/index.rst
>>> index 8b655e5d6b68..0d85b78596cf 100644
>>> --- a/Documentation/hwmon/index.rst
>>> +++ b/Documentation/hwmon/index.rst
>>> @@ -215,6 +215,7 @@ Hardware Monitoring Kernel Drivers
>>>      peci-dimmtemp
>>>      pmbus
>>>      powerz
>>> +   prom21-hwmon
>>>      powr1220
>>>      pt5161l
>>>      pxe1610
>> It sorta looks like these entries are supposed to be maintained in 
>> alphabetical
>> order, but that new entry is not.
>>

