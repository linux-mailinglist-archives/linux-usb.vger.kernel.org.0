Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10AFD26B7E7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 02:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgIPAbQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 20:31:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:49308 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgIONpR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 09:45:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 48FC9B136;
        Tue, 15 Sep 2020 13:45:31 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] updates to UAS
Date:   Tue, 15 Sep 2020 15:44:59 +0200
Message-Id: <20200915134501.13947-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The first patch just modernizes to new helpers. No functional change
intended

The second patch fixes a corner case where a whole tree of devices
is removed and I got a report of a live lock 

Signed-off-by: Oliver Neukum <oneukum@suse.com>

