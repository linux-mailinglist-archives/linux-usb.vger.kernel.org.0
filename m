Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021366BC5DE
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 06:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjCPFyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 01:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCPFyX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 01:54:23 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B26229E09
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 22:54:22 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G4RfWE027177;
        Thu, 16 Mar 2023 05:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FyFHKtNTUFinYA74/WmvkpsWnMd2C+m9rczcVfD8ZY8=;
 b=ku/dUn+WAwuRfoDMCSSfmWsXcf7EQanbwM3H06uCag+ORAJ7qvEXIkkBkAfBc2YNkEon
 My+GRbiccHVRK/XuyVVqwV9MEZJoUO42HQDLXlQwkiwZoqYTK7h46DZVZ8Rd4gm+AYKd
 pBPZAK+A1iHbKiEfIpU4nyyZ9KCk8SxNyTX0gf6cSS9RZZzCzWz+Ah2UuDB9x8OFRdVP
 ohG8vOvc2m9ApcDVRzYhaxbohVRsY3/6cs/0meFrhdert/4RKsWD6/da374KHfnBZ/Mr
 c4fTkMZu4ylHdJwps8aDRkH9zAXjTQYL3WPx45m4vO5TPl2EZ2R7MYdgrP5z27XtnNrK oQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpy9gtsy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 05:54:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G5sHwt023417
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Mar 2023 05:54:17 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 15 Mar
 2023 22:54:16 -0700
Message-ID: <82dcb6a5-426b-6647-7de1-209d12fe19e6@quicinc.com>
Date:   Thu, 16 Mar 2023 11:24:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Content-Language: en-US
To:     Jack Pham <quic_jackp@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        <linux-usb@vger.kernel.org>
References: <20230315124705.14723-1-quic_ugoswami@quicinc.com>
 <20230315175457.GB1742265@hu-jackp-lv.qualcomm.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20230315175457.GB1742265@hu-jackp-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1RMNSGI1l6e5TLXnpC9RMEg3G70hEVWr
X-Proofpoint-GUID: 1RMNSGI1l6e5TLXnpC9RMEg3G70hEVWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_04,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=772 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160049
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jack,

On 3/15/23 11:25 PM, Jack Pham wrote:
> Hi Udipto,
> 
> On Wed, Mar 15, 2023 at 06:17:05PM +0530, Udipto Goswami wrote:
>> When the dwc3 device is runtime suspended, various required clocks would
>> get disabled and it is not guaranteed that access to any registers would
>> work. Depending on the SoC glue, a register read could be as benign as
>> returning 0 or be fatal enough to hang the system.
>>
>> In order to prevent such scenarios of fatal errors, bail out of debugfs
>> function is dwc3 is suspended.
>>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>> v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.
>>
>>   drivers/usb/dwc3/debugfs.c | 50 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
>> index 850df0e6bcab..0e6cf7b89f8b 100644
>> --- a/drivers/usb/dwc3/debugfs.c
>> +++ b/drivers/usb/dwc3/debugfs.c
>> @@ -544,6 +544,11 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>>   	u32			reg;
>>   	u8			speed;
>>   
>> +	if (pm_runtime_suspended(dwc->dev)) {
>> +		pr_err("Invalid operation, DWC3 suspended!");
> 
> Use dev_err() please.
Sure, i'll update in the next version.
> 
> Thanks,
> Jack

Thanks,
-Udipto
