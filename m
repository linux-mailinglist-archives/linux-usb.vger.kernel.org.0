Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4D157608C9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jul 2023 06:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjGYEmc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 00:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbjGYEm3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 00:42:29 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904AB1BCD
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 21:42:27 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-403b6b7c0f7so39996861cf.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 21:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690260146; x=1690864946;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QY85I1cYh872qoFTBiLXUdzIc+PQCjN21Cp/B0kA4Ec=;
        b=Ws851dh3TMJqK7f9HamOutLshKnQysSP+mDHDtkAuiOhUoCampqBXyG9fvPvFJKLRY
         x9ZyhQdCYkaXciMvUJ6q65oIc45/ayP2tEOVJDOYsdnPe0X8uXC6oOK3deANlwR3PDaa
         +x9Tn+BKLcUrprEYxfn43dYx+K+DMb72PR6P5YQxFHk9oxSDaNdY/65Lf46DnRUKG5QR
         0OgEqKn3q98QQ2aulceQ5tEmrJ9DZkC1NYEIRaCkce5KRIhAr88Kfz94MKGdPLBAyU8g
         ERMeTkIUKK3qSFJkCYcXP1naQvDlqxN60smgF36Wviz968pkfT310DO1TR3wdneSchnK
         3UdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690260146; x=1690864946;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QY85I1cYh872qoFTBiLXUdzIc+PQCjN21Cp/B0kA4Ec=;
        b=Z4uh5Rn3GLJqcjL8KGuB35vbuuGeWNS/oLb4r+EHj+fBpe+olTyyD2xtmlujzinhMz
         hnATpwl7253KxaNIZn+zBnW2s6yJs0YmJ7eUpbEbH5vm2LpEQM+84uUhyjlOgXZ0cPUv
         fLz3ymp//LeObSGHPkNxpA68lLCJnxR+ONgxaTLav9Ax54dXkSFpuD4g3vSFOLDke/9l
         FPdCEhluFxtWm+qXGg5w9S71Q+Jy8SD//LE7Pi1K0O+y1oR32vz8pmJc1V3eNu39e3nk
         5MlhFrskofIynGlbpNv7WsA49ZOdFNb8vgrPIey1pwmIF67HzvkWYlA0uUQHqQUdFZem
         dgHA==
X-Gm-Message-State: ABy/qLZUbRqLJtDzOpk4OJpkOX29zjVm12qgIhsR6eWk40a66h78bKKy
        0h2oj/52gjABFdE+ubJhyoSr1lt5PlI=
X-Google-Smtp-Source: APBJJlHqSGIQAWx6VmQa6G3L6IqFNPUzykBybS8HtERgBA74Xk/kCKg8AbLL6+TahVnPhyFyZkceAw==
X-Received: by 2002:a05:622a:592:b0:400:aa4d:7a5d with SMTP id c18-20020a05622a059200b00400aa4d7a5dmr2051988qtb.24.1690260146154;
        Mon, 24 Jul 2023 21:42:26 -0700 (PDT)
Received: from [192.168.1.9] ([159.192.254.36])
        by smtp.googlemail.com with ESMTPSA id ji17-20020a170903325100b001b246dcffb7sm9800799plb.300.2023.07.24.21.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 21:42:25 -0700 (PDT)
Message-ID: <47a5b962-4891-2d61-7a6c-fa87ddf5b78f@gmail.com>
Date:   Tue, 25 Jul 2023 11:42:22 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] USB: serial: option: add Quectel EM05G module support
 with product ID 0x030e
Content-Language: en-US
To:     Martin Kohn <m.kohn@welotec.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
References: <AM0PR04MB576480684AA0896B32D32975973FA@AM0PR04MB5764.eurprd04.prod.outlook.com>
 <84196e5f-31fc-28ff-b047-3f234f1a1a4f@gmail.com>
 <AM0PR04MB5764DED62F134146DC8DC8C79702A@AM0PR04MB5764.eurprd04.prod.outlook.com>
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <AM0PR04MB5764DED62F134146DC8DC8C79702A@AM0PR04MB5764.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/24/2023 16:24, Martin Kohn wrote:
> Hello Lars,
> 
> a little background: We are just a company that uses the Quectel modems in our products. So far, I was not able to get more information from Quectel apart from
> that it is the same module with a different product ID. Unfortunately, they will stick to the new product ID.
>
Yes it is the same module but with a different interface layout so you 
can not just copy and paste the option driver entry for the old device.

> So, my approach was to clone to entry for EM05-G with the old id. With these changes it is working.
> 
It does work as ppp dialup modem which limits its bandwidth to 30-50Mbps 
(host dependent) but this is a LTE CAT4 device which is able to transfer 
150Mbps down and 50Mbs up, they always have some kind of direct net 
interface.
On the EM05Gv2 that is interface #4 which should be reserved in the 
option driver and added in the qmi_wwan driver.
The older EM05G  had qmi_wwan on interface #6 which is why that 
interface was reserved in the option driver.
If you let the option driver bind to the net interface then the net 
driver can not bind to that interface, that's why the net interface must 
be declared as reserved (RSVD) in the option driver.

> But you are right. I removed RSVP(6) option entirely and it also works fine.
> I currently trying to get on hold of a module with the old product ID (might be difficult), because I think the driver for the old revision might then also have the same issue.
> 
> Please provide any feedback you can, it would be greatly appreciated, our customers are eager to have the modem working in Linux again.
>
Any changes from your initial patch should have a revision number in the 
email header and there should be an explanation in the email body below 
the tear line what has changed from revision to revision. Since you did 
not revision your previous patches then your next attempt should be a v2 
patch.

> Greetings,
> Martin Kohn


