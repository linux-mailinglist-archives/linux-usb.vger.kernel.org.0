Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B93417052
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 12:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhIXKam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 06:30:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:36432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231140AbhIXKam (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 06:30:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 905AE61107;
        Fri, 24 Sep 2021 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632479349;
        bh=jEFAd2P4kBMeCq3f3Jlc9Gm7txdnV+Lv84GFu0/0G8c=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=u41Jgke3WrW2ZbMj2pzvZt9lxIUrEtmGslk7EVN+a0rE0RGBLPGY+TkEEc8RxTNtH
         XwRrURa7XFYM1b0qYIAhyDxdoGcZ1yYElPTwmxfFkRspPlDaiyL/rF+vZY69PWaJnj
         RtUDncNTV1WRJYKEg2tj0Nl+uIAJqD1zfvIkvg7YySPR+gMRPnKKdjhzE+YBg2FBDJ
         pRGy2thWnw07EJKdNFsZNAySaO/LFWlArS6Pyza6AExxY8ZMa/C0BJ8kFLdmtKfg1O
         3HOsfXaS9GjVc/HL1xlLAKYdxw1jGlfWlwgeOL15Y9Z/mcZlhSROAxFynI3uNRqYOD
         uQG0JjiBgldjg==
References: <20210924083852.6029-1-yangzhiwei@uniontech.com>
 <87fstuqngk.fsf@kernel.org>
User-agent: mu4e 1.6.6; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Zhiwei Yang <yangzhiwei@uniontech.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: phy: tahvo:remove unnecessary debug log
Date:   Fri, 24 Sep 2021 13:28:25 +0300
In-reply-to: <87fstuqngk.fsf@kernel.org>
Message-ID: <87bl4iqnbh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Felipe Balbi <balbi@kernel.org> writes:
> Zhiwei Yang <yangzhiwei@uniontech.com> writes:
>
>> Remove the debug info which should be instead with ftrace
>
> why?
>
>> Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
>> ---
>>  drivers/usb/phy/phy-tahvo.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
>> index 5dc600fadc5f..468151496d23 100644
>> --- a/drivers/usb/phy/phy-tahvo.c
>> +++ b/drivers/usb/phy/phy-tahvo.c
>> @@ -194,8 +194,6 @@ static int tahvo_usb_set_host(struct usb_otg *otg, struct usb_bus *host)
>>  	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
>>  					    phy);
>>  
>> -	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, host);
>> -
>>  	mutex_lock(&tu->serialize);
>>  
>>  	if (host == NULL) {
>> @@ -224,8 +222,6 @@ static int tahvo_usb_set_peripheral(struct usb_otg *otg,
>>  	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
>>  					    phy);
>>  
>> -	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, gadget);
>
> is this causing any problems? What sort of problems? Why should we take
> this patch?

nevermind, I saw that your original patch was simply replacing %p with
%pK but Greg asked you to just remove the lines.

Thank you.

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
