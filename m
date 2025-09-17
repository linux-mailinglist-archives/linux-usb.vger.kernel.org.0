Return-Path: <linux-usb+bounces-28180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F19B7F0BB
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D1D1BC72F4
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 02:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A462F6581;
	Wed, 17 Sep 2025 02:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcO+71mJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73322F549E
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 02:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758076059; cv=none; b=Se81CZhLBWfGgLaGzS2PFb/WKsNcqLiUn4qYnQNlTfuIF68L+YT8TVR8PHfWHxjpdIWyRH8ROxaTi2uIqe7JjcsaSL/oSWjYCCpVj2R3/K7IEBPwRHg0BzKIw529sCfZZmqHf3uxv2f7hCh9xhZtmIf0Q2qu4K+4Xf7RM8foLdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758076059; c=relaxed/simple;
	bh=ZVOSah7WyUCxAwtViCyBrw8IIhcxsA5kP+tsBwbzwsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LU161M0A5PpG3tcjAmwh5C8qnLQ+bVgMzek2eNOCv+FGEzhbWGPTbSZmmwG93UR29Y1/pQ/CjqMbzh9V4zcOgOE+wkEd4z69u/I4rw+oJlcaMaTUZ2RvMx81UGTQaReHQhMeof57mC/ME+mXlVSmuvyFJqv/PsAq63BAc6u0lNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcO+71mJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLaXTJ018035
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 02:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYlZBe92chnYNBC11wB4N82uu0aHrj9AIx2n54JzLec=; b=gcO+71mJL/8mZHVd
	KTpDaJ5GD9zE9ZDehnMwHk6rKIja2rQLRRZgWlKeONk75jtlavNcmw90j2HVhWO8
	8T+amM+VcWaGq8w9al1BypNRVR69vzy+Qn/xclMVMEvv9iXk2mscUkrrR/RLj66N
	ceztjk2EYqB0VrSlUOMiZ+lg17bsIFEIL1V3kJtgtA1kOut9FtPFqLbHwrO80YtF
	nzj8RUbROoDNrEPMJPV+Ct14KC9Gd5BzFw1jlJyptcEwmuPwCwgj1jVDSBoEjmqi
	uAOmauBBVSfhuvAJql51f6bLwfL37i5S7YkJZgv/THUzbOU8F5SQOy8xp4BOGXRD
	X84gvw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy58k0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 02:27:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7725b77b795so5529183b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 19:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758076055; x=1758680855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYlZBe92chnYNBC11wB4N82uu0aHrj9AIx2n54JzLec=;
        b=ewaxjVNcdx7G+r0P8SpxsdcpFciqJixpSQmJlo2BCw6yp7TKSTRt0fQxnI+g/mExE1
         QBV+2UyJ6PJppFjLZGrPIsPBAJEnK+rVlAg+TMh+ffQshDhujMd4J65gstrnpiE8jHI/
         PlKeORkxpQTiYWhYPDLYr+n3PLRiTKcTvsDOkqZzL3ZaCO285l25rbN0mZpMjIj/+Qd7
         ofhUNBfmuQX+EEzfLz2PA828ntG5ixmviDgSICr6bMr4oO4j3ic2RH1wNCwNNSFLwqnE
         JFBys/sSg7WbsShZUd46jfwIQ1RmAgU379OhqL28UUXLtKMgyV6CS1FuBCNn7PqYr1EU
         JfWg==
X-Forwarded-Encrypted: i=1; AJvYcCXNjL+qs2rNLKR/np5eJbAbh6VGTLEm3jAceo88una6l64O4zI779Ief6YswX+QM4erKzpFuS/XBx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNQhLJB4bze+dsRJxgorKGxiyYLy5YEGmeQ3PCZscrGtY6I8X
	ggDj0eQTz1KMeJlHYIEPiEaZvhUt4U5x7B1ZvxvMWXWeRmynfQODJHSe37adwtLf7RaKGjr+q0o
	HxwiMChHzTXvXMTAUZR8uGRYPlbCHBWFpzac3j8cfb1cP0yC1JIjpnA1uCFGv7/k=
