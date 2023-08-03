Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 553EE76E0D2
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 09:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjHCHGY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 03:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbjHCHFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 03:05:53 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC95530F9
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 00:04:49 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3735P8t6000710;
        Thu, 3 Aug 2023 07:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e1KLyNhs/xeeAxRfz2pA6WWJ3LxS5fz6H+L6dRwbDoY=;
 b=S6Ya0FxetW4rT/w8aEFV7w9aM9Uh0WdtQso37NvkJINLJB/TUWOAwJN04zjqdPWDiPZW
 7+8vXEJVYK4bpVWZBMJSW8NOXiTxzE6+xKfJmsDO0PXfstB+tCd3/Pt5lfCEpgjC41AO
 5B3i0upFHNxc7hO5tG+dGpYUtIIE3re8kDBs+DxTf4dYD/7IFIj2gCBd7ZHShLFNuAwK
 laGAlgFqKj5eOzdZV8Ac8dW4pRPlSKa3vwTmRNn+gq+NLYTsZxQ+Di+v4dY8L7Sp/VFj
 MWVrbs3tiLaaR+PZkPq7kPFZKiwS2OO48TDP33Kz7S7v42QpsqX29KWWzyGbGMza9s5a uw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s82wx8ec3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Aug 2023 07:04:45 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37374iTV002811
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 3 Aug 2023 07:04:44 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 3 Aug
 2023 00:04:43 -0700
Message-ID: <df5fe1b1-6759-af50-8569-38b0ba0403ae@quicinc.com>
Date:   Thu, 3 Aug 2023 15:04:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/7] usb: gadget: f_ecm: fix ecm_bitrate() for SuperSpeed
 and above
To:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <20230803051810.2974-1-quic_linyyuan@quicinc.com>
 <20230803051810.2974-2-quic_linyyuan@quicinc.com>
 <f89a3953-ec40-61a6-1061-1c5653de6c0b@suse.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <f89a3953-ec40-61a6-1061-1c5653de6c0b@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: paC--NCk_hkTh9aqF9j1I1TEPqAEXpow
X-Proofpoint-GUID: paC--NCk_hkTh9aqF9j1I1TEPqAEXpow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_04,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=467 phishscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308030062
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 8/3/2023 2:56 PM, Oliver Neukum wrote:
> Hi,
>
> On 03.08.23 07:18, Linyu Yuan wrote:
>> In function ecm_bitrate(), it is not good to report same speed as
>> super speed when gadget work at super speed plus.
>>
>> Change report speed same as commit 986499b1569a ("usb: gadget: f_ncm:
>> fix ncm_bitrate for SuperSpeed and above.").
>
> this is very well, but it raises two questions.
>
> 1. What is the relation to decreasing the usage of gadget_is_*
> This patch increases it. And why? Why not use raw speed?


i will move this change at end of series, maybe better.


>
> 2. Code like this is used in multiple gadget drivers.
> Couldn't this be unified into a macro or something?


sure, will try it.


>
>     Regards
>         Oliver
>
