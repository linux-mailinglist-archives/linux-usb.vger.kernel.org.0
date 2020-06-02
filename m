Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E1A1EBAB5
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 13:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgFBLqp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 07:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgFBLqo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jun 2020 07:46:44 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84908C061A0E
        for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2020 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7jSFRiD8Exdrq7DAttCy2RR6MR+Uq8Jv0yByS4G/VXo=; b=Vo3lUlha1F4rfAqPugYllV0Gq4
        es0iXW59eV1Eb17c1PjeS0Q6uwx0A+Nzf3Nh0ynIOYKkNbi030VnRonvhgb0th8ae+Ib9IyDB7znF
        9m7cxedm9M6OI8AaOie5T58F0Q8NRxDLtZy9TDVGexvKXg3ZRIAhQm84ajdnL41N6rF5y7zxUQQgW
        hEnwT+JO4VfXYyTpT8ELODQaGGgIAVG7cOeSovTx/111mIN1IgJzFhAhtnjVr+iG5XIAvtJ//1DOU
        Nn21Gvu29gyCQg18BaxhdcNSV8MMeILs6Ag39IflUAfLJA88jdfAy5GY0vVyf3eyJsEJv2EekrFQt
        JzA1kOAA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55017 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jg5NR-0004Ja-C0; Tue, 02 Jun 2020 13:46:41 +0200
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
To:     Alan Stern <stern@rowland.harvard.edu>,
        Peter Stuge <peter@stuge.se>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
 <20200602023254.GB15540@rowland.harvard.edu>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a0f8030c-a609-ce03-ff92-027de37eb834@tronnes.org>
Date:   Tue, 2 Jun 2020 13:46:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602023254.GB15540@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 02.06.2020 04.32, skrev Alan Stern:
> On Tue, Jun 02, 2020 at 12:12:07AM +0000, Peter Stuge wrote:
> 
> ...
> 
>> The way I read composite_setup() after try_fun_setup: it calls f->setup()
>> when available, and that can return < 0 to stall.
>>
>> I expect that composite_setup() and thus f->setup() run when the
>> SETUP packet has arrived, thus before the data packet arrives, and if
>> composite_setup() stalls then the device/function should never see the
>> data packet.
>>
>> For an OUT transaction I think the host controller might still send
>> the DATA packet, but the device controllers that I know don't make it
>> visible to the application in that case.
> 
> ...
> 
> Are you guys interested in comments from other people who know more
> about the kernel and how it works with USB?

Absolutely, I want something thats works well in the kernel and doesn't
look odd to kernel USB people.

> Your messages have been
> far too long to go into in any detail, but I will address this one issue.
> 
> The USB protocol forbids a device from sending a STALL response to a
> SETUP packet.  The only valid response is ACK.  Thus, there is no way
> to prevent the host from sending its DATA packet for a control-OUT
> transfer.
> 
> A gadget driver can STALL in response to a control-OUT data packet,
> but only before it has seen the packet.  Once the driver knows what
> the data packet contains, the gadget API doesn't provide any way to
> STALL the status stage.  There has been a proposal to change the API
> to make this possible, but so far it hasn't gone forward.
> 

This confirms what I have seen in the kernel and the reason I added a
status request so I can know the result of the operation the device has
performed.

I have a problem that I've encountered with this status request.
In my first version the gadget would usb_ep_queue() the status value
when the operation was done and as long as this happended within the
host timeout (5s) everything worked fine.

Then I hit a 10s timeout in the gadget when performing a display modeset
operation (wait on missing vblank). The result of this was that the host
timed out and moved on. The gadget however didn't know that the host
gave up, so it queued up the status value. The result of this was that
all further requests from the host would time out.
Do you know a solution to this?
My work around is to just poll on the status request, which returns a
value immediately, until there's a result. The udc driver I use is dwc2.

Noralf.

> Alan Stern
> 
