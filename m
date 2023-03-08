Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B489D6B0D3A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 16:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjCHPpd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 10:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbjCHPow (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 10:44:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134E31B33A
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678290175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=dVYqqZQrB6z9Vck/IoN57iUsP43MOtVQ6StTNLk4CVc=;
        b=OCl1NEj3g11bC0mHwjYGMtIzhwZsA952HJYpFoauILkkCnP3LchoORJ6Eor45X+kOgUHIC
        N+EVwr+sUiVrQhFIlg66WzNTh9XmK0RR8sIO3803USxzTySZUzS4n8Q7Czoll0Da/AqTUB
        kOj0EysodNRaYNMdZp7CkdGkvKxLuWE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-wYQfeZy4PhG6dLYHdMRuxA-1; Wed, 08 Mar 2023 10:42:54 -0500
X-MC-Unique: wYQfeZy4PhG6dLYHdMRuxA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68BF785D070;
        Wed,  8 Mar 2023 15:42:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.179])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F922492B07;
        Wed,  8 Mar 2023 15:42:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v4 0/3] usb: ucsi: 3 bug fixes
Date:   Wed,  8 Mar 2023 16:42:41 +0100
Message-Id: <20230308154244.722337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Here is v4 of my ucsi bugfix series.

Changes in v4:
- Rebase on top of v6.3-rc1

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

