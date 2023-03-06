Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67886ABD00
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 11:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbjCFKfq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 05:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjCFKfi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 05:35:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806132054A
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678098844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nk+qEMKLnGBNyiBoDHmr5Ko6eiOftzPruVRMgtr7R3Y=;
        b=BbhsbfpUWn4RqdcwyjExP4y5sEwc9D1FLMXNhc2f0JuukK9iKNpWPPeABSIzh7zKqRYIzz
        s2PYpcezXkhsl4z1of7EGjfKdr/agmmSyzyWogVWbFP/4CHpSzIc7l1/pEVzVa2rd3UbeV
        ZgtcBWdCIcmy8ni1fPNLuJBa0xSIi1Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-WqefdaPgP4KQaH85UMUQ5A-1; Mon, 06 Mar 2023 05:34:02 -0500
X-MC-Unique: WqefdaPgP4KQaH85UMUQ5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D9B38123C6;
        Mon,  6 Mar 2023 10:34:01 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.139])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 492EE40C83B6;
        Mon,  6 Mar 2023 10:34:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 0/3] usb: ucsi: 3 bug fixes
Date:   Mon,  6 Mar 2023 11:33:56 +0100
Message-Id: <20230306103359.6591-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Here is v2 of my ucsi bugfix series.

Changes in v2:
-Delay setting ucsi->ntfy in ucsi_init() instead of adding a NULL pointer
 check to ucsi_connector_change()

Regards,

Hans


Hans de Goede (3):
  usb: ucsi: Fix NULL pointer deref in ucsi_connector_change()
  usb: ucsi: Fix ucsi->connector race
  usb: ucsi_acpi: Increase the command completion timeout

 drivers/usb/typec/ucsi/ucsi.c      | 31 ++++++++++++++----------------
 drivers/usb/typec/ucsi/ucsi_acpi.c |  2 +-
 2 files changed, 15 insertions(+), 18 deletions(-)

-- 
2.39.1

