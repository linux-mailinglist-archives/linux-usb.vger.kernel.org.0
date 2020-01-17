Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB5D01406E5
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 10:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbgAQJvI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 04:51:08 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45990 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728665AbgAQJvH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 04:51:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id 203so17850465lfa.12
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2020 01:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOGLP6AWOMLlV4S3qaDIBVzYJbO+NNBdA32XJy5Uyqk=;
        b=FWcaoAzKxOABlFoTkRxi5qyPRdMoy4rqmMZXW83aBQ1divomZgQrbDYvpWvXKeyfFK
         ay9QlQLTeGRbLpo8Zd4j6PXWg5OBhTstuk5dMYLfaOZ4M/bJyzNPF+zrqSkEjio+BehY
         tNiKdrlbBmIXWNrKrTb4K5rKuwi6xDSG8RXU40ytYUpQY5zWOPD2BizkvZ9iVUtR1oiV
         7FGZKLxgMo+Ad4NB/D0ziN/tQvW7hhWaNC1XpxOmkUTw6q00k4LtHhgC9oF+cqW+MzPe
         vB3hpofasd9xaWOzG8j0JHUXnWr1hnaGSs3n3vBEPU1IbwjOlthK4LGdy3JHnD9mIPOf
         PYnQ==
X-Gm-Message-State: APjAAAXulI/fNp/uWQyuI6AKOsBmWaWQWutsZDhNRRi5e+7CkoI6H9KU
        FD7fxfNqKX8jNdh8ab9NSws=
X-Google-Smtp-Source: APXvYqwSCVC66UOlYY2cX/5q1z2fRg+96T2SQ9ADDzyK/XeDBmr0dChZRsD39RaG8+taxTWqzVBbUw==
X-Received: by 2002:a05:6512:cf:: with SMTP id c15mr4949180lfp.57.1579254665826;
        Fri, 17 Jan 2020 01:51:05 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id v9sm13655554lfe.18.2020.01.17.01.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 01:51:04 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1isOHQ-0007D9-5L; Fri, 17 Jan 2020 10:51:04 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/5] USB: serial: handle unbound ports
Date:   Fri, 17 Jan 2020 10:50:21 +0100
Message-Id: <20200117095026.27655-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drivers must make sure that a port is bound to a driver before accessing
port data in non-port callbacks.

Note that this is needed even with the port-driver bind attributes
removed as an individual port may have failed to probe.

Johan


Johan Hovold (5):
  USB: ch341: handle unbound port at reset_resume
  USB: serial: io_edgeport: handle unbound ports on URB completion
  USB: serial: io_edgeport: add missing active-port sanity check
  USB: serial: keyspan: handle unbound ports
  USB: serial: quatech2: handle unbound ports

 drivers/usb/serial/ch341.c       |  6 +++++-
 drivers/usb/serial/io_edgeport.c | 16 +++++++++-------
 drivers/usb/serial/keyspan.c     |  4 ++++
 drivers/usb/serial/quatech2.c    | 20 ++++++++++++++++++++
 4 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.24.1

