Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB08242A30
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 15:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgHLNUs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 09:20:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:55670 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727780AbgHLNUr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 09:20:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2B839B769;
        Wed, 12 Aug 2020 13:21:08 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: [RFC 0/5] fix races in CDC-WDM
Date:   Wed, 12 Aug 2020 15:20:29 +0200
Message-Id: <20200812132034.14363-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CDC-WDM was not written with multithreaded users or
uncooperative devices in mind.
This leads to race conditions and hangs in flush(). 

