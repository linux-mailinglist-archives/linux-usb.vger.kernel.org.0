Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8AD473CC1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 06:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhLNFx7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 00:53:59 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59376
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230080AbhLNFx6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 00:53:58 -0500
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A14413F1AA
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639461237;
        bh=0/qQRLtF8a22mPdnKriVPX9p7Fl5BEnFhsEpo3VjKNY=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=KVlBD7bzvDHsRhE7e5pZdbMGDXMT2/pA25gO3Gw4p6qLIUGdmMi/yIIvkzU9NmTBS
         TXmS8L1rxz8N97E/P6jhnAB1fPWJ1gvNej8Fw86+Pcn451Jggm+tiv1R89IspnGqEZ
         b4hfvOK9VcDKeWtglAUqly3I3cWG2u42I8H+/lBtY+cqkZSf6COjqXX9tH9Rqul19V
         jFaaVdggQ3zEIato11dyCoqIqi86hJcnSOHKluOhcfk4CLbSo1htldLLN5YufAyJ4k
         r6ILl998kBYGRqz1968guroDwuyFuKB0cnZ3IHBZs90XorSoCymyUZLU7KyJx0k7jq
         VcTp5Yw01pXcg==
Received: by mail-oo1-f71.google.com with SMTP id t199-20020a4a3ed0000000b002c296d691c4so12219257oot.8
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 21:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/qQRLtF8a22mPdnKriVPX9p7Fl5BEnFhsEpo3VjKNY=;
        b=ZCK/bpc2/0F3STFwCmF7TMcRpX8MIFlH0wUf0MR27Inewh0gSZhcR8OTZ4bGUk++6e
         7tuLu3blQm8UCYblH7vvaioexHeW7LQq8LLtHxEv9cMBRPNIPWBpSjOeYgwRkiHJXDhN
         0mx0vYiwGtGUzCFjpFPBdAOyqTwttiTYrpG4p3lZ6PVnW1WC+ef9GS7Jq5GrpbUOLYoz
         AH1zamPGMJjZAg31DEplWVpGmo/Z3eqY/yv5LYxTzw7YH2PPHeAwACoUcpXpVtf9kdV4
         P9/fGojLAnMK8Mf89jrHcJhvQ7GXV8rQoBACjcQZcrxmH5p/fm39SC69ydpvRsRGQJ4R
         Fy2A==
X-Gm-Message-State: AOAM533h9ZVcZd+K9UPkvHXEWffaNX1hrkTrO4KAW1u+2RsWYV6uF/a9
        57ajhzQ50UhBThogy+jKg6uSxnJs/xvipitR6Af3ox8j0SINlfpCFdVaVBr+BZ63dDng2JoyG0r
        F0GglJzGW52dO67B1AuApPRVjnDgS8PlAz17Kmoon8p1/DMsl+m1/7w==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr30810084oie.41.1639461236573;
        Mon, 13 Dec 2021 21:53:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoGBvcLA8wUYeZIWQ7TMEHHWKYi3fljr0QNgTSWL43Olys/u/zfpiNcMtUwGvvhKvjbdBv6K4pbvy6FDCHi9A=
X-Received: by 2002:aca:ab84:: with SMTP id u126mr30810055oie.41.1639461236205;
 Mon, 13 Dec 2021 21:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20211208070835.8877-1-kai.heng.feng@canonical.com>
 <YbEnf2NUr/BCV4Gb@rowland.harvard.edu> <CAAd53p61w-AHBxy05Hx-gwae1rUxZxsaVfmH=--bQUkPxYj8Nw@mail.gmail.com>
 <YbIo/ZBRgK5NDZJb@rowland.harvard.edu> <CAAd53p5HfGz-D-QvYvPuDY4qLe0nYncY077=n-gvnYym4A8E0w@mail.gmail.com>
 <YbN/8AOHHR7fNFGd@rowland.harvard.edu>
In-Reply-To: <YbN/8AOHHR7fNFGd@rowland.harvard.edu>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 14 Dec 2021 13:53:44 +0800
Message-ID: <CAAd53p6pCb6x6x-YXicXHwUeor3HJ+fx8z_j7F6cCSBoM1OG1g@mail.gmail.com>
Subject: Re: [PATCH] usb: hub: Resume hubs to find newly connected device
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bixuan Cui <cuibixuan@huawei.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Chris Chiu <chris.chiu@canonical.com>,
        Rajat Jain <rajatja@google.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 11, 2021 at 12:27 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, Dec 10, 2021 at 02:06:10PM +0800, Kai-Heng Feng wrote:
> > On Fri, Dec 10, 2021 at 12:04 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, Dec 09, 2021 at 09:19:24AM +0800, Kai-Heng Feng wrote:
> > > > On Thu, Dec 9, 2021 at 5:45 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > >
> > > > > On Wed, Dec 08, 2021 at 03:08:33PM +0800, Kai-Heng Feng wrote:
> > > > > > When a new USB device gets plugged to nested hubs, the affected hub,
> > > > > > which connects to usb 2-1.4-port2, doesn't report there's any change,
> > > > > > hence the nested hubs go back to runtime suspend like nothing happened:
> > > > >
> > > > > That's a bug in the hub.  When there's a change in the connection status
> > > > > of one of its ports, it should report this change to the kernel.
> > > >
> > > > I think it should, but when I searched through the USB spec and I
> > > > can't find anywhere specify hub requires to report it in change
> > > > status.
> > >
> > > USB-2.0 spec, section 11.24.2.7.2.1 (C_PORT_CONNECTION):
> > >
> > >         This bit is set when the PORT_CONNECTION bit changes because of an
> > >         attach or detach detect event (see Section 7.1.7.3). This bit will be
> > >         cleared to zero by a ClearPortFeature(C_PORT_CONNECTION) request or
> > >         while the port is in the Powered-off state.
> >
> > It's indeed set for the hub's downstream facing port, and that's why
> > wake up the hub and check its ports can still find connect event.
> > But I can't find anywhere stats how hub's upstream facing port should be set.
>
> It looks like the port status-change bits don't get set in response to a
> wakeup signal, for SuperSpeed links.  Section C.1.2.3 in the USB-3.1
> spec says:
>
>         Note that C_PORT_LINK_STATE is not asserted in the event of a
>         remote wakeup. As discussed previously, in the event of a
>         Remote Wakeup the associated function sends the host a Function
>         Wake device notification packet.
>
> I don't know if we receive those Function Wake notification packets, or
> what we do with them.
>
> In any case, section C.1.4.5 says that during remote wakeup, all of the
> links from the remote wakeup device up to the controlling hub transition
> to U0.  But your log extract showed:
>
> [  281.110147] usb 2-1.4-port2: status 0263 change 0000
>
> So even though the 2-1.4.2 hub originated a wakeup signal, the upstream
> link to the 2-1.4 hub remained in U3 according to these status bits.
> Could it be that we need to include an extra delay, so the link has
> enough time to get into the U0 state?

You are right, adding delay works and it can get to U0.
This only happens to USB3 devices, the hub has no problem detecting
USB2 devices.
Let me prepare v2 for this.

Kai-Heng

>
> Maybe Mathias can help investigate this issue.
>
> Alan Stern
