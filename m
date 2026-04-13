Return-Path: <linux-usb+bounces-36205-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIo3Dsff3GnrXgkAu9opvQ
	(envelope-from <linux-usb+bounces-36205-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 14:21:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF433EBD6C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 14:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BD3930641DA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 12:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE07B3C3BF3;
	Mon, 13 Apr 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGd+4OB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8GYFgk3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5893C3450
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776082535; cv=none; b=XgYXnpqnKmxPr1lBW1903/QovGvU0r5TjyuVpxrkugnoI/bVZRF3/W2lOukgsJKeEnweLFSUs1ENC3vF7On/zZi7KmgdnBEHkqg9tD7Hxwug+MQMGHYFm4kYjQG7hkgKtwiJTMXkAEw2s3BeuXw3o7PCYtDXNxwX9oXcDRVnHME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776082535; c=relaxed/simple;
	bh=b2KW6U67xE01uYo/G8RxPBUNg6BwtHFvu37L96sm9Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNWMcIrZ8YAeYwMzixLYdBa7yU7+XGmfWGXkWWaCYuZxzrbXMH+wuNom1po9C2NdfHxfaL2q1SRv01xVoMhLOEevRdXzHTnB9Ce+Ioving3QMEI2zBrsu/ayXjEsPOBdJAF7V5dzuW6OyhaZ86P66+uXK31x5tkFjDcjVPG+akc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGd+4OB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8GYFgk3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7va6d1616973
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 12:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MeOeo4v6EXekakSCExIcqk5douxj2pX0LuVyxBkTQv8=; b=WGd+4OB2S5ZA90eg
	N1n89NYl3KwAH7C9a5G0cNvMxg07DcYTg+hn6ncPmBtekxIslBK+CPhvIq8gJ9w9
	P2YY+zFPQiE8jjA5MOcAdBfIL7KrZXTHh9+EguWhJIVt4rCRq2ihCZlYdGAUfnei
	50hJG2g1SAQzLVCWd+bNz6xjEtdzLnhlCqdSZmUhMPAEjhKudpLMZQSqtKpev4Cc
	oQLg5/+6N62azxrqW3sL68KG9rYUi1BAchN9NeQalQsv9rfG7nR4xVe92ZhSUYLR
	F8gONZcmdZsq+m7FN4osl4QEoChc4LowXn4I4lcVdB9OIIVM/27B/f62z+QwNayK
	UY/jkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtn7v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 12:15:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso40971461cf.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776082531; x=1776687331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeOeo4v6EXekakSCExIcqk5douxj2pX0LuVyxBkTQv8=;
        b=I8GYFgk3avo25QoX9yQExZD62J3krO2DZtjyawJb7VeFtVJkrkU0QICNKSDAiGBGAa
         j/sre5ZN468VBs2iQY0TBgMJ1fyEPFfbEN4aU+oVdVoJTiRWxAYLPG+COIlJAUU23yCI
         9PH74qJU1DUXXearRO6bKS+v5oOY4J0hijXmoP0nU/WGrRTDw9wsqj0QDnbesw5nhhnE
         9cfHmhZ3rLL6qfhVNYG+csWW5kg7U/jFhucp5yse52zu14AihqgwVdqgpmKKl9rPcc41
         zDMpcZPbB3fPHwsYe8dVRQl9+H50plcfVmAKbvHEJvb2EBeLX607FX0KGGO9fyxmMdte
         EESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776082531; x=1776687331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeOeo4v6EXekakSCExIcqk5douxj2pX0LuVyxBkTQv8=;
        b=gSQOsQCXsncs30B+8QMYKOOQ0TIxpdskTnK9HEi88YoNDMOs86flzZL1Py4a3ILFkJ
         Ddno7xiV5x+2hfD53R4prj4f0bbj2goaWub2t6Yr6agMfFf3X3aFi49DFg0cU3aINQ5K
         CAO4Fpw0jxgxncBKCjx2/16Vs5UP7Z2EhnDZ/ezM5l+ObBhF6eMNPTG3tOir9YlRpkia
         9VYzCiYAwJdKJvx+jbErj9TRhJp6EjBTtqj/U7EcN1KRIbhzAOiksWMLfqKr0Lucuk/t
         MU7oitNLfWR60Q2X/txzNzAtdseRrE6Yb6Jqw24XIayDog2/6Q6wiCMAf8Hb/UCC2IS7
         M/vw==
X-Forwarded-Encrypted: i=1; AFNElJ+Vx9ieKzgLarDH3VFx6cEzh1HD+CsKDCH6O4Fkm3R9Y4EGdCXhCpOUWXQBbZ37ech5XYZEo+42hnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmclKIl6s6LjETJTBb1xxrGr8kGZNuvqQqA4vNFLlxXt/4LvaP
	jN5wD/1Wtwr8SwApH2yf4rhX4nOAOFqgABNGyb1j+uIAWpr/5d2eDIvFNFJOWYu4qDJgd49Z1aW
	y+ioQieyekaCFgBP1hMsalSdfKJbK+UmdlC2pd/rINPY6vD4QD4/Yy933NLjE+ws=
X-Gm-Gg: AeBDieu/pxfRr4V2itFW4KUylN1NwrIDv1xCprlXhuPvoPVmHw5UXTzYKKcdU+YlpZB
	omHSjmuzQSaw44zz9WmBSv2ytt6MzpNeuX8h8yVwsPKczxRraYfBjUCa/8V0eWfglp5lgxMmHfc
	hwmRoNeuA68bslj7kO43i89SCRAsU9hnMQfgOJBzuVUFDpgGLyV2rBWEUqYXTuHr0vtLHYDIlmv
	MTik9PJRI8f8ek6Frir9LEv32M/BPOGk823Kb48sHCVgC6rRbCKK4ckx0ue/6SDEpzarzs2I2l0
	3W/jSTnWGo5mkQBWYF0zU3D5amcUuGgDbE/f6nhgUzHZjW/jr7NdByfydi8MiKlM2MKZ7x0zywg
	1VYEBqK0rtpgEac2nGkwBekGFmrE0F84PwFOMSaFV9pRDwqoQl0iZhjdmBxNOe7GpsWrPU3ltW4
	2F7QM=
X-Received: by 2002:ac8:5fd1:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50dd5a9118cmr146954481cf.1.1776082531043;
        Mon, 13 Apr 2026 05:15:31 -0700 (PDT)
X-Received: by 2002:ac8:5fd1:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50dd5a9118cmr146953821cf.1.1776082530462;
        Mon, 13 Apr 2026 05:15:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77f6sm307386466b.21.2026.04.13.05.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 05:15:29 -0700 (PDT)
Message-ID: <52e8c5d3-52ac-4e33-b6f6-88c8823abd06@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] thunderbolt: Skip reading Rsvd SB registers on
 older-gen hardware
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gil Fine <gil.fine@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
 <20260413114015.GO3552@black.igk.intel.com>
 <f59c4193-7e07-4375-b418-ab019514fdf8@oss.qualcomm.com>
 <20260413115305.GP3552@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413115305.GP3552@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcde64 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3vEATxqM7effXUbsBJ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3c0LVx5vbj51gJhjEpjUbjGprlTec8sf
