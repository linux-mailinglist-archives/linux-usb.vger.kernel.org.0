Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E389235C30C
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239631AbhDLJ4s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:38460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244733AbhDLJ4g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:56:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D4B561245;
        Mon, 12 Apr 2021 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618221378;
        bh=cN/MJ8q29CZ/zLz2VNS+LKCD7Thzvdqcxh9F/Zf9a2w=;
        h=From:To:Cc:Subject:Date:From;
        b=NFoKBSTBKPAu4RkuyiUKAnAmS1L3RPlOmn8UnpNTrphdf0q97XwGwEJRqjCRfw5gZ
         Gcn02vKPYeLxnVDHqMXnvR1iPDQnx65ucgVxPyjbuyYzPNKQfC/lbyCnwsPTmgEfzF
         tvBtc6mTF+g1LxiC4pAzkhfK5GYqM6XsJrUBak9KrsFnV7de3knDvI4+YSojCTKpE/
         3INQHcPf/HQIJsZmf91iAdH6n2mYTwPOPfbK0hcezgHbtzMYuLQe0IvQWDVuln5I1w
         5mwlI3y21OOQ++Gno7Fmjhgei+0UTrfkGK8s1z29rSdgC/CPgxra+3UfeoY4xu0bv+
         8q62roxPmUUkg==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtIi-0000KW-Dp; Mon, 12 Apr 2021 11:56:12 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 00/12] USB: serial: xr: add support for more device types
Date:   Mon, 12 Apr 2021 11:55:45 +0200
Message-Id: <20210412095557.1213-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ I apparently missed the last three patches of the series when posting
  on March 30th so resending the whole series. ]

This series adds support for another nine models of Maxlinerar/Exar USB
UARTs to the xr driver. The various models can be divided into four
types:
	
	XR21V141X
        XR21B142X
        XR21B1411
        XR22804

with different register layouts and features.

All types can be used in CDC-ACM mode but further features such as
hardware and software flow control and in-band line status are available
in a second "custom driver" mode.

The fact that hardware flow control is enabled by default in CDC-ACM
mode also prevents using the standard CDC-ACM driver in cases where the
hardware engineers have failed to properly connect the CTS input.

The currently supported XR21V141X type stands out from the other three
by not being able to accept CDC requests without always entering CDC-ACM
mode, requiring a different enable/disable sequence and by using a
distinct register layout for certain functionality.

Expect for the above, most differences can be handled by simply using
different set of register addresses.

Note that this series depends on the recently posted
multi-interface-function series.

Johan



Johan Hovold (11):
  USB: serial: xr: add support for XR21V1412 and XR21V1414
  USB: serial: xr: rename GPIO-mode defines
  USB: serial: xr: rename GPIO-pin defines
  USB: serial: xr: move pin configuration to probe
  USB: serial: xr: drop type prefix from shared defines
  USB: serial: xr: add type abstraction
  USB: serial: xr: add support for XR21B1421, XR21B1422 and XR21B1424
  USB: serial: xr: add support for XR21B1411
  USB: serial: xr: add support for XR22801, XR22802, XR22804
  USB: serial: xr: reset FIFOs on open
  USB: serial: xr: add copyright notice

Mauro Carvalho Chehab (1):
  USB: cdc-acm: add more Maxlinear/Exar models to ignore list

 drivers/usb/class/cdc-acm.c    |  14 +-
 drivers/usb/serial/xr_serial.c | 727 ++++++++++++++++++++++++++-------
 2 files changed, 580 insertions(+), 161 deletions(-)

-- 
2.26.3

