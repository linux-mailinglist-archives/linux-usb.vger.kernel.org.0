Return-Path: <linux-usb+bounces-1072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 791927B8191
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 16:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 2C5A1281651
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EE815EAF;
	Wed,  4 Oct 2023 14:00:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E5913AF9;
	Wed,  4 Oct 2023 14:00:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9E6C1;
	Wed,  4 Oct 2023 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696428047; x=1727964047;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ND6e8zppS+/0buxG1psBpDzddtzWLjPsHvkMnqKjyIs=;
  b=Wn2eAFRIHsJsYhhqLHmhuuhM9SxbbJRL6dXf8bdsYVnvVmTgSMHEzN1O
   cSQVCETWJt0xyohJH3Vjgea7XCjcdhZtmsSNkiQUWtZmj0kyxpzv2qYKx
   ODx6D76BqwdMQ52fHyrHr5DNUxqBhZXJQT1/VYu82Pjaq/wxIinD7TOD6
   Jv3Lo+Q5AMn7GMV1l/N276Ln7XfLsodSmxyAmAkOOh78W2DXx0sOTyWfK
   HdsZI3Bp5e6btSgdkW9iwcEjU+9FuQR437PIXOJRsVgDTF6NfFtWmPvjw
   AyTPrVLJNA/06GJKqYPnCIsxcmW6qqZYJv0VwhbxKFCPnxYMb7nqw3yIG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="382040999"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="382040999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 07:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="1082512034"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="1082512034"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 04 Oct 2023 07:00:41 -0700
Message-ID: <843897f1-3ce5-f8da-5f10-7d8a68849fd2@intel.com>
Date: Wed, 4 Oct 2023 17:02:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v7 01/33] xhci: add support to allocate several
 interrupters
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, gregkh@linuxfoundation.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-2-quic_wcheng@quicinc.com>
 <10ad0613-7e88-dbe8-c5a2-d535f8e9db03@linux.intel.com>
 <e3f3c8cd-6338-da08-d988-4d2ed68280e6@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <e3f3c8cd-6338-da08-d988-4d2ed68280e6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 2.10.2023 23.07, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 9/28/2023 3:31 AM, Mathias Nyman wrote:
>> On 22.9.2023 0.48, Wesley Cheng wrote:
>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>
>>> Modify the XHCI drivers to accommodate for handling multiple event rings in
>>> case there are multiple interrupters.  Add the required APIs so clients are
>>> able to allocate/request for an interrupter ring, and pass this information
>>> back to the client driver.  This allows for users to handle the resource
>>> accordingly, such as passing the event ring base address to an audio DSP.
>>> There is no actual support for multiple MSI/MSI-X vectors.
>>>
>>> Factoring out XHCI interrupter APIs and structures done by Wesley Cheng, in
>>> order to allow for USB class drivers to utilze them.
>>>
>>>   }
>>> +void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
>>> +{
>>> +    struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>>> +    unsigned int intr_num;
>>> +
>>> +    /* interrupter 0 is primary interrupter, don't touchit */
>>> +    if (!ir || !ir->intr_num || ir->intr_num >= xhci->max_interrupters) {
>>> +        xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
>>> +        return;
>>> +    }
>>> +
>>> +    /* fixme, should we check xhci->interrupter[intr_num] == ir */
>>> +    spin_lock(&xhci->lock);
>>
>> Needs to be spin_lock_irq() ir spin_lock_irqsave() as xhci->lock is used in interrupt handler.
>>
>>
>>> +    intr_num = ir->intr_num;
>>> +    xhci_free_interrupter(xhci, ir);
>>> +    xhci->interrupters[intr_num] = NULL;
>>> +    spin_unlock(&xhci->lock);
>>
>> likewise
>>
> 
> Let me check these again.  In general, I think I will use both the xhci->mutex and 
> xhci->lock where needed, because I believe we'd run into sleep while atomic issues
> while freeing the DMA memory.  Will rework this and submit in the next rev.
> 

Maybe we need to split xhci_free_interrupter() into separate remove and free functions

Did some work on this, and on the sideband api in general.

Code still has a lot of FIXMEs, and it's completely untested, but to avoid us
from doing duplicate work I pushed it to my feature_interrupters branch anyway

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters

Thanks
-Mathias


