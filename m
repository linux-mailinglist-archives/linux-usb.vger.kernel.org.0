Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3680F2D091F
	for <lists+linux-usb@lfdr.de>; Mon,  7 Dec 2020 03:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgLGCKD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Dec 2020 21:10:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:50630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728623AbgLGCKD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 6 Dec 2020 21:10:03 -0500
From:   Peter Chen <peter.chen@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for v5.10
Date:   Mon,  7 Dec 2020 10:09:08 +0800
Message-Id: <20201207020909.22483-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Fabio Estevam (1):
  usb: chipidea: ci_hdrc_imx: Pass DISABLE_DEVICE_STREAMING flag to
    imx6ul

 drivers/usb/chipidea/ci_hdrc_imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.17.1

