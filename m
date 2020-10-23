Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE474297953
	for <lists+linux-usb@lfdr.de>; Sat, 24 Oct 2020 00:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757172AbgJWWe3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 18:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465803AbgJWWe3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 18:34:29 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27323C0613CE
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 15:34:29 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id p9so2923894ilr.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 15:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=O/m9k20a+Gh2V2LaNgOX78RAVAMca7IDU18p8RmfghM=;
        b=bxH5FwKQ0zGVhW2IIaNPwAlBVbmVy22S/jMk8BalEbfAZp3zVhQntSXYR0csPXkytI
         Lp9hgr/Y2KmQaesEIzuQ+oG43OYpLFn7So3t4kGcqIRsrgZuYjpQoUbgCUSaKPY3YxG8
         7oYyQZQxygkzILWkAbswORREWvzANKVBkHhqeHN4AFmtXoSJo9/mLriGTiJkWb49uVWz
         ZDdlMsJXi+OscWJT+e6rlUBklBkH8XBJDdoAABH3jrIPIqdKfcWKp50z5Ld6cbCQAnwN
         hFjHd6TYCMrrIJFDNoksgnBunDUqr0vWqADznwe7jhQEJpxw9jw5SrM+ah0mnRReLokU
         7l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O/m9k20a+Gh2V2LaNgOX78RAVAMca7IDU18p8RmfghM=;
        b=itRzUEqhj/ONW6JZ7X65YEjKOmisAAW7oaKhKnlLu3GqxdutpsEYAD++tZgFDjyhhr
         w+OXBsJ/NjcUVBH8rKmdIjsVpaI57aROFIku5kuU0JTQ03Fc/IBfu4WgxMWj+VFyRa4X
         YzaPfH+oAhz03uR17RSCQwfEMNCv85eQ0itruXlUHuYWUjC1ReEitu2BjJkKNjTEr1pP
         jTLB7ynQtB55SMNfvf21i7h8iMBGWGd/6j5oPqegK82aFhAGEgwRwd4/HEa7zcIFdi2o
         CugQeWL+ozV6hs4UR6v14p4XhJRen39MaB2rIgGNk57nVdngxTCABo7xJXN0G5UDGfxA
         cu9w==
X-Gm-Message-State: AOAM5333fudBe0wT7Uj9fxBjWUCgWxNcg/P2d7VcVo1e7Gyz56lq19PT
        jiWYlOxps3AYKWEig3k7J8cJkiF5sHVIBjLga2c=
X-Google-Smtp-Source: ABdhPJy+T+QiIBVvaIFAvLQFwM4f8MYqhO9Be+T79CViDvCsbGiqyWWboTammmhTSrUzSeqxl1ietlBUl4XXzaat6PQ=
X-Received: by 2002:a05:6e02:541:: with SMTP id i1mr3193634ils.156.1603492468257;
 Fri, 23 Oct 2020 15:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com> <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
 <20201023064855.GR1667571@kuha.fi.intel.com> <87lffxdzk4.fsf@kernel.org>
In-Reply-To: <87lffxdzk4.fsf@kernel.org>
From:   "Dmitry N. Mikushin" <maemarcus@gmail.com>
Date:   Sat, 24 Oct 2020 00:34:17 +0200
Message-ID: <CAGR4S9GnD6CbZXbO+cA0HUY_8BOpRqkWmqcmVw=i4yEtgOhFKg@mail.gmail.com>
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini Lake?
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is what I get from acpidump:

marcusmae@m1k:~$ sudo acpidump | grep OTDG
marcusmae@m1k:~$ sudo acpidump | grep XDCI
    1AA0: 5F 41 44 52 0C 00 00 15 00 5B 82 0F 58 44 43 49  _ADR.....[..XDCI
    3160: 42 38 58 44 43 49 14 1A 5F 50 4C 44 00 A4 5E 5E  B8XDCI.._PLD..^^
    31B0: A0 0E 90 50 4D 45 45 60 86 58 44 43 49 0A 02 5B  ...PMEE`.XDCI..[
    3200: 44 44 4E 0D 42 72 6F 78 74 6F 6E 20 58 44 43 49  DDN.Broxton XDCI
    B170: 00 5C 2F 04 5F 53 42 5F 50 43 49 30 58 44 43 49  .\/._SB_PCI0XDCI

Does this look sufficient?

Kind regards,
- Dmitry.

=D0=BF=D1=82, 23 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 12:09, Felipe Balb=
i <balbi@kernel.org>:
>
> Heikki Krogerus <heikki.krogerus@linux.intel.com> writes:
>
> > On Thu, Oct 22, 2020 at 11:06:59PM +0200, Dmitry N. Mikushin wrote:
> >> Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I do h=
ave it:
> >>
> >> 00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8] (r=
ev 03)
> >
> > That is the xHCI controller, and it is not what you need if you want
> > to use the connector in device mode. The xHCI and DWC3 IPs are
> > separate IPs on GLK. That is why there is a mux between the two. The
> > dwc3 USB device controller has device ID 31aa, so you want to see a
> > PCI device with the device ID. It's not there.
> >
> > So the dwc3 PCI device is not enabled on your board, which means you
> > do not have USB device controller to deal with. The connector is in
> > host mode only. Sorry.
> >
> > If you can enter the BIOS menu, then you can try to find an option
> > named XDCI (so that's "XDCI" not "xHCI"). It is usually somewhere
> > under some USB menu. If you have that, then enable it, and you should
> > see the dwc3 PCI device in the operating system.
>
> Also, have a look at acpidump. See if the device even exists in your
> DSDT but, perhaps, disabled (look at the _STA method for OTDG or XDCI)
>
> --
> balbi
