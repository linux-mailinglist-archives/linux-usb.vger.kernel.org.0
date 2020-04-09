Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 107E91A3550
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2020 16:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbgDIOBk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Apr 2020 10:01:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58833 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726992AbgDIOBj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Apr 2020 10:01:39 -0400
Received: (qmail 4872 invoked by uid 500); 9 Apr 2020 10:01:39 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Apr 2020 10:01:39 -0400
Date:   Thu, 9 Apr 2020 10:01:39 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     bugzilla-daemon@bugzilla.kernel.org
cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 207065] C-media USB audio device stops working from 5.2.0-rc3
 onwards
In-Reply-To: <bug-207065-208809-acaXt6vp4x@https.bugzilla.kernel.org/>
Message-ID: <Pine.LNX.4.44L0.2004090947400.2383-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 9 Apr 2020 bugzilla-daemon@bugzilla.kernel.org wrote:

> --- Comment #4 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
> Thanks, traces show its related to Clearing TT buffer after a STALL on 
> endpoint 0.
> 
> The first stall looks like a protocol stall, not a function stall, meaning that
> endpoint isn't really halted, just that the device does not support the
> request in the control transfer. 
> 
> Anyway, xhci starts clearing what it assumes is a halted endpoint, 
> including clearing the hub TT buffer.
> 
> Specs are a bit unclear if TT should be cleared in this case, 
> or at least I couldn't find it.

TTs should be cleared when an error occurs in the protocol.  STALL
isn't an error; a real error would be a timeout or CRC mismatch or URB
cancellation, things like that -- things that might leave the TT in a
busy state (because it hasn't sent its final status back to the host)
when it ought to be idle.  Sending a STALL isn't a protocol error and
it does clear the TT status.

This is discussed (not as explicitly as one might want) in sections 
11.17.3 and 11.17.5 of the USB-2.0 specification.

Alan Stern

