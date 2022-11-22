Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40AF86338FF
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 10:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbiKVJtk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 04:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbiKVJth (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 04:49:37 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C0D429B5;
        Tue, 22 Nov 2022 01:49:36 -0800 (PST)
Received: from [192.168.0.192] (unknown [194.146.248.75])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: andrzej.p)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BE2346602AC7;
        Tue, 22 Nov 2022 09:49:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1669110575;
        bh=HEPaJdPz6fXCosaO0Ku+ggnHlSYTwNdmruocqlZdFog=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JjsU/qNNxymZbYJ5CQud9tO9oiPw3t+SZIHPfPIng1pEDfGMkvES4Yjx2kXQ0Lukn
         4VfbAUSXI38dYiwXc+HsIU79kACQi9//HMLennxvwt23xqsjxdRVAKxq8MrkG4ZtgC
         J0UWy+ro/YJuFkm1kj9a5Q42nBoJN/Y8dZ/fu0w42FBJljmaQ3vPAaFRlXxsTGCcEf
         o3Dy8vngRlr7WBBObFuX3wGlQ9h3SP2PzLkiqt8UxF++yj7eZJuq8Pxf8TB1C6ZKtx
         8TkMhTizlreNRM9BAil6p1WXJ30cqe0b9Ob02u4IRupNatSEwcJhVwQKNHPOD5/1e+
         Vi43+4lHGPUew==
Message-ID: <1894a272-4816-c44c-61d5-bfcfe478d7e5@collabora.com>
Date:   Tue, 22 Nov 2022 10:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: gadget: function: use after free in printer_close()
To:     Dan Carpenter <error27@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Briscoe <albertsbriscoe@gmail.com>,
        Zqiang <qiang.zhang@windriver.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <Y3uOxcvowFq75Tzv@kili>
 <b7dcf498-51ea-3aaf-211f-09fa59c38768@collabora.com> <Y3xzi389jS0PmEBA@kadam>
Content-Language: en-US
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <Y3xzi389jS0PmEBA@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

W dniu 22.11.2022 o 08:00, Dan Carpenter pisze:
> On Mon, Nov 21, 2022 at 04:32:52PM +0100, Andrzej Pietrasiewicz wrote:
>> Hi Dan,
>>
>> I'm fine with either symmetrically removing the DBG() from "printer_open()"
>> or with this version of the patch.
>>
>> It seems to me that this version better fits "fixing UAF", though.
>> Whether the driver is too verbose is another matter, and if it is,
>> it deserves its own patch because DBG() invocations are sprinkled
>> here and there.
> 
> It is too verbose, but I'm trying to cut my kernel work to an hour a day
> and then all day Friday so I don't have time to clean to do clean up
> work.  A UAF is sort of high value but clean up is endless.
> 

I volunteer to reduce the amount of debug messages it produces.

Andrzej

> I obviously considered this as v1 but thought deleting was better.  I
> still do.  :)  But it's not worth spending time on.
> 
>>
>> W dniu 21.11.2022 o 15:44, Dan Carpenter pisze:
>>> The printer_dev_free() function frees "dev" but then it is dereferenced
>>> by the debug code on the next line.  Flip the order to avoid the use after
>>> free.
>>>
>>> Fixes: e8d5f92b8d30 ("usb: gadget: function: printer: fix use-after-free in __lock_acquire")
>>> Signed-off-by: Dan Carpenter <error27@gmail.com>
>>
>> Acked-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> Thanks!
> 
> regards,
> dan carpenter
> 

