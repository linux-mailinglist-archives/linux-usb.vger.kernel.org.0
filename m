Return-Path: <linux-usb+bounces-36139-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIunLbUM2Wl+lggAu9opvQ
	(envelope-from <linux-usb+bounces-36139-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 16:44:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECC3D8C43
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 16:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53BCD301B05C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 14:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7703D6CC7;
	Fri, 10 Apr 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vj9FwUx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QwE3pNbE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2D43D6698
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832240; cv=none; b=S7yJS/95CzwL3orYK1EqddJUzwE8wsoDX3y+5xFI7ZEKrVcmatzhtlPwLf8I2wYNgrHLEgFQjqIRHsGNF8MSQoBDQU59bC/4eeQ3vKZFl0eIzrYT8TYdMFEabXyCTrIT9ujMf/rET4R4TR1bTplPjvaz+Xg7Wsc+0TSwe4Yr3mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832240; c=relaxed/simple;
	bh=eG5iDxFe+u+MlpyM8ayMAF31SiM8AQcTGiIqUlx+tjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CH6XoAIaJXYuBDEUstOPGEUfHP8QN+lJdSsIXKR8tCqUaiOmGDWgsl4fzk71ATlgNCkKxIxuj8rSdKW1cPHqhDILD71Lzt614W6jUC0SYgQKepWBKB5U2B8pyadnt/0wImHiPluiBhcupI15wFR33HhXP5+1p5HCpQXPEYtn49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vj9FwUx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QwE3pNbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A8b3Gr115449
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 14:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cOCg20NL0fDvxTUOy9qQ/TfIR1lIS+FZN3UtQUvBuxQ=; b=Vj9FwUx+2/K3LgoR
	083MxHtjZIptY9iMx7nnJBpAwavhAXK/Le3Vq4O1RWVHJzoVUKVhq48qOwC0AXcJ
	NF+j79DiNjktLeInKVKILYc8BxVpFs85hSzRohVWODx71OBfkj/EBRz9bxPtPY+o
	8Z1H73P1A9oHeiS3HG+/8u+qQr2IVhFafHjzsqsRqn84H+xTRrX32y15PlRCFuUP
	SnFrKczfh/WjZxoxLj8Ud0ggVPVOW2cZ6/Qurl6vQtwpKIon1ryxvyU3yytPBgW4
	6TBuwhuFOqR/KcTbQp7so7vURtp56XjANgfB8XgVy6xQvXb4ZXIf4/27dC5KflY0
	xD9KNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xc84d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 14:43:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b9074bd42so5992681cf.0
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775832238; x=1776437038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOCg20NL0fDvxTUOy9qQ/TfIR1lIS+FZN3UtQUvBuxQ=;
        b=QwE3pNbEAVgYEbG9aXVtAt5mlXgSsbu79mpow80c7lj1x7z6dDJlFb7WxkqnXrScd4
         EVcDNd7XoByK0zDRfes2xZE5AOekE7xHfbUS9Vy2ZJ6Uy3Tb3i5YRCgvYUkgGkQPAUx+
         H1EO2SKhywsSzE8ghBfs/FCSRr73opC43H24u4SR3GgVxv3FlOaoLwtWcSUM41v96qaO
         c/8gRQ+1ORNVppJFheczMbTrLXSEiy2DzSzaWfCHMW1VBSCfebdZeqFtsPUSU7C6XpNt
         tI288K7z5UXCLYC/emU20bgoonZsZ35V9fWCzB5H4XowyvR8M4LNJ3ozPELivi5yHSBG
         e6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775832238; x=1776437038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOCg20NL0fDvxTUOy9qQ/TfIR1lIS+FZN3UtQUvBuxQ=;
        b=s4br4v0Lk6rnByd/gzrGbe9mdHFZVZKBbyVrC9QBhRDgrzHu1Rf5j8kIo+PnnUE+m7
         H6CjK6OhZu2F9eNj9t5THAaK4y9I47wuJkvbn33b347zlFigaJmmysfVSfYv+jilylX8
         a2k3uwc4ppPPXUL1DzJ/2jrY+XxnjzjNdXxO3YQbmMEoVAR+FCpvT41+wCN2Kxiy4/rh
         Qf9e94AZj79pSUNc8Jq1f+ShbSXHCnUG/nvGJDtTjL6GBTDylgONA2DhCLsnjc2qKDgr
         dZqxtVDbUH5QnawQJvAX8+kRf8Qm/uwqKS0ktQ3x5Pg1OAjhYX8/8hrKKxTLiGTM74Y7
         3Zkw==
X-Forwarded-Encrypted: i=1; AJvYcCW7A3p85s/ktofv1HQajn00pUHPbovAnojTTWirnrUE/eV18YQauvTBcod0ynyjcpNwcgXlVGm9ELg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGij0pNktRTOytXBSuPeKXiwwHb3UXtIX3WW+jdKbFaOE8Tdj
	koJvL/9pq+6E6+Lu34gt2Jr21XL1ehlwkjv3/5zCSjYfqb4ScS+vGpGmUJbz9w6tsRT7M7wnqoa
	trLK9gV9riB4L1kM9FMC6RbGLjNZN+pvSrvTz7/8Rt0wQdPLIzlnymMZG+DwGhTE=
X-Gm-Gg: AeBDietyEY+ktHSpcAuaBhtOR6LeXjqdbwARrTc89GbM5w+xmjpVrxi9xWqChwruqUA
	TjGPGzfsk1qNv4sJuuJV6Ed4Tk61XUWZ+outN0e7ALkBJ1M1va0PdL+vje1imu7OVuT8eSN29e4
	bLSdLSh0Xo0rt+tJYAsHmgAq/8r/ksoupv+NMgb0j1tMnVTjUW32YhQx3okkCo1pJN1jw+xxKSJ
	X0LVGSHCtBD3LH2wyfBD1L/yWCBu/JTl4wVC27VifsyCGTRDSNiL8o9B+0rhoHl72jEZTHN8asA
	JPHcmJ31zhMJ1kHTLd+Nt6qqPHHYMufYElJQTVQ5ah0KKAlzuyTREY+nNT4YDEWtsVSJZIYTq1p
	AmiW/26abZ9Z4vx3yCbfklvM6+Zu4gbfDM+WmCutJpp0t0bcROtROVoiEufag32YVLGxVbfgrMM
	+zFLY=
X-Received: by 2002:a05:622a:5595:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50dd5c8b23amr38355961cf.8.1775832237734;
        Fri, 10 Apr 2026 07:43:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5595:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50dd5c8b23amr38355561cf.8.1775832237158;
        Fri, 10 Apr 2026 07:43:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8cf46sm790568e87.23.2026.04.10.07.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 07:43:56 -0700 (PDT)
Message-ID: <f1af27b6-e166-46b9-91d3-5e293fd6d74b@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:43:54 +0200
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
 <7d65539f-ece6-4e7c-a13e-6b12920346fa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7d65539f-ece6-4e7c-a13e-6b12920346fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEzOCBTYWx0ZWRfX/kpq29RscUuj
 w8rN0ElWieny+qb18scOZt53A2L8b/v7EFGNKJcg69yOM44aEZ3sEjnczdUFBxQHCDJHKXMwy+X
 nAD3G5fgT9cb4u4CCw1aV3DUQJ/mMTKVGnTcrRuA4oOliJyeSNRiK62blKpVU1Oh8HI3s04Kp3P
 /NunqUdQ/qNPPcuVQdcc89Skp9GnZiQJ44HuX9QQuY57id6iV0vgcQjcdIaoYm6u/LWNXUtdvc4
 q3J99KL3vh30utlwhKyCaFo20wp2IEGCxxk/51F2yBzE2K0sFzpPCSEtOZuSDzg6s2lV0ZcYYt9
 1Onqd7rS0E/9IMz+AWMxmdZZOEEG+hV1e4AWGrEW3kYezWTcVGbokHhTruETE0u6MEbu12t7Q+z
 oIU6z4GM+uyoXXZxPuGzP0YEJlqSpvlfk3c1XIKyUt00c2KmoPviPPFL24wNRYzmChGXgxyQqWQ
 ZT7T2NIs+Y6oNqKhq3Q==
X-Proofpoint-GUID: 8s2z06EUPEyz68hF4wZVju-m_OVl809k
X-Proofpoint-ORIG-GUID: 8s2z06EUPEyz68hF4wZVju-m_OVl809k
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d90cae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_aRDFbF4L5SVI7mo-8QA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36139-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50ECC3D8C43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 4:29 PM, Konrad Dybcio wrote:
> On 4/9/26 4:32 PM, Mika Westerberg wrote:
>> On Thu, Apr 09, 2026 at 02:59:22PM +0200, Konrad Dybcio wrote:
>>> On 4/9/26 2:04 PM, Mika Westerberg wrote:
> 
> [...]
> 
>>>> I assume you have tested this on a hardware that supports this too, right?
>>>
>>> Hardware that exposes that register this does not exercise the altered
>>> code path.
>>
>> Well it may happen now that previously we got -EIO from some other register
>> and we stopped there, now this changes and we actually continue reading so
>> this definitely should be tested.
> 
> The only register before USB4_SB_GEN4_TXFFE that isn't in-spec for
> both retimers in v1.0 and v2.0 is USB4_SB_LRD_TUNING (0x07). The PS8830
> interestingly reports all zeroes (not a bounce).
> 
> The registers following USB4_SB_GEN4_TXFFE in the array are
> USB4_SB_VERSION and USB4_SB_DATA. The former is not accessed anywhere
> else in the code, at first glance. The latter is, during NVM r/w and
> in margining ops, which have definitely been in use for a long time.
> 
> Plus both of them are the v1.0 spec. The USB4_SB_GEN4_TXFFE specifically
> isn't (the retimer supplement pdf lists it as Rsvd, the main spec pdf
> omits it in the SB register table), as it wasn't previously useful (since
> Gen4 came about in v2.0).
> 
> 
> I don't think there's an easy way to limit the reading of this register
> since the bit indicating Gen4 capability is in USB4_SB_LINK_CONF (0x0c),
> which is Rsvd on retimers regardless of the spec revision. A connected
> port could easily have higher/lower capabilities, too.

Checked again, the USB4_SB_FW_VERSION (0x02) register's lowest 8 bytes
are 0/1 for retimers implementing USB4v1 and 2 for v2, so we may go this
path too

Konrad

