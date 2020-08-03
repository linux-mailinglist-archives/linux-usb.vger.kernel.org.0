Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD9E23AAEC
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 18:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbgHCQwk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgHCQwj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Aug 2020 12:52:39 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E583C06174A
        for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2020 09:52:39 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id d6so25519083ejr.5
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2020 09:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bYLsuDNeYmXjAqJcuQaIvamx1n5LjHBuHc3r5Zxp1cQ=;
        b=AqyC8QmhCii5gXwoi3UhhXuQnu3XabC85GPdoV74iNciuqOX+xiRMRgw84Bvyn2imo
         v8ba37Buz5lTtgcu37KQWy3pdZxnyTEZ1aiZZNr7Lu7387TfSxO4MEaV/8AxG9C6twPm
         Zh1k9ubBTfJUNWaZsfovFIRSzmPF1lVZ/7tNVbke5Pb6EMt+V7vMvhmH/JsOtssan7hh
         /T2kWx+FZmmEBL+pH0F0vnUmzwOq2jWH0ns2z3PmLyU1ycUikxPJupfqZIWXJfTHEyvD
         gwWvpMAxl7BOJzBsJH/psiKIhco75xwNc3m/OI3dOtUlk8ZbeMhDevDZspLbV7+2zcHR
         DZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bYLsuDNeYmXjAqJcuQaIvamx1n5LjHBuHc3r5Zxp1cQ=;
        b=hLk53vVlkV5Bp32+P2725cfnRXI7ReF6tmnSBE6hyDeL9RoRD+xCWJH2dZ9DHphpJN
         YKDIHwUZHaDsUQWTN5qdrwpSlh9RRxLFu1UvQhp/56Yvk37QQ0uRLqK2RVv6y5orwczl
         qn2HkRwXEmYsLzZgIRt8QWMMQXB3B1cEq0rUSYASYWCFpcRTvDYpAXK9ZNFP3nXeiH3N
         jv3MYdqd9fOSlPIWyWMCo/JJ+GwULGfZM+2PNPyTK6MgIxtlIdM/k7+S2GTzTuyDWVAu
         bQuYCfNCGjk039evgzVLYvZqaBIbLghDBTnXbS9j/vaTi8qIJrPH/3w2Sp90uVW6dky+
         M0YA==
X-Gm-Message-State: AOAM532DwXLgqYKckX5f7aKUvuijwbZQbSXVElVMmiJFczIRoj7b1N3s
        JCsUfiJ81MtYNWulHiGwaVOg3y3JmcEuS0wMrwo=
X-Google-Smtp-Source: ABdhPJzc3YTnHLNxLx62d4dJ3yjY4ZvbJ8uKWtQ9vXRMOuxIMyHcv2cMgJHlnZRdW7p4T1M2Egun+MpWDy1Q4cZ+NzQ=
X-Received: by 2002:a17:906:b08:: with SMTP id u8mr18058308ejg.401.1596473557998;
 Mon, 03 Aug 2020 09:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200731033620.GA4428@hp-x360.mattst88.com> <20200803105404.GQ1375436@lahna.fi.intel.com>
In-Reply-To: <20200803105404.GQ1375436@lahna.fi.intel.com>
From:   Matt Turner <mattst88@gmail.com>
Date:   Mon, 3 Aug 2020 09:52:26 -0700
Message-ID: <CAEdQ38FRBg_ptDWVr7yRwC4GCd5DxWkBzH+HyTJXL56v2cL4+Q@mail.gmail.com>
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

On Mon, Aug 3, 2020 at 3:54 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Can you try the patch here?
>
>   https://lore.kernel.org/patchwork/patch/1257708/

Thanks.

It looks like that doesn't fix the problem. I hotplugged the dock
about 25 times this morning and it was only successful once, very
early in the testing. I didn't think it was going to be that rare, so
I didn't capture the log and now I can't reproduce it :(

Any other ideas or patches I should try?
