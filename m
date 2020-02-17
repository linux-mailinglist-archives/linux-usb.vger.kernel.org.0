Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2F2161BD9
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 20:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgBQToK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 14:44:10 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34696 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbgBQToJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 14:44:09 -0500
Received: by mail-wr1-f65.google.com with SMTP id n10so19230006wrm.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 11:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hAGXzttVTU3vTW9zSwiZjIbEGfhltW6+ZpeX5a9RjkI=;
        b=XTbyy9M07afpglRT+iO35JnldTEcjCx+vuZqDIGZLoJUF5D8I6my6oLFj4WIviUcnJ
         bYRT5UvCaV5yo75SihEbI+WE1l2Sms5tQ4sIfilEjwnfngXf8dG17m8MduU0fKBwiJNt
         TPa7Qyx53xL/Nrje5HmA6kNtu+bMGA3b5vtWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hAGXzttVTU3vTW9zSwiZjIbEGfhltW6+ZpeX5a9RjkI=;
        b=RTXEtbkzZ68L+tmlGa8cpdaBPNMuFxpHVrITeYoKsJXMwhqgReAa6WGhqqwMr7T3sW
         bGte/wtgLtVYYn9JLPh+6r8zOok7QHDU9OB+0dx0h5qNc54WHKXlXFVHB5+OorXRHaqL
         U44AtiyF3/8PbNlBllIXfbpLN5dvhv51ZIpaGKGpSF7uiuCO3fVWm+7vG6VfGslKSMmm
         +NPQQj9qcxMDH++g/WD6LC1eKn8xV0l1o71tPi3MeML+uFHYjFlQyfgnjDBQm4xgefwo
         jmW1PDaBxNdyVj5PcaZKLLIgVoCi465AiPJwGwVaZRtZmFLjHK24AfqkF9onMQid+Af5
         3qcw==
X-Gm-Message-State: APjAAAWbBIMrNUkKtdDZLEzz/KvnQWCS6uS29SegMUgluHt9dSQlesvI
        aX0GfkgLzXdGZsM+HWWVueGzHpe7Lv1vwVw2
X-Google-Smtp-Source: APXvYqwsy2IOKCJiD9wh/kEnYRcXUngZn1zVk1BtlNaw1ZmsgD6sHqsI8nu2NXlqdyRBAqM2FrJW2Q==
X-Received: by 2002:adf:f802:: with SMTP id s2mr25170420wrp.201.1581968646062;
        Mon, 17 Feb 2020 11:44:06 -0800 (PST)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk. [5.186.115.54])
        by smtp.gmail.com with ESMTPSA id e17sm2278476wrn.62.2020.02.17.11.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2020 11:44:05 -0800 (PST)
Subject: Re: [PATCH] usb: host: fhci-hcd: annotate PIPE_CONTROL switch case
 with fallthrough
To:     Joe Perches <joe@perches.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Timur Tabi <timur@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Anton Vorontsov <avorontsov@ru.mvista.com>,
        kbuild test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200213085401.27862-1-linux@rasmusvillemoes.dk>
 <20200213125659.GB3325929@kroah.com>
 <4fa8a8e9-934d-2962-1daa-fdeea6017ea1@embeddedor.com>
 <e1ec529a1a01bc38513c05308757bc45b53597c3.camel@perches.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f0e804c2-f7a3-da91-9929-38ac7f017081@rasmusvillemoes.dk>
Date:   Mon, 17 Feb 2020 20:44:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e1ec529a1a01bc38513c05308757bc45b53597c3.camel@perches.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/02/2020 18.33, Joe Perches wrote:
> On Mon, 2020-02-17 at 11:12 -0600, Gustavo A. R. Silva wrote:
>>
>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>> Fixes: 5a35435ef4e6 (soc: fsl: qe: remove PPC32 dependency from CONFIG_QUICC_ENGINE)
>>>> Fixes: a035d552a93b (Makefile: Globally enable fall-through warning)
>>
>> By the way, the "Fixes" tag above makes no sense. There is nothing wrong about
>> that commit. It just enabled the fall-through warning globally. Why would you
>> "fix" that?"

Depends on whether you consider a change that introduces a warning in an
otherwise warning-free build a regression or not. That commit claimed

    Now that all the fall-through warnings have been addressed in the
    kernel, enable the fall-through warning globally.

but as I explained below the fold, any CONFIG_PPC32+CONFIG_USB_FHCI_HCD
.config grew a warning due to a035d552a93b. So at least in that sense
there is something wrong about that commit - the above claim is simply
false. Please note that I don't expect anybody to ever be able to
actually cover everything before doing something like what a035d552a93b
does, so I'm not complaining, just explaining.

Then I introduced a change which made that code compile for a ppc64
allmodconfig, which apparently 0day does cover, which is why I added
that other tag.

> There could be some effort made to better specify when "Fixes:"
> tags should be used.

Indeed. I explicitly chose not to cc stable because I don't think it's
for -stable. But in case somebody (or Sasha's ML) decides it is, I went
out of my way to include relevant commits and an explanation for the
somewhat odd dual Fixes:. So no, I don't think Fixes implies or should
imply Cc stable - and I think this is all consistent with
submitting-patches.rst:

  Patches that fix a severe bug in a released kernel should be directed
toward the stable maintainers...

and

  A Fixes: tag indicates that the patch fixes an issue in a previous commit.

Nothing says that Fixes is reserved for -stable material.

> I believe "Fixes:" should be used only when changes have some
> runtime impact. 

Perhaps. But it's hard to make the rules completely rigid - suppose
commit A does fix a real bug and is backported, however, in some configs
it introduces some warnings; that gets fixed by B which doesn't change
generated code. Should B be backported, or should the -stable tree(s)
live with those warnings?

"Fixes:" should not be used for changes that
> just silence compiler warnings using W=<123>.

I tend to agree, but that's completely irrelevant in this case, as this
is not a warning that only appears for W=<123>.

Rasmus
