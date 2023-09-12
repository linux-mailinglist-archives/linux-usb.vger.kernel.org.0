Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6464379C1FE
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 03:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbjILBvm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 21:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236276AbjILBv2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 21:51:28 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124AB32CDF
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 18:25:17 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BNQl5M026467;
        Tue, 12 Sep 2023 00:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vkA6Z0gdCChq9Rkh3JHgH2NRqaeRs/tHtnJDS8d9rzQ=;
 b=E2H4959OlGx4kWqqgJHCs6StBGTV8KK8o2WTm28tzG2qeXc6oCaRwov6pqO9gIdrbijs
 +SCwlI3oYSkHA60f0XTQGzkkJBuXV4JdmlNcAyK5q7SP6BwhEDhkusUT34m5cW8vISUl
 gVu8AjQ1gNYbH6algWAVwwfAn1WaSyB4F45EO7+ZYA61d8nlve+iVt3KVyMAe3XEnqFn
 MHsLKRcCMge5i5u3hyarg3Er0u4gXKekM6oFPDlk3ONDUjvPXT5hqWtXAL6nNXxM3sDw
 HkU5NLFRyqm9U2P5Q1NdTc7DmnALJklfehzcnAggpwi/wi8J6Y3WkaDrLB+MU8PnVEXK bw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1xjmt3r4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 00:16:30 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38C0GT2S004900
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 00:16:29 GMT
Received: from [10.253.77.1] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 17:16:23 -0700
Message-ID: <cda13b00-eac7-c65d-9d1f-0faf7b943e01@quicinc.com>
Date:   Tue, 12 Sep 2023 08:16:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 01/11] usb: gadget: add anonymous definition in struct
 usb_gadget
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, Kevin Cernekee <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
References: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
 <20230911042843.2711-2-quic_linyyuan@quicinc.com>
 <de4af676-d1ca-4e75-9d73-9f120dd2f750@rowland.harvard.edu>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <de4af676-d1ca-4e75-9d73-9f120dd2f750@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -wR-Y8Tskg7OgGFKmbJZW_EwAaujNqOV
