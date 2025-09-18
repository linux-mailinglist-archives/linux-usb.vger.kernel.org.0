Return-Path: <linux-usb+bounces-26493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02808B1B284
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 13:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231C317C8FA
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 11:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E53246BD9;
	Tue,  5 Aug 2025 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYFe/pgg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2345A244671
	for <linux-usb@vger.kernel.org>; Tue,  5 Aug 2025 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754392719; cv=none; b=CQ4Yb7aKVnjHoXkgHjrfcuer3K6xcWwkZ8rAhoeJUUp/lrO0RFOFUImTHFnO2OvBLJQ12wre+ZaQgwLF6J0CCxkRWG9rZCZfqhC/3APfyoIKBFm36p0tWhyMu4266uVgBKS2Hb+h9bF5czfycLLtj0FWrNLbXHseqotQtMeziIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754392719; c=relaxed/simple;
	bh=hvEjaT5dcBfMjmESc+QEsUBDQcPRKYOGdN6kzoDe17w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mS8C0rmd1CGQ622zOSywbfWBkSQI3Egg9S4NAk30TblCtA9vDkXkuQBgHfDfvemA7r/wmHQdfbwYLk8LMt4NKxNTLJWDsVIRZHXfRGrf3cLCE3MQuV3tSDCOPKCaQ+i7Avq+v9gIVekPpHuK8gqFzUnbLzToWK9/5D1YOsC/V0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYFe/pgg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575AIJdw015920
	for <linux-usb@vger.kernel.org>; Tue, 5 Aug 2025 11:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+UtkDtN+fyKayeHp5S67YUnWVczmNgfytTivDi9O4Bs=; b=SYFe/pggxZXEqNog
	ztaw4eWkD3a/xeVkjA2bBgokWN1h6kbj02YMaX1gYhBKrRRlAkFE49vvjGL6a2iS
	0GlLzFmSwoRdmvYzKmzvBW9z+VPueVXpjkgoa3C86w62njYm4mp/SL70hqF6eAhA
	X0tBbiemqcn9aYcXr2Vl5MJSlRFB8ZGfc9J/FoA/efp7ovcWrz/+e/D9Bxs3TUmR
	pfVm0x/yMeTgWEvI9IxzPw7A17WxcX6M9tt0wdsMxsXVdvNw1HBYtjQ7flK6ytDA
	R8Djk4QX5vyYU4v6Jc+ulxEhdb5ixc8EiDQUQzlsTAD+o1gGs4F+Ua/o2IuoeKhg
	ctPF8g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv4gpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 11:18:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76bcd829ff1so4373085b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 04:18:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754392715; x=1754997515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UtkDtN+fyKayeHp5S67YUnWVczmNgfytTivDi9O4Bs=;
        b=P17/yUUApa3dL+iJs0I6mtDVWTKwxNW+/pxDhSTYrs0Ux/rI0/9R5VXeTKGh3EyZmu
         RqSv2pDvzKyLk7mzv1rIFrGWuZGdTNydgg8qcDgCY3B6zPkyJcBjECr289W3ox/LqXPM
         L+j+f3+hZOQoDo5mMy6b7RV0R/j3EwKLCOaPmFkKs5UXvRvZVZkWV1qF6h+ydxyxLBZW
         02BV7BDwNjlrttq+7nYpWM/v6EqrInUx0BWNBfxB4gwUShTnkfV6UGCXxeLmdI77y1Yn
         aVtYVOWdIl8DYz/idayPFxiuVaJdgBgDDOLdlTdiiOZzPSXH6+Gtt87MFgtR8pS/cQEE
         Nfqg==
X-Forwarded-Encrypted: i=1; AJvYcCXZRVm4TxflFZeaUIVEa/GNBEwJY8B1j1kajDLblvAMSCJIDSKop9rs56Vjrtru1wJSubi8YicKy18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp5xT6/ABHr093NFdTr/ndwljbddDCEpwDdqbrE8K5kSxiV9dY
	90rZZQccO2Ha/Gaf/t3j6oCvBDq47qYlRqdVLoyu6wA6l4W8z70OGPer/t6FNu3v2Kbgoj8Frwd
	TPwv7UDsriZpJDjc78aLjTFJov5GObxr8mHLy8rUuIz0OqfQQaCIZLC/PThrMQ5cyQx2fbHs=
