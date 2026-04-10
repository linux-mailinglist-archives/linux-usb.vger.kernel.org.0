Return-Path: <linux-usb+bounces-36138-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AymCH4K2WnnlQgAu9opvQ
	(envelope-from <linux-usb+bounces-36138-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 16:34:38 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD893D8B4D
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 16:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79AAF3074D2B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 14:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23B63CFF65;
	Fri, 10 Apr 2026 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VL8wXUdQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4meZkh1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B153A75B7
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831391; cv=none; b=EcgxnFKs7y7qzf3zLYVe9i2iasQsp7vvkyMBgxQJF8YsaUkaryli3Yfpq8W5bTHy9PknRCgLMLD3l9H7rVZ5JGbBjWMuGSbxeH5IYpjZS4DvAsXuMKwoMJ1TIT0Y493e6yOS2I+n/pDespFSC8S6U89TtRWCTi3DQHPBQDIddjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831391; c=relaxed/simple;
	bh=NYFloXay/xXsehUJhCiOsl9WvUPlk0M6zs7gjSI6/fU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulDAlsT67oHWSngj9rDDgtmeFpTkykVEpg0DV2T3JHCCJqpa2ISGoG0SqcwyuDL6ekRm11OraJ9vpnf2g7eS2kit7caKV9veGi75NpMxyf38hhUuw4FL2LvbpW+uOyvCpoqVbWozhuvJG72UhM6dbFURVJSEZk8NUmgrS3RG27o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VL8wXUdQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4meZkh1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AB11dk438809
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 14:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VDkUxqbhmmq0ZCCW/L+xCj4h3ekuGY++VyjKuMGZDIY=; b=VL8wXUdQ4po/Qnu3
	IIyv9CggcnRfNQqgFbKKtZFdte3Lw/Qt7vA41FGJdr2HHvzN3f+/hDwI9usFptga
	JGv+NkyoHRSoat9CvniYRHDj4RB/uCdWNIUIS+2Vn0NHi8OScwE4/XYj5vECTx71
	F267etcY4QOSxU5pJe06sRaLYXU1gaLASHJtJwigFaYL4nFi0omgdXb95XsR28Mg
	Hwlo8i3qb96t82LB+Hg4Srso1ZPNry4ijCxMzWrhUB5p//FlmqMuv6TzwUS5M2w0
	Ab7Nai+HM+dORBYfwt7FDsVZnQz1uHOvCSOGeaEbSTIt2O0s5HCSdE3g0PSHQ7Th
	Znl2yQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9rm7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 14:29:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb485c686cso51977185a.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775831388; x=1776436188; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDkUxqbhmmq0ZCCW/L+xCj4h3ekuGY++VyjKuMGZDIY=;
        b=R4meZkh1hUFrleaqWseGO0N472zOwPYHDa4Q9hOsNlsHDkBiCxgg4jiOmSGmNntOn2
         FZbtfy7jucX5IVVpM0aM1AsG2L+UOz/hwdvq5PVP1shN1Sn8WgqwKVOgYCOVjfUo57HQ
         9m4rsGi386DOoGqRZBfgLJ1M110ZHFTHmkdaR8ZR7wUx8NLKVy3QUKPIPraLHA9nsUb3
         Sjxx7sgvD2dT4dL2vyJzSWGUSHY4E/qOwGZpbo8nNJikxAIM0M2Qw67efhJBc098e/2Q
         L2lQvd90pIIqcA0vmRNSn+SwCZ7j2oO+tPjPGF0tNnxkOxx/l+2jlhUNC5pgy5eJYy1g
         qXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775831388; x=1776436188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDkUxqbhmmq0ZCCW/L+xCj4h3ekuGY++VyjKuMGZDIY=;
        b=VKtKg5VdM/sLgMBD0qO+oGlvHv9vdm3YHg5WQoGHLhIJiMrdEDfQXpJ2bk9AxIzbeb
         +cytSsqBqS/3BV/i7R7NygMTQ3f0tZZIOtRzA6d7AbIlAE82iIn/v0t5zfrWm5qAkZPn
         uT2U2bYB1ePhMQE6/dZrceZo+SagMpeABWRs/4qQ/b93wboKxZeX1dG1/tVW94PYW/tf
         yB5gPregZu/TBg2OMhDOdPiCFsf7ZbzGqizVQCTgkRuRCAjv9SObtwHfuAinz11P2Boh
         tJHBT5HFXrX8EWIRd039bdkSNwBV3EwH9Pzn3JviaVDWqRzefauZjYSP0Ub0o5yWaXKc
         mN5A==
X-Forwarded-Encrypted: i=1; AJvYcCWrQ4gHCk7H7zMpV1dxYLnT2Bn9KvPZTP1UuxsroOpfgRnxf4CJslw0r4X69mPLcn+XINdZOhNu118=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpMZsM+uQPlUJWtSdhZR1tmrKDVt+HW3nZN85vzRPrIbujCnQO
	HY7/jWv8+G3SgOUVQdVf9g//ykoDr2Hn2XfiP9zMOpei0TOmPK3U1iuLY3z+Zt4LgKoHRviu/A2
	pH0yRFMgjbpE3Md5RrUiC4bS8jOO81w7fZ5V/Roxg3Tn02e44ra/Sudd8VltBlEo=
X-Gm-Gg: AeBDieuPI/sKtbKq42cG5+kUYwKaotDjF1882GMpS+KLOLl9Ko1tUzuF6KM3KUJ5f85
	UQop14Cs0fYkA6alxv2I1QQXox8aXEHenWDHeJfXbD8m8Fylf7h12LU5RoVKmin1u05ugg5SlHs
	KikitJ8VMd3X9ja5eHDLsD2+hbv769qZkcAkP25azAdniHAZdjRK3L62UUzTSg0exYa++Qs+wjC
	pA7/l2g4tWiDdx0LPzyjrCgXf050kX/Db7Z+R2/u3hlh0z+WpdAOU9WHiqGWumrxgKxvkuLnPdK
	qUll7R9cOdJia6MuLf+aT2Y+FrVNAQ+9ZXp9E9Kn0LqNQrXla2m8xVd1p7mfGkwGTLqUawd2VC1
	REmIQQogd+KJpAk/8LAHKDlxpriABGxzsgbFL5t8V7vx6kRIA0ZdKCMlkWZzHHYCxblvYAlvl6d
	Rdi18=
X-Received: by 2002:a05:620a:179e:b0:8d3:a311:9277 with SMTP id af79cd13be357-8ddcecbe10amr308021185a.3.1775831388074;
        Fri, 10 Apr 2026 07:29:48 -0700 (PDT)
X-Received: by 2002:a05:620a:179e:b0:8d3:a311:9277 with SMTP id af79cd13be357-8ddcecbe10amr308017685a.3.1775831387548;
        Fri, 10 Apr 2026 07:29:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f5b31sm621074a12.11.2026.04.10.07.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 07:29:46 -0700 (PDT)
Message-ID: <7d65539f-ece6-4e7c-a13e-6b12920346fa@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: debugfs: Don't stop reading SB registers if
 just one fails
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        usb4-upstream@oss.qualcomm.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409-topic-tbt_sb_debugfs-v1-1-131540e0cc2b@oss.qualcomm.com>
 <20260409120457.GH3552@black.igk.intel.com>
 <75c962d1-7ade-483b-bbc9-a6c6140fc0e9@oss.qualcomm.com>
 <20260409143203.GI3552@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409143203.GI3552@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEzNSBTYWx0ZWRfX/SNnbtd14smz
 bcjgQ5e24KvQF1NXM6EL3RCW5Qw1mmKwJO24qEz2fVr5x5XtZmWQ35420Tyc1dNUIAoe0UrahNy
 1SdPIR+TCAFK8GiGdikyUmD8vY843Nqt89Yfsuk8RmhUibQ/IKsEhb5ra3RvvhZe0guTcJlhls7
 LZ+jNEBkxGr63SrCtdQrQTuIME4vA/ve0g82Vqs3+X5z8Qy0aki+Vnscf2QwTGGgXkcZLLxMYjf
 i8C5QvMOy/CDRCLc5raK4ghNlKEV9lt+ZNr/iuIaoMA1wm/QIB0iPPPNLvFBnh+oFX5IA8guoF9
 7Ok1daGgluVt6KQhdnmVyq8/iNrjJyz/EbkMJiV6AtnbeinXZYDHWEymdIeoPaWsHtiHthvNhsQ
 6pqY8EbtyFoZLC57ltNfzEvMZ//ynAShl/G4zuL4VABNcsFXiDaHLtJTa+guJLSl1fG8r3jr93g
 B7o99IVadh9JhWkst/A==
X-Proofpoint-GUID: qgiUnlBR-afq65HdjxY89Gvjv2u272Of
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d9095d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=t5gs6XZINShnl3d-aGYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qgiUnlBR-afq65HdjxY89Gvjv2u272Of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100135
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36138-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FD893D8B4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 4:32 PM, Mika Westerberg wrote:
> On Thu, Apr 09, 2026 at 02:59:22PM +0200, Konrad Dybcio wrote:
>> On 4/9/26 2:04 PM, Mika Westerberg wrote:

[...]

>>> I assume you have tested this on a hardware that supports this too, right?
>>
>> Hardware that exposes that register this does not exercise the altered
>> code path.
> 
> Well it may happen now that previously we got -EIO from some other register
> and we stopped there, now this changes and we actually continue reading so
> this definitely should be tested.

The only register before USB4_SB_GEN4_TXFFE that isn't in-spec for
both retimers in v1.0 and v2.0 is USB4_SB_LRD_TUNING (0x07). The PS8830
interestingly reports all zeroes (not a bounce).

The registers following USB4_SB_GEN4_TXFFE in the array are
USB4_SB_VERSION and USB4_SB_DATA. The former is not accessed anywhere
else in the code, at first glance. The latter is, during NVM r/w and
in margining ops, which have definitely been in use for a long time.

Plus both of them are the v1.0 spec. The USB4_SB_GEN4_TXFFE specifically
isn't (the retimer supplement pdf lists it as Rsvd, the main spec pdf
omits it in the SB register table), as it wasn't previously useful (since
Gen4 came about in v2.0).


I don't think there's an easy way to limit the reading of this register
since the bit indicating Gen4 capability is in USB4_SB_LINK_CONF (0x0c),
which is Rsvd on retimers regardless of the spec revision. A connected
port could easily have higher/lower capabilities, too.


So all in all, my understanding is that any bugs caused by this patch
(which would have to be in the form of "reading a register causes a
wrongful change in behavior") would really surface spec non-compliance
from a retimer, which should be quirked out explicitly if that's the
case.


I only have hardware with various Parade retimers, none of which claim
Gen4 support.

Konrad

