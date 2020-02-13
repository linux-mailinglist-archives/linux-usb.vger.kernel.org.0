Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2CD315BD48
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 12:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbgBMLDV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 06:03:21 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36413 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbgBMLDV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 06:03:21 -0500
Received: by mail-lj1-f196.google.com with SMTP id r19so6097016ljg.3
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2020 03:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=JZJvSd/FZbqGrT+BQs3YJUE8Q8wSSygWWMZFsiDGMg0=;
        b=aboIECdbKNqNF/rX+PZCqyN+EyPYwHBqCllcPWnTXngiXn9YDvh/i06+19s1xeoOFI
         lKPLNn/4KUR74f5x69uvdJsacgGYwuos3MltYah9G01PGH/wnUD5uddJ8v4DHB83wWE5
         l6txxDtMOm90Pzrge0MGYZ40kTjnWZmzVulz/1csJZO3nVnp4vm/5ooOLqBzAujrGf6N
         KFbXwKgIr5Ky1UkfAKORUu9Hoh51v3m3QWyLS1+2wzySnvk5hzoWRmSmYmVgZGyQp2gJ
         eFx7GyokfFqP4n7brh3K5CYBN7SR9iM7Po/tktAbkiUBBsTpF9nUWi8MT3cdYIJLJZ1o
         UIYQ==
X-Gm-Message-State: APjAAAW08VuEeT/Czv+tK7R4zOeWOsuHCsxOTspYHL8Pb5vRoqg3JsXL
        Y+Af0Bt3WSoqSH09J0yph5Va0JHH
X-Google-Smtp-Source: APXvYqwnSTul3x8zXeTbe3hF1UyGK6duEq8vK4kw17hAbVsZbfnD9oKfcdAWl+nUnEUqd/Ake3/b2w==
X-Received: by 2002:a2e:9013:: with SMTP id h19mr11077587ljg.223.1581591799329;
        Thu, 13 Feb 2020 03:03:19 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id o69sm1072242lff.14.2020.02.13.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 03:03:18 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j2CH8-0004Rs-Lv; Thu, 13 Feb 2020 12:03:18 +0100
Date:   Thu, 13 Feb 2020 12:03:18 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.6-rc2
Message-ID: <20200213110318.GA16245@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.6-rc2

for you to fetch changes up to 7c3d02285ad558691f27fde760bcd841baa27eab:

  USB: serial: ch341: fix receiver regression (2020-02-10 10:10:35 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.6-rc2

Here's a fix for a ch341 regression in 5.5 which people have started to
hit, and a fix for a logic error in an ir-usb error path.

Both have been in linux-next with no reported issues.

Signed-off-by: Johan Hovold <johan@kernel.org>

----------------------------------------------------------------
Dan Carpenter (1):
      USB: serial: ir-usb: Silence harmless uninitialized variable warning

Johan Hovold (1):
      USB: serial: ch341: fix receiver regression

 drivers/usb/serial/ch341.c  | 10 ++++++++++
 drivers/usb/serial/ir-usb.c |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)
