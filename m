Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6E8F13C755
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 16:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgAOPVo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 10:21:44 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:32836 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728896AbgAOPVo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 10:21:44 -0500
Received: (qmail 2703 invoked by uid 2102); 15 Jan 2020 10:21:43 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Jan 2020 10:21:43 -0500
Date:   Wed, 15 Jan 2020 10:21:43 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Johan Korsnes <jkorsnes@cisco.com>
cc:     linux-usb@vger.kernel.org,
        Armando Visconti <armando.visconti@st.com>,
        Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH 2/2] HID: core: increase HID report buffer size to 8KiB
In-Reply-To: <20200115123344.4650-2-jkorsnes@cisco.com>
Message-ID: <Pine.LNX.4.44L0.2001151017190.1788-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 15 Jan 2020, Johan Korsnes wrote:

> We have a touch device that reports its opens and shorts test results
> in HID buffers of size 8184 bytes. With this patch we're able to
> successfully obtain these reports.
> 
> Alan Stern: Your commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds
> read in hid_field_extract") states:
> 
> "This patch fixes the problem by rejecting any report whose total
> length exceeds the HID_MAX_BUFFER_SIZE limit (minus one byte to allow
> for a possible report index). In theory a device could have a report
> longer than that, but if there was such a thing we wouldn't handle it
> correctly anyway."
> 
> Is this something we have to worry about when increasing the buffer
> size? Or are you referring to the fact that we previously truncated
> the reports if they exceeded max buffer size?

The latter.  And after this patch we will still truncate reports that
exceed the max buffer size, no "previously" about it.

(Incidentally, these last three paragraphs don't belong in the patch
description; nobody will care about them once the patch has been
merged.  You should have put them below the "---" separator line.)

Alan Stern

