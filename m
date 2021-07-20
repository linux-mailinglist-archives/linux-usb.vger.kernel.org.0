Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EB23D04F6
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 01:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhGTWZ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 18:25:57 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:35582 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhGTWZw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Jul 2021 18:25:52 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 1D78B22470;
        Tue, 20 Jul 2021 23:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626822389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=QrOi/dSTgJkJ9CFQk+y0M6s71zmQ/w6MlnzHXXCZWa0=;
        b=ZSSyRWEFmPVEwbufbGBC6YLYX1DEJ4yeMQpUijYZmZzBQObRlmwoCXY2Svek786hRPrK5m
        gU0v3LTj33mxeHTiP7hijMQgCfsR66GPdpKBGxcyyHcTxpibNuC4yOzeKqK/tZUNvWzEpi
        gmrK9lQydISaw6cvFUJ99OA46HPzhEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626822389;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=QrOi/dSTgJkJ9CFQk+y0M6s71zmQ/w6MlnzHXXCZWa0=;
        b=Spd4//YhcY5mStrTEaYwJoP63pJqGfqEkJjNXd2kQ75ql2WUU/MBZ2KafCtkxgHZXh+4yZ
        3+amuoRRdZViGMBw==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 063CCA3B83;
        Tue, 20 Jul 2021 23:06:29 +0000 (UTC)
Date:   Wed, 21 Jul 2021 01:06:29 +0200
Message-ID: <s5h7dhkoaa2.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Moritz Fischer <mdf@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: REGRESSION: Renesas USB host broken after commit d143825baf15
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

the recent patch landed in 5.13.2 stable tree from the upstream commit
d143825baf15 ("usb: renesas-xhci: Fix handling of unknown ROM state")
seems causing a regression on a few machines, as reported on openSUSE
Bugzilla:
  https://bugzilla.opensuse.org/show_bug.cgi?id=1188485
  https://bugzilla.opensuse.org/show_bug.cgi?id=1188515

Reverting it on top of 5.13.3 fixed the problem, so it's likely the
cause.  Could you guys take a look?


thanks,

Takashi
