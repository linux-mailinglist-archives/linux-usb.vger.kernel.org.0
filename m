Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA291142CD
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2019 15:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbfLEOiA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 09:38:00 -0500
Received: from netrider.rowland.org ([192.131.102.5]:43537 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729402AbfLEOiA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Dec 2019 09:38:00 -0500
Received: (qmail 17027 invoked by uid 500); 5 Dec 2019 09:37:59 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Dec 2019 09:37:59 -0500
Date:   Thu, 5 Dec 2019 09:37:59 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Erkka Talvitie <erkka.talvitie@vincit.fi>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
In-Reply-To: <021d01d5ab57$c2f1ab20$48d50160$@vincit.fi>
Message-ID: <Pine.LNX.4.44L0.1912050929350.14919-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 5 Dec 2019, Erkka Talvitie wrote:

> I tested this change and the issue did not reproduce.
> 
> However when I was writing the comments for the patch I started to think
> what happens in this following scenario:
> 
> The PID Code is IN.
> 
> 1. First there will be XACT, the CERR is decremented, let's say from 3 to 2
> and the host controller executes a retry.
> 2. On this next try there will happen the condition mentioned in the Table
> 4-13 of the EHCI specification so that the MMF is set and the queue is
> halted (because it is IN).
> 3. To my understanding now the execution enters to this first stall check
> if, as CERR is > 0 and CERR < EHCI_TUNE_CERR.
> 4. The -EPIPE (stall) is returned when actually the queue was halted due to
> MMF - not stall - and the -EPROTO should be returned.
> 
> Is my logic correct or am I missing something?

The same thought had occurred to me.

> If you agree with me then I would like to present you a bit more bold (in a
> sense of amount of refactoring) RFC. In high level this another RFC
> separates 1. error check and 2. stall check. For me this approach is a bit
> easier to understand from the code. Or then please  propose another
> solution.

I was going to suggest: Just check for MMF and PID == IN before
checking for STALL.  Everything else can remain the way it is.

Alan Stern


