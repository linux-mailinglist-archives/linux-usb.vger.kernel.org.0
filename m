Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21445470CD3
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 23:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240657AbhLJWKh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 17:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235440AbhLJWKh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 17:10:37 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3DEC061746
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 14:07:01 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id u80so9628674pfc.9
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 14:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v3CMutt/USnRjpKYl5jZ+kVngzRMIPG7FVl3HXha5Zk=;
        b=VlqtlGclyJC2QA28IDW1kkRuOEq5VMO3pALdr8c5t9/AdR8cXjZC0xPqGY7atY1sJh
         O9xDR32/C+v6vfr/ohNWXFvksnSmMK7qga1Hb5amdgEKxjfi/z1qi7rJTRtghlAvaQ/L
         11f3hGCoz5DU92X+z6agYuXH0hE6sBRs9iNXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v3CMutt/USnRjpKYl5jZ+kVngzRMIPG7FVl3HXha5Zk=;
        b=8ElsNbcpQh+q0+Qumy1TfvuylUg1qv1LpArYdc6xROinLdPoB1iGHivq3jNJF/4JuG
         Yv3ElWza7NpOpYRKzP9HdR9pImmftIzmQLx/KNSMIoVQ6DLde6WoJGnHhGMtXsILq/JX
         nuulS56CaDxu0r6kJ+vb3N5fqbv+OLKEoNkgG9IYg2ViR+HHYXroeESBtsGUuMzpR5NZ
         z+5dRgUdDfJLRLl8DJ7U4FFpVVKZG3Z466hXEgL+U11MTO2NdjLQEoVEqCySS43/jrWO
         BM47hCbJx/B+dWMISGvF+bjrIOaKotIJux3vxFNx1oPTl8VYsVAgf7Hg8WxbJFyOzU92
         jjVA==
X-Gm-Message-State: AOAM532+6XwlbR50XM3966DbVKWIPL2IYiX9W/EHXTgFGtOWL9vl5SrV
        k9rPuFPXcREwnOcA8ME+dLL+kprOTNAhAQ==
X-Google-Smtp-Source: ABdhPJyS5WPGLp0XZE85JMEK6R3YAWr6M9oHngnMNia4QECj9EEFgZIxo17jLeBcnlJLOdjx49C2Jg==
X-Received: by 2002:a63:6ecb:: with SMTP id j194mr40403693pgc.46.1639174021093;
        Fri, 10 Dec 2021 14:07:01 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f71b:fe75:c847:85f9])
        by smtp.gmail.com with ESMTPSA id b6sm4324525pfm.170.2021.12.10.14.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 14:07:00 -0800 (PST)
Date:   Fri, 10 Dec 2021 14:06:59 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: usb-connector: Add support for Type-C
 alternate-modes
Message-ID: <YbPPg9MNefOPjqX8@google.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-2-hdegoede@redhat.com>
 <20200721022610.GA3391383@bogus>
 <f143d626-2a78-e32f-b122-7dbae1b3a50e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f143d626-2a78-e32f-b122-7dbae1b3a50e@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,

Restarting this thread, since I think we can re-use Patch 1/4, and I
dind't want some of the context to be lost by starting a new thread.

On Wed, Jul 22, 2020 at 09:18:02AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 7/21/20 4:26 AM, Rob Herring wrote:
> > On Tue, Jul 14, 2020 at 01:36:14PM +0200, Hans de Goede wrote:
> > > This commit adds the minimum bindings required to allow describing which
> > > altmodes a port supports. Currently this is limited to just specifying:
> > > 
> > > 1. The svid, which is the id of the altmode, e.g. displayport altmode has
> > > a svid of 0xff01.
> > > 
> > > 2. The vdo, a 32 bit integer, typically used as a bitmask describing the
> > > capabilities of the altmode, the bits in the vdo are specified in the
> > > specification of the altmode, the dt-binding simply refers to the
> > > specification as that is the canonical source of the meaning of the bits.
> > 
> > What if this information should be derived from information already in
> > DT (or would be there if alt mode connections are described)?
> > 
> > > 
> > > Later on we may want to extend the binding with extra properties specific
> > > to some altmode, but for now this is sufficient to e.g. hook up
> > > displayport alternate-mode.
> > 
> > I don't think this is sufficient as it doesn't describe how alternate
> > modes are connected to various components. This has been discussed some
> > here[1] with the CrOS folks. Maybe this is orthogonal, IDK, but I really
> > need something that is somewhat complete and not sprinkle a few new
> > properties at a time.
> 
> Right, but that is an orthogonal problem, this is telling the Type-C
> controller which modes it is allowed to negotiate and which capabilties
> (altmode specific, stored in the vdo) it should advertise.
> 

I concur. There is value in listing the alternate modes supported by a
connector in the connector bindings. PD negotiation (which may include
alternate mode entry) is something which is handled
by the port driver / TCPM itself, so this sounds like a reasonable place
to explicitly describe this information rather than derive it from OF
graph.

While it is important to describe how the connector is routed through the
switches and eventually to the various controllers (DP, xHCI, USB4 etc.),
it doesn't sound like we should make the Type C port driver rely on those
graph connections to derive what alternate modes to support.

FWIW, I did provide a more fleshed out example of how the OF graph
connections from port to various PHYs would work a while back, but
didn't get much feedback on it [1]

> BTW note that making the binding look like this was proposed by Heikki,
> the Type-C subsys maintainer, I ended up implementing this because Heikki
> did no have the time for it.

If the binding itself looks fine, then I'd request we move forward with
including it in the usb-connector bindings rather than stalling on the
OF graph switch bindings.
Heikki had mentioned [2] that we can adjust the ACPI bindings to accommodate
device tree requirements, and it looks like the current implementation is already in
the mainline connector class code [3], just the binding is missing.

I would be happy to re-upload this patch, with follow on patches which:
- Add the altmodes node to a Chrome OS device tree file
- Update the cros-ec-typec port driver to call the function introduced in [3].

I've tested this locally and it works fine.

[1]:
https://lore.kernel.org/lkml/CACeCKacUa1-ttBmKS_Q_xZCsArgGWkB4s9eG0c5Lc5RHa1W35Q@mail.gmail.com/
[2]:
https://lore.kernel.org/linux-usb/Ya8vxq+%2FP%2FWG4kHo@kuha.fi.intel.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7b458a4c5d7302947556e12c83cfe4da769665d0

Would be good to hear your thoughts on the above.

Thanks,

-Prashant