X-Proofpoint-GUID: -wR-Y8Tskg7OgGFKmbJZW_EwAaujNqOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=604
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120001
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/11/2023 10:53 PM, Alan Stern wrote:
> On Mon, Sep 11, 2023 at 12:28:33PM +0800, Linyu Yuan wrote:
>> Some UDC trace event will save usb gadget information, but it will use
>> one int size buffer to save one bit information of usb gadget, so more
>> than one int buffer to save several bit fields which is not good.
>>
>> Add one anonymous union have three u32 members which can be used by trace
>> event during fast assign stage to reduce trace buffer usage, and add
>> related macro to extract bit fields from u32 members for later trace event
>> output state usage.
>>
>> Also move sg_supported and other bit fields into one anonymous struct
>> which inside anonymous union and Change bit fields from unsigned to u32
>> type, it will make sure union member have expected u32 size.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>>   include/linux/usb/gadget.h | 63 ++++++++++++++++++++++++++------------
>>   1 file changed, 44 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
>> index 75bda0783395..cdf62e7f34e7 100644
>> --- a/include/linux/usb/gadget.h
>> +++ b/include/linux/usb/gadget.h
>> @@ -357,6 +357,7 @@ struct usb_gadget_ops {
>>    * @in_epnum: last used in ep number
>>    * @mA: last set mA value
>>    * @otg_caps: OTG capabilities of this gadget.
>> + * @dw1: trace event purpose
>>    * @sg_supported: true if we can handle scatter-gather
>>    * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
>>    *	gadget driver must provide a USB OTG descriptor.
>> @@ -432,25 +433,49 @@ struct usb_gadget {
>>   	unsigned			mA;
>>   	struct usb_otg_caps		*otg_caps;
>>   
>> -	unsigned			sg_supported:1;
>> -	unsigned			is_otg:1;
>> -	unsigned			is_a_peripheral:1;
>> -	unsigned			b_hnp_enable:1;
>> -	unsigned			a_hnp_support:1;
>> -	unsigned			a_alt_hnp_support:1;
>> -	unsigned			hnp_polling_support:1;
>> -	unsigned			host_request_flag:1;
>> -	unsigned			quirk_ep_out_aligned_size:1;
>> -	unsigned			quirk_altset_not_supp:1;
>> -	unsigned			quirk_stall_not_supp:1;
>> -	unsigned			quirk_zlp_not_supp:1;
>> -	unsigned			quirk_avoids_skb_reserve:1;
>> -	unsigned			is_selfpowered:1;
>> -	unsigned			deactivated:1;
>> -	unsigned			connected:1;
>> -	unsigned			lpm_capable:1;
>> -	unsigned			wakeup_capable:1;
>> -	unsigned			wakeup_armed:1;
>> +	union {
>> +		struct {
>> +			u32		sg_supported:1;
>> +			u32		is_otg:1;
>> +			u32		is_a_peripheral:1;
>> +			u32		b_hnp_enable:1;
>> +			u32		a_hnp_support:1;
>> +			u32		a_alt_hnp_support:1;
>> +			u32		hnp_polling_support:1;
>> +			u32		host_request_flag:1;
>> +			u32		quirk_ep_out_aligned_size:1;
>> +			u32		quirk_altset_not_supp:1;
>> +			u32		quirk_stall_not_supp:1;
>> +			u32		quirk_zlp_not_supp:1;
>> +			u32		quirk_avoids_skb_reserve:1;
>> +			u32		is_selfpowered:1;
>> +			u32		deactivated:1;
>> +			u32		connected:1;
>> +			u32		lpm_capable:1;
>> +			u32		wakeup_capable:1;
>> +			u32		wakeup_armed:1;
>> +		} __packed;
>> +		u32			dw1;
>> +#define		USB_GADGET_SG_SUPPORTED(n)			((n) & BIT(0))
>> +#define		USB_GADGET_IS_OTG(n)				((n) & BIT(1))
>> +#define		USB_GADGET_IS_A_PERIPHERAL(n)			((n) & BIT(2))
>> +#define		USB_GADGET_B_HNP_ENABLE(n)			((n) & BIT(3))
>> +#define		USB_GADGET_A_HNP_SUPPORT(n)			((n) & BIT(4))
>> +#define		USB_GADGET_A_ALT_HNP_SUPPORT(n)			((n) & BIT(5))
>> +#define		USB_GADGET_HNP_POLLING_SUPPORT(n)		((n) & BIT(6))
>> +#define		USB_GADGET_HOST_REQUEST_FLAG(n)			((n) & BIT(7))
>> +#define		USB_GADGET_QUIRK_EP_OUT_ALIGNED_SIZE(n)		((n) & BIT(8))
>> +#define		USB_GADGET_QUIRK_ALTSET_NOT_SUPP(n)		((n) & BIT(9))
>> +#define		USB_GADGET_QUIRK_STALL_NOT_SUPP(n)		((n) & BIT(10))
>> +#define		USB_GADGET_QUIRK_ZLP_NOT_SUPP(n)		((n) & BIT(11))
>> +#define		USB_GADGET_QUIRK_AVOIDS_SKB_RESERVE(n)		((n) & BIT(12))
>> +#define		USB_GADGET_IS_SELFPOWERED(n)			((n) & BIT(13))
>> +#define		USB_GADGET_DEACTIVATED(n)			((n) & BIT(14))
>> +#define		USB_GADGET_CONNECTED(n)				((n) & BIT(15))
>> +#define		USB_GADGET_LPM_CAPABLE(n)			((n) & BIT(16))
>> +#define		USB_GADGET_WAKEUP_CAPABLE(n)			((n) & BIT(17))
>> +#define		USB_GADGET_WAKEUP_ARMED(n)			((n) & BIT(18))
>> +	};
> Are you sure these #defines will work on all architectures?  As far as I
> know, the C compiler does not specify that bit fields in packed
> structures will be assigned starting from the low-order bit position.


thanks for review, will make it more generic for little/big endian and 
your concern.


>
> Alan Stern
