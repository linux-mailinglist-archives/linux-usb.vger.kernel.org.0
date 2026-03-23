Return-Path: <linux-usb+bounces-35327-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO04CtUfwWnCQwQAu9opvQ
	(envelope-from <linux-usb+bounces-35327-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:11:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E42F0EE2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FCD130DEA8D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004CE395DBE;
	Mon, 23 Mar 2026 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8EQxF/q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5nDWRqC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7F13932FD
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 11:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263722; cv=none; b=PwdCZC4cRApYITEDjD/tFuB4MFXoLbQAmDoNV2GUHpSONgLgd1CzvVI3XzPBoO7Dwr3WO0jwf5V/KE1TyzTkD2ilQ1YKPiQTLzpedDMHRfeQf3kX6RuDTnujAbBP/ArBLbq1O+JPmmjBtPDDA+lzdcwO0zsJIvo2tKrNR84x2A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263722; c=relaxed/simple;
	bh=Qf/SN4zw2xWU8ye0fNf7azjg6g0yfcgHYpQ+XwHTqHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLfDSNeENj1Cp+e/0MbdydL3UJtGN4iwpJlItSgWf6K8JHuvr69qZUlYtPtStr4N+HfeD5P1CS3kIHp9cKOf85W5EWB48aJd5ivyDrv7ozNcEk+VM4pfLu8rNbL8/N4I1JEnSqTLtHsA/wkrdGAyEEyyrA47WqbEBAurIRVEEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8EQxF/q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5nDWRqC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72uwI3393276
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=; b=Q8EQxF/q2qBn/1+7
	VhjIRX7UMnc+FO1L4p+Bn4FV0B7xwfwPs28PCP8u5tCT3iGdzqIZzleFXAnMb+MU
	O/gV3Vf47lz4amtpZ8+9qgf6jIM6Z2VtQgd0GEKW1o74XzeDXOGQMzbbCs0hqzn2
	moX7hBbt2hRaR1KrqklgeOueVJgmwFjrdT7l6WcZdIOJarKKltNzumekZIN+eJpg
	C7hDElY9W0Prq/FXy3qaNtW1E4QwAQ2ppNNs0O4c2L3wpX2hKWFlpiHov91ne0aV
	s8aTcRqmIokZ2srBDO/9Ai22t9jpO93cwS1TkfPjDPrhYJQL7hpxDAkcJqleGksy
	wPZSFg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jyxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 11:02:00 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56c9dc1e280so803026e0c.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263719; x=1774868519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=;
        b=J5nDWRqCAdNl5Pf0SofklmEu/l52i9jhA/MOJoBlIGyrAY0WQBtYY3/jT0Kslim/Bj
         aR0wv3S7XrSBvXYA1EaRUbizdixIX+6BMlTpbBPtbeYJwKPK6wqVM0XqCdZQbxJw+T/k
         mp6Tm+WHR4BgpaI65n2+JckZBWhdBb16iwK+Gg7OWnRNabls/m4Fn2r+wISDoz9dFbiH
         y8ldK9uY7hLro5hzGXSiZ0H/zBLk7cyWq5+dZ67jaj1b5tvFatUC3ChOeOyeViRqBUfI
         w060ZwIJvpMiFxgDCE1xbk05LLYs+eWciKGEhTpFk+0CUrJNjcEUcx6W9RG7BOjAHhm1
         aFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263719; x=1774868519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oV1y3FgGmR39hQDlhY9NIDlejN9+NoS7s32ITXTMSSg=;
        b=N+7mWHJJ25NYe9u5LacQXr+eLuTwNd+XgNB8lcTbqVgG0g62tYF3s/924KiwNTZw1T
         0Ug2rsynenttprh7dAcSuRdIZDOfXtLYaolDO3ZZJCaKJQK+n0VZm/ZVz0kzwB9o0PoA
         NvXdg67JbiOAx+xpuHREMtWDmhyLQu3kDJEWAbGvOq/mtA6Bz/xwk24yPiwyi7xjq65N
         QyPSpkm/QMv9eiEugOjHcbA7f8F609d2Dw6ViFVTtmWr2gWKyIGl/CGCsH0KtWCFnyEw
         xnA7iBhzwAHpMEDACUrZQEpOICgjYwJ3DrgX4Ow6956DjHd5RPU38/0e7H12wN2OLjOy
         vn9w==
X-Forwarded-Encrypted: i=1; AJvYcCVJ09rUQp4G3lvM6i5L6Ql37l69Y4gLs8KYyhzzCTK8WQ3J1ngoU9C4OgsxqE+LppvDKgPcW1OI1A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnjSBq1u3/S7IS+0kHLEUQy9l6KRMURqSiGvMGNQow3GxWH8vA
	IjSmrxq5ZlxLIAXGdzNXdEFFkMlj198jMxJUckYYHBGVJWdh2xVzS4K2bkttmjIqLAg/h19ydrz
	TTYYQeyDuGnaDnV4x0DjF5J2dNaaCStbwxE2bmEQ7AP9f2f3fBPfLH9ITay7cAKE=
X-Gm-Gg: ATEYQzymL9EL/bb3gm44DmEXg8zlw+2w7Rpl3/fMr0+Q0JqkWBsIE8vvFzcVviutEuo
	dDwNtiL8NFjfNayz+/4oXg9kJaDtvFQi1UPXYp88BtTjry69mfhzFohzRpj0zqKVWb/IdVpyBMe
	gQUCEem/wkBk1Iqy3K6UsFCPK+B/Oayet8tuXl0SoA+Mfwe3x/g5yGkBOil3+HF9uN1ELUmGSAh
	Q6SibjfDLbhBOcXkdRFGkFSCUB9GWN4pJmDgXh13IET+ZtIbbkV7+5LIHSsUL/2DrUYPt1P5piK
	c7H4FOuG9XGG9NQSYB9YhZCaBtKoRfadT//24Neu0mPV9LJ8pRkhi3y+MgG3/nV4KH9Qm63QWZd
	jp3hJ67/oaK85mRDyFFiZ/SonQng+EyFlq1QB1Q4zDlniK0+TDZAIf0H0+s8izToZWzmcdgKhTn
	d0sAA=
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2186007e0c.3.1774263719484;
        Mon, 23 Mar 2026 04:01:59 -0700 (PDT)
X-Received: by 2002:ac5:c0cf:0:b0:56c:ce6a:90c7 with SMTP id 71dfb90a1353d-56cde437c76mr2185959e0c.3.1774263718977;
        Mon, 23 Mar 2026 04:01:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de182sm473308566b.38.2026.03.23.04.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:01:58 -0700 (PDT)
Message-ID: <e5a8c3d0-7f7f-420f-a5fa-cb177d321112@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:01:56 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: usb: qcom,snps-dwc3: Add constraints
 for SM4250
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-0-3bcd37c0a5b5@oss.qualcomm.com>
 <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-dt-bindings-snps-qcom-dwc3-cleanup-v2-4-3bcd37c0a5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NSBTYWx0ZWRfX0iGLFRBjEkEw
 bsPL/3Kfnip08p6NC6u1258D4UszfOcy/4PIDuwZLINcv3vpfWUMK9NhWz12EaZulD90uwMlElz
 z7MFWmZ2ovNupm8P1D7xf0sMjVtz36XCcfx5x1IL3BRpszxrlH52rQtQ0L2SSrWOr+XIVoymnd8
 xdv+GmJQsMWqPh+Y7K96YFNqEYvIQfe0LfHHRz8yB0Bb4Rs7HqTogsnoYX5E9VOQR2gQL6AKGeG
 Hg1kp1omszDkwXeK7V9PtqidUoTWXh934WEix+iFeRtTeGXkv3Dr1YnGwapnu4l9FreZrw0IAem
 SvYGARB8nqAHe4JgFfms3kpJfV3VYQ5AQkFoQzhG/kF9MVUD2hK1zt+kXTE9DqqsubPjKnl9Tyx
 vh7xREAlEVIkpS5v6m/aqAhEWmASkWJTHKMsnUECFVCo7VwVnWw3ZI9qZ34H1YKinwK0fyNbecI
 bjqxt2p6V3ODRJvgdkQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c11da8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=5GD08sD1clYvvWNuh_EA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: X0oMIcvEjHZQe76RxwNynmZ9sOU_02_3
X-Proofpoint-GUID: X0oMIcvEjHZQe76RxwNynmZ9sOU_02_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230085
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35327-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 984E42F0EE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:54 AM, Krzysztof Kozlowski wrote:
> The qcom,sm4250-dwc3 is already documented in top level part, but it
> misses specific constraints for clocks.  The SoC is derivative of SM6115
> (or vice versa), so the interrupts part is incorrectly placed and should
> be same as for SM6115.

They're the same SoC with a different speedbin fuse value for the CPU/GPU,
I'd say drop this binding altogether

Konrad

