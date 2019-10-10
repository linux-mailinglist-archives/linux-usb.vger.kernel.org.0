Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637F1D2A31
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 14:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387959AbfJJM6u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 08:58:50 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:46501 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733300AbfJJM6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 08:58:49 -0400
Received: by mail-lj1-f181.google.com with SMTP id d1so6055210ljl.13;
        Thu, 10 Oct 2019 05:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=me5AjClr8sL9m3SIk4xO4Mj+ZHOX0W4gkjY5Nq58ddc=;
        b=LW8bzndmmobUaDngBIOKCXmxB20WUDCeFCrPH/KfkQdqw6nmeCcx3e6Y7F69MkgGjN
         ICLod+cHIRyekuT6WFCBTEDOgvszrpnuJD5odxHSWGdvU8Fnfj3nmZxqqnmJBEPzyL/8
         uG8G6uwfJX/Ang/5NhNKDgZe45Gcs+uwm3oeJFY2r6QKFV8UvgTDrBbkf0UzgQ4j3Hi2
         LY907UQlmyKzzwKmQkYogre1hIotmfboE6xB7ZjeCVvknoHJLsUFo6RLXgi6l1DinSxs
         v5wQ8nYWcX3DhAoEOn3ag3Dox46jtPk+Nuw1ImihJUHb/ajJDfx7C4FWXEppd2/gjeDS
         cvtg==
X-Gm-Message-State: APjAAAWE4nipAUYFIkeFjo6rXLg62IlL6/brrHFGhrD9qpx1T3/7hTXN
        9a95sm8JuHhcOD60FSDfyJM=
X-Google-Smtp-Source: APXvYqyvHoOv9SO9XA+/5htTzTT9dH15Yg60CXh78J3Qwz38m+gvRFcvZR3MVY6EC0rHP0WLO0mkXg==
X-Received: by 2002:a2e:584b:: with SMTP id x11mr6504493ljd.90.1570712327335;
        Thu, 10 Oct 2019 05:58:47 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id 207sm1488894lfn.0.2019.10.10.05.58.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 05:58:46 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIY1w-00072o-Ou; Thu, 10 Oct 2019 14:58:57 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] USB: misc: more disconnect fixes
Date:   Thu, 10 Oct 2019 14:58:33 +0200
Message-Id: <20191010125835.27031-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Turns out we have more gems in these old drivers.

Johan


Johan Hovold (2):
  USB: ldusb: fix memleak on disconnect
  USB: legousbtower: fix memleak on disconnect

 drivers/usb/misc/ldusb.c        | 5 +----
 drivers/usb/misc/legousbtower.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.23.0

