Return-Path: <linux-usb+bounces-24323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609C2AC4C7F
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 12:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1533B7929
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 10:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E432580CF;
	Tue, 27 May 2025 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Otw7rrQu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC08F255F3B
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343314; cv=none; b=GnKIB4p5Vdv02+huMhf9QyR9xGNM17DwMI65sT8kVTbc5MLjFUXo/WdXwNN2x1mEpqww5ZufnBoJj/PHc5M4uq/Ro0mtxbWgSHGRZumJB0dwOdf9u/+v9tZraNZIueOGmSd3lMCxldI3FO5vknXmFJ36fEeruBs8tpIgXMB++4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343314; c=relaxed/simple;
	bh=O0CKMs1r875V1oP4qm65pFEA4G9zLyPyriURw406bEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skAVmdZqvYuNLDOGEEKVYL7SmY30tukw3cDXnT/8oZ5soqGVHcY4SLA7c8bJ0PxFh6Hqd0XOILatpkBWhvGu0+Ck21wmizQjoNkk/P1ao720wFZb0+v1pj4EjLeF1UpcvcWhURx4G9eAdegH4wCAxq0sPzYr6SIg9SqfAixnzUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Otw7rrQu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAOm6a002523
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 10:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QaN0jDgPB/5r3SY7bQD6QOdm26/CK5MylAtZs3M0Wg=; b=Otw7rrQu9o3Bd9nY
	gqO8p+fVniWgwLC6FBk5cDzZ4kUoQn/DCksFoErmbw2QWh++0rtmWf7o3RLWYbON
	H/WwCT6n1luUYXqetqtpkY3fPG8T4o4otAA4gvnY5Ou7mzAl7eE6WUgLp0mKbYHi
	cvVlQALrNXSiss0hbpwCRH6ZEJ87s8NeH9uqXr8IHbLqxhSnRVh/Pa6rlBBPnZu9
	iWE++XbHf5tYnWkfxqixFIVwUZ/qGS7CAETBBzabGGdE4xWMD0c43N6WLSZi0Ta/
	sFXwAeI7NkthQsX6rzcq24cwXa4msauUXZzXWEltHR5vHMn22QLlO4igclXTB7i1
	mN7FRQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjpju3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 10:55:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faa8342503so3315246d6.3
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 03:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343310; x=1748948110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0QaN0jDgPB/5r3SY7bQD6QOdm26/CK5MylAtZs3M0Wg=;
        b=khKX5FR3qrSybAM0gmdmQnVk4JxNXgHHWBy/4KMvsBuuz+qOZg7YqSRyLU4+ydaEpB
         2U4xtpGfEtPIFiKzUE3QAkJXnxH8LkxFroG0dURxRB0y6YUnz0K83oV/GlwN5/8KgCBM
         sl6YZpl6RIrZKhdx2+8fXaYKH5AnNoKKZWW2WJ+6DtVG1SVUJzNakmOqkNqJtMqcHOuS
         1SvEPQqqC6EVJP/gVagZqJ/zBVV5kEuyPo8bmGPwNIXxpzhUlsA9D/6ilfY98En0L7bG
         0bPKQSBTeASeuX/lebjadlMKPN9oygxc58LkzshbFOZBCAI7CYt9BMTEmeRRJvKvHJot
         IPzw==
X-Forwarded-Encrypted: i=1; AJvYcCVUbxNbcftmr2rCIh0EfBW0H6wwuAohuQ7rG9gm5VQN3b9ay+Q1C9EjgwYfKUdz0zcuEobADRJvZGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqNxREHniJGgmW2j9JdWPE89IW45fxE+lggL87jt78gs2aXMo1
	VESdYNdW0jU3D7NucBADqOqmwHUkW3TYTf639Yc9toHg6Ql2FDjOT8Pz//ygHrv+yXRj/j7QPe3
	qqu3XWs+KutpZ9qXiDHPLkisszTKjM1LbjylFqTTQwamH+jJYWjZ7dZEjaNg+lJQ=
X-Gm-Gg: ASbGnctwFSCEW1xKVx8ZlqiJ+aM289Zcr6QAFB3FytDU3hXm6OZ3k4Q56kxRE9h/pZA
	RgcW+DaXobVJo98V1T7O/MVcmPv3ySlU1tZP9s2x/b42+Sl2v64CPkN6evJYwKluQruqTT/NkwN
	4ECr+Q5ou1HTpLtGGU5P75Q8conUpRGjvWogDxbYSbkyhH6kReJyHUfMYuUOIiRVSM6bnjFucKY
	D2kwSGKsLKkmg+pO4vQf/D0JZeaQSHbQYwS6qsMY8YkPNriAgSmCdraUEclJEv5jVwGK2UkHEXU
	MC8sVcEJlmPPKkSSYmtfAGu+cxXacxH9G8gIYn7t8l3TA/Rd/vEm/PtdeIAYJc01eg==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr67671226d6.4.1748343310286;
        Tue, 27 May 2025 03:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTJV7hGI3ZkwSkprGN+pDgA9B/aLbKDp2MQye2teLhkvThg0W2kSQO/Ud2VQBEXioadf+3JQ==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr67671096d6.4.1748343309770;
        Tue, 27 May 2025 03:55:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-602cd35e2fcsm5162433a12.73.2025.05.27.03.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:55:09 -0700 (PDT)
Message-ID: <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68359a0f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vupSWsNl5j4Ukh8iwq0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: JXDI2dQqhKL-z4Zeap0unG5nh8nsWIur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX9+k4+qWyZgo2
 7dK8e18dZBQLstw4t0DiunuTpFLMMUbF76+zNWxAR+l906XIT7vDXVEFoocR4rsnz7vXXCKfRtx
 dCvLYuLO89GoNX3igIDp7Y/ucWAfxtOc6/fkeNjBLiicfcCvjR+D6f9mtf0LjfKjyxkSDNs4Cl8
 rgt5lcjnnO+ShgRDnmy16WE59QryC7WFcagQkbi/hxTFFk6r+4fErvCgTnHyDCS4BHZLrK6i1Z2
 4ahaiS8Hkz8xug9uady+ONfciG0wu4r3etxN6a4yfjTysYlbeJ8zxuyTCmZiTMD/3jkB98L+/dV
 o8ZtdJrskGR7LCrkI92NIYEVI9iu47LTshYKKCE7uHb5HTa3dKX+wUkDEPhxug2P4RPLkbHqSJ/
 X2izVQ0mr3YZfnPSUkanFlmUbp5lsbe9BuPVZVB5U6rJPt/z2yj26VDVl3xcHjFVF8vSfq/m
X-Proofpoint-GUID: JXDI2dQqhKL-z4Zeap0unG5nh8nsWIur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=833 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270090

On 5/26/25 5:28 PM, Rob Clark wrote:
> On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
>>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>

[...]

>> Yes, please. Don't set okay status for the GPU until it gets enabled.
> 
> Drive-by: Shouldn't the dtb describe the hw and not the state of the
> linux kernel's support for the hw?  Ie. if bad things happen if we
> describe hw which is missing driver support, shouldn't we fix that in
> the driver.
> 
> (In the case of the GPU there is the slight wrinkle that we don't have
> a gpu-id yet so there is no compatible in the dtb yet.)

My two cents are that it's okay to enable it, at least in this case..

Konrad

