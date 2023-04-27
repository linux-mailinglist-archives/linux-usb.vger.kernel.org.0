Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C03F26F02E2
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 11:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243003AbjD0JAr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 05:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242688AbjD0JAq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 05:00:46 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13119422A
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 02:00:43 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R6rEMR027482;
        Thu, 27 Apr 2023 09:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dzstPvE2/UDkbDzwlflQST94z9fnD3nwK/LoCvnyEAw=;
 b=XQW2PNel6ehQ/onlUEFLRQJc3ZTBsEgVqkmfTIvvKl2D1lpGwRYhXdkm/AAMB/fc83je
 lAFOiqWTvZ8nQ5UXSge1GO1oMWtg3asxk0AJKCr3VggXuXFbciIb5g9MEEhKRfXco+9Q
 uURuGGI5xv9DoN6+ExeLAop5qkjJ4m9gnKzMWDA8urO4mcSWGha+EU/4Oz1/i+yuA9K4
 4Annxkxfw1eWiN/c10MABT9CU5ud/07v2/MMdbZRdndLHmCs2XkV31+aRz2YXs3pbSSd
 d/TIoAdnCCxX4XOY4tUu/PErN17SfPgukTstXuFXinskFXg6bcDDkf+On5+EcP7EzgnY wA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7m4y89at-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Apr 2023 09:00:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33R90Z8x004461
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Apr 2023 09:00:35 GMT
Received: from [10.217.217.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 27 Apr
 2023 02:00:32 -0700
Message-ID: <37200f4e-51cf-57e9-2d62-a80f624a0cdf@quicinc.com>
Date:   Thu, 27 Apr 2023 14:30:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230420051705.27801-1-quic_ugoswami@quicinc.com>
 <20230426011629.b5pyes5vn77szcxi@synopsys.com>
Content-Language: en-US
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20230426011629.b5pyes5vn77szcxi@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z9Km1F_cyfUg0d9VLYeo9dnLa2icqWTq
X-Proofpoint-ORIG-GUID: z9Km1F_cyfUg0d9VLYeo9dnLa2icqWTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_06,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270078
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 4/26/23 6:46 AM, Thinh Nguyen wrote:
> On Thu, Apr 20, 2023, Udipto Goswami wrote:
>> When the dwc3 device is runtime suspended, various required clocks would
>> get disabled and it is not guaranteed that access to any registers would
>> work. Depending on the SoC glue, a register read could be as benign as
>> returning 0 or be fatal enough to hang the system.
>>
>> In order to prevent such scenarios of fatal errors, make sure to resume
>> dwc3 then allow the function to proceed.
>>
>> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
>> ---
>>
>> v6: Added changes to handle get_dync failure appropriately.
>> v5: Reworked the patch to resume dwc3 while accessing the registers.
>> v4: Introduced pm_runtime_get_if_in_use in order to make sure dwc3 isn't
>> 	suspended while accessing the registers.
>> v3: Replace pr_err to dev_err.
>> v2: Replaced return 0 with -EINVAL & seq_puts with pr_err.
>>
>>   drivers/usb/dwc3/debugfs.c | 124 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 124 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
>> index e4a2560b9dc0..b08604a73e69 100644
>> --- a/drivers/usb/dwc3/debugfs.c
>> +++ b/drivers/usb/dwc3/debugfs.c
>> @@ -332,6 +332,13 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
>>   	unsigned int		current_mode;
>>   	unsigned long		flags;
>>   	u32			reg;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
> 
> Should we use pm_runtime_put_sync
> 
>> +		return -EINVAL;
> 
> Why not return "ret"?
Hi Thinh,
Sure will fix it in next version.
> 
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
>> @@ -349,6 +356,7 @@ static int dwc3_lsp_show(struct seq_file *s, void *unused)
>>   		break;
>>   	}
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>> +	pm_runtime_put(dwc->dev);
>>   
>>   	return 0;
>>   }
>> @@ -395,6 +403,13 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = s->private;
>>   	unsigned long		flags;
>>   	u32			reg;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	reg = dwc3_readl(dwc->regs, DWC3_GCTL);
>> @@ -414,6 +429,7 @@ static int dwc3_mode_show(struct seq_file *s, void *unused)
>>   		seq_printf(s, "UNKNOWN %08x\n", DWC3_GCTL_PRTCAP(reg));
>>   	}
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -463,6 +479,13 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = s->private;
>>   	unsigned long		flags;
>>   	u32			reg;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
>> @@ -493,6 +516,7 @@ static int dwc3_testmode_show(struct seq_file *s, void *unused)
>>   		seq_printf(s, "UNKNOWN %d\n", reg);
>>   	}
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -509,6 +533,7 @@ static ssize_t dwc3_testmode_write(struct file *file,
>>   	unsigned long		flags;
>>   	u32			testmode = 0;
>>   	char			buf[32];
>> +	int			ret;
>>   
>>   	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
>>   		return -EFAULT;
>> @@ -526,10 +551,17 @@ static ssize_t dwc3_testmode_write(struct file *file,
>>   	else
>>   		testmode = 0;
>>   
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>> +
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	dwc3_gadget_set_test_mode(dwc, testmode);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return count;
>>   }
>>   
>> @@ -548,12 +580,20 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>>   	enum dwc3_link_state	state;
>>   	u32			reg;
>>   	u8			speed;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
>>   	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
>>   		seq_puts(s, "Not available\n");
>>   		spin_unlock_irqrestore(&dwc->lock, flags);
>> +		pm_runtime_put(dwc->dev);
>>   		return 0;
>>   	}
>>   
>> @@ -566,6 +606,7 @@ static int dwc3_link_state_show(struct seq_file *s, void *unused)
>>   		   dwc3_gadget_hs_link_string(state));
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -584,6 +625,7 @@ static ssize_t dwc3_link_state_write(struct file *file,
>>   	char			buf[32];
>>   	u32			reg;
>>   	u8			speed;
>> +	int			ret;
>>   
>>   	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
>>   		return -EFAULT;
>> @@ -603,10 +645,17 @@ static ssize_t dwc3_link_state_write(struct file *file,
>>   	else
>>   		return -EINVAL;
>>   
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>> +
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
>>   	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
>>   		spin_unlock_irqrestore(&dwc->lock, flags);
>> +		pm_runtime_put(dwc->dev);
>>   		return -EINVAL;
>>   	}
>>   
>> @@ -616,12 +665,14 @@ static ssize_t dwc3_link_state_write(struct file *file,
>>   	if (speed < DWC3_DSTS_SUPERSPEED &&
>>   	    state != DWC3_LINK_STATE_RECOV) {
>>   		spin_unlock_irqrestore(&dwc->lock, flags);
>> +		pm_runtime_put(dwc->dev);
>>   		return -EINVAL;
>>   	}
>>   
>>   	dwc3_gadget_set_link_state(dwc, state);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return count;
>>   }
>>   
>> @@ -645,6 +696,13 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
>>   	unsigned long		flags;
>>   	u32			mdwidth;
>>   	u32			val;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	val = dwc3_core_fifo_space(dep, DWC3_TXFIFO);
>> @@ -657,6 +715,7 @@ static int dwc3_tx_fifo_size_show(struct seq_file *s, void *unused)
>>   	seq_printf(s, "%u\n", val);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -667,6 +726,13 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
>>   	unsigned long		flags;
>>   	u32			mdwidth;
>>   	u32			val;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
>> @@ -679,6 +745,7 @@ static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
>>   	seq_printf(s, "%u\n", val);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -688,12 +755,20 @@ static int dwc3_tx_request_queue_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = dep->dwc;
>>   	unsigned long		flags;
>>   	u32			val;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	val = dwc3_core_fifo_space(dep, DWC3_TXREQQ);
>>   	seq_printf(s, "%u\n", val);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -703,12 +778,20 @@ static int dwc3_rx_request_queue_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = dep->dwc;
>>   	unsigned long		flags;
>>   	u32			val;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	val = dwc3_core_fifo_space(dep, DWC3_RXREQQ);
>>   	seq_printf(s, "%u\n", val);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -718,12 +801,20 @@ static int dwc3_rx_info_queue_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = dep->dwc;
>>   	unsigned long		flags;
>>   	u32			val;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	val = dwc3_core_fifo_space(dep, DWC3_RXINFOQ);
>>   	seq_printf(s, "%u\n", val);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -733,12 +824,20 @@ static int dwc3_descriptor_fetch_queue_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = dep->dwc;
>>   	unsigned long		flags;
>>   	u32			val;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	val = dwc3_core_fifo_space(dep, DWC3_DESCFETCHQ);
>>   	seq_printf(s, "%u\n", val);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -748,12 +847,20 @@ static int dwc3_event_queue_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = dep->dwc;
>>   	unsigned long		flags;
>>   	u32			val;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	val = dwc3_core_fifo_space(dep, DWC3_EVENTQ);
>>   	seq_printf(s, "%u\n", val);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -798,6 +905,13 @@ static int dwc3_trb_ring_show(struct seq_file *s, void *unused)
>>   	struct dwc3		*dwc = dep->dwc;
>>   	unsigned long		flags;
>>   	int			i;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	if (dep->number <= 1) {
>> @@ -827,6 +941,7 @@ static int dwc3_trb_ring_show(struct seq_file *s, void *unused)
>>   out:
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -839,6 +954,13 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
>>   	u32			lower_32_bits;
>>   	u32			upper_32_bits;
>>   	u32			reg;
>> +	int			ret;
>> +
>> +	ret = pm_runtime_get_sync(dwc->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put(dwc->dev);
>> +		return -EINVAL;
>> +	}
>>   
>>   	spin_lock_irqsave(&dwc->lock, flags);
>>   	reg = DWC3_GDBGLSPMUX_EPSELECT(dep->number);
>> @@ -851,6 +973,7 @@ static int dwc3_ep_info_register_show(struct seq_file *s, void *unused)
>>   	seq_printf(s, "0x%016llx\n", ep_info);
>>   	spin_unlock_irqrestore(&dwc->lock, flags);
>>   
>> +	pm_runtime_put(dwc->dev);
>>   	return 0;
>>   }
>>   
>> @@ -910,6 +1033,7 @@ void dwc3_debugfs_init(struct dwc3 *dwc)
>>   	dwc->regset->regs = dwc3_regs;
>>   	dwc->regset->nregs = ARRAY_SIZE(dwc3_regs);
>>   	dwc->regset->base = dwc->regs - DWC3_GLOBALS_REGS_START;
>> +	dwc->regset->dev = dwc->dev;
>>   
>>   	root = debugfs_create_dir(dev_name(dwc->dev), usb_debug_root);
>>   	dwc->debug_root = root;
>> -- 
>> 2.17.1
>>
> 
> Thanks,
> Thinh

Thanks,
-Udipto
