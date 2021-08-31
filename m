Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D82C3FC56C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 12:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234263AbhHaKHw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 06:07:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234016AbhHaKHv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Aug 2021 06:07:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3730A60ED4;
        Tue, 31 Aug 2021 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630404416;
        bh=vBKj8uLJxXcc2UxAjZBzgmrjt3MP7Hx4Rn0LTrR9SKs=;
        h=Date:From:To:Cc:Subject:From;
        b=Jd5y8gtr575FEWEXQIWvnm7S5Q9EBtNbVle0NpYLuKHgS57VHdU22KGqtGKaUszfY
         4wmxD02J8sx84exsS4PS/QJ7hHtkEbxtgX3Y/y+I1gWwGOvWATRcAkQVEFIbDT61Gs
         JA+0IgG1AAh5gdmH4/BtBWhk+5mKM8gVGlGPu4G91EVyxp6aglobZhYDjUST6QaoWJ
         W+2P/jDCpEEi22wBj2XQ44jN/GixPW2+KuBT/TNF+5uFkk14PtMbvwGWCh0j0pxmnH
         kphenuIjA4bezBs07J4jSytKi1+tCfRnUqcIf5Cl5UXlTpSZGabZpT9DwQarQVb5Ye
         BwIiufD9SOKEQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mL0fJ-0007gZ-R4; Tue, 31 Aug 2021 12:06:49 +0200
Date:   Tue, 31 Aug 2021 12:06:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fix for 5.15-rc1
Message-ID: <YS3/OWl4ZlpRs1Eb@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit df7b16d1c00ecb3da3a30c999cdb39f273c99a2f:

  Revert "USB: serial: ch341: fix character loss at high transfer rates" (2021-08-25 09:13:33 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.15-rc1

for you to fetch changes up to dcf097e7d21fbdfbf20e473ac155f4d154018374:

  USB: serial: pl2303: fix GL type detection (2021-08-30 09:21:55 +0200)

----------------------------------------------------------------
USB-serial fix for 5.15-rc1

Here's a single fix for a pl2303 type detection regression, and which
has been in linux-next over night.

----------------------------------------------------------------
Robert Marko (1):
      USB: serial: pl2303: fix GL type detection

 drivers/usb/serial/pl2303.c | 1 +
 1 file changed, 1 insertion(+)
