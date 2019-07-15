Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1939569832
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2019 17:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730824AbfGOPQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jul 2019 11:16:41 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:43786 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730221AbfGOPQl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jul 2019 11:16:41 -0400
Received: (qmail 5441 invoked by uid 2102); 15 Jul 2019 11:16:39 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Jul 2019 11:16:39 -0400
Date:   Mon, 15 Jul 2019 11:16:39 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
cc:     gregkh@linuxfoundation.org, USB list <linux-usb@vger.kernel.org>,
        <bugzilla-daemon@bugzilla.kernel.org>
Subject: Re: [bugzilla-daemon@bugzilla.kernel.org: [Bug 204095] New: freeze
 while write on external usb 3.0 hard disk]
In-Reply-To: <20190715021543.GB12214@mit.edu>
Message-ID: <Pine.LNX.4.44L0.1907151108580.1465-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 14 Jul 2019, Theodore Y. Ts'o wrote:

> This bug was initially (and wrongly) assigned to the ext4 component,
> when it's very clearly a regression in the USB mass storage driver in
> the 5.2.0 kernel.
> 
> For people who hate bugzilla, you can also see the full thread at:
> 
> https://lore.kernel.org/linux-ext4/bug-204095-13602@https.bugzilla.kernel.org%2F/T/#ra57c95759df5bee542d85f2541bda87735c09f16

I'm not so sure it's a regression in the USB mass-storage driver, but
in any case, it looks very much like the problem fixed by this patch 
(not yet merged):

	https://marc.info/?l=linux-usb&m=156044081619171&w=2

Maybe the original bug reporters can try it out and tell us if it 
works.

Alan Stern

