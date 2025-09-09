Return-Path: <linux-usb+bounces-27761-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44189B4A09A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 06:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1154E0910
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 04:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F7D2DFA38;
	Tue,  9 Sep 2025 04:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgPKZvhZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE5B2E0B73
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 04:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757391726; cv=none; b=Sj3Vn/YsOfNO3r90vVpay6sXR3pOeYAuI4r8V09ql7isqi0G6zg4KXKIrULIFum3EQPcDE4TACuo2Toi/YC7RPuN+/VxwFKIwWddx0Wl4RcMTXRPA8clfKWOn3gxOy9TF4T/C9qSxbOGvd382adX5Juw/gMXIyzx9LBnLwN8gpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757391726; c=relaxed/simple;
	bh=j6v90dYYiet2HvZxdeUO27siJR1XjbCkPbyzxTjgQV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFJ73IxpnvhF0uSt9YyUdft1eyhjnwGuxgnm1GzlbDy0/7lkD2gM6Ys7F+Tv6iB4JFHtlywaLDvRZBfk/Ey5i/vf7VRfhJWzXOY6bkBoDjSjZuw/DBjYmkrSO26ta6DiNbbfIKt5H26He+VfLEvGMzgzg3lxfCTSo9HZuiBFeS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgPKZvhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5894JDGq002304
	for <linux-usb@vger.kernel.org>; Tue, 9 Sep 2025 04:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2RNlYujfUAP11t9Hv/ZiOCiQwfDezWbTlUXZc80dTq4=; b=fgPKZvhZhRZBjyZ7
	7Vbq2I3hMwCNZyN/8VbLNdJRhVWQCcCuC960Wz7Vb8IIJsrJ9F+ALL0aMQBzTCYk
	4YRvVm1p060W+7X1sk5xbO3RDFEwCGrNRzsiyPs4vuMJ2hTs1WBX95RjVDQBs9wg
	chzZAOe75oxBhkEWkJ390Wbf6aruVokZtnTBY1P5vs+zpVGwVAoiFAOKwtE2CIH1
	4oq3KO5fzZX8aAgfClM4g4fCI/ZfMuHoFxqg+EQPcG/yUOCx5JyBfDPoNW4z6gDD
	DMqLSksEHkADblPTr0PhG9W88GfOsi2jcXstb2Ctrs0aqnYC6NDJ7eJCzPfhI2Kh
	tM6OvA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j6y48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 04:22:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77243618babso5151872b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Sep 2025 21:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757391722; x=1757996522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RNlYujfUAP11t9Hv/ZiOCiQwfDezWbTlUXZc80dTq4=;
        b=gSFmJgqb8wLx0MEiWUw3JMxBoAwuTM33PQhyMdXD53ksuP7gE/u6c7ZHXjmNF3WXR2
         qIwMUyXXBVGUpheVEUhM5KCw5zZl4fOwNkfppFVTGgGsPUf1CNMxxKAw0iSuuYjo6EM6
         Sx0jKtO++mbSElBeQSJtaiWyErxe/vd7vP8csREalLBkmuzc2ZoLJcSevgtCGtVq+RLL
         Vhcr4YEJEocwkdVEAni4WHqTwB5+2Hsxb1nqId44j2X2c0I8DBx89+dyZ8e0vIrRAxzQ
         R0jHc58EzocJa2nYkGr0zucUJoue5Vw+i1p/JE0CVBFPqfOJrOJEzoBH226dzok4WQhV
         VMtg==
X-Forwarded-Encrypted: i=1; AJvYcCWuPAlT7B5x1eTraR3tl88rzIl/d0RmqLOY77YY9tTl/yM7yZ4amyOkWYPacXHB/VyC87+kBkx/Qds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbQbBzjsDR0JD+L41Zfr47P5IOW3gyVQtWrEm5WPOtawNXJDI
	45CyY/AW5Fki9w/xGfKmis11SXxb1SnooQh/OBkYhBGL5tl+LlP9KQM7bLo865Lom21dOPTJmte
	XPX+ZySzD9aeZgFMWkOQ4SCoSdxcx3cyJts4lFUDxym55EbbdXpuIx2e7trQtZBo=
