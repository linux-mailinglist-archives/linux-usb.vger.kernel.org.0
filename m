Return-Path: <linux-usb+bounces-23-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D179F8FE
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 05:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31AADB2080B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 03:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEE61379;
	Thu, 14 Sep 2023 03:44:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC047F
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 03:44:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCA9193
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 20:44:51 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E2aft8006295;
	Thu, 14 Sep 2023 03:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=M82+JA6b1G/k0fHJYX0epaVsOYlL8vE+yw3omLt9M68=;
 b=RYei1KHhRG+pLk+PX4nuIPn8vbE8GsWBmJ6N4sfFei9vLoGe5UKzmonL4uU85OoZ9cUL
 50s/N+yzQeCuRnvyeZp8HQQyYnDV4h5l6pGOTRTqpMuWN5cK5/Z9qCiWKwOvUMzZyBnU
 RxZeqf08BHN06VlXxKTq/6VvBrk8Jdh8iJzCzGZUy2xHF7g2jQBLXBUY5QO6Ob71qBnb
 JQwQjyCFRyhB1CjUzzAKRZXF+bEc5fN9dwzQC/2dcFQHP/lnPqROi2yFZFLjHh7PCGWI
 0JH1WGCUKXxJ5k7oKaw6zsW2z17GC7f7Cunv/12eVkj3IgKGbpD9AD7Bmb4+Tdcys2JT pw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3r15r9dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 03:44:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38E3iF1r019487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 03:44:15 GMT
Received: from [10.253.74.98] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 13 Sep
 2023 20:44:07 -0700
Message-ID: <964a5eaf-acac-be1a-cd0b-d4141f22ba87@quicinc.com>
Date: Thu, 14 Sep 2023 11:44:05 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct
 usb_gadget
Content-Language: en-US
From: Linyu Yuan <quic_linyyuan@quicinc.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel
 Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Cristian Birsan
	<cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, Kevin Cernekee
	<cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Al Cooper
	<alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy
	<vz@mleia.com>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang
	<haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva
	<rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah
 Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        <linux-usb@vger.kernel.org>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
 <20230912104455.7737-2-quic_linyyuan@quicinc.com>
 <2023091255-unsubtly-daisy-7426@gregkh>
 <d1c34d15-e598-5f86-bc86-cd5e656225c9@quicinc.com>
 <ef99b328-926c-4696-83bf-9ccd6a38984e@rowland.harvard.edu>
 <be818ccf-96fd-2fa0-8f95-1f49e3aa2dfc@quicinc.com>
 <a735ee44-e030-4c58-a929-dc11292997bd@rowland.harvard.edu>
 <fcaaa5c6-7c72-439d-c881-acd9cbe4d6da@quicinc.com>
In-Reply-To: <fcaaa5c6-7c72-439d-c881-acd9cbe4d6da@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j8Kgr319pMVx_jaShLlllH9BJK8svBJx
X-Proofpoint-ORIG-GUID: j8Kgr319pMVx_jaShLlllH9BJK8svBJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_19,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=492 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309140030


