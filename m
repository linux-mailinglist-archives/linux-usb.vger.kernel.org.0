Return-Path: <linux-usb+bounces-25954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D2B09E5D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jul 2025 10:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08A447A5B57
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jul 2025 08:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632AF2949F4;
	Fri, 18 Jul 2025 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/7lG6cE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD0291C0F
	for <linux-usb@vger.kernel.org>; Fri, 18 Jul 2025 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828748; cv=none; b=T4omPKo/DSKZgZioufgX8FON+I+c7Tr3hg22BeWF8a6bq1azCKqgw8svGi4Y3ujPnmI3KAVesY1ccDFFtxWvECeix4mKa71Al+AO7CV7Z2aGtu/jqYk0G2hvjJjtC88a2hzamYJBd9T8591SC3g2Tpisxt+sOCmsOrDq35aOIF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828748; c=relaxed/simple;
	bh=7tLUqMMeWyUSVgHeIio6NZAqwLFuscFzmDiihAOR+Ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0OL/6Wt2crvx1lVrnXxFrKfWez4Nt1sPJAneIQ5IAEROTPQkdHAfu5jRq7d0mgg+L2vmYI894zhpo6u4QMhV7peTJSoFdYPM6qPzqEcCL2Zs/LiSlAKL46OiJF8dxoQVaZwktGwCJEeJJROAIQi+xk6wP82RKm+R2wGOm/Q+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/7lG6cE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I7hWQf021258
	for <linux-usb@vger.kernel.org>; Fri, 18 Jul 2025 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12aFvAN8Kp4LU2nkNq4n4C57+tw4URn/SblrQcy62ao=; b=N/7lG6cEKR743O4P
	kOsmvxoV3V4Be35YVkAqtZpS0+HKcp8YV/eaXPs/YXhxy6wfLtR3WHnALX6XeRei
	41fvMOKM6ovFK7Ocf832YBKclvhSDaFbYZxwSeuFZpXXugZ6hQNfHmMMuDxMJASB
	pH81Ss7iFSgFiDPW00qDhXrPftd5ugAqTRziaPUGO4uuxkLW8NPab6YtGg1BNzoK
	bYfhrD2WJWqpNpqqHN3+kE9ydX9MZORdrkpTqs2dDu+AG3ia59x6XvZrZcRyntqR
	0Yhui/aFyfmft2JabWB3QzFG7T//9g0c+ChWtvIZtaM79M+aK66+xTjOVfcDkXBF
	oIRTFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpnvwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 18 Jul 2025 08:52:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab65611676so3959511cf.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Jul 2025 01:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828745; x=1753433545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12aFvAN8Kp4LU2nkNq4n4C57+tw4URn/SblrQcy62ao=;
        b=f23nAoiK5ke489oMCmPd/+OWzFeKuGhOJ/TMC5ioA/CrUC8DsBJU7PLcqWCoh5uPw8
         G0sDF9Ypmphgg3uZo7EefpJp+xnoc8AC3fEPJNhcm8hJM+htigs3dYwMRgBDrF9VIJzm
         X1USvIsgXzaUtUdjEYs9vsMTQIcNzE4l1val66zLapdkln08F7clgRUO8OR31iRJDHNB
         82Zptv46oecsADyQJ9BqTFbhQQl+HRri417rST+T2grLzhLumDLIIu3n7TY7J6lQQ8h/
         QSE4pF7MdsxwCwniECDBUpnId++wf8+ZkT+38K1boS/F7SHwNVTdQek/g3+CJ/jWbUNf
         faIw==
X-Forwarded-Encrypted: i=1; AJvYcCUY/d8SRLy4g8xHnbNIj9c07XiKRjJCYbsTn6TCMPkIvu1mo4Wso4mmqTk70miuqFbwpWn1jg+CU7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy20WCtHcrAnJ5tiK+VAvh6yZHNiuIZUEUso3zl/BYoF6yuTD1r
	fN3aWAjPa4JnHZnLbN3SVt3cD0mloGx1NTckfowrfXjtcCmSKuJdxOgzsLwY8+c/M8v/FZt+KyL
	JSUiLAMYGjfoXVjnxRkW28WcbFQ0PnlPo/sjkAttyBNxaj0s/L0I6yl/9IYKaN00=
