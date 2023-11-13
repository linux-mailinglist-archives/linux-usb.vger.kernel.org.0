Return-Path: <linux-usb+bounces-2829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5F07E9F6A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 15:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC92280DBE
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 14:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBF121362;
	Mon, 13 Nov 2023 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CA321114
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 14:59:35 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D375132
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 06:59:34 -0800 (PST)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3BB751F8F7;
	Mon, 13 Nov 2023 15:59:26 +0100 (CET)
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: misc: onboard-hub: add support for Microchip USB5744
Date: Mon, 13 Nov 2023 15:59:19 +0100
Message-Id: <20231113145921.30104-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for the Microchip USB5744 USB3.0 and USB2.0 Hub.

Stefan Eichenberger (2):
  dt-bindings: usb: microchip,usb5744: Add second supply
  usb: misc: onboard-hub: add support for Microchip USB5744

 .../devicetree/bindings/usb/microchip,usb5744.yaml         | 7 ++++++-
 drivers/usb/misc/onboard_usb_hub.c                         | 2 ++
 drivers/usb/misc/onboard_usb_hub.h                         | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.25.1


