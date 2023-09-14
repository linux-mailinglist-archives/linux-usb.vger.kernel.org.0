Return-Path: <linux-usb+bounces-16-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532A79F629
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 03:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFCACB20BFF
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 01:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C7738B;
	Thu, 14 Sep 2023 01:09:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4585837C
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 01:09:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A610D170F
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 18:09:04 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E104MX029920;
	Thu, 14 Sep 2023 01:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4rxo5hnTbCfmzMT2KC9ZOi0tBijj7gQP19q7KKFgz24=;
 b=TeVgS7u/k1cBso7xNSnW90SbbJO0AqmSuQcIAoTq/s8GkNgg+nfKkGp4jYSDsB1q8WWa
 eoCazu7u9AHra43dHjEmp/l8i8q3JyEp9WQomuzBs4HtLhEZ6dJtX4J9wG0rF5cCnPep
 u6jcuFschl9nB9sl/LrLetGAfwtfpcfzLgUT9iGurJSXJzCWhn+KSuX8uPrTzp7ML5gm
 4tmSjuBPen6O2VfDla7SMQl7M4msPDY7E75a09ES8+55/NRpJWuU6zEvjtZVTc8SUKUl
 FBw4XOB5NQGUqpK5oJYlk4jj5MzQ5tmceQ3suAasUHbykjxQJ2FxT6fMiSoyiBS2cVyb Yg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t3h0dgwh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 01:08:14 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38E18DuJ026546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 01:08:14 GMT
Received: from [10.253.74.98] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 13 Sep
 2023 18:08:07 -0700
Message-ID: <be818ccf-96fd-2fa0-8f95-1f49e3aa2dfc@quicinc.com>
Date: Thu, 14 Sep 2023 09:08:04 +0800
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
Content-Language: en-US
From: Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ef99b328-926c-4696-83bf-9ccd6a38984e@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7pDkqppLK14MAfYpLXwiBEuVWppuHumM
X-Proofpoint-GUID: 7pDkqppLK14MAfYpLXwiBEuVWppuHumM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_19,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=253 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140008


On 9/14/2023 12:02 AM, Alan Stern wrote:
> On Wed, Sep 13, 2023 at 11:46:12AM +0800, Linyu Yuan wrote:
>> but Alan Stern have one comment,   do it mean the bit position number is not
>> expect and we can't use it ?
>>
>> @Alan Stern ,  BIT(0), BIT(1) is not the member we expect ?
> They might not be.  If you can avoid making this assumption, you should.


i don't know if it is true or not, seem some driver expect there is no 
hole for this kind of bit field definition.


>
>>> This macro usage is a real mess.  Can't you find a better way to do it?
>>>
>>> For instance, in the code that parses the trace buffer, define a
>>> temporary usb_gadget structure and copy the dw1 field from the trace
>>> buffer to the temporary structure.  Then you can access the fields in
>>> that structure directly by their original names, with no macros.
>> do it same idea just move it outside of gadget.h ?
> Keep the anonymous union in gadget.h, but get rid of the macros.


do you expect below ?


