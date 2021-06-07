Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1BF39D2E8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 04:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhFGC3E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Jun 2021 22:29:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26197 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhFGC3D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Jun 2021 22:29:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623032833; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=CVUT5V+X+7EPvYc45JmfgKlz5lusClVHJOJxXLW1rSw=;
 b=Ys1kMX+A1f5MXokMF0sgdLf93eJijGtqLS0CivyHtweEG8bCWB9IOY/eCOBaaPikUFwDBYWl
 yugzp+szL0IHKVMj6CnxsBkpc0MeXo6eVkNkIhTnTB1yKE9n1P/40a2z+RVryyrNw+cqie5a
 Sz9PMzYOGY+yFOnTx0ME2hv7+pE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60bd83fe81efe91cdabaac07 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 02:27:10
 GMT
Sender: linyyuan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 862FEC4338A; Mon,  7 Jun 2021 02:27:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: linyyuan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26E30C433D3;
        Mon,  7 Jun 2021 02:27:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 07 Jun 2021 10:27:08 +0800
From:   linyyuan@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Linyu Yuan <linyyuan@codeaurora.com>
Subject: Re: [PATCH] usb: gadget: eem: fix wrong eem header operation
In-Reply-To: <YLoFayeoyqElpVSU@kroah.com>
References: <20210603150947.4627-1-linyyuan@codeaurora.org>
 <YLoFayeoyqElpVSU@kroah.com>
Message-ID: <440862cb6d6a2835cd4cd6f830baeaaf@codeaurora.org>
X-Sender: linyyuan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-06-04 18:50, Greg KH wrote:
> On Thu, Jun 03, 2021 at 11:09:47PM +0800, Linyu Yuan wrote:
>> From: Linyu Yuan <linyyuan@codeaurora.com>
>> 
>> when skb_clone() or skb_copy_expand() fail,
> 
> How can these calls fail?  If they do, what is the overall system
> health?
indeed skb_copy_expand() fail on system when it have low continuous 
memory region
when using bigger MTU.
> 
>> it should pull skb with lengh indicated by header,
>> or not it will read network data and check it as header.
>> 
>> Signed-off-by: Linyu Yuan <linyyuan@codeaurora.com>
>> ---
>>  drivers/usb/gadget/function/f_eem.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> What commit does this fix?  Should it go to stable kernels?  If so, how
> far back?
this change can't avoid all system memory issue which cause skb failure,
but i help reduce driver parse wrong network data which may consume too 
much CPU time.

i will cc stable@vger.kernel.org on V2. i think it can apply to all 
active stable branch,
from 4.4 to 5.10.

> 
> And any reason you didn't use scripts/get_maintainer.pl for who to send
> your patch to?
thanks very much, i will follow your suggestion and provide a V2.
> 
> thanks,
> 
> greg k-h
