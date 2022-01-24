Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2AD497AEE
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 10:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242579AbiAXJCW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 04:02:22 -0500
Received: from mga11.intel.com ([192.55.52.93]:18482 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236415AbiAXJCS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jan 2022 04:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643014938; x=1674550938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xYrOP1OAMgsMLA79KoIvNZiMnjyMiV1Jl9L/a5hB97M=;
  b=Zb2RW6kHWyMw8+u8Yz5gpq4V3kFK5yplamUkJKr5m0Y+hXsPq4EaYeHd
   IHH2VDz97yltfvS98hLS2OKe1of3DQ8oZMESyjVhiNakamViLrmH0f3+v
   uKqTbGsDHBhVojkchKw77b7fA8rRtTN3FRVPXUu5xyxOlmXNwGZWZabm5
   OemCyL/VUS3O6PNzDB6lTw7kfdwhO0lXJVq98xe3WJpf8hYsr5BpOQtX9
   TztZUhsY54YX/5Pqk5g1OvUMAuKdzoK6mjUi8V0eeXbNH/DBapArkZ6RP
   wyYEhzpNOT5oNZ6TCtDgJ04xGFkyiElMm7KS3O7iCbuaHjVHgpy/EOjHs
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="243596449"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="243596449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="673561138"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2022 01:02:16 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        =?UTF-8?q?Robert=20=C5=9Awi=C4=99cki?= <robert@swiecki.net>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH 1/2] usb: typec: Only attempt to link USB ports if there is fwnode
Date:   Mon, 24 Jan 2022 12:02:27 +0300
Message-Id: <20220124090228.41396-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124090228.41396-1-heikki.krogerus@linux.intel.com>
References: <20220124090228.41396-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The code that creates the links to the USB ports attached to
a connector inside the system assumed that the ACPI nodes
(fwnodes) always exist for the connectors, but it can not do
that.

There is no guarantee that every USB Type-C connector has
ACPI device node representing it in the ACPI tables, and
even if there are the nodes in the ACPI tables, the _STA
method in those nodes may still return 0 (which means the
device does not exist from ACPI PoW).

This fixes NULL pointer dereference that happens if the
nodes are missing.

Reported-and-tested-by: Robert Święcki <robert@swiecki.net>
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Fixes: 730b49aac426 ("usb: typec: port-mapper: Convert to the component framework")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/port-mapper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/port-mapper.c b/drivers/usb/typec/port-mapper.c
index 07d307418b470..b6e0c6acc628c 100644
--- a/drivers/usb/typec/port-mapper.c
+++ b/drivers/usb/typec/port-mapper.c
@@ -56,6 +56,9 @@ int typec_link_ports(struct typec_port *con)
 {
 	struct each_port_arg arg = { .port = con, .match = NULL };
 
+	if (!has_acpi_companion(&con->dev))
+		return 0;
+
 	bus_for_each_dev(&acpi_bus_type, NULL, &arg, typec_port_match);
 
 	/*
@@ -74,5 +77,6 @@ int typec_link_ports(struct typec_port *con)
 
 void typec_unlink_ports(struct typec_port *con)
 {
-	component_master_del(&con->dev, &typec_aggregate_ops);
+	if (has_acpi_companion(&con->dev))
+		component_master_del(&con->dev, &typec_aggregate_ops);
 }
-- 
2.34.1

