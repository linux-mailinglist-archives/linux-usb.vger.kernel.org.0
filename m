Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A86BB21F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 12:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439427AbfIWKUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 06:20:13 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43701 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439425AbfIWKUN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 06:20:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id u3so9629005lfl.10
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2019 03:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qsnfskqFdLvWR5iSkj+Fuy/EyG0nsiXFmZ404THFWGo=;
        b=oC0heKdVK9JDvu5SHA/gYCuQNIuhutXt0c2IIPolujdgGCC/NoWNafoYkc/A+JE3kx
         iuLVPj0VAJ5IIAPlYOC0YJyKRRDO6PIwFFdbL0U+/Hz+sqMBuXiWQNzdIOyWq5sPjJYB
         ipDkmBGsQGk6ldC3WAXzLbdjTac3RN3OWsiicqD9/uHdEv9fXKwQaTm7n2us1P9n+UUI
         9gyz/1HZJ+Dt/4sQG+3vaPT7/XV12lEoRqpj+5WJzrJ7bRmZfyfnhk3ba+OaKgkFW9KF
         NFZ8isSDrkrm7rBbjeIwMkqIqYFD+wzyxwSRS3aYjzmNYHln4RYNFf1l8zrhE3V+FoEj
         UVCw==
X-Gm-Message-State: APjAAAUZzM1tMJHTYy/KJkowuW6MIwVnvZql0KHK+a6rPfBh42rGZBDL
        FvhUAF3FHLjD+lvhha0YEVL2fK7G
X-Google-Smtp-Source: APXvYqwcmCkaxYKOw4xNgK5exhxlBegDvuONFbBE4KYlpupgUe34waliYE6rsOK8hKbE+pb4Gq4MAQ==
X-Received: by 2002:a19:5516:: with SMTP id n22mr17524994lfe.49.1569234011391;
        Mon, 23 Sep 2019 03:20:11 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q24sm2190629ljj.6.2019.09.23.03.20.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 03:20:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iCLS0-0007D1-Qg; Mon, 23 Sep 2019 12:20:13 +0200
Date:   Mon, 23 Sep 2019 12:20:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     John Goerzen <jgoerzen@complete.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Linux Keyspan USB serial driver ignoring XOFF
Message-ID: <20190923102012.GZ30545@localhost>
References: <87woe37prw.fsf@complete.org>
 <87tv967nog.fsf@complete.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tv967nog.fsf@complete.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 02:49:51PM -0500, John Goerzen wrote:
> Hello,
> 
> I have narrowed down the issue I'm about to describe to keyspan.c; a
> Digi Edgeport/1 with identical configuration works fine.
> 
> I am configuring a Raspberry Pi running 4.19.66 (though keyspan.c hasn't
> changed since 2017) to talk to a real-live vt420.  Configuring agetty
> with systemd worked easy enough, but I found that XON/XOFF wasn't
> working.  stty -a shows ixon and ixoff as appropriate, but sending
> Ctrl-S (tested from multiple ways of sending) had no effect on output in
> bash, or scrolling output.  (Emacs, though, recognized it as the start
> of a search, so I knew it was getting down the line.)
> 
> 
> After a great deal of head-scratching on this, I went to look at the
> kernel source and found that keyspan.c does not appear to be honoring
> XOFF.  I also have a Digi Edgeport/1 on hand (which uses io_ti.c), and
> when I swapped to that, everything worked fine - Ctrl-S caused the
> expected pause.
> 
> As far as I can tell, keyspan.c simply never implemented handling of
> XOFF, but you guys are the experts there.

That's correct, the driver does not support software flow control even
if the hardware seems to have some support for assisted XON/XOFF.

Would you mind testing the below patch which may be enough to turn
sw-flow control always on. If that works, I can probably find time to
cook up a proper patch to make this configurable later this week.

Johan


From 55b46d78fe63f182923e4674659fa18f4624d6b8 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Mon, 23 Sep 2019 12:14:56 +0200
Subject: [PATCH] USB: serial: keyspan: enable XON flow control

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/keyspan.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/keyspan.c b/drivers/usb/serial/keyspan.c
index d34779fe4a8d..934430cbdfc4 100644
--- a/drivers/usb/serial/keyspan.c
+++ b/drivers/usb/serial/keyspan.c
@@ -2118,7 +2118,7 @@ static int keyspan_usa26_send_setup(struct usb_serial *serial,
 	msg.setLcr = 0xff;
 
 	msg.ctsFlowControl = (p_priv->flow_control == flow_cts);
-	msg.xonFlowControl = 0;
+	msg.xonFlowControl = 1;
 	msg.setFlowControl = 0xff;
 	msg.forwardingLength = 16;
 	msg.xonChar = 17;
@@ -2234,7 +2234,7 @@ static int keyspan_usa28_send_setup(struct usb_serial *serial,
 	msg.parity = 0;		/* XXX for now */
 
 	msg.ctsFlowControl = (p_priv->flow_control == flow_cts);
-	msg.xonFlowControl = 0;
+	msg.xonFlowControl = 1;
 
 	/* Do handshaking outputs, DTR is inverted relative to RTS */
 	msg.rts = p_priv->rts_state;
@@ -2388,7 +2388,7 @@ static int keyspan_usa49_send_setup(struct usb_serial *serial,
 	msg.setLcr = 0xff;
 
 	msg.ctsFlowControl = (p_priv->flow_control == flow_cts);
-	msg.xonFlowControl = 0;
+	msg.xonFlowControl = 1;
 	msg.setFlowControl = 0xff;
 
 	msg.forwardingLength = 16;
@@ -2690,7 +2690,7 @@ static int keyspan_usa67_send_setup(struct usb_serial *serial,
 	msg.setLcr = 0xff;
 
 	msg.ctsFlowControl = (p_priv->flow_control == flow_cts);
-	msg.xonFlowControl = 0;
+	msg.xonFlowControl = 1;
 	msg.setFlowControl = 0xff;
 	msg.forwardingLength = 16;
 	msg.xonChar = 17;
-- 
2.23.0

