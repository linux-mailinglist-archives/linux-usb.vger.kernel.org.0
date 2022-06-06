Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C507953E0CF
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 08:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiFFF0e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 01:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiFFF0d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 01:26:33 -0400
Received: from out198-10.us.a.mail.aliyun.com (out198-10.us.a.mail.aliyun.com [47.90.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4669F5D00
        for <linux-usb@vger.kernel.org>; Sun,  5 Jun 2022 22:02:37 -0700 (PDT)
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1948032|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.00892731-0.00169371-0.989379;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=michael@allwinnertech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.Nzy42wM_1654490995;
Received: from 192.168.220.136(mailfrom:michael@allwinnertech.com fp:SMTPD_---.Nzy42wM_1654490995)
          by smtp.aliyun-inc.com(33.45.69.145);
          Mon, 06 Jun 2022 12:50:42 +0800
Message-ID: <b5836e57-165b-e90f-8a5a-90867cfe2c6c@allwinnertech.com>
Date:   Mon, 6 Jun 2022 12:49:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/2] usb: gadget: f_fs: change ep->ep safe in
 ffs_epfile_io()
Content-Language: en-US
To:     John Keeping <john@metanate.com>
Cc:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <1654056916-2062-1-git-send-email-quic_linyyuan@quicinc.com>
 <1654056916-2062-3-git-send-email-quic_linyyuan@quicinc.com>
 <0732d4f3-5359-0d9d-94b9-66a7403dc7d8@allwinnertech.com>
 <Ypi10OWth6Rd08n9@donbot>
From:   Michael Wu <michael@allwinnertech.com>
In-Reply-To: <Ypi10OWth6Rd08n9@donbot>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/2/2022 9:06 PM, John Keeping wrote:
> On Thu, Jun 02, 2022 at 06:39:30PM +0800, Michael Wu wrote:
>> Tested-by: Michael Wu <michael@allwinnertech.com>
>>
>> I've tested Linyu's patches [PATCH v3 1/2] [PATCH v3 2/2]. I believe it
>> fixes the bug I reported.
>>
>> What's more, John's solution [1] also works in my tests. It looks simpler.
>> I'm not sure if it's as complete as Linyu's solution.
> 
> It's not as comprehensive, let's focus on this thread.
> 

No problem. Thank you.

-- 
Regards,
Michael Wu
