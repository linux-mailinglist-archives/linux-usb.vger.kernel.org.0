Return-Path: <linux-usb+bounces-37699-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECjpKdZKDGrHdgUAu9opvQ
	(envelope-from <linux-usb+bounces-37699-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:34:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5314457DB6B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E43A330987D2
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 11:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3FB4A2E3E;
	Tue, 19 May 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuTp9rRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ed2ek3lb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C654494A0C
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190060; cv=none; b=e04+FPIPAwD6UzDI9/nu+TPAYsAGx0BeQoRZsORdMOa00BgesZt2e6/jsCt+eIXWOMmPSbMMX25Va4MJd17DcTquYJZhuo422tQU9PLubWS0uOP0llXVGAc8EFqDx3/q8MA89sF8FX9628lvM0nPCnf5gs2Pm6NBOtxix8NcYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190060; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMbrZ4E1fFLDkKYIOTA5jQR+kNt+pCVKB4XJQz+BbGTJvo7gpUExr+ypjYUQVnNd4tigJuiYUiSMuoIrzELre1TIkMq/+U22SM65jyUnfS0gx1qArEi1X9DbWHtZ4pgjSX7opAk+EO7KoAV0rPZMc7gMrYtjCNXLbU7NcwatO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuTp9rRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ed2ek3lb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JAMgNM867353
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=BuTp9rRs5R6zT+Tw
	+zhpAUVnDBdnaDpZx3Ei733Gu8vC3HKNssbvUhQrpDdutZe0R+A11riq9F4Lq6fq
	5h/489yExhijycnwwHNqKXNyXCMsejrjYJb6zEgKH7GJSmQcS40NBichptqGrl2H
	wj2YJHUpmzV4mXaU5AwXnXQNxWpTXz14JFGmfUbreoZE4NQDbvCor9tlrydDfPNh
	K6coSxLdhqsTSPHE5ym+pBh7wuKZxgdCAHtnYcWVrBVF8GBcrMCq3Z0Xld1Xb3I7
	ip9HMLMrFSVa83nTOxkuLabmSaC3jy1/UUSkmbRN5/6S2h85tthlJXD+ncOjAof5
	Vf3UAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1hfh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:27:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so11690191cf.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190058; x=1779794858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=Ed2ek3lbPryftPtpVNypTNwvhkaGaz86uwBDN0UFVgOqtn5sxc0G00/CVYrcnl1Kgy
         kfXP8dsPm12fcTNGrPW1iWYKjHZPiV0Ixlmlh1bKjyz/MEDnFqYIEGXMHRLcJBFyYp+X
         RENJvnUKoypOreGyA2mU6l/QIscw2uu0JXdnEC5cV3/ypk6Fc23c8ukLnEavTPOKReyf
         IB6IaIaDzs4fGuEOhMnjyN96Fzs7slUgbn460QDUhjExlyP4+vU4sLpt0IkQ41wwNkPF
         mT0jQUMnJuODZESp9oeIdgwESNoOD68mIMLBlPQ3p4wdYlvibqIfWThYt0KaT27qj9m0
         C2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190058; x=1779794858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=jWf3UtZvx6/ZFRXHEfKz18yeUSgIWX4E6Dl2rq700aLsWSMNLxGlNSeBuBA8xNeH53
         BQbHKH32DS9SK7p7MLwNyLG9RmrlqB+rJZBKXznSBIN4RNxRZC0gcCwnNBeHn3y9Az5P
         QpQmxzrhIRyfjY2fLLbW42b6mJeMjSX7J9dpOwylFqu9OjmxazcNYBsLbZoRo1IwSs7N
         TBQ81PBGYjnejWmjUc/nPICAzAE2zC/FNxP8Rbtkk/f/zwlGwTBo4JUqroXQ1+FeO9oF
         5q45ihhFXNvU0TW/oUPee0W0lf4mLcKQFycOb9Uh8zUwrpF903PMrUmRAuZAKTnHiON9
         gkyA==
X-Forwarded-Encrypted: i=1; AFNElJ/5UzZNFFerdWQZGWBfWQSx7mMY/ETpcq/iavilgj2tsGUn1v7k1Gf86rBwFu9vBJai9WLKOJ+XVoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4Aa+yONejUuNxquee1ZhsTOa3JopDbjp8heJqf23BNdhFUu0
	teB9A9FS5knfl3zRAqnb5xPlRLJX9heh7O1KnSQyM6ZxxglZCwTURenpq7Y3ABbB162tRasgq35
	zwM326/4bAwXYB9T+FqYcRSpSgz+c/jG0d+tx+JSWYdfhivSVWa0gRc+Y57LopfY=
X-Gm-Gg: Acq92OGh/5a9iiFe2PWJ2Byhj6E7DqfOo85+F3qbmRxvl2rRCeeEpVXE058SIaL4fJe
	DZvDE+QgJXCIrJGLXSv9rbC9xEUns51zkP/S7JlkGslrIZgizJaxOjnAjoLR8+aS0H/8hNqTZ/4
	q8uAfPdqWf1cJxhpAzxGjP1xYjHfbKIrjGWbkFDQeZttNUxIFPmYL42bldQHa9xYlFvhSM2emAr
	ckaNExf7Fmo8MCpfyv3kxiJHfAa9Bt80rumStdZspg4Sa4YjnCYg8L0ibBZ7O0fWUmvuEmAHotw
	rLK6Ka+xhmgureHwD8bu/HeAkrAOY2SU3TWUFo1roi5iab3GJYZmpsbj4AAjYlVpu+0JxgG7rCV
	RZL1aLV9C1vGhpLbogaveltUGWw7scEZtl0ksczy90wHhxRjDpgjP7SKaR2wuYqdOVP+e1/tM04
	/EK3y/ETlyVrjmLw==
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr169080001cf.3.1779190057529;
        Tue, 19 May 2026 04:27:37 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr169079661cf.3.1779190057120;
        Tue, 19 May 2026 04:27:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b4069dsm6307250a12.1.2026.05.19.04.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:35 -0700 (PDT)
Message-ID: <68b28b34-ff44-455d-806c-d1a7cee44a68@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:27:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: pm8150b: move vdd-vbus-supply to
 connector nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfX9Nc1wBS56M1l
 SebNKM2EEKC+fqP8+cwbK6oYkcPQG0cqDcj+dcbdwPYps+7/r88A/1AbccpWadu8O/qAHb8C65e
 pgwQ0MLSpLaiQ29qGOOVnw/I4OzZEm3MSJg8HjsKFEeh9e4BU05JNN21V6OARgrXXYM00tALeb8
 sCKsCyz4uz3FL95AQnoMlEZb87besGROyesTgIk4e14jlCpSUTdFLTNkSf3rIJSDYE4SPAE+Be0
 jgp4lbf3gLKfgws+AQ1yqdzut0/iOJpGUD0hIaJt5BcbrZdzvieUlH7c2cWWGEWEcZIUS72BnmS
 pe4L2F1jkRAnMN8JbKiABU5Fp+7Y2RYndU71W68rT8N+Nlvefl1k+6He564rxPfPJu7D0vxnZXp
 5u9yh0NG4uZ4c3hLrE/pCgfHBddxqLw5D9+rNpuojK8Zdp7+07CEs6rPnqdi8ebDvw9vgmb5ZQi
 VTP6+RlYGu93VuQZorA==
X-Proofpoint-GUID: 0-35do3zz7ZOQ66GGoaxRlru08PswRFu
X-Proofpoint-ORIG-GUID: 0-35do3zz7ZOQ66GGoaxRlru08PswRFu
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c492a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37699-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5314457DB6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