X-Gm-Gg: ASbGnct0kLMLBFWXc9IEsJnb6I4JJAMTC2L873g0HNLwjAPuarzExQMW0wC7uo/EH7N
	RDEX30sHTWKoXqIGviq8cn0eJ8Ght3Bx2FJEXG1ztdfqdhTX1jLHRe9wPhPxnXT+JGpsHKBEhBl
	O7yOnHOR5+TRTrEdAxodJvGK/YZYat3XsBe0J3Sckds3ZH2ShgivGMDFBkcEjwYXknB2JZFcNH7
	v8oYcLJP4+C5jghm1KRK9e5xc1NrlLF80Gks7TiECXVeGLzJS8fPNcKG8K5sE2yTyF1S9fO35UW
	pjGMoVI332avyytRapeVSEjHfG4v0ERY8hsE6rrmgrrk9AN54y7sio6J2Q23C4V5ZxEJEZKbmA=
	=
X-Received: by 2002:a05:6a00:2d05:b0:772:6493:7e67 with SMTP id d2e1a72fcca58-7742dc9d3f9mr11891632b3a.3.1757391722080;
        Mon, 08 Sep 2025 21:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKNi7lH3vplxeGbCsFdMO6FWGGFqXVVmUPa3BBSL8XFQGpLBRslXI40zUkoJ5rmhaumi2dvA==
X-Received: by 2002:a05:6a00:2d05:b0:772:6493:7e67 with SMTP id d2e1a72fcca58-7742dc9d3f9mr11891598b3a.3.1757391721567;
        Mon, 08 Sep 2025 21:22:01 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774668f302bsm482513b3a.35.2025.09.08.21.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 21:22:01 -0700 (PDT)
Message-ID: <8d8fe2c8-6b56-43a6-8a28-5150514da691@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 09:51:56 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: kernel test robot <lkp@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
References: <20250907181412.2174616-3-krishna.kurapati@oss.qualcomm.com>
 <202509090115.dVhd78BE-lkp@intel.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <202509090115.dVhd78BE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfXy6ZchNSsCY/H
 yBC2Tj9yW/QF26TQCHt6xWIpIiPEkDTQKyEZ4HHFngtddxJamLjeMWsZK/BdDUr/Y7pkMfzTUsF
 KBOmFxs2jafyI3jDaK7JsqYYoun8zM+YpH9vB7SGguzFSnzzSquBryODRLgIV3p4TZZP7LyM9ju
 eHdcNzilHECIiRTUIjm89o3j6kRS89dSWN8ZDJzxUjhzFarKgPVbRZL8F7acKzxAlvsChpDUOg5
 OkplUol/YMXJk1SLNZN0gsBXDXIGT9iJLw6EBJ3Honie3dEcqQt0+7a7x3XRCNqh2aG/wB+Bepv
 +ds/gl4Hlw/jCleqjymjt6eCIBBopoXLiBoDcpWHgw8cYvUdBp7nShR9xkHxU2IqHC6fIjaI06q
 YDpmVdEf
X-Proofpoint-ORIG-GUID: YO45IcNNL39HKZ4YPY5qTsccYpzGFNKG
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bfab6b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=X9NUYyb3VNRp4TtMdKMA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: YO45IcNNL39HKZ4YPY5qTsccYpzGFNKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022



On 9/8/2025 11:55 PM, kernel test robot wrote:
> Hi Krishna,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on usb/usb-next next-20250908]
> [cannot apply to usb/usb-linus linus/master v6.17-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/usb-dwc3-core-Introduce-glue-callbacks-for-flattened-implementations/20250908-021710
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> patch link:    https://lore.kernel.org/r/20250907181412.2174616-3-krishna.kurapati%40oss.qualcomm.com
> patch subject: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend
> config: hexagon-randconfig-r132-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090115.dVhd78BE-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce: (https://download.01.org/0day-ci/archive/20250909/202509090115.dVhd78BE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509090115.dVhd78BE-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/usb/dwc3/dwc3-qcom.c:605:22: sparse: sparse: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?
> 
> vim +/dwc3_qcom_glue_ops +605 drivers/usb/dwc3/dwc3-qcom.c
> 
>     604	
>   > 605	struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>     606		.pre_set_role	= dwc3_qcom_set_role_notifier,
>     607		.pre_run_stop	= dwc3_qcom_run_stop_notifier,
>     608	};
>     609	
> 

I see that the usb-linus is missing the following patch:

https://lore.kernel.org/all/20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com/

Regards,
Krishna,

