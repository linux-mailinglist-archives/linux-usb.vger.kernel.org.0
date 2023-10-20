Return-Path: <linux-usb+bounces-1967-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DEF7D0C30
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 11:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11890B215B4
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 09:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F90D1401A;
	Fri, 20 Oct 2023 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RlLDxHJE"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0114264;
	Fri, 20 Oct 2023 09:43:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CE2CA;
	Fri, 20 Oct 2023 02:43:06 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K9bVNF022305;
	Fri, 20 Oct 2023 09:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gKgKE/3okkYeBZ3Ht9e//KK6FJL8oHwgra2hVscpmfI=;
 b=RlLDxHJEzEqPRoWIKD6uJm1+QBLLHImXqr4S4LLiYO8JwhKYorJwHUSvrIWG5FPiMFq8
 3w9EEUEXO0NB+rzJRmtJjzBXnqkUyUq0r6jR4E5lxbD07WT6k3gylQKRZ71iTuSlTQnb
 LZc80/SnBxRIpkQEoznO16fZavKsErCRRxeakusPB9r6FBhhoBxrMR/sBbFvC4WH1KT1
 1capsMliUSmuygT9Z40zfB9qQhz4n/Z8TLJPV8P8UIOQvPShDH4Jhv0nGW1pEd/z3krA
 F4Xg/qcc666iTY0t6pKAZoI0/Q0/JRlL0IU05G8JDb/RGCikXu3YZpI3o47ft8jR+iEb Jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tubxa1b9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:42:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39K9gsfB012882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:42:54 GMT
Received: from [10.216.47.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 20 Oct
 2023 02:42:47 -0700
Message-ID: <279a54f2-7260-4270-83c7-d6f5c5ba0873@quicinc.com>
Date: Fri, 20 Oct 2023 15:12:44 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/10] usb: dwc3: core: Access XHCI address space
 temporarily to read port info
To: Johan Hovold <johan@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Andy
 Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi
	<balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        <ahalaney@redhat.com>, <quic_shazhuss@quicinc.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-2-quic_kriskura@quicinc.com>
 <ZTI7AtCJWgAnACSh@hovoldconsulting.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <ZTI7AtCJWgAnACSh@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 07m-R_smzPgJysJaoTRDAlUTKD0PviSu
X-Proofpoint-ORIG-GUID: 07m-R_smzPgJysJaoTRDAlUTKD0PviSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200080



On 10/20/2023 2:02 PM, Johan Hovold wrote:
> On Sat, Oct 07, 2023 at 09:17:57PM +0530, Krishna Kurapati wrote:
>> Currently host-only capable DWC3 controllers support Multiport.
> 
> You use the word "currently" in a few places like this (e.g. in comments
> in the code). What exactly do you mean? That all current multiport
> controllers are host-only, or that this is all that the driver supports
> after your changes?
> 
This means that, today the capable multiport controllers are host-only 
capable, not that the driver is designed that way.

> Please rephrase accordingly throughout so that this becomes clear.
> 
> In any case it looks like the above sentence is at least missing an
> "only".
>   
>> +static int dwc3_read_port_info(struct dwc3 *dwc)
>> +{
>> +	void __iomem *base;
>> +	u8 major_revision;
>> +	u32 offset = 0;
> 
> I'd move the initialisation just before the loop.
> 
>> +	u32 val;
>> +
>> +	/*
>> +	 * Remap xHCI address space to access XHCI ext cap regs,
> 
> Drop comma and merge with next line and break it closer to 80 chars
> (instead of 65).
> 
>> +	 * since it is needed to get port info.
> 
> s/since it is needed to get/which hold the/?
> 
>> +	 */
>> +	base = ioremap(dwc->xhci_resources[0].start,
>> +				resource_size(&dwc->xhci_resources[0]));
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	do {
>> +		offset = xhci_find_next_ext_cap(base, offset,
>> +				XHCI_EXT_CAPS_PROTOCOL);
>> +		if (!offset)
>> +			break;
>> +
>> +		val = readl(base + offset);
>> +		major_revision = XHCI_EXT_PORT_MAJOR(val);
>> +
>> +		val = readl(base + offset + 0x08);
>> +		if (major_revision == 0x03) {
>> +			dwc->num_usb3_ports += XHCI_EXT_PORT_COUNT(val);
>> +		} else if (major_revision <= 0x02) {
>> +			dwc->num_usb2_ports += XHCI_EXT_PORT_COUNT(val);
>> +		} else {
>> +			dev_err(dwc->dev,
> 
> This should be dev_warn() (as in the xhci driver) now that you no longer
> treat it as a fatal error.
> 
>> +				"Unrecognized port major revision %d\n",
> 
> Merge this with the previous line (even if it makes that line 83 chars).
> 
> Use a lower case 'U' for consistency with most of the error messages.
> 
Sure, will change this to dev_warn and modify the "u".

>> +							major_revision);
>> +		}
>> +	} while (1);
>> +
>> +	dev_dbg(dwc->dev, "hs-ports: %u ss-ports: %u\n",
>> +			dwc->num_usb2_ports, dwc->num_usb3_ports);
>> +
>> +	iounmap(base);
>> +
>> +	return 0;
>> +}
>> +
>>   static int dwc3_probe(struct platform_device *pdev)
>>   {
>>   	struct device		*dev = &pdev->dev;
>> @@ -1846,6 +1892,7 @@ static int dwc3_probe(struct platform_device *pdev)
>>   	void __iomem		*regs;
>>   	struct dwc3		*dwc;
>>   	int			ret;
>> +	unsigned int		hw_mode;
> 
> Nit: I'd place this one before ret.
> >>
>>   	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
>>   	if (!dwc)
>> @@ -1926,6 +1973,20 @@ static int dwc3_probe(struct platform_device *pdev)
>>   			goto err_disable_clks;
>>   	}
>>   
>> +	/*
>> +	 * Currently only DWC3 controllers that are host-only capable
>> +	 * support Multiport.
>> +	 */
> 
> So is this is a limitation of the hardware or implementation?
> 

This is how the hardware is implemented today. I wanted to convey that 
"lets check for host-only condition before going for reading port info"

>> +	hw_mode = DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
>> +	if (hw_mode == DWC3_GHWPARAMS0_MODE_HOST) {
>> +		ret = dwc3_read_port_info(dwc);
>> +		if (ret)
>> +			goto err_disable_clks;
>> +	} else {
>> +		dwc->num_usb2_ports = 1;
>> +		dwc->num_usb3_ports = 1;
>> +	}
>> +
>>   	spin_lock_init(&dwc->lock);
>>   	mutex_init(&dwc->mutex);
> 
> Johan
> 

