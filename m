Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15FD221E6F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 10:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgGPIcN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 04:32:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34534 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgGPIcN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 04:32:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id q7so6233566ljm.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 01:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rwzhtqtjzpycPNdfJSvE0JwSP/0ugmgIfYcFeosUKYg=;
        b=R/BQ6jslMjrGtjxH/33QDzozBgsXhvOVgVytNe9V2i1io8kq9qhLN00zh6Qsq+wec4
         OcYnHzR6JKxctHYfwEW9zBGUMzzIIeSvz1SNFIQpHrIwnQa5FfBxxfPa/8PIl7BqBzIV
         zshwEvmA1rcG+3EXlB8oGhCmpooghLZxvMef2JuF5iDn42Yh+N+0ftxhnjhSnpwN1ANW
         FqfzS8nSY6CUXOr7F80QCtFLHk4WnzsxUCfbPsPwWOpkax5Q73CBnuRVTU/Pd5wCgkV2
         ++a79sM9UtRO+FD1RJ6pIcTzljTb9oWnFfHquU2ReoZyBUVueAuBaqZlracI4R+NreGO
         MSDg==
X-Gm-Message-State: AOAM531VPrEpX0DjzzbbNKSEseu257+eJMsXB6K+cJ+5eCL0iTR4GBV0
        ceBnO7LbQpqRJxspxk7hd+p96bTfp1k=
X-Google-Smtp-Source: ABdhPJzCdWTQmPQaBlso4WkBDKc/Gy+dhKATetC79PYH8egUE+vgk/2sEESfA2zDjeiKVLkqWurXJw==
X-Received: by 2002:a2e:a173:: with SMTP id u19mr1586260ljl.263.1594888331163;
        Thu, 16 Jul 2020 01:32:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id p4sm176870lfk.0.2020.07.16.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 01:32:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jvzJa-00052r-ER; Thu, 16 Jul 2020 10:32:26 +0200
Date:   Thu, 16 Jul 2020 10:32:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] USB-serial fixes for 5.8-rc6
Message-ID: <20200716083226.GA19339@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here's a fix for 5.8 that should go to Linus this week.

Johan


The following changes since commit da6902e5b6dbca9081e3d377f9802d4fd0c5ea59:

  USB: serial: option: add Quectel EG95 LTE modem (2020-07-07 17:40:52 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc6

for you to fetch changes up to e7b931bee739e8a77ae216e613d3b99342b6dec0:

  USB: serial: iuu_phoenix: fix memory corruption (2020-07-16 10:20:21 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.8-rc6

Here's a fix for 5.8 addressing a long-standing bug in iuu_phoenix.

----------------------------------------------------------------
Johan Hovold (1):
      USB: serial: iuu_phoenix: fix memory corruption

 drivers/usb/serial/iuu_phoenix.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
