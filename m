Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7A16551DC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 16:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236481AbiLWPEY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 10:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbiLWPES (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 10:04:18 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8989426AA8
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 07:04:15 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BNDUn43019100;
        Fri, 23 Dec 2022 15:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RhgFa2fOzHF9LgHxOgiTiYhEYbpX3tqdEpPW2mmmzp4=;
 b=GVXjg85M7O2GPK4wHZ8eroCikcULprexDEr4ewq1swroF8wvothcAXEv5SYJ1xPOwALw
 AluTeFNTb5bwH+hi5tgdXJ1DLryvRCI+/1+Gx9sEho3ogEYm714qfHuKH8i5aOWYFwgS
 QgrjLdkFxXS6OuKW277FXpBLhmN4G7TpT5BXL5M5XVVjZFlbMmnZVy9TsWvdKRm45CQn
 xrdq2YwJb5AnkHtEdohbWh2bYJHTPKs4lHi39uy0sXDPOLExNJZIYubf3e8qDRWBkjbS
 AqH0mrneuFJZ26wQGsXXNqNVcATSR9BW0VRDbYXpW6cnQBxqP3MJglkRug/90IZ5foLq 2Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mn2pg9b2x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Dec 2022 15:04:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BNF4DNj024798
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Dec 2022 15:04:13 GMT
Received: from [10.216.17.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 23 Dec
 2022 07:04:12 -0800
Message-ID: <b116d857-572c-8fd5-d6d8-04ef3af7920c@quicinc.com>
Date:   Fri, 23 Dec 2022 20:34:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: SMMU Fault after setting RUN_STOP during gadget_pullup
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com>
 <Y6W6eF7lDSp/bssp@kroah.com>
From:   Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <Y6W6eF7lDSp/bssp@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CHsXOeRg2dw2GRHvAsxml6CJWeaABGEz
X-Proofpoint-GUID: CHsXOeRg2dw2GRHvAsxml6CJWeaABGEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-23_06,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=366 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212230125
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 12/23/2022 7:56 PM, Greg KH wrote:
> On Fri, Dec 23, 2022 at 07:26:49PM +0530, Krishna Kurapati PSSNV wrote:
>> Hi all,
>>
>> I am facing one SMMU fault with FAR=0x00 on current targets running on 5.10
>> and 5.15 with following signature:
> 
> What about 6.1?
> 
> thanks,
> 
> greg k-h

Hi Greg,

  Current mobile targets are running on 5.10 and 5.15 only till now. No 
target on 6.1 hasn't come up completely yet. So not sure if this issue 
is there on 6.1.

  I can try putting 6.1 on a minimal busybox ramdisk image on the mobile 
target and see if the issue comes up but seeing that the issue is random 
and seen only after long duration, I might take some time to get back 
with the results.

In the meantime, I would be happy to try out any ideas coming up from 
community in the meantime on current 5.15 build.

Regards,
Krishna,
