Return-Path: <linux-usb+bounces-24675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A7BAD3F36
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 18:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B43E9168986
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 16:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A9E242D7C;
	Tue, 10 Jun 2025 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3n4m+wK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCEF24113C
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573640; cv=none; b=XbbjIJ2qrIdZCjbAze9VsvyqeeqCy86KVK9SdrFyGmEm33r8NAgB+i5i/0HzWW24r4EN9X5COjpIyLRmXruvRlGDzOgTCyY8UUr3o8s+iYUWMNAwJlqq6IHYDwNRPRHrxfGKjifqg6nkc5m+INpVcckk17tejgjHxaGLvqU7U3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573640; c=relaxed/simple;
	bh=R4u/nslLUHbMND+b9K7BcBQWT+Us9jLpB3zN5QBBEaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9lOyipfxc70XiJMIMVZYseJANqVOpFqM5z2oyqq1k4huLyTJ4aqEzBzNb5QlMa0Heh/C2jUT1seqX5G5/Z3yThaNyQNCKLAFUIU/6ZMjpF872GOI5BriSc5DTJEO3TCAsffZStaxGx82EzL2RPXCqL3+fAGYA5ACk2Ts/ieXjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3n4m+wK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9RwVq005324
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 16:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKnPInc2o30lyqH7lBih+SX8O+7sgOmLePgA3wca4xQ=; b=h3n4m+wK+UVhBGaq
	F+yr9XHbMd6XaXfT2E7ancYdRqJzSJ5gsJ5+tCaYxyWLoljDqsX+bykPg1mXvlre
	tQZrce0nmuxWkluco+dY0ow7lxM2RuQaA3LnTnOGdLtxMdiBS9bnsx+gnj+OLC7L
	AVA8LMbVAZOy/ymmif+YBJ3g8uLiNvgooHpPyiif07imCqygqvZDjOuQMFWSJy7+
	RrcZP65lHidhGroq8H7/toAGOIyzsv3UcO8XCEK9JUT1c8wjoq2twCLl2/KAh6P1
	UhKEAkS6PudWvcwVIul1O1BfJm4VFEXvo6GuYaSi0/arVpdkcbwgyULQS7p4CyQz
	jc2gUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpsupt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 16:40:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742b6705a52so8444173b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 09:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573637; x=1750178437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKnPInc2o30lyqH7lBih+SX8O+7sgOmLePgA3wca4xQ=;
        b=V5F7PVGmyVImgpjTrE5QQCFFKIPw1AehT+Oa6IoVxi15KqZ7A7aKYO2tVC/bqrFNLV
         DCPDZv4Bg1S0kRrmawdI0UG/a+ctcAx9kfCBwkUMGXc5ZJk5qdCSMeECr5A40m7hvXjr
         hAe5m3L7OzqNQE1VXqLN3/8E3bfPNedMmOSOLVOWZyAMm6Hm+PD+dzWmg6C+nXQIamdR
         yry0qaxW0VeJIazsyfTOmJZ/peYZJ0HOWFm2ppUHFiS1o88IUyTZlCEPJBfEJ1chmw+M
         q1BX6yqgrx6Yok5/t6SHL4xnsaeEFG2m1Cs1C+L0h3tiAG+KF8cyfRugWkXBLXibGArW
         Dupg==
X-Forwarded-Encrypted: i=1; AJvYcCWKLh9NI6f9SMQKH+HPL1ZwTxdSz/RqifM/XAW1ILG1qjztp9fWhZ9Sv9G7uz+qJHHmjPgM35h4TLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgZQg/mbtGt7+J7kL6Tj7B/8P1yINbQIZ6mdfMChCe+hCXVici
	E9KEh+nNs4pKrb2FGYwooAoEX8SeSSJ6LQYAawjF7B7KVDFopJPXJXl88UaZSzWkiNTh483Up/K
	/rWO/xctQNJ0XnTzxi9zplPgVWMvJBXxOJCR4iaGPQ8DJoOQNx7lZX1PEkc2phaS7liCAcEo=
