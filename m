Return-Path: <linux-usb+bounces-36202-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMThDgTX3GmcWQkAu9opvQ
	(envelope-from <linux-usb+bounces-36202-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:44:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E13EB749
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA13C3013EDF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 11:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2F93BE164;
	Mon, 13 Apr 2026 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xvlo/hKv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwwXgWNm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B460F3C198A
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080637; cv=none; b=cy774yn3LE+5+XIiAPbJHfP2H7CIkQSTGsXY8eo75mgA7yPzTkSP+XoEgBmuv8SmajSH8mpVXAdUCKL6RvQn+UoUd6/gpsnUPg+QYH3S6wrj+q9FGRf3O9bAlA2VFLohTI3xMzCgzkT8D/+aOWhlDKOx1fy7hWtVpz7dNg2VfGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080637; c=relaxed/simple;
	bh=i9efmPG4SlS24+mgUeX5DlBrdGjbZNhJM+Hmz6fjy2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHaIriT5CtngkcgG0eqzUZ92iGf9tS0iVFkSDhDypWQwwtezMd8QC9KtV5Ph+403PeylQgYYO+tdrkxPUM1HUdlXB3Z78UnrMCKXHW03tMyYCvqiyNo3+262Vd9TToYxa5WdAJgicIPL+PBTNKYcnd/X/7Zok58sY287QBlclvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xvlo/hKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwwXgWNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D74lUY3744695
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 11:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyq8cBSbpjr6hke8loqsoxNsVK+o9OThgby0fxjMkeI=; b=Xvlo/hKvjHPCWeZf
	VfwObwOPAE7skCV9LQuY9sh+IRB2YC5WttMB9v9mfTDlnHw43Oak2ru0iRyKh0zZ
	jPYOcdNcRs2zm/hnZEyWvVnwKtwhj0mLAEt9rodsUFbpCBBky81BflZQunJKzWqM
	xONTfA23CSJfp9CgWqJaFxX/hzeW9TrHj2+Bhf4Bjz278gAb0ba15hhVopopmdDT
	IvR6LC+jQFxnjoydVFOc77MXf4rTfhIRLC2OkYvYenRlmruj8s/9UuBe4yAxiuKr
	a/qVXB0oHN7fPFox54KYH9cU3cOf83HMX9wWQucWo347Wdr38+NwZsFovC0L0z2S
	6YldMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpcsw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 11:43:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4bd8e77dso5875051cf.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776080633; x=1776685433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vyq8cBSbpjr6hke8loqsoxNsVK+o9OThgby0fxjMkeI=;
        b=ZwwXgWNm3ZaQ5/euKF9VyIR9Hlr1EUnGbADOKusUkUOkFh7ka6fkc1CY8HTIiiCdLL
         E652bzGvtwzLPsRVqCHGeYZ7QhyHukqMBPFSaIBfqWhsegb4tYu0TNWbda3s1k9KMM5a
         lWEPRL0yvBdQzmoSDZX6F/Rccsq00q3/dzPJHsEmdTDNv/IkE1O3C4XwgRD/zsekSw9i
         h2sYWUJ+H3ihqN/zhKJjcmjVMWmggZhMDG2X4W5C7jdVpV2PpaWY86JDmxCs3a9+olKU
         7olmY3L64oNoAkXEcORUJSY5XjMmFLogYdy/+kKU7FmXaSez4OWBpQlyUwhbx8IghTCa
         8y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080633; x=1776685433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vyq8cBSbpjr6hke8loqsoxNsVK+o9OThgby0fxjMkeI=;
        b=qfCODAcgSd8qfPG4joFYvYdaeZiFn/Ewk/Kgs6pZLWRnz0X7C4pIME+P9pCMSPYPic
         zCEItxDHRqAEL++0fQXUpYo2OGakQRt6PcxdkXiREWPwv2YDqOS336uWShDl9mhhsq0G
         OFHOu1N3X38nBO3FdhlhaANaPFldvo2XMDi2RjYK3YF1nPXQT6KSIsu7rc7pPooKu/FV
         f3tsjY6/y9VTe0Ni0/EL+XYS4ir/rDXRDfKMVGOMHPfMlGVs1jPWYzVYmyIKLDjpZYDd
         asTLBjcO8v4jHZf8/Fp9vnAAJ/7YFik9Qf+m9sRmRH2Qz+ajrIxYPHv9z0UeoIITRjhg
         FYHA==
X-Forwarded-Encrypted: i=1; AFNElJ8/2KFTqIYtNZhnfLEJehD3n0MGanl8eQcI1GnypURHJmfJj6Oi33/I7DqqnC4GxW/t0WTAw958BaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEIqUUmTC4A+3MUnQCktRJOtQm2BZCBjA3lDuV9nud43rTrpWt
	mVadDOTRPliAJCWCgWxhln8Ht/mW2Zjod3o5hcYT8qZEL3WhOox/q/hi3k58Ju4p9ALW8wpYZNv
	P65NIRJlZsJtW7zI05Xdf/M91Z+s4jAJ9ymzJarL6kSPHVx90Ofw5f0Lmi6e3OXg=
X-Gm-Gg: AeBDietDCEnuioT1MVjIYc/LPQjixi1j7iU/T6OhG5uo+cV83mxVEP2/qmFaVioVuX5
	+J4gEtbxmwaN8VIkwuCYORVIBs3kapKQRqP2mu58/itfbgmfFOwa3aSPW7rQ/a/xSP9+9yYwvpO
	WUEQp5zerJsvVgPKE8wwbOjUVKmGebsNlLl+FWPwDBVxwe4gQwyOuSsSO05GB1DRpXXXGDsQjOo
	5HvpPOztA0DWoWsLeo7ewgF1h/NI54DxPVYn3GXHy1QiSnsPJwp0AiLFk7yjg0eGTH8HTG1Pr5T
	vOW+/1/5+4HyeC3IRonxtdHhXstgqicm5ulJ/hzoy21y8qs/AaZs587zTmxkx8t3nDobNrKX/1A
	8F7pWH70C7rtpakXaTrguvQpj7cJX2JjdxEWO6TGtvQ5wn5YhLWKMzj8NHniAxdTKq8xv76vGbv
	wKcos=
X-Received: by 2002:ac8:5a53:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-50dd5d40058mr145908361cf.6.1776080632957;
        Mon, 13 Apr 2026 04:43:52 -0700 (PDT)
X-Received: by 2002:ac8:5a53:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-50dd5d40058mr145908181cf.6.1776080632516;
        Mon, 13 Apr 2026 04:43:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670702eec4fsm2433859a12.6.2026.04.13.04.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:43:51 -0700 (PDT)
Message-ID: <f59c4193-7e07-4375-b418-ab019514fdf8@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:43:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] thunderbolt: Skip reading Rsvd SB registers on
 older-gen hardware
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gil Fine <gil.fine@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
 <20260413114015.GO3552@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413114015.GO3552@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcd6fa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rX3LUgZ8ABPdRQFCJgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0_Rc9_-IijVbkgfttNpTZXbNnnWuopMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExNSBTYWx0ZWRfX/XpnadNMFLKm
 7lobtlmzp3HWVIMCFRiqjbc5i7VXD8ajom0cgmAFauAvbEW3UpT/Aadz8my/wTEvMeBt5ySaQWW
 VfIeN3CPoqcsqbh2qzO2ACmq6QGISgzdnRAsJgWfYgzltmGvq0EGst9mjlc4YqufM6+ebE/Wc3J
 xwcb3EBQJOJsSMKjob9XTkrENR1rapwYZAfkMW6reM4e24yMrS71SsLA4c2vH90+U7xdxuRbvoO
 AT6QMhjrIq+vEzRzJ9KW/I+azVXVWRMC+jsYhcS1ooZGSnl6hfMVsMvD42NThmsj+SJeGpVS8TU
 1OrYxItboL9Gv6gcvvWnK76k6nErAY2UXUdGpv7sIqZpyXqIHSTeRWssnKtVcaRa3aeQ94ZS2gX
 +HkWAN1mgWl/NRmLk0itLZTiyZtmj0ZOUauZCFRKAmeskZErwdUeLlbUko38cPj1nB0gryGRX4L
 2EPERB5TcipQD979CNA==