X-Gm-Gg: ASbGncv4lovT4g5PhkTdfIORSsBzwssb1yDu58z/IRSy7214YOCNZEY2py5HRzOQN6Y
	swUz+SVup83qq9OIBRt7e5g3NpsSseH1Dx8CnTb7rFIla44x/xk+AnLNkRkHSRUbbQq9wg9112i
	6wGd9WQR/39IRailm3xIsLuRzEkJvQwt48SOrMHzUw4X2JusIcjZJlWuloBfmyUnR1+lK3BCBxo
	s8lIzriM83uSRlpejFJZ19LKKakDDb+HOjNj5B7q8/V5VmCNSo+aTlGQ3xK5ocb/0bH27HTvceq
	HrZcRkD0ZDP+UooRtPERVXuaoop9GIkrLmCP44u69Xi13t5fHmP+fQO1r0+A6VvNEIDuIJiFYXk
	+64LXLp2KTRcycxS9iCLW
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e342b41754mr492337985a.9.1752828745223;
        Fri, 18 Jul 2025 01:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyYtt2uQEVydMUj+p7jbJI8Tuc+iSxESKJDUyd5T+9D6g2gDd4+/Gf5X597HAoWT/iga1mSw==
X-Received: by 2002:a05:620a:2227:b0:7e3:2e02:4849 with SMTP id af79cd13be357-7e342b41754mr492336885a.9.1752828744783;
        Fri, 18 Jul 2025 01:52:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79b8bcsm82882366b.13.2025.07.18.01.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:52:24 -0700 (PDT)
Message-ID: <1e08ae62-9898-4a70-9122-5fe6a8d14f4b@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 10:52:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: dwc3: qcom: Remove extcon functionality from glue
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250718053856.2859946-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA2OSBTYWx0ZWRfX36qd7eS5ET8u
 JC9rg78H5Uf/q/DabmCngJWKMVCjzCilbnKLo0vSTUBZCe8R4YeyaP+zegQf2TvFzy8kK3fMCGA
 xKSYmnguz+D+JryjuK3qBm3Do/XDelo0eQLaggL3sJHM1hDrkVueMx3sKNxvOhV4GklN9czBxpz
 wVUYY6i2KW+j0cexF11swfsknKOT1K0RPZBZ595SED4BNzeq+G7ZU4EdacdPtJ75EAqdmNFtvRG
 nIC7WNyXcJqDAifntSGKEHn5OewL71xyiYDec7mbI7LZnGuBUn0TNP1AfBdb5TAOqPs6cuBarUB
 GGIfUUMtgNNrAvWlZYtLPPDXLyS5vAXM9Ccj2F2YD9/q8kLczFxS7YcihiP04AR1opowU12vwyf
 qOfOhXRNe4BW2ji1gNU777wAW5uyA1CM/H5MhVh2qI68uV+5ywB+Ovm9nyY99Zu0eQrVoLLv
X-Proofpoint-GUID: piVIp55WolucYUg07m_Ya9pSnyXGS3Ti
X-Proofpoint-ORIG-GUID: piVIp55WolucYUg07m_Ya9pSnyXGS3Ti
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a0b4a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180069

On 7/18/25 7:38 AM, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon. None of the existing in-kernel extcon users
> have moved to using new bindings yet, so this change doesn't affect
> any existing users.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI's Type-C Port controller chip to provide extcon. If
> usb on this platform is being flattened, then effort should be put in to
> define a usb-c-connector device in DT and make use of role switch in
> TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

To an external reviewer who doesn't have the context, 'flattening' doesn't
really mean much. You should instead specifically mention the existence
and purpose of dwc3-qcom-legacy.c

Konrad

