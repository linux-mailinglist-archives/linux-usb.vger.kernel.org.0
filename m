Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA5B275449
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 11:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgIWJWF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 05:22:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:53628 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbgIWJWF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Sep 2020 05:22:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600852924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=4Q07c5siZI8hPFAxDLYZke5XjpaZIjzWG89EozR2S8o=;
        b=bHjUjVl5fTDm481/iWSoSSME0YmexR1oQUJOMJBJ/qwd8RAnk1cR/rPNVX1+q0t8yRYcW/
        WdkxgoPJlELRs4sBS43LN5ZxkqnM+Py0rqyjglnZWYC3Ag41PrIu3YIopsSZ54qgsqTPHi
        M2OCGGp9e6eTJ78wJ60g7ZmPbGOgBzo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id AB7CDADF7;
        Wed, 23 Sep 2020 09:22:41 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org, gregKH@linuxfoundation.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 0/7]CDC_WDM: fix hangs and error reporting in multithreaded cases
Date:   Wed, 23 Sep 2020 11:21:29 +0200
Message-Id: <20200923092136.14824-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Testing has shown

1. race conditions in the multithreaded use case
2. a vulnerability against malicious hardware
3. a minor race against disconnect() in flush()

in the CDC-WDM driver. All have a common cause in the interactions
of the flush() method with other parts of the driver. Hence they
require a common rework of the flush() method.

Long and exhaustive discussion and testing of these changes,
however, revealed that they in turn introduce problems
with error reporting and long periods of uninterruptible sleep.
Those require further changes to flush() and the implementation
of fsync().

The issue dates back to the introduction of the driver so the fixes
also should go into stable.

Signed-off-by: Oliver Neukum <oneukum@suse.com>

