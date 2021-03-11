Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97B4336DF4
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 09:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhCKIkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 03:40:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:39076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231517AbhCKIjv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 03:39:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9FDE64F9F;
        Thu, 11 Mar 2021 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615451990;
        bh=HCqecz1lS3f45612837ihs7asLjFXsiNQHQv1wNOL88=;
        h=Date:From:To:Cc:Subject:From;
        b=BqD6QXeyHEFw2XEMBcUD4p7dRuYLcZgvicujXMqVIQLDap3lNqxrePuD+1uVgGOtp
         uNzl9G3aOjWoQ+7agauWSUzgAJE60lF33EnSuBrUxGxVy/siTQosWTBss/qGbcUOeM
         o+G4YoSgyvP2g4GS+VsBQHwMjUhZ17vIxpW5iSvl7iayanImy2sjtf8E6IsnKhV2Jl
         5gp6r04MO6VQBKm3jnFPdt6i9QM+IARApmPexOOtzpKe+kijdQ5vq97vHVVk0PfKGj
         8rmT+fqxH9d8Wcx3XdjSaSYza9fSRKYXyFcuY0E+yTmznFL6igAiBCngefg8D673e/
         rC2jP6C9CrskQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKGrR-0002jM-An; Thu, 11 Mar 2021 09:40:01 +0100
Date:   Thu, 11 Mar 2021 09:40:01 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.12-rc3
Message-ID: <YEnXYe6HUrK+mysK@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.12-rc3

for you to fetch changes up to cfdc67acc785e01a8719eeb7012709d245564701:

  USB: serial: io_edgeport: fix memory leak in edge_startup (2021-03-09 09:05:37 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.12-rc3

Here's a fix for a long-standing memory leak after probe failure in
io_edgeport and a fix for a NULL-deref on disconnect in the new xr
driver.

Included are also some new device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Johan Hovold (1):
      USB: serial: xr: fix NULL-deref on disconnect

Karan Singhal (1):
      USB: serial: cp210x: add ID for Acuity Brands nLight Air Adapter

Niv Sardi (1):
      USB: serial: ch341: add new Product ID

Pavel Skripkin (1):
      USB: serial: io_edgeport: fix memory leak in edge_startup

Sebastian Reichel (1):
      USB: serial: cp210x: add some more GE USB IDs

 drivers/usb/serial/ch341.c       |  1 +
 drivers/usb/serial/cp210x.c      |  3 +++
 drivers/usb/serial/io_edgeport.c | 26 ++++++++++++++++----------
 drivers/usb/serial/xr_serial.c   | 25 -------------------------
 4 files changed, 20 insertions(+), 35 deletions(-)
