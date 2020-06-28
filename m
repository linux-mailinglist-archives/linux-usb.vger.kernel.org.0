Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE8D20C964
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jun 2020 19:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgF1RuZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Jun 2020 13:50:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:44555 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726059AbgF1RuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Jun 2020 13:50:25 -0400
Received: (qmail 375327 invoked by uid 1000); 28 Jun 2020 13:50:24 -0400
Date:   Sun, 28 Jun 2020 13:50:24 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     Alexander Tsoy <alexander@tsoy.me>, linux-usb@vger.kernel.org
Subject: Re: [Bug 208353] New: Distorted Audio Output Through USB C Docking
 Station
Message-ID: <20200628175024.GB374332@rowland.harvard.edu>
References: <bug-208353-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208353-208809@https.bugzilla.kernel.org/>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bring this to the attention of the person who wrote the offending commit:

On Sun, Jun 28, 2020 at 03:19:06PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208353
> 
>             Bug ID: 208353
>            Summary: Distorted Audio Output Through USB C Docking Station
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.4.49
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: pbui@kernel.bx612.space
>         Regression: No
> 
> Created attachment 289909
>   --> https://bugzilla.kernel.org/attachment.cgi?id=289909&action=edit
> Output of alsa-info.sh
> 
> With kernel 5.4.49 the audio output through my Dell WD19 Docking station is now
> laggy and distorted (sounds like only bass frequencies are emitted). 
> Previously, audio output through the dock worked just fine with all versions of
> 4.19.x and 5.4.x.
> 
> After looking through the changelog for 5.4.49, I was able to locate the
> offending patch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/patch/?id=aba41867dd66939d336fdf604e4d73b805d8039f

This is upstream commit f0bd62b64016 ("ALSA: usb-audio: Improve frames 
size computation").

Alan Stern

> Reverting this patch allows audio to play normally through my docking station.
