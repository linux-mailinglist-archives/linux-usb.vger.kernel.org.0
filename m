Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A762ABEE28
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 11:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbfIZJMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 05:12:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42884 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730190AbfIZJMv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:51 -0400
Received: by mail-lf1-f68.google.com with SMTP id c195so1110822lfg.9
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=86zRUVfrv1gM2heltfetGcfT+aUYDu+euELROz6td7U=;
        b=iGHfZVxLDtJFIey8MSPeZk4I8mmGQgDL9T9nffOCdibO5zstsjoHWjstSvJqb8qbz3
         YFKWYltxc9geaif3f6HwHbE7jjY+AJGF7IgFjxkEAh2mE2mznU20LErFGdpevK5fHdAi
         5hdo7W91eYDyUrScSpSFVUhiUq2vfWaYMRKNCZrTiPn7ahXSH+SEiaHhMnQFGcXb3tJv
         yAc0vHhq0G2U+zRhJjniKt7VuynWtgLBIlV0jiZelVb1j9knUNmlkmKSUeIyL7j+gUez
         ZSCLQwrnH1DpChMnpivUdQsJvR3oExu3WnOufIQ71OdpN1mA2ofgpk9cbmQjqFxcsCGk
         Y4Ow==
X-Gm-Message-State: APjAAAUjcP3O48kZtbZUfJoRvH/exdWdWGSo18tn6DIT/M+Rj+0971DR
        cEEtqOLtuzdEZu782GHlfcg=
X-Google-Smtp-Source: APXvYqx0x3VPQk1+Z0U88budoGsGVoH3N7pBPk88BxF12x3XhdQ4qig+OkylYMy0c/guN4fOfcR2zg==
X-Received: by 2002:ac2:5dfa:: with SMTP id z26mr1524557lfq.145.1569489169554;
        Thu, 26 Sep 2019 02:12:49 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id g26sm370138lje.80.2019.09.26.02.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpS-0006Ql-3z; Thu, 26 Sep 2019 11:12:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: usblcd: disconnect fix and locking clean ups
Date:   Thu, 26 Sep 2019 11:12:24 +0200
Message-Id: <20190926091228.24634-6-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926091228.24634-1-johan@kernel.org>
References: <20190926091228.24634-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes a failure to stop I/O on disconnect() in the usblcd
driver. Turns out there was a lot of legacy cruft in this driver which
could simply be removed.

The first patch is marked for stable and could go into v5.4 while the
rest is v5.5 material. Posting all at once for completeness.

I was tempted to rip out the custom ioctls() used to retrieve the driver
version and bcdDevice (sic!), but decided to leave them in. I doubt
anyone would miss them though so perhaps we should give it a go?

Tested using a mockup device.

Johan


Johan Hovold (4):
  USB: usblcd: fix I/O after disconnect
  USB: usblcd: drop redundant disconnect mutex
  USB: usblcd: drop redundant lcd mutex
  USB: usblcd: use pr_err()

 drivers/usb/misc/usblcd.c | 60 +++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 27 deletions(-)

-- 
2.23.0

