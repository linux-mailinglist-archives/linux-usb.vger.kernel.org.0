Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1E8D1DDC
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 03:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731959AbfJJBI3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 21:08:29 -0400
Received: from mx5.ucr.edu ([138.23.62.67]:61304 "EHLO mx5.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731134AbfJJBI3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 21:08:29 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Oct 2019 21:08:28 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570669708; x=1602205708;
  h=from:to:cc:subject:date:message-id;
  bh=FbXEHMrqooWbgZHGXSG3NF7G7Mhn0laqydiduZiAtMk=;
  b=FzuOuXrCy9NCb12PziTlJodb9X2rmKgvt686jfYofR+w62edRr4O1Q+A
   czOhh8YvXxkD3sw3b1ThbQrm3wqNfP0mXj6XlAOo4TkJZxJLELbLjDAUm
   /4XUAcskj2osfyJ/sIIiKyFDYcgasBqFAKK6QVTvP/VdsaeGtF0bDbLg9
   RSRxGbA/4Wd/zLrrQTLz22x+QS1K9is8hJATrXTWpfmK3jxrhPloxCvCQ
   xxRdu/aSILdfUEdvs/fe8hypnQzgfKQ1wrE5ZY64phmZvgtusEux5Zwue
   aZTL8f79VFSNlr514kh0dUvn0yzwYTOLtj5Zjznr4l04nbEJn1pqg5cGQ
   g==;
IronPort-SDR: 2NfCT7+pjx7LNzzGL3rkd9WhAxxRwBPbbFzPABMXI/gQuE4VlvmEqv8jr7uBHDUREV10cZRgOq
 9EMfn91GyxhOfBuDo9L5AdB4W4PiZ6xCDA1p+0441zeNaoJgthKhvQngOtaPY7Q5JHW0XvTJG9
 6r3dAehFFsJV/wXhDXHRe7OTrS/jENErKcJXUn3jOMksiYK9ePBPIkSeEuIA4/qnBKJ21byFla
 hdWOaYGyZwNpNk3yEp2TiQn3GLmv1he0d2kL1i4QR+PwjRgT68HZbfDIuxZFT7FMWrm7KQS4+n
 trk=
IronPort-PHdr: =?us-ascii?q?9a23=3AU2lbXx1Isl/K3BmosmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseIXKfad9pjvdHbS+e9qxAeQG9mCsLQa0aGK6ejJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVijexe7J/IAu5oQjeqMUdnJdvJLs2xh?=
 =?us-ascii?q?bVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3?=
 =?us-ascii?q?so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RT?=
 =?us-ascii?q?Kv5LpwRRT2lCkIKSI28GDPisxxkq1bpg6hpwdiyILQeY2ZKeZycr/Ycd4cQG?=
 =?us-ascii?q?pBX91RVzdAAoO6YIsEEvQPM/9FpInzplsBsx++ChSxD+/rxDJEmnr60Ks93O?=
 =?us-ascii?q?k9HwzKwBEsE8sSvHjJsd75MLoeXOCwwKTO0D7Nbe5Z2S3l5YbIbB4vvP+CU7?=
 =?us-ascii?q?F3f8fK1UUjCxnIgkmKpID5Iz+Y0PkGvWiB7+pnUOKik2woqwBwoziv28csjZ?=
 =?us-ascii?q?TCi4UVy1HF9SV22oc1KcGkREN1etOkDYdftzuAO4RoX8wiXnhltSAnwbMFoZ?=
 =?us-ascii?q?62ZDYGxIgjyhLFaPGKc5KE7gz+WOueOzt0mm5pdK6nixqv8EWtzvfwWte63V?=
 =?us-ascii?q?tKtCZJjNjBumoP2hHc7MWMV+Fz8V272TmV0gDe8uREIUcpmqXFM5Mh2bswlo?=
 =?us-ascii?q?YLsUTEAy/2hF36jK+IeUUg/eil8+Hnba/npp+YLoN0kgX+Prk3lsyxH+g0Lh?=
 =?us-ascii?q?QCU3KU+eS7073j8kn5T6tQgvIqlanZtYjWJcUdpqGnHw9Yypgv5wq7Aju809?=
 =?us-ascii?q?kVnWMLIExYdB+IlYTlJU3CLOzgAfe6mVuskTNrx/7cPr3mB5XANnjCkbbhfb?=
 =?us-ascii?q?ln6k5Q1BY/wN5E6pJJFr4BOuj/VVHsu9zFFhM5KRC7w/77CNVh0YMTQWaPAq?=
 =?us-ascii?q?6fMKPPvl6E//8vI/KXa4IOpjb9JOYq5+T0gX86h1AdZ6+p0oUTaHyiGfRmOU?=
 =?us-ascii?q?qZMjLCmNAERFYLrAojS6S+mU+CWD8LPy2aQqkmoDw3FdT1Xs/4WomxjenZj2?=
 =?us-ascii?q?+AFZpMazUDVw2B?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EmFADfgZ5dgMjWVdFmHgELHIVaTBC?=
 =?us-ascii?q?NJYVZUAEBAQaLKRhxhXqKMAEIAQEBDAEBLQIBAYRAglIjOBMCAwkBAQUBAQE?=
 =?us-ascii?q?BAQUEAQECEAEBCQ0JCCeFQoI6KYM1CxYVUoEVAQUBNSI5gkcBglIlBaRlgQM?=
 =?us-ascii?q?8jCUziGQBCQ2BSAkBCIEihzWEWYEQgQeBEYNQhA2DWYJKBIE5AQEBjXiHN5Z?=
 =?us-ascii?q?XAQYCghAUgXiTFSeEPIk/i0QBp2MCCgcGDyOBRoF7TSWBbAqBRFAQFIFbF45?=
 =?us-ascii?q?DITOBCI0/glQB?=
X-IPAS-Result: =?us-ascii?q?A2EmFADfgZ5dgMjWVdFmHgELHIVaTBCNJYVZUAEBAQaLK?=
 =?us-ascii?q?RhxhXqKMAEIAQEBDAEBLQIBAYRAglIjOBMCAwkBAQUBAQEBAQUEAQECEAEBC?=
 =?us-ascii?q?Q0JCCeFQoI6KYM1CxYVUoEVAQUBNSI5gkcBglIlBaRlgQM8jCUziGQBCQ2BS?=
 =?us-ascii?q?AkBCIEihzWEWYEQgQeBEYNQhA2DWYJKBIE5AQEBjXiHN5ZXAQYCghAUgXiTF?=
 =?us-ascii?q?SeEPIk/i0QBp2MCCgcGDyOBRoF7TSWBbAqBRFAQFIFbF45DITOBCI0/glQB?=
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; 
   d="scan'208";a="81814536"
Received: from mail-pl1-f200.google.com ([209.85.214.200])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2019 18:01:21 -0700
Received: by mail-pl1-f200.google.com with SMTP id s24so2734689plp.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 18:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MvM2jwgUKO6uz4LfxBqoaB6VDvyVvKuoyUYs0jsyz0k=;
        b=C4Ip3IZRE/5/YhuJuzHZKO9CAxuFMMoXFcWBbDGG0oKic4Nq8zrtWqliKvzpVUDdCp
         IvLWP3fxEVHYCApfCAfKwo4D2/Dz5NVrZ61qKSr0BU0briObr8EogB5ZvwtV3AteOAXP
         HjONn6Gnfof3BMUw0QQW5uxTAoVlAm8p+JiVtigqqb1pLorIXkSwNFQ0TcL84+8Snknr
         dko05IQykRLL2k/ncZU0nzRYyJOavt/AzepljAcOFhgCq/0S6E98jp7tXIUcgNFWkLo4
         646bqSJGkNqJ7FZE1O712pBrkHqSqZksR+NOinK9/MyiH+kURDTWKUifXhKXcW4Eo5cs
         ukPA==
X-Gm-Message-State: APjAAAX01eqh9MGuaptZSLADhRNL8CxSIuK37QAkJq9my7mDvC/dtZsT
        aI17JzpxbNzZSoelfM1R2ijqEzGTiUSaOXDeY+nOUpda9WYDiGaVbnbNt9a7TjZ5+NKVAub3tbv
        oMfOaDEmuwXpDJTATvMZgGg==
X-Received: by 2002:a17:902:2e:: with SMTP id 43mr6021045pla.270.1570669281481;
        Wed, 09 Oct 2019 18:01:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOXnmntkThXGYy+i9dPCuMRJzaVdG4Osex5SflPK5bvsD16OY0wpQwitsRLeTtpk5YTdBCpQ==
X-Received: by 2002:a17:902:2e:: with SMTP id 43mr6021006pla.270.1570669281167;
        Wed, 09 Oct 2019 18:01:21 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id f65sm3388103pgc.90.2019.10.09.18.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 18:01:20 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Douglas Anderson <dianders@chromium.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Jan-Marek Glogowski <glogow@fbihome.de>,
        Mathieu Malaterre <malat@debian.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] USB: core: Fix potental Null Pointer dereference
Date:   Wed,  9 Oct 2019 18:02:02 -0700
Message-Id: <20191010010205.25739-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Inside function usb_device_is_owned(), usb_hub_to_struct_hub()
could return NULL but there's no check before its dereference,
which is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 236313f41f4a..8d628c8e0c1b 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1977,7 +1977,7 @@ bool usb_device_is_owned(struct usb_device *udev)
 	if (udev->state == USB_STATE_NOTATTACHED || !udev->parent)
 		return false;
 	hub = usb_hub_to_struct_hub(udev->parent);
-	return !!hub->ports[udev->portnum - 1]->port_owner;
+	return hub && !!hub->ports[udev->portnum - 1]->port_owner;
 }
 
 static void recursively_mark_NOTATTACHED(struct usb_device *udev)
-- 
2.17.1