X-Gm-Gg: ASbGncv0iLA3U6SwF+8IoZgbRhkl3uyVGD7VDqcHy7KEY+Y3lO01og9Dx6CurcpyZSD
	6TFmMiUhA5VXQyvyVED/i36FH5oMTNHJGD9/uVVKsXEmGRxZ7dwCkHibYKhXFT04loP1YDJhKSX
	9Xc5D22uXQHzKroJedjjIIObEBmshO364JOkSDqHHKeprp7twBV2331X0RFxVzgLABwf2APDbKC
	JNae12iQcUBbo8aysZN0apXgWWhMx6FkDsv3dG8u4FLWDzlQS4S1zoJISJoPsBkS/6AlYsLFOTD
	tZjqr4+4CPHAEvY0Wob9GY5BBaHF0RW/VKDCpJtjTHtNeWaguqfvD7w=
X-Received: by 2002:a05:6a00:23cc:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-7486cbea4d7mr298734b3a.16.1749573637195;
        Tue, 10 Jun 2025 09:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mYx4d0rHuFRAt5j/ecGAM5VfkYNttUh+WRdcZism1DhdCtnbx5rXhQfdRTLka1tU3JzDzg==
X-Received: by 2002:a05:6a00:23cc:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-7486cbea4d7mr298694b3a.16.1749573636732;
        Tue, 10 Jun 2025 09:40:36 -0700 (PDT)
