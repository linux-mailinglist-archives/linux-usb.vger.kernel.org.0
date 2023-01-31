Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4406D682419
	for <lists+linux-usb@lfdr.de>; Tue, 31 Jan 2023 06:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjAaFnI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Jan 2023 00:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjAaFnH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 00:43:07 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C298F144AF
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 21:43:05 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30V4s2Ig006740;
        Tue, 31 Jan 2023 05:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/KvznIfgq/M+xxb2TfXvCizpFC6Aen2UywCrN4T9AWI=;
 b=NjrfMzT0iWrhKncN2G0qYO6pSF1Fyd/jZLkzTzveWIy6CnXXm8eqjdbFMUy7ON/GrCc/
 3RlkmdZXNAMa+64pE08GzzE8iX63PIvD+K+j0Mmjc1tSO30949SXgVairg4pQdcIR2mH
 Ei8jv18OFbuDiPyjsJ0RwlDu0yy0NW6dLCH17QyKdTtnGV28F6sJrSFDcwpasSm5qcwZ
 2M2V5j4owpKN3ofTXPXLoZtKJsaTNhZRWiUfbALIaV/WbuB4sXDWWwsa2y33CkhcdA58
 wF5asWEbbdoYSn/NdG7kWJJHaJXGMhzeEtyN7eWeL7ZwxJai2pNgH79LbkOgBa/L+raa fw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nefmfsn1w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 Jan 2023 05:42:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30V5gtDr004305
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 Jan 2023 05:42:56 GMT
Received: from [10.206.24.224] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 30 Jan
 2023 21:42:52 -0800
Message-ID: <a1fcab7e-31c8-64de-1e1b-ef043fceeb90@quicinc.com>
Date:   Tue, 31 Jan 2023 11:12:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: gadget: configfs: Restrict symlink creation if UDC
 already binded
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Frank Li <frank.li@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        <linux-usb@vger.kernel.org>, <quic_kriskura@quicinc.com>
References: <20230125065740.12504-1-quic_ugoswami@quicinc.com>
 <Y9E/L6WcfTvljZok@kroah.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <Y9E/L6WcfTvljZok@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ALDkyAE0cAAFmvkEzBKkefVfTHmodvYh
X-Proofpoint-GUID: ALDkyAE0cAAFmvkEzBKkefVfTHmodvYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_02,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 mlxlogscore=858 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301310051
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 1/25/23 8:09 PM, Greg Kroah-Hartman wrote:
> On Wed, Jan 25, 2023 at 12:27:40PM +0530, Udipto Goswami wrote:
>> During enumeration or composition switch, if a userspace process
>> agnostic of the conventions of configs tries to create function symlink
>> seven after the UDC is bound to current config which is not correct.
>> Potentially it can create duplicates within the current config.
> 
> I'm sorry, but I can not parse this paragraph at all.
> 
> Exactly what is the problem here?  Is userspace doing something it
> shouldn't?  If so, fix userspace, right?
> 
>> Prevent this by adding a check if udc_name already exists then bail
>> out of cfg_link.
> 
> Why?  What will this help prevent if userspace already messed things up?
> 
> confused,

Apologies about this, had already pushed a v2 fixing the commit text[1]

It's not particularly any userspace process doing something wrong, but 
even in general usage if a end users is able to execute commands 
directly through command line accessing kernel file system and gets 
access to config/usb_gadget/g1/, one an easily create
a duplicate symlink for an existing function.

Step1:
ln -s X1 ffs.a
-->cfg_link
--> usb_get_function(ffs.a)
	->ffs_alloc
	
	CFG->FUNC_LIST: <ffs.a>
	C->FUNCTION: <empty>
	
Step2: 	
echo udc.name > /config/usb_gadget/g1/UDC
--> UDC_store
	->composite_bind
	->usb_add_function

	CFG->FUNC_LIST: <empty>
	C->FUNCTION: <ffs.a>	
	
Step3:
ln -s Y1 ffs.a
-->cfg_link
-->usb_get_function(ffs.a)
	->ffs_alloc

	CFG->FUNC_LIST: <ffs.a>
	C->FUNCTION: <ffs.a>	

both the lists corresponds to the same function instance ffs.a but the 
usb_function* pointer is different because in step 3 ffs_alloc has 
created a new reference to usb_function* for ffs.a and added it to cfg_list.

Step4:
Now a composition switch involving <ffs.b,ffs.a> is executed.

the composition switch will involve 3 things:
	1. unlinking the previous functions existing
	2. creating new symlinks
	3. writing UDC

However, the composition switch is generally taken care by a userspace 
process which creates the symlinks in its own nomenclature(X*) and 
removes only those. So it won't be able to remove Y1 which user had 
created by own.

Due to this the new symlinks cannot be created for ffs.a since the entry 
already exists in CFG->FUNC_LIST.
The state of the CFG->FUNC_LIST is as follows:
	CFG->FUNC_LIST: <ffs.a>

Since UDC is binded already, creating these dummy/incorrect symlinks, 
that can interfere with successive enumeration attempts can be avoided.

Cfg->func_list points to the list of functions that corresponds to that 
particular configuration. C->function points to the list of functions 
that are already bound to UDC and enumerated successfully.Ideally, when 
a particular configuration is already enumerated and bounded, meddling 
with cfg->func_list can create inconsistencies.

[1]: 
https://lore.kernel.org/all/20230125072138.21925-1-quic_ugoswami@quicinc.com/

Thanks,
-Udipto
