Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17092249CCB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 13:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgHSLzl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 07:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgHSLzG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Aug 2020 07:55:06 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8B1C061757
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 04:54:56 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id ba10so17851189edb.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6fg9iS25jVW9vT2Atd1JR+Ra5fbPrScKI70vf5hPbo=;
        b=K5CAZrUgQKuvEnVvJQprLOkW1RHxRIYHJNhWlND/M7zfUnLzHM994Wk61kv+fdxlqO
         bbngZT1sPJYxp/kQMe33SjaH7bzQs5QrWnxovTttDWsm1r6ogz+IXNV0G8hWBT8xwCb0
         Uf6MhLxqoZ0DI5BC3pp1vG6AC0pa2sYrNfx3MmORWQdcjN/IAjZ44zjoc0mKbHrJg/sa
         hf6VEjPiX9a89yBJ5m4txit7VKidF70tsd/4xd39JwpemLBL5VkpR9DDeVXWUZ2hXaoB
         Qmmw08kOYEQ5Rji7u9/tGUgzFyOBSB13chPb4xmVhDDh5CQ2srTsLswHEmRRsqH26lKH
         0NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6fg9iS25jVW9vT2Atd1JR+Ra5fbPrScKI70vf5hPbo=;
        b=KygNZlugYd5KVnqAI443eDw6CPROB1OR5J23G/nug8kYlVE6tMzHT0YH6iL4tY6wvN
         SOfWZXXWeuUC2NYTDune7UzqE5PyXZ/XumCVMjc4N1wBvQcbYqQUqbzP1bdvYwl7P5U1
         mYnxdHpoZTlsqpVgzjOl4IwerS+A+A5PtHHOIzha/jBBrQWL8gdTD8J/ZME6usaxs3DL
         oYUhSslBg1EUMzOqpsDDZ8tb9fRqFU5pWShI7OcarD7agL8lDZQXmSakeRzDepGBUcE6
         cme/gQY9NozkkSFdz5vfFmBVmJ1xBf+Zk+kwcy7Ls1letPZZUDlP4JuS39S99kIdc99f
         fx0w==
X-Gm-Message-State: AOAM530GDlpSt6MhcTjdWCPJA5it7eBQGHmGIh2GmXEbIMUENe2iUD8l
        UwjNm+FuJIUZ0ch1vuMUupt6+RCx0cTEjMs4rl8=
X-Google-Smtp-Source: ABdhPJzy9+IV1m3Vsfp24g3dvVT0J8nLsiKfEj6aq99BDMOCy+suf6OeXBibUkDM/TC+ONl+OIx2/SVTy0RrPilt9O8=
X-Received: by 2002:a05:6402:847:: with SMTP id b7mr25205766edz.39.1597838095220;
 Wed, 19 Aug 2020 04:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200819112716.59074-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Wed, 19 Aug 2020 14:54:39 +0300
Message-ID: <CA+CmpXs+WHj_PS51s=nOAJp9pvn6atDhVi0FtNasHfqqJ9MhXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] thunderbolt: Disable ports that are not implemented
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        "Nikunj A . Dadhania" <nikunj.dadhania@linux.intel.com>,
        Srikanth Nandamuri <srikanth.nandamuri@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> - * @disabled: Disabled by eeprom
> + * @disabled: Disabled by eeprom or enabled, but not implemented

I'm not a native speaker, so I'm not sure about it, but maybe the comma here is
superfluous and just confuses the reader. To me it looks like it means
"(disabled
|| enabled) && !implemented" instead of "disabled || (enabled && !implemented)".
Any opinion?
