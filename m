Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C477412E2
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jun 2023 15:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbjF1NqS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Jun 2023 09:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjF1NqI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Jun 2023 09:46:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC2326AB
        for <linux-usb@vger.kernel.org>; Wed, 28 Jun 2023 06:46:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E80D66124A
        for <linux-usb@vger.kernel.org>; Wed, 28 Jun 2023 13:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E53EC433C8;
        Wed, 28 Jun 2023 13:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687959962;
        bh=mRudSuSuM9tYQlCkhVPjOgZuXv5wNiRv73wjtIbbMMA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DK6WZz4GIRdwsx/h1s2ZAOPskHGsJ5gJU+g0vexNzdoOfZJSspJkf32Z7kFuz9ytv
         Yk1HvNDc5Xgw21ZlqVSol07rfpopeBS0lEVKBbeKoJhGJy7I9Bbn+VqMMxFALzcthj
         FNRGz6BoKABftlQ2jJobD8ZTBC3UC+AAnugQ2GmTbtCaCNovaxe81RJb0z8IHpdDP8
         LNyKwnoOuon9PbizgzpN4QnsgG3kJWjyBxza0OpwDI0G72HHZAxOw5z3xZ8JsLFaaI
         bGiyC+DWyM6SH/4/lMhAu2any0eKHumXaTIHNzsDC9cDf6hif6ZpVVh8vYWgrAcT8Z
         aepIoSYcyIr5A==
Message-ID: <211053fb-eec0-6610-065e-4cc6655b288d@kernel.org>
Date:   Wed, 28 Jun 2023 19:15:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXT] Re: usb: cdns3: Onchip memory reservation for built-in
 gadgets
Content-Language: en-US
To:     Frank Li <frank.li@nxp.com>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "pawell@cadence.com" <pawell@cadence.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <aa5837a9-8dd6-f10f-fd58-ec43e027ef07@ti.com>
 <b0314296-0df7-efcd-b0cf-166cb09ab338@kernel.org>
 <AM6PR04MB48382467AC7D6AF26C8CC4918827A@AM6PR04MB4838.eurprd04.prod.outlook.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <AM6PR04MB48382467AC7D6AF26C8CC4918827A@AM6PR04MB4838.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/06/2023 20:26, Frank Li wrote:
> 
> 
>> -----Original Message-----
>> From: Roger Quadros <rogerq@kernel.org>
>> Sent: Tuesday, June 27, 2023 5:41 AM
>> To: Ravi Gunasekaran <r-gunasekaran@ti.com>; Frank Li <frank.li@nxp.com>
>> Cc: linux-usb@vger.kernel.org; peter.chen@kernel.org;
>> pawell@cadence.com
>> Subject: [EXT] Re: usb: cdns3: Onchip memory reservation for built-in
>> gadgets
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report
>> this email' button
>>
>>
>> Hi,
>>
>> On 27/06/2023 15:56, Ravi Gunasekaran wrote:
>>> Hi,
>>>
>>> Firstly, I'm not sure if it is alright to post queries this way.
>>> If it is wrong, I apologize for it. Please let me know the right path/forum to
>> ask the questions.
>>>
>>> This is regarding the commit
>>> dce49449e04f usb: cdns3: allocate TX FIFO size according to composite EP
>> number
>>>
>>> This commit introduced cdns3_gadget_check_config() which is invoked
>> while binding gadget created via configfs and
>>> also a logic to calculate ep_buf_size (which was CDNS3_EP_BUF_SIZE = 4).
>>>
>>> But for gadgets such as g_ether, g_cdc, the checks are not performed. And
>> also for these legacy gadget drivers,
>>> memory needs to be reserved for multiple IN end points and shared
>> memory for OUT end points. So when ep_buf_size = 15,
>>> the memory reservation fails, as it exceeds total onchip memory.
>>>
>>> So I was wondering if additional checks need to done in the cadence gadget
>> driver or am I doing something wrong while
>>> loading gadgets such as g_ether.
>>>
>>
>> I think Ravi's concern is that.
>>
>> prior to commit dce49449e04f, priv_dev->ep_buf_size was fixed at 4.
>> After commit dce49449e04f, it is at 0 if check_config() is not called e.g.
>> in the legacy gadget cases (e.g. g_ether).
>> So cdns3_ep_config() fails with dev_err(priv_dev->dev, "onchip mem is full,
>> ep is invalid\n").
>>
>> A potential fix might be to start with priv_dev->ep_buf_size = 4
>> instead of 0 so it works for legacy gadgets as well where check_config() is not
>> invoked.
> 
> I think it should fix at legacy driver by call usb_gadget_check_config. 
> Assume there are a UDC controller, which only 2 endpoint.  g_cdc should
> get failure.
> 

commit dce49449e04f has broken legacy gadget drivers for CDNS3 UDC
and that should be fixed first.

No other UDC drivers implement .check_config() yet.

UDC driver should start with a default sane configuration and work even if
usb_gadget_check_config() is not called by gadget driver.

-- 
cheers,
-roger
