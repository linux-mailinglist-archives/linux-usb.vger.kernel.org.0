Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F1F598F79
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 23:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346739AbiHRV0P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 17:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346875AbiHRV0A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 17:26:00 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97BDDEB78
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 14:17:44 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id x64so2043493iof.1
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 14:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc;
        bh=Vy8D1pkwyXAsiF4MUgRh4hwYH42zrsLDINWKukfqLXo=;
        b=KQJIUsGaq+atx0WDA+Q6GC29q+wr7kk6ZI9yxsBSeiLJM5vGupunTC77EeaW1K2itz
         g7MuiArWBexrJrcHWIaeGBh20KkvcIJRQOr/QA0pK/AfTOCXiMm5gTaAZXJHZf3Mpwtl
         a2jPAtB8rDhvhg5JBX8fi7fZe7+QfKR4PGmPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc;
        bh=Vy8D1pkwyXAsiF4MUgRh4hwYH42zrsLDINWKukfqLXo=;
        b=iaSQdpU70fB6utJK2BomoXUfreL9Ivaj5HXSVIBda36orjW59UkUVxi/AG2BoKVVCs
         Ap2xu7yFlJbMuEb0vx2m7ffdznXFYh4W04QcowsxLVwh9T6TVLt8wJ4phpFToXAMxB8d
         gyJvYakwQqYy2zxZvRSNE+dGpivyCI3DrlFX4iuig1eLOW61qoZm/aEUYQlzMZkefmtf
         vl/wlDFD8WyMbUGBlhe52aTydNmtN9MWAERJx243Lg/nx+VCg2P00LGCJ8qmO9omW5wB
         QS23ZwnqlJjtLTwcfKLEAc8nsO4w/EESXdo8WnbqKXcdvhbBLbegSutHtG0/bSfPFB0u
         o1RQ==
X-Gm-Message-State: ACgBeo0fVlfNhRZDKQRMrbcoXwlO0GzOKixC52C4SOhvaRFyf3n16pjV
        0JsRqDQjJsXKBkpKzosulFQ2Ug==
X-Google-Smtp-Source: AA6agR4bswICfvXUKfkVpv1Cfozq/7hljLHJfKR0TxubStkAuF2jjINJdZImJp8sQ2e7aRn0HqGZXg==
X-Received: by 2002:a6b:3ec2:0:b0:67c:6baf:a51f with SMTP id l185-20020a6b3ec2000000b0067c6bafa51fmr2235618ioa.160.1660857461762;
        Thu, 18 Aug 2022 14:17:41 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id b1-20020a056638388100b003416ac35529sm1022582jav.26.2022.08.18.14.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 14:17:41 -0700 (PDT)
Subject: Re: [PATCH] usb: move from strlcpy with unused retval to strscpy
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     Duncan Sands <duncan.sands@free.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Richard Leitner <richard.leitner@skidata.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220818210116.7517-1-wsa+renesas@sang-engineering.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <edda5842-fa82-dfb0-b4b2-14a83673ea6c@linuxfoundation.org>
Date:   Thu, 18 Aug 2022 15:17:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220818210116.7517-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/18/22 3:01 PM, Wolfram Sang wrote:
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
> 

Please elaborate and summarize why this change makses sense in the
commit log? It will be easier for reviewers - saves time checking
the link.

> Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/usb/atm/usbatm.c               | 2 +-
>   drivers/usb/core/devio.c               | 2 +-
>   drivers/usb/gadget/function/f_fs.c     | 2 +-
>   drivers/usb/gadget/function/f_uvc.c    | 2 +-
>   drivers/usb/gadget/function/u_ether.c  | 8 ++++----
>   drivers/usb/gadget/function/uvc_v4l2.c | 6 +++---
>   drivers/usb/gadget/udc/omap_udc.c      | 2 +-
>   drivers/usb/misc/usb251xb.c            | 6 +++---
>   drivers/usb/storage/onetouch.c         | 2 +-
>   drivers/usb/typec/tcpm/fusb302.c       | 2 +-
>   drivers/usb/usbip/stub_main.c          | 2 +-

I don't have any problems with the change itself. I would ike to
see the commit log clealrly state why this change is good. With
that for usbip change:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
