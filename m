Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4D86D601B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 14:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbjDDMU3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 08:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbjDDMTd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 08:19:33 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A1B40D2
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 05:16:47 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334C6LpO020761;
        Tue, 4 Apr 2023 12:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HCic5vM62YC4+HMTlCmYwfn17cH3p7lj3im/sT9gAto=;
 b=XrzYNNU9v2AII8UHUdZnlfnEllnIWTZ+FIfNSEPSddcEyTIVrSMsSzUbILzJK4yl4/VQ
 0Snk+RT0WpBL+sXTaoXhw8CTtOxHP1mD+x3AsAcor9VyPgNS+vOcbFXmq8YtWJ/Ro62H
 7kNQ5opCeAmgBWo0u/ENpDI/yI/z0nt3N7jnBMMWQ1Ran9MUj3kdbv4q9hFHRA7+XyS7
 Ymi+gDj1avwBudH/O73vNWwOrWzeblJy95GOYvOY8PBwaETy0SB+y4YPLU7ijlqN0oOQ
 Je7b7Ee0Bw4riqFAdfBRQbIuBRikWy3T/mZDLvzXqhapStRgna/g3gIRUP7ReJA+lx5k 6g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pqy6233r6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Apr 2023 12:16:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 334CGKHm029688
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 4 Apr 2023 12:16:20 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 4 Apr 2023
 05:16:17 -0700
Message-ID: <8a209f5f-8aa1-35b1-20ed-2f0b95f960a7@quicinc.com>
Date:   Tue, 4 Apr 2023 17:46:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        "Jack Pham" <quic_jackp@quicinc.com>, <linux-usb@vger.kernel.org>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zARExslEXn_ntEyUbdizRWjlSvYAVay7
X-Proofpoint-ORIG-GUID: zARExslEXn_ntEyUbdizRWjlSvYAVay7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_04,2023-04-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=977 phishscore=0 mlxscore=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304040114
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 4/4/23 5:13 PM, Johan Hovold wrote:
> On Tue, Apr 04, 2023 at 01:09:19PM +0200, Oliver Neukum wrote:
>> On 04.04.23 13:05, Johan Hovold wrote:
>>
>>> This is backwards. If you need the device to be active to access these
>>> registers then you should resume it unconditionally instead of failing.
> 
>> usually you would be right. But this is debugfs. It is intended to observe
>> the system in the state it is actually in. If by the act of observation you
>> wake up the device, you change the experiment.
> 
> I admittedly didn't look to closely at what this particular debugfs
> interface is used for, but I generally do not agree with that reasoning.
> 
> The device is being used; by the driver and ultimately by a user telling
> the driver to do something on their behalf. The fact that the user is
> initiating an action through an interface which intended for debugging
> should not matter (and the user always has the option to check the
> runtime pm state before initiating the action if that matters at all) >
> Johan

Hi Johan,

for instance, lets say user is trying to dump the value of link_state 
register through dwc3_link_state_show, wouldn't a pm_runtime_get would 
change the link_state? or I'm assuming it wrong?

Thanks,
-Udipto
