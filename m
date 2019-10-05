Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F371CCCD1
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2019 23:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfJEVEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Oct 2019 17:04:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57384 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbfJEVEw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Oct 2019 17:04:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AEC89C057E9F;
        Sat,  5 Oct 2019 21:04:52 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-21.ams2.redhat.com [10.36.116.21])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 419E15D772;
        Sat,  5 Oct 2019 21:04:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add platform_get_irq_byname_optional() and use it in the dwc3 driver
Date:   Sat,  5 Oct 2019 23:04:46 +0200
Message-Id: <20191005210449.3926-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sat, 05 Oct 2019 21:04:52 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

Here is a fix for the false-positive dev_err in platform_get_irq_byname()
discussed recently and reported here:
https://bugzilla.kernel.org/show_bug.cgi?id=205037

Since patch 2 depends on patch 1, I think it might be best to merge
all three patches through the same tree ...

Regards,

Hans

