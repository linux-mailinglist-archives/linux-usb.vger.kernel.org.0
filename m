Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F228D2C4736
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 19:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732290AbgKYSEf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 13:04:35 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:45162 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731394AbgKYSEe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 13:04:34 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id F0255FB04;
        Wed, 25 Nov 2020 18:55:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id WdKrcu9tGaOn; Wed, 25 Nov 2020 18:55:48 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id B76134068E; Wed, 25 Nov 2020 18:55:46 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] usb: typec: tps6598x: Export some power supply properties
Date:   Wed, 25 Nov 2020 18:55:45 +0100
Message-Id: <cover.1606326871.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This allows downstream supplies and userspace to detect whether external power
is supplied.

The Librem 5 has the tp65982 in front of bq25980 charge controller.  Since that
is capable of sinking and sourcing power the online property helps to decide
what to do. It also makes upower happy.

There will be follow up patches providing more properties but these need some
more time to cook and i wanted to check if this is the right way to go?

Guido Günther (1):
  usb: typec: tps6598x: Export some power supply properties

 drivers/usb/typec/tps6598x.c | 97 ++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

-- 
2.29.2

