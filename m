Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0678922D021
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 23:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGXVA7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 17:00:59 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:48676 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726527AbgGXVA6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 17:00:58 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F43F4011D;
        Fri, 24 Jul 2020 21:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595624457; bh=xrc4YTkepANgLvICJ2M6oa7lsvKpskD/Wmmccdw+HEU=;
        h=Date:From:Subject:To:Cc:From;
        b=XgL//uVWB9EXrreHCN94lMWLa/ylV3jCaFlTizT65bIQNKPJ5flWy2b5e7ruEHTTY
         ikr8+gpavatiWErzUhjK+KByw4+YBjWtzgi+EkF4YucR/1ufV/Ugs1zlzNIICS623j
         hF5EIwduxFt6JRwFxkxUzkL2nrjIEo4IJAfialI2njH8ssmVv7yN84dRD2WOemSpqj
         1hXCTaht2U83z6jqCQacQqd7ADL8b/6Mne50FwaWc5hrA3d90QeYYCbZkUhV183DGQ
         mPsoL3B6cZZSulK3AeZ7ZMzkfW/pCkq3ey6pLcLMN4GUTPT0ZKxf77AGkn1K4RXiHc
         DuYqOSNXT5Fug==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 146BAA006F;
        Fri, 24 Jul 2020 21:00:55 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 14:00:55 -0700
Date:   Fri, 24 Jul 2020 14:00:55 -0700
Message-Id: <cover.1595624103.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/2] usb: dwc3: Valid HW capability
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The field dwc->maximum_speed captures the device "maximum-speed" property. If
the property is not set, then default the field to the maximum speed the HW
supports.

This series makes sure that the user input takes precedence and only prints
warning if the user specifies a maximum-speed higher than what the HW shows.


Thinh Nguyen (2):
  usb: dwc3: core: Properly default unspecified speed
  usb: dwc3: core: Print warning on unsupported speed

 drivers/usb/dwc3/core.c | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)


base-commit: a95fcda246dc3e9f5d00222c9a8f0a76aa0bb950
-- 
2.11.0

