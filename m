Return-Path: <linux-usb+bounces-25342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F1AEF1CF
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 10:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B69A17A9F9
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1325926B96E;
	Tue,  1 Jul 2025 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuoNRHea"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE70264F87
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359827; cv=none; b=gyhDQMBeGQCsMwbIXCyZhbp6AJuyFsE/S+OJJvmShDPoMW64O0mDNdYqJe2Oqfx70tQiG/66rUFV5Voqx4i1a8YAk9k5cBB4pkKx66mcIh7YUIu8tLMqXfZvPMzBN8lYcvt3zTPbh2Z0n/eyPcixV+MwgHvim/0vNOw3vdldxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359827; c=relaxed/simple;
	bh=1jmGK808HkoBQH42uhQVl1mbsUorw2IUXIcaj0JK+HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4bOK3gbHKvl7pjkzHsTHnrNtDZZ6g794qN5tse4YNmoAFfSW7ax1lBITDPBx66khdZfM4r0MJQF4dbfajkQobb3xIaK2tfEyM0lzzEFklWwX07Y4Ob9RhXNxapcT+cg/prlp7WyX1qr0ll4JQOaKLfgh2BCBQEdkDbi6+LcUS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuoNRHea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5616pnRE030208
	for <linux-usb@vger.kernel.org>; Tue, 1 Jul 2025 08:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJjS2K161b9n8ERrACtHgP+6GP03kDfnT7Edt3t7c00=; b=WuoNRHeaXpFbYeXG
	uZ7oI9dUFdrzlZXdioPaaP9NkT7TyUVeNrEWWenOdlG1mza0NuEEycJC/uRcrUhS
	JVNCDPPiXNy1U6lzKq65io9eDRN/ELddjVH/Av6wWJIrUfl8wxev7rJC8BaITIo4
	pPjXqxZ7JCcqN9+gYpRhutHeMeTjwlhHVEBSsUFT3NI4rVJ0ADUHh7onKvhSIbd1
	/Y8AW2iSTO0Mqq/ZTZvxqSxu/oxNEURl/jj6idL/QY0SxrATQ1+l7b2Qk8yKrY+n
	92QMlKWWVAPV7NDSeGk9ESzUj6TjtP5+ASj9r3s6GTnP3ed9xkdiwYVl2JsBbGBF
	I4ZAOQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v1yyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 08:50:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d4576e83cdso600042285a.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jul 2025 01:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359824; x=1751964624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJjS2K161b9n8ERrACtHgP+6GP03kDfnT7Edt3t7c00=;
        b=HPJ/8875KzPMQWVfACkU9lVCr6itvvJb860clKEcj3+ucwhIGSYqogv0X0YmfqMwyP
         Azrf5daBP+kc++g15UIFvCzzD5/qvwDdR3+kzXzd6AUwQY1pQNl+EGXu5V4bwiknGjbm
         PhzpWDVeViUT0M7V3E1PAOQTmHKLZXLOdBnjZh3EXY9Uf9Gl6d0vWpxRatu8vp/7YIqT
         aXcUeeqdeMgNbl9Z8F6r2gcQjRIGBmYv8PZrB7acqSbCW9VsFqDN3Cbd7P3Gyz/teU25
         qepmEa3kb9fTq/pv1QByKttaOyu4Q2ZgXo43mbDjS069drI1PucecPTH2Bx2MrH1vI6e
         /yQg==
X-Forwarded-Encrypted: i=1; AJvYcCVTba+Bj+mRGFxdvYus2JRZF0zrX5OAGl85lXC6QzQzIdVNfkcC9eLP1nIcmfrGCBJXVzgIXzeHPBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoO7UOHfTtSy+5DI80tMfITVaNXu3shwTzQB4XuXJ579wrWs7G
	h1LkPcnT8+xyotarn974HFNHwjNvmHp0v9oam0VHfPOiPX/bQDMqzoi3kgOjDODQ0Q+ocVec/9l
	xuT+t6W0hcK0XFvn43xUncoXSF6eWNAJmVYwovZlQ+0Jt3p1rnM8YKyNff+7Xd4M=
