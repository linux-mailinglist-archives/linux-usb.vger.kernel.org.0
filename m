Return-Path: <linux-usb+bounces-24842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA8ADDDE4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 23:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 278CE17DBB4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 21:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A632F0C52;
	Tue, 17 Jun 2025 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgXIPI6V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F232F003E
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195695; cv=none; b=Pgh9fm9iEO3E5//kIxdgq773OmnYWGBA5fE1AqbyBLtX95E3uaknD8wqJoMmJDiw4ZSQyT/0oICzUwUziVcMwZHDDUz2ITPhaV9uRvDlXrf1hBBgMGVQUYN//wv5mS+N9ZggBbSfOl6Glvwu9IpIkVimH6ZeI39bCSJl7f4Pw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195695; c=relaxed/simple;
	bh=K3Rbkpbbmv50zU+wBTjmxAX1i3UJp5nwGfq7f7SR8+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3hLt68dU6U29i2IVAAbRiM8P6hMIsNX/RDMiii7WGIfF1sRMCn776TixrwdzZ80iYIu9KfkpXMu/PPVb0N8PlnTVSdc4oIKXR3SPKFS4xuhgiRHOLCMlg4YuzowB1z+GwAfZFzE1yVYOeFqlYtuKvdXIWOgdp3kQZG9pGnZnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgXIPI6V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDVsic015142
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 21:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNEZ7C8YHGpeeltsPa4+wuCabkqTlEwS5fdzn5tK/Mg=; b=DgXIPI6VKLBrpwEN
	iY4T0zBc4RypKh/iFoDABekZHMO/Wp2GBgVz9GO8g1ebFHYRtVkqUcedVJ1KVhdx
	xYwS2nfENApUzk3UMMUcRPOV3y2d1tiVmzC0oJcjcX5P/6fp5fNv9ZfgGVeyFyCM
	rpUbP6W091GerYDP8p3yJzxtWtbNdeMt3EZyFHx/o8cllfxkST+9h3PhsYwn+vvu
	p5oc8sYQ46by2ohXYUyZyyPmlDmN7R4i0EwSdDQxQmKSl9OcOJT0d26rKwa0/Qt6
	qHtjBWphmlhPzjNCr8f2I1fyRuwwbIH5/Rt6RSqKxG9QM67O22D0PKsDwgKoVY9q
	eiIGFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9aks9t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 21:28:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so190943485a.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 14:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195691; x=1750800491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNEZ7C8YHGpeeltsPa4+wuCabkqTlEwS5fdzn5tK/Mg=;
        b=dvaxNlxH0KLgk+WTW8wuvMcYUwoaAAJ5uDiBpN4DLE728tvxidpn1bXOU6hdHCkPWW
         DgeooonlzJlLO+a+vPhvb5cA5cvKwFtGq/3xDTDBHS6YXSudEuai4sYQGSfvMHYxjyxw
         h+qBoG968Bn9LyH+e5hbmhN0SZAS8Dtn0VoP9unpF422SGa8mbq36tXtfUVLo6bg3uhs
         d9h0UcBURhopuTwkOg0PdXCnndLgaWDba2wLVAjj26iB3vQ3fCtByNKy4b2wrO7ARol2
         QV5Y+Gt84oBFSDlF5oCk0FIXRyMpOETFpgShbBa9z2xMly+49b0To7VN4Kt2V+V20oqH
         vM3w==
X-Forwarded-Encrypted: i=1; AJvYcCWZUrnyNHdkqTYZB6vQm57v7zzIwGqzmhlXE20s5lcgE4BqRy0Jsna4n2bCqss7JVvhYZporvB060k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIOOSVDV1+Qdn+qFXgMQ9phZbig7IwV1E2qbahR5yGyH2y+A88
	Cp2hEhgkVGdRQtPP8ZCDZWHegxZViW1oXS6328S3sj2sj2pb2p+AvCBYzdAWLt1i1VeC455Ez7C
	/NqCPDm/4hVOr9c2cgDaFh780KsfBBLlXFNTyynIK/dRM2x+7vxoKKO+CmNGJWnI=
