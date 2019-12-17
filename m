Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD443123293
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 17:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfLQQeG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 11:34:06 -0500
Received: from mail-io1-f49.google.com ([209.85.166.49]:45847 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbfLQQeG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 11:34:06 -0500
Received: by mail-io1-f49.google.com with SMTP id i11so8567440ioi.12
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 08:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=aC0PzL17HCkWM7WH7+DqP+etlDvSTGxhc70yYAVW8ig=;
        b=dgnh2ov+UGstLpleRvJPMXpNNIiwP5grTJyIyc3OkGeADfNKy+sgvFW8mCzLOQsOyc
         QZ34wiSiML8kkgGTxDt9X3yYnelnSO5Mpk105+g/Uy6lylD7l0abacgUQ+YnX4UJGkHE
         03jgLZL20C9A2bJTrY8Cp1e8xZK1plzyabuMDjlx7Tu9U182+YP22adtRR5Y2nUpJkW/
         +y7F5NjqCFV5UwWGNE8kObbbTXOZuRziAFqw6oDvTKIfsk/51viDGHAzE3AT6LaFv4Do
         bNet8vP/bqeDxNwXdRXluJIDOWbIsylVeQpjBei6EF8TZGkQyMHFemzW9friPIIpgdW5
         xegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=aC0PzL17HCkWM7WH7+DqP+etlDvSTGxhc70yYAVW8ig=;
        b=I+Lvw1vpKdgZxcsMwZvaAQ3nLTp6UQ7QMI40gfqE6xly2rBs2P5ul/lXrTAR9m8N9h
         75dt4YZZVXz5urwwG+njbUkqnOx4WMqXlMYqe8/4hNd/nK7z4gMZJ/FM0+tumM+/rdPz
         p2EF5/mQHQ44NKTPFvZX5jDDXhdDh+97ub0sYwMrT3MSYE33XJDA51+nn4vkqyEHi27k
         zeJIvqkZESijdGzeac2pYj5iBPelja6+Bu8ug4vjcbp2WLZIUz1+76gcpRBFo2YloM+o
         hrzhUf3cQTkCiNwYvG3LmMvnwxE94JSi2egtj9qEWfQLT0Q4sAl4Ga+yO5gEuPWY7lyg
         R4Ig==
X-Gm-Message-State: APjAAAVcaKxcyqUsrUiX+blRMSRofumDSX8tzOlUK6WC/CrB+3TiqMY9
        lY/3rr3msCwZe6o3KqkJhuDTlvwB9wzjfEXuUnPWPVKYcYU=
X-Google-Smtp-Source: APXvYqz+Tb9ACs/ArwXnmMZfU6XRO9Wkb0kTTxoWAA60GxkvH0URGcNPMPGsfTSS1WM8iYDwN0C66Ebx0sWymo4nTxU=
X-Received: by 2002:a5d:97c9:: with SMTP id k9mr4262700ios.297.1576600445536;
 Tue, 17 Dec 2019 08:34:05 -0800 (PST)
MIME-Version: 1.0
From:   Bryan Gillespie <rpgillespie6@gmail.com>
Date:   Tue, 17 Dec 2019 11:33:55 -0500
Message-ID: <CAPVsg6LXr-fsz=FG8BDMqOPd73vcgageTk++Bt+fEP4-6DVT6A@mail.gmail.com>
Subject: Is Duplicate Sequence Number an Issue?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I am trying to debug a USB 3.0 issue under linux 4.4/4.14 where device
endpoints become unresponsive when sending small packet iperf traffic
through them. I have a protocol analyzer (Beagle 5000), and I see the
following at the moment of breakage:

https://i.stack.imgur.com/CrCV7.png

If I expand the packets, I notice that the last good transaction looks
like this:

https://i.stack.imgur.com/sWxne.png

And the first bad transaction looks like this:

https://i.stack.imgur.com/l85xJ.png

This looks like only a partial transaction? The only thing that stuck
out to me was that the two data transactions have the exact same
Sequence Number (SeqNum), which seems like it might be out of spec
with USB 3.0 (I read that you can only have duplicate sequence numbers
if it is a retransmission, and it looks like it isn't)? Is xhci under
linux setting these sequence numbers or is that at the hardware level?
This issue seems to bubble up the linux usb stack as -EPROTO which has
no information.

Sorry if I am asking stupid questions, I am definitely a USB novice.

Any insights on how to determine the cause of this breakage would be
appreciated.

Bryan
-- 
Bryan Gillespie
(801) 664-7527
