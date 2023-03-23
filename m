Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06EBD6C5C6E
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 03:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjCWCAW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 22:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjCWCAV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 22:00:21 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EC82313A
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 19:00:20 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N1oNDG007264;
        Thu, 23 Mar 2023 02:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=t77V1V0LE8tXQKD4L0aqu9hEVVUZvxRmdFDIqrT7mdY=;
 b=C3o2JWEtWidKQQG0crDF0oaBuoH2nDJQwIVDLkejCvkgddYmstagDX0yWS9szuTOsSi6
 B+chGaYEHSC3bWStCw8BC7xrxqxH638d3l20efuFMhLgDo4mkDpYqlej0++68uAUcwFi
 E4nOzaYpeoNBaRkT5Y/8KdH7VkP/Mp/EvFQp45SPq8ArE0UbAV+qUmN4Pjwd3ObIuGTE
 JO40zDbIB1NWrazZvTZ9Zu2eD0mRtO+5ofJVY7cKH9RrCxTn51bP2IQ31mqpC06Sc945
 JOVp3uC9m04qFwbFWACpjiDOyTAU4B8Ta3+AG0dGd1CnKKKgQp5CpxjdNQEP6VCVoptX 3A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pg42ksau9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 02:00:18 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32N20H2D014300
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 02:00:17 GMT
Received: from [10.239.154.244] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 19:00:16 -0700
Message-ID: <792b3dc5-6f6d-eb78-e3ba-71b1d5f22b95@quicinc.com>
Date:   Thu, 23 Mar 2023 10:00:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] usb: gadget: f_fs: show device name in debug message
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
 <ZBrwsu0gliC6pquN@kroah.com>
Content-Language: en-US
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
In-Reply-To: <ZBrwsu0gliC6pquN@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GkvM5FefHXxjDiBL43jGJI6IBwLZR-J-
X-Proofpoint-ORIG-GUID: GkvM5FefHXxjDiBL43jGJI6IBwLZR-J-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=654 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230013
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 3/22/2023 8:12 PM, Greg Kroah-Hartman wrote:
> On Wed, Mar 22, 2023 at 06:36:09PM +0800, Linyu Yuan wrote:
>> when multiple instances in use, the debug message is hard to understand
>> as there is no instance name show.
>>
>> this change will show each instance name for all most all debug messsage.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>>   drivers/usb/gadget/function/f_fs.c | 406 +++++++++++++++++++------------------
> That's a lot of churn just for debugging messages.
>
> But that's good, the debugging code here needs lots of work, so let's do
> this properly!


thanks for review it.😅


>
>>   drivers/usb/gadget/function/u_fs.h |   2 +
>>   2 files changed, 215 insertions(+), 193 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index a277c70..5abeb18 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -231,13 +231,13 @@ struct ffs_io_data {
>>   };
>>   
>>   struct ffs_desc_helper {
>> -	struct ffs_data *ffs;
>> -	unsigned interfaces_count;
>> -	unsigned eps_count;
>> +	unsigned int interfaces_count;
>> +	unsigned int eps_count;
> Why did you change interfaces_count and eps_count for a debugging
> message change?
>
> This doesn't make me feel good about this...
>
>>   };
>>   
>>   static int  __must_check ffs_epfiles_create(struct ffs_data *ffs);
>> -static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count);
>> +static void ffs_epfiles_destroy(struct ffs_data *ffs, struct ffs_epfile *epfiles,
>> +				unsigned int count);
>>   
>>   static struct dentry *
>>   ffs_sb_create_file(struct super_block *sb, const char *name, void *data,
>> @@ -258,9 +258,9 @@ static void ffs_closed(struct ffs_data *ffs);
>>   
>>   /* Misc helper functions ****************************************************/
>>   
>> -static int ffs_mutex_lock(struct mutex *mutex, unsigned nonblock)
>> +static int ffs_mutex_lock(struct mutex *mutex, unsigned int nonblock)
>>   	__attribute__((warn_unused_result, nonnull));
>> -static char *ffs_prepare_buffer(const char __user *buf, size_t len)
>> +static char *ffs_prepare_buffer(struct ffs_data *ffs, const char __user *buf, size_t len)
>>   	__attribute__((warn_unused_result, nonnull));
>>   
>>   
>> @@ -318,12 +318,12 @@ static int __ffs_ep0_queue_wait(struct ffs_data *ffs, char *data, size_t len)
>>   static int __ffs_ep0_stall(struct ffs_data *ffs)
>>   {
>>   	if (ffs->ev.can_stall) {
>> -		pr_vdebug("ep0 stall\n");
>> +		pr_vdebug("%s: ep0 stall\n", ffs->dev_name);
> Please don't try to create a custom version of the widely used dev_dbg()
> call like you are doing here.  Just use dev_dbg().  Why can't you do
> that?


we can't use dev_dbg in this file, as actually there is not a real device.

so if it need to keep debug message when VERBOSE_DEBUG enable,
it should keep this pr_vdebug(), accept ?


>
>>   		usb_ep_set_halt(ffs->gadget->ep0);
>>   		ffs->setup_state = FFS_NO_SETUP;
>>   		return -EL2HLT;
>>   	} else {
>> -		pr_debug("bogus ep0 stall!\n");
>> +		pr_debug("%s: bogus ep0 stall!\n", ffs->dev_name);
>>   		return -ESRCH;
>>   	}
>>   }
>> @@ -335,7 +335,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
>>   	ssize_t ret;
>>   	char *data;
>>   
>> -	ENTER();
>> +	ENTER_FFS();
> Why change the macro name if no options are changed?
>
> And why is this macro needed at all anymore?  You should just use
> ftrace, and these macros should be deleted as they are nothing that we
> would ever accept in new submissions.
>
> So how about making this a patch series, one that removed the unneeded
> tracing macros like ENTER(), and then one that uses the proper dev_dbg()
> functions and then, if you really want it, one that fixes up the use of
> "unsigned" which has nothing to do with debug messages.


thanks,  will try change as a patch series.



>
> thanks,
>
> greg k-h
