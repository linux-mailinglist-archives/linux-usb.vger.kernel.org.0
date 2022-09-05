Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6C95AD64E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 17:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbiIEPYz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 11:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238758AbiIEPYn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 11:24:43 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178456410
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 08:24:39 -0700 (PDT)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AC6D93F11F
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1662391477;
        bh=g146zNAqOIiaxRfFjyEWyS887hMtJQy+1QFNyABJP04=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Z4zr96dI4sv3pOTBL1abyUnCiMbjNxgAHgLvdvt4rdIiAXcmGqdrbcbEhs0f8TMfh
         pHdIqiN+UI8yn0wigItD3WqevwdnMhXr9Vw+XHSRrTiXmeyv+QtTVdM1qiuW/MwwOQ
         rBQav82GsuzT1307wsQzas4pyI7ejR8JntFpr8f8G8p4JrwgO3uQk+whC60tw9+Bq2
         ksZyXdNrDXR1SmyXAq5v3wXtdzOmao7egZ8q0w670QNuC8cHGwY08p9geJIca1bjnE
         KvGFfZdmIosAfMRu31TR/lP75yoOpsgQQiEFgFhg5jNex65m82fhJOv87bz2CfUqfh
         ZlnH1R19bv5Hg==
Received: by mail-wr1-f71.google.com with SMTP id o3-20020adfa103000000b0022514e8e99bso1368058wro.19
        for <linux-usb@vger.kernel.org>; Mon, 05 Sep 2022 08:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=g146zNAqOIiaxRfFjyEWyS887hMtJQy+1QFNyABJP04=;
        b=huFsd+oHgx4cpzKi/fFRfTYPAd/rgTRgJgvdNmtuLXLl05LJ9PNlB/e89/lkn2wZr7
         6Cnd+hCCvHwGmE6YmUSa8cH+tl1vYWFeBS6QT3ck7ICSMcNmag3IYu/0IZXF9mWN+dyd
         AqvIOOIiveY2YMDn29l5dFSF7YehhT9tHdZTCt9nflYFwvkeC53jcfduYTK/kCk35SH5
         OFrZ5fY/7YMlHiR+ffX6cYahwT6IqGzo1rcA2ArHEY9QvhpDYSNEaQZSGIyVl39CK7TA
         jpIDyARKrs1vD83a34jsE+BVX99Sn1rwgCtunHx9OhVLqxuds0MsaPVwaZHFU5PD9Nr4
         sPXQ==
X-Gm-Message-State: ACgBeo36t+FYrrETBjUGKO7AzSVtxWofyfPe4yITa22QwTdK+YB6+gHZ
        wJ/LIpRjlyf5Lxk5B5CQvAME2KpbZ+psh4vvNve4Q7a6IrF1Iy7OX4wNf2cKlMEgYstSSt52m/A
        n2srBa/sXiTnJ/ZxnHldF17PEDam5Zb4oY8GhJNHjoqY14CEif2nLqQ==
X-Received: by 2002:a5d:508c:0:b0:226:e033:c042 with SMTP id a12-20020a5d508c000000b00226e033c042mr18738864wrt.389.1662391477403;
        Mon, 05 Sep 2022 08:24:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR58aB0FpwdrnSxmhOkQKCebTZVB+w1RQdeso1rXEy4eMMgBjQOjuSIu0kT0g83M2OZWUATR+oRrrN8F98XJwMM=
X-Received: by 2002:a5d:508c:0:b0:226:e033:c042 with SMTP id
 a12-20020a5d508c000000b00226e033c042mr18738851wrt.389.1662391477192; Mon, 05
 Sep 2022 08:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220905065622.1573811-1-kai.heng.feng@canonical.com>
 <YxWgGKIAvsxwSz85@black.fi.intel.com> <CAAd53p4iV=ne5bDGZ6FxE9bBUVoFh=eXF9_oMPvPzjVj=UVoog@mail.gmail.com>
 <YxWqSYDWe0NitSkL@black.fi.intel.com> <YxX3JeQLbciJ+hhc@black.fi.intel.com>
In-Reply-To: <YxX3JeQLbciJ+hhc@black.fi.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Mon, 5 Sep 2022 23:24:26 +0800
Message-ID: <CAAd53p5hjmPgPNifo-QV9KU4DFbvPnrYV-YD2b6cSXNN=5GLWQ@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Resume PCIe bridges after switch is found on
 AMD USB4 controller
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, sanju.mehta@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 5, 2022 at 9:18 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 05, 2022 at 10:50:33AM +0300, Mika Westerberg wrote:
> > > Yes those root ports are resumed to D0 when something is plugged. They
> > > however fail to detect any externel PCIe devices.
> >
> > Hmm, so you see the actual hotplug but the tunneled PCIe link may not be
> > detected? Does the PCIe "Card Present" (or Data Link Layer Active)
> > status change at all or is it always 0?
>
> I wonder if we are simply missing the required delays here? Looking at
> the lspci dump in the bugzilla you refer the root port 03.1 supports
> active link reporting:
>
>                 LnkCap: Port #247, Speed 2.5GT/s, Width x1, ASPM L1, Exit Latency L1 <4us
>                         ClockPM- Surprise- LLActRep+ BwNot- ASPMOptComp+
>
> So when the link goes back to L0 (D3 -> D0 transition) the kernel should
> issue the 100+ ms reset delay in pci_bridge_wait_for_secondary_bus():

This was actually the first thing I tried but it doesn't work. Even a
5 seconds delay doesn't work either.

>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/pci.c#n5045
>
> can you check if that is happening? It should show up in the dmesg when
> CONFIG_PCI_DEBUG=y but I don't see it in yours.

That's because there isn't any child device yet, so the function bails early:
if (!dev->subordinate || list_empty(&dev->subordinate->devices))

Kai-Heng