On 9/14/2023 10:25 AM, Linyu Yuan wrote:
>
> On 9/14/2023 10:16 AM, Alan Stern wrote:
>> On Thu, Sep 14, 2023 at 09:08:04AM +0800, Linyu Yuan wrote:
>>> On 9/14/2023 12:02 AM, Alan Stern wrote:
>>>> On Wed, Sep 13, 2023 at 11:46:12AM +0800, Linyu Yuan wrote:
>>>>> but Alan Stern have one comment, do it mean the bit position 
>>>>> number is not
>>>>> expect and we can't use it ?
>>>>>
>>>>> @Alan Stern ,  BIT(0), BIT(1) is not the member we expect ?
>>>> They might not be.  If you can avoid making this assumption, you 
>>>> should.
>>>
>>> i don't know if it is true or not, seem some driver expect there is 
>>> no hole
>>> for this kind of bit field definition.
>> I didn't say there would be a hole; I said that BIT(0) might not be the
>> member you expect.  For example, sg_supported might be BIT(31) instead
>> of BIT(0).
>
>
> got it, it is same concern of Greg.
>
>
>>
>>>>>> This macro usage is a real mess. Can't you find a better way to 
>>>>>> do it?
>>>>>>
>>>>>> For instance, in the code that parses the trace buffer, define a
>>>>>> temporary usb_gadget structure and copy the dw1 field from the trace
>>>>>> buffer to the temporary structure.  Then you can access the 
>>>>>> fields in
>>>>>> that structure directly by their original names, with no macros.
>>>>> do it same idea just move it outside of gadget.h ?
>>>> Keep the anonymous union in gadget.h, but get rid of the macros.
>>>
>>> do you expect below ?
>>>
>>>
>>> --- a/include/linux/usb/gadget.h
>>> +++ b/include/linux/usb/gadget.h
>>> @@ -357,6 +357,7 @@ struct usb_gadget_ops {
>>>    * @in_epnum: last used in ep number
>>>    * @mA: last set mA value
>>>    * @otg_caps: OTG capabilities of this gadget.
>>> + * @dw1: trace event purpose
>>>    * @sg_supported: true if we can handle scatter-gather
>>>    * @is_otg: True if the USB device port uses a Mini-AB jack, so 
>>> that the
>>>    *     gadget driver must provide a USB OTG descriptor.
>>> @@ -432,30 +433,88 @@ struct usb_gadget {
>>>          unsigned                        mA;
>>>          struct usb_otg_caps             *otg_caps;
>>>
>>> -       unsigned                        sg_supported:1;
>>> -       unsigned                        is_otg:1;
>>> -       unsigned                        is_a_peripheral:1;
>>> -       unsigned                        b_hnp_enable:1;
>>> -       unsigned                        a_hnp_support:1;
>>> -       unsigned                        a_alt_hnp_support:1;
>>> -       unsigned                        hnp_polling_support:1;
>>> -       unsigned                        host_request_flag:1;
>>> -       unsigned quirk_ep_out_aligned_size:1;
>>> -       unsigned quirk_altset_not_supp:1;
>>> -       unsigned quirk_stall_not_supp:1;
>>> -       unsigned                        quirk_zlp_not_supp:1;
>>> -       unsigned quirk_avoids_skb_reserve:1;
>>> -       unsigned                        is_selfpowered:1;
>>> -       unsigned                        deactivated:1;
>>> -       unsigned                        connected:1;
>>> -       unsigned                        lpm_capable:1;
>>> -       unsigned                        wakeup_capable:1;
>>> -       unsigned                        wakeup_armed:1;
>>> +       union {
>>> +               struct {
>>> +                       unsigned        sg_supported:1;
>>> +                       unsigned        is_otg:1;
>>> +                       unsigned        is_a_peripheral:1;
>>> +                       unsigned        b_hnp_enable:1;
>>> +                       unsigned        a_hnp_support:1;
>>> +                       unsigned        a_alt_hnp_support:1;
>>> +                       unsigned        hnp_polling_support:1;
>>> +                       unsigned        host_request_flag:1;
>>> +                       unsigned quirk_ep_out_aligned_size:1;
>>> +                       unsigned quirk_altset_not_supp:1;
>>> +                       unsigned quirk_stall_not_supp:1;
>>> +                       unsigned        quirk_zlp_not_supp:1;
>>> +                       unsigned quirk_avoids_skb_reserve:1;
>>> +                       unsigned        is_selfpowered:1;
>>> +                       unsigned        deactivated:1;
>>> +                       unsigned        connected:1;
>>> +                       unsigned        lpm_capable:1;
>>> +                       unsigned        wakeup_capable:1;
>>> +                       unsigned        wakeup_armed:1;
>>> +               } __packed;
>>> +
>>> +               u32                     dw1;
>>> +       } __aligned(4);
>>>          int                             irq;
>>>          int                             id_number;
>>>   };
>>>   #define work_to_gadget(w)      (container_of((w), struct 
>>> usb_gadget, work))
>> Stop here.  The above is what I expect.  Don't include any of the
>> material below.
>>
>> (BTW, you don't need the __aligned(4) thing, do you?  Since the union
>> includes a 32-bit integer field, it will naturally be aligned on a
>> 4-byte boundary.)
>
>
> sure, will remove it.
>
>
>>
>>> +#define USB_GADGET_BITFIELD(field)                             \
>>> +static inline u32 usb_gadget_bit_##field(u32 dw1)              \
>>> +{                                                              \
>>> +       union {                                                 \
>>> +               struct {                                        \
>>> +                       u32 sg_supported:1;                 \
>>> +                       u32 is_otg:1;                       \
>>> +                       u32 is_a_peripheral:1;              \
>>> +                       u32 b_hnp_enable:1;                 \
>>> +                       u32 a_hnp_support:1;                \
>>> +                       u32 a_alt_hnp_support:1;            \
>>> +                       u32 hnp_polling_support:1;          \
>>> +                       u32 host_request_flag:1;            \
>>> +                       u32 quirk_ep_out_aligned_size:1;    \
>>> +                       u32 quirk_altset_not_supp:1;        \
>>> +                       u32 quirk_stall_not_supp:1;         \
>>> +                       u32 quirk_zlp_not_supp:1;           \
>>> +                       u32 quirk_avoids_skb_reserve:1;     \
>>> +                       u32 is_selfpowered:1;               \
>>> +                       u32 deactivated:1;                  \
>>> +                       u32 connected:1;                    \
>>> +                       u32 lpm_capable:1;                  \
>>> +                       u32 wakeup_capable:1;               \
>>> +                       u32 wakeup_armed:1;                 \
>>> +               } __packed;                                     \
>>> +               u32 dw1;                            \
>>> +       } __aligned(4) u;                                       \
>>> +       BUILD_BUG_ON(sizeof(u) != 4);                           \
>>> +       u.dw1 = dw1;                                            \
>>> +       return u.field;                                         \
>>> +}
>>> +
>>> +USB_GADGET_BITFIELD(sg_supported)
>>> +USB_GADGET_BITFIELD(is_otg)
>>> +USB_GADGET_BITFIELD(is_a_peripheral)
>>> +USB_GADGET_BITFIELD(b_hnp_enable)
>>> +USB_GADGET_BITFIELD(a_hnp_support)
>>> +USB_GADGET_BITFIELD(a_alt_hnp_support)
>>> +USB_GADGET_BITFIELD(hnp_polling_support)
>>> +USB_GADGET_BITFIELD(host_request_flag)
>>> +USB_GADGET_BITFIELD(quirk_ep_out_aligned_size)
>>> +USB_GADGET_BITFIELD(quirk_altset_not_supp)
>>> +USB_GADGET_BITFIELD(quirk_stall_not_supp)
>>> +USB_GADGET_BITFIELD(quirk_zlp_not_supp)
>>> +USB_GADGET_BITFIELD(quirk_avoids_skb_reserve)
>>> +USB_GADGET_BITFIELD(is_selfpowered)
>>> +USB_GADGET_BITFIELD(deactivated)
>>> +USB_GADGET_BITFIELD(connected)
>>> +USB_GADGET_BITFIELD(lpm_capable)
>>> +USB_GADGET_BITFIELD(wakeup_capable)
>>> +USB_GADGET_BITFIELD(wakeup_armed)
>> So ignore all of that.
>>
>> Now in your patch 4/10, do something that will have this effect:
>>
>> +    struct usb_gadget g;
>> +
>> +    g.dw1 = __entry->dw1;
>> +
>>     TP_printk(....
>> -        __entry->sg_supported ? "sg:" : "",
>> +        g.sg_supported ? "sg:" : "",
>> ...
>>
>> You probably can't do it exactly this way, because this won't work with
>> the tracing macros, but maybe something that is equivalent will work.
>>
>> For example, you could try:
>>
>> +#define USB_GADGET_BITFIELD(field)        \
>> +    ({struct usb_gadget g;            \
>> +        g.dw1 = __entry->dw1;        \
>> +        g.field;})
>>
>>     TP_printk(....
>> -        __entry->sg_supported ? "sg:" : "",
>> +        USB_GADGET_BITFIELD(sg_supported) ? "sg:" : "",
>>
>> Do you get the idea now?
>
>
> this is good idea, it is more simple.
>
> but still one question, why can't put in gadget.h, or not it need in 
> every trace file, right ?


i will add new trace event macro to cover this special case.

will send next version.


>
>
>>
>> Alan Stern

