Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2ADE22A076
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 22:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732775AbgGVUDd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 16:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732555AbgGVUDd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 16:03:33 -0400
X-Greylist: delayed 436 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Jul 2020 13:03:32 PDT
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B9FC0619DC
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2020 13:03:32 -0700 (PDT)
Received: from mxback9o.mail.yandex.net (mxback9o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::23])
        by forward500j.mail.yandex.net (Yandex) with ESMTP id 246C511C227C;
        Wed, 22 Jul 2020 22:56:11 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback9o.mail.yandex.net (mxback/Yandex) with ESMTP id cbnxin5iPL-u9tmBmaW;
        Wed, 22 Jul 2020 22:56:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1595447770;
        bh=51dZ5riF3qblmz8Y/RJtrYTONRe/tmikNrjShw4rWno=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=uaLM44uplP0AxVu4L/bUfvwwH2o/zPjXO7HryFy/6fGfPBrmA/eCH8S9mMU0/t/ai
         5p/4ykLOzsS0EPGgrkpCFklTzgE8RBzfhUHBR2BjJ7Ibgiuw2idVu7fZI5Ts5aQD17
         Ba1N2kV60UFu0PnfMakNpFdW3KQf7FK1PsY8fiTw=
Authentication-Results: mxback9o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas8-da6d7485e0c7.qloud-c.yandex.net with HTTP;
        Wed, 22 Jul 2020 22:56:09 +0300
From:   Evgeny Novikov <novikov@ispras.ru>
Envelope-From: eugenenovikov@yandex.ru
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Corentin Labbe <clabbe@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>
In-Reply-To: <20200722141741.GA1310843@rowland.harvard.edu>
References: <20200721201558.20069-1-novikov@ispras.ru> <20200722141741.GA1310843@rowland.harvard.edu>
Subject: Re: [PATCH] usb: gadget: net2280: fix memory leak on probe error handling paths
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Wed, 22 Jul 2020 22:56:09 +0300
Message-Id: <2097231595446720@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

I have neither an appropriate hardware nor an experience to deal with issues that you mentioned. Our framework does not allow to detect them as well at the moment. At last, it seems that rather many drivers can suffer from these issues. So, it would be much better if somebody else will suggest necessary fixes and test them carefully.

BTW, you have already discussed the race within net2280_remove() with my colleague about 3 years ago. But you did not achieve a consensus at that time and no fixes were made after all.

Anyway, one can consider both issues independently on the one fixed by the patch.

-- 
Evgeny Novikov
Linux Verification Center, ISP RAS
http://linuxtesting.org

22.07.2020, 17:17, "Alan Stern" <stern@rowland.harvard.edu>:
> On Tue, Jul 21, 2020 at 11:15:58PM +0300, Evgeny Novikov wrote:
>>  Driver does not release memory for device on error handling paths in
>>  net2280_probe() when gadget_release() is not registered yet.
>>
>>  The patch fixes the bug like in other similar drivers.
>>
>>  Found by Linux Driver Verification project (linuxtesting.org).
>>
>>  Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
>>  ---
>>   drivers/usb/gadget/udc/net2280.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>>  diff --git a/drivers/usb/gadget/udc/net2280.c b/drivers/usb/gadget/udc/net2280.c
>>  index 5eff85eeaa5a..d5fe071b2db2 100644
>>  --- a/drivers/usb/gadget/udc/net2280.c
>>  +++ b/drivers/usb/gadget/udc/net2280.c
>>  @@ -3781,8 +3781,10 @@ static int net2280_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>           return 0;
>>
>>   done:
>>  - if (dev)
>>  + if (dev) {
>>                   net2280_remove(pdev);
>>  + kfree(dev);
>>  + }
>>           return retval;
>>   }
>
> This patch seems to be the tip of an iceberg. Following through its
> implications led to a couple of discoveries.
>
> usb_del_gadget_udc() calls device_unregister(&gadget->dev). Once this
> call returns, gadget has to be regarded as a stale pointer. But the
> very next line of code does:
>
>         memset(&gadget->dev, 0x00, sizeof(gadget->dev));
>
> for no apparent reason. I'm amazed this hasn't caused problems already.
> Is there any justification for keeping this memset? It's hard to
> imagine that it does any good.
>
> Similarly, net2280_remove() calls usb_del_gadget_udc(&dev->gadget) at
> its start, and so dev must be a stale pointer for the entire remainder
> of the routine. But it gets used repeatedly. Surely we ought to have
> a device_get() and device_put() in there.
>
> Alan Stern
