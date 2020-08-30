Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25572570BB
	for <lists+linux-usb@lfdr.de>; Sun, 30 Aug 2020 23:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgH3Vf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Aug 2020 17:35:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31841 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726155AbgH3Vfv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Aug 2020 17:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598823349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nPhC1+5bbsbtEa8ZJuKpaDEIo2tOFrzHggB+hQ04mew=;
        b=TzglhZqU7hAZNTMsykqs4Qt1wekzvIrt2ZyMvGihQGgkiOXD64eZ4HQuLBWJ7WdTrvPDRX
        LkB0/iLTl/uC8CTGHyUnR+fqlLlSFeJwzL2AqaoX6Nt6eIhq2hH/BB9SmvcBVQB+o2UL2k
        0MJhYcK5ACrjUdJAqqvgbh5ceBvxvBo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-G9EPg569NDO_SqkeIyfJlw-1; Sun, 30 Aug 2020 17:35:46 -0400
X-MC-Unique: G9EPg569NDO_SqkeIyfJlw-1
Received: by mail-oo1-f71.google.com with SMTP id d10so3477288oop.5
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2020 14:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nPhC1+5bbsbtEa8ZJuKpaDEIo2tOFrzHggB+hQ04mew=;
        b=NWz3211EDU/PWw7nPYWnuIoYrgw04d9LSP01hScI0RjskQSmJSj32OV6etnOZV80RS
         TZhgp/R7N/Yo+d/7rQPQ+zfy7uDIj7PlvmceIUketzLNOlrMO06TBdSduoXdVp3tWSg6
         UfxgY171Z65ue7ML8dbrBm2+aDjOiYBNmJM2EKvrvLgL8AvBn+OItgQ1clpH3JXZ4F6U
         foCuUO77nSkDaA7I110RRUo3W/p8dYuVw8RV/mnO7JPS4fqyKhE4rV/lx897Bk+TBJ7Z
         +n+XXImYC0np1KLZ3DL4ADHz7Jqb1WxIo6avDKTuHRIkf81VJLJcjjh+DBk084SWTwdZ
         HPsQ==
X-Gm-Message-State: AOAM530Oc08+pgODwdxN+T8y81Az4QSEIyQ8zBwVLUPO3xDDjOSlLFin
        86TBfVijwUjcj5EfztRW+8C0kVDlk8aSqBTXbvCmq32MV+Ep6jkJUeo7QBmDPuCXIr7lOBAIJw+
        YF3NuhDfLSMyEd5wpUA8F
X-Received: by 2002:aca:305:: with SMTP id 5mr2013245oid.170.1598823344620;
        Sun, 30 Aug 2020 14:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1H/VMgokYQ3TYCwh3DbOCvK/y+iY2fq9anmdRZ6PIUxY5QvrBXRaSbybzqi3m1HJ3iMIh4A==
X-Received: by 2002:aca:6c5:: with SMTP id 188mr1845062oig.84.1598823343518;
        Sun, 30 Aug 2020 14:35:43 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id m11sm296973ooe.43.2020.08.30.14.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2020 14:35:43 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: net2272: assert for a valid dma request
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        natechancellor@gmail.com, ndesaulniers@google.com,
        christophe.jaillet@wanadoo.fr, peter.chen@nxp.com, b-liu@ti.com,
        chunfeng.yun@mediatek.com, novikov@ispras.ru, yanaijie@huawei.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200830183646.24930-1-trix@redhat.com>
 <20200830212249.GA528080@rowland.harvard.edu>
From:   Tom Rix <trix@redhat.com>
Message-ID: <40bac66a-2c05-6f1b-0e46-e577a54aab6e@redhat.com>
Date:   Sun, 30 Aug 2020 14:35:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200830212249.GA528080@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 8/30/20 2:22 PM, Alan Stern wrote:
> On Sun, Aug 30, 2020 at 11:36:46AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analysis flags this representive problem
>>
>> net2272.c:1541:8: warning: Dereference of null pointer
>>     if ((req->req.length % ep->ep.maxpacket != 0) ||
>>          ^~~~~~~~~~~~~~~
>> This is mostly not a problem.
>>
>> In net2272_handle_dma(), even though every path through
>> the routine dereferences req, it is set to NULL when the
>> ep->queue is empty.  If the eq->queue was ever empty this
>> would have oops.
>>
>> So the else statement should not be needed.  If it is,
>> flag it as a BUG.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
> This patch really seems to be overkill.  In particular, Linus Torvalds 
> feels very strongly that people should not add BUG or BUG_ON calls 
> except in extreme situations -- which this isn't.
>
>> ---
>>  drivers/usb/gadget/udc/net2272.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
>> index 44d1ea2307bb..8301723a8b1a 100644
>> --- a/drivers/usb/gadget/udc/net2272.c
>> +++ b/drivers/usb/gadget/udc/net2272.c
>> @@ -1506,17 +1506,16 @@ static int net2272_stop(struct usb_gadget *_gadget)
>>  static void
>>  net2272_handle_dma(struct net2272_ep *ep)
>>  {
>> -	struct net2272_request *req;
>> +	struct net2272_request *req = NULL;
>>  	unsigned len;
>>  	int status;
>>  
>>  	if (!list_empty(&ep->queue))
>>  		req = list_entry(ep->queue.next,
>>  				struct net2272_request, queue);
>> -	else
>> -		req = NULL;
>>  
>>  	dev_vdbg(ep->dev->dev, "handle_dma %s req %p\n", ep->ep.name, req);
>> +	BUG_ON(!req);
> There's no point in adding this.  If the function goes on to dereference 
> a NULL pointer, you'll get the same effect in any case -- an oops.
>
> If you want to make the point that req had better not be NULL, just get 
> rid of the "if" test entirely.  You could even change the list_entry to 
> list_first_entry.

Since nothing is really going to change, drop this patch.

Tom

> Alan Stern
>

