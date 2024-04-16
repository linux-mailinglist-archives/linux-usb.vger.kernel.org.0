Return-Path: <linux-usb+bounces-9410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8908A7795
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 00:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89A291C20D81
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 22:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B3E132813;
	Tue, 16 Apr 2024 22:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z6VAnayR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231284DF3
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713305700; cv=none; b=SFRhCrHxSBb62i3MzVMQt2HXarUo1SoihRdZe6a5DTXHmvXahqhGJm4EqHfaWjU187hZjZKJ5BH3D8HK0MOp63vhmguNRIr7iAV/jP2F/TDtluBO6sn3dLNsWJGbID1HqaMx+QSPg+S2xil8wFpEiLQe1xJKJgTzShnyDAHRajY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713305700; c=relaxed/simple;
	bh=z9Avo/Qwfxh9NPL8RnNtkuXSmnYuHyjH21+i7xoKwb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TlJsvITD7ScARwQieqsWJDXsQebRSvpfJvdmavf003KoOitYb+kiO80kXp8BNvwxTROVFx2PHHPlw7ro7CfceYLmbB4KO061f+eCIbrSiVnTEr5tJFPPA/fdpifCf2PUHtnCbQcqX4maWWqaBsIO/vexoCxX99O3lZuyr7M/XKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z6VAnayR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GFQtTh027114;
	Tue, 16 Apr 2024 22:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ZADB8bi7U0SV3PW3RhoW4/vZ1PwjVpBBuzZtpYaRqio=; b=Z6
	VAnayR3Uri7rx+WRe1gs5H5SraIYk+fKpDajUZLh1470lJ3YZ7osfUdQnez+8A7M
	rsJ9fEArS8BmO3XxUpnVrW4Esf9NQBUfqEEJgaQYIZ04kHIl0hJwu4uhcfuVS+za
	iQ75fOvBhAwEBAh+6hEv0lpLv1koA28Pv9X65Nu7TlIfSpf4pFP23KwyJPg9hVu1
	IU+/hgSls/2sMCc2aEgd+UlIWiDz1oHiu60PyoiZmZx2DxajfsQyFRXRqrHUARWN
	udfucIeHx2jSxFnC2elrSyBd6aLjM1EcOkWP4ML28TOCKa/DzlVmA3DxY9fySx6N
	QpxsCcrS3SsOAlP3qJhQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xhuys1aka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 22:14:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43GMEd45005552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 22:14:39 GMT
Received: from [10.110.96.64] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Apr
 2024 15:14:39 -0700
Message-ID: <d695a439-2cc6-8847-b1f1-10756257db6f@quicinc.com>
Date: Tue, 16 Apr 2024 15:14:34 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: usb: dwc3: gadget performance insight
Content-Language: en-US
To: "Grossman, Jake" <Jacob.Grossman@drs.com>,
        "Thinh.Nguyen@synopsys.com"
	<Thinh.Nguyen@synopsys.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Krebs, Charles"
	<Charles.Krebs@drs.com>,
        "Hardee, Hayden M" <Hayden.Hardee@drs.com>
References: <PH1P110MB1489614D2BD4B34E66B9A3208334A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
 <PH1P110MB148961B015C6ABB24C2E03538308A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <PH1P110MB148961B015C6ABB24C2E03538308A@PH1P110MB1489.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bt_7CDBjFhZ87gZReOgWPutXWW17YVgv
X-Proofpoint-GUID: bt_7CDBjFhZ87gZReOgWPutXWW17YVgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_18,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160144

Hi Jake,

On 4/16/2024 7:20 AM, Grossman, Jake wrote:
> Hello,
> 
> We’re trying to operate a USB gadget backed by the DWC3 core on an iMX8 
> processor, but we are seeing issues with performance.
> 
> As a comparison, utilizing iperf3 to benchmark, we are able to see 
> ~230Mbit/s with an RNDIS gadget, and ~900Mbit/s with a hardware 
> USB-to-Ethernet peripheral.
> 

Might help to also mention the USB to Ethernet adapter that is being 
used in your comparison as well, since some vendors may have some 
enhanced optimizations such as data aggregation, etc...

Also, what direction are you getting these numbers in? (ie USB IN or OUT 
transfers)

> Looking at the output of perf, we are seeing that with all of the gadget 
> drivers (RNDIS, UVC, ACM), there is significant time spent spinning in 
> an IRQ context that does not occur with the hardware peripheral. This 
> seems like it might be related to the interrupt handler as described 
> here: https://docs.kernel.org/usb/dwc3.html 
> <https://docs.kernel.org/usb/dwc3.html>.
> 
>  1. We have not yet acquired technical documentation regarding the DWC3
>     module.  Do you have a list of the DWC3 commands that have high
>     latency (~1ms)?

DWC3 gadget nowadays utilizes the updatexfer command compared to ages 
ago where it would only queue with startxfer after every xfernotready 
event.  That shift definitely optimized how the SW can update the 
controller on when new TRBs are submitted to the endpoint's TRB ring if 
a transfer is already in progress.

>  2. Do you believe that implementing a per endpoint IRQ framework will
>     resolve the large disparity in performance?  If not, do you have any
>     insight into what the root cause might be?
> 

Honestly, based on previous throughput debug, most of the problems were 
at the function driver level less so from the UDC.  I'll echo what Greg 
says about RNDIS, and say that, along with the security concerns, it 
isn't the most optimized function for IP data transfers.  In my 
experience the NCM class w/ packet framing will result in much better 
numbers than the default RNDIS configuration, as allowing data 
aggregation will lessen the number of interrupts per IP packet.

Thinh will probably have some more comments, but just sharing my two 
cents :).  Might be good to get some more details on the above before we 
can guide you in the right direction.


Thanks
Wesley Cheng

> Thank you for your time and insight,
> 
> Jake Grossman
> 

