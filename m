Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B01F5DFEB
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 10:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfGCIfZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 04:35:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57638 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfGCIfZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jul 2019 04:35:25 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0189525B775;
        Wed,  3 Jul 2019 18:35:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 17ABC9403B8; Wed,  3 Jul 2019 10:35:21 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/2] dt-bindings: usb: renease_{usbhs,gen3} Rename bindings documentation files
Date:   Wed,  3 Jul 2019 10:35:12 +0200
Message-Id: <20190703083514.32385-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USBHS and USB 3.0
peripheral documentation files.

Changes since v1
* Accumulate review tags
* Use renesas,usb3-peri.txt as new filename for renesas_gen3,
  as suggested by Shimoda-san

Simon Horman (2):
  dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
  dt-bindings: usb: renesas_gen3: Rename bindings documentation file

 .../devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3-peri.txt}   | 0
 .../devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt}      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3-peri.txt} (100%)
 rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)

-- 
2.11.0

