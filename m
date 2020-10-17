Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7AE8291437
	for <lists+linux-usb@lfdr.de>; Sat, 17 Oct 2020 22:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439667AbgJQUCC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Oct 2020 16:02:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47623 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2439665AbgJQUCB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Oct 2020 16:02:01 -0400
Received: (qmail 843307 invoked by uid 1000); 17 Oct 2020 16:02:00 -0400
Date:   Sat, 17 Oct 2020 16:02:00 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pany <pany@fedoraproject.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
Message-ID: <20201017200200.GB842001@rowland.harvard.edu>
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 17, 2020 at 04:07:11PM +0000, Pany wrote:
> Hi,
> 
> I installed fedora 32 into an SD card, with which I booted my Macbook.
> It had worked well before, until I upgraded the kernel from 5.8.5 to
> 5.8.6 [1].
> 
> With kernel-5.8.6-200.fc32.x86_64.rpm [2] installed, the boot process
> would be stuck at "A start job is running for
> /dev/mapper/fedora_localhost_--live-home (<time> / no limit)" (See the
> photo of screen [3]).
> 
> By appending "systemd.debug-shell=1" to the kernel cmdline, I saved
> the journal [4].
> 
> This issue has been bisected to commit
> 53965c79c2dbdc898ffc7fdbab37e920594f5e14 ("USB: Fix device driver
> race")
> 
> If I revert this commit, the kernel 5.8.6 would boot successfully.

This should have been fixed in 5.8.14 or 5.8.15 (5.8.14 was released on 
the same day that the fix was installed; I'm not sure which came first).
At any rate it certainly should work with the most recent 5.8.y kernel.

Alan Stern
