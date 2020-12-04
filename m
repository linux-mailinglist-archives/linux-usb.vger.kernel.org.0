Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482F42CEA30
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 09:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbgLDIvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 03:51:44 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38184 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729082AbgLDIvo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Dec 2020 03:51:44 -0500
Received: by mail-lj1-f194.google.com with SMTP id j10so5700144lja.5
        for <linux-usb@vger.kernel.org>; Fri, 04 Dec 2020 00:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gxdRXQPzWG0g9KnZpxDAKf5htR7d8gCSZ/HPNkTZpvM=;
        b=eWDCBMZcdE/WTsfwllC4XJhgs3AN2wKnC6k4mxJ8uEQoUW+Tw+ua/q8lJfcszVa/rl
         lutvoe9I3gypCy4zX/mMD7mhxnYy9a83o8IrF/6PZQqmxcEgx/Vcouu5f1abWWNBGSqN
         IOcjy63/0KHeGBF0tlqrrD0ysozEQKlHXhca97jz5+zru+kG2L8EYiIj6iwM8nGqKnhX
         3aZZyfDI0etV5UNg9+P3M8lYtwDl2Iw5gg5xA147bi4Ry/mePifnqMYAAzWQN018xWhA
         iIGOa+/Iau7sW//YCH2xOpzDci8iSnAhp6ydBUohm6MHcbMkxV1HRHiAcfFD1oLZrjmx
         pa+g==
X-Gm-Message-State: AOAM530M9fJsPoCn+e7DdFMBi6lBKQHty/D1AKNiJ2rniirT9RJi8auA
        vqH2lRDewstRyh3kjsrxAp0=
X-Google-Smtp-Source: ABdhPJwLhFnwiaarwZo85CuQJF5EIldR1Z9//5CYzQEyypOcy6ieKXKY89VWnisuY2H05eHbtKYvZg==
X-Received: by 2002:a2e:8e6c:: with SMTP id t12mr2980855ljk.441.1607071861990;
        Fri, 04 Dec 2020 00:51:01 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id u20sm1423990lfo.297.2020.12.04.00.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 00:51:01 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kl6oQ-0005EK-7n; Fri, 04 Dec 2020 09:51:34 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] USB: tweak the new control-message helpers
Date:   Fri,  4 Dec 2020 09:51:07 +0100
Message-Id: <20201204085110.20055-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The new control-message helpers include a pipe-type check which is
almost completely redundant.
    
Control messages are generally sent to the default pipe which always
exists and is of the correct type since its endpoint representation is
created by USB core as part of enumeration for all devices.

There is currently only one instance of a driver in the tree which use a
control endpoint other than endpoint 0 (and it does not use the new
helpers).

Drivers should be testing for the existence of their resources at probe
rather than at runtime, but to catch drivers failing to do so USB core
already does a sanity check on URB submission and triggers a WARN().
Having the same sanity check done in the helper only suppresses the
warning without allowing us to find and fix the drivers.

The first patch drops the sanity check from the helpers; the second
removes a redundant check for short transfers in usb_control_msg_send()
which is always treated as an error; the final patch switches to using
-EREMOTEIO for short reads which is the error code already used by the
host-controller drivers for this.

Johan


Johan Hovold (3):
  USB: core: drop pipe-type check from new control-message helpers
  USB: core: drop short-transfer check from usb_control_msg_send()
  USB: core: return -EREMOTEIO on short usb_control_msg_recv()

 drivers/usb/core/message.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.26.2

