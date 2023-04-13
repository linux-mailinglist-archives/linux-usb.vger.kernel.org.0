Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 242566E0776
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 09:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjDMHQS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 03:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjDMHQQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 03:16:16 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383274C3D
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 00:16:15 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id bv65so6959199pgb.8
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 00:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681370174; x=1683962174;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vYZbFMKxz28xz7A0mtS0bwU18hIvF65dG1fHNHuoAR0=;
        b=SjtAeurd6d5lokreAYId2Nm5VtiDKg9LZPUivcSXsBc1dnQ3kTnQb0KXTIprMz4TrK
         rpnkHVGYfScoPQ36Fbq9cotWUZyAv7Ri2ow7G0aUxf+VFl/2sNX/pay+EPqtpmUyv7MV
         DHsLjs/SXgBSH1bQ1EDdrnNy6xNTVR5vWVZwiz7yZWGPafhYqVXcwabnDqbxhCL2XQDV
         fn1H7XPRG+MhEmAfTMl+pQGD2DLR+cqBw7hlr2U+WL7/4fEGShb9f3kswFQnSqXcl2Em
         tcZgh/v1ckcqYLdNqyDGwCOGffGlaNsjcFJaXOEFv0oLV24GIJOeXs9u2RvoncTDCL8F
         3vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370174; x=1683962174;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYZbFMKxz28xz7A0mtS0bwU18hIvF65dG1fHNHuoAR0=;
        b=GIVMzmS8wV0cIwL3ET8h2924ISvnBrT3eJSd2yH6IuE18O/Lz0lpJDcXdxS732qn1o
         aH1qDNvzV5m0bjlSYzmSH35+WqssG9fi1zPrxMmB1/hNiDZeMFd06b20Qz0ng9O3kca7
         Ped+DixPzesUOX8AELaWacirsUQEvbz2Rp7Lq1Q8/tY8rfdlETmvwfUJnFC0cz1PqQao
         sMUTBFMxmTgkAMt8K4HiZddw58/MSuJJJcwEFdk8VOfpCIVnHUq37ZY35BKcYt+KwQk9
         UFbnvLA5ersDno6ey7Ffj92rxzZM2lAqVEtmo2MJ0dXtRcjWFVvndBfeCv0hPBcA3Ovj
         LOWg==
X-Gm-Message-State: AAQBX9dNhRuY1Mjc5ws99hsqj08XzqE+aBrJ+4ROgpYtRjb4mD2KpdtE
        fYbrhEeuTt9NgPYHiu8AOo9UgJ5nOZW/cPVNDYA=
X-Google-Smtp-Source: AKy350b4qGnMTwOPVqwMMM80HP5/EeCHZnb7YO4fqdmidGhH/kuYs4kuNaVs1bLwUm60yHk/UqN8Q5LOOFOC2IyhzoM=
X-Received: by 2002:a63:5505:0:b0:519:a34:7380 with SMTP id
 j5-20020a635505000000b005190a347380mr189546pgb.10.1681370174567; Thu, 13 Apr
 2023 00:16:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:902:f708:b0:19e:2fbc:7dfd with HTTP; Thu, 13 Apr 2023
 00:16:13 -0700 (PDT)
From:   Aluminum Corporation of China Limited <onyeoma2426@gmail.com>
Date:   Thu, 13 Apr 2023 08:16:13 +0100
Message-ID: <CAA2bfVN1asJz+gi=0OJGCVV5sOff8afMPn2knM5eWPbMZHWm1w@mail.gmail.com>
Subject: Purchase Requirement
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,

Kindly confirm if your products are available for delivery as we are
interested to purchase from you.

Waiting for your confirmation.

Thanks
