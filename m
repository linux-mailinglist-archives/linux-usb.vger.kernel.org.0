Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D383C3B2F
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jul 2021 10:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230435AbhGKIiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jul 2021 04:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhGKIix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Jul 2021 04:38:53 -0400
X-Greylist: delayed 663 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 11 Jul 2021 01:36:07 PDT
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com [IPv6:2a00:1098:0:82:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138E7C0613DD
        for <linux-usb@vger.kernel.org>; Sun, 11 Jul 2021 01:36:07 -0700 (PDT)
Received: from [84.114.224.132] (port=47966 helo=butterfield.nothingisreal.com)
        by balrog.mythic-beasts.com with esmtpa (Exim 4.92.3)
        (envelope-from <psychonaut@nothingisreal.com>)
        id 1m2Ult-00012M-5R
        for linux-usb@vger.kernel.org; Sun, 11 Jul 2021 09:25:05 +0100
Received: from nuc.nothingisreal.com (localhost [IPv6:::1])
        by butterfield.nothingisreal.com (Postfix) with ESMTP id 3B8B21FBB1
        for <linux-usb@vger.kernel.org>; Sun, 11 Jul 2021 10:25:03 +0200 (CEST)
Date:   Sun, 11 Jul 2021 10:25:03 +0200
From:   Tristan Miller <psychonaut@nothingisreal.com>
To:     linux-usb@vger.kernel.org
Subject: "Chipmunk audio" on Logitech USB webcams
Message-ID: <20210711102503.179b154b.psychonaut@nothingisreal.com>
Organization: https://logological.org/
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 10
X-Spam-Status: No, score=1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings.

Many models of Logitech USB webcams malfunction under Linux by producing
audio that sounds distorted, garbled, or high-pitched. For most users,
the problem happens randomly, and can usually be worked around by
restarting the audio application or by unplugging the webcam and then
plugging it back in again.

The problem is described in a kernel.org bug at
<https://bugzilla.kernel.org/show_bug.cgi?id=44281>. Despite eight
years' worth of comments and duplicate bugs indicating that that the
problem is still occurring, this report has remained closed as
"resolved" since 2013. It's unclear whether any of the right developers
have even seen these comments; certainly none of them have ever
responded, even just to reopen the bug. A comment on one of the
duplicate bugs <https://bugzilla.kernel.org/show_bug.cgi?id=203763#c1>
suggests that this may be because the bug was misfiled in the
v4l-dvb/webcam product, whereas it should instead have been posted to
this mailing list.

I'd appreciate it if one of the USB for Linux developers could take a
quick look at the bug report to confirm whether it's been filed in the
right place.  If not, please let us know (either here or in Bugzilla)
where the bug should be reported instead, and if it is indeed here on
linux-usb, let us know if any further diagnostic information is
required.

Regards,
Tristan

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
                  Tristan Miller
Free Software developer, ferret herder, logologist
             https://logological.org/
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
