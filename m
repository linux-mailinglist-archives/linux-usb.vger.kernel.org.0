Return-Path: <linux-usb+bounces-9754-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E13598B1A28
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 07:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 114EF1C21633
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 05:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B50539FF3;
	Thu, 25 Apr 2024 05:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K1FK3eYv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23723CE
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 05:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021746; cv=none; b=YXX/SnWYIJ630mWbzpv8Q4Bj8eXGjhpswF+lu587JdMzgVszL5zP8UIMdBtGdeJ+DFtrzYgLqXP6mO3wkzMB5aPooi55HJlMIAMNyl2iu98551OUqtTX5gK5tGDYiB4Zxua7aH1LUA39kc3lyw8cwluWV7MtRPQ94NxJ7Mitav4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021746; c=relaxed/simple;
	bh=T/x2tq9P8RzTgFKLC98RgRck0SMujfspvjc2OtKPge4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RIYpHeVaO6TW4Ub3X1pKC8Q6B5EnuXmpMSaBk+vvGfP5pSLLdc0m1ExQbMR7Lapjy2+t9HoRLBVJZEs9qpcisnGt/mOXe/ERUTOCFzzm8t7RhSTVnVhNNUAVZyDD/xT8HD20nFtqYqGkVV2A+wr7Ww5Yx2+GzxCUjpxsbPAUYoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K1FK3eYv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P3Ep8H028227;
	Thu, 25 Apr 2024 05:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qcWm7SO9/47Fl/GtQ0hnOz29NXjg6ZkVUwYFel2Wy0o=; b=K1
	FK3eYvGCmQxTohmemo2bj/XbftY7NndJMx8GJ+c0j4SJ25jOhMCx2DDoxbM9YPzB
	CMYF2iiLDWdVUfQnGbuBfRMcvfh1iTAyoKdcsmlGSrIvrLBbmKy5RDvvYg79kRDM
	YV0AfcLK+DXfAhlJMEn8F4rbDgwFQzBCLCwQkczHRZ7B2hDP/eFaQuT3uCssLTjv
	Fsyxusjrev2iRXMzKtMMQK/NTL5Tq8F3gvA9LiEyzuX9nhkJcUjKp1jUxCxpn+Er
	jNTyZdklQB0GwT9zlpMnixWDpBil9R0YjrrQJJ5WYOkW9uqyn7YZimVJVUo4LPJq
	wAn2yoj6cKeNyIFWJSqQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenm09r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 05:08:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43P58sYv008865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 05:08:54 GMT
Received: from [10.216.33.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Apr
 2024 22:08:51 -0700
Message-ID: <d4e11bc4-3561-4e2e-9203-5d794269a225@quicinc.com>
Date: Thu, 25 Apr 2024 10:38:47 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [usb:usb-testing 7/12] drivers/usb/dwc3/core.c:1482:69: warning:
 '%d' directive output may be truncated writing between 1 and 11 bytes into a
 region of size 4
To: Johan Hovold <johan@kernel.org>, kernel test robot <lkp@intel.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-usb@vger.kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <202404241215.Mib19Cu7-lkp@intel.com>
 <ZiiptMEL2_AdBsJA@hovoldconsulting.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <ZiiptMEL2_AdBsJA@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uNznG21Ia6RYXT0hQDMvxj1ahOkA-FjO
X-Proofpoint-GUID: uNznG21Ia6RYXT0hQDMvxj1ahOkA-FjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_04,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250034



On 4/24/2024 12:11 PM, Johan Hovold wrote:
> On Wed, Apr 24, 2024 at 01:03:07PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
>> head:   a160e1202ca318a85c70cf5831f172cc79a24c57
>> commit: 846b4bacf2d48212f271fc1ef7488bcdf2c75bcb [7/12] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
>> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/config)
>> compiler: s390-linux-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202404241215.Mib19Cu7-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/usb/dwc3/core.c: In function 'dwc3_core_get_phy':
>>>> drivers/usb/dwc3/core.c:1482:69: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 4 [-Wformat-truncation=]
>>      1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
>>           |                                                                     ^~
>>     drivers/usb/dwc3/core.c:1482:63: note: directive argument in the range [-2147483641, 254]
>>      1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
> 
> This version or s390-build of gcc appears to be confused as the
> variable i is clearly in the range [0,254] in these for loops.
> 
> I also don't see this W=1 warning with my gcc-10 (aarch64).
> 
> It may be possible to work around this by using u8 type for the iterator
> (and %u in the format), but I'm not sure we should be working around
> compiler bugs like that.

Thanks Johan. i agree it looks like a bogus compiler warning, but I 
think your suggestion of changing to u8 should work, if only to placate 
the compiler.

Greg, do you think I should go ahead and update it in v22 or can we 
ignore this warning ?

> 
>>           |                                                               ^~~~~~~~~
>>     drivers/usb/dwc3/core.c:1482:25: note: 'snprintf' output between 7 and 17 bytes into a destination of size 9
>>      1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
>>           |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
>>    1446	static int dwc3_core_get_phy(struct dwc3 *dwc)
>>    1447	{
> 
>>    1450		char phy_name[9];
>>    1451		int ret;
>>    1452		int i;
> 
>>    1478		for (i = 0; i < dwc->num_usb2_ports; i++) {
>>    1479			if (dwc->num_usb2_ports == 1)
>>    1480				snprintf(phy_name, sizeof(phy_name), "usb2-phy");
>>    1481			else
>>> 1482				snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
> 
>>    1493		}
> 
> Johan

