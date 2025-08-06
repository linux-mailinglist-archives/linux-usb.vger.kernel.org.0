Return-Path: <linux-usb+bounces-26512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7CB1BDCB
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 02:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0421D3A44ED
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 00:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500DC27455;
	Wed,  6 Aug 2025 00:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miCD0MGJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356629463
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754439499; cv=none; b=CVhSv1fF8xOUEDVvytMIKK27zFrQ5KQid7/UUebkuOa+KzhchLpVbXyZGxV4UxejjThaRqEA8zU95+Nm087767pOc6dLFbHyiO/c7S++VGLBwSysFESLy8TmK9Ei5Y2oxJXrUYLNHNutQvubZvj8inldJQSEvj9wvkllHdiSouw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754439499; c=relaxed/simple;
	bh=zWPcikdlxEOOuRq4NRJjmp4N50OmdJVYDyO+6q81MXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qu6562JhxpLVrnGPEihcJ2ts0z8QGRPiJ5Ivsn3LKJDWkalJVwK826MFFB6OgTdqr/C5GTTbkOQWfVmmlhLbXFIwREbBDEQCnb4y0u/g3K3wvirQvZfshY2bnxjJRdoAoQSIexcDgIIzSf0doXyMQT7BzT53hbpr55s8OdFMG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miCD0MGJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2k5n020209
	for <linux-usb@vger.kernel.org>; Wed, 6 Aug 2025 00:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvWBkDZvrB3ComyWr8P7lYQFA+xq1TzuFi0PKzr6en4=; b=miCD0MGJWGSXpIdr
	RBXWBZBt6OYa5Sjn4dnVQBy2GEXES+srAR7s5zRM9V9YLVfxsIfcuv7EETwFHCve
	MbKP6sXKujN3/hSVSpzkKp1ctSamiPl2K23qzswj8POQsxOysNZEkcEwdPc6NPP5
	UBlHykIMl4HUTDRtaMwutHqIeXLfjY4tBUFyyn2IgJWAWM9f33t/X5VyoFG4SAQM
	wR09GdARwEBaXbFuYzGbX9a2T14kbiKtcm0WeRX06uGzJN1hvp+EZ3WwNJHLfR7X
	duvzQ8termfmmgvVe80pa8ktUYpQ0fWb/S54WeytWKDwf+gv7c8DyCzqr3R9ehqu
	EciybQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvvru5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 06 Aug 2025 00:18:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3928ad6176so5298568a12.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 17:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754439495; x=1755044295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvWBkDZvrB3ComyWr8P7lYQFA+xq1TzuFi0PKzr6en4=;
        b=vkpSJt1X7RT24LOxtDYk/bZXNog04u5VSJtuk4j5lKdkWHVjhqTLEWQGYJ6LeDIEnv
         Z4nwOzEcVlBtsdokRgazfuvY1QM73KBWBmwJQ5g8h3mtNGdzt1rbroSOi+Hd0/YllQdz
         ge2VN1r7eFcxvjNTuwzQtjgLqrP+z0CQn9Qacc8usqrRR+7bzc+Nf75+PPdGrXMDGYTT
         HsdiPWic1MY5+vLEhR/PtN/a7YZnOdA/kjIkz895CqNcyZnsjGxGbBFsrbXKaRT/OU3m
         ky50Gl+yLVu4NNjMGaywWGsbO+kbRP+9Dgqqp4mAfWqMcto/mB2l5VyfN/BAe68B5NU9
         U7wA==
X-Forwarded-Encrypted: i=1; AJvYcCUIfT29WiTmah1Mhz5z5imdw6KXmyO/se0VriIz/97jFdbRcn1JCvg91GdsYAJNcSp77D20TuChCAw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rPIQOPOPgH+1wMtozv9yNjdTpUGwM949RsL08ckbtAjt+LKW
	eg5vpk/8+bXYv0277jr0AAkPXuKx1yc6PQvbiRvvIVMcvnBwDUA4U9uqoRZ9oqpEoqhrB8aQhJ9
	+jqLouq2QVOwS1a2lOoVbla8brsat4xDGLxjGvdVXj/uuW46131Mb/YrUWfRKevF2mm3bKyY=
