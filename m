Return-Path: <linux-usb+bounces-22729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C911A7F3FD
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 07:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C723E16DB17
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 05:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BB124EF73;
	Tue,  8 Apr 2025 05:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nx6ElLHh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A3120CCFF
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 05:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088726; cv=none; b=izPyPqtqjk07Uy7tg867+7ddlfNP6+fqfbiS98DLuDWR7oIHMWshtM0G1Pn1rYqOmVc46zr05MJmWKOHxOklTfLRYLHyI7aobM4Z7XMC57MagrVsZtPONf37GnTItHif11QAaWVhPjWylJbLZTwTNa29tlKNSWrOKnzzU7SUQBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088726; c=relaxed/simple;
	bh=Lto+ra4LTmyrLHFbZ/Iu0iiaJ4j3VYHItZ+DnWYsUuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8iazdKkPsKdu5q8O2iwLEW/IBynqJmFQ+dhcXoC3yporMqaQOSs4mqKks9ugm7uaCLnBatQonHUIoCDjwve69/gTvGa4iD6j1irgY2mRpQmuTv/bkdFK0bZcWfhYjBJ2BdcHipCWEk01AarQFJBMMjREOrDO06AFGmxsZidKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nx6ElLHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GP9Z010546
	for <linux-usb@vger.kernel.org>; Tue, 8 Apr 2025 05:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDxL69wZUo4L0AV/xdKBgde+PGnwxfZwSZj8odr0+b8=; b=nx6ElLHh6Q14C5o9
	o9yVM2UYZd6KDlxcsvHhjz5fCWPIg8aSXWTEEnVJff16h29KlBZxAHEf/yiVIGDd
	R2fxyzdY22KYRJll0Cj0wvHeDfmwjmQb/9HKQljQhhdCFb6Q58iZ1F1ypT6Zoz2X
	xUDeDAquYpRqrPS2fqxv8Ob8iGJgT1mY9fKQExuacRSZhg9xkRUCfP9TPUjlQqO4
	+EXB8WLI/rzw4plfhDHz5yS5BirY3YuOw5Ip+96uK7WGrXdO2jDfV5Zv1TlrUTUv
	l094+KPOKzy2Nv487/G8wOpLnD7+o8UV+O96s1omLOfhOiujR0hBtf6LefSADQt/
	M2v7hg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1eedk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 05:05:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-739071bdf2eso3753280b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Apr 2025 22:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088721; x=1744693521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDxL69wZUo4L0AV/xdKBgde+PGnwxfZwSZj8odr0+b8=;
        b=B4iQ1RoOALtsJi3/hxObRMPlDkLHDekTqt/62FopXb5I1C7rfr6fgIf9stHym0PGJE
         8TwnboOOkEVNzXnDK9WZJ2WQc7PBQ26c9Iy8TnDux4sbvuoIHqKzzUYyVrZfBTNvbdW9
         /Cf+5PAjaRd2nH5c6mjYQ/Xdt3tBIUkViX75gDdzTZfcc/Ml1URvbaXV7HTmtjdM+aWy
         L41glcX3+5uHOcoBw2peGSCRN/x7bjYlTM5egHvlS+Kz0zk/T2lk7uOPo89BKbIHpO4t
         Er06FWdHJ6NVxvfTkiR913Gk1+B/gOW+PgHRH37gauVlml4m99hBt1SWn3PpTSmdBASI
         BnJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmB3b2FlLBVA4mZAx0X+xkmPJAiGpYRAdy/ME0z4qc+FEe32d5/ql+fLiMvDCa4c1hBc6GpLPTF/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5qIwsRy+lCIG4Zjh1nNnESNv4VEJbtuSyv1dM6xMjAK4wx5qb
	L99DrPikvkkZW+z5+QeTHGPoOdTCLVsd1DbdQhQ9QJOzMqihPcfHHQfvvaPodSGDwMD75Pepj8i
	C8z/k2xfbQIx4XkilSo5qys9beFBd2CpGbd8DWkg+Yq5LYiMIiLHm2LRorhI=
