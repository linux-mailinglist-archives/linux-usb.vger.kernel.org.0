Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59E33DC8EA
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 17:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393628AbfJRPjo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 11:39:44 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44362 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbfJRPjn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Oct 2019 11:39:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id m13so6658328ljj.11
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2019 08:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=iwIbrTHXchbXdc+S2ZFnSqcfpfx818M/JpjBz85MxSQ=;
        b=peshR7HXvw83r++XR15JpZemeNHq2gSi/AnGExgzp3T3HqnsTZwu0e8klLQK69XS3N
         84UfMnZc5+7zVWWw1xcwI20M1RAK+U55p6722x9XZWhn9ft9fF7wPiufOl9Jox0ii5Go
         JyGMB7unq5Wx42gAv4A+DbdB5x/pQHcAzVaZiwhzsKHOsvgvoYzE8nFsmMm1hNkwjHBi
         bB7SeO3uwxlzyKHvp4n3E5ZW0rLcj+yJ2wyXJ5bdGVO2vVHJPOFK+jJ5HhLWKApvro4M
         XN3m9TtPaov3T9ZnAaoZYRssKjeMibnwagXZ/ICIZZDKecMyUKgNRp16gu9ttsZOZL7m
         ucjg==
X-Gm-Message-State: APjAAAV0aFf3rLETMEirMcjdmBtAGNRj2t+qpMTd/Or/ZNewF4VMJOGf
        1ACpAKZBhgdlpk0E8o60xbY=
X-Google-Smtp-Source: APXvYqzCh25GrU2ohIU2tv7bEPLQ/6beLDkyVIl1M+ff9gLyHYpifnL5LBWvVillDIeyRCvrDKD9xw==
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr6541038ljh.2.1571413181862;
        Fri, 18 Oct 2019 08:39:41 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id v203sm3043710lfa.25.2019.10.18.08.39.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 08:39:41 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iLUM5-0002kW-Hi; Fri, 18 Oct 2019 17:39:53 +0200
Date:   Fri, 18 Oct 2019 17:39:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.4-rc4
Message-ID: <20191018153953.GA10551@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.4-rc4

for you to fetch changes up to bc25770f00d3f4e7482278f9823c2c2793605484:

  USB: serial: ti_usb_3410_5052: clean up serial data access (2019-10-16 10:29:23 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.4-rc4

Here's a fix for a long-standing locking bug in ti_usb_3410_5052 and
related clean up.

Both have been in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Johan Hovold (2):
      USB: serial: ti_usb_3410_5052: fix port-close races
      USB: serial: ti_usb_3410_5052: clean up serial data access

 drivers/usb/serial/ti_usb_3410_5052.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
