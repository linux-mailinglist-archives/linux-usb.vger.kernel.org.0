Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447DF358E71
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 22:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhDHUbw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 16:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53947 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231676AbhDHUbw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 16:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617913900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=uJI/00XeAA/aJMBf95FsVoqPcTRbztuDrxPIJ0wLcGw=;
        b=UBCF5wt7jiQ7xB6Ifhv+b8XGux+0FHEkUjFnXZLs7KSJE1VDwPuroqHZ21VVn1pmyNPEF0
        W31m6G5LSIJLZ6OyVAfXD+M4KjGBswsYraTIXFIheMj1Ss52MujXf7zZGqRPCJshfeSLdW
        B0T37qAeR2V+CJS7kztTfdzVSKFB9kI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-rQPs25X2OEiyI8jQ_511nw-1; Thu, 08 Apr 2021 16:31:39 -0400
X-MC-Unique: rQPs25X2OEiyI8jQ_511nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 095BE801814;
        Thu,  8 Apr 2021 20:31:38 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0F304712BF;
        Thu,  8 Apr 2021 20:31:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 0/3] usb: typec: Add typec_port_register_altmodes_from_fwnode()
Date:   Thu,  8 Apr 2021 22:31:26 +0200
Message-Id: <20210408203129.526604-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

Here is v2 of my series to actually make it possible to use alt-modes
on tcpm managed Type-C ports. Sorry that it took so long.

Note this v2 series deliberately does not include devicetree bindings
documentation, as requested by Rob. ATM the fwnodes used to register
the altmodes are only used internally to pass platform info from a
drivers/platform/x86 driver to the type-c subsystem.

When a devicetree user of this functionally comes up and the dt-bindings
have been hashed out the internal use can be adjusted to match the
dt-bindings.

Changes in v2:
- Drop the DT bindings doc, as requested by Rob
- Drop unnecessary fwnode parameter from
  typec_port_register_altmodes_from_fwnode()

Greg, assuming there are no objections to merging this, then you hereby
have my ack for also taking the platform/x86/intel_cht_int33fe change
upstream through the USB tree.

Regards,

Hans



Hans de Goede (3):
  usb: typec: Add typec_port_register_altmodes_from_fwnode()
  usb: typec: tcpm: Add support for altmodes
  platform/x86/intel_cht_int33fe: Add displayport altmode fwnode to the
    connector fwnode

 .../platform/x86/intel_cht_int33fe_typec.c    | 19 +++++++
 drivers/usb/typec/class.c                     | 55 +++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                 |  5 ++
 include/linux/usb/typec.h                     |  6 ++
 4 files changed, 85 insertions(+)

-- 
2.30.2

