Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA488A01D4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 14:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfH1MeU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Aug 2019 08:34:20 -0400
Received: from mr08.mx01.tldhost.de ([84.19.26.246]:35184 "EHLO
        mr08.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbfH1MeU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Aug 2019 08:34:20 -0400
X-Greylist: delayed 90787 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Aug 2019 08:34:20 EDT
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id 9AC1E1212FB
        for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2019 14:34:18 +0200 (CEST)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id 906441212FD; Wed, 28 Aug 2019 14:34:18 +0200 (CEST)
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id 7E7DD12071A;
        Wed, 28 Aug 2019 14:34:16 +0200 (CEST)
Received: from fw-emea.rohde-schwarz.com (fw-emea.rohde-schwarz.com
 [80.246.32.33]) by webmail.kiener-muenchen.de (Horde Framework) with HTTP;
 Wed, 28 Aug 2019 12:34:17 +0000
Date:   Wed, 28 Aug 2019 12:34:17 +0000
Message-ID: <20190828123417.Horde.00t1xjtxlSxoLWLKyR_L7td@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb: gadget: net2280: Move all "ll" registers in
 one structure
References: <bc390967a9ac59e658ae79ba74a23a6ca898351b.camel@kernel.crashing.org>
 <87ftllwqi7.fsf@gmail.com>
 <d2f02109e718a6578d91467e6a4d522819be7a23.camel@kernel.crashing.org>
 <87d0gpwo19.fsf@gmail.com>
In-Reply-To: <87d0gpwo19.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-PPP-Message-ID: <20190828123417.31263.19944@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Zitat von Felipe Balbi <balbi@kernel.org>:

> Hi,
>
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>> On Wed, 2019-08-28 at 13:09 +0300, Felipe Balbi wrote:
>>> Hi,
>>>
>>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>>
>>> > The split into multiple structures of the "ll" register bank is
>>> > impractical. It makes it hard to add ll_lfps_timers_2 which is
>>> > at offset 0x794, which is outside of the existing "lfps" structure
>>> > and would require us to add yet another one.
>>> >
>>> > Instead, move all the "ll" registers into a single usb338x_ll_regs
>>> > structure, and add ll_lfps_timers_2 while at it. It will be used
>>> > in a subsequent patch.
>>> >
>>> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>>
>>> I tried applying your patches but it resulted in build break. Can you
>>> collect all the dependencies and send a single series? I'm applying on
>>> top of my testing/next branch.
>>
>> You mean the 2 net2280 patches ? Or something else ?
>>
>> What break did you get ? It's just one series of 2 patches.... I'll try
>> rebasing them against your branch tomorrow.
>
> allmodconfig broke with missing fields in whatever structure. I didn't
> dig too much, sorry.
>

After applying [patch 1/2] & [patch 2/2] I could build on  
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/ branch  
usb-next. Please note that [PATCH 1/2] was sent twice.

-Guido

