Return-Path: <linux-usb+bounces-31560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14ECC9F8D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 02:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3B73016DCD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 01:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A291B24468B;
	Thu, 18 Dec 2025 01:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTryC5jX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0D7uc3v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156C17993
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 01:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766020972; cv=none; b=n7AOYjT5r/by884UF7i0QNQZwcHzBTVpFiDPm03PoHBwEKI4yPAZ+4pzi+wYENcIDjuEAI6eXRuOiIZaWXTPhRdyW79BpVVJbC4u1tBm5t0eEx108sRtzwiUPIMlYWzT8+OEkKAo9TLZ0ijh3fEtljBq8eG7FsrwjZBoJ9slZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766020972; c=relaxed/simple;
	bh=bVd9fJWiH7PYxgIDwCvegpTvLsXI8Fgx6utAChAJ314=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmA4vQdJI2SDFVHyAQZoknhawQLgMc/3uVzY28gZuVuBjRg+uTS7rFOQqQMM5CPjiW2NYopBg5ud8kwp16i8GkGpZOS/LhoXkWStOqRpoUNvoPrP4PP90Z41pzfUSODip2HclHjuwKM6b1GJbJ/sfvXCB3o2cJ3wwIlhsL2ZC5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTryC5jX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0D7uc3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHJC5Fl021473
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 01:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xl3WB0OJ4se9K1QG7r9L8ZKpibU91lmE6Fi7dU3w+DA=; b=DTryC5jXq/vn9Rdm
	IhElARyTujwCz2NCIhB7Upa9cKeXwdXzP+jcUapWfh4EwQ+rolCa1EZR6v9N3ySf
	UrQhk596IF7c7H3KqNUcjFfyGllMpE7tHrS8x9HiUDn9pf+hJGDPloT/F+stnAdG
	ON9MlLgolumTuTl+ZD3jSIE9FV6X1x3frKpQIBBq0FNdVImsZTAV2eDJLnvz7A1Z
	LYzmA+fPPM02iFlqysiMUWxwGGah44Xd/df34jBt2yZ03eXaOsOzwkwxoTkWWHPk
	wcSQlnDHk0CC2X/NqIE0bqArlP3VnsajYNdSlCpHNOJTCnh0uVyYo350Zk/wWqFX
	p9i+cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v794kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 01:22:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso1732101cf.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 17:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766020968; x=1766625768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xl3WB0OJ4se9K1QG7r9L8ZKpibU91lmE6Fi7dU3w+DA=;
        b=W0D7uc3vUYT6UFGJoAogy2uqukrFOBSZlRbU1izQir7MCxJwHbopduFPk93ha7fI2A
         x8O3cBNHeOvW3qr3YiOrqV9K5cuh72e5xtSKi6h4sc2qyPkdjPQftNjBfQjnQZeDhJ2X
         O3vQ9ogu2H9qxQKEx9TzyefNxsoVa2/K7H5h9gaycto3jLVwbYcMTTj67bWbUviXIOQi
         nGi2dpDeqD8Ggwr5ZEdPmgAt9o58OAM3hYvJ51A1LBetc/1CBgtYIPo6B1whfYUZa23C
         vS8d+P6yCn+spQSa2MNgUqUJ5Kc8j4uNQ76xu3uyELTzkXIbOL5CMEbcMLQiwVlmlxun
         j9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766020968; x=1766625768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl3WB0OJ4se9K1QG7r9L8ZKpibU91lmE6Fi7dU3w+DA=;
        b=SflBWhyaE5GC6lvUhnZsLdbf1sfLg1VJfEUmT/4RMQYu2ITln+1p7ttuFyzbooaQFg
         krnf0aSgh03fIpm8A8nOWmIhnHtWlOj3usYesm27ZD7aW5dQ4iWl+mlYZNPc4suRnz3q
         6Fh1zEHMnXo+aBm4GEvpBRgay2WVT+ZArWUb8MIIxi/o4VJlrsmtNukgW0zjzsWBPrC4
         jz4iOkzsRCW1JKIOZM0uP5gHYuuggOeSAJnX2ixj7E0Di453L1PDlzuGzIlJrEs8zCmh
         4LyDR64KEldU0pjUwzwUceRXAsRzJ+CAXDfyxJGCWfyzRUZ+mDVedNnuz3PCU83Jewgs
         T11Q==
