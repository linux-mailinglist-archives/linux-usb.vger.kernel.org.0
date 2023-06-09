Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32A0B7290BC
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 09:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238224AbjFIHQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 03:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjFIHQP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 03:16:15 -0400
Received: from forward500c.mail.yandex.net (forward500c.mail.yandex.net [178.154.239.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6173594
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 00:15:40 -0700 (PDT)
Received: from mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:332f:0:640:4ab4:0])
        by forward500c.mail.yandex.net (Yandex) with ESMTP id 02B165EEE4;
        Fri,  9 Jun 2023 10:15:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id aFQd7w7DfCg0-Qui9n7el;
        Fri, 09 Jun 2023 10:15:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1686294937;
        bh=ZQduFM6OBPHoOl2MarTTvcrHrUk4cVK469ssyhHnWCA=;
        h=Subject:From:In-Reply-To:Cc:Date:References:To:Message-ID;
        b=KT4vUBPHegJIYUyIe3nTTbvLGL9/yfE/+/FOMnCDiE9L+A4V80mcJzNIde5c4FZEc
         vrOq2DRwgeVN6YTpVzRySfgWhI3GNYJERX2Ew5ToYERy5LEoMCqplZxJgL3QmhHhBI
         uyKGELeWpYkyVkaM6PHape9ylo0Cy5PqXGXmXwLI=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <d68c759a-e44c-0c6f-03cc-1e07418424eb@yandex.ru>
Date:   Fri, 9 Jun 2023 10:15:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org,
        lvc-project@linuxtesting.org
References: <20230609061619.57756-1-dmantipov@yandex.ru>
 <2023060911-expose-unplanned-964a@gregkh>
Content-Language: en-US
From:   Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] thunderbolt: handle possible NULL pointer from
 get_device()
In-Reply-To: <2023060911-expose-unplanned-964a@gregkh>
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

On 6/9/23 09:30, Greg KH wrote:

> Sorry, but how can that happen?

Hmmm.. there should be a complete mess in the device tree (e.g. passing
root device with no parent where the regular device is expected). If
you're sure that this doesn't worth checking then please disregard this.

Dmitry