X-Gm-Gg: ASbGncvc8CWGolCMDXFntVYRz2jXaG8UmyqO6noy+E2XQqkIAkoJtGfCx/801wHV+U9
	9QPCpBy4qVX7MTftFVpMQaaAApEXgtlo+DDVdY1rXoaPER2+yn0mATFMHVbfSomsHnkzgB9BOtS
	4BwxX+Tv1g1CrXbsqt2VTNiZ9KSE44NkzCpw7L2z9vMpgH275d7o4FKA/8HtXIQLcj7lBhI9Wsq
	z15x/ZNg7SRGgY3LTiNjyuRB3VLQtibIDGo62oZIKTfpdu5jcsSILTQkLguBKux64XJUH+OasVQ
	uT+jgLWL2XVz+ZAP+kK1LJd33BeVTIXs6G9HToQG+UXQR2rez3wXzfhq4RuSf+wQv88yMXPZBT0
	nBjYTvoypexzAdkUMgPTJbMHCgQ==
X-Received: by 2002:a05:620a:46a4:b0:7ca:efed:8644 with SMTP id af79cd13be357-7d443926fc3mr2472949285a.5.1751359823832;
        Tue, 01 Jul 2025 01:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgKu2yTsgcps6FNFl7Ms51IeO1XxENLUtyB+AI/XbIusMYOSqaZPNS9/LIQCCIUYBBVqqgWw==
X-Received: by 2002:a05:620a:46a4:b0:7ca:efed:8644 with SMTP id af79cd13be357-7d443926fc3mr2472946785a.5.1751359823318;
        Tue, 01 Jul 2025 01:50:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f? (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73d4sm1715671e87.134.2025.07.01.01.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:50:22 -0700 (PDT)
Message-ID: <de4c73cc-2aaf-4987-a49c-dff2f38ba0f6@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 11:50:21 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out data
 structure
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <2025062813-untying-hesitancy-088a@gregkh>
 <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfXz3MeRxFHXM9k
 sGZy6qY2gwl4EJa9Y8VSlNCv7wMKdQUtjFnhcxlMoEM24tkEOWWK6ESFcJA0FQmMyM4hfH7t0Au
 ksJIh0J3/GKaPRcINP+2M4t85swUBUogeQOfmqUCGxuxUJZscUV0SOCSH2ClvQ7RS+VjbHETabs
 JrEThlp1Y6/JwDhKGB50+H5IllL0xqgZZpPZ4hNUp1soqkD+spJO2NXbybMv+ytRaFWJDhc4OTB
 b6wx6nhLpn5i58CnGC1VPm42C//vsvJ/hIyRgGAAP8er+IUyi8HOHZ0bp7YDvj6NKnnRtGJffsE
 MQRDZ1xTeDQDHIEofw5cEVAl4J2kwGVqCz7BoEFPxIdboctfrebGO4lhsj+P2OvWnWjGSZKflaA
 R9YvXENzHCXEpXOGCsTw2xLceAeTRH31eGVwhUlZhafLkvknRHZSXpDOkuZn8Tho+f9kKt4h
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=6863a151 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=rn4FyFE6I_q7W60dzGIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HvzUE2YoPrwtS7Vi5vTewOnTrYGKeTaI
X-Proofpoint-ORIG-GUID: HvzUE2YoPrwtS7Vi5vTewOnTrYGKeTaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010051

On 01/07/2025 11:46, Heikki Krogerus wrote:
> Hi,
> 
> On Sat, Jun 28, 2025 at 04:51:56PM +0200, Greg KH wrote:
>> On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
>>> Add support for updating message out data structure for UCSI ACPI
>>> interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
>>> LPM Firmware Update.
>>>
>>> Additionally, update ucsi_send_command to accept message_out data
>>> and .sync_control function to pass message_out data to
>>> write_message_out function if the command is UCSI_SET_PDOS.
>>
>> Normally when you say "additionally" that implies that the patch should
>> be split up into pieces.  Why not do that here?
>>
>> And do you _really_ need to add a new parameter to all of these
>> functions?  It's now getting even worse, look at this:
>>
>>>   		ret = ucsi_send_command(ucsi, val,
>>>   					&ucsi->debugfs->response,
>>> -					sizeof(ucsi->debugfs->response));
>>> +					sizeof(ucsi->debugfs->response), NULL);
>>
>> You can kind of guess what the parameters mean before the NULL change,
>> but now you have to go look up "what is the last pointer for"
>> everywhere.
>>
>> This feels very fragile and horrible to maintain over time, please
>> reconsider this type of api change.
> 
> So I think what Pooja was proposing in the first version of this
> series, where you had a dedicated function for filling the
> message_out, was better after all.
> 
> Pooja, I'm really sorry about this, but can you revert back to that,
> and send it as v3? Let's start over.

But that breaks the sync_control logic - currently it is possible to 
handle the command in .sync_control completely. If for any reason we 
need to implement workarounds for commands using MESSAGE_OUT field, we'd 
have to introduce additional logic (which we just got rid of).

-- 
With best wishes
Dmitry