X-Proofpoint-ORIG-GUID: 3c0LVx5vbj51gJhjEpjUbjGprlTec8sf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEyMSBTYWx0ZWRfXy58WAhzroG17
 dMZy4ScNp18NFmjt9LFKOrSs6A9n5C/hfiQmaA96JZRpoajENZEyMAvIBM+nCyy1ujTVlrKAaU6
 0tOSiWaKUZmBrlQUki32vZIUPLqAfC0HDhp0TVhUBL+3gZnzeEp1LiLH1z+MES+3SSox5xD0tn5
 EAj8ci+6kjyMjPG0q/eusKWBKn7hYBPw8t4PW3N9tSuVap64iT2ACVwHsTKuj7HAKKptNZDbpga
 OvNM8/Nywn71fzzDxIbArHzza7GN8K9sH33MKBeSZvEToyKO3nc/kZQf53vdMxL7yCmdc+Gj2zZ
 DuER4EP1LiI/ysvlmoXWFzexX4dmmQXr9pCetTbcynPaopquXWKZJm8mk+8O/WyPM9MEYD5Irec
 otnii3S3TMHrp86ZeYnvrIX8VZ1EmHc7NOsjd+ofZw+zeAkEBQsd5gmXAe5eaHKgevDt2FhacqS
 o7VckWkJ1OVqnDZxmMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130121
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36205-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7DF433EBD6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 1:53 PM, Mika Westerberg wrote:
> On Mon, Apr 13, 2026 at 01:43:49PM +0200, Konrad Dybcio wrote:
>> On 4/13/26 1:40 PM, Mika Westerberg wrote:
>>> On Mon, Apr 13, 2026 at 12:54:41PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The Linux TBT subsystem supports hardware aligned with the latest
>>>> USB4 v2.0 specification. In some places though, it assumes registers
>>>> only defined in that specification version (previously marked as
>>>> Reserved) are always accessible.
>>>>
>>>> Every version of the spec states:
>>>>
>>>> """
>>>> Unless specified otherwise, the Connection Manager shall not write a
>>>> register with a value that is marked as “Rsvd”. Writing a register with
>>>> a value that is marked as “Rsvd” results in undefined behavior.
>>>> """
>>>>
>>>> The effective list of SB registers that need this guarding currently
>>>> exclusively contains ones that aren't used outside the debugfs dump
>>>> logic, so just add the required checks there.
>>>>
>>>> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
>>>>  drivers/thunderbolt/retimer.c | 11 ++++++++++-
>>>>  drivers/thunderbolt/sb_regs.h | 11 ++++++-----
>>>>  drivers/thunderbolt/tb.h      |  2 ++
>>>>  4 files changed, 30 insertions(+), 14 deletions(-)
>>>
>>> This is alternative for the v2 patch you sent earlier, right? I prefer that
>>> one over this.
>>
>> I think they're complementary. This patch ensures compliance with the
>> quoted part of the spec, while the other one improves the UX and aids
>> debugging.
> 
> This adds a lot of code for just debugfs access so I think we are better
> without.

Just the other one works too, then.

Konrad