--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -357,6 +357,7 @@ struct usb_gadget_ops {
   * @in_epnum: last used in ep number
   * @mA: last set mA value
   * @otg_caps: OTG capabilities of this gadget.
+ * @dw1: trace event purpose
   * @sg_supported: true if we can handle scatter-gather
   * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
   *     gadget driver must provide a USB OTG descriptor.
@@ -432,30 +433,88 @@ struct usb_gadget {
         unsigned                        mA;
         struct usb_otg_caps             *otg_caps;

-       unsigned                        sg_supported:1;
-       unsigned                        is_otg:1;
-       unsigned                        is_a_peripheral:1;
-       unsigned                        b_hnp_enable:1;
-       unsigned                        a_hnp_support:1;
-       unsigned                        a_alt_hnp_support:1;
-       unsigned                        hnp_polling_support:1;
-       unsigned                        host_request_flag:1;
-       unsigned quirk_ep_out_aligned_size:1;
-       unsigned                        quirk_altset_not_supp:1;
-       unsigned                        quirk_stall_not_supp:1;
-       unsigned                        quirk_zlp_not_supp:1;
-       unsigned quirk_avoids_skb_reserve:1;
-       unsigned                        is_selfpowered:1;
-       unsigned                        deactivated:1;
-       unsigned                        connected:1;
-       unsigned                        lpm_capable:1;
-       unsigned                        wakeup_capable:1;
-       unsigned                        wakeup_armed:1;
+       union {
+               struct {
+                       unsigned        sg_supported:1;
+                       unsigned        is_otg:1;
+                       unsigned        is_a_peripheral:1;
+                       unsigned        b_hnp_enable:1;
+                       unsigned        a_hnp_support:1;
+                       unsigned        a_alt_hnp_support:1;
+                       unsigned        hnp_polling_support:1;
+                       unsigned        host_request_flag:1;
+                       unsigned quirk_ep_out_aligned_size:1;
+                       unsigned        quirk_altset_not_supp:1;
+                       unsigned        quirk_stall_not_supp:1;
+                       unsigned        quirk_zlp_not_supp:1;
+                       unsigned quirk_avoids_skb_reserve:1;
+                       unsigned        is_selfpowered:1;
+                       unsigned        deactivated:1;
+                       unsigned        connected:1;
+                       unsigned        lpm_capable:1;
+                       unsigned        wakeup_capable:1;
+                       unsigned        wakeup_armed:1;
+               } __packed;
+
+               u32                     dw1;
+       } __aligned(4);
         int                             irq;
         int                             id_number;
  };
  #define work_to_gadget(w)      (container_of((w), struct usb_gadget, 
work))

+#define USB_GADGET_BITFIELD(field)                             \
+static inline u32 usb_gadget_bit_##field(u32 dw1)              \
+{                                                              \
+       union {                                                 \
+               struct {                                        \
+                       u32     sg_supported:1;                 \
+                       u32     is_otg:1;                       \
+                       u32     is_a_peripheral:1;              \
+                       u32     b_hnp_enable:1;                 \
+                       u32     a_hnp_support:1;                \
+                       u32     a_alt_hnp_support:1;            \
+                       u32     hnp_polling_support:1;          \
+                       u32     host_request_flag:1;            \
+                       u32     quirk_ep_out_aligned_size:1;    \
+                       u32     quirk_altset_not_supp:1;        \
+                       u32     quirk_stall_not_supp:1;         \
+                       u32     quirk_zlp_not_supp:1;           \
+                       u32     quirk_avoids_skb_reserve:1;     \
+                       u32     is_selfpowered:1;               \
+                       u32     deactivated:1;                  \
+                       u32     connected:1;                    \
+                       u32     lpm_capable:1;                  \
+                       u32     wakeup_capable:1;               \
+                       u32     wakeup_armed:1;                 \
+               } __packed;                                     \
+               u32             dw1;                            \
+       } __aligned(4) u;                                       \
+       BUILD_BUG_ON(sizeof(u) != 4);                           \
+       u.dw1 = dw1;                                            \
+       return u.field;                                         \
+}
+
+USB_GADGET_BITFIELD(sg_supported)
+USB_GADGET_BITFIELD(is_otg)
+USB_GADGET_BITFIELD(is_a_peripheral)
+USB_GADGET_BITFIELD(b_hnp_enable)
+USB_GADGET_BITFIELD(a_hnp_support)
+USB_GADGET_BITFIELD(a_alt_hnp_support)
+USB_GADGET_BITFIELD(hnp_polling_support)
+USB_GADGET_BITFIELD(host_request_flag)
+USB_GADGET_BITFIELD(quirk_ep_out_aligned_size)
+USB_GADGET_BITFIELD(quirk_altset_not_supp)
+USB_GADGET_BITFIELD(quirk_stall_not_supp)
+USB_GADGET_BITFIELD(quirk_zlp_not_supp)
+USB_GADGET_BITFIELD(quirk_avoids_skb_reserve)
+USB_GADGET_BITFIELD(is_selfpowered)
+USB_GADGET_BITFIELD(deactivated)
+USB_GADGET_BITFIELD(connected)
+USB_GADGET_BITFIELD(lpm_capable)
+USB_GADGET_BITFIELD(wakeup_capable)
+USB_GADGET_BITFIELD(wakeup_armed)
+



>
> Alan Stern