X-Gm-Gg: ASbGncsQ2S3hEePGfSyz79SMG267FJZ0xKzuxpSD6Ak4n+CsGcDoHNL1TRRMd2xsNni
	E1owfyLbTmu+Kx97H91DlWJ6GM7sGOFqqXk19wj5IuuLu4APFk+LmWm0nlNZFBw5mUlzgilvdGh
	1qpznAQn1g/MpyomlMzy/fVfIIEKJZ+bT1+UP9uOvQIBBXK5FGZTeVZGlxyNYeUxf55GvtRiHwu
	/Pq5d6Oh1uw0vdv59oneP3hnats3jVRUCw4vuJ4YnT+mDeJF2Zqx7fG3g8s8qRvG4o48+btYcoY
	N7oDFFa3ykG6RcOYowDEYKAZORVM6kB9K2a6eDfqQddUhsLLjqeuGHk7j0XtgpnX20uW7iAT5g9
	pPxg=
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr305911985a.15.1750195691115;
        Tue, 17 Jun 2025 14:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+9JVqw+7sJ1yLr0TsiHGtmuvpSxCBi5IsiQMqBr6H0uMPOHWLaMsMFaud7fwVkOu69cbpXA==
X-Received: by 2002:a05:620a:1a1f:b0:7d3:ab3b:e477 with SMTP id af79cd13be357-7d3ddfd8928mr305910085a.15.1750195690728;
        Tue, 17 Jun 2025 14:28:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9d8e1026sm788094766b.74.2025.06.17.14.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:28:10 -0700 (PDT)
Message-ID: <b8f5c24b-d9f2-4a3f-9dda-183dff203003@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 23:28:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
 <20250606001139.jaods5yefjccqni2@synopsys.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250606001139.jaods5yefjccqni2@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sZRhetrJG0ZpwpyzLO74lpkssYjz8Qxz
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6851ddec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=NlVYDTfvjE4WcsnVEWYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE3MiBTYWx0ZWRfX7XVi6mnluABx
 0Rb2gJkUGuGJEt8BOU2GH9HMMnKR71qPKGnp/Qa0P8fF2//NnccUXGfCx8/w+iMLK2TUEiW8bgQ
 2o0KmaaWRPdXQJuzZlEKmm4Tg4mTIdYgNcmysiF7lPR4lguqiZbdG1mxvSWMNEgpzQgiOAvOrc4
 60SBOLphAbkvXs1EsVZ76LIbyzkXLArUg5hodvbsPbfylWl77dYGhm1S2VTpJf8tWKLbo7TwdNt
 3qTUt18rvZGPUBwwMTGDhO02QmMYv04A0xoZtOAzjmFvG9U7C5lnB69BM1olnP+gxyvA+EzBbvU
 7U3rHYg75YmsI/iq+57/CNDqsOWOGyBWzH0jBIccXE2ps2J4NGB/qp1P9XcpMssxM+uVUWRzB7C
 N0X7h+SAtkJlElAZUnNqV8QsBqyGt3ZgrFUY1XaNKQh6ny2Q64UNCetOEBs0i+IGy9L3A8wm
X-Proofpoint-GUID: sZRhetrJG0ZpwpyzLO74lpkssYjz8Qxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=610 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170172

On 6/6/25 2:11 AM, Thinh Nguyen wrote:
> On Wed, Jun 04, 2025, Krishna Kurapati wrote:
>> Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
>> blocks any subsequent attempts of probing the device, e.g. after a probe
>> deferral, with the following showing in the log:
>>
>> [    1.332226] usb30_prim_gdsc status stuck at 'off'
>>
>> Leave the BCR deasserted when exiting the driver to avoid this issue.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Is this a fix? Does this need to be backported to stable?

yes and "might as well" - this file was re-made last cycle and this
patch won't apply without the recent 

e33ebb133a24 ("usb: dwc3: qcom: Use bulk clock API and devres")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

