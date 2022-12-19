Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A90651017
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 17:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232212AbiLSQPy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 11:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiLSQP0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 11:15:26 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C97BFCC1
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 08:14:59 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id z17so3985200qki.11
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 08:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wz0/4Z/asAjxOB9xpilCscU+rlNRO5Y4Rn9H7xqB8lg=;
        b=ivP/2/ckykVUfBfXmiNa7uU5bu1QttRqJEL011iDfUG82Fs5fico+YyPNcY4oRO4Oh
         TPUFsmSkY5yZ1dQujZm/eoeAZcnIciuQ+EZESgjBhDcbGHJy6RLkfNt+EQB91IpzIe+v
         BuqTLFuJ56+rUrDe/0lkEnKFEtVkLIUUesMKqk9rjyC9Hu+B0BV85fjb9rSTr9vYjHTy
         BlQOmUH+S4CcBDg3GyCH88aUsaygBkapEP9QvFg88WHxUMni+Dmhohk7MkvjqV5e/9ol
         29fGVGLnYyh6rUZOxWittYcmdjy2ql832lFN+9hkE/mJlcbZ99id8cbroOEOm2q800CF
         klZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0/4Z/asAjxOB9xpilCscU+rlNRO5Y4Rn9H7xqB8lg=;
        b=jQ6KsFceVEwrWtBNG03ZFfwqvWd0wrKSUUBz0p+BkxGXEO4a/vbRBK7KAc1k/4xhZG
         RVyOpJrHo/JIn+W6+tuubPlPr/xhGTeHRPCSw+s30JEFy3PPjGsV3aY/Hs5br/s3TJaS
         h8TougWcqOiKaxH39UwIK5xclF/6SpZn33iPy2qj4Z+ynJO+jhu+qZmnbRP24I7jq6GX
         C8HNsCBoULbgVIDxA4tY73WpQ3EtyftmZ8YEWgf34yvFuQUy5DGQucVZSM4FX09T8CTi
         1TAWvQehbyDslwPljHcqJ3yer6TyeCwXcsBKZe43SDMmcx3vMGBOZJUltc+5B/M/5Lnr
         qpGw==
X-Gm-Message-State: ANoB5pn4gwTHKmxJuM58KzxPQZD2+QH75aFNhL5CD4/ckhvJFW1rLGy4
        bAkB8dgrNJXcfaJhmPZxSvvqGXxdRAWPC0JPvpkmvbP1AAPgSXuO
X-Google-Smtp-Source: AA0mqf6sNboAtSpjhRLe7LA6A8jlCQiBt27+UBHdqsLjO+IJGI2bFxAHQystlDufRMA0VO412l+XSjf+Ha6ONYJaAO4=
X-Received: by 2002:a05:620a:480a:b0:6ff:9c88:481a with SMTP id
 eb10-20020a05620a480a00b006ff9c88481amr1543184qkb.493.1671466498057; Mon, 19
 Dec 2022 08:14:58 -0800 (PST)
MIME-Version: 1.0
From:   Jonathon Reinhart <jrreinhart@google.com>
Date:   Mon, 19 Dec 2022 11:14:47 -0500
Message-ID: <CAJJa5Hyw3yBL81zp=k1r4x8BaVqmGbMpK4dbPomQ81JZv6wZSQ@mail.gmail.com>
Subject: dwc2: Application of DIEPMSK when reading DIEPINT
To:     linux-usb@vger.kernel.org
Cc:     Vardan Mikayelyan <mvardan@synopsys.com>,
        John Keeping <john@metanate.com>,
        John Youn <johnyoun@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

326015887b6a: usb: dwc2: gadget: Add dwc2_gadget_read_ep_interrupts function

Prior to this commit, the DIEPINT / DOEPINT interrupt status registers
were directly read and written-back to clear. But after this commit,
the register value is masked with DIEPMSK / DOEPMSK prior to clearing
or being returned to act upon.

Can anyone explain the purpose of this change? In what case will the
*INT register have bits set which are not set in *MSK (and will be
subsequently ignored)? Why should those be ignored?

Thank you,
Jonathon Reinhart
