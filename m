Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDEF6052DF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Oct 2022 00:14:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbiJSWN7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Oct 2022 18:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbiJSWN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Oct 2022 18:13:57 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79031C117F
        for <linux-usb@vger.kernel.org>; Wed, 19 Oct 2022 15:13:56 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id i65so15773027ioa.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Oct 2022 15:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qQeR0ieP3s5ZVzO3+vZRqufO+WICMvatnDl9VCVTCfU=;
        b=ZyFnNe7t2+atLC5f/yFrHkOY+RyYcl0YQ1IaPN8bt9eQ/jPJ4oxmXGzi8XqO9mIhj7
         f3tnPJ33gRG9dZF1yFPgPaNhpV0h+bRTpU0Yc9emdgmLERqZZAT7c0GGXcEnivMbwmgT
         LlnKSIqcqaVNzXymgrL8OiEj2J39GdgZe8F36r+vhJfPvoSadpfnREDmLYHlfslRLvpD
         UO/AHbbLUI5zP/i+T8EfRlUuwbUFO1mcnvv3tyOXc7B/Q32EpAoOjYle3Fdincff8d56
         WuPQSUNfwEer7gDfrJomC7mQvnQUUAiYv6Y3LafPTrTzMyPm7MvqosoFIOrOZZWlabqT
         7arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQeR0ieP3s5ZVzO3+vZRqufO+WICMvatnDl9VCVTCfU=;
        b=dkDC/FnLeU5rlbx5Hbt86DFf3AuUW3hopoPSD1y1AWMm/qPOJNW0lCqsJvfffPNpw/
         K748jk3lqwtdQaSgnmMtRcbuZIE/ypExopea2KhVNgcrcEKqX811o9D2uC0vl7USnrHh
         UHwXd0+I315y3HE9uXor58EkdYRn2XBvUtvtqxdNlCTU4WtbJea45yIP/pwRFK5W4RA7
         yB6H3kU4DFGHlutWyv9VkV+KaxBsEmEw27KFzxpOEkhsQXMnvtoKhjpseYEz0NRO8zku
         /KRc5OZVsfHcujgI/lWBH6xoPwgHnJDsx8HS4qnPrnDtLP/+G8eq61WNFF3xMyMpJpem
         Q99g==
X-Gm-Message-State: ACrzQf30O20Hm4TkoTVPS7NKqYMoNURVdcx/Yt2S01iJC0EnKIv36LIG
        25z0JWyTPflC1PfmGwo1P2D7mlezcmdbaINbRh/5rys7xhg=
X-Google-Smtp-Source: AMsMyM54N9Lz9ZtAszShkkaH1Z8qxB8JBgLkajf4AUFI4qlNwEZ1KYbMEBLvZOeK8DGvVhekPQf44UK9Ut3NYXjqhUk=
X-Received: by 2002:a05:6638:4803:b0:363:c2ad:878 with SMTP id
 cp3-20020a056638480300b00363c2ad0878mr7370165jab.230.1666217636004; Wed, 19
 Oct 2022 15:13:56 -0700 (PDT)
MIME-Version: 1.0
From:   Avichal Rakesh <arakesh@google.com>
Date:   Wed, 19 Oct 2022 15:13:44 -0700
Message-ID: <CAMHf4WL66dTxkadqJh3aHTdrnur6svpx0z9CVK4+kg+dRKsCjQ@mail.gmail.com>
Subject: UVC gadget driver not working with other gadget functions
To:     linux-usb@vger.kernel.org
Cc:     Jayant Chowdhary <jchowdhary@google.com>
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

Hey all,

Disclaimer: I am very new to the kernel space so apologies for any
newb mistakes.

I am working on trying to enable the UVC gadget driver on an Android
Device. The device already supports configfs and has a few gadget
functions already working. ADB (f_fs) and USB Tethering (f_ncm) are
the ones I tested with.

I added CONFIG_USB_CONFIGFS_F_UVC=y to the kernel's config, was able
to create a uvc function following the example in
https://docs.kernel.org/usb/gadget-testing.html#uvc-function.

After symlinking the uvc function to configfs, when the gadget is
pulled up I see that all functions including UVC are bound to the
composite gadget without any errors. However, while the UVC function
is linked, no other function can communicate over their endpoints. The
host is able to enumerate all the functions, but is unable to read
from or write to non-uvc endpoints. Removing the UVC function from
configfs and pulling up the gadget again restores all other functions.

Testing the UVC gadget shows that the UVC driver is functioning
properly and a linux host is able to communicate with the UVC gadget
over V4L2 as expected.

AFAICT, there are no kernel logs showing errors in reading/writing to
endpoints even after enabling debug logs. Some rudimentary debugging
shows that the endpoints of other functions stop responding if the UVC
gadget writes its usb descriptors to its usb_function in
uvc_function_bind. I stub out all functionality from the uvc gadget
(except alloc and free), the other functions work properly. But if I
unstub uvc_function_bind to go as far as writing the descriptor in
fs_descriptors (f_uvc.c, uvc_function_bind line#713), the other
functions stop working.

Is this a known issue, or am I missing something obvious? Any help
would be appreciated!

Misc info:
- Kernel Version: 5.10.107
- USB controller: DWC3 (unfortunately, I don't have devices with any
other controllers available)
- Changes made: None. The gadget drivers show this behavior without
any changes. I tried to copy over changes from ToT
https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uvc.c
which fixed some crashes, but this behavior sticks.

Thank you!

- Avi