X-Gm-Message-State: AOJu0Yxc0ou5YEDkX10rdbilRP263lE1jVe/pjxtUExHePcxvuJ+7hxM
	RrE4nckfyyKNozRNfTFtcJnZ7jt2hjtaHeRzpQNhSaaPBP+HZT4LQLTUPPAkipsFiu+8AD+fUPC
	KSlI5iAsGI4jKnhscjfdyilnLzrj5ulBeqotU30YCS0md+q1sokGZJdI/SWTbtQSzoeNl1sM=
X-Gm-Gg: AY/fxX46m0rvpSojCI4i6DBvGnTu7z8pTHdjbncolmGOYwplwJ7ufwWtP1QcgLZayl0
	cCpxnJVP4kSbEvCx63+llVllDuumG6j50UWV/37FDaheb9ouIUAY1xq5JAP3EqKBPDhWUEH8+iF
	XeeVY2LC2s2f8frg+s3/KXi/rsM5/6G88bjqzkzz5RJymTUtjN6fJgq+kZ7QFZixXbebXFQ7xtp
	NNTo86uU0OnmEjyH/mzHb7OgbhIypBk7LCR0GIkLZZMX8RmE1NN4SmCeaWq+k7T/YRX8lrxChHV
	l/M6uJHUWNnBk0Dt4+1Q/Q/3qeLQkNYs1QFz8AhERwzVbT3cByw7JIpCFKV21tu7G9lTZUO9JFk
	1wrqlwRslUM5YKYclfKDsCVLFRiwAaosGZmYeWYxJM6FJ7I5kSUXlZBgOVUAfHCP/U3Xx
X-Received: by 2002:ac8:5d4d:0:b0:4f1:b6ac:daff with SMTP id d75a77b69052e-4f1d05f0244mr282580121cf.66.1766020968060;
        Wed, 17 Dec 2025 17:22:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlSNQ5HQ0gado36fHwwHE40ABMluhKQHeuR52nMMYPeOXZh8YSm0up1mNvA2Qg+quqe6yUNQ==
X-Received: by 2002:ac8:5d4d:0:b0:4f1:b6ac:daff with SMTP id d75a77b69052e-4f1d05f0244mr282579771cf.66.1766020967519;
        Wed, 17 Dec 2025 17:22:47 -0800 (PST)
Received: from [10.193.196.209] (82-128-196-119.bb.dnainternet.fi. [82.128.196.119])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381136e4c71sm4019681fa.26.2025.12.17.17.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 17:22:45 -0800 (PST)
Message-ID: <349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 03:22:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] usb: typec: ucsi: Update UCSI structure to have
 message in and message out fields
To: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>,
        Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
References: <cover.1761773881.git.pooja.katiyar@intel.com>
 <214b0a90c3220db33084ab714f4f33a004f70a41.1761773881.git.pooja.katiyar@intel.com>
 <2tlusuyqp2jif37smm57skeo3g2trzdspirv6minlopo5cey7m@z23tworiljkg>
 <66950556-3313-470b-bb51-82e14ce144cd@linux.intel.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <66950556-3313-470b-bb51-82e14ce144cd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ChFZKgSvhXU6gP9oVEYELE-paDEOB_y0
X-Proofpoint-GUID: ChFZKgSvhXU6gP9oVEYELE-paDEOB_y0
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=69435769 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=UP4AmmvVc3sGQHJQO2VA4Q==:17
 a=cVougTJtD4grJz3r:21 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=yt9TpK1xu0J2KYvoGtcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDAwOCBTYWx0ZWRfX8MoBdkOH5Ze5
 nlvaaRx4WoTJO72AlGczm9clxn3qztFL9z918h0LmelUKllr0uB1iPkCtQZAuYLT6TbK2iur22d
 FW4MGV971m044xJ+q40jdEmpik16hw+z+8FEX+Ox7J13w9hSEXT0z9AZG3wbcqT80s+TP/10YEQ
 rg7K+WrITez8Qp2+6k/qfCsXUTJmz2ZhfrRKXQW/MGdmNFMicRhkZIoha4PztRMAIfuSWbGo9IM
 jsIVAESySU6sOlB80steQqFfT3/EgiPLfgDdonTNb7v841ZNN65X4cqiO6NAW1bIJhVWiJWtzDs
 eIRvkYh1gTxF48lKzyaSF5Pq8SO9v7hGrXVbDqF2ytXTUhlh7NGr9TluAECimF//iU2refzz+VD
 dZf6tsFD2ZjNPivmQiXJukPPlcUtcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180008

