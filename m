Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6848C65D587
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 15:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239435AbjADOXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 09:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239358AbjADOXd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 09:23:33 -0500
X-Greylist: delayed 584 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 04 Jan 2023 06:23:31 PST
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBABCDB
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 06:23:31 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id C630A12A376
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 15:13:42 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1672841622; bh=5rkqKTxy4FTyStABAUKTYksxYTVS+tWu0ZBuEsV5EVU=;
        h=Date:From:To:Subject:From;
        b=I3sv/ONH6Lkc9pt/Ugb0IPnF2O7xdmBID8D0Mq1lpd4AN5JLnq4zOBNkXAD+JEVkn
         DSdp3BKtCaLQWQoCAikI8QrSv7QIlkTtb2YvqTnw7/1AVAlAAMhF5qf5RwFWNWAkso
         sEb+Dtf5W8It+t6BkR6fO4pfoX4NtDD1OUx98tZbVEHf1JTj60MQHhl3cKLahVdRXo
         z6cx/aoZD1qsYDGF/lLVJ92XmHhUYubeQTtyU6CuEErEDmEisn9Ne343a1utuRY3er
         Vohq5h+OdXx5H0hFz+oCH3E8Ekk6WDi5shl0ckMV+YKrAzDB6NgR6HKpWd5lU+GM4+
         /NjLhHmhik7qg==
Date:   Wed, 4 Jan 2023 15:13:41 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     <linux-usb@vger.kernel.org>
Subject: Disabling per-device autosuspend
Message-ID: <20230104151341.6f937c0c@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

I'm struggling with autosuspend on my Samsung phone in download mode,
as it apparently breaks heimdall/libusb on my Tumbleweed system. Here's
what I'm seeing:

- My device is autosuspended, because it has been idle for long enough.
- cd /sys/bus/usb/devices/1-4/  # my device's port
- echo -1 > power/autosuspend
- The device is reset and gets a new device ID.
  The current directory is no longer valid (becomes empty).
- cd $PWD  # it's still the same port, so the path is the same
- cat power/autosuspend returns the value of usbcore.autosuspend module
  parameter ("2" in my case).

I'm pretty this behaviour is wrong, although I'm not quite sure if it
ever worked better. So, is this parameter expected to be unusable for
disabling autosuspend for a specific device, or should I try to fix it?

Cheers,
Petr T