X-Gm-Gg: ASbGncsFucSMunyoskq6lmz85TQCU1W7gFzTQuZFmsMIcVAUYE8Htmcc5CS2LCeOMrn
	u3AlnetVnH8sO+SQzK+SOqE4zcLmCO/C8H8ORJDUKxpOlsvaIy5x18t1T/wLlKO27DgAqwarega
	ciBsl119O0JfrxuNTV28tkC+MJPBMpRPLPgeviLMzON0IjbdaITJ4Qy5tLJwB5eJL/63GFZb5AL
	R4XxBg6s1m9CVIhbT11ocnunWd79P/LobHh/49HAkoVTcnw2pylWki6+nSdrSQJ/bnufaf8nHYr
	geEeGBGc2/Dml6I4onWC4TipfqAfqcn0RLGq7ue5vmB0seeJEWKoZsyEoJGKe8kZ3wAhLtU=
X-Received: by 2002:a17:902:d551:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-2429f4b9658mr10609315ad.55.1754439494697;
        Tue, 05 Aug 2025 17:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHjRDsaO4MljEr1iMsoRkdj7X8sHmBzQE3vb9b55B1dSs79SABb8p1NT5aC68wMZ/RzkMB2Q==
X-Received: by 2002:a17:902:d551:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-2429f4b9658mr10608995ad.55.1754439494165;
        Tue, 05 Aug 2025 17:18:14 -0700 (PDT)