X-Proofpoint-GUID: 0_Rc9_-IijVbkgfttNpTZXbNnnWuopMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130115
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-36202-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A56E13EB749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 1:40 PM, Mika Westerberg wrote:
> On Mon, Apr 13, 2026 at 12:54:41PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Linux TBT subsystem supports hardware aligned with the latest
>> USB4 v2.0 specification. In some places though, it assumes registers
>> only defined in that specification version (previously marked as
>> Reserved) are always accessible.
>>
>> Every version of the spec states:
>>
>> """
>> Unless specified otherwise, the Connection Manager shall not write a
>> register with a value that is marked as “Rsvd”. Writing a register with
>> a value that is marked as “Rsvd” results in undefined behavior.
>> """
>>
>> The effective list of SB registers that need this guarding currently
>> exclusively contains ones that aren't used outside the debugfs dump
>> logic, so just add the required checks there.
>>
>> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
>>  drivers/thunderbolt/retimer.c | 11 ++++++++++-
>>  drivers/thunderbolt/sb_regs.h | 11 ++++++-----
>>  drivers/thunderbolt/tb.h      |  2 ++
>>  4 files changed, 30 insertions(+), 14 deletions(-)
> 
> This is alternative for the v2 patch you sent earlier, right? I prefer that
> one over this.

I think they're complementary. This patch ensures compliance with the
quoted part of the spec, while the other one improves the UX and aids
debugging.

Konrad

