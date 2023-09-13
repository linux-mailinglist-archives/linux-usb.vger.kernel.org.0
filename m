Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2EC79DEB6
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 05:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232700AbjIMDrC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 23:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbjIMDrB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 23:47:01 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389291719
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 20:46:57 -0700 (PDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D3cYvC003622;
        Wed, 13 Sep 2023 03:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vioX24uVe6qsssknvq1SLHksfTHUZcjjWxMIRZDaJus=;
 b=VkVVKBJUjEqWybARDcPSr7gXboh1jJyA9aRJm3iOx4gjJdcdNFZhcfy8+vW734Ieanp8
 ALTyEQ7Ruww+Nd8H5l+qjgJ+rooexzERX2nIwQ3sapY9QhTCah8T5JyMwU8XYOjhGwbA
 T6NvtIZ5SjSaZXuG1U6/Oaj+zPsEwy0WedvOWsTRlZlWD5D10CV0rEg9qsm+O9TfG0Xe
 pxnZWMoFK4o9Tghpc0/uXVuCojUNd4Ck4MMVZORQoCF/UJVXGpKugutfxtOzn8OZDGvH
 X3M1Mcyi2gK/qkZNp8P/+NJzuWwSK6cj7Cpmwogjrssddez7RdM0sbZ8Gy0g0OaxSl5v ag== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y8e0m5d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 03:46:24 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38D3kNok021030
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 03:46:23 GMT
Received: from [10.253.38.124] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 20:46:15 -0700
Message-ID: <d1c34d15-e598-5f86-bc86-cd5e656225c9@quicinc.com>
Date:   Wed, 13 Sep 2023 11:46:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct
 usb_gadget
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
        <linux-usb@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
 <20230912104455.7737-2-quic_linyyuan@quicinc.com>
 <2023091255-unsubtly-daisy-7426@gregkh>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <2023091255-unsubtly-daisy-7426@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0cB_zPyY-AJsEsGLVM4VbNUKq5-bFYA7
X-Proofpoint-GUID: 0cB_zPyY-AJsEsGLVM4VbNUKq5-bFYA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=247 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309130030
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/12/2023 7:09 PM, Greg Kroah-Hartman wrote:
> On Tue, Sep 12, 2023 at 06:44:46PM +0800, Linyu Yuan wrote:
>> Some UDC trace event will save usb gadget information, but it use one int
>> size buffer to save one bit information of usb gadget, so 19 int buffers
>> needed to save 19 bit fields which is not good.
>>
>> Add one anonymous union which have one u32 member 'dw1' to struct
>> 'usb_gadget', it inlclude all 19 bits and can be used by trace event
>> during fast assign stage to save more entries with same trace ring buffer
>> size.
>>
>> Also move all original 19 bit fields into one anonymous struct which
>> inside struct 'usb_gadget'.
>>
>> In order to allow trace event output stage access the bit from saved u32
>> 'dw1', add following macro,
>> define USB_GADGET_BITFIELD(n, name) \
>> 	({\
>> 	union {\
>> 		struct {\
>> 			u32	sg_supported:1;\
>> 			u32	is_otg:1;\
>> 			u32	is_a_peripheral:1;\
>> 			u32	b_hnp_enable:1;\
>> 			u32	a_hnp_support:1;\
>> 			u32	a_alt_hnp_support:1;\
>> 			u32	hnp_polling_support:1;\
>> 			u32	host_request_flag:1;\
>> 			u32	quirk_ep_out_aligned_size:1;\
>> 			u32	quirk_altset_not_supp:1;\
>> 			u32	quirk_stall_not_supp:1;\
>> 			u32	quirk_zlp_not_supp:1;\
>> 			u32	quirk_avoids_skb_reserve:1;\
>> 			u32	is_selfpowered:1;\
>> 			u32	deactivated:1;\
>> 			u32	connected:1;\
>> 			u32	lpm_capable:1;\
>> 			u32	wakeup_capable:1;\
>> 			u32	wakeup_armed:1;\
>> 		} __packed;\
>> 		u32		dw1;\
>> 	} __aligned(4) __g_u_##name;\
>> 	u32 __g_##name; \
>> 	BUILD_BUG_ON(sizeof(__g_u_##name) != 4);\
>> 	__g_u_##name.dw1 = (n); __g_##name = __g_u_##name.name;\
>> 	__g_##name; })
>>
>> define USB_GADGET_SG_SUPPORTED(n) USB_GADGET_BITFIELD((n), sg_supported)
>> ...
>> change to use this kind of macro for all related trace files later.
> I'm sorry, but that's horrible, and is NOT how you deal with bitfields
> in an endian-neutral way at all.
>
> There are much simpler, and easier, ways to do this properly.


do you mean define two sets of ordering bit field according BIG and 
LITTLE ENDIAN like below ?


#if defined(__LITTLE_ENDIAN_BITFIELD)

         struct {
             u32        sg_supported:1;

            u32        is_otg:1;

             ..

             u32        :13;

         } __packed;

#else

         struct {
             u32        :13;
             ..

             u32        is_otg:1;

             u32        sg_supported:1;

         } __packed;

#endif

but Alan Stern have one comment,   do it mean the bit position number is 
not expect and we can't use it ?

@Alan Stern ,  BIT(0), BIT(1) is not the member we expect ?

"

  As far as I
know, the C compiler does not specify that bit fields in packed
structures will be assigned starting from the low-order bit position

"



>
> But I'm still missing the huge _WHY_ any of this is needed.  You are not
> showing any real advantage at all that I have noticed.
>
> You need to step back and see if any of this is even anything that needs
> to change, and if you feel it does need to change, you need to be able
> to properly justify _why_ it needs to change.


indeed this is a small optimization.


I think i explain the benefit in previous version, when user not 
increase system trace event buffer space,

or in lower system trace event buffer space, it allow more trace event 
entries  to be saved.


in normal condition, the usb request is most frequent things after 
enumeration with useful operation,

so take below trace event class for explanation,


DECLARE_EVENT_CLASS(udc_log_req,
     TP_PROTO(struct usb_ep *ep, struct usb_request *req, int ret),
     TP_ARGS(ep, req, ret),
     TP_STRUCT__entry(
         __string(name, ep->name)
         __field(unsigned, length)
         __field(unsigned, actual)
         __field(unsigned, num_sgs)
         __field(unsigned, num_mapped_sgs)
         __field(unsigned, stream_id)
         __field(unsigned, no_interrupt)
         __field(unsigned, zero)
         __field(unsigned, short_not_ok)
         __field(int, status)
         __field(int, ret)
         __field(struct usb_request *, req)
     ),
     TP_fast_assign(
         __assign_str(name, ep->name);
         __entry->length = req->length;
         __entry->actual = req->actual;
         __entry->num_sgs = req->num_sgs;
         __entry->num_mapped_sgs = req->num_mapped_sgs;
         __entry->stream_id = req->stream_id;
         __entry->no_interrupt = req->no_interrupt;
         __entry->zero = req->zero;
         __entry->short_not_ok = req->short_not_ok;
         __entry->status = req->status;
         __entry->ret = ret;
         __entry->req = req;
     ),
     TP_printk("%s: req %p length %d/%d sgs %d/%d stream %d %s%s%s 
status %d --> %d",
         __get_str(name),__entry->req,  __entry->actual, __entry->length,
         __entry->num_mapped_sgs, __entry->num_sgs, __entry->stream_id,
         __entry->zero ? "Z" : "z",
         __entry->short_not_ok ? "S" : "s",
         __entry->no_interrupt ? "i" : "I",
         __entry->status, __entry->ret
     )
);


consider 32 bit ARCH,

without change, one trace entry size is:

4 (ring buffer event header ) + 8 (trace event header ) + 48 (trace 
class header) + 9 (ep string name) = 69 bytes.


with change,

4 (ring buffer event header ) + 8 (trace event header ) + 36 (trace 
class header)  = 48 bytes.



consider there is 1MB trace buffer space,

without change, it can save 15196 entries,

with change, it can save 21845 entries.




>
> good luck!
>
> greg k-h
