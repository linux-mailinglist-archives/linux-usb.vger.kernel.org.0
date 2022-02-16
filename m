Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170894B8545
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 11:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiBPKL5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 05:11:57 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:36740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiBPKL4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 05:11:56 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD151EEE7
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 02:11:44 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m14so2888017lfu.4
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u22GM5rHBOdu+UUz3G/CLe9BVyuGaw2GVEr2IMR2ydI=;
        b=Pud7NLKMB57ntpfWEl5YVKwq5+dwDNedQwLdqxKIurwQSmWFFJwUDHJcGPbknAKhgP
         Gmks4uQgY4b10vvJZkVRgl34BjQm1zGB+zzYsJ0Wq+2wnNYnm6UNjdQMVC3u89xaEsti
         yoiOE0q3VyLVU1aUppf+rsorIhMsiP/Q2VKZBK61wC4ClPqVBboAAAk2KjO/XTftUyWH
         Gmpr4WQyPvFUHeLPI3bkxNncMR6kYI40/2SBUp42Zr2CmNacae1Ghn0i0efS9YLlhARt
         jzEBHKeib/vMTRL+d6Z9aANBmmeb3iA8NB2y5qke6PehFcHEJ5yXLSkJYGTRcnCOM/AF
         lbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u22GM5rHBOdu+UUz3G/CLe9BVyuGaw2GVEr2IMR2ydI=;
        b=m9UDpwD85g6VXFfzl2woVGhbbTGgFmyDcDpfelOL5xq4dUprRnKRydgILu1fHhh6DV
         0KaDdXpUMjou6xpNfm5RfnDfqc+VpoUgqqjWJ+rw6UYQz77gwuZCcGHLcEx9wNJ8tLH3
         RguZ8InAxY+t5TCAaTAQcAGeWkwECo8xtFJznWmjigviDfKNx3mxai70xm2UOobYg4Mw
         BcyfYab902q3UKoozefpxG2KiTwcDQCdaVs3UbcmmB4zii9qCoLPXhDSYenrOH7WmOye
         DSwYn5chSXyw5ReKC2vqqLHdMkvKcCgQjDVi1eZ2adBKoFafeih7O5gBZBU5+DWaWPiK
         nlAg==
X-Gm-Message-State: AOAM5322B1a0+3D7W3waOU9nnBVjD6mkhLbDjSxc2wi4JN5LZ2CNqaSQ
        pVAmTiIVVKUuhdbw/BgK/SkJS0qfsEU=
X-Google-Smtp-Source: ABdhPJwoJHCujl42suIzpt82DWkUKBn9oDoZnIlNAElxefUrWJNepeTV5kDGzKTv7MSKko6aebBX3w==
X-Received: by 2002:a05:6512:3b26:b0:439:75ec:b56f with SMTP id f38-20020a0565123b2600b0043975ecb56fmr1468878lfv.53.1645006302430;
        Wed, 16 Feb 2022 02:11:42 -0800 (PST)
Received: from [192.168.1.103] ([31.173.81.81])
        by smtp.gmail.com with ESMTPSA id j13sm412884lfu.66.2022.02.16.02.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 02:11:41 -0800 (PST)
Subject: Re: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
References: <1644994755-12975-1-git-send-email-quic_linyyuan@quicinc.com>
 <1644994755-12975-2-git-send-email-quic_linyyuan@quicinc.com>
 <4688f5bb-c0fd-bbce-de1f-a554d543ed03@gmail.com>
 <DM8PR02MB819861F71713D5539EF66D12E3359@DM8PR02MB8198.namprd02.prod.outlook.com>
 <c6cf661b-b3df-281f-3cb0-8899c95f9ce2@gmail.com>
 <DM8PR02MB819806B3CE8EB69B516E893AE3359@DM8PR02MB8198.namprd02.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <a073dbb6-0c6d-99ec-fce0-f7e0422fb392@gmail.com>
Date:   Wed, 16 Feb 2022 13:11:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <DM8PR02MB819806B3CE8EB69B516E893AE3359@DM8PR02MB8198.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/16/22 12:57 PM, Linyu Yuan (QUIC) wrote:

[...]

>>> that's correct,  from my view, one line is good,
>>>
>>> What's your suggestion ? two lines ?
>>
>>    Yes, and it is not just my suggestion -- it's the kernel coding style.
> I think in linux, there are many code like this,
> 
> arch/m68k/sun3x/dvma.c:         if((pmd = pmd_alloc(&init_mm, pud, vaddr)) == NULL) {
> ...
> 
> Two lines here is not good.

   Why?! 8-)

>> [...]

MBR, Sergey
