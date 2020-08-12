Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9308A2430ED
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 00:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgHLWkV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 18:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgHLWkV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Aug 2020 18:40:21 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02E8CC061383
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2020 15:40:20 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id p24so4003605ejf.13
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2020 15:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gYDmnGvACnkOAPN8+MamTFaT81eqpKhy3Q9f5259sfU=;
        b=gjSVOoVHsOplCetS0MgAsB4H3CxYA9S6yWIdoOtw84ur776TXsMRYSOH6uEaOkpAkJ
         /TKMAQ4YW7dHS65rRtwkorysfZQr4Sn+nbPzVGm1KXva+dtZcbw9KX8rn58CjDMd1HQt
         nR6uncvYHRXy6ztcA6jPJQEswsGm3SABXrbf76p9QacHkYV4dhhPgK+rxaOZHhQ1E1MC
         pF1tFimxbUz2guVhBZyvhtlNgyUVn9ORALpcgNWZ/tOXqpYodFyazyVB/ppcRHXomyVD
         zwBbZNaq/Sr0h6vSYEwDlrc9qJPpV6UY5H+FlXCzeQy/Z7m3hjbuULgMCoIA+zhezvU1
         oHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYDmnGvACnkOAPN8+MamTFaT81eqpKhy3Q9f5259sfU=;
        b=IVA63lH7TUExwCZ9UKXIuGCxu8gvwM3Yi+oX30OqZ5e7MtHD3wsCrwTlABfyfxnRmv
         F9oo0y5WRkhbfq8GrWtMy+wb5bNE9BF2/xV3J5vGZWjPGluexZmzlLiMnF2ef/I11ddQ
         FNY6qfOMiczUB/dq3XuGXdjwBUTrHCtPfkib+aq7xOMjKh9sZeN40PEaMtxWDxBf9N5c
         AdgSBdOiDF6BzH7paexl+5OVgFebJRQKdTM5q4k3Uv1vMiVjqPn9gjRy8JIjg1WFMvwZ
         6bvmO/y6VuDfPDtq38CMKyAZBtasLNpv48rN/wy5b3kALd47QE7qy1RiVCJ+2t013RRz
         Qj3g==
X-Gm-Message-State: AOAM532Wngb1IEz9x0VwA3KXD+MiIVJZ1RAAi/npgfepH7z0Wqe5J53H
        GaN0k6eEc6PgHXGBS5ZONPAoKA2pRzWZB4w2Lew=
X-Google-Smtp-Source: ABdhPJznotefPpMajXiB9TS541fA3xLWkSLzGpsHSNMZcaPigIbDErF0jxPPHSP+MkY1BmQCvCSrPlUw6bUXQ52ouGY=
X-Received: by 2002:a17:906:fa15:: with SMTP id lo21mr2137239ejb.42.1597272019733;
 Wed, 12 Aug 2020 15:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200731033620.GA4428@hp-x360.mattst88.com> <20200803105404.GQ1375436@lahna.fi.intel.com>
 <CAEdQ38FRBg_ptDWVr7yRwC4GCd5DxWkBzH+HyTJXL56v2cL4+Q@mail.gmail.com> <20200804114717.GN1375436@lahna.fi.intel.com>
In-Reply-To: <20200804114717.GN1375436@lahna.fi.intel.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Wed, 12 Aug 2020 15:40:08 -0700
Message-ID: <CAEdQ38ETGv=jZt-8wpP_cA4NdqgEReoZvqptWubPosnTdOoFtw@mail.gmail.com>
Subject: Re: Thunderbolt hotplug fails on HP x360 13t-aw000/86FA with HP
 Thunderbolt 3 Dock
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 4, 2020 at 4:47 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Aug 03, 2020 at 09:52:26AM -0700, Matt Turner wrote:
> > On Mon, Aug 3, 2020 at 3:54 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > Can you try the patch here?
> > >
> > >   https://lore.kernel.org/patchwork/patch/1257708/
> >
> > Thanks.
> >
> > It looks like that doesn't fix the problem. I hotplugged the dock
> > about 25 times this morning and it was only successful once, very
> > early in the testing. I didn't think it was going to be that rare, so
> > I didn't capture the log and now I can't reproduce it :(
> >
> > Any other ideas or patches I should try?
>
> Can you try so that you boot without device connected. Then plug in the
> dock, and wait a bit for it to enumerate (you can check thunderbolt
> related messages in dmesg).
>
> Then send me full dmesg and output of command 'sudo lspci -vv'.
>
> I also sugged to file a bug in kernel bugzilla
> (https://bugzilla.kernel.org/) and add these logs there as well.

Filed as https://bugzilla.kernel.org/show_bug.cgi?id=208891 with the
information you requested.
