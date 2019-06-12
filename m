Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2097C4285E
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 16:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407368AbfFLOFh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 10:05:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:14495 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405816AbfFLOFh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jun 2019 10:05:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 07:05:37 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 12 Jun 2019 07:05:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 12 Jun 2019 17:05:34 +0300
Date:   Wed, 12 Jun 2019 17:05:34 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190612140534.GA2467@kuha.fi.intel.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190611075431.GB7918@kuha.fi.intel.com>
 <CAB31r6V+PYppYJz29u_hfpiL6xqhhe+-2xZTRpqOmpLrtCdh8Q@mail.gmail.com>
 <20190612095532.GB19831@kuha.fi.intel.com>
 <CAB31r6WFwkJwnkqCy3Lw4f2ybZ63EoJFxAcLyDFvm_gHkLRrOQ@mail.gmail.com>
 <20190612123242.GA25718@kroah.com>
 <CAB31r6UkueG0wFz5genq=z0xNZNwymkxrxG4YXSWXH--VvEU2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6UkueG0wFz5genq=z0xNZNwymkxrxG4YXSWXH--VvEU2g@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 12, 2019 at 10:57:35PM +1000, Vladimir Yerilov wrote:
> Oh, you are right. I meant... You know what I meant :)
> I hope the fix will get there eventually in one way or another. Should
> you need any further tests from my side, just ask and I will make my
> faulty machine work on it.
> 
> Thank you guys again for your kind assistance.

The patch I gave you does not fix the root cause, but instead just
works around it. The change it brings is however useful, so I'm going
to send the patch to the linux-usb ml as a fix for this issue.

I think the root problem in this case is that the firmware is
reporting the alternate modes in a customized way. The problem is
actually not with the firmware itself. The problem is with UCSI
specification. The UCSI spec does not explain how exactly the
alternate modes should be handled, so every platform does it a bit
differently (a major operating system does not seem to care about the
alternate modes).

The ucsi driver we have in kernel already considers a number of
different ways the alternate modes could be handled, but clearly not
the way Kaby Lakes handle them. I'm going to continue debugging this
with a Kaby Lake board, and once/if I figure out how to manage the
alternate modes on it, I'll send the final fix. But for now, let's
workaround the problem.


thanks,

-- 
heikki
