Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBD94C267F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Feb 2022 09:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbiBXIoq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Feb 2022 03:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbiBXIop (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Feb 2022 03:44:45 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D8591363
        for <linux-usb@vger.kernel.org>; Thu, 24 Feb 2022 00:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645692256; x=1677228256;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pCxpqs26PMJV1XHfwQRaOIzDXjr+IHhYlkWLI2bMfHE=;
  b=Z/rvBWmN0C2fzlOfJWXkgQacXaMeGA5UF7UlVMOW+9z/EBZuLkvGvP0x
   Kxmtbg3OliSLQHwcULb3VLaQKU9GTGofUYNW/bVg5DjNLRkkrfwblxfyg
   xzN/qy6J7GBU8Hhx0VBdSmS4+1Vn/O8Nmra4yhqUjPCwKyGQfttor2Slb
   k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 24 Feb 2022 00:44:16 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 00:44:15 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 00:44:09 -0800
Received: from [10.216.4.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 24 Feb
 2022 00:44:07 -0800
Message-ID: <0edc0822-d75b-238a-16d4-d828710c1b60@quicinc.com>
Date:   Thu, 24 Feb 2022 14:14:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFT PATCH] xhci: make xhci_handshake timeout for xhci_reset()
 adjustable
Content-Language: en-US
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     <s.shtylyov@omp.ru>, <linux-usb@vger.kernel.org>
References: <20220217135643.1321889-1-mathias.nyman@linux.intel.com>
 <20220218094133.GA28120@hu-pkondeti-hyd.qualcomm.com>
From:   Udipto Goswami <quic_ugoswami@quicinc.com>
In-Reply-To: <20220218094133.GA28120@hu-pkondeti-hyd.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavan, Mathias,

we have tested the patch in the testing environment where initially we 
were hitting the issue. We don't see any issue after including this.

On 18-02-2022 03:11 pm, Pavan Kondeti wrote:
> On Thu, Feb 17, 2022 at 03:56:43PM +0200, Mathias Nyman wrote:
>> xhci_reset() timeout was increased from 250ms to 10 seconds in order to
>> give Renesas 720201 xHC enough time to get ready in probe.
>>
>> xhci_reset() is called with interrupts disabled in other places, and
>> waiting for 10 seconds there is not acceptable.
>>
>> Add a timeout parameter to xhci_reset(), and adjust it back to 250ms
>> when called from xhci_stop() or xhci_shutdown() where interrupts are
>> disabled, and successful reset isn't that critical.
>>
>> Additionally change the signed integer timeout parameter in
>> xhci_handshake() to a u64 to match the timeout value we pass to
>> readl_poll_timeout_atomic()
>>
>> Reported-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Reported-by: Pavan Kondeti <quic_pkondeti@quicinc.com>
>> Fixes: 22ceac191211 ("xhci: Increase reset timeout for Renesas 720201 host.")
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> We have tested the patch and found no issues. Since the issue happens
> very rarely, we have included in our builds for the wider testing.
>
> Thanks,
> Pavan
