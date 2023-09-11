Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F8D79BADD
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350621AbjIKVju (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238176AbjIKNpR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 09:45:17 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5F2CDD
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 06:45:13 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BCh4Jj007910;
        Mon, 11 Sep 2023 13:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YGMP/mwkL4I3P1oJUTDwc9rxX98igKTuCa6H7UZaa60=;
 b=W9GjZraGCxZQLIxBzXH96l9KGW24rlpr2yeZJVGoq2oWYeLmnYN+O1PY3wlGOuxvP5aR
 fYXIR2gxfV81hFYZWIANHxN4mJAYIRqy5AR3X9be85UidXoshKxrbJ/sDIBO3x62GutR
 1pjTJ8inqeB7ArnfrdzmpwVVupU1A5x7FqCTsT+0QZlKAu8e+YZXNVl/gQm8e6HKEuUW
 Javdfziy8lPz+fw84HLEWPRzGlQsG0P+/CRDgVuhl3nUae0bYzQ80iU5uPFdhuhGOEXJ
 MD1+GXAU+Pjh/hu99kAgkwOralsyzpdiBDjJCDdzgqPKW5tdzWLqUsM6H5GNKVFwPMa+ gA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0h3dugjr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 13:44:31 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BDiU7D031243
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Sep 2023 13:44:30 GMT
Received: from [10.253.77.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 11 Sep
 2023 06:44:24 -0700
Message-ID: <a75f8d88-4731-9633-8407-b028eba9804b@quicinc.com>
Date:   Mon, 11 Sep 2023 21:44:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 00/11] usb: gadget: reduce usb gadget trace event
 buffer usage
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
        <linux-usb@vger.kernel.org>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
 <2023091141-outbound-turmoil-edda@gregkh>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <2023091141-outbound-turmoil-edda@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pwpw3-esqAGTy8QCkX8ByFG6MEJbghE3
X-Proofpoint-ORIG-GUID: pwpw3-esqAGTy8QCkX8ByFG6MEJbghE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxlogscore=278 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309110125
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/11/2023 9:32 PM, Greg Kroah-Hartman wrote:
> On Mon, Sep 11, 2023 at 07:24:35PM +0800, Linyu Yuan wrote:
>> some trace event use an interger to to save a bit field info of gadget,
>> also some trace save endpoint name in string forat, it all can be
>> chagned to other way at trace event store phase.
>>
>> bit field can be replace with a union interger member which include
>> multiple bit fields.
>>
>> ep name stringe can be replace to a interger which contaion number
>> and dir info.
> Ok, but how much memory did you actually save here?  Is the memory saved
> only if tracing is enbaled, or it is always?  Is there a speed penality
> for these changes or is it the same?

yes, it is save trace ring buffer only when tracing enabled, as save 
less data, speed is higher.


it is help when enable trace for a long period.


for a single trace entry, take struct usb_gadget as example, at worst 
case, it save (19 dword  - 1 dword) / 19dword = 94% buffer.


for ep name, it only need 4 bytes/  (4bytes + 9bytes ) = 30%.


>
> You are doing a lot of code reorginization without any real explaination
> of why this is needed, nor proof about it.
>
> thanks,
>
> greg k-h
