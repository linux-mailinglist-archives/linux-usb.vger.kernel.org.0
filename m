Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32963651426
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbiLSUmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbiLSUmv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:42:51 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2268711A02
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:42:47 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id i2so9967454vsc.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z8oCd/Pm1Hmgpcoa3tIG49zIBs1fxwhTneH98C02n5g=;
        b=MtIkhklUwk0t+gki0Bjfo9FL4+ztzi4C9haF2a5v64Kbl9eMIkMPRBJDvworF9CmJ/
         JXpCmWfdETyOazn5wIJaqtnXUPcg+DNBPgRYo4rfNY3qS7MKeAz/0M3yxsRwmB2VVLD5
         g5m0RHNWueiDeYI2olWHx8HFq2l2YlSFlIVMaWsCjUFkzpl+1OFOaZlHI1XZJBUTBAJ7
         S9EQTilhkH7ceIjOEq5YKJcgiwCj7AZRGq/RJVKK0PaZW40nhVsui+X1cSa9kypYBU7i
         gpdQsigRF0R/h8M0icLE2lc5NhFQJcyUYYCtzlTnZV9RZ0HeDbJwurFZDo55aZhRdkER
         YoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8oCd/Pm1Hmgpcoa3tIG49zIBs1fxwhTneH98C02n5g=;
        b=sEgiNe/S2RLa61RzU9uehZ9x1E/U9xwbpS2DcToDj30wxB5JP5RtRXoYhN7HmE5EQL
         vhQl2Kz5QIB2OBhGwZj+sIZPYemXpyb/LJhvR/Tuq3kpfsCDdQf7xVTYF+bT//W4/KRy
         XeltqMZqi7+xIqaXPNVa0IHJlSf6JMKPwlkDyNwBeCaRw40RREOXWZSnphXwG4fYoMv4
         JrCKqMYwGoofhwsjlStpmwZgOGGMFj4F6YwiHPBqU+RTTFvMGyo2hOBvcquQ1aIkiGWg
         YUyhuuBrNXI/NMO7tqBb+yo4Wow1pQKr2UBlhhgQKKAURzknm+mMchJse/LmO8NIprhB
         2C7g==
X-Gm-Message-State: ANoB5pkBEzn67MasCWAAYk7pKGKFVlXeAo4bRk0moN0z9xJ9TJhK66W6
        1i2j08ltluVgMKeYgbT3d0xGwK6yCMn2jgFHh43+/A==
X-Google-Smtp-Source: AA0mqf4yslSCRa2mcrqdsnDAC26l1GZxDMJ0agmgr6lSEMfHSkQBfqy4s20vsmSSEeWHDQbA6IX+5u6m3oVl1/0JZ2g=
X-Received: by 2002:a67:f04e:0:b0:3b1:1713:ba11 with SMTP id
 q14-20020a67f04e000000b003b11713ba11mr21184486vsm.76.1671482566875; Mon, 19
 Dec 2022 12:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20221216221703.294683-1-allenwebb@google.com> <20221219191855.2010466-1-allenwebb@google.com>
 <Y6DEWDeNw/yOXWWQ@bombadil.infradead.org>
In-Reply-To: <Y6DEWDeNw/yOXWWQ@bombadil.infradead.org>
From:   Allen Webb <allenwebb@google.com>
Date:   Mon, 19 Dec 2022 14:42:35 -0600
Message-ID: <CAJzde06a+deNszTj=zSSSqbm0M40QVP9Kw4aSKLwgWWy39Et1w@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Generate modules.builtin.alias from match ids
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 2:06 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Mon, Dec 19, 2022 at 01:18:46PM -0600, Allen Webb wrote:
> > Generate modules.builtin.alias from match ids
>
> This is looking much better, thanks! Please expand with proper
> documentation on the use case / value of this on the file:
>
> Documentation/kbuild/kbuild.rst

Thanks I added another commit with an update to the documentation
which will be included in the next version of the series.

>
>   Luis
>
