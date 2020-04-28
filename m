Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E1D1BD019
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 00:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgD1WgU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 18:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725934AbgD1WgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 18:36:20 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06675C03C1AC
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 15:36:19 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id h69so29437pgc.8
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=n8c6Rn7I81IWlHbDwF2oGUTtj/7LdMGsy5vylDr+u00=;
        b=ELw+6uNhkmr4q0e6y1fgqRlPXBP0RkiGV6LyVPYL4cRkvJDRdRSRdZfEDcS/ckOETU
         TXlBoA6U3hhLH+8GHnVo3YwcD2QjU5WU+f56TyEgofoi4/N5YHXCzL3lxd/UafY71GVq
         xxx6BD9XetiTLcLaPck/2wH2Cvn3QHpYVbZR9i6cFVxwq5TNpOykqjOsuY5trhoZ26FR
         UAjXTBiJU3UR05TZu57MvMN5RcyZadzdhZ6sPsX+X4wx4w1ps1NX1YwRCtnLa17usR9H
         s8wDv2ImHjyC6j4lddhbZFsLX5eOYLqMAadRrYrTABvUuGDohY98t0yfvHE/BaQ3yx3w
         j03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=n8c6Rn7I81IWlHbDwF2oGUTtj/7LdMGsy5vylDr+u00=;
        b=fR0jreEhdr+ow55lsfz3do+FQk7KwZ9E6gbJ1Lm2OojWElhyhlZfAVFtibCSoso6YN
         9iYcHUgY3zHSrUAY120vHC3CBJeCGADYBMfcz7Gpup0yLuoLLKXAtr7+oQR3WfVq43VO
         mSnJ8xeZlIr7laE2AkbIzOWHAZ5TqrdKuqHIuzBm1A1IdBQjLQAdW8JujER9hU/AG3ht
         yQoP5eHukyeGaaXLCM5OlhF2TMqhL9SRec6BBlz1qVVzp6qFE/mlS0SKxGVoj4txx1Ml
         ALnTSb9o7PCEjfX/JoLjR4VNetMZp9QCk/Zks7ZHsDXEFqHdIRc+VJUfk82f5wu3DLM+
         cFUg==
X-Gm-Message-State: AGi0PuYwJZPjNP5+J+fjVgD5H/QKOrxUeA9RpZwljpihlTjN7HjxWhRM
        9vkTVcF4oJ+dbtoOpnvTjDT3RluJ+INeKXO6pmAKBWzqKjCImQ==
X-Google-Smtp-Source: APiQypL2RGg3tCQQ6fQp3sooYBLchp/xnBOJBFRumjnj6MPmmQgYsH5Pp9mfeUGdcALSMGiIyP02GmNOKFLgEi2Eh5E=
X-Received: by 2002:a63:1d54:: with SMTP id d20mr30935797pgm.286.1588113378873;
 Tue, 28 Apr 2020 15:36:18 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 29 Apr 2020 00:36:08 +0200
Message-ID: <CAAeHK+zBLWKn-YQjoD6S5uwwhuB-kTmdnBD28E06ujrx8ymv7A@mail.gmail.com>
Subject: Recommended USB3/SuperSpeed gadget device
To:     Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

What is the recommended driver/device to test USB3/SuperSpeed gadgets?
Ideally something cheap, but at the same time with good driver
support.

I have a EC3380-AB board [1], which kind of works with net2280 driver,
but it passes almost none of the usbtest tests with g_zero (only tests
#1 and #9). I need something better.

Thanks!

[1] http://www.hwtools.net/Adapter/EC3380-AB.html
