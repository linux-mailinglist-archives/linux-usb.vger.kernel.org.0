Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630B117F0C9
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 07:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgCJG7l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 02:59:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbgCJG7l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 02:59:41 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 823AB24673;
        Tue, 10 Mar 2020 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583823580;
        bh=bWhE5Bxoq9g4W0AAV2mbJSilFTMyYlZqUmD6XocJT5E=;
        h=From:To:Cc:Subject:Date:From;
        b=v6EAoXOCF4Py/Ych+nAdKg5qt4Zz0jSPTO7+Ev2/K1UddOv5bXWmYlRwq7Ptzop4O
         PjzyC80n1Jp5Wi1+KzXEzcdhqf9wnhEGruV3pOXAuu2Ox5jG31K0eQ58OiZPmOtYi4
         jc6JZL70f/vU1foFDmOYIlUnvXZNY/w+4ir5YQKI=
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for usb-linus
Date:   Tue, 10 Mar 2020 14:59:25 +0800
Message-Id: <20200310065926.17746-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Peter Chen (1):
  usb: chipidea: udc: fix sleeping function called from invalid context

 drivers/usb/chipidea/udc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.1