X-Gm-Gg: ASbGncvlnr04Z3iF2xEVwZiMb21wmxpbKt72EEtMAwF99hKnmsc1b+CBYwFU+77z9Ik
	uOZDkByc15TMgBT+v7KOc2+yWV85D6S9+n66fwjQ6clMMXa0VtOERHXkRsC8RnNI8m2EvaepMVN
	XZiGyJd2qU6Hrt3y+xmBpui/7AbnzfRqM4UlMjCvCF316TQQKkSVjB7JRiPNwHjZAPqc7bPedOd
	fszPDbA3ng/ka0hSiw89JWe/+7HSR3J/rp1KvDiIkL6pWjAhWoZmGBEtJG1nCIK+J8HtAljaLPN
	+LfWRYmpw3BQ4jKRBkjvFaXPCmNM3qw9P/ZDyIImtV7uormmg4PFB7qm2H80LZyGhejxw9pMARQ
	3G5eGadHA4OpV90FyjO2Po/EqYupbqryDAw==
X-Received: by 2002:a05:6a00:228c:b0:771:e1bf:bddc with SMTP id d2e1a72fcca58-77bf75c1492mr538619b3a.13.1758076055086;
        Tue, 16 Sep 2025 19:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa3nKVRZ5lcOuXaoBxQLObp2Qb9gc/ezSveqX2YOxEc/wcuth8hVIukLM4KDYuJgtiHtLYwA==
X-Received: by 2002:a05:6a00:228c:b0:771:e1bf:bddc with SMTP id d2e1a72fcca58-77bf75c1492mr538603b3a.13.1758076054636;
        Tue, 16 Sep 2025 19:27:34 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761853866bsm14036121b3a.95.2025.09.16.19.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:27:34 -0700 (PDT)
Message-ID: <a60a1d0e-0cdd-4e79-99cd-5dc543242a87@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 10:27:29 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
 <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
 <c5e3ac07-e91e-4c9f-9256-497991b75200@oss.qualcomm.com>
 <aiplezjbovtaghgblua5xj3rag5kjwzt6sjrnygzbez5dtaxm3@vn6kwmskc4e2>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <aiplezjbovtaghgblua5xj3rag5kjwzt6sjrnygzbez5dtaxm3@vn6kwmskc4e2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0lnoXTslJ-hr3NRKPOylN4k6MVPVtEko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzC8jUa06nAoG
 VeQwmB2lmrTp5ilY2f5JPA9xmcEqxc5dNV4irGtxP8Z5N4B4RDoNoeAqNw+CfzHBKxFvtsLWGt0
 6ItyauE3+md0YbgOllcGjusH4DdGF59jlK83FmxN2UqfjU5rUyjAW4AXIssGZ22drHq0/SqC5XS
 2XWmvyBNVLObeU527WB7QqMezrrordcqlvG7PGrhlunL8oAh/8VxvlDxAN981yFX4eKrWkP+F8F
 DWf7soA33jL3CjYOdjEC0X/NyOWAFcBIjq+HU0MuJS1no9VNpPS+MvQc2hMDoFGWYdvoWHMcEX4
 zMrDdJX5tiCaiJaQ+7X3npN6bfgAzQ7rqixZEb5tXstwJXTeMOifKHWn4Ima/ApzfiPP/MhWrGy
 iPiJPgyQ
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68ca1c98 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=lQXKqyNTGrdWrY9AsKwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0lnoXTslJ-hr3NRKPOylN4k6MVPVtEko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202


On 9/16/2025 6:16 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 10:40:03AM +0800, Fenglin Wu wrote:
>> On 9/15/2025 6:19 PM, Dmitry Baryshkov wrote:
>>> On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>>> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
>>>> for SM8550 and update match data for X1E80100 specifically so that they
>>>> could be handled differently in supporting charge control functionality.
>>> Why?
>> Is the question about why this was submitted as a separate patch, or about
>> the need for the change itself? The reason for the change is explained in
>> the commit text.
> It's not, and that was my question. Why do you need to handle them
> differently?
>
> Please always start your commit message with the description of the
> issue that you are facing.
>
The simple answer is, the charge control functionality is only supported 
in battery management firmware starting from SM8550 and X1E80100.

I will add this statement in the commit text.

>> As for submitting it separately, that was done to address
>> Bryan's comments to split out the compats changes. Anyway, I will address
>> the further comments from Stephen to make the change bisectable.
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>> ---
>>>>    drivers/power/supply/qcom_battmgr.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>

