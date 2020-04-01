Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD4A319AF39
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 18:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733182AbgDAQAn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 12:00:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49645 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1733088AbgDAQAn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 12:00:43 -0400
Received: (qmail 30565 invoked by uid 500); 1 Apr 2020 12:00:42 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Apr 2020 12:00:42 -0400
Date:   Wed, 1 Apr 2020 12:00:42 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     bugzilla-daemon@bugzilla.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
In-Reply-To: <bug-203419-208809-hOQeujBEQn@https.bugzilla.kernel.org/>
Message-ID: <Pine.LNX.4.44L0.2004011156580.27138-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mathias, maybe you should look at this.

On Wed, 1 Apr 2020 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=203419
> 
> Takashi Iwai (tiwai@suse.de) changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>           Component|Sound(ALSA)                 |USB
>            Assignee|perex@perex.cz              |drivers_usb@kernel-bugs.ker
>                    |                            |nel.org
> 
> --- Comment #18 from Takashi Iwai (tiwai@suse.de) ---
> Sounds more like a USB issue.  Reassigned.

In the bug report, Florian Meyer tentatively identified commit 
ef513be0a905 ("usb: xhci: Add Clear_TT_Buffer") as the one causing the 
problem.  No one else has verified this, however -- and as far as I can 
see, even Florian hasn't tried starting from that commit and reverting 
it.

Alan Stern

