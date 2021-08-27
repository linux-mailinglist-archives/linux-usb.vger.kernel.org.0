Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856FF3F96F7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 11:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244591AbhH0J3o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 05:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244689AbhH0J3m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 05:29:42 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DE1C0613CF
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 02:28:54 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id q14so9421855wrp.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=5lo+c75WITWGVsOXanb8PiJWTJUpIoissKR9quVbi4U=;
        b=wjW+g+aWTIDrNPkQ5Hk0RyoHOuL+2avJKZtQxUV7lm/BHWLktYY3RS6eBRcrof2CKl
         sseeXG/wsdpJ6BXY+Yd7HNE6ZEsenXc55m6E6h9qVXiaIy+mIgNXWRsXd+vACnxHkf8f
         0aoZ8UVVvgWPP9y7TLXKNkdJem6Yzhj6wqiT44k2/A92ECqqBf+ThV9bD2/TtKDdYD8u
         xdnuo130INgil6XQFbQ+SGzIbfNWs3Jb3mir3q0SlAzwFIjc/MdnloyEuUVitAr53swS
         NYyZmCEPVj9nGWw/BCRRcPGWZiX+AHSsqTzR3rD4pQQaJ4Lc4pI9HbmbPTnXq5vZmn0o
         ri9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=5lo+c75WITWGVsOXanb8PiJWTJUpIoissKR9quVbi4U=;
        b=bBxTM2brSpuQJ/hpLu9ybcNQm736UpUOqO5H8U+QyEkad7eT9OZ87EjM0s2Ghj0upg
         8iEsY5GygNf/c4/+GoXgROcbEctrLRQMEmJydejfCTlL6J/b0iN8tsJpuet43aNwGUO5
         ORj7evdDh6NQeO28RCObrfXwjrPiK/5DiKUzY7qlIQDM5cuL3sVDpLl1ixNN0Cq3w5rs
         8PdbJPPe1vCioYPaeNig/0ewXpYxmCWDlyk6xWHy5GYnBw+TmNBhM8VKSiNdIkpQtdUt
         wOEC3KIYJzhkgPyz6Pn/Zw1UEiGnWFWhstpfCpiHf0D+HanyUCNwPZSxw8FjiMISvlRe
         Qd4Q==
X-Gm-Message-State: AOAM530hH8IRL3G4VRr3VL9EE3M/7dc7zTQ3IBdgXgvKj1Zj3kBJTOBs
        UbRUVMMN1RLo60lbn+zzICEluQ==
X-Google-Smtp-Source: ABdhPJwwzt6hFISDBU/25EiAetYkeG5VheDNYkHxSkfFfHja8HDeZ3pEoknmF35BlW8n+fP2KS9qrA==
X-Received: by 2002:adf:c38c:: with SMTP id p12mr2068576wrf.113.1630056532752;
        Fri, 27 Aug 2021 02:28:52 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q17sm5815463wrr.91.2021.08.27.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 02:28:52 -0700 (PDT)
References: <20210827075853.266912-1-jbrunet@baylibre.com>
 <87a6l39us6.fsf@kernel.org>
User-agent: mu4e 1.6.4; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Ferry Toth <ftoth@exalondelft.nl>
Subject: Re: [PATCH] usb: gadget: f_uac2: fixup feedback endpoint stop
Date:   Fri, 27 Aug 2021 11:26:57 +0200
In-reply-to: <87a6l39us6.fsf@kernel.org>
Message-ID: <1jfsuvw817.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Fri 27 Aug 2021 at 11:05, Felipe Balbi <balbi@kernel.org> wrote:

> Hi,
>
> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> When the uac2 function is stopped, there seems to be an issue reported on
>> some platforms (Intel Merrifield at least)
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000008
>> ...
>> RIP: 0010:dwc3_gadget_del_and_unmap_request+0x19/0xe0
>> ...
>> Call Trace:
>>  dwc3_remove_requests.constprop.0+0x12f/0x170
>>  __dwc3_gadget_ep_disable+0x7a/0x160
>>  dwc3_gadget_ep_disable+0x3d/0xd0
>>  usb_ep_disable+0x1c/0x70
>>  u_audio_stop_capture+0x79/0x120 [u_audio]
>>  afunc_set_alt+0x73/0x80 [usb_f_uac2]
>>  composite_setup+0x224/0x1b90 [libcomposite]
>>
>> The issue happens only when the gadget is using the sync type "async", not
>> "adaptive". This indicates that problem is coming from the feedback
>> endpoint, which is only used with async synchronization mode.
>>
>> The problem is that request is freed regardless of usb_ep_dequeue(), which
>> ends up badly if the request is not actually dequeued yet.
>>
>> Update the feedback endpoint free function to release the endpoint the same
>> way it is done for the data endpoint, which takes care of the problem.
>>
>> Reported-by: Ferry Toth <ftoth@exalondelft.nl>
>> Tested-by: Ferry Toth <ftoth@exalondelft.nl>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  Hi Felipe,
>>
>>  This solves the issue reported here [0] and makes revert [1]
>>  unnecessary.
>
> awesome work! Thanks
>
> Acked-by: Felipe Balbi <balbi@kernel.org>

Forgot the fixes tag

Fixes: 24f779dac8f3 ("usb: gadget: f_uac2/u_audio: add feedback endpoint support")
