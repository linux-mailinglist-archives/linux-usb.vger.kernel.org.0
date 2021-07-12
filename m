Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6AD3C60A8
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 18:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhGLQe5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 12:34:57 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:38724 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbhGLQe5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 12:34:57 -0400
Received: by mail-io1-f72.google.com with SMTP id y8-20020a5e87080000b029050cfd126a26so12228374ioj.5
        for <linux-usb@vger.kernel.org>; Mon, 12 Jul 2021 09:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=g1EnsL14HF8LdZjkBNd6tkp4dBn0hH7K4Mtz8YY7q50=;
        b=mEL3hDsqjnlAHrTqbIpEEXa1y427yEWMi9mpGUHA4xAr7obBa+Y+2iEZtGzs6IhqzD
         lVZNV0FmLOiOHLB3ntb5oh5AWAUMrC+qRS+uEAGmYChdrRhxb7t7lEEM5yE5aZ7LoT3I
         mFfSpZ2ciC+duVnXwvssFNDIZhIa9qLbgxlTNy9yxObxqGjg++e/BLrK+K0B//y1WqFg
         dziENm9plHNdLfAh+zPhmWHMY8GeUQOXsCOotNuynpDe4VwCovJtbRcLmBC9REYsadCn
         RzuqdkXhecDJ/CUFkNueQ1BG324qQU1OMLxvsYAPJwBoYFEKspJOcbkaDI2K+VIg57Pb
         hnGg==
X-Gm-Message-State: AOAM533m4gaBMNx9c2VwXjRR3baqNjX7DQhfeB2PTF7IPTrwxltMmO2T
        hf8LhMu08Mq30/zt6EgWJAloWXPZpbL2MfyuT5bFMLSg8T33
X-Google-Smtp-Source: ABdhPJx1HhlhyKyd/XTamXxBtDH5sKiC6WYruOEUPDeaHoqYYaVScDTEIO+gdoCm1CaNZ7P/F+GIzgfdUW5rTygF+IPU2D3pshZS
MIME-Version: 1.0
X-Received: by 2002:a02:9f89:: with SMTP id a9mr13383499jam.51.1626107527446;
 Mon, 12 Jul 2021 09:32:07 -0700 (PDT)
Date:   Mon, 12 Jul 2021 09:32:07 -0700
In-Reply-To: <20210712161445.GA321728@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008a429705c6efa94c@google.com>
Subject: Re: [syzbot] WARNING in do_proc_control/usb_submit_urb
From:   syzbot <syzbot+72af3105289dcb4c055b@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+72af3105289dcb4c055b@syzkaller.appspotmail.com

Tested on:

commit:         ee268dee Add linux-next specific files for 20210707
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=59e1e3bbc3afca75
dashboard link: https://syzkaller.appspot.com/bug?extid=72af3105289dcb4c055b
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14b945d8300000

Note: testing is done by a robot and is best-effort only.
