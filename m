Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1553F4AEF94
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 11:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiBIKzt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 05:55:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiBIKzr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 05:55:47 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF343E16FC98
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 02:33:56 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru C7C4F20D1C67
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] usb: common: usb-otg-fsm: drop unreachable code in
 otg_statemachine()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Peter Chen <peter.chen@kernel.org>, <linux-usb@vger.kernel.org>
References: <5c923258-67c3-bae1-80d1-87a187202a4c@omp.ru>
 <YgNSkY/Hd811Vhu1@kroah.com>
Organization: Open Mobile Platform
Message-ID: <aa29a5b5-f45a-c08c-a955-4f48bd9e4920@omp.ru>
Date:   Wed, 9 Feb 2022 13:33:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YgNSkY/Hd811Vhu1@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/9/22 8:35 AM, Greg Kroah-Hartman wrote:

>> The *switch* statement in otg_statemachine() does handle all possible OTG
>> states explicitly, so the *default* label is unreachable.
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
>> Peter Chen's 'usb.git' repo seems outdated, so I chose to ignore it...
>>
>>  drivers/usb/common/usb-otg-fsm.c |    2 --
>>  1 file changed, 2 deletions(-)
>>
>> Index: usb/drivers/usb/common/usb-otg-fsm.c
>> ===================================================================
>> --- usb.orig/drivers/usb/common/usb-otg-fsm.c
>> +++ usb/drivers/usb/common/usb-otg-fsm.c
>> @@ -440,8 +440,6 @@ int otg_statemachine(struct otg_fsm *fsm
>>  		if (fsm->id || fsm->a_bus_drop || fsm->a_clr_err)
>>  			otg_set_state(fsm, OTG_STATE_A_WAIT_VFALL);
>>  		break;
>> -	default:
>> -		break;
>>  	}
>>  	mutex_unlock(&fsm->lock);
>>  
> 
> There is nothing wrong with leaving lines like this in the code to
> handle any potential bugs.
> Why do you think it needs to be removed?  What benefit does this patch
> have?

   These lines as they are bring no value at all.
   Note that (as I said)  all the values of 'enum usb_otg_state' are
already handled with explicit *case* label...

MBR, Sergey
