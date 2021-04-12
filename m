Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9698935C2F8
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242399AbhDLJxj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:35524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240692AbhDLJs0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:48:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C46B061263;
        Mon, 12 Apr 2021 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618220888;
        bh=1fHCnFvChZDUleCUIgXDai7+hqmtbUb0GWhzUtterYs=;
        h=From:To:Cc:Subject:Date:From;
        b=TciP08KIoVc5pRskuDJkimI1CYwdbVnCQRD3m6zbH5yFb96IrJyuoNmQEMseuXsyB
         YTPikZ4LnHw2kg2rwD8PZkJFIWJnsRxm4/IhmGo3mlKAdlFItaFyPQJtvT5Jk1Jrfl
         4q6ald+mGjQ11KPLsi8YShsJsts/OjlftNWsXSCC1LMW8nS/ASPeVfRCb847ngwWUX
         J6xAybpfciK+J1jAQNYBGbbP0tPjAgD1RiNDV2lIjYroStml3kh+N/JvA85eOqFinC
         cqhZu7VV2EsTw0sQvDrZ3ln4uc9BT4y5tjRk+2MOJ/1mv5FyU4dUwXQgxlKXOXv0Nc
         GZ+0uUDrUBqRg==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lVtAo-0000GB-45; Mon, 12 Apr 2021 11:48:02 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 00/10] USB: serial: clean up the ti drivers
Date:   Mon, 12 Apr 2021 11:47:28 +0200
Message-Id: <20210412094738.944-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The io_ti and ti_usb_3410_5052 drivers are drivers for devices based on
the same TI chips and one appears to have been based on the other
judging from the code similarities.

This series clean up their implementations a bit by introducing
port-command helpers and fixing up some related style inconsistencies.

This is based on top of the recently posted closing-wait series.

Johan


Johan Hovold (10):
  USB: serial: io_ti: clean up vendor-request helpers
  USB: serial: io_ti: add send-port-command helper
  USB: serial: io_ti: add read-port-command helper
  USB: serial: io_ti: use kernel types consistently
  USB: serial: io_ti: drop unnecessary packed attributes
  USB: serial: ti_usb_3410_5052: drop unnecessary packed attributes
  USB: serial: ti_usb_3410_5052: clean up vendor-request helpers
  USB: serial: ti_usb_3410_5052: add port-command helpers
  USB: serial: ti_usb_3410_5052: use kernel types consistently
  USB: serial: ti_usb_3410_5052: clean up termios CSIZE handling

 drivers/usb/serial/io_ti.c            | 175 ++++++++++++--------------
 drivers/usb/serial/io_ti.h            |  38 +++---
 drivers/usb/serial/ti_usb_3410_5052.c | 146 +++++++++++----------
 3 files changed, 170 insertions(+), 189 deletions(-)

-- 
2.26.3