Received: from [192.168.1.4] ([122.174.137.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0837c8sm7904836b3a.94.2025.06.10.09.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:40:36 -0700 (PDT)
Message-ID: <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 22:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
 <20250610110047.4yc6zjcvkobxerml@umbar.lan>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610110047.4yc6zjcvkobxerml@umbar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68486006 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=oYmrSCt18pvj5yoFrZalCQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=sZyqXp3NEevGH2Wsh7sA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEzNCBTYWx0ZWRfX1PKkdX8mZJfk
 XeJy8vfRV53TNv9Ku95mgcHKAdz81VjNBpXpfH6epiegXGVcEoDecEslE/7HMlQSjGgs2xHHTz8
 NqUm2oBlJF3btBB61J+iUw7GIz5g5JJPCEImqIMADbsXUd5q0Fa1YfCFs8qdQje2dcY7+m9WYLs
 tpuWgcrQKzS2R903TuioC2BVKOMFJrhbbrPGAhDHCo95HTA52uUKgOX6+lO8xI85MqAYKZYAPsJ
 XS/JqohkHMoIXOH2KVdrknqWetEoVEfAlGcgn9QU/06dYHWuRo8ITspc3xZebqE5JwBre8sckGd
 yuKUNP0TG2OOauRLkwGe/yWvWw640p3dCdI59YRv/MEXDjONg44jC6DYfVoMzg3/xFhvVArzCRs
 RQlf2XJH3nR4luGHOq4yoThqSbV86Y/UubCVXtQFvnvAwIfDS58/I+pScTzk1WIuAAp+t6bi
X-Proofpoint-GUID: flYIrsODyUtpePiA3g87qUF3DwtisI1_
X-Proofpoint-ORIG-GUID: flYIrsODyUtpePiA3g87qUF3DwtisI1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100134



On 6/10/2025 4:30 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 10, 2025 at 02:43:56PM +0530, Krishna Kurapati wrote:
>> When in host mode, it is intended that the controller goes to suspend
>> state to save power and wait for interrupts from connected peripheral
>> to wake it up. This is particularly used in cases where a HID or Audio
>> device is connected. In such scenarios, the usb controller can enter
>> auto suspend and resume action after getting interrupts from the
>> connected device.
>>
>> Allow autosuspend for and xhci device and allow userspace to decide
>> whether to enable this functionality.
>>
>> a) Register to usb-core notifications in set_role vendor callback to
>> identify when root hubs are being created. Configure them to
>> use_autosuspend.
>>
>> b) Identify usb core notifications where the HCD is being added and
>> enable autosuspend for that particular xhci device.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 62 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 56 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index d40b52e2ba01..17bbd5a06c08 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -95,6 +95,8 @@ struct dwc3_qcom {
>>   	 * internally by mutex lock.
>>   	 */
>>   	enum usb_role		current_role;
>> +
>> +	struct notifier_block	xhci_nb;
>>   };
>>   
>>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>> @@ -647,6 +649,39 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>>   	return 0;
>>   }
>>   
>> +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
>> +				    unsigned long event, void *ptr)
>> +{
>> +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
>> +	struct dwc3	  *dwc	= &qcom->dwc;
>> +	struct usb_bus	  *ubus	= ptr;
>> +	struct usb_hcd	  *hcd;
>> +
>> +	if (!dwc->xhci)
>> +		goto done;
>> +
>> +	hcd = platform_get_drvdata(dwc->xhci);
>> +	if (!hcd)
>> +		goto done;
>> +
>> +	if (event != USB_BUS_ADD)
>> +		goto done;
>> +
>> +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
>> +		goto done;
>> +
>> +	if (event == USB_BUS_ADD) {
>> +		/*
>> +		 * Identify instant of creation of primary hcd and
>> +		 * mark xhci as autosuspend capable at this point.
>> +		 */
>> +		pm_runtime_use_autosuspend(&dwc->xhci->dev);
> 
> This feels like an overkill, using notifiers to set autosuspend flag.
> Please extend platform data and/or other static code in order to set the
> flag on the created xHCI devices.
> 

Do you mean modifying pdev of xhci from dwc3/host.c ? Or adding the 
use_autosuspend call in xhci-plat.c ?

I thought adding this notifier would be a better way to identify when 
the xhci probe is in progress instead of touching pdev of xhci device 
from dwc3 layer.

Regards,
Krishna,

>> +	}
>> +
>> +done:
>> +	return NOTIFY_DONE;
>> +}
>> +
>>   static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>>   {
>>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> @@ -659,12 +694,22 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
>>   		return;
>>   	}
>>   
>> -	if (qcom->current_role == USB_ROLE_DEVICE &&
>> -	    next_role != USB_ROLE_DEVICE)
>> +	if (qcom->current_role == USB_ROLE_NONE) {
>> +		if (next_role == USB_ROLE_DEVICE) {
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +		} else if (next_role == USB_ROLE_HOST) {
>> +			qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
>> +			usb_register_notify(&qcom->xhci_nb);
>> +		}
>> +	} else if (qcom->current_role == USB_ROLE_DEVICE &&
>> +		   next_role != USB_ROLE_DEVICE) {
>>   		dwc3_qcom_vbus_override_enable(qcom, false);
>> -	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
>> -		 (next_role == USB_ROLE_DEVICE))
>> -		dwc3_qcom_vbus_override_enable(qcom, true);
>> +	} else if (qcom->current_role == USB_ROLE_HOST) {
>> +		if (next_role == USB_ROLE_NONE)
>> +			usb_unregister_notify(&qcom->xhci_nb);
>> +		else if (next_role == USB_ROLE_DEVICE)
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +	}
>>   
>>   	pm_runtime_mark_last_busy(qcom->dev);
>>   	pm_runtime_put_sync(qcom->dev);
>> @@ -774,6 +819,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   
>>   	if (qcom->mode == USB_DR_MODE_HOST) {
>>   		qcom->current_role = USB_ROLE_HOST;
>> +		qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
>> +		usb_register_notify(&qcom->xhci_nb);
>>   	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>>   		qcom->current_role = USB_ROLE_DEVICE;
>>   		dwc3_qcom_vbus_override_enable(qcom, true);
>> @@ -794,7 +841,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	ret = dwc3_core_probe(&probe_data);
>>   	if (ret)  {
>>   		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
>> -		goto clk_disable;
>> +		goto unregister_notify;
>>   	}
>>   
>>   	ret = dwc3_qcom_interconnect_init(qcom);
>> @@ -817,6 +864,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	dwc3_qcom_interconnect_exit(qcom);
>>   remove_core:
>>   	dwc3_core_remove(&qcom->dwc);
>> +unregister_notify:
>> +	if (qcom->mode == USB_DR_MODE_HOST)
>> +		usb_unregister_notify(&qcom->xhci_nb);
>>   clk_disable:
>>   	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>>   
>> -- 
>> 2.34.1
>>

