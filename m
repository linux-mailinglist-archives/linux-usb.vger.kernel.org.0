Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9706879DF20
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 06:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237060AbjIMESA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Sep 2023 00:18:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233222AbjIMER7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Sep 2023 00:17:59 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1717C91
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 21:17:55 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D49nJ4028976;
        Wed, 13 Sep 2023 04:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/apiuEQFrqOyYWR1bt2P+x0Y8rFTtO+iHv1QdPw7kQM=;
 b=X/2e0VFs5sr6qGRBOKuLYPkYwSz2/hL6sFEgFnUYuLnG1bq2u17l7UNvWsQlBDWPRVVe
 aFOlXMmkByEl925jRCSJ0LxjjU2yChbtx/Svjuotjfvri1RNMjWemkuJkkUBQUM3EPJq
 yvLUgESnkTMssDtTvvQwEatEw3Tn3GzaHPgqR3Py+i0PY+tIsOcPLeFUtoXsfjVAK66Q
 5oNb7JKZ7R0v1HKx/OMZrT3EqN9mY+Fiw3pWD3qgn7a38lZZ/XIrqIIiM4t3UH+n2qZK
 dLejBV7FvhigwANV+F5Uz6dWzN5P9YjKJ80R+k6DLjjBdPqe66yykQyGA7pYMR7Ewc5/ ag== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y7wrpqx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 04:17:02 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38D4H1gr025110
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 04:17:01 GMT
Received: from [10.253.38.124] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 21:16:54 -0700
Message-ID: <77d3233b-3bc7-abac-f5f0-e6545aa98858@quicinc.com>
Date:   Wed, 13 Sep 2023 12:16:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct
 usb_gadget
Content-Language: en-US
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
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
 <20230912104455.7737-2-quic_linyyuan@quicinc.com>
 <fbc43e1a-8882-43d4-a1f3-f26c61decc0d@rowland.harvard.edu>
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <fbc43e1a-8882-43d4-a1f3-f26c61decc0d@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OYl5KyXlV6VX7lF8TYFW8c69nV6aBsw0
X-Proofpoint-ORIG-GUID: OYl5KyXlV6VX7lF8TYFW8c69nV6aBsw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=270 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309130034
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/12/2023 11:32 PM, Alan Stern wrote:
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
> This macro usage is a real mess.  Can't you find a better way to do it?
>
> For instance, in the code that parses the trace buffer, define a
> temporary usb_gadget structure and copy the dw1 field from the trace
> buffer to the temporary structure.  Then you can access the fields in
> that structure directly by their original names, with no macros.

do it same idea just move it outside of gadget.h ?


move other place can't be used for all possible trace files.


>
> Alan Stern
