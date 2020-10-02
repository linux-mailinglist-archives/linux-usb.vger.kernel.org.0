Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D29281B22
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 20:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387806AbgJBSta (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 14:49:30 -0400
Received: from freecalypso.org ([195.154.163.71]:40218 "EHLO freecalypso.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgJBSta (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 14:49:30 -0400
Received: by freecalypso.org (Postfix, from userid 1001)
        id E655E3740218; Fri,  2 Oct 2020 18:49:28 +0000 (UTC)
From:   "Mychaela N. Falconia" <falcon@freecalypso.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, mychaela.falconia@gmail.com
Subject: [PATCH v3 0/3] USB: serial: ftdi_sio: quirk for DUART28C
Message-Id: <20201002184928.E655E3740218@freecalypso.org>
Date:   Fri,  2 Oct 2020 18:49:28 +0000 (UTC)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here is the third version of the patch series that adds the special
quirk needed for FreeCalypso DUART28C adapter.  This version of the
series also includes a patch bringing the existing ftdi_determine_type()
function into consistency with new usage of cur_altsetting instead of
altsetting for desc.bInterfaceNumber retrieval.

Mychaela N. Falconia (3):
  USB: serial: ftdi_sio: use cur_altsetting for consistency
  USB: serial: ftdi_sio: pass port to quirk port_probe functions
  USB: serial: ftdi_sio: add support for FreeCalypso DUART28C adapter

 drivers/usb/serial/ftdi_sio.c     | 93 +++++++++++++++++++++++++++++++--------
 drivers/usb/serial/ftdi_sio_ids.h |  1 +
 2 files changed, 75 insertions(+), 19 deletions(-)

-- 
2.9.0

base-commit: be4c5eb267ee73ef1d70c25c6d648625e96eb477
