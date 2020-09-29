Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6117727DC88
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 01:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgI2XNG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 19:13:06 -0400
Received: from freecalypso.org ([195.154.163.71]:38986 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728384AbgI2XNG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 19:13:06 -0400
Received: by freecalypso.org (Postfix, from userid 1001)
        id 1CC943740390; Tue, 29 Sep 2020 23:05:11 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH v2 0/2] USB: serial: ftdi_sio: quirk for DUART28C
Message-Id: <20200929230511.1CC943740390@freecalypso.org>
Date:   Tue, 29 Sep 2020 23:05:10 +0000 (UTC)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here is the second version of the patch series (reduced to just two
patches now) that adds the special quirk needed for FreeCalypso
DUART28C adapter.  The first patch in this new reduced series is a
preparatory change that makes it possible for quirk port_probe
functions to determine which FT2232x or FT4232H channel is being
considered, whereas all controversial changes are contained in the
second and final patch.

Mychaela N. Falconia (2):
  USB: serial: ftdi_sio: pass port to quirk port_probe functions
  USB: serial: ftdi_sio: add support for FreeCalypso DUART28C adapter

 drivers/usb/serial/ftdi_sio.c     | 80 ++++++++++++++++++++++++++++++++-------
 drivers/usb/serial/ftdi_sio_ids.h |  1 +
 2 files changed, 68 insertions(+), 13 deletions(-)

-- 
2.9.0

base-commit: 031f9664f8f9356cee662335bc56c93d16e75665
