Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6C22A98B4
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 16:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbgKFPns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 10:43:48 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39369 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbgKFPnr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 10:43:47 -0500
Received: by mail-lf1-f67.google.com with SMTP id r19so215514lfe.6
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2020 07:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=he6Ed5X9t50FbKaOzVGUyvi7SobvPUUyITFNqG8Jobo=;
        b=qK/g+3zyPsYmOpX0qcG145jMMDDBTpYNpcrLxmxUB7soEOQqNl66HaNB3YtVLc1T+7
         1PqX8P03w7/9viI8q4Z2lF2j9Dt9xI+jgRib+WejhuXo3MNt3wcKMRHc7dV/DMgm5dci
         QN/ZIr94NqQdfoD0rVqLLi4WP/902e/1osot6I8YwFUujWUumUJkYPloSZZDlVDceb7k
         mjqeHMiCqVKNHQEZTaD8l3rZBZoF9mT0H1Myrhcg2JaICKLaHtFM0jwGoYA5SHXNBKjT
         zufUVXX8v6RmO9WmIar5uIEE8ByOdy9KZ3BsugR4iAJBGCj15Cemc19D7cm2em5Txmi5
         FhZQ==
X-Gm-Message-State: AOAM5311oe/inmSX+GP3sTXRVUzZ2zhspcARiNURrs7RZKrrimK/6Jcm
        lE9WNqlu54wKW8SjN5b/jR0abCkGiB624g==
X-Google-Smtp-Source: ABdhPJxnWlhCF4PCq39s0cnYkZJV+J0O8D3v/4CLAe+p8bJp9xyFxn7CcAYTL5Ww1Z8lExdMSs0xqA==
X-Received: by 2002:ac2:568b:: with SMTP id 11mr576984lfr.397.1604677425033;
        Fri, 06 Nov 2020 07:43:45 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id c22sm204853lfm.45.2020.11.06.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 07:43:44 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kb3tz-0008Ky-US; Fri, 06 Nov 2020 16:43:48 +0100
Date:   Fri, 6 Nov 2020 16:43:47 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.10-rc3
Message-ID: <20201106154347.GA32032@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.10-rc3

for you to fetch changes up to db0362eeb22992502764e825c79b922d7467e0eb:

  USB: serial: option: add Telit FN980 composition 0x1055 (2020-11-04 21:11:18 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.10-rc3

Here's a fix for a long-standing issue with the cyberjack driver and
some new device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Daniele Palmas (2):
      USB: serial: option: add LE910Cx compositions 0x1203, 0x1230, 0x1231
      USB: serial: option: add Telit FN980 composition 0x1055

Johan Hovold (1):
      USB: serial: cyberjack: fix write-URB completion race

Ziyi Cao (1):
      USB: serial: option: add Quectel EC200T module support

 drivers/usb/serial/cyberjack.c |  7 ++++++-
 drivers/usb/serial/option.c    | 10 ++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
