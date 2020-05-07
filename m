Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD571C7F65
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 02:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgEGAtd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 May 2020 20:49:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:45818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgEGAtd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 May 2020 20:49:33 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2AF420708;
        Thu,  7 May 2020 00:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588812572;
        bh=c51TV4I/knyr/1I1QPyDI0eqGYlxvYAMQpFxMAw1NIo=;
        h=From:To:Cc:Subject:Date:From;
        b=PVTFNkG6rLnKZE5esN3P8xOaUvH/ZTDYdNKkN39j1ihLObZyqLvS6c/WKjaKxUVLp
         8+TGg94LfT0nU+KuKTZSB9IdN/QcUxXTEBRztvCuC9X8NqqEpnEKSaDJSE3SBhKw8J
         sPl6+gV9P8GwDEdWN2Y5+iEiWj/MSKiQSHo7lX64=
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for v5.7
Date:   Thu,  7 May 2020 08:49:17 +0800
Message-Id: <20200507004918.25975-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Bryan O'Donoghue (1):
  usb: chipidea: msm: Ensure proper controller reset using role switch
    API

 drivers/usb/chipidea/ci_hdrc_msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

