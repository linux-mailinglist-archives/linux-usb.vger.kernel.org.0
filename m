Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4DE21D40F
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 12:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbgGMKz3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 06:55:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42592 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729059AbgGMKz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 06:55:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id h22so17026933lji.9
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 03:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vvkKz4vLERv1GuIhHLvSQD7Xzg2tZ6UgOD/EWCw0zgI=;
        b=HGf6BgpmNXdQaGM0P1XbLGwG034FfepE5O+H6IQ+vPIfPrm675U566QIXbwt+hwmae
         jayp1xyLSDUH2+HVdZ9FG7t2jY1hj8izwcfzAQC049SlWxd7y8oxjklEc70Vz+cg3s/R
         qz9DVaa4PFixM9p5JvS7Mh7tq2UtCoGUsSOipk0+ZT9zpvcIdqdOCEDmvyt+GlhL25/Q
         8ft64j/kiLqe1l7LrPCnAS8OScma6c75Id10fPpQ3S/JtFzIezc9ewxluQS1OXE8kyww
         wLJq5Krce3SD3K32UwNJ8XEWxVwctqgJDbfD9gp497E+rlYInwwor7+gfEvQnrHNYws0
         sgow==
X-Gm-Message-State: AOAM530r57EmkaTtwLayN2I0S1Fkd+l8O0XwXiM8xSv4kB/t/ZyUoEvc
        CSgAaKR9qCmhA652G8280mSLhz4BweY=
X-Google-Smtp-Source: ABdhPJwdQCLLQNkHBGZAmpDJFh4Z6w+Fn8+uzLXV1VrV/E8sbSkay9O+uRE9Zc6hCHKAhhncs0Zm6A==
X-Received: by 2002:a2e:b4ec:: with SMTP id s12mr50193777ljm.155.1594637726320;
        Mon, 13 Jul 2020 03:55:26 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id j25sm4551812lfh.95.2020.07.13.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:55:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1juw7R-0007FA-Um; Mon, 13 Jul 2020 12:55:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Jarom=C3=ADr=20=C5=A0korpil?= <Jerry@jrr.cz>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] USB: serial: cp210x: add support for line-status events
Date:   Mon, 13 Jul 2020 12:55:12 +0200
Message-Id: <20200713105517.27796-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series add supports for line-status events that specifically can be
used to detect parity errors.

The implementation relies on the device's event-insertion mode, which
can also be used to detect line-breaks and modem status changes. But as
this doesn't seem to work as expected on CP2102, support has been left
unimplemented for now.

Included are also a couple of cleanups.

Johan

Changes since RFC [1]:
 - drop sysrq support which relies on break detection
 - use 0xec (instead of 0xff) as escape character

[1] https://lore.kernel.org/r/20200703150104.GE3453@localhost

Johan Hovold (5):
  USB: serial: cp210x: disable interface on errors in open
  USB: serial: cp210x: add support for line-status events
  USB: serial: cp210x: add support for TIOCGICOUNT
  USB: serial: cp210x: drop unnecessary packed attributes
  USB: serial: cp210x: use in-kernel types in port data

 drivers/usb/serial/cp210x.c | 209 ++++++++++++++++++++++++++++++++++--
 1 file changed, 201 insertions(+), 8 deletions(-)

-- 
2.26.2

