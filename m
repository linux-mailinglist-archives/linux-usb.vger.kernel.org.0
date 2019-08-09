Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C425A881AF
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 19:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436769AbfHIRxB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 13:53:01 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:48149 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfHIRxB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 13:53:01 -0400
Received: by mail-ot1-f70.google.com with SMTP id b4so70306891otf.15
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2019 10:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=zfLUeixZ0xxyCbY54z0hYvSD6TcuS24V1c/+Vq6E3hY=;
        b=FWWpMahnQIFsIWxjY5nt/eJ/CGDCx4oemjg69AEzd6vOWG/EhBmiqjkzehve0qhut+
         dgcJyBuY5d1FIGH19jdIILVGQTuJq50dov/l5V+m0S93K1qzEzPnyXwyT3dRnQqwsH82
         CYN65EoaPVDtvg6P1L9U5cdPmE6Ha+p6GEoW2agl5r9ldHqNtfO7/hHa/1Y1tXVKnpNw
         NYIBLjDAo+B5F7mwcdTAr93i4LnEzxWEC1Hl3kBlvTMycU7YZmxKCuHE9i71Xb5xcZmG
         pTBhsWuF1V9VRWyNZGngR2rHhFMr6ppWdaxGM9qe2mNlfQMpZ3O17gTcYrsQCFwT6Sr1
         1WQQ==
X-Gm-Message-State: APjAAAV4LcCyjVyCevdAGnsoIEDQp8+OVEyxyoBL9EPHATSC5JeDBPuf
        cgcRZK7PGy0MZMgxOZvXae6YGon5HyS/2R1digooKftREDSV
X-Google-Smtp-Source: APXvYqw/TXi1UjpCaVvf4WkbF4/wpHhbA67XNDTIgl03f49zVXIXcyl57HB5i3MLccYNJEphSG1rojmsMvnLyphLutfMcDYqwKX2
MIME-Version: 1.0
X-Received: by 2002:a02:1087:: with SMTP id 129mr24265518jay.131.1565373180454;
 Fri, 09 Aug 2019 10:53:00 -0700 (PDT)
Date:   Fri, 09 Aug 2019 10:53:00 -0700
In-Reply-To: <CAAeHK+wiwkC0SoGMvZgQ49dUbJE7ECpacXfPWpM4f9C84VY=zQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005cb00c058fb2d840@google.com>
Subject: Re: KASAN: use-after-free Read in ld_usb_release
From:   syzbot <syzbot+30cf45ebfe0b0c4847a1@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bhelgaas@google.com, greg@kroah.com,
        kirr@nexedi.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux@roeck-us.net, lkundrak@v3.sk,
        logang@deltatee.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+30cf45ebfe0b0c4847a1@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15b4c802600000

Note: testing is done by a robot and is best-effort only.