X-Gm-Gg: ASbGncsSXCSOsqRSsQwAsf55A3ABZ/GpvBn8qhhpApHhBe6+s7Cc4OuPhy/DTd3Ij3K
	xjpMgOYGeZ2QDez6SC20r1SqyXlEzfJ5GCbvjL70Fi4wp5Pd1FlGBlGsKtBIVw1Z9PPNEA4TE5s
	Rkmla/wqlT9R1onBDOWRePfam7oEHrdch9CvdXdVarP7dyp1r1vBidyZU0ZJKNX1ltjXObvZLzm
	CcNw8PKrJkjR8bvsc4buA1GEBADZQ/U8LEnVnYxob6HPhvCPKFm/TSyQZlAyrG6h/yL/MeJxYt+
	w/b0pkrefGEhGKrSD4C8M3hdED2Ocuizd+kNCjFF
X-Received: by 2002:a05:6a00:3cc1:b0:739:4a30:b900 with SMTP id d2e1a72fcca58-73b6aa3db66mr15542464b3a.7.1744088721037;
        Mon, 07 Apr 2025 22:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6VuOdqWcyZkSeZLzhlQV0tOJyim5NIj/mcpshGtqoiFN+CMt0VDdpuDzsy5HdSttRIRoZ5A==
X-Received: by 2002:a05:6a00:3cc1:b0:739:4a30:b900 with SMTP id d2e1a72fcca58-73b6aa3db66mr15542430b3a.7.1744088720597;
        Mon, 07 Apr 2025 22:05:20 -0700 (PDT)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d2f4dsm9489595b3a.28.2025.04.07.22.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 22:05:20 -0700 (PDT)
Message-ID: <0b210acd-9030-4038-ac7a-480dc2b5db0f@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 10:35:16 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] usb: gadget: f_ecm: Add get_status callback
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
References: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
 <20250403110805.865311-2-prashanth.k@oss.qualcomm.com>
 <20250408010812.qcgvinzqghrpyuly@synopsys.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250408010812.qcgvinzqghrpyuly@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dVf34FsS_bPX3bymFX5oSILNqCGHZjXi
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4ae92 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aDso-BE8akDkJb71X5cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: dVf34FsS_bPX3bymFX5oSILNqCGHZjXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=980 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080033



On 08-04-25 06:38 am, Thinh Nguyen wrote:
> On Thu, Apr 03, 2025, Prashanth K wrote:
>> When host sends GET_STATUS to ECM interface, handle the request
>> from the function driver. Since the interface is wakeup capable,
>> set the corresponding bit, and set RW bit if the function is
>> already armed for wakeup by the host.
>>
>> Cc: stable@kernel.org
>> Fixes: 481c225c4802 ("usb: gadget: Handle function suspend feature selector")
>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>> ---
>>  drivers/usb/gadget/function/f_ecm.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
>> index 80841de845b0..027226325039 100644
>> --- a/drivers/usb/gadget/function/f_ecm.c
>> +++ b/drivers/usb/gadget/function/f_ecm.c
>> @@ -892,6 +892,12 @@ static void ecm_resume(struct usb_function *f)
>>  	gether_resume(&ecm->port);
>>  }
>>  
>> +static int ecm_get_status(struct usb_function *f)
>> +{
>> +	return (f->func_wakeup_armed ? USB_INTRF_STAT_FUNC_RW : 0) |
>> +		USB_INTRF_STAT_FUNC_RW_CAP;
>> +}
>> +
> 
> Why does USB_INTRF_STAT_FUNC_RW_CAP is set regardless of
> USB_CONFIG_ATT_WAKEUP?
>
We check that in composite.c before calling get_status().
Have added some comments there [Patch v1 2/3] regarding same.

Thanks,
Prashanth K

