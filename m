Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452EB510AF2
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 23:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355079AbiDZVJB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 17:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353035AbiDZVJA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 17:09:00 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B154ECF9
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 14:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651007152; x=1682543152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Hb2xH+3Se/VOBcoxf3sX0G0F/SaMEF/Ky8XvmrLK9sA=;
  b=x7goxGeRGUj0Mi4xBcuIqLCTs9RLkEpZlhswyC38uMiCdgBUkW8yJEvM
   MugWUn2EPWsHnHHY+dvW0WhkJckLi1xE3ub/n9p1lQYdw53NzO5SzjFdF
   nPg7/jF7SitpSyz87Eo2PYip5B7bULV+HHZj0oMTZ+h68wc6jMy4MnTlU
   w=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 14:05:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 14:05:51 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 14:05:51 -0700
Received: from [10.110.82.27] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 14:05:50 -0700
Message-ID: <14105f3b-aa09-1fd5-48f4-9f15eec2473e@quicinc.com>
Date:   Tue, 26 Apr 2022 14:05:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/6] usb: dwc3: gadget: Rework pullup
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On 4/21/2022 7:22 PM, Thinh Nguyen wrote:
> This series cleanup and enhance dwc3 pullup() handling to cover different
> corner cases.
> 
> Would be great to have some Tested-by before picking this series up. Thanks!
> 
> 
> Thinh Nguyen (6):
>    usb: dwc3: gadget: Prevent repeat pullup()
>    usb: dwc3: gadget: Refactor pullup()
>    usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
>    usb: dwc3: ep0: Don't prepare beyond Setup stage
>    usb: dwc3: gadget: Only End Transfer for ep0 data phase
>    usb: dwc3: gadget: Delay issuing End Transfer
> 
>   drivers/usb/dwc3/ep0.c    |   2 +-
>   drivers/usb/dwc3/gadget.c | 126 ++++++++++++++++++++------------------
>   2 files changed, 69 insertions(+), 59 deletions(-)
> 
> 
> base-commit: 5c29e864999763baec9eedb9ea5bd557aa4cbd77

Thanks for this series.  Running the tests w/ the changes now and will 
debug if I run into any issues.  I will need to run the previous test 
cases I had as well, since the change removes the GEVNTCOUNT clearing 
during pullup disable (this was added for some controller halt failures).

Thanks
Wesley Cheng
