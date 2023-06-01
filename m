Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA7371980E
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jun 2023 12:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbjFAKAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jun 2023 06:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbjFAJ7m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jun 2023 05:59:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3095B1AB
        for <linux-usb@vger.kernel.org>; Thu,  1 Jun 2023 02:59:19 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE548105;
        Thu,  1 Jun 2023 11:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685613536;
        bh=uWuibaatbSgHf3XAOQfjDA3W0DAXJ0Ds4BNI1SeKYrE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JV/64hd2KPJAVcoaf4VbtCY1jOqcSFNr63R9PzR17vciM8MntXEizB2dQyvN37eZl
         qvrNot2kbiviJMVfUXedQ8Da6NWadL3ZJCcI9ivMOk29hFaaXeYkt7pRdoespQxUui
         4FNC5J+DLiX28HbOGx95s6GxnZOECnYwGgnqNy20=
Message-ID: <6016c3f2-3f99-4d18-4a22-4ca288a6a965@ideasonboard.com>
Date:   Thu, 1 Jun 2023 10:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Avichal Rakesh <arakesh@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
 <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
 <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
 <20230509223526.5e6oqqri3mhwc34l@synopsys.com>
 <20230509224241.vvylagjkqbwo4hbk@synopsys.com>
 <c68249a8-4e22-abd9-5c7c-7e8b7f383898@google.com>
 <CAMHf4WLxxWM+DQz6=CEff34WcfX3s1cQoSKkv1qgJvJSMYmDQg@mail.gmail.com>
 <20230517233556.ksd2tu2ab7wpqhcl@synopsys.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230517233556.ksd2tu2ab7wpqhcl@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all

On 18/05/2023 00:36, Thinh Nguyen wrote:
> Redirect "To:" Dan and Laurent.
>
> On Mon, May 15, 2023, Avichal Rakesh wrote:
>> On Mon, May 15, 2023 at 5:29 PM Avichal Rakesh <arakesh@google.com> wrote:
>>
>>> TL;DR: Naively queueing up 0-length requests as fast as possible has the
>>> consequence of delaying the entire stream by ~8ms, but does not seem to be
>>> delaying frames individually any more than before. Changing the number of
>>> 0-length requests has very little consequence on the stream, but increases
>>> the chances of missed ISOCs.
>>>
>> Dan and Laurent, could you review
>> https://urldefense.com/v3/__https://lore.kernel.org/20230508231103.1621375-1-arakesh@google.com/__;!!A4F2R9G_pg!aHKkn_0z8V8kQMsStnCYcrRFoSXGqvGToeGxe7f-xOyZXzDWLOPTi1CfAVHO8PvnGch1LIW5IUNyfwEsYIN5$  when
>> you get the chance?


I'm sorry - I've not been involved in this thread at all yet which given the length of time it's 
been going on is extremely remiss. I'll take a look now, and also test it out on the dwc2 platforms 
I have.


Thanks
Dan

>>
>> Thank you!
>> Avi
