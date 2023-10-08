Return-Path: <linux-usb+bounces-1247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7B7BCEEF
	for <lists+linux-usb@lfdr.de>; Sun,  8 Oct 2023 16:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E97C92816F0
	for <lists+linux-usb@lfdr.de>; Sun,  8 Oct 2023 14:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0155C33E5;
	Sun,  8 Oct 2023 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H2YmLHcK"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A0138D
	for <linux-usb@vger.kernel.org>; Sun,  8 Oct 2023 14:39:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B032AC;
	Sun,  8 Oct 2023 07:39:39 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 398EYixW017305;
	Sun, 8 Oct 2023 14:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=J92BvlKP5dg3QtINcGnAixJ0mn8QMY5l7Kd8OEUQbRc=;
 b=H2YmLHcK/BEd9Gzzl9Az8aCSm2AHvImNeTfbjeho9AF78/dIhctIeMAgyH6G0w0IpygE
 7VbFLmKKcD+0E6cVJX6GsITHmK7Q6UCF6hZy6GUNBQMhqYBgfXX5ztPs2oh+CsNm4u2H
 5hiuXS1clr4E+cipXmtLSmhrxKph8W1btNTKCiLEa0YnvGGRYufEqFlQTYJe3bywp8EF
 7XjN8p8Tri8TWO0Lqn1uUw4LIBxfp1SvyDv9kzjcn8q1dgqoFloJj7X5x7P1WzQxegsf
 PWBoxxR65PCRl5BG1ypZA2OXU95R3rr1zeSbKn/LYECj5fektGSw45r37jXTBUnNhSB+ jA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkh5e0rah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Oct 2023 14:39:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 398Ed92M002046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 8 Oct 2023 14:39:09 GMT
Received: from [10.216.47.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Sun, 8 Oct
 2023 07:39:04 -0700
Message-ID: <b5bb3d14-5ffc-44f4-99bc-aa2c97e198cb@quicinc.com>
Date: Sun, 8 Oct 2023 20:09:00 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Disconnect interrupt generation for QC targets when role switch
 is enabled
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <af60c05b-4a0f-51b8-486a-1fc601602515@quicinc.com>
 <20230816165455.GA23057@thinkpad>
 <0bd1fddf-a05f-69a0-b4b0-1b2378bc0c58@quicinc.com>
Content-Language: en-US
In-Reply-To: <0bd1fddf-a05f-69a0-b4b0-1b2378bc0c58@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NKB6-46SJsyMIc3EiPGBLccmoaxzver9
X-Proofpoint-ORIG-GUID: NKB6-46SJsyMIc3EiPGBLccmoaxzver9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-08_12,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=778 mlxscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310080133
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 8/29/2023 6:42 PM, Krishna Kurapati PSSNV wrote:
> 
> 
> On 8/16/2023 10:24 PM, Manivannan Sadhasivam wrote:
>>
>> Since you have quoted my series, I'd like to get clarification on one 
>> issue I'm
>> seeing. When resuming from runtime suspend in host mode, dwc3-qcom 
>> driver gets
>> the wakeup event and it resumes the xhci driver. But the XHCI IRQs are 
>> received
>> after some delay. Due to this, xhci driver doesn't resume the device, 
>> instead,
>> all the drivers (dwc3-qcom, dwc3-core, xhci) went to runtime suspend 
>> again.
>>
>> But once the XHCI IRQs are received, dwc3-qcom gets the wakeup event 
>> and this
>> time, xhci driver resumes the device.
>>
>> This is the reason why I added the autosuspend delay of 200ms to allow 
>> the xhci
>> driver to wait for IRQs before going to runtime suspend.
>>
>> Can you clarify why there is a delay in receiving XHCI IRQs?
>>
> 
> Hi Manivannan,
> 
>   Apologies for the delay in response. Can you help check if the phy 
> clocks are ON at the instant we see that the xhci irq not coming up. I 
> got to know that after resume, the clocks need to be ON for phy for it 
> to signal the controller which would then generate the xhci irq. I also 
> see that in resume_irq call in dwc3-qcom, we call runtime_resume for 
> xhci->dev, probably causing it to resume before dwc3->dev (I might be 
> wrong though). Can you confirm if the clocks for phy and GDSC for 
> controller are ON when this issue is seen. Also can you let know how 
> much time its taking for the xhci irq to be generated after resume.
> 
Hi Manivannan,

  Sorry for reviving an old thread. Can you help check whether 
autosuspend is being triggered by pm framework before run_stop bit is 
cleared as part of xhci_suspend in your case ?

I am trying to repro the issue, but I am seeing a different error, "host 
controller error"

Regards,
Krishna,

