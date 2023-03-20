Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44A36C08E9
	for <lists+linux-usb@lfdr.de>; Mon, 20 Mar 2023 03:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjCTC3N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 22:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjCTC3M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 22:29:12 -0400
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com [115.236.118.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47B71CF54;
        Sun, 19 Mar 2023 19:29:06 -0700 (PDT)
Received: from [172.16.12.33] (unknown [58.22.7.114])
        by mail-m11879.qiye.163.com (Hmail) with ESMTPA id 331BD6802DA;
        Mon, 20 Mar 2023 10:28:55 +0800 (CST)
Message-ID: <879d18af-e3a9-e953-1b3a-99965f74f63e@rock-chips.com>
Date:   Mon, 20 Mar 2023 10:28:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] usb: typec: tcpm: fix cc role at port reset
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, heiko@sntech.de,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
        william.wu@rock-chips.com, jianwei.zheng@rock-chips.com,
        yubing.zhang@rock-chips.com, wmc@rock-chips.com
References: <20230313025843.17162-1-frank.wang@rock-chips.com>
 <20230313025843.17162-2-frank.wang@rock-chips.com>
 <ZBA8Y/dbozOk2df7@kuha.fi.intel.com>
 <f0f0ac72-0a90-da9e-f686-49c21a76866b@rock-chips.com>
 <ZBRN11OwtkvXk1Hd@kuha.fi.intel.com>
 <d5d1880b-2852-a168-b155-26f972a96457@roeck-us.net>
From:   Frank Wang <frank.wang@rock-chips.com>
In-Reply-To: <d5d1880b-2852-a168-b155-26f972a96457@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRgdSFZISU1MS0xCTRpLTU9VEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSkpLSEpMVUpLS1VLWQ
        Y+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTo6Mio4Qj0WVhI4KjIRPwEw
        IT0wFEtVSlVKTUxCSUxCSEhNS09DVTMWGhIXVR0JGhUQVQwaFRw7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTkJCNwY+
X-HM-Tid: 0a86fcd9289c2eb5kusn331bd6802da
X-HM-MType: 1
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guenter,

On 2023/3/17 20:47, Guenter Roeck wrote:
> On 3/17/23 04:24, Heikki Krogerus wrote:
>> On Wed, Mar 15, 2023 at 10:55:20AM +0800, Frank Wang wrote:
>>> Hi Heikki,
>>>
>>> On 2023/3/14 17:20, Heikki Krogerus wrote:
>>>> On Mon, Mar 13, 2023 at 10:58:40AM +0800, Frank Wang wrote:
>>>>> In the current implementation, the tcpm set CC1/CC2 role to open when
>>>>> it do port reset would cause the VBUS removed by the Type-C partner.
>>>>>
>>>>> The Figure 4-20 in the TCPCI 2.0 specification show that the CC1/CC2
>>>>> role should set to 01b (Rp) or 10b (Rd) at Power On or Reset stage
>>>>> in DRP initialization and connection detection.
>>>>>
>>>>> So set CC1/CC2 to Rd to fix it.
>>>>>
>>>>> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
>>>>> ---
>>>>>    drivers/usb/typec/tcpm/tcpm.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c 
>>>>> b/drivers/usb/typec/tcpm/tcpm.c
>>>>> index a0d943d785800..66de02a56f512 100644
>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>>> @@ -4851,7 +4851,7 @@ static void run_state_machine(struct 
>>>>> tcpm_port *port)
>>>>>            break;
>>>>>        case PORT_RESET:
>>>>>            tcpm_reset_port(port);
>>>>> -        tcpm_set_cc(port, TYPEC_CC_OPEN);
>>>>> +        tcpm_set_cc(port, TYPEC_CC_RD);
>>>>>            tcpm_set_state(port, PORT_RESET_WAIT_OFF,
>>>>>                       PD_T_ERROR_RECOVERY);
>>>>>            break;
>>>> Will this work if the port is for example source only?
>>>
>>> Yeah, this only set at port reset stage and CC value will be set again
>>> (Rd for Sink, Rp_* for Source) when start toggling.
>>
>> Okay. Let's wait for comments from Guenter.
>>
>
> Figure 4-20 is specifically for dual role ports. Also, start toggling 
> would not
> happen if the low level driver doesn't have a start_toggling callback. 
> I think this
> may require some tweaking based on the port type or, rather, 
> tcpm_default_state().
> Something like
>
>     tcpm_set_cc(port, tcpm_default_state(port) == SNK_UNATTACHED ? 
> TYPEC_CC_RD : tcpm_rp_cc(port));

To amend likes above make sense, I shall fix it later.


BR.
Frank

>
> Thanks,
> Guenter
>
