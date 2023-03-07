Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22F7D6ADC13
	for <lists+linux-usb@lfdr.de>; Tue,  7 Mar 2023 11:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjCGKfq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Mar 2023 05:35:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjCGKfn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Mar 2023 05:35:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60223E0AC
        for <linux-usb@vger.kernel.org>; Tue,  7 Mar 2023 02:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678185264;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=efqs5vRAQ8E0THZYkSV+wZ9+TRzdJSL2EJ2HQoLAGsI=;
        b=NmikgS8mCWKt2Lo2s4OGvWWth/xPv7F1LDKxqdlnvEOB1Rv+Ht/6WuUsbaBjpPGPh9qX61
        2G49/0tZvn71VFQDdV9eyJQJRSVrSoXQzoDIBhs1KMHuM2aPXoLoAiLOAfN6ubq22sALPD
        B28Gr5JWBUUEmmGhtWnsnsluk5C3aCg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-RPCPSDTGM7aBxcjJpJp2Cg-1; Tue, 07 Mar 2023 05:34:23 -0500
X-MC-Unique: RPCPSDTGM7aBxcjJpJp2Cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5637585CCE1;
        Tue,  7 Mar 2023 10:34:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.222])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 913B1400DFA1;
        Tue,  7 Mar 2023 10:34:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v3 0/3] usb: ucsi: 3 bug fixes
Date:   Tue,  7 Mar 2023 11:34:18 +0100
Message-Id: <20230307103421.8686-1-hdegoede@redhat.com>
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

Hi Greg, Heikki,

Here is v3 of my ucsi bugfix series.

Changes in v3:
- Assign connector[i].index before calling ucsi_register_port() instead of
  passing i to ucsi_register_port()
- Add Link and Reviewed-by tags to commitmsg

Changes in v2:
- Delay setting ucsi->ntfy in ucsi_init() instead of adding a NULL pointer
  check to ucsi_connector_change()

Regards,

Hans


Hans de Goede (3):
  usb: ucsi: Fix NULL pointer deref in ucsi_connector_change()
  usb: ucsi: Fix ucsi->connector race
  usb: ucsi_acpi: Increase the command completion timeout

 drivers/usb/typec/ucsi/ucsi.c      | 33 ++++++++++++++----------------
 drivers/usb/typec/ucsi/ucsi_acpi.c |  2 +-
 2 files changed, 16 insertions(+), 19 deletions(-)

-- 
2.39.1

