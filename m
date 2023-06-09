Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA96729500
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 11:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241544AbjFIJ0k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 05:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240054AbjFIJ0P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 05:26:15 -0400
Received: from forward501c.mail.yandex.net (forward501c.mail.yandex.net [178.154.239.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C60558B
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 02:20:01 -0700 (PDT)
Received: from mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:4212:0:640:eaad:0])
        by forward501c.mail.yandex.net (Yandex) with ESMTP id B3D0E5E92C;
        Fri,  9 Jun 2023 12:19:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 2JSaHF9DdW20-yhDDw2Ny;
        Fri, 09 Jun 2023 12:19:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1686302343;
        bh=FYYZ+tLjnHDPoWRjXxDJQL6hAc0Mu+ytkZ9pIDL+yBM=;
        h=Subject:From:In-Reply-To:Cc:Date:References:To:Message-ID;
        b=wsGMUhuYPJjQoZj/oB0/2mggtVnO1AM5d7rl/0KrrvAe7WBdoxvfB4ykJat9U5ET1
         NocWzvO9uztssbyBgP7tQkNfZE5GbGQUBMZ9pNAZB3/OrSLb5//foXP0Ilh4pfGnyM
         1s4oDZuprRDN/mPmBmEnFmtI/7vjuWqSmwbt9nwk=
Authentication-Results: mail-nwsmtp-smtp-production-main-46.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <5048b185-7b8d-a3b4-baf2-2c5e923aac5d@yandex.ru>
Date:   Fri, 9 Jun 2023 12:19:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org,
        lvc-project@linuxtesting.org
References: <20230609061619.57756-1-dmantipov@yandex.ru>
 <2023060911-expose-unplanned-964a@gregkh>
 <d68c759a-e44c-0c6f-03cc-1e07418424eb@yandex.ru>
 <2023060903-unashamed-proactive-8bc9@gregkh>
 <d4ce3fc8-fdc7-109e-f8d6-d1de71639c5e@yandex.ru>
 <2023060939-undead-nuptials-3fc1@gregkh>
From:   Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] thunderbolt: handle possible NULL pointer from
 get_device()
In-Reply-To: <2023060939-undead-nuptials-3fc1@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/9/23 11:20, Greg KH wrote:

> So far I have seen more and more false-positives from this "tool" of
> your group that I am very inclined to just tell all kernel maintainers
> to ignore them for a very long time as you are not following the
> documented rules for such patches as outlined in
> Documentation/process/researcher-guidelines.rst
> 
> Please read that and fix your tool, and your submission process, I've
> said this many times already.

There might be a lot of definitions of what "research" actually is.
I realize that the maintainers may be very busy, but is it completely
illegal to sent a patch just to raise the flag and ask to share an
expertise? Note this was not a private e-mail, and it looks a bit
strange to treat it just like an attempt to waste your personal time.
And don't you think that such a policy definitely cuts off the
beginners and makes the community less friendly?

Dmitry
