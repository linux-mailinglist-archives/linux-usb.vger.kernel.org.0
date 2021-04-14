Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E635A35EAA7
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 04:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237553AbhDNCN1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 22:13:27 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46958 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237646AbhDNCN1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 22:13:27 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 780BDC00C9;
        Wed, 14 Apr 2021 02:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618366386; bh=g+Lpau2bBMCbwbjHX3bjw5jmEDcrqqLwwJpPkN9sOAA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Adj3iG1HpSCu6qTy1D2JPVC6nhMltIOj+Zh8HYRMOT7zNbDc9afEw4UpQvvx/TBZp
         BCS+xwxGhSKB4Pm1PGgBRugWgrvxmSyu8CZ692jaolt2qNMtr3J2nZTGMLlpNadK/t
         CN4tGLFAfZOtS2NCtRN7ekZDAGlS4PE8BQzi2HgTjJtlgjCJXEcpDnbXRYTc+bAD7E
         Hr5vM5lHi4mkNWQFEXIpUP2xVrRG+HQ51BAHhCrodDq/fCPDbMlb1VtAsXsyteFRnk
         JJCOSiVxcVqef02ZdKxGuGQiABEELctn0djiEoZTQNCIqXxTXdjJw4iwO+60tzav/D
         licq/DpT/Or9Q==
Received: from lab-vbox (unknown [10.205.146.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D015BA005E;
        Wed, 14 Apr 2021 02:13:04 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Tue, 13 Apr 2021 19:13:04 -0700
Date:   Tue, 13 Apr 2021 19:13:04 -0700
Message-Id: <cover.1618366071.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <1b784826dfee46adaa65c42d33934339d0c1f2a7.1618364095.git.Thinh.Nguyen@synopsys.com>
References: <1b784826dfee46adaa65c42d33934339d0c1f2a7.1618364095.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/2] usb: dwc3: gadget: Add disabling LPM option
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a new option to disable LPM for gadget side. Some device may need to
disable this capability.

Changes in v2:
- Add cover letter
- Add new DT property for disabling LPM for gadget


Thinh Nguyen (2):
  dt-bindings: usb: dwc3: Add disabling LPM for gadget
  usb: dwc3: gadget: Check for disabled LPM quirk

 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 8 +++++++-
 drivers/usb/dwc3/core.c                              | 2 ++
 drivers/usb/dwc3/core.h                              | 4 +++-
 drivers/usb/dwc3/gadget.c                            | 9 ++++++++-
 4 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 401411bbc4e62bcbcc020c2c458ecb90843140a8
-- 
2.28.0

