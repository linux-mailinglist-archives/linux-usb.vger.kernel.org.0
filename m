Return-Path: <linux-usb+bounces-36105-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOZ1Itaj12kUQQgAu9opvQ
	(envelope-from <linux-usb+bounces-36105-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 15:04:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EADED3CAC4D
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 15:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3FF93021588
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 13:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA6F3CF668;
	Thu,  9 Apr 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSZXjaZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWqKW5wB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49493CFF65
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739634; cv=none; b=MNUvaaN26Ac0sRzpdrV9tNaqkpokQYyW04D6SZTkJXrGQ11bp8N+YAs699erl/l5YYISN7Al1PiOYSGwSqFGmXaWFEjvbSmFPzi3M6MduUBpzbW9Mkmg7N40DDFMYtBw4bAYDEJLRcqG5a+Zl6ay90NDkkxIwi0ZwwFaFtLAQog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739634; c=relaxed/simple;
	bh=B3T1ur1/pLWxh4vLuUwgZxeixK+GjqqHG2hHpa1b/zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0cIHxJUDASVaD4tEParf7hTsZ9jT0nNI0/DMKjildTaMT7vqIzWyB8pVnsr0ZknPkpOgp7HUPqFHxATZ7IGYIZvUS7H2TqEMuQV4BPQmDcUTklFBSFAmWvfqIpqC5WJIoaFdbl7W+qtZQKXXBANRrxeMc1lg15CfQ7GNDiOpnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSZXjaZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWqKW5wB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Cf5Rc2866555
	for <linux-usb@vger.kernel.org>; Thu, 9 Apr 2026 13:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbczaBz0yrE8tkAEgYb73pKREevRtWau+pNaf1Zr2bo=; b=fSZXjaZXSfqyXZJg
	RW2TWloIDSBlwRx45S9u9Qzwsei1EJfyW+sycV9V/VMjXz2Osz03sfgxcUVKYj1A
	7yf46E2CEyrMu6/v0F6fxDlaqQpaLM//xFs/jkDLAQM6p2+2rumCOsVogZBkh6cv
	E6f2SYr2X2zHSjv9K9KfgOZzBySFPKxExLBLwG6SJdlMiatii3iZY5o8I8nns5Jb
	tTPr0Z2poN64cu9zEeenDcVDGDStlY3qnL2nFitrqnqfkt8qDrkyJFjKhBGLkcvn
	a4YjvhSdCYh+th7fix4VndB/8ecsVxnM44pKuYzGuHibOksuzZkynN6seMfLndMT
	5nTq9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayg439-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 13:00:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso20025085a.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775739574; x=1776344374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xbczaBz0yrE8tkAEgYb73pKREevRtWau+pNaf1Zr2bo=;
        b=ZWqKW5wBqvbDZ4QBQHjqcvKmzAz6uuioGENrWlZyEPE2m0u1SfQndibQv0NvJguOIa
         ht4Yq3djGlAFexSKCwX4VRm+MHjOK2aALhiEL4QZn8pzl+R/zD+JSow5mvSjjAemO8SA
         JzCkDifwpkx++NNSiZ8bMWCRw79XkHxV7YemDIDtgTgJAc6fxjJNJhnBkV41+ZaCkSir
         /jGsqxeJlBJcrkiUQF0M/1p5I7HCG59+V/Tp+khhC1VuQ0gHI4L3J4IjX7NWxNLEejHL
         s2Udc67kNxGIXohk3nFQryMm6OAjWu6NyavLrZbtn/PNIKTNVlnKHzF1O86eTabD51ne
         MN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775739574; x=1776344374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbczaBz0yrE8tkAEgYb73pKREevRtWau+pNaf1Zr2bo=;
        b=KhtxbvvdaY3wIRqZlT2zTnoEXUauWITJEn+JaFPpbYHBn+tq2LmpDF3ZVWfAUwi40N
         TpHTPTKQd5WpR6OvCXGsTkIixhPVYdLwUo/1VWp4SMiDMhsu6ZKzAx7vViROcaqtXdR2
         lZ6t8vNNZkwE3z+ckL3NKjmYSfn7y51EMmUgK5Xx+QgYJuLNqaBLwpsoOfh2uZPCYQqW
         fDg2KUG7waLmWb8wqbZwI1W/RiHo6WS9+zGz7qTP+fLMC7Zji7/y89KUgCFN+s5ZqoeX
         zaT8w2ofqpGhsGIwJCL0OND3ij8KEdZr1rMJrJy/hKfqhyfVxyUpQPVSLA398x7gZocR
         LYDA==
X-Forwarded-Encrypted: i=1; AJvYcCU1oMDEAiKWX6s7+rdXB3rQi1nbDbFMq0gqoN5UsBmJp1GXP74UnIiO0cFpTdJpFmbRJFwdA7Omsqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IzQuBXK15kpxx2TXa2Ir6xaxIgRXEIrGGNY6gQRSaQoViCr0
	9mu3JOxjTqy2CpJrSaUA0VBQmUE8NQF7RTE5WTRrhNch9bIVhGE2PTBqT5fjlijhur0+FmNJpIa
	DUbc2+GFQMfV8YOLUDQqcyD/h6lDmTFNAHVibn8nOGRkmwTATbKtAcacEKrlwBD8=
X-Gm-Gg: AeBDieul4s4enE1vHLTFwMA3dDCpHh4ZUzLE5yTQUeOKOs6v0Sk0JPk5gg/ZUp+Wh2H
	WdxdHGr8OV7bku+hXL2cYgvRwxUt4LmoL2gCSZiPLeoNlcGQyRCXWQnx4xxs4MF0cB0JPrGpjdI
	Q8WUrWAFPoo/nFtgGM7G7VGPKIow/T5T2UGrkcLsXWsSIR1YaFE6Lt7/EZfG5+UpSbyq+GrE0gT
	ENqk0IBKBvnHay4AXlyKtm7SvF5e/XxKumRWqw2oSSz9UYvWADlpWwP43jGlV0r8ELvAUK/kP91
	sRqOA1DZBqZUrqaR7Pzoxl2ili4gkdLz+3q8qx8qOEuZKh9qmHygepX3YU2RHlg9fzmgkTmuQfh
	TDssL9y1cagUgnYkSeJCyEZw8uRUFHTv3BMb0BXzQXF4aQqylysGXRiLI3yM9T1SSOO37oyW57w
	GrOHc=
X-Received: by 2002:a05:620a:f0b:b0:8cf:df37:4f97 with SMTP id af79cd13be357-8d41bad7a32mr2661522885a.7.1775739574480;
        Thu, 09 Apr 2026 05:59:34 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:8cf:df37:4f97 with SMTP id af79cd13be357-8d41bad7a32mr2661519685a.7.1775739574055;
        Thu, 09 Apr 2026 05:59:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e7b5ffa64sm3930010a12.21.2026.04.09.05.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:59:24 -0700 (PDT)
Message-ID: <75c962d1-7ade-483b-bbc9-a6c6140fc0e9@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:59:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
 <20260409120457.GH3552@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409120457.GH3552@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d7a2ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fGwfUCG3lQqjGGzWVLIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExOCBTYWx0ZWRfX7WnRXfM0bV84
 vNNq48HCjMWfDBYaZbzEbMdMYpJcHEXaZXs39pf3e7mYrhk8pqWILJ0Ho8PLIkp/F2CBDbTyIJd
 ZV4Y7sJmhjSFEtU8pRLKt2zLTHBmcLDD7y7/wxwTi6LnMOoz14EycTZPmGIqwqSHAFquuAdrTd+
 vgV6TInqDHzHlfrPwymMERvngDcL3+BprLJlaGfjRLg9AphFz3U0s128ys9joDJnaDY2/0bnnlD
 nG4gX0+Zp9UWtbcMk6zXWylyaXILCNiDgLt/ijc2hHprbZAJ0m0XXPQ9rem2UGhLJH7dzjqKIQk
 0SA446oT25fkygarMdXKAtL3/psQ3h8hgJUErElmhS4XB5XQlOO63XsowFpyXzmYvvbdGJsM37w
 XAkihZAmgQ2p+P2SmZWO5L8oU+b8D9VGQg6mTsXh5lxezEZJ6QdpE/HXhbMkiSOCD7BD7DaYfNR
 U823c3JDW4WDyw1QbZQ==
X-Proofpoint-GUID: pbUifkHmgsXJgbvcaum16hd-pRTW9rTu
X-Proofpoint-ORIG-GUID: pbUifkHmgsXJgbvcaum16hd-pRTW9rTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36105-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EADED3CAC4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 2:04 PM, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Apr 09, 2026 at 01:22:01PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The GEN4 TxFFE register is not part of the USB4 v1.0 specification, so
>> understandably some pre-USB4v2 retimers (like the Parade PS8830) don't
>> seem to implement it.
>>
>> The immediate idea to counter this would be to introduce a version
>> check for that specific register, but on a second thought, the current
>> flow only returns a quiet -EIO if there's _any_ failures, without
>> hinting at what the actual problem is.
> 
> Please don't use _any_ emphasis in the commit messages here or in the
> future.

If I must, I shall.. other maintainers don't mind.

>> To take care of both of these issues, simply print an error line for
>> each SB register read that fails and go on with attempting to read the
>> others.
>>
>> Note that this is not quite in-spec behavior ("The SB Register Space
>> registers shall have the structure and fields described in Table 4-17.
>> Registers not listed in Table 4-20 are undefined and shall not be
>> used."), but it's the easiest fix that shouldn't (TM) have real-world
>> bad side effects.
> 
> Also drop the "(TM)" thing.
>
> I assume you have tested this on a hardware that supports this too, right?

Hardware that exposes that register this does not exercise the altered
code path.

>> Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/thunderbolt/debugfs.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
>> index 042f6a0d0f7f..8237e1ea6d09 100644
>> --- a/drivers/thunderbolt/debugfs.c
>> +++ b/drivers/thunderbolt/debugfs.c
>> @@ -2361,8 +2361,10 @@ static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
>>  		memset(data, 0, sizeof(data));
>>  		ret = usb4_port_sb_read(port, target, index, regs->reg, data,
>>  					regs->size);
>> -		if (ret)
>> -			return ret;
>> +		if (ret) {
>> +			seq_printf(s, "0x%02x Error reading register: %d\n", regs->reg, ret);
> 
> Why not tb_port_dgb/warn()() here instead so it goes into dmesg, not to the
> output.

Because when one reads out sys/debugfs, it's generally expected that the
related output is provided there.

If we don't want to print the retval, I can copy the message that's printed
when switch/port capabilities readout fails, i.e.

-- drivers/thunderbolt/debugfs.c : cap_show_by_dw()
if (port)
	ret = tb_port_read(port, &data, TB_CFG_PORT, cap + offset + i, 1);
else
	ret = tb_sw_read(sw, &data, TB_CFG_SWITCH, cap + offset + i, 1);
if (ret) {
	seq_printf(s, "0x%04x <not accessible>\n", cap + offset + i);
	continue;
}

Konrad

