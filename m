Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2E144ADB
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 20:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfFMSix (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 14:38:53 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:42431 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbfFMSiu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 14:38:50 -0400
Received: by mail-qt1-f178.google.com with SMTP id s15so23723923qtk.9
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2019 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=XUEHXUSNmyMi32vrOhUKl+mDbcbWi1zRqECCE0hmxew=;
        b=UUDhyaYYhO2gE0wGK71phcvyB3iZnqs2ztAyH6sWrxETKIAY8hYDjjaGTVYRPYg3eh
         kS67yzT2cNBhw+GUtQjPLGOJRN7aDI3t3fKJ3WB4epbxQ64O6DmH1p2B9Nd/icQiItEC
         Pw4VrCprrvQbaEyJyWwex5OFP852Kw1Y120HTFQvN5wVgFDEwWf298Vo9YhWJ5gxpmq9
         5vLmcjuyQ5MB/tIsY6NIt3C+Y3teYuOcA3pBbgVhizrR08mLUp+uAr7z/p3qjXhKYh4V
         EaFHuVbY4ZHk65qpLk7pyDpKusOvx3ai/3sUaOXLYHljWrH7R99qN9ES5sNrkVs3DyvO
         HAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=XUEHXUSNmyMi32vrOhUKl+mDbcbWi1zRqECCE0hmxew=;
        b=GsEOf3RpSJinHEyuaTzg8c48+Ihx8BO+0UFzLrzRAc41KFfI9TmCLZDgCcgV9LAOeB
         E1VlCXbjjhxXvwRRdRXxyHEcEfxE3cq+1A8uUxmtplZdDiMMW2Oxl9BXt2XU8whEet/z
         scxrQZ/ykQ9P+6d7/fYanCRnsQ/ILACH+pqYIeGJBhIRP2d361qnDzgrJFJBmqGLFdzk
         KCcJXW5w76LehHoU2XrULDS0/twnT+2nBrlWoolJC0HO0sF4aJW+cWZdxI390EQnjb51
         Bm8mL4NBIoWEGIh3x40D0z1QomdtbPy+0xgGK8KAGWo/DkWiAXTT9fLdWxZ9n9WwmNep
         mN6w==
X-Gm-Message-State: APjAAAVbW7vwy7tF1vz9Sqg4Lfdnu/EP5/86tF79mPoEmIfVea0T/3ko
        rK6TzKF5cqf/0rVa7CflQVGYb+sjmu5WM4H7gQZYnQ==
X-Google-Smtp-Source: APXvYqxaEnkAxv8FL6q2bCba4yHlGp0pIrIe0vfEwYtoOcNefWuszN34Y2cCx+IxMc/v6LrmKqsQiveMw5hlD7isnAs=
X-Received: by 2002:ac8:3037:: with SMTP id f52mr77218114qte.364.1560451129073;
 Thu, 13 Jun 2019 11:38:49 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Thu, 13 Jun 2019 11:38:38 -0700
Message-ID: <CAJkfWY4nKwyPDh=MuCURst2SZceceeR2v3qrT9UY=VbvLnEmFg@mail.gmail.com>
Subject: Cleanup of -Wunused-const-variable in drivers/usb/host/xhci-tegra.c
To:     treding@nvidia.com, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey all,

I'm looking into cleaning up ignored warnings in the kernel so we can
remove compiler flags to ignore warnings.

There's an unused variable ('mbox_cmd_name') in xhci-tegra.c. Looks
like it was intended for logging or debugging, but never used. Just
wanted to reach out to ask the best steps for cleaning this up.

If the variable is no longer needed I'd like to send a patch to remove it.

https://github.com/ClangBuiltLinux/linux/issues/533

Thanks,
Nathan Huckleberry
