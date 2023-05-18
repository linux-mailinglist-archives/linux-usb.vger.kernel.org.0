Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 971E8707B40
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 09:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjERHkm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 03:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbjERHkk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 03:40:40 -0400
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C4A11F
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 00:40:39 -0700 (PDT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-76c6e0553f9so78147239f.1
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 00:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684395638; x=1686987638;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdaBrx490s8k6dX8A9bwP75JHCsfXxu79WG1YDEQ+kU=;
        b=TZPOckMEoaFoyNrTaN8BvemSWiEhEfrGoSiYFYfXtA/aJvB4PhQMHkwZIXMW7QzYAi
         Rnma6swtQEFjF1g4blN+szXfrsdLC9+XU6Ri6z/yaD8BGBABw0t5VQKi72mxOH0kit7h
         rPFBZm2kYtUOjPKnEgJu/rYLoYurHUA/OSYcF8q8f6Qb2f/L1nAb+2JW5LlXw6Ew4o6O
         9SMl4RkeVxXRjL1qhon0zQYHiivCKa6s8WB8NUw2mOSf9q+QiIf88Qve9klfV128UfhG
         vGskbQOwomf/soMgpvqreJauuaJuBKXF/Ii3Rk+0GjsYXEDhHZEA76P8FzmoxlximA6L
         QEcQ==
X-Gm-Message-State: AC+VfDwg7A/mEnZ6Bo0ciioBNzElnN6nypvg/BkACnfqyKsEqXclirSH
        WwzoQoliLMMiPxgH1oy0A5fqgnRhHF22wifWDqBWNYknS7av
X-Google-Smtp-Source: ACHHUZ5BSeJHwBlPAtnaWhHK6T9xhV3CzN1B/t33fjNEVVmiVfyZvhdq2Z74TG5jGUaYrDwcTXUEVGJx1XKuD6JL9ZzR1kLPfSI0
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3713:b0:40f:8f07:e28e with SMTP id
 k19-20020a056638371300b0040f8f07e28emr790444jav.1.1684395638617; Thu, 18 May
 2023 00:40:38 -0700 (PDT)
Date:   Thu, 18 May 2023 00:40:38 -0700
In-Reply-To: <ZGXVANMhn5j/jObU@ls3530>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b3803905fbf2eb97@google.com>
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in dlfb_submit_urb/usb_submit_urb
 (2)
From:   syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>
To:     bernie@plugable.com, deller@gmx.de,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/usb/core/urb.c
patch: **** unexpected end of file in patch



Tested on:

commit:         a4422ff2 usb: typec: qcom: Add Qualcomm PMIC Type-C dr..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
dashboard link: https://syzkaller.appspot.com/bug?extid=0e22d63dcebb802b9bc8
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1524090e280000

