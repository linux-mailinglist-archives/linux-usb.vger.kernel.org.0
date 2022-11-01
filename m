Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E90615622
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 00:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbiKAXav (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Nov 2022 19:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKAXas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Nov 2022 19:30:48 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9051A807
        for <linux-usb@vger.kernel.org>; Tue,  1 Nov 2022 16:30:48 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id l6so8653444ilq.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Nov 2022 16:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7XXH3S+oTwi7Nohce6z0VIf2/A2DEMYVTX3NOfKR1ro=;
        b=qMgtrsXDWlwGj+xnIMgjzrY42oY9TpRB/uoiGTXkT+XHoSpTXnkv5nG6hfptaX+5RB
         4u7U2Rx3B8E1VeO9vRKnvKOA00RG/A9Ud1IkBKDNkALUzJc8T+HAIK0vU+Va56Hl+3Hw
         j2HWSJxNtIg+QqWktoViMG88x2sbwYB64IhRl69ufKJqud88aISCCZHxlP9Jf9Vryzxm
         /iucc5N4TsKV3VxJoGKirmZ+/ymIdEcUHc9UP2G67MQ7wQV02zX1vOMrt7A05fJ3843P
         v7EVJeu0FapUNH6WXEw2zKBa0QpcR4yMxo9rNJpBu9IxGLINeQ3+wmoVn3zbvimeq68U
         7Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XXH3S+oTwi7Nohce6z0VIf2/A2DEMYVTX3NOfKR1ro=;
        b=CrvJ880+iyB16CxUERg2kMY7Xu+ug9iDCzdZ/EEqgFP763Tbpk9QUBBtMLscysb5SY
         umA0pUuQk6ZiQ8Cn37UMW+C91TD4zrQQpB/EOSkXNK2e0YF4krf6Etj9yje5KBLF2/V1
         dZe2TcSpvGz0bixXJqVPvVdkwzAfTDHZ67S8Z5WAB2XHnX+Mukp1YOUgeWLtb7+0pNsQ
         JAXW8UXySKEi5oxCJsVMOIOXBGXaNr13Tbb4jFQLRKmS/pInhh5DT8/Wqif3DPZCcFp5
         o+sNGFetCYJhRvdbT8L4iR3sDZimjcrOrM9Hz7nc0VqspHAlMNKETXNxiMZNUqMe2akD
         Ex4A==
X-Gm-Message-State: ACrzQf3q6Kz5PqxoGX1K0JJDfgQs2DXLSOKZHLgvdQd1w4WiL7SX404T
        9iAMziIGyqGTSwOGvmZ2Hlm86W+IbhDsblXm/jDSbie7UcY=
X-Google-Smtp-Source: AMsMyM59Sq8Y+AjBbraHYTwQeXjP5pR0kvt1bHhwDNlFwYNmuUAZEvKjNktLEKU0vvEKmi7LIAMHwp0H6Jmb+TCv1Kk=
X-Received: by 2002:a92:d08e:0:b0:300:c60f:4314 with SMTP id
 h14-20020a92d08e000000b00300c60f4314mr2819130ilh.218.1667345447158; Tue, 01
 Nov 2022 16:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WL66dTxkadqJh3aHTdrnur6svpx0z9CVK4+kg+dRKsCjQ@mail.gmail.com>
In-Reply-To: <CAMHf4WL66dTxkadqJh3aHTdrnur6svpx0z9CVK4+kg+dRKsCjQ@mail.gmail.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Tue, 1 Nov 2022 16:30:36 -0700
Message-ID: <CAMHf4WJQo=56jM5WDP7bWjZqfh8mb42w0N-eka9kuCKDZ41Qwg@mail.gmail.com>
Subject: Re: UVC gadget driver not working with other gadget functions
To:     linux-usb@vger.kernel.org
Cc:     Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cc'ing Eddy for general Android expertise and Laurent as the owner of
UVC gadget driver.

On Wed, Oct 19, 2022 at 3:13 PM Avichal Rakesh <arakesh@google.com> wrote:
>
> Hey all,
>
> Disclaimer: I am very new to the kernel space so apologies for any
> newb mistakes.
>
> I am working on trying to enable the UVC gadget driver on an Android
> Device. The device already supports configfs and has a few gadget
> functions already working. ADB (f_fs) and USB Tethering (f_ncm) are
> the ones I tested with.
>
> I added CONFIG_USB_CONFIGFS_F_UVC=y to the kernel's config, was able
> to create a uvc function following the example in
> https://docs.kernel.org/usb/gadget-testing.html#uvc-function.
>
> After symlinking the uvc function to configfs, when the gadget is
> pulled up I see that all functions including UVC are bound to the
> composite gadget without any errors. However, while the UVC function
> is linked, no other function can communicate over their endpoints. The
> host is able to enumerate all the functions, but is unable to read
> from or write to non-uvc endpoints. Removing the UVC function from
> configfs and pulling up the gadget again restores all other functions.
>
> Testing the UVC gadget shows that the UVC driver is functioning
> properly and a linux host is able to communicate with the UVC gadget
> over V4L2 as expected.
>
> AFAICT, there are no kernel logs showing errors in reading/writing to
> endpoints even after enabling debug logs. Some rudimentary debugging
> shows that the endpoints of other functions stop responding if the UVC
> gadget writes its usb descriptors to its usb_function in
> uvc_function_bind. I stub out all functionality from the uvc gadget
> (except alloc and free), the other functions work properly. But if I
> unstub uvc_function_bind to go as far as writing the descriptor in
> fs_descriptors (f_uvc.c, uvc_function_bind line#713), the other
> functions stop working.
>
> Is this a known issue, or am I missing something obvious? Any help
> would be appreciated!
>
> Misc info:
> - Kernel Version: 5.10.107
> - USB controller: DWC3 (unfortunately, I don't have devices with any
> other controllers available)
> - Changes made: None. The gadget drivers show this behavior without
> any changes. I tried to copy over changes from ToT
> https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uvc.c
> which fixed some crashes, but this behavior sticks.
>
> Thank you!
>
> - Avi



-- 
- Avi.
