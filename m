Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CCA1DB106
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 13:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgETLH6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 07:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgETLH5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 07:07:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17573C061A0E
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:07:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so2685690wra.7
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2020 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YcApV0ktAwcxZ9YjjmzzFtotvOKMLRuGtaHkzLpdQME=;
        b=ddDDoIZSiVJxXkYXhD8Qa9QvtWW7cmePUgj9JSx7cw/OqKw9sYITOR8jwsYgJnowDQ
         +EOtLjdCfZH5X39RMnsD6gTI4vWNTWGICEDuId8EHMT/S7YZfbTHCffoXDnc9ESSRFH0
         CjryASN41DgVwdgItfWwfqhh2v6d8Trnj5HhDQ/EXx0LJcQ95RvmuCTUiMJtTQrj/B/k
         dfyjx8tCoocOXQviJTMZg/uf2wcqlzm1bNyksQh+hrgeLE9nL8KRCjq0ndj+J8ZUat6m
         s0dZ/3SzMM4QaPdNeSk9qBbSroYBJrWZelvCWVa9eCH8wbGgYh7AU/P9lGx1VFLAXvSY
         r4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YcApV0ktAwcxZ9YjjmzzFtotvOKMLRuGtaHkzLpdQME=;
        b=oYnH7pGQddOb9TQmj67Wm5d3PNLORyGBLJ0ySnhwPp9C2H8xjecd/ye6CUcs/8CfBh
         PeS7cdgyxXWZgRmTyygswnN9AOk+llb9UkA0c+T9sqYEAKlH15MBOpDEVawEcPga+PPK
         okFO9XgRhyVDm/IStnEZgUjn186INVhobXdo5N++n0OcHltsmgVb19g8Erw3pItQ0gIc
         aTy1KlnPifdhd2lOfpN3BNYrDBH35FeeirnGgwnHRXil8FOujDNmorpCkWazBfY5mvXp
         Wfultzkh5EcsRij/Z6FGkFd+PLWKroaBwtSTTWyVpsdP9yRPg6bkBFk2gioRKW09CLcL
         vJiw==
X-Gm-Message-State: AOAM531PB69a1ZJqgYFIGHhOp4Tgst0WhuBob2Cjypk0w23j07EwX8ru
        RoHmDmquLMGlE5+J8byHNRZi3zzwPHU=
X-Google-Smtp-Source: ABdhPJwb5tLeqbYdQYkNIEqr7R1FBIlRkNsyJGy3R0VD8YC5Y95GBVXZ3agTbcg66oOKj/5G51F0yA==
X-Received: by 2002:adf:806e:: with SMTP id 101mr3728259wrk.225.1589972875817;
        Wed, 20 May 2020 04:07:55 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id f5sm2507682wrp.70.2020.05.20.04.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2020 04:07:55 -0700 (PDT)
Subject: Re: [PATCH] usb: typec: Ensure USB_ROLE_SWITCH is a dependency for
 tps6598x
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20200520100526.2729-1-bryan.odonoghue@linaro.org>
 <20200520103542.GF1298122@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <c1b5a729-6b2a-9c91-6ed0-94ffbc529fcd@linaro.org>
Date:   Wed, 20 May 2020 12:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520103542.GF1298122@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/05/2020 11:35, Heikki Krogerus wrote:
> On Wed, May 20, 2020 at 11:05:26AM +0100, Bryan O'Donoghue wrote:
>> When I switched on USB role switching for the tps6598x I completely forgot
>> to add the Kconfig dependency.
>>
>> This patch ensures the dependency is there to prevent compilation error
>> when role-switching is off.
> 
> There are stubs for the those functions, so there should not be any
> compilation errors.
> 

That's what I initially thought too, then I saw this.

git show da4b5d18dd949abdda7c8ea76c9483b5edd49616

but looking at role.h

#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)

int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role 
role);

#else

static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
                 enum usb_role role)
{
         return 0;
}

#endif

That should work.

Hmm, let me see if I can figure this out...