On 18/12/2025 03:17, Katiyar, Pooja wrote:
> Hello,
> 
> On Fri, Dec 12, 2025 at 06:58:06PM -0800, Dmitry Baryshkov wrote:
>> On Thu, Oct 30, 2025 at 07:48:55AM -0700, Pooja Katiyar wrote:
>>> Update UCSI structure by adding fields for incoming and outgoing
>>> messages. Update .sync_control function and other related functions
>>> to use these new fields within the UCSI structure, instead of handling
>>> them as separate parameters.
>>>
>>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
>>> ---
>>> Changelog v3:
>>> - Added message fields to UCSI structure and updated sync_control handling.
>>
>> Colleagues, after looking at this patch I have a question. What prevents
>> message_{in,out}{,_size} to be modified concurrently? While we have PPM
>> lock around command submission, size fields and buffers are modified /
>> accessed outside of the lock. Granted all the notifications and async
>> nature of the UCSI and USB-C protocols, what prevents two commands from
>> being executed at the same time with one of the execution threads
>> accessing the results returned by the other command?
>>
>> In other words:
>>
>> - thread A sets message_in_size, calls ucsi_send_command(CMD_A), which
>>    takes PPM lock
>>
>>     - meanwhile thread B writes another value to message_in_size and
>>       calls ucsi_send_command(CMD_B), which now waits on PPM lock
>>
>> - thread A finishes execution of the CMD_A, copies data (with the
>>    wrong size!) to the message_in_buf, then it releases PPM lock.
>>
>> - thread A gets preempted
>>
>>      - thread B gets scheduled, it takes PPM lock, executes CMD_B, gets
>>        data into the message_in_buf and finally it releases PPM lock
>>
>> - finally at some later point thread A gets scheduled, it accesses
>>    message_in_buf, reading data that has been overwritten by CMD_B
>>    execution.
>>
>> WDYT?
> 
> Thank you for identifying this race condition. You are correct about the
> concurrent access issue with the message buffer fields.
> 
> Here are two potential approaches I see to resolve this:
> 
> Option 1: Separate mutex locks for message variables
> Add a dedicated message_lock mutex to protect message_{in,out}{,_size}.
> message_{in,out}{,_size} will only be modified within the message_lock
> protection.
> 
> 	mutex_lock(&ucsi->message_lock);
> 	ucsi->message_in_size = size;
> 	ret = ucsi_send_command(ucsi, cmd);
> 	memcpy(buffer, ucsi->message_in, size);
> 	mutex_unlock(&ucsi->message_lock);
> 
> Option 2: Pass message variables as function arguments
> Pass message buffers and sizes as parameters down to where ppm_lock is
> acquired, ensuring protection throughout command execution.
> 
> 	int ucsi_send_command(ucsi, cmd, msg_in_buf, msg_in_size, msg_out_buf,
> 			      msg_out_size) {
>      		mutex_lock(&ucsi->ppm_lock);
>      		ucsi->message_in_size = msg_in_size;
>      		// execute command and copy results to msg_in_buf
> 		memcpy(msg_in_buf, ucsi->message_in, msg_in_size);
>      		mutex_unlock(&ucsi->ppm_lock);
> 	}
> 
> I'm leaning toward Option 1 as it resolves the concern of passing too many args.
> What are your thoughts on the suggested options or do you have alternative
> suggestions?

I'm slightly biased towards  the second option (it doesn't required 
extra locks and it also is a bit more idiomatic), but I'm fine either way.

Looking forward to seeing the fixing patch!

> 
> Best regards,
> Pooja


-- 
With best wishes
Dmitry

