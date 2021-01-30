Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9063094EE
	for <lists+linux-usb@lfdr.de>; Sat, 30 Jan 2021 12:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhA3Lgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 Jan 2021 06:36:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:57970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhA3Lgp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 30 Jan 2021 06:36:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9ED0464DDF;
        Sat, 30 Jan 2021 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612006564;
        bh=65eiw5qwXikW03buk04a6R/jl2CKi3kW0+qqThJ/Kr4=;
        h=Date:From:To:Cc:Subject:From;
        b=D91Brh4/9Sk6Zs0xoNKjY2ggdNb+PruA3mBiG3TuYgZnnms/HZsvsmaRXAmOdy6Lc
         cpUUW/CC9dZzPd7YzSbbxOwU7lPgb4NhLTrda4lmoNaWX28kG5Om4CwXPMho+RqRjG
         sUeeyo0EjzLIu0qhRjF2RaRQapNTGdi1MoY0YFAw7/U5Xkx81yT8t5CENIJNh2m+yh
         u1l/Lk8/JfsAeIqvsLnOsAFkP9r1Xz1QdXMbrzPweVHtosiWTOpt+oq0expcg+Rmmd
         p/KmktTfhhl1w5JfuFCIAr2K0DcqoYPRuut1xR705yqcf6rWN6KMHdTYs/HsXlgsbr
         r6AFStrxNnZ/w==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l5oY7-0006zg-Bb; Sat, 30 Jan 2021 12:36:19 +0100
Date:   Sat, 30 Jan 2021 12:36:19 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.11-rc6
Message-ID: <YBVEs0w9H5xcvtC4@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are some new device-ids for -rc6 that I had meant to send you yesterday.

Johan


The following changes since commit 7c53f6b671f4aba70ff15e1b05148b10d58c2837:

  Linux 5.11-rc3 (2021-01-10 14:34:50 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.11-rc6

for you to fetch changes up to e478d6029dca9d8462f426aee0d32896ef64f10f:

  USB: serial: option: Adding support for Cinterion MV31 (2021-01-28 08:44:05 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.11-rc6

Here are some new device-ids for 5.11-rc6.

All but the option one have been in linux-next, and with no reported
issues.

----------------------------------------------------------------
Chenxin Jin (1):
      USB: serial: cp210x: add new VID/PID for supporting Teraoka AD2000

Christoph Schemmel (1):
      USB: serial: option: Adding support for Cinterion MV31

Pho Tran (1):
      USB: serial: cp210x: add pid/vid for WSDA-200-USB

 drivers/usb/serial/cp210x.c | 2 ++
 drivers/usb/serial/option.c | 6 ++++++
 2 files changed, 8 insertions(+)