X-Gm-Gg: ASbGncsJKGFjmIzJa55e550LYsvnBAOIKN/+abtXa2IYo/AGjHYS/xzFZbfa9fEwlEK
	KaAnNg9JqmxXWGbgmwMSTDFnqFOVkE+5YQ9rcxKRWX7B9Lb/lGZiX8L+oZtFjhAP7Lbc8NeSDaE
	mgekN6nMrLiuIK5D5UL6EOzBunivvBWBxZObc5Gcl3p1YwCSu91R/lOJmiCe/w1JrJ6RJk/L0yl
	CNGF1pXbtLv0WhVFZBJpZeejvmnHzy2sTgBCm45/BiKUZsOCgT0zeSvtNe5tRb8Brle2OtIyf8t
	H12rD7nRRTn7fez0JgnGyXD1ybDZQ+qP10jci/rXuut/pqVWWaJDhdq9hkWsyvZqYuJ+ZoI=
X-Received: by 2002:a05:6a00:3910:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-76bec30c7ccmr17132059b3a.7.1754392715069;
        Tue, 05 Aug 2025 04:18:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFGhrp3TbB/m3fibwOh2GnRn00juuzRFHGqHiZWS4PO3XswlF6ml/+1CbWee3207HS6IZGtw==
X-Received: by 2002:a05:6a00:3910:b0:736:5f75:4a3b with SMTP id d2e1a72fcca58-76bec30c7ccmr17132019b3a.7.1754392714532;
        Tue, 05 Aug 2025 04:18:34 -0700 (PDT)
Received: from [10.92.173.209] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f6eesm12759553b3a.22.2025.08.05.04.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 04:18:34 -0700 (PDT)
Message-ID: <d28a61ff-e40a-438d-afd7-5a4bc5cb3625@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 16:48:30 +0530
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
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250801010119.tvhb6tjlf4fq7zhg@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yYER2llV6-5aqKWfNswfaH4kKiAJ2ICP
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6891e88c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=SGoEfCKqnJIlJZnP-VQA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: yYER2llV6-5aqKWfNswfaH4kKiAJ2ICP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA4MSBTYWx0ZWRfXzTjSmP1SfX3+
 faYbCSpbTzWNodz+vVWySJy3lPj6/VjmacXBNpm20JWzD2nRDbz+v/1zY659NWzwevM9DJN8qzh
 Om7RGYdRY4ieMwuFH/gcZWp2klI+0MfZOPIklTHdV01rv4GruijrK9f9ehR7GoSiK2q+JsPv+Jd
 W+BiiKYPg1eZPmHNZfCSzNflB1N7GgLlIT8ePw9trJPr5ItP6jDQLh/Lx9SO+kCB+/j7VhZU87Z
 j1yhL4RvlKgNmiCR3xJ//G6MKltRrzfDptCR7LdxBr/SlR1RzOCJEwQzu5tanzjAx298Yj9LsAf
 BgQ/O92pSrPI9rLgLPVzo8qUXBO+iTQ40H9vigP3fv0Gd7pABjxIi4HVQ1w1qEo4O13e2V/sm/1
 fzEiJc8abzMCNr0zQmnn0p23UMizZqc/9/LSX3qNHhhJkV9Ba+IXiB1agifPqk6hqerslky3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=847 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050081



