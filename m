Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95EAC552A5B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 06:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344443AbiFUEl4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 00:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344532AbiFUElx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 00:41:53 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866A921E00
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 21:41:51 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-317741c86fdso117106017b3.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 21:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ro1LCxwhTGiAna8C3lNbHEJctA+S1JBGbBmsU852zE=;
        b=lGXbUBoCTWFrPwImJUCzzfIsPOMBa7eh/GWupA6JM3FTbFBF2NXtsufodbncE1MZfy
         b1wrdpLbYmR8UM4hQYRPCGQV/niMdG9/jFvW1+/oM9Ya9OclHrWJMFUAVnbBgHz6mE7E
         XUStgqaP6uJbSZunvhBqP7BspkFYPFEVBWz6bqJPLBuFE2cMfhqvHhiRubdLyscj86mQ
         2OB3v+qGjxGVpHxabWiVFpcvFRnY6g/9GUSlJr71AUJl0BxgzxvzHTQ0XLZfz7cWMCNd
         Hj/g/TPi0GdEs52jsp9GWY9r/Tb0CzO+j/722eYjC5btcBRQ3lGflhJLfys7kAFfc9Cx
         h+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ro1LCxwhTGiAna8C3lNbHEJctA+S1JBGbBmsU852zE=;
        b=UKew48PQQEMGfb6+x4yE3XQlUFNNDeFK+0noCtJg0P3iJmqrV3nfcB41tPn0l0ha32
         O/Mv8dxgOMFdMyzjPUs5cjbNwlcM7tDppxGsdmPE6CJi4FMapSlGU0itz+D70iod3Wvz
         XMFYVvSDsj7x4Zg+F73ptYrhOs0vgapQISznwPrdov9gLextux/UJnhKfq7xtEqTLw5/
         7Ka3dKkSGtik5Vj2ZjX4mLL89y2WlCuP3G9E0m5CnAsUWWoDIoTmSN48wZydqzs4ESuq
         NxG6ceF3XFArrbq8iigCsjWD0DWur1yOVfZgwWocV7LiTwn18wpe7gcynZ7VUejwW/jF
         v34g==
X-Gm-Message-State: AJIora+Ff6b35YKpSpSSeLf+9+0c+ImCuE93HtAQNKvCtHLYeZ0xmgBx
        EbiUaaXj3YjJxV8lNmmi034oUCuDG4TcJ/YurEk=
X-Google-Smtp-Source: AGRyM1t2SajurzguU/D8ckgf0gW4dqb2hFO1DNXoIyiLLkG3QqygJyjmNotGtifPx+wQxSbLn2JPWJD9LUjVgrqTwaw=
X-Received: by 2002:a81:990f:0:b0:2f8:c347:d11a with SMTP id
 q15-20020a81990f000000b002f8c347d11amr30031740ywg.507.1655786510676; Mon, 20
 Jun 2022 21:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220617133514.357-1-charlesyeh522@gmail.com> <YrBARs5dfARHW9Rl@hovoldconsulting.com>
 <CAAZvQQ4iHB44=Ug7o+=ZqzTCYSM3igSwfi1xBUGqJS1ChzcbUw@mail.gmail.com> <YrBq3+Q4geN0bF5x@hovoldconsulting.com>
In-Reply-To: <YrBq3+Q4geN0bF5x@hovoldconsulting.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Tue, 21 Jun 2022 12:41:39 +0800
Message-ID: <CAAZvQQ4xy+YSuEipRX=bLXJVKtS2qExOBER3QH3BJw_ATYdXuw@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: Modify the detection method of
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Ok, but the above could be handled with two entries or if needed we can
> just check the major number (i.e. the MSB, 0x03)?

No , MSB:0x03 represents the HXN_GT (PL2303GT) version,
but the current HXN version has multiple IC types,
for example, the bcdDevice_MSB of HXN_GS uses 0x60.

HXN_GS: PL2303GS_R4 : idProduct : 0x23F3, bcdDevice: 0x0600
HXN_GS: PL2303GS_R5 : idProduct : 0x23F3, bcdDevice: 0x0605
HXN_GS: PL2303GS_R5+ : idProduct : 0x23A3, bcdDevice: 0x0605

The difference between R4 and R5 is that bcdDevice is a different set value.
The difference between R5 and R5+ is that idProduct is a different set value.
But PL2303GS_R4 / PL2303GS_R5 / PL2303GS_R5+ all represent HXN_GS chip.


> So far I've gathered that
>
>         0x100   GC
>         0x105   GC
>         0x300   GT / TA
>         0x305   GT
>         0x405   GL
>         0x500   GE / TB
>         0x605   GS
>
> So it look like we could use the major version number.
>
> Anything more we need to add to the above list?

Currently there are HXN ICs on the market:
PL2303GC : 0x0100 / 0x0105
PL2303GT : 0x0300 / 0x0305
PL2303GL : 0x0400 / 0x0405
PL2303GE : 0x0500 / 0x0505
PL2303GS : 0x0600 / 0x0605
PL2303GR : 0x0700 / 0x0705

I think it is not very good to add the above bcdDevice to the list.

Because the company's PM/Sales are still planning some HXN ICs
(these ICs will be sold according to market behavior in the future,
and there will be different bcdDevices: 0x0800 / 0x0805/ 0x0900 / 0x0905.....).
so in the future Time, it will become to add different bcdDevice values
from time to time, which will become the patch file is always updated.


In the current newest Linux driver program design,
using bcdUSB (0x0100 / 0x0200) as a judgment.
I hope that when bcdUSB==0x0200 is encountered,
I only need to judge whether it is PL2303TA/PL2303TB chip,
and the rest is to use HX_Status to judge whether it is HXN_TYPE chip.

There is no need to use bcdDevice one by one to determine which HXN_TYPE
(PL2303GC, PL2303GT....)

At present, if our customers need special functions or
chip version control in HXN_TYPE IC ,
we will provide special customized files or patch files

General customers only need to identify as HXN_TYPE on Linux OS.

Charles.