Received: from [192.168.1.4] ([223.230.69.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1efe8sm141916405ad.69.2025.08.05.17.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:18:13 -0700 (PDT)
Message-ID: <98f9936b-3833-4350-8249-169784be1e53@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 05:48:09 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250623233211.aeehndz2nxqovepd@synopsys.com>
 <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
 <20250711232929.5oukafed5lnvsu2v@synopsys.com>
 <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
 <20250730012307.7rwh3lzz4ohd4mob@synopsys.com>
 <ac7212fe-5c22-46cf-ac3b-ac6b93cb1384@oss.qualcomm.com>
 <20250801010119.tvhb6tjlf4fq7zhg@synopsys.com>
 <d28a61ff-e40a-438d-afd7-5a4bc5cb3625@oss.qualcomm.com>
 <20250805231808.cjht64mfabaw2ik5@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250805231808.cjht64mfabaw2ik5@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IelQ3nkOA-e6hMgI8ovLcCEbzFBwlmMF
X-Authority-Analysis: v=2.4 cv=GttC+l1C c=1 sm=1 tr=0 ts=68929f47 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=dFKNRnJIrmssHmy2/bds8Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6Or4dFEDmD3b5ZOWyvAA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: IelQ3nkOA-e6hMgI8ovLcCEbzFBwlmMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE3MCBTYWx0ZWRfX9n6Fg94sLyOV
 tFGIcZGN/HakBkP4MJo7/9khNLLNdcaSWRvnrlE23Ll0W+1n8XhgQC63MGgyvGlqiCFo2Gkz8Yn
 v6gox/eHFw8MdhDSaI8lu3aXkpa9a4FQpTOcOodNHPmbQzCI+ojuP23zL9bK+SGl79Zu+rzp9xY
 yJiUunc7oWxCuRgb8UHWFFAUOOeeGq3sxjSaRvcr39945dRWkGLDsTwAvNYiLiFulkME8J9TvOG
 bz+GOMXozNR1DFrj8nfc852c29aUm0Oze19t9nQb9irJo6bXnCKESbRTd2pqY0cftTzgKoHsQr9
 FxYZkOr4ynThvRkgSYewasxu5dxdsKiMup7B8MF0WC0Y0m/LrFHf//2/47rMOur9nDizBak/Vwj
 Cn9xcwlShBntQbwMw9bbYkXahPxtu4HpAUpw1yc838oc3rKFyDRNqp1XBi8wxDtawumcF/G0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508050170



On 8/6/2025 4:48 AM, Thinh Nguyen wrote:

[...]

>>>>>>>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>>>> index ca7e1c02773a..d40b52e2ba01 100644
>>>>>>>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>>>> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>>>>>>>>>>       	bool			pm_suspended;
>>>>>>>>>>       	struct icc_path		*icc_path_ddr;
>>>>>>>>>>       	struct icc_path		*icc_path_apps;
>>>>>>>>>> +
>>>>>>>>>> +	/*
>>>>>>>>>> +	 * Current role changes via usb_role_switch_set_role callback protected
>>>>>>>>>> +	 * internally by mutex lock.
>>>>>>>>>> +	 */
>>>>>>>>>> +	enum usb_role		current_role;
>>>>>>>>>
>>>>>>>>> Can we just track the current role through dwc3 core instead of an
>>>>>>>>> addition field in the glue?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Core caches only mode. We need ROLE NONE to identify cable connect. So
>>>>>>>> adding that in glue to keep track.
>>>>>>>>
>>>>>>>
>>>>>>> The controller is always either host or device, not somewhere in
>>>>>>> between. You're using ROLE_NONE to indicate connection, which is a
>>>>>>> separate state.
>>>>>>>
>>>>>>
>>>>>> Yes, but there is no flag that indicates that in dwc structure today. Also
>>>>>> since only dwc3-qcom needs it at the moment, I added that role info in glue
>>>>>> layer.
>>>>>
>>>>> How are you using ROLE NONE? Do you send a role-switch call to "none" to
>>>>> indicate disconnect? Let's not do that. Currently the dwc3 driver would
>>>>> switch back to the default mode if "none" is selected, but this is not
>>>>> well defined and implementation specific. It can be no-op and would not
>>>>> violate the interface.
>>>>>
>>>>> The role-switch interface should only be used for role-switching and not
>>>>> connection/disconnection.
>>>>>
>>>>>>
>>>>>>> I feel this should be tracked separately for clarity. The dwc3 also
>>>>>>> tracks the connection state, can we use that?
>>>>>>>
>>>>>>
>>>>>> Are you referring to the "connected" flag in DWC structure ? I see that it
>>>>>> indicates connection status only in gadget mode.
>>>>>>
>>>>>
>>>>> Yes, that flag is only for gadget.
>>>>>
>>>>> Can you provide more info of the setup? Is there a type-c controller or
>>>>> phy that can detect attach/deattach? Or it only propagates to the usb
>>>>> controller?
>>>>
>>>> My response didn't show up on lore since the mail client I used before sent
>>>> the message in HTML format. So resending my response again.
>>>>
>>>> Hi Thinh,
>>>>
>>>>    Yes this is for cases where role switching is present (either with a Type-C
>>>> controller, USB-conn-gpio, or a glink based role-switch).
>>>>
>>>>    Actually the requirement is as follows:
>>>>    1. When in device mode, if we receive a cable disconnect, we need to clear
>>>> OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
>>>>    2. When cable is connected in device mode, we need to set the
>>>> OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
>>>>    3. When the runstop is set back after a suspend rotuine, then we need to
>>>> set  OTG_VBUS_VALID bit of QSCRATCH register in glueaddress space.
>>>>
>>>>    To take care of all the 3 scenarios above, the set_role and run_stop
>>>> notifiers have been added.
>>>>
>>>>    The role info propagates only from core to glue. It is not sent to the phy.
>>>>
>>>
>>> When does ROLE NONE occur? Did you have the type-c driver set the role
>>> switch to "none" indicate disconnect?
>>>
>>> The vbus-valid is only for gadget, and you only care about the
>>> OTG_VBUS_VALID right? Can we just use the dwc3->connected flag? Just
>>> make sure that it's cleared on role-switch, which should be the case
>>> because we always perform soft-disconnect on gadget unbind, and make
>>> sure to set vbus-valid on pullup or gadget binding. Is there some
>>> scenarios that dwc->connected does not cover?
>>>
>>
>> Hi Thinh,
>>
>>   In case of just a cable disconnect in device mode (and default dr mode is
>> peripheral only), there would be no role switch. In that scenario, connected
>> flag would stay "true" even after removing cable. In that case, we can
>> generate disconnect interrupt only by clearing this VBUS_VALID bit and
>> inturn the suspend will succeed. So wanted to use notification from set_role
>> which would cover all cases:
>> 1. cable disconnect/cable connect
>> 2. Role switch from host->device and device->host
>>
> 
> Ok. Thanks for the explanation. How everything tied together seems
> awkward: The connector does a role-switch to "none" to trigger a
> role-switch in dwc3, which then triggers a callback to dwc3-qcom to
> clear vbus_valid, which then allows the controller to see a disconnect
> event in dwc3. Is that right?
> 

Yes, that is right.

> The connector driver should have a separate interface for
> attach/deattach in addition to role-switch. But I don't think type-c
> controller, USB-conn-gpio, and glink share the same way to handle
> connection/disconnection.
> 

I think although ROLE_NONE is for selecting default mode, it still means 
the same in USB-conn-gpio / ucsi-glink and hd3ss3220 (not sure about 
typec-controller).

> Let's keep what you proposed, and keep in mind that ROLE NONE is for
> selecting the default mode and not necessarily mean disconnection.
> 

Sure. Will do the following in v3:
1. Instead of adding host notifiers, will add 
"pm_runtime_use_autosuspend" in xhci-plat.c
2. Fix up coding issues pointed by you in patch 1/4.

Let me know if this sounds fine.

Regards,
Krishna,

