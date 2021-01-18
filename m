Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB092F9E10
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389982AbhARLSA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:56316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389036AbhARLOU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:14:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD2E3221F8;
        Mon, 18 Jan 2021 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968419;
        bh=kTv+tUyQ6u2j665x237Rx1YwKwkcMZQgCYKyjtHNKRI=;
        h=From:To:Cc:Subject:Date:From;
        b=AHfVu8MMiQU9Hf3E/1JCeYwnAwmB0H94M7yWk+bEZ4BII+LQm8CJXjQ0DxOmXqGSM
         +Hr3ei+vq6KyJZ+5R+Ktz7kRJEz506Bu7G+rQzWmcqYwA5XI+MmfssgdIpptTQKBx6
         Uz4EirCDDUu6xAU5t+LE9FL8tjA6pCpxhBR9Z1ul0CHddkYUAHtSSfRIlCRma3SRz6
         5nLlRJfn9QGqxag5m7gQ9gPQYTSoUQDDPOHUNWrPBG82rcN1SDlHRMNSN3X+iqSKjj
         4MDPJCjwvAH890lacJdZvunwg8P1LMnzt4cduyk14kVUuosBU15TK/KoTuIdD5uuAd
         1T8a0TrM60qHg==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1STh-0001KM-Qv; Mon, 18 Jan 2021 12:13:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/6] USB: serial: cp210x: add software flow-control support
Date:   Mon, 18 Jan 2021 12:13:25 +0100
Message-Id: <20210118111331.5048-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series, based on a patch by Wang Sheng Long, adds support for
software flow control to the cp210x driver. Included are also some
related cleanups.

Johan


Johan Hovold (5):
  USB: serial: cp210x: set IXOFF thresholds
  USB: serial: cp210x: update control-characters on every change
  USB: serial: cp210x: drop short control-transfer checks
  USB: serial: cp210x: drop unused includes
  USB: serial: cp210x: add copyright notice

Wang Sheng Long (1):
  USB: serial: cp210x: add support for software flow control

 drivers/usb/serial/cp210x.c | 100 +++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 19 deletions(-)

-- 
2.26.2

