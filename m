Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1BC35A014
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 15:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbhDINky (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 09:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31289 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233571AbhDINkw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 09:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617975639;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mUuB6NAP2o9mMTwE2lkRryn060PumPKAUdLqtPQn5K8=;
        b=DoW13QNu1K+yF+O9SJctJeXto4Onu4ueNyA8FM5z3DLJDzRMTzgqY77Pdgd2IFWNcmoxvI
        ofNRxBDscDkxpf+daEb5cwF39h3nNHblEOntVh8QNkJ6pb0dhl1ivYfK0/YHza92Q+7wX5
        DNyVNMGxaWZTBDH/3ADIP9BPxv5/3L0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-EHa2WH9HN8aKdk8srFRPuQ-1; Fri, 09 Apr 2021 09:40:37 -0400
X-MC-Unique: EHa2WH9HN8aKdk8srFRPuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D40A1883521;
        Fri,  9 Apr 2021 13:40:36 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-60.ams2.redhat.com [10.36.113.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 950B519703;
        Fri,  9 Apr 2021 13:40:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 0/3] usb: typec: Add typec_port_register_altmodes()
Date:   Fri,  9 Apr 2021 15:40:30 +0200
Message-Id: <20210409134033.105834-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

Here is v3 of my series to actually make it possible to use alt-modes
on tcpm managed Type-C ports.

Note this v3 series deliberately does not include devicetree bindings
documentation, as requested by Rob. ATM the fwnodes used to register
the altmodes are only used internally to pass platform info from a
drivers/platform/x86 driver to the type-c subsystem.

When a devicetree user of this functionally comes up and the dt-bindings
have been hashed out the internal use can be adjusted to match the
dt-bindings.

Changes in v3:
- Rename typec_port_register_altmodes_from_fwnode() to
  typec_port_register_altmodes()
- Use fwnode_for_each_child_node()

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
  usb: typec: Add typec_port_register_altmodes()
  usb: typec: tcpm: Add support for altmodes
  platform/x86/intel_cht_int33fe: Add displayport altmode fwnode to the
    connector fwnode

 .../platform/x86/intel_cht_int33fe_typec.c    | 19 +++++++
 drivers/usb/typec/class.c                     | 54 +++++++++++++++++++
 drivers/usb/typec/tcpm/tcpm.c                 |  4 ++
 include/linux/usb/typec.h                     |  6 +++
 4 files changed, 83 insertions(+)

-- 
2.30.2