On 8/1/2025 6:31 AM, Thinh Nguyen wrote:
> On Wed, Jul 30, 2025, Krishna Kurapati wrote:
>>
>>
>> On 7/30/2025 6:53 AM, Thinh Nguyen wrote:
>>> On Sun, Jul 13, 2025, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 7/12/2025 4:59 AM, Thinh Nguyen wrote:
>>>>> On Tue, Jun 24, 2025, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 6/24/2025 5:02 AM, Thinh Nguyen wrote:
>>>>>>> On Tue, Jun 10, 2025, Krishna Kurapati wrote:
>>>>>>>> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
>>>>>>>> device mode are generated by controller when software writes to QSCRATCH
>>>>>>>> registers in Qualcomm Glue layer rather than the vbus line being routed to
>>>>>>>> dwc3 core IP for it to recognize and generate these events.
>>>>>>>>
>>>>>>>> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
>>>>>>>> to generate a connection done event and to be cleared for the controller to
>>>>>>>> generate a disconnect event during cable removal. When the disconnect is
>>>>>>>> not generated upon cable removal, the "connected" flag of dwc3 is left
>>>>>>>> marked as "true" and it blocks suspend routines and for that to happen upon
>>>>>>>> cable removal, the cable disconnect notification coming in via set_role
>>>>>>>> call need to be provided to the Qualcomm glue layer as well.
>>>>>>>>
>>>>>>>> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
>>>>>>>> there is no mechanism through which the DWC3 core can notify the Qualcomm
>>>>>>>> glue layer of any role changes which it receives via role switch. To
>>>>>>>> register these glue callbacks at probe time, for enabling core to notify
>>>>>>>> glue layer, the legacy Qualcomm driver has no way to find out when the
>>>>>>>> child driver probe was successful since it does not check for the same
>>>>>>>> during of_platform_populate.
>>>>>>>>
>>>>>>>> Hence implement the following glue callbacks for flattened Qualcomm glue
>>>>>>>> driver:
>>>>>>>>
>>>>>>>> 1. set_role: To pass role switching information from drd layer to glue.
>>>>>>>> This information is needed to identify NONE/DEVICE mode switch and modify
>>>>>>>> QSCRATCH to generate connect-done event on device mode entry and disconnect
>>>>>>>> event on cable removal in device mode.
>>>>>>>>
>>>>>>>> 2. run_stop: When booting up in device mode, if autouspend is enabled and
>>>>>>>> userspace doesn't write UDC on boot, controller enters autosuspend. After
>>>>>>>> this, if the userspace writes to UDC in the future, run_stop notifier is
>>>>>>>> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
>>>>>>>> event is generated after run_stop(1) is done to finish enumeration.
>>>>>>>>
>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
>>>>>>>>      1 file changed, 73 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>> index ca7e1c02773a..d40b52e2ba01 100644
>>>>>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>>>>>>>>      	bool			pm_suspended;
>>>>>>>>      	struct icc_path		*icc_path_ddr;
>>>>>>>>      	struct icc_path		*icc_path_apps;
>>>>>>>> +
>>>>>>>> +	/*
>>>>>>>> +	 * Current role changes via usb_role_switch_set_role callback protected
>>>>>>>> +	 * internally by mutex lock.
>>>>>>>> +	 */
>>>>>>>> +	enum usb_role		current_role;
>>>>>>>
>>>>>>> Can we just track the current role through dwc3 core instead of an
>>>>>>> addition field in the glue?
>>>>>>>
>>>>>>
>>>>>> Core caches only mode. We need ROLE NONE to identify cable connect. So
>>>>>> adding that in glue to keep track.
>>>>>>
>>>>>
>>>>> The controller is always either host or device, not somewhere in
>>>>> between. You're using ROLE_NONE to indicate connection, which is a
>>>>> separate state.
>>>>>
>>>>
>>>> Yes, but there is no flag that indicates that in dwc structure today. Also
>>>> since only dwc3-qcom needs it at the moment, I added that role info in glue
>>>> layer.
>>>
>>> How are you using ROLE NONE? Do you send a role-switch call to "none" to
>>> indicate disconnect? Let's not do that. Currently the dwc3 driver would
>>> switch back to the default mode if "none" is selected, but this is not
>>> well defined and implementation specific. It can be no-op and would not
>>> violate the interface.
>>>
>>> The role-switch interface should only be used for role-switching and not
>>> connection/disconnection.
>>>
>>>>
>>>>> I feel this should be tracked separately for clarity. The dwc3 also
>>>>> tracks the connection state, can we use that?
>>>>>
>>>>
>>>> Are you referring to the "connected" flag in DWC structure ? I see that it
>>>> indicates connection status only in gadget mode.
>>>>
>>>
>>> Yes, that flag is only for gadget.
>>>
>>> Can you provide more info of the setup? Is there a type-c controller or
>>> phy that can detect attach/deattach? Or it only propagates to the usb
>>> controller?
>>
>> My response didn't show up on lore since the mail client I used before sent
>> the message in HTML format. So resending my response again.
>>
>> Hi Thinh,
>>
>>   Yes this is for cases where role switching is present (either with a Type-C
>> controller, USB-conn-gpio, or a glink based role-switch).
>>
>>   Actually the requirement is as follows:
>>   1. When in device mode, if we receive a cable disconnect, we need to clear
>> OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
>>   2. When cable is connected in device mode, we need to set the
>> OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
>>   3. When the runstop is set back after a suspend rotuine, then we need to
>> set  OTG_VBUS_VALID bit of QSCRATCH register in glueaddress space.
>>
>>   To take care of all the 3 scenarios above, the set_role and run_stop
>> notifiers have been added.
>>
>>   The role info propagates only from core to glue. It is not sent to the phy.
>>
> 
> When does ROLE NONE occur? Did you have the type-c driver set the role
> switch to "none" indicate disconnect?
> 
> The vbus-valid is only for gadget, and you only care about the
> OTG_VBUS_VALID right? Can we just use the dwc3->connected flag? Just
> make sure that it's cleared on role-switch, which should be the case
> because we always perform soft-disconnect on gadget unbind, and make
> sure to set vbus-valid on pullup or gadget binding. Is there some
> scenarios that dwc->connected does not cover?
> 

Hi Thinh,

  In case of just a cable disconnect in device mode (and default dr mode 
is peripheral only), there would be no role switch. In that scenario, 
connected flag would stay "true" even after removing cable. In that 
case, we can generate disconnect interrupt only by clearing this 
VBUS_VALID bit and inturn the suspend will succeed. So wanted to use 
notification from set_role which would cover all cases:
1. cable disconnect/cable connect
2. Role switch from host->device and device->host

Regards,
Krishna,

