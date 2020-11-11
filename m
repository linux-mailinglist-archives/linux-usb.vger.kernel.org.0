Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AFE2AFA2F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 22:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbgKKVIi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 16:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgKKVIi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 16:08:38 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD53FC0613D1
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2020 13:08:37 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id e18so3813992edy.6
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2020 13:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:user-agent:mime-version;
        bh=lDAKmgu5vfJgWqcyddHDPqIFtgiSrjvsXTxdwMbEk6U=;
        b=V4UbwjwvqS/sr9TjbqbdJSQLX5joany7fdcuurxJICBVsH7Molzu2y0cxHA6huaRon
         l+XOwbRxtxaH6uzdYOyL9rKj8JtRfzgzYmypN/rfulnTesFroBqYvuLU9NjxCZdG7LcS
         BwcOmSqguYQlt/5dOSh5UCS1sgIN1sAtNY6XCaFpQXqRBgIT4+HNiqnqP7Nm8maNeqw7
         zUbS2zNBeHDEESrulHlj9otFuhypXni0VaPx3k0WZ7gLeF0bvFTuobKv0J0DwlSyxVlj
         GN1SBpFWHu9321eT1z5W72V6mQANH3+cY578zNVeegUVJboKuIjFxqNAl/G8rSmu4fSJ
         RrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:user-agent
         :mime-version;
        bh=lDAKmgu5vfJgWqcyddHDPqIFtgiSrjvsXTxdwMbEk6U=;
        b=pdvkNPQnXZomKgx7fO7O+x5Nj1/nYkXErolhcVOLbpm6FYs/7w+3OqwbtQqZO0PLxp
         r+uuw5TuTrH64hRqwzQrycChZmouMAAzhDygJfn+3Mls2LRZeHugE9KLFW5Rn9nZ4x8g
         3xf1zr9E2eC96fMTTS6IzV9ZBToedYXOUB+JHxngzo0xk3XmLAhduKz4/0IVM+Hd7r6E
         cj70CwkIW15DNuYUMUJN9Cx9qk7qD0N6IlQFXktR07SOgogaKmzzz16WsPjLvZd3oKZM
         Sgg5Q0XHJ48bjOyWepvnFhH9/QhwRJ2TMwiw/t6zn/0rdMMEWqgAQMZUNEatGE3V/dXo
         rsfg==
X-Gm-Message-State: AOAM532dYA0M5zd5AIzStwVHXNJUidVxk5LcOi2gWYwAsdeiLW3hE+DL
        +6S6SjCmB5tG+f/zf0ow0MQ=
X-Google-Smtp-Source: ABdhPJxvxbDerqXKIBwhbVFKx5gwSeeQMJR+gZo2uycpRouFYOfeFL1dTgLmYv33XY6wzyyGrAsEhQ==
X-Received: by 2002:a05:6402:16d5:: with SMTP id r21mr1560702edx.149.1605128916550;
        Wed, 11 Nov 2020 13:08:36 -0800 (PST)
Received: from felia ([2001:16b8:2d8b:d300:a90c:1cb5:6919:1ee2])
        by smtp.gmail.com with ESMTPSA id f25sm1398888edr.53.2020.11.11.13.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 13:08:35 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Wed, 11 Nov 2020 22:08:26 +0100 (CET)
X-X-Sender: lukas@felia
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        clang-built-linux@googlegroups.com, Tom Rix <trix@redhat.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Use of uninitialized data in special error case of usb storage
 transport
Message-ID: <alpine.DEB.2.21.2011112146110.13119@felia>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Alan, dear Greg,


here is a quick report from the static analysis tool clang-analyzer on 
./drivers/usb/storage/transport.c:

When usb_stor_bulk_transfer_sglist() returns with USB_STOR_XFER_ERROR, it 
returns without writing to its parameter *act_len.

Further, the two callers of usb_stor_bulk_transfer_sglist():

    usb_stor_bulk_srb() and
    usb_stor_bulk_transfer_sg(),

use the passed variable partial without checking the return value. Hence, 
the uninitialized value of partial is then used in the further execution 
of those two functions.

Clang-analyzer detects this potential control and data flow and warns:

drivers/usb/storage/transport.c:469:40: warning: The right operand of '-' 
is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
        scsi_set_resid(srb, scsi_bufflen(srb) - partial);
                                              ^

drivers/usb/storage/transport.c:495:15: warning: Assigned value is garbage 
or undefined [clang-analyzer-core.uninitialized.Assign]
                length_left -= partial;
                            ^

The tool is right; unfortunately, I do not know anything about the   
intended function here. What is the further operation of those two  
functions supposed to be when USB_STOR_XFER_ERROR is returned from 
usb_stor_bulk_transfer_sglist()? Should the passed arguments remain 
untouched, so setting *act_len to zero for the error paths would be
a suitable fix to achieve that.

A quick hint on that point and I can prepare a patch for you to pick up...

Given that this code is pretty stable for years and probably in wider  
use, the overall functionality is probably resilient to having this local 
data being filled with arbitrary undefined data in the error case... but 
who knows...


Thanks and best regards,

Lukas
