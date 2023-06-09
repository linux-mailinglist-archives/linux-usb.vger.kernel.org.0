Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5ADD729244
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 10:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240126AbjFIIHN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 04:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjFIIGt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 04:06:49 -0400
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513C63ABF
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 01:06:03 -0700 (PDT)
Received: from mail-nwsmtp-smtp-production-main-17.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-17.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8c12:0:640:5fed:0])
        by forward501b.mail.yandex.net (Yandex) with ESMTP id D206D5E5D0;
        Fri,  9 Jun 2023 11:06:00 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-17.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id x5R9P53W08c0-XD32b9E8;
        Fri, 09 Jun 2023 11:06:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1686297960;
        bh=qNHwwS+VL1dtTFNdvOwjjQH6gh6RqJr7seHUTZZbC08=;
        h=Subject:From:In-Reply-To:Cc:Date:References:To:Message-ID;
        b=b5ZLzXItcuw0dNMAvwZrL/FcjqwuVcNHIJs83xKPWZtsTx0WC9nwtG2cKr+JAC22E
         p/12kf+s+ooeHeN5LLR33fk0Xeroop4MoE7W8UiN7CYTflEGzI+lHKCnyeKorikin8
         Ugv/0l4F4OSYzS+6KztPo7baLIlJYR0XnxdQTJ/c=
Authentication-Results: mail-nwsmtp-smtp-production-main-17.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <d4ce3fc8-fdc7-109e-f8d6-d1de71639c5e@yandex.ru>
Date:   Fri, 9 Jun 2023 11:05:59 +0300
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
From:   Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] thunderbolt: handle possible NULL pointer from
 get_device()
In-Reply-To: <2023060903-unashamed-proactive-8bc9@gregkh>
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

On 6/9/23 10:46, Greg KH wrote:

> Again, how did you test this?

Did you look at the patch header? For that particular case, the static
analysis tool complains that the value returned by get_device() is most
likely should be checked just because it is checked on a lot of other
code paths. Usually it may be a good precaution to handle the very rare
and unexpected errors; again, if you're sure that this is not the case,
just disregard it.

Dmitry

