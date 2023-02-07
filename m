Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82C168D0B8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 08:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjBGHl2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 02:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBGHl1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 02:41:27 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC5A7AAE
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 23:41:26 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3177UG62012432;
        Tue, 7 Feb 2023 07:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9mi/NuZAxrFdJl39TkuwreCeVP7ZepvFBJpzoaeGHSs=;
 b=Khl4UhO1qWVag6RzIsopUEWSZFaTFEbp/4nMQrfWcfNO0AHztQpMZJL+ZP/O5FqOqmPA
 emjzZv6WxNeEZS1fXPGlK1uJ49CPaED4ANEUIW7VoADGD8tdvMg8fHo8faNHVgaWp2WG
 0HJIXN+pbpFVj3oH7sEL7V6oml1Qs18qHQL5l0y3SnvsWikgVpDQjjMCGbSsEmf59sXM
 mqPDFtvlbziVyHOPXXtlGCif8ImzqYkM1YkwSOOVOwLjZPCd5A25P1DeRELPtkslkwnf
 xLHFQsahdQ9thi5nOmzH0Q7A8UMT68WCt+LaixoW/IiUT9P7AN4u8N7FD2CW6hgAtlXk +Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkfes8df5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 07:41:24 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3177fNCW020530
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Feb 2023 07:41:23 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 23:41:20 -0800
Message-ID: <ba912bbb-278e-f23d-ac2b-88958f7da491@quicinc.com>
Date:   Tue, 7 Feb 2023 15:41:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] usb: roles: disable pm for role switch device
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
References: <1675425314-13857-1-git-send-email-quic_linyyuan@quicinc.com>
 <Y+DlHUUMX6bACxA6@kuha.fi.intel.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <Y+DlHUUMX6bACxA6@kuha.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I-oDnZJEJ549rQZdTFjeiVSjOZl-RiBy
X-Proofpoint-ORIG-GUID: I-oDnZJEJ549rQZdTFjeiVSjOZl-RiBy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 mlxlogscore=766 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070068
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/6/2023 7:31 PM, Heikki Krogerus wrote:
> On Fri, Feb 03, 2023 at 07:55:14PM +0800, Linyu Yuan wrote:
>> there is no PM operation for a role switch device,
>> call device_set_pm_not_required() in usb_role_switch_register() to disable.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


as discussion in Re: [PATCH] usb: typec: disable pm for typec class 
devices - Heikki Krogerus (kernel.org) 
<https://lore.kernel.org/linux-usb/Y+H+8Nt%2F5bgTBv4Y@kuha.fi.intel.com/> ,


please don't merge this change after we have final solution with Heikki.


>> ---
>> v2: remove cc stable
>>
>>   drivers/usb/roles/class.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
>> index eacb46e..b303c64 100644
>> --- a/drivers/usb/roles/class.c
>> +++ b/drivers/usb/roles/class.c
>> @@ -344,6 +344,7 @@ usb_role_switch_register(struct device *parent,
>>   	dev_set_drvdata(&sw->dev, desc->driver_data);
>>   	dev_set_name(&sw->dev, "%s-role-switch",
>>   		     desc->name ? desc->name : dev_name(parent));
>> +	device_set_pm_not_required(&sw->dev);
>>   
>>   	ret = device_register(&sw->dev);
>>   	if (ret) {
>> -- 
>> 2.7.4
