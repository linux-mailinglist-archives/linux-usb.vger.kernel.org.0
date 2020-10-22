Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113EC296079
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 15:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900522AbgJVNzs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 09:55:48 -0400
Received: from aibo.runbox.com ([91.220.196.211]:51528 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895101AbgJVNzr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Oct 2020 09:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
        :Message-Id:Date:Subject:Cc:To:From;
        bh=+MXeMYFQO8thYieih8I7NJ7PuJN+lO/UerkNKTkxNCc=; b=DBIHJr/yWc11cM5gXSvzurrKET
        l34GuGPIG/g64leqdKja9p7oAD0dOS4nc1RQD7i9WuxzSkcmVnfyaGY4xYV+iFOGj4wBlSFsIGEmS
        7PmmxZUsVYJSxJ8G8hphZuqkJE3W4nDAaPNfOTBRoSTSKiLit+Yu+V1t6ocwhekbQAMn7BA21xlMD
        FEEiX0eqLPYlMeK9PW5MnAOc6hzks7ujY8doEgQRoU7yMIbbaGDQugVj2CMnh9zKWpU4dcuNZXwrr
        a3506aXekyDtF6aClszB36IFcxciSLhovX5VsK17suTMnDQ6rgT3PF90+JTfbWl9o0FRp0ZehNN8s
        pCicnGzA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
        by mailtransmit02.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kVb4D-0001P2-7u; Thu, 22 Oct 2020 15:55:45 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kVb41-0008Qw-Ec; Thu, 22 Oct 2020 15:55:33 +0200
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
To:     linux-usb@vger.kernel.org
Cc:     "M. Vefa Bicakci" <m.v.b@runbox.com>,
        Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Pany <pany@fedoraproject.org>
Subject: [PATCH 0/2] Patches to prevent re-probing all Apple USB devices on apple-mfi-fastcharge load
Date:   Thu, 22 Oct 2020 09:55:19 -0400
Message-Id: <20201022135521.375211-1-m.v.b@runbox.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <4cc0e162-c607-3fdf-30c9-1b3a77f6cf20@runbox.com>
References: <4cc0e162-c607-3fdf-30c9-1b3a77f6cf20@runbox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all,

This thread is intended to continue the thread at [1], where Pany
reported an issue involving the apple-mfi-fastcharge driver. The
bug in question causes a re-probe of all Apple USB devices when the
driver in question is loaded, including an Apple SD card reader,
which in turn causes a boot-up failure. (The original bug report
is in the RedHat Bugzilla at [2].)

These two patches aim to resolve this issue by implementing a match
function in the apple-mfi-fastcharge driver to ensure that this driver
is only matched with devices it is intended to be used with, and by
modifying the USB core to ensure that when a device driver has an
ID table and a match function, they are both taken into account.
(The previous behaviour did not check the result of the driver's
match() if the driver's id_table matched the device.)

These changes have been verified to not cause regressions on a
5.8.16-based kernel by (1) verifying apple-mfi-fastcharge behaviour
with an iPhone, (2) running the usbip regression test to ensure that
the changes in USB core are harmless to usbip, and (3) using the
patched kernel with other USB devices (a keyboard, a mouse and a
webcam). Greg Kroah-Hartman's usb-next tree has been verified to
compile with these patches and was briefly runtime tested as well.
(The base commit in usb-next is listed below.)

Credits: The first patch was co-developed by Bastien Nocera and
myself, with the main idea (i.e., the use of id_table *and* the
match function) coming from Bastien. The second patch was
developed solely by Bastien, and I only added a few tags to the
patch description.

Bastien, sorry for the delay!

Thank you,

Vefa

[1] https://lore.kernel.org/linux-usb/CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com/
[2] https://bugzilla.redhat.com/show_bug.cgi?id=1878347

Cc: Bastien Nocera <hadess@hadess.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Pany <pany@fedoraproject.org>

Bastien Nocera (2):
  usbcore: Check both id_table and match() when both available
  USB: apple-mfi-fastcharge: don't probe unhandled devices

 drivers/usb/core/driver.c               | 30 +++++++++++++++++--------
 drivers/usb/core/generic.c              |  4 +---
 drivers/usb/core/usb.h                  |  2 ++
 drivers/usb/misc/apple-mfi-fastcharge.c | 17 +++++++++-----
 4 files changed, 36 insertions(+), 17 deletions(-)


base-commit: 270315b8235e3d10c2e360cff56c2f9e0915a252
-- 
2.26.2

